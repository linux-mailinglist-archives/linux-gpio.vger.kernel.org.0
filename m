Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A52020C209
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Jun 2020 16:21:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725854AbgF0OV3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 27 Jun 2020 10:21:29 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.164]:26131 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbgF0OV2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 27 Jun 2020 10:21:28 -0400
X-Greylist: delayed 358 seconds by postgrey-1.27 at vger.kernel.org; Sat, 27 Jun 2020 10:21:27 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1593267686;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=oZX/2REc+F7gc5PSyf4xLdHRaC1Jao1IJPfNXwG+ask=;
        b=Va8gXrKwWH2YT5bXIwz9njTcaqOWA5YMD1Z2I17Us4VF4FD+0WTueUbToE6fvlpj3z
        OlkFBaR0woaHWoj5IgajG7o8G3oYmqTqGYBTDiKz76COPhuFLxmXh17CWq5vmFRGpYEX
        1H2+rt8yfe1r9zAKQi2TF/LrNPmB8+P3L6HPeTSAGskPPy8TC/+5jTvIomCQXuPy8Oyx
        EDpjjZVGVZyk+hDC5SYfx5ADr1SDY4Ul/UIv+kyODbOzuAtG1+4eZwexcDJBiSUGL9vB
        mMRpH5ZPPvUxUo39gWcfdR8fpBBVmjdXdrH05r/7QASfDWxEVooEYP4QYg6h8ZD7gcH4
        2opQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlWcXA0MG+M="
X-RZG-CLASS-ID: mo00
Received: from mbp-13-nikolaus.fritz.box
        by smtp.strato.de (RZmta 46.10.5 DYNA|AUTH)
        with ESMTPSA id V07054w5RE9OHTJ
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Sat, 27 Jun 2020 16:09:24 +0200 (CEST)
Subject: Re: [PATCH] Add default mux for pins that a free GPIO lines on the PocketBeagle
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200627135538.194179-1-drew@beagleboard.org>
Date:   Sat, 27 Jun 2020 16:09:27 +0200
Cc:     Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>,
        bcousson@baylibre.com, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>,
        linux-gpio@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <53805044-06E2-4A70-A024-4D77DEA3FCDE@goldelico.com>
References: <20200627135538.194179-1-drew@beagleboard.org>
To:     Drew Fustini <drew@beagleboard.org>
X-Mailer: Apple Mail (2.3124)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


> Am 27.06.2020 um 15:55 schrieb Drew Fustini <drew@beagleboard.org>:
>=20
> These pins on the PocketBeagle P1 and P2 headers are connected to =
AM3358
> balls with gpio lines, and these pins are not used for any other
> peripherals by default. These GPIO lines are unclaimed and could be =
used
> by userspace program through the gpiod ABI. However, no driver will =
have
> set mux mode for the pins.
>=20
> This patch adds a "default" state in the am33xx_pinmux node and sets =
the
> pins to gpio output mux mode.

wouldn't it be more safe to set them to input mode?

BR,
Nikolaus Schaller

>=20
> Signed-off-by: Drew Fustini <drew@beagleboard.org>
> ---
> arch/arm/boot/dts/am335x-pocketbeagle.dts | 98 +++++++++++++++++++++++
> 1 file changed, 98 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/am335x-pocketbeagle.dts =
b/arch/arm/boot/dts/am335x-pocketbeagle.dts
> index f0b222201b86..900dc6558701 100644
> --- a/arch/arm/boot/dts/am335x-pocketbeagle.dts
> +++ b/arch/arm/boot/dts/am335x-pocketbeagle.dts
> @@ -60,6 +60,104 @@ vmmcsd_fixed: fixedregulator0 {
> };
>=20
> &am33xx_pinmux {
> +
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D   <	&P2_03_gpio &P1_34_gpio &P2_19_gpio =
&P2_24_gpio
> +			&P2_33_gpio &P2_22_gpio &P2_18_gpio &P2_10_gpio
> +			&P2_06_gpio &P2_04_gpio &P2_02_gpio &P2_08_gpio
> +			&P2_17_gpio >;
> +
> +	/* P2_03 (ZCZ ball T10) gpio0_23 0x824 */
> +	P2_03_gpio: pinmux_P2_03_gpio {
> +		pinctrl-single,pins =3D <
> +			AM33XX_PADCONF(AM335X_PIN_GPMC_AD9, PIN_OUTPUT, =
MUX_MODE7)
> +		>;
> +	};
> +
> +	/* P1_34 (ZCZ ball T11) gpio0_26 0x828 */
> +	P1_34_gpio: pinmux_P1_34_gpio {
> +		pinctrl-single,pins =3D <
> +			AM33XX_PADCONF(AM335X_PIN_GPMC_AD10, PIN_OUTPUT, =
MUX_MODE7)
> +		>;
> +	};
> +
> +		/* P2_19 (ZCZ ball U12) gpio0_27 0x82c */
> +	P2_19_gpio: pinmux_P2_19_gpio {
> +		pinctrl-single,pins =3D <
> +			AM33XX_PADCONF(AM335X_PIN_GPMC_AD11, PIN_OUTPUT, =
MUX_MODE7)
> +		>;
> +	};
> +
> +	/* P2_24 (ZCZ ball T12) gpio1_12 0x830 */
> +	P2_24_gpio: pinmux_P2_24_gpio {
> +		pinctrl-single,pins =3D <
> +			AM33XX_PADCONF(AM335X_PIN_GPMC_AD12, PIN_OUTPUT, =
MUX_MODE7)
> +		>;
> +	};
> +
> +	/* P2_33 (ZCZ ball R12) gpio1_13 0x834 */
> +	P2_33_gpio: pinmux_P2_33_gpio {
> +		pinctrl-single,pins =3D <
> +			AM33XX_PADCONF(AM335X_PIN_GPMC_AD13, PIN_OUTPUT, =
MUX_MODE7)
> +		>;
> +	};
> +
> +	/* P2_22 (ZCZ ball V13) gpio1_14 0x838 */
> +	P2_22_gpio: pinmux_P2_22_gpio {
> +		pinctrl-single,pins =3D <
> +			AM33XX_PADCONF(AM335X_PIN_GPMC_AD14, PIN_OUTPUT, =
MUX_MODE7)
> +		>;
> +	};
> +
> +	/* P2_18 (ZCZ ball U13) gpio1_15 0x83c */
> +	P2_18_gpio: pinmux_P2_18_gpio {
> +		pinctrl-single,pins =3D <
> +			AM33XX_PADCONF(AM335X_PIN_GPMC_AD15, PIN_OUTPUT, =
MUX_MODE7)
> +		>;
> +	};
> +
> +	/* P2_10 (ZCZ ball R14) gpio1_20 0x850 */
> +	P2_10_gpio: pinmux_P2_10_gpio {
> +		pinctrl-single,pins =3D <
> +			AM33XX_PADCONF(AM335X_PIN_GPMC_A4, PIN_OUTPUT, =
MUX_MODE7)
> +		>;
> +	};
> +
> +	/* P2_06 (ZCZ ball U16) gpio1_25 0x864 */
> +	P2_06_gpio: pinmux_P2_06_gpio {
> +		pinctrl-single,pins =3D <
> +			AM33XX_PADCONF(AM335X_PIN_GPMC_A9, PIN_OUTPUT, =
MUX_MODE7)
> +		>;
> +	};
> +
> +	/* P2_04 (ZCZ ball T16) gpio1_26 0x868 */
> +	P2_04_gpio: pinmux_P2_04_gpio {
> +		pinctrl-single,pins =3D <
> +			AM33XX_PADCONF(AM335X_PIN_GPMC_A10, PIN_OUTPUT, =
MUX_MODE7)
> +		>;
> +	};
> +
> +	/* P2_02 (ZCZ ball V17) gpio1_27 0x86c */
> +	P2_02_gpio: pinmux_P2_02_gpio {
> +		pinctrl-single,pins =3D <
> +			AM33XX_PADCONF(AM335X_PIN_GPMC_A11, PIN_OUTPUT, =
MUX_MODE7)
> +		>;
> +	};
> +
> +	/* P2_08 (ZCZ ball U18) gpio1_28 0x878 */
> +	P2_08_gpio: pinmux_P2_08_gpio {
> +		pinctrl-single,pins =3D <
> +			AM33XX_PADCONF(AM335X_PIN_GPMC_BEN1, PIN_OUTPUT, =
MUX_MODE7)
> +		>;
> +	};
> +
> +	/* P2_17 (ZCZ ball V12) gpio2_1 0x88c */
> +	P2_17_gpio: pinmux_P2_17_gpio {
> +		pinctrl-single,pins =3D <
> +			AM33XX_PADCONF(AM335X_PIN_GPMC_CLK, PIN_OUTPUT, =
MUX_MODE7)
> +		>;
> +	};
> +
> 	i2c2_pins: pinmux-i2c2-pins {
> 		pinctrl-single,pins =3D <
> 			AM33XX_PADCONF(AM335X_PIN_UART1_RTSN, =
PIN_INPUT_PULLUP, MUX_MODE3)	/* (D17) uart1_rtsn.I2C2_SCL */
> --=20
> 2.25.1
>=20

