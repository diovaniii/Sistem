<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WebUserControl1.ascx.cs" Inherits="ViagemWeb.Form.WebUserControl1" %>

<style type="text/css">
    @import url('https://fonts.googleapis.com/css?family=Varela+Round');


/*body {
    font-family: 'Varela Round', sans-serif;
    color: #35a7ff;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
}*/
.bus {
    float: right;
}
figure {
    width: 25%;
    margin: 0;
}

.road {
    fill: #cfdbd5;
}

.shadow {
    fill: #303133;
    opacity: 0.63;
}

.cloudWrapper {
    fill: #c9d9f2;
}

.mainBody {
    fill: #ff0000;
}

.wheelCap, .window {
    fill: #38618c;
}

.shine {
    fill: #799dff;
}

.windowPane {
    fill: none;
}

.cls-10, .windowPane, .door {
    stroke: #b2c8f9;
    stroke-width: 10px;
}

.cls-12, .cls-7, .door {
    stroke-miterlimit: 10;
}

.lightGrey {
    fill: #b2c8f9;
}

.cls-10 {
    fill: #ffe74c;
    stroke-linejoin: round;
}

.cls-11 {
    fill: #2a2d34;
}

.cls-12 {
    stroke: #a6bce2;
    stroke-linecap: round;
    stroke-width: 5px;
}

.cls-13 {
    fill: #edf2f9;
    opacity: 0.4;
}

.wind, .clouds {
    transform: translateX(100em);
}

.wheelWrapper {
    transform-box: fill-box;
    transform-origin: center;
    animation: spin 1s infinite linear;
}

@keyframes spin {
    0% {
        -webkit-transform: rotate(0deg);
        -moz-transform: rotate(0deg);
        -ms-transform: rotate(0deg);
        -o-transform: rotate(0deg);
        transform: rotate(0deg);
    }

    100% {
        /* 		transform-origin: center; */
        -webkit-transform: rotate(360deg);
        -moz-transform: rotate(360deg);
        -ms-transform: rotate(360deg);
        -o-transform: rotate(360deg);
        transform: rotate(360deg);
    }
}

.wind {
    animation: 7s moveClouds infinite;
    -webkit-animation-name: moveClouds;
    -webkit-animation-duration: 7s;
}

.BusBod {
    animation: 2s bumpBus infinite;
    -webkit-animation-name: bumpBus;
    -webkit-animation-duration: 2s;
}

.clouds {
    fill: #c9d9f2;
    animation: moveClouds 5s linear infinite;
    -webkit-animation-timing-function: linear;
    -webkit-animation-name: moveClouds;
    -webkit-animation-duration: 7s;
}

@keyframes moveClouds {
    100% {
        transform: translateX(-350em);
    }
}

@keyframes bumpBus {
    50% {
        transform: translateY(-5px);
    }

    100% {
        transform: translateY(0px);
    }
}

@keyframes wobble {
    0% {
        transform: rotate(20deg);
    }

    50% {
        transform: rotate(-20deg);
    }

    100% {
    }
}
</style>

<figure>
<svg class="svgWrapper" viewBox="0 0 1590.34 692">
	<title>bus</title>
	<g class="groundWrapper">
		<rect class="road" x="43.35" y="462.46" width="1504.26" height="179.35" rx="16.59" ry="16.59"/>
		<rect class="shadow" x="195.82" y="475.93" width="1035.97" height="114.15" rx="57.07" ry="57.07"/>
	</g>
	<g class="clouds" class="cloudWrapper">
		<path class="cls-1" d="M3240.23,153a30.17,30.17,0,0,0,.48-5h0c0-15-10.7-25.91-25.7-25.91h0a25.91,25.91,0,0,0-24,17.08,25.44,25.44,0,0,0-25.38-22.18h-15.42a32.47,32.47,0,0,0,.81-6h0c0-14.09-12-25.63-26-25.63h0a25.81,25.81,0,0,0-25.56,25.67h.06a24.26,24.26,0,0,0,.66,5.54,25.92,25.92,0,0,0-23.63,25.46h0a27.53,27.53,0,0,0,.85,6.69A25.78,25.78,0,0,0,3053,174.41v-.18a26,26,0,0,0,25.69,25.85H3226.3a26,26,0,0,0,25.7-25.85v.09A25.3,25.3,0,0,0,3240.23,153Z"/>
<path class="cls-1" d="M2628.3,285.92v0Z"/>
<path class="cls-1" d="M2561.7,286s0-.05,0-.08,0-.07,0-.11Z"/>
<path class="cls-1" d="M2458.35,350.22h0Z"/>
<path class="cls-1" d="M2730.12,286s0-.05,0-.08,0-.07,0-.11Z"/>
<path class="cls-1" d="M2817.33,327.4a24.51,24.51,0,0,0,1.82-8.32h0a24.82,24.82,0,0,0-24-24.46,25.49,25.49,0,0,0,1.56-9,24.49,24.49,0,0,0-24.39-24.55h-17.79a24.52,24.52,0,0,0-24.42,24.49c0,3.05.46,6.51,1.5,8.51H2701.4c-13.51,0-25.4,11.49-25.4,25v.16c0,2.19,1.13,3.84,1.67,6.84h-26c-.62,0-1.23-.41-1.84-.36a27.39,27.39,0,0,0,.9-6.64h0a24.82,24.82,0,0,0-24-24.46,25.49,25.49,0,0,0,1.56-9,24.49,24.49,0,0,0-24.39-24.55h-17.79a24.52,24.52,0,0,0-24.42,24.49c0,3.05.46,6.51,1.5,8.51H2533a25.38,25.38,0,0,0-25,25v.16c0,2.19.72,3.84,1.26,6.84h-26c-13.5,0-24.9,11-24.9,24.47s11.4,24.53,24.9,24.53h156.61a24.25,24.25,0,0,0,5.88-.72,24.68,24.68,0,0,0,5.92.72h156.61c13.51,0,23.71-11.42,23.71-24.93h0A24.4,24.4,0,0,0,2817.33,327.4Z"/>
<path class="cls-1" d="M2796.72,285.92v0Z"/>
<path class="cls-1" d="M5497,356.08h-10.41a34.81,34.81,0,0,0,1.37-8.28V348c0-17.65-14.71-31.9-32.36-31.9h-17.19a31.88,31.88,0,0,0-32.08-32h-23.23a31.88,31.88,0,0,0-32.08,32h-17.19A31.83,31.83,0,0,0,5302,348v-.08a32.85,32.85,0,0,0,.87,8.19h-10.41c-17.65,0-32.46,14.43-32.46,32.07v-.08c0,17.65,14.81,32,32.46,32H5497a32,32,0,0,0,32-32v0A32,32,0,0,0,5497,356.08Z"/>
<path class="cls-1" d="M4358.38,296.61a34.13,34.13,0,0,0,1.92-10.53h0a32.05,32.05,0,0,0-31.37-32.3,33,33,0,0,0,2-11.71v0a32,32,0,0,0-31.86-32h-23.23a32,32,0,0,0-31.91,32v-.25a28.42,28.42,0,0,0,2,11.21h-39.47c-17.65,0-32.48,14.66-32.48,32.31v.21c0,2.86.79,5.48,1.49,8.48h-34c-17.65,0-32.53,14.34-32.53,32v0c0,17.65,14.89,32.05,32.53,32.05h204.58A32,32,0,0,0,4378,326h0A31.79,31.79,0,0,0,4358.38,296.61Z"/>
<path class="cls-1" d="M126.39,330.08H101.55a19.88,19.88,0,0,0-19.64,20H67a26.12,26.12,0,0,0,3-11.9v.14a23.23,23.23,0,0,0-23-23.24H23.08A23.29,23.29,0,0,0,0,338.34v-.09a22.91,22.91,0,0,0,23.08,22.83h3.86c-1.11,3-1.94,5.4-1.94,8.27v-.09a20,20,0,0,0,19.84,19.82H81.91c10.8,0,20.09-9.08,20.09-19.88v-.12h24.39A19.48,19.48,0,0,0,146,349.66h0A19.63,19.63,0,0,0,126.39,330.08Z"/>
<path class="cls-1" d="M1512,356.08h-10.41a34.81,34.81,0,0,0,1.37-8.28V348c0-17.65-14.71-31.9-32.36-31.9h-17.19a31.88,31.88,0,0,0-32.08-32h-23.23a31.88,31.88,0,0,0-32.08,32h-17.19A31.83,31.83,0,0,0,1317,348v-.08a32.85,32.85,0,0,0,.87,8.19h-10.41c-17.65,0-32.46,14.43-32.46,32.07v-.08c0,17.65,14.81,32,32.46,32H1512a32,32,0,0,0,32-32v0A32,32,0,0,0,1512,356.08Z"/>
<path class="cls-1" d="M508.38,157.61a34.13,34.13,0,0,0,1.92-10.53h0A32.05,32.05,0,0,0,479,114.78a33,33,0,0,0,2-11.71v0a32,32,0,0,0-31.86-32H425.91a32,32,0,0,0-31.91,32v-.25a28.42,28.42,0,0,0,2,11.21H356.48c-17.65,0-32.48,14.66-32.48,32.31v.21c0,2.86.79,5.48,1.49,8.48h-34c-17.65,0-32.53,14.34-32.53,32v0c0,17.65,14.89,32.05,32.53,32.05H496.11A32,32,0,0,0,528,187h0A31.79,31.79,0,0,0,508.38,157.61Z"/>
	</g>
	<g class="BusBod">
		<path class="mainBody" d="M1185.22,229H372.93c-14.46,0-27.18,10.72-27.18,25.18V505.82c0,14.46,12.72,27.18,27.18,27.18H1288.2c23.18,0,41.54-20.21,41.54-43.39V416.66C1329.74,348,1223,229,1185.22,229Z"/>
		<path class="wheelCap" d="M581.82,532.51c0-.17,0-.34,0-.51a69.54,69.54,0,0,0-139.08,0c0,.17,0,.34,0,.51Z"/>
		<path class="wheelCap" d="M1191.19,532.51c0-.17,0-.34,0-.51a69.54,69.54,0,0,0-139.08,0c0,.17,0,.34,0,.51Z"/>
		<rect class="window" x="482.68" y="268.91" width="132.46" height="132.46" rx="12" ry="12"/>
		<path class="shine" d="M613.74,304.82c0,46.41-8.53,94.18-67,98.18h64.32l2.68-11.41Z"/>
		<rect class="windowPane" x="482.93" y="268.91" width="132.46" height="132.46" rx="12" ry="12"/>
		<rect class="window" x="668.33" y="268.91" width="132.46" height="132.46" rx="12" ry="12"/>
		<polygon class="shine" points="776.6 268.75 668.35 372.71 670.01 398.13 692.65 402.98 798.74 296.77 798.74 270 776.6 268.75"/>
		<polygon class="shine" points="743.04 398.63 799.75 341.92 801.05 350.54 747.8 403.79 743.04 398.63"/>
		<polygon class="shine" points="666.04 321.63 722.75 264.92 724.05 273.54 670.8 326.79 666.04 321.63"/>
		<rect class="windowPane" x="668.58" y="268.91" width="132.46" height="132.46" rx="12" ry="12"/>
		<rect class="window" x="1013.29" y="268.91" width="132.46" height="132.46" rx="12" ry="12" transform="translate(2159.04 670.28) rotate(-180)"/>
		<path class="shine" d="M1018.91,396.6s53.5-1.46,87.55-29.67,36-82.2,36-82.2l2.6,111.87-123.22,6.34Z"/>
		<rect class="windowPane" x="1013.04" y="268.91" width="132.46" height="132.46" rx="12" ry="12" transform="translate(2158.54 670.28) rotate(-180)"/>
		<rect class="window" x="346.82" y="269.91" width="82.79" height="132.46" rx="12" ry="12" transform="translate(776.43 672.28) rotate(-180)"/>
		<polygon class="shine" points="362.26 269.75 429.76 373.71 428.64 399.13 414.78 403.98 348.74 297.77 348.74 271 362.26 269.75"/>
		<polygon class="shine" points="382.92 399.63 347.47 342.92 346.66 351.54 379.94 404.79 382.92 399.63"/>
		<polygon class="shine" points="431.05 322.63 395.6 265.92 394.79 274.54 428.07 327.79 431.05 322.63"/>
		<rect class="windowPane" x="346.66" y="269.91" width="82.79" height="132.46" rx="12" ry="12" transform="translate(776.11 672.28) rotate(-180)"/>
		<rect class="window door" x="835.62" y="296.91" width="93.76" height="212.06" rx="12" ry="12"/>
		<rect class="window door" x="907.37" y="296.91" width="75.41" height="212.06" rx="12" ry="12"/>
		<path class="window" d="M1198.7,412a17,17,0,0,1-17-17V237.57a5,5,0,0,1,6.54-4.76c20.53,6.67,51,32.26,79.46,66.79,30.75,37.29,51.92,76.07,58.08,106.4a5,5,0,0,1-4.9,6Z"/>
		<path class="lightGrey" d="M1186.74,237.78c40,13,121,104.22,134.18,169.22H1198.7a12,12,0,0,1-12-12V238m0-10.43a10,10,0,0,0-10,10V395a22,22,0,0,0,22,22h122.22a10,10,0,0,0,9.8-12c-6.31-31.11-27.86-70.69-59.12-108.59-22.77-27.6-56.2-60.06-81.77-68.36a10,10,0,0,0-3.09-.49Z"/>
		<path class="cls-10" d="M1329.84,488.37H1306a12,12,0,0,1-12-12V452.52a12,12,0,0,1,12-12h23.85"/>
	</g>
	<g class="wheelWrapper">
		<circle class="cls-11" cx="512.29" cy="532.51" r="53.56"/><circle class="shine" cx="512.29" cy="532.36" r="37.87"/>
		<g class="wheelLines">
			<line class="windowPane" x1="512.47" y1="497.72" x2="512.47" y2="566.96"/>
			<line class="windowPane" x1="546.91" y1="532.51" x2="477.67" y2="532.51"/>
			<line class="windowPane" x1="536.77" y1="556.99" x2="487.81" y2="508.02"/>
		</g>
		<circle class="lightGrey" cx="512.29" cy="532.36" r="23.39"/>
	</g>
	<g class="wheelWrapper">
	<circle class="cls-11" cx="1121.66" cy="532.51" r="53.56"/>
		<circle class="shine" cx="1121.66" cy="532.36" r="37.87"/>
		<line class="windowPane" x1="1121.84" y1="497.72" x2="1121.84" y2="566.96"/>
		<line class="windowPane" x1="1156.28" y1="532.51" x2="1087.04" y2="532.51"/>
		<line class="windowPane" x1="1146.14" y1="556.99" x2="1097.18" y2="508.02"/>
		<circle class="lightGrey" cx="1121.66" cy="532.36" r="23.39"/>
	</g>
	<g class="wind">
	<rect class="cls-13" x="449.27" y="370.91" width="89.83" height="19.18" rx="9.59" ry="9.59"/>
	<rect class="cls-13" y="457.79" width="89.83" height="19.18" rx="9.59" ry="9.59"/>
<!-- 	<rect class="cls-1" x="754.2" y="353.5" width="113.22" height="11.64" rx="5.82" ry="5.82"/> -->
	<rect class="cls-13" x="3985.64" y="456.92" width="113.22" height="11.64" rx="5.82" ry="5.82"/>
	<rect class="cls-13" x="5098.86" y="245.85" width="251.99" height="36.38" rx="18.19" ry="18.19"/>
	<rect class="cls-13" x="3039.53" y="304.06" width="179.67" height="30.43" rx="15.22" ry="15.22"/>
	<rect class="cls-13" x="3878.72" y="458.85" width="251.99" height="36.38" rx="18.19" ry="18.19"/>
	<rect class="cls-13" x="1655.94" y="237.04" width="306.84" height="39.97" rx="19.98" ry="19.98"/>
	<rect class="cls-13" x="2234.49" y="405.85" width="251.99" height="36.38" rx="18.19" ry="18.19"/>
		<rect class="cls-13" x="4252.26" y="250.54" width="179.67" height="39.97" rx="19.98" ry="19.98"/>
		<rect class="cls-13" x="5234.49" y="405.85" width="251.99" height="29.38" rx="18.19" ry="18.19"/>
	</g>
</svg>
</figure>

<h3>Eliane viagens e turismo</h3>