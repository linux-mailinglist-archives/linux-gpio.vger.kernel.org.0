Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18241E3C10
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2019 21:37:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392484AbfJXThD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Oct 2019 15:37:03 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:35182 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387655AbfJXThC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Oct 2019 15:37:02 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9OJaQQx073777;
        Thu, 24 Oct 2019 14:36:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571945786;
        bh=symP3nQ06Xja5LwACedkvVAeNJcUuk64vlBk/0LFjbg=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=pGCCfSCyTyLtfEAX1MsLzI3D0/naW1DqahP/VqAozdsMqZ3SJHRg8CdxTpMPEibb1
         esAuZTSuslj6sh/GzqneEsaGj09v7RYNxLSH+08j6W0+Fwdo1A8Ufw0DV4hyCrf93X
         rrQWMZtiMwIe9O2Q/NAeyL3YmeMEOUGihJURqBVY=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9OJaQYG067924;
        Thu, 24 Oct 2019 14:36:26 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 24
 Oct 2019 14:36:15 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 24 Oct 2019 14:36:15 -0500
Received: from [10.250.35.43] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9OJaP4P016308;
        Thu, 24 Oct 2019 14:36:25 -0500
Subject: Re: [RFC PATCH v2 02/13] dt-bindings: mfd: Document ROHM BD71828
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
References: <cover.1571915550.git.matti.vaittinen@fi.rohmeurope.com>
 <0182df3c49c6c804ee20ef32fc4b85b50ff45fca.1571915550.git.matti.vaittinen@fi.rohmeurope.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <ed0b2aa8-8a70-0341-4ecf-8959f37c53bd@ti.com>
Date:   Thu, 24 Oct 2019 14:35:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <0182df3c49c6c804ee20ef32fc4b85b50ff45fca.1571915550.git.matti.vaittinen@fi.rohmeurope.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Matti

On 10/24/19 6:41 AM, Matti Vaittinen wrote:
> ROHM BD71828 Power management IC integrates 7 buck converters, 7 LDOs,
> a real-time clock (RTC), 3 GPO/regulator control pins, HALL input
> and a 32.768 kHz clock gate.
>
> Document the dt bindings drivers are using.
>
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
>
> No changes since v1
>
>   .../bindings/mfd/rohm,bd71828-pmic.txt        | 180 ++++++++++++++++++
>   1 file changed, 180 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.txt

I will let maintainers weigh in here but if this is new this should 
probably be in the yaml format to avoid conversion in the future


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
The rohm,bd71828-regulator.txt should be yaml if the maintainers want it 
that way.
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

This example does not look right.

I see that I2C is referenced above so the example could look like this

osc: oscillator {
                 compatible = "fixed-clock";
                 #clock-cells = <1>;
                 clock-frequency  = <32768>;
                 clock-output-names = "osc";
         };

This is an external oscillator and is not really part of the pmic 
itself.  I am not sure you even need to define that since it is not part 
of the pmic.

i2c {

         pmic@4b {

                 [...]

         };

};

Dan
