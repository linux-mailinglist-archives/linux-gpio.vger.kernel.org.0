Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 456A4DAFB2
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2019 16:19:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394846AbfJQOTS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Oct 2019 10:19:18 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:54766 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394836AbfJQOTR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Oct 2019 10:19:17 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9HEImiw068201;
        Thu, 17 Oct 2019 09:18:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571321928;
        bh=vro4QXqzUHoQgh6wr5eoCT4KAJwAlhiqRKMcQZzOAp0=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=zK3vLTFd6EUCIMjGynTaF0CklRM3h/PGQvulBVRzlBVsWGzIQ/YD0TWVaQPU5UCM5
         l+wFdkmGmj0GdsyFoliI99ynZ1WDlLbm/FxrIDa8wO1eOECoyrNPHendfWL6PAB0QZ
         xxwfbmi2DnjsPfbTBkG8RFCRma/pmLc8HFeovNTQ=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9HEIm9a084028
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 17 Oct 2019 09:18:48 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 17
 Oct 2019 09:18:40 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 17 Oct 2019 09:18:40 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9HEIlff096685;
        Thu, 17 Oct 2019 09:18:47 -0500
Subject: Re: [RFC PATCH 12/13] dt-bindings: mfd: Document ROHM BD71282
 bindings
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        <mazziesaccount@gmail.com>
CC:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-leds@vger.kernel.org>, <linux-rtc@vger.kernel.org>
References: <cover.1571302099.git.matti.vaittinen@fi.rohmeurope.com>
 <05841ff33ea166bc6934456a492adc3c67a90670.1571302099.git.matti.vaittinen@fi.rohmeurope.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <1d2bc596-0329-d090-2e8d-037c8cad0585@ti.com>
Date:   Thu, 17 Oct 2019 09:18:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <05841ff33ea166bc6934456a492adc3c67a90670.1571302099.git.matti.vaittinen@fi.rohmeurope.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Matt

On 10/17/19 4:55 AM, Matti Vaittinen wrote:
> ROHM BD71828 Power management IC integrates 7 buck converters, 7 LDOs,
> a real-time clock (RTC), 3 GPO/regulator control pins, HALL input pin
> and a 32.768 kHz clock gate.
>
> Document the dt bindings drivers are using.

This should be patch 1 of X


> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
>   .../bindings/mfd/rohm,bd71828-pmic.txt        | 180 ++++++++++++++++++
>   1 file changed, 180 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.txt
>
> diff --git a/Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.txt b/Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.txt
> new file mode 100644
> index 000000000000..125efa9f3de0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.txt
> @@ -0,0 +1,180 @@
> +* ROHM BD71828 Power Management Integrated Circuit bindings
> +
> +BD71828GW is a single-chip power management IC for battery-powered portable
> +devices. The IC integrates 7 buck converters, 7 LDOs, and a 1500 mA single-cell
> +linear charger. Also included is a Coulomb counter, a real-time clock (RTC),
> +and a 32.768 kHz clock gate.
> +
> +Required properties:
> + - compatible			: Should be "rohm,bd71828".
> + - reg				: I2C slave address.
> + - interrupt-parent		: Phandle to the parent interrupt controller.
> + - interrupts			: The interrupt line the device is connected to.
> + - clocks			: The parent clock connected to PMIC.
> + - #clock-cells			: Should be 0.
> + - regulators			: List of child nodes that specify the
> +				  regulators. Please see
> +				  ../regulator/rohm,bd71828-regulator.txt
> + - gpio-controller		: To indicate BD71828 acts as a GPIO controller.
> + - #gpio-cells			: Should be 2. The first cell is the pin number
> +				  and the second cell is used to specify flags.
> +				  See ../gpio/gpio.txt for more information.
> +
> +The BD71828 RUN state is divided into 4 configurable run-levels named RUN0,
> +RUN1, RUN2 and RUN3. Bucks 1, 2, 6 and 7 can be either controlled individually
> +via I2C, or some/all of them can be bound to run-levels and controlled as a
> +group. If bucks are controlled individually these run-levels are ignored. See
> +../regulator/rohm,bd71828-regulator.txt for how to define regulator voltages
> +for run-levels. Run-levels can be changed by I2C or GPIO depending on PMIC's OTP
> +configuration.
> +
> +Optional properties:
> +- clock-output-names		: Should contain name for output clock.
> +- rohm,dvs-vsel-gpios		: GPIOs used to control PMIC run-levels. Should
> +				  describe two GPIOs. (See run-level control in
> +				  data-sheet). If this property is omitted but
> +				  some bucks are marked to be controlled by
> +				  run-levels - then OTP option allowing
> +				  run-level control via I2C is assumed.
> +- gpio-reserved-ranges		: Usage of GPIO pins can be changed via OTP.
> +				  This property can be used to mark the pins
> +				  which should not be configured for GPIO.
> +				  Please see the ../gpio/gpio.txt for more
> +				  information.
> +
> +Example:
> +
> +        /* external oscillator node */
> +        osc: oscillator {
> +                compatible = "fixed-clock";
> +                #clock-cells = <1>;
> +                clock-frequency  = <32768>;
> +                clock-output-names = "osc";
> +        };
> +
> +	pmic: pmic@4b {
> +		compatible = "rohm,bd71828";
> +		reg = <0x4b>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <29 GPIO_ACTIVE_LOW>;
> +		clocks = <&osc 0>;
> +		#clock-cells = <0>;
> +		clock-output-names = "bd71828-32k-out";
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		ngpios = <4>;
> +		gpio-reserved-ranges = <0 1 2 1>;
> +		gpio-line-names = "EPDEN";
> +		rohm,dvs-vsel-gpios = <&gpio1 12 0>,
> +				      <&gpio1 13 0>;
> +		regulators {
> +			buck1: BUCK1 {
> +				regulator-name = "buck1";
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <2000000>;
> +				regulator-ramp-delay = <2500>;
> +				rohm,dvs-runlvl-ctrl;
> +				rohm,dvs-runlevel0-voltage = <500000>;
> +				rohm,dvs-runlevel1-voltage = <506250>;
> +				rohm,dvs-runlevel2-voltage = <512500>;
> +				rohm,dvs-runlevel3-voltage = <518750>;
> +				regulator-boot-on;
> +			};
> +			buck2: BUCK2 {
> +				regulator-name = "buck2";
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <2000000>;
> +				regulator-ramp-delay = <2500>;
> +				rohm,dvs-runlvl-ctrl;
> +				rohm,dvs-runlevel0-voltage = <500000>;
> +				rohm,dvs-runlevel1-voltage = <506250>;
> +				rohm,dvs-runlevel2-voltage = <512500>;
> +				rohm,dvs-runlevel3-voltage = <518750>;
> +				regulator-boot-on;
> +			};
> +			buck3: BUCK3 {
> +				regulator-name = "buck3";
> +				regulator-min-microvolt = <1200000>;
> +				regulator-max-microvolt = <2000000>;
> +				regulator-boot-on;
> +			};
> +			buck4: BUCK4 {
> +				regulator-name = "buck4";
> +				regulator-min-microvolt = <1000000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-boot-on;
> +			};
> +			buck5: BUCK5 {
> +				regulator-name = "buck5";
> +				regulator-min-microvolt = <2500000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-boot-on;
> +			};
> +			buck6: BUCK6 {
> +				regulator-name = "buck6";
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <2000000>;
> +				regulator-ramp-delay = <2500>;
> +				rohm,dvs-runlvl-ctrl;
> +				rohm,dvs-runlevel0-voltage = <500000>;
> +				rohm,dvs-runlevel1-voltage = <506250>;
> +				rohm,dvs-runlevel2-voltage = <512500>;
> +				rohm,dvs-runlevel3-voltage = <518750>;
> +				regulator-boot-on;
> +			};
> +			buck7: BUCK7 {
> +				regulator-name = "buck7";
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <2000000>;
> +				regulator-ramp-delay = <2500>;
> +				rohm,dvs-runlvl-ctrl;
> +				rohm,dvs-runlevel0-voltage = <500000>;
> +				rohm,dvs-runlevel1-voltage = <506250>;
> +				rohm,dvs-runlevel2-voltage = <512500>;
> +				rohm,dvs-runlevel3-voltage = <518750>;
> +				regulator-boot-on;
> +			};
> +			ldo1: LDO1 {
> +				regulator-name = "ldo1";
> +				regulator-min-microvolt = <800000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-boot-on;
> +			};
> +			ldo2: LDO2 {
> +				regulator-name = "ldo2";
> +				regulator-min-microvolt = <800000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-boot-on;
> +			};
> +			ldo3: LDO3 {
> +				regulator-name = "ldo3";
> +				regulator-min-microvolt = <800000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-boot-on;
> +			};
> +			ldo4: LDO4 {
> +				regulator-name = "ldo4";
> +				regulator-min-microvolt = <800000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-boot-on;
> +			};
> +			ldo5: LDO5 {
> +				regulator-name = "ldo5";
> +				regulator-min-microvolt = <800000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-boot-on;
> +			};
> +			ldo6: LDO6 {
> +				regulator-name = "ldo6";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-boot-on;
> +			};
> +			ldo7_reg: LDO7 {
> +				regulator-name = "ldo7";
> +				regulator-min-microvolt = <800000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-boot-on;
> +			};
> +		};
> +	};
