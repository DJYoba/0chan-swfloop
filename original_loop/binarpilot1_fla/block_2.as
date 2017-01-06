package binarpilot1_fla
{
    import flash.display.*;
    import flash.events.*;

    dynamic public class block_2 extends MovieClip
    {
        public var init:Object;
        public var go:SimpleButton;

        public function block_2()
        {
            addFrameScript(0, this.frame1);
            return;
        }// end function

        public function go_click(event:MouseEvent)
        {
            navigateToURL(new URLRequest("http://0chan.eu"), "_parent");
            return;
        }// end function

        function frame1()
        {
            if (this.init == false || this.init == undefined)
            {
                this.go.addEventListener(MouseEvent.MOUSE_OVER, this.go_play);
                this.go.addEventListener(MouseEvent.CLICK, this.go_click);
                this.init = true;
            }
            stop();
            return;
        }// end function

        public function go_play(event:MouseEvent)
        {
            play();
            return;
        }// end function

    }
}
