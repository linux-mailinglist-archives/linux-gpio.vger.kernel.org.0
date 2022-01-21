Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE087495C7B
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Jan 2022 10:03:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349019AbiAUJDr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Jan 2022 04:03:47 -0500
Received: from mail-vi1eur05on2040.outbound.protection.outlook.com ([40.107.21.40]:48749
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S240373AbiAUJDq (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 21 Jan 2022 04:03:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oGiChflygIS5cOFJ3yi2ipXR2uzs+4jwq7TUDYvAnCjBKWxjGJeTDzZ5nl+YIFZnz4HMtwlYIATNhRsgf4tvVpd0CYiuyUsEr/lO8zdwQdbA9+6Lfpm1zG7iAo/kBpUCoT508y75HS2kroYWIt6VqXGbaW0T3XItXb0ehKs7WCR1IRQNLvev31ciS97V7mnMQVY9ZjPbxNRILp7+bf89GLS3VMEJRFWTElvmEO4ndFfMf/qI+7gQznSoSNm7Y+opSOMPRjhK3qwDUGipSxOcFtfp3OVJUOOJZQBo4Sggl2LwxmmeWkjHzsjwcG9Ieak8thOyi5BzrxpPCcBTnyksaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vP/OjrVa5qBT1Xy9Qy4WYlmLuFjm7nDoITO352/0zkU=;
 b=b3RmZRJD4ep+xYjqGnDVnKdWFhLLvGivmyzL7v8lzEd91iJt1AV0/1nAA98Wtfqp3snsGdkYWtFCfNBMjld1Att+V8tawzKMgylQZS4oWJ0TFhYzhX/mfdg602jJjRyI9JpfQPbYRv+2f27R6qG2tVzKH58U4+z4Sl1cAoi7XX298l5IjEsDNsbehC3SPSZN0TDlHvs30BO3kVQrW4RZPW36Y3dVK/G4RQMy1/xBTwO599c+BGg6RR/hfBLIWY1+Od7e+GlcSnvP692emazxkuJvqUQ4iaREWGfhFRZkrAmnzUlRXQpkvZ4bL6dhOg8M2utgDl/FRGc7mRwLrxmNLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dpnorge.onmicrosoft.com; s=selector2-dpnorge-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vP/OjrVa5qBT1Xy9Qy4WYlmLuFjm7nDoITO352/0zkU=;
 b=N0arWkLv3dY7MlPw6KKqN3tLuMD5aK5tAcd4zn6go28UBgkNS6Ha+B6DWcLJ5ZIwH48IRqneg+p9Z2ieUCDePF34flPXj52E5lm82ppYPbEFkzRmwYe5QD5B91L/DrhKOkL13q4/ppom+FUtGhZvPOrZnJ4jUhTOPN+1VXC9rn0=
Received: from HE1PR04MB3100.eurprd04.prod.outlook.com (2603:10a6:7:21::21) by
 PA4PR04MB7967.eurprd04.prod.outlook.com (2603:10a6:102:b8::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4909.7; Fri, 21 Jan 2022 09:03:43 +0000
Received: from HE1PR04MB3100.eurprd04.prod.outlook.com
 ([fe80::4949:5038:5888:d0ff]) by HE1PR04MB3100.eurprd04.prod.outlook.com
 ([fe80::4949:5038:5888:d0ff%5]) with mapi id 15.20.4909.012; Fri, 21 Jan 2022
 09:03:43 +0000
From:   Markus Mirevik <markus.mirevik@dpsolutions.se>
To:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: GPIO level IRQ fires twice each time. 
Thread-Topic: GPIO level IRQ fires twice each time. 
Thread-Index: AdgOpXxQdH2ZPD1iRWSLqE0uLueYFg==
Date:   Fri, 21 Jan 2022 09:03:43 +0000
Message-ID: <HE1PR04MB3100579720F6EBBD634C99EEE65B9@HE1PR04MB3100.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=dpsolutions.se;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6e924b10-57cd-4e3f-4be9-08d9dcbcece6
x-ms-traffictypediagnostic: PA4PR04MB7967:EE_
x-microsoft-antispam-prvs: <PA4PR04MB79671223721BA0674375117DE65B9@PA4PR04MB7967.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OI7t0rzQS8ni0G0m2OZsJXcmy8dPlPOHop/wyZqj7XWApjQ9oJJgbOoA6DVft85TOKUN+qG65qIKErukyCD3cOJKyRpi57M5u805lmSPRmv5qwcyPnVqXxt87QdodQOFsZLRRTjWYmg+PEmY2sxT4cXr31ItR7+eL0Z49Ci2VLivVszTzekNjrc4nq5wcCTdB1/V0OvDIFHwPB6KFHlRSpj7hk6db2L6uKYY24CRdVvjHw+E1GWNt2uARWUzSptbgz00VCJ0evJrY0R8nhO6FgHxFWl5sq0BZyxoZ48ZYFACmbaKOPyf8fEa+kc+pW9CFrlTAUm+IFNDebWNhvqLez34oD1twGDqvF3hATHoMRGcWdi9vMzN9vNYANyyYU4gWSFN+tGEDTEv52/7yiQSeIPCuqzmybD51Z614+miGhALnFoZbuSqHF0iU5bzAhzfLYFhIKvdMuCL6oO6aK4qP+LyjqAQlgFLwXLdRelRvQ4BQ9kWvWQYSNpmjqAJjG4KgO18Ij6BZ2c+uUzIpxMYnE2iyoBFidWIm0B+arn2YpuVJv1vzIc+H25Tx7FLsHLasHHvtJLYS3g7hCBGYJ6iHbVXNTzCdmyaQb+ysPTJelXlKHAw/J92zNQ7EP2BNvDFFcxZIoMO9zzWhreMKEdFTkfEwgezph//otDkT0YTDeYKcFGn3Oc+RCsKHUoqzdKw+DXoytCqkLXCDBvX97Xc5A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR04MB3100.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39840400004)(366004)(396003)(376002)(346002)(7696005)(508600001)(52536014)(5660300002)(71200400001)(86362001)(44832011)(55016003)(6506007)(83380400001)(316002)(186003)(26005)(8676002)(9686003)(38070700005)(33656002)(66476007)(2906002)(76116006)(66446008)(66556008)(4743002)(6916009)(64756008)(8936002)(66946007)(38100700002)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JjmuJLa2VODHn4594y3PGBUVxq5bEW/63yNHvfpWb1XQo3PvGEi1XdKziiRL?=
 =?us-ascii?Q?gdWbaQFQGjrHqBwdbX9SRfYH8xXbhCsUirwFAdkjBnLsgPYhY6p8WF9S3tBz?=
 =?us-ascii?Q?PhTyxzrzuaisMhX7Bd517Wcv/QPsMig87xYfnJcVoKIeVqoLIe+E8AHamsPm?=
 =?us-ascii?Q?9MflvWz1iXN2lFseR4vOxzBb2InF0kQOBz4PSt6mjZbbIjdRddl2FpiRlg3z?=
 =?us-ascii?Q?cofyJCgBt9CsqWLKFUAEpqj28VJQnT0Y+1SwQ8DTlgYqBm/AcLtyU7emnwPI?=
 =?us-ascii?Q?YWHLY74FBwGB8yfgSHg0dalATFYlcW/ANCriCoRkdsqAghSyhnO3H8q9xyE5?=
 =?us-ascii?Q?2sbeKtUmpQ8S4mwJHiYviGeOAtrDRajSWdzn+ApzDu972cUhZv0wfVvWvUUR?=
 =?us-ascii?Q?h+Job32wZJrlIKXljc8EaaKkG4OtPPLumYMZShqH6grCoSeICCjX47RXCyy7?=
 =?us-ascii?Q?QrP/YiYXq5dHS+UP5L6S6jNKt7OUhVbbOBgRV1vYXUTmH/Gtqy9q1ClpnMJu?=
 =?us-ascii?Q?FktTevrj4zDqmHZycu1Izp853Ffu7xzYC/leArIYeqHAYdGCcjsbplMSjP3S?=
 =?us-ascii?Q?bwBnB8jL30vUqjjlPtDNNLsBwmFPOhsETv/V0O6RrPNFBydMi6rFN7g6M/3n?=
 =?us-ascii?Q?LLgt5bI2EMDFJq92EbFLRgdDy1CpsRvoleOv7tdtx9o5CTphu2c/+NouCMCo?=
 =?us-ascii?Q?b/CYUTEPCMzOa5kfg59+Kvwy5qDNZ79b0mOqr9KL+mCI4jbXcaJtKK0Zphqv?=
 =?us-ascii?Q?FJIA5not9tchLBBIuK8TPLf+hjfpeJg2cPPMCCOslnwTouHuYFwP4UJr4b9r?=
 =?us-ascii?Q?mL9ElopFnNQ9dhadJM1oT3+LPjHUttnx14POLKLt6r8YLbytauJoMXJEMGo/?=
 =?us-ascii?Q?31d7W/bvVqUMBM6ZuBR/PDbni9r/mdcO3bBMX2yqP3jAFo8QtwXyxaGIF+k0?=
 =?us-ascii?Q?VxAOyuBBDqNeXuQ7osUhc+yYAXyxbYORddQ/NmHBk1MHiWK1awN1x2CLSP2M?=
 =?us-ascii?Q?TUOn7pbt+ptzHg8f/PDDM5YOM4mQQ+Al1GN4+JU4S61TxGBUpFkxTi6U3kyN?=
 =?us-ascii?Q?RWnMqFtZyAmskNu568DDMccyAH/mLwdObJogwtAyv8bduuA11at2PUYbGDxu?=
 =?us-ascii?Q?f76LtqGD3aFsPBX9s3Of4dI74MmIzNz9LlfAjcnPq8cySNbDPRwFP9sahcBn?=
 =?us-ascii?Q?3sFI1hJV22YcDkuJsDSL1sq3VeB7mxwOkx+TzoMt23dQG0xkBpr9MSPforRR?=
 =?us-ascii?Q?kpXl/d0pyaYCBkC1Ke/sufd27Ja6RLqhIWAcLjj1T/wW5xc2wlsDrfadI2St?=
 =?us-ascii?Q?xUvGMZPEX5LNj6ATtQb4vJKGJlbQBFS97vn15oDJu3Z0/gdLZrSLC4w1ff9d?=
 =?us-ascii?Q?cDw68m/jOXwfDvFV47YIBb8w3c254qZsJS6u2nArwZiPdqJ88QOEV+KDCYFo?=
 =?us-ascii?Q?FFK29HfS4M/VSrdRiBbD3yRFgfyWkyrdLpcl/EpVTJHftQ7ZEAr1mw00qbhs?=
 =?us-ascii?Q?CufrKDScmGy2mdp1yvzQ/OEv8esOaT8GdTE/1rclj+YuyOEotriIBRGKi2/C?=
 =?us-ascii?Q?+J+5Ocjpoy7I2fe02hV4+R15tT3JkGxDFQiLIoNAfBHax3LNjm18I9mQUeWt?=
 =?us-ascii?Q?upRdkiHWdQ0PR8IDfUJs79aNNROzZLuc0f5VrZQQALrtHuF3rzhUAhgYJrWP?=
 =?us-ascii?Q?2EmKTg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: dpsolutions.se
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR04MB3100.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e924b10-57cd-4e3f-4be9-08d9dcbcece6
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2022 09:03:43.3457
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3a2c5ea5-12ca-4b9d-9883-156f72a0a4ae
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JZSNvbspU1Ds322X35JW9rTHXQxa+VTHUW6JdSreMagFKyJ2hNB0foOrbDY1r0CVgDzEzsEwBwCSO4B7gx94H3rUYZT6sguo5kn0UyxoQts=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7967
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

I have a problem with a custom bord based on SoC am335x and a driver utiliz=
ing a GPIO line for interrupts.=20

I have two mcp2518fd chip connected on one SPI line and everything works, b=
ut it's hogs a lot of CPU.
In the current setup only one chip is connected and it only receives packet=
s.

The mcp2518fd is connected with 2 interrupt lines one "main" and one for rx=
 frames.=20

The problem is that for every frame received the interrupt handler is run t=
wice, which is kind of expensive since it's a SPI call to the chip to check=
 interrupt registers.=20

To me it looks like the interrupt is fired again as soon as it's unmasked. =
Either because it's queued? or maybe not cleared internally?
I have scoped the interrupt signal and its real good without any glitches.=
=20

I'm currently running a yocto build:
Linux botekcc 5.10.79-yocto-tiny #1 SMP Tue Nov 16 03:57:43 UTC 2021 armv7l=
 armv7l armv7l GNU/Linux=20

But the mcp251xfd driver is from net-next/master

mcp251xfd_irq is the irqhandler for the mcp2518fd and is added like this:
err =3D request_threaded_irq(spi->irq, NULL, mcp251xfd_irq,
                                   IRQF_SHARED | IRQF_ONESHOT,
                                   dev_name(&spi->dev), priv);

I have instrumented some of the handling in /kernel/irq/chip.c and /kernel/=
irq/handle.c=20
And this maybe doesn't say anything but it looks like this:

[  290.229920] IRQ:19 mask_irq
[  290.233098] IRQ:19 Enter. Caller is handle_level_irq+0xe4/0x1dc
[  290.241851] IRQ:64 mask_irq
[  290.245014] IRQ:64 Enter. Caller is handle_level_irq+0xe4/0x1dc
[  290.253777] IRQ:64 Leave
[  290.253784] IRQ:19 Leave
[  290.258868] IRQ:19 unmask_irq
[  290.262785] Enter mcp251xfd_irq

-First enter. Here the interrupt is handled and the interruptline goes inac=
tive.=20
-We do not return until rx-int is inactive. AND rx-int and int goes inactiv=
e simultaneous. (when only receiving.)
-I've also tried a msleep(1000) here to make sure there is enough time for =
the int to go inactive.=20

[  290.265966] Leave mcp251xfd_irq (RX)
[  290.269167] IRQ:64 unmask_irq
[  290.275740] IRQ:19 mask_irq
[  290.278900] IRQ:19 Enter. Caller is handle_level_irq+0xe4/0x1dc
[  290.287648] IRQ:64 mask_irq
[  290.290806] IRQ:64 Enter. Caller is handle_level_irq+0xe4/0x1dc
[  290.299547] IRQ:64 Leave
[  290.299552] IRQ:19 Leave
[  290.304633] IRQ:19 unmask_irq
[  290.308503] Enter mcp251xfd_irq

-This time rx-int is low and the SPI read of the interrupt registers show n=
o int is pending.

[  290.311515] Leave mcp251xfd_irq (Normal)
[  290.314669] IRQ:64 unmask_irq




cat /proc/interrupts shows this after receiving one frame:

16:      10389      INTC  68 Level     clockevent
 17:          0      INTC   3 Level     arm-pmu
 19:          2      INTC  96 Level     44e07000.gpio
 20:        510      INTC  72 Level     44e09000.serial
 21:       3239      INTC  70 Level     44e0b000.i2c
 24:          0      INTC  75 Level     rtc0
 25:          0      INTC  76 Level     rtc0
 28:          0      INTC  71 Level     4802a000.i2c
 34:          0      INTC  98 Level     4804c000.gpio
 35:       2692      INTC  64 Level     mmc0
 37:          0      INTC 125 Level     481a0000.spi
 40:          0      INTC  32 Level     481ac000.gpio
 41:          0      INTC  62 Level     481ae000.gpio
 42:        315      INTC  28 Level     mmc1
 43:          0      INTC 111 Level     48310000.rng
 45:          0      INTC  41 Level     4a100000.ethernet
 46:          0      INTC  42 Level     4a100000.ethernet
 48:        967      INTC  12 Level     49000000.dma_ccint
 50:          1      INTC  14 Level     49000000.dma_ccerrint
 59:          0      INTC   7 Level     tps65217-irq
 62:          0  tps65217   2 Edge      tps65217_pwrbutton
 63:          0  481ac000.gpio   5 Level     spi1.0
 64:          2  44e07000.gpio  22 Level     spi1.1
 65:          0  44e07000.gpio   6 Edge      48060000.mmc cd


Where
19:          2      INTC  96 Level     44e07000.gpio
64:          2  44e07000.gpio  22 Level     spi1.1
Is the problem.=20



This is the dts part of the mcp2518fd's:
/*
 * Device tree overlay for mcp2518fd on spi1.0 and spi1.1
 */

#include <dt-bindings/gpio/gpio.h>
#include <dt-bindings/interrupt-controller/irq.h>

&am33xx_pinmux{
        pinctrl_spi1_pins: pinctrl_spi1_pins {
                pinctrl-single,pins =3D <
                        AM33XX_IOPAD(0x990, PIN_INPUT | MUX_MODE3) /* (A13)=
 mcasp0_aclkx.spi1_sclk */
                        AM33XX_IOPAD(0x994, PIN_INPUT | MUX_MODE3) /* (B13)=
 mcasp0_fsx.spi1_d0 */
                        AM33XX_IOPAD(0x998, PIN_INPUT | MUX_MODE3) /* (D12)=
 mcasp0_axr0.spi1_d1 */
                        AM33XX_IOPAD(0x96c, PIN_OUTPUT_PULLUP | MUX_MODE5) =
/* (E17) uart0_rtsn.spi1_cs0         CleANopen       LEFT*/
                        AM33XX_IOPAD(0x9b0, PIN_OUTPUT_PULLUP | MUX_MODE4) =
/* (A15) xdma_event_intr0.spi1_cs1   SAWM CAN        RIGHT*/
                >;
        };

        can0_int_pins: can0_int_pins {
                pinctrl-single,pins =3D <
                /*CleANopen*/
                AM33XX_IOPAD(0x89c, PIN_INPUT_PULLUP | MUX_MODE7) /* (T6) g=
pmc_be0n_cle.gpio2[5]        nINT            */
                AM33XX_IOPAD(0x968, PIN_INPUT_PULLUP | MUX_MODE7) /* (E18) =
uart0_ctsn.gpio1[8]          nINT1           */
                >;
        };

        can1_int_pins: can1_int_pins {
                pinctrl-single,pins =3D <
                /*SAWM CAN*/
                AM33XX_IOPAD(0x820, PIN_INPUT_PULLUP | MUX_MODE7) /* (U10) =
gpmc_ad8.gpio0[22]   nINT            */
                AM33XX_IOPAD(0x8c8, PIN_INPUT_PULLUP | MUX_MODE7) /* (U3) l=
cd_data10.gpio2[16]  nINT1           */
                >;
        };
};



/{
        /* external 40M oscillator of mcp2518fd on SPI1.0 */
        mcp2518fd_can0_osc: mcp2518fd_can0_osc {
                compatible =3D "fixed-clock";
                #clock-cells =3D <0>;
                clock-frequency =3D <40000000>;
        };
};


/{
        /* external 40M oscillator of mcp2518fd on SPI1.1 */
        mcp2518fd_can1_osc: mcp2518fd_can1_osc {
                compatible =3D "fixed-clock";
                #clock-cells =3D <0>;
                clock-frequency =3D <40000000>;
        };
};

/* the spi config of the can-controller itself binding everything together =
*/
&spi1{
    #address-cells =3D <1>;
    #size-cells =3D <0>;

    status =3D "okay";
    pinctrl-names =3D "default";
    pinctrl-0 =3D <&pinctrl_spi1_pins>;

    /*CleANopen*/
    can@0 {
        compatible =3D "microchip,mcp2518fd";
        reg =3D <0>;
        clocks =3D <&mcp2518fd_can0_osc>;
        pinctrl-names =3D "default";
        pinctrl-0 =3D <&can0_int_pins>;
        spi-max-frequency =3D <20000000>;

        interrupt-parent =3D <&gpio2>;
        interrupts =3D <5 IRQ_TYPE_LEVEL_LOW>;

        interrupts-extended =3D <&gpio2 5 IRQ_TYPE_LEVEL_LOW>;
        microchip,rx-int-gpios =3D <&gpio1 8 GPIO_ACTIVE_LOW>;
    };

    can@1 {
        compatible =3D "microchip,mcp2518fd";
        reg =3D <1>;
        clocks =3D <&mcp2518fd_can1_osc>;
        pinctrl-names =3D "default";
        pinctrl-0 =3D <&can1_int_pins>;
        spi-max-frequency =3D <20000000>;

        interrupt-parent =3D <&gpio0>;
        interrupts =3D <22 IRQ_TYPE_LEVEL_LOW>;

        interrupts-extended =3D <&gpio0 22 IRQ_TYPE_LEVEL_LOW>;
        microchip,rx-int-gpios =3D <&gpio2 16 GPIO_ACTIVE_LOW>;
    };
};


Any thought on why I see this behavior?

Regards
Markus=20
