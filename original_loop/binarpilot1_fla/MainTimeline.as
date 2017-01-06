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
            addFrameScript(0, this.frame1);
            return;
        }// end function

        function frame1()
        {
            var _loc_1:* = undefined;
            if (this.init == false || this.init == undefined)
            {
                this.stage.scaleMode = StageScaleMode.NO_SCALE;
                this.stage.quality = StageQuality.MEDIUM;
                this.snd = new loopWav();
                this.snd.play(0, 9999999999, new SoundTransform(1, 0));
                this.init = true;
                this.hue = 0;
                this.hmax = 0;
                this.hred = 219;
                this.hgreen = 205;
                this.hblue = 101;
                this.hspeed = 0.05;
                this.hphase = 1;
            }
            this.ba = new ByteArray();
            SoundMixer.computeSpectrum(this.ba, true, 0);
            this.drawSpectrum();
            this.ba.position = 0;
            this.i = this.numChildren - 1;
            while (this.i > 0)
            {
                
                this.val = Math.abs(this.ba.readFloat());
                this.ba.position = this.ba.position + 256;
                this.val = this.val + Math.abs(this.ba.readFloat());
                this.ba.position = this.ba.position - 256;
                this.val = this.val * 10;
                if (this.val > 0.3)
                {
                    this.box = this.getChildAt(this.i) as MovieClip;
                    this.togo = 15 - Math.ceil(14 * this.val);
                    if (this.togo < 1)
                    {
                        this.togo = 1;
                    }
                    this.box.gotoAndPlay(this.togo);
                }
                _loc_1 = this.i - 1;
                this.i = _loc_1;
            }
            return;
        }// end function

        public function drawSpectrum()
        {
            var _loc_1:* = new ByteArray();
            SoundMixer.computeSpectrum(_loc_1, false, 2);
            var _loc_2:* = this.sp.graphics;
            _loc_2.clear();
            _loc_2.beginGradientFill(GradientType.LINEAR, [52224, 43520, 43520, 52224], [0.5, 0.3, 0.3, 0.5], [0, 20, 235, 255]);
            var _loc_3:* = 0;
            while (_loc_3 < 256)
            {
                
                _loc_2.drawRect((_loc_3 - 128) * 2, 20, 1, -20 - Math.abs(_loc_1.readFloat()) * 200);
                _loc_3 = _loc_3 + 1;
            }
            _loc_2.endFill();
            return;
        }// end function

    }
}
