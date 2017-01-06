package binarpilot1_fla
{
    import flash.display.*;
    import flash.media.*;
    import flash.utils.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var hblue:Object;
        public var box:MovieClip;
        public var init:Object;
        public var hphase:Object;
        public var hue:Object;
        public var hgreen:Object;
        public var sp:MovieClip;
        public var hspeed:Object;
        public var val:Number;
        public var togo:int;
        public var snd:Sound;
        public var hred:Object;
        public var i:int;
        public var hmax:Object;
        public var ba:ByteArray;

        public function MainTimeline()
        {
            addFrameScript(0, frame1);
            return;
        }// end function

        function frame1()
        {
            if (init == false || init == undefined)
            {
                this.stage.scaleMode = StageScaleMode.NO_SCALE;
                this.stage.quality = StageQuality.MEDIUM;
                snd = new loopWav();
                snd.play(0, 9999999999, new SoundTransform(1, 0));
                init = true;
                hue = 0;
                hmax = 2;
                hred = hmax;
                hgreen = 0;
                hblue = 0;
                hspeed = 0.05;
                hphase = 1;
            }
            ba = new ByteArray();
            SoundMixer.computeSpectrum(ba, true, 0);
            drawSpectrum();
            ba.position = 0;
            i = this.numChildren - 1;
            while (i > 0)
            {
                
                val = Math.abs(ba.readFloat());
                ba.position = ba.position + 256;
                val = val + Math.abs(ba.readFloat());
                ba.position = ba.position - 256;
                val = val * 10;
                if (val > 0.3)
                {
                    box = this.getChildAt(i) as MovieClip;
                    togo = 15 - Math.ceil(14 * val);
                    if (togo < 1)
                    {
                        togo = 1;
                    }
                    box.gotoAndPlay(togo);
                }
                var _loc_2:* = i - 1;
                i = _loc_2;
            }
            return;
        }// end function

        public function drawSpectrum()
        {
            var _loc_1:* = new ByteArray();
            SoundMixer.computeSpectrum(_loc_1, false, 2);
            var _loc_2:* = sp.graphics;
            _loc_2.clear();
            _loc_2.beginGradientFill(GradientType.LINEAR, [0x6699ff, 0x6699ff, 0x6699ff, 0x6699ff], [0.5, 0.3, 0.3, 0.5], [0, 20, 235, 255]);
            var _loc_3:* = 0;
            while (_loc_3 < 256)
            {
                
                _loc_2.drawRect((_loc_3 - 128) * 2, 20, 1, -20 - Math.abs(_loc_1.readFloat()) * 200);
                _loc_3++;
            }
            _loc_2.endFill();
            return;
        }// end function

    }
}
