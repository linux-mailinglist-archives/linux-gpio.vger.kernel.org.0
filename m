Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83239F0727
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 21:43:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727888AbfKEUni (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 15:43:38 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:43601 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725806AbfKEUni (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 15:43:38 -0500
Received: by mail-oi1-f193.google.com with SMTP id l20so6768740oie.10;
        Tue, 05 Nov 2019 12:43:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RkODek+8IsNsEOzoc63Wjx0Tnh0J25xfJnOEthQTkL0=;
        b=noLaUxphl6DYAZznVdo0VudNFjqrLYCPm342a3aNqlRhzIklUv+wveMjhOsOY+pfSt
         RtjAkSAr8NBGWtbFNtNADC8nftFRfnixVHtoG73xU1IT2DJExJNZomdPLZd48RoS/sfw
         td3BpcOUCKo2rrZRvImWPa4OebQ5vETGEtUxwhjHyXojZhKyVqIC5ZZBVb9dbuwmvkjN
         SDcv/SbJFykC2DlLheRFJyvbado7kbs4yZ5kFolGzpQeak7UufZiE8ZWWr2bGQeTil+h
         8jodhRKrGsW2zxnhVmg8wKAPmVMUmCXO3lkdMaCnEkQU1NFy4kJ23OowspwFKsdIbphM
         2Bdw==
X-Gm-Message-State: APjAAAXGzgZ+hwVOsu8/fHvHGVtFbp6ox5pXFtqcbQyqQfAjUcG7VrDq
        iEyvCKq4E/Xkb1vhA1+Cng==
X-Google-Smtp-Source: APXvYqwmFRObbqHaoVxXxF4nzE7y0+CWhzTqQJ05JITnCfvlFJDjwhK2kCt75mPTDpjjYI6VOFrLoQ==
X-Received: by 2002:aca:dbc3:: with SMTP id s186mr805095oig.130.1572986616095;
        Tue, 05 Nov 2019 12:43:36 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m8sm1918560oie.30.2019.11.05.12.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 12:43:35 -0800 (PST)
Date:   Tue, 5 Nov 2019 14:43:34 -0600
From:   Rob Herring <robh@kernel.org>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     mazziesaccount@gmail.com,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [RFC PATCH v3 02/15] dt-bindings: mfd: Document ROHM BD71828
 bindings
Message-ID: <20191105204334.GA629@bogus>
References: <cover.1572606437.git.matti.vaittinen@fi.rohmeurope.com>
 <ae5d8cf6d276a29432583c1e5241ba7e852036b9.1572606437.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae5d8cf6d276a29432583c1e5241ba7e852036b9.1572606437.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 01, 2019 at 01:31:03PM +0200, Matti Vaittinen wrote:
> ROHM BD71828 Power management IC integrates 7 buck converters, 7 LDOs,
> a real-time clock (RTC), 3 GPO/regulator control pins, HALL input
> and a 32.768 kHz clock gate.
> 
> Document the dt bindings drivers are using.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
> 
> Changes from v2 - my first encounter with yaml :/
> 
>  .../bindings/mfd/rohm,bd71828-pmic.yaml       | 249 ++++++++++++++++++
>  1 file changed, 249 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml b/Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml
> new file mode 100644
> index 000000000000..b2a88f6e1bb7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml
> @@ -0,0 +1,249 @@
> +# SPDX-License-Identifier: GPL-2.0

# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)

for new bindings.

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/rohm,bd71828-pmic.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ROHM BD71828 Power Management Integrated Circuit bindings
> +
> +maintainers:
> +  - Lee Jones <lee.jones@linaro.org>
> +  - Rob Herring <robh@kernel.org>
> +  - Mark Rutland <mark.rutland@arm.com>

Don't list me or Mark here. I maintain everything...

> +
> +description: |
> +  BD71828GW is a single-chip power management IC for battery-powered portable
> +  devices. The IC integrates 7 buck converters, 7 LDOs, and a 1500 mA
> +  single-cell linear charger. Also included is a Coulomb counter, a real-time
> +  clock (RTC), and a 32.768 kHz clock gate.
> +
> +  The BD71828 RUN state is divided into 4 configurable run-levels named RUN0,
> +  RUN1, RUN2 and RUN3. Bucks 1, 2, 6 and 7 can be either controlled individually
> +  via I2C, or some/all of them can be bound to run-levels and controlled as a
> +  group. If bucks are controlled individually these run-levels are ignored. See
> +  ../regulator/rohm,bd71828-regulator.yaml for how to define regulator voltages
> +  for run-levels. Run-levels can be changed by I2C or GPIO depending on PMIC's
> +  OTP configuration.
> +
> +properties:
> +  compatible:
> +    const: rohm,bd71828

blank line here please

> +  reg:
> +    description:
> +      I2C slave address.
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +    description:
> +      The interrupt line the device is connected to.
> +
> +  gpio-controller: true
> +      # Indicate BD71828 acts as a GPIO controller.
> +
> +  "#gpio-cells":
> +    const: 2
> +    description: |
> +      The first cell is the pin number and the second cell is used to specify
> +      flags. See ../gpio/gpio.txt for more information.
> +
> +  clocks:
> +    description:
> +      The parent clock connected to PMIC.

How many?

maxItems: 1

> +
> +  "#clock-cells":
> +    const: 0
> +
> +  rohm,charger-sense-resistor:
> +    $ref: "/schemas/types.yaml#/definitions/uint32"
> +    description: |
> +      BD71827 and BD71828 have SAR ADC for measuring charging currents.
> +      External sense resistor (RSENSE in data sheet) should be used. If some
> +      other but 30MOhm resistor is used the resistance value should be given
> +      here in Ohms.

Standard units need a unit suffix as defined in property-units.txt. So 
'-ohms' in this case. With that, you can drop $ref because we already 
define the type.

Is there a valid range of values? If so, use minimum/maximum.

> +
> +  regulators:
> +    $ref: ../regulator/rohm,bd71828-regulator.yaml

Not bisectable. These files have to come in this patch or before.

> +    description:
> +      List of child nodes that specify the regulators.
> +
> +  leds:
> +    $ref: ../leds/rohm,leds-bd71828.yaml

Filename should match the compatible if possible.

> +
> +  clock-output-names:
> +    description:
> +      Should contain name for output clock.

Need to document what the name is. Though, with only 1 clock, not that 
useful.

> +
> +  rohm,dvs-vsel-gpios:
> +    description: |
> +      GPIOs used to control PMIC run-levels. Should describe two GPIOs.
> +      (See run-level control in data-sheet). If this property is omitted but
> +      some bucks are marked to be controlled by run-levels - then OTP option
> +      allowing run-level control via I2C is assumed.

How many? Needs 'maxItems'.

> +
> +  gpio-reserved-ranges:
> +    description: |
> +      Usage of BD71828 GPIO pins can be changed via OTP. This property can be
> +      used to mark the pins which should not be configured for GPIO. Please see
> +      the ../gpio/gpio.txt for more information.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - "#clock-cells"
> +  - regulators
> +  - gpio-controller
> +  - "#gpio-cells"
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/leds/common.h>
> +    i2c {

'make dt_binding_check' reports an error building this, but I'm not 
seeing where it is:

Error: Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.example.dts:155.36-37 syntax error
FATAL ERROR: Unable to parse input tree

> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        pmic: pmic@4b {
> +            compatible = "rohm,bd71828";
> +            reg = <0x4b>;
> +
> +            interrupt-parent = <&gpio1>;
> +            interrupts = <29 IRQ_TYPE_LEVEL_LOW>;
> +
> +            clocks = <&osc 0>;
> +            #clock-cells = <0>;
> +            clock-output-names = "bd71828-32k-out";
> +
> +            gpio-controller;
> +            #gpio-cells = <2>;
> +            gpio-reserved-ranges = <0 1 2 1>;
> +
> +            rohm,dvs-vsel-gpios = <&gpio1 12 0>, <&gpio1 13 0>;
> +            rohm,charger-sense-resistor = <10000000>;
> +
> +            regulators {
> +                buck1: BUCK1 {
> +                    regulator-name = "buck1";
> +                    regulator-min-microvolt = <500000>;
> +                    regulator-max-microvolt = <2000000>;
> +                    regulator-ramp-delay = <2500>;
> +                    rohm,dvs-runlvl-ctrl;
> +                    rohm,dvs-runlevel0-voltage = <500000>;
> +                    rohm,dvs-runlevel1-voltage = <506250>;
> +                    rohm,dvs-runlevel2-voltage = <512500>;
> +                    rohm,dvs-runlevel3-voltage = <518750>;
> +                    regulator-boot-on;
> +                };
> +                buck2: BUCK2 {
> +                    regulator-name = "buck2";
> +                    regulator-min-microvolt = <500000>;
> +                    regulator-max-microvolt = <2000000>;
> +                    regulator-ramp-delay = <2500>;
> +                    rohm,dvs-runlvl-ctrl;
> +                    rohm,dvs-runlevel0-voltage = <500000>;
> +                    rohm,dvs-runlevel1-voltage = <506250>;
> +                    rohm,dvs-runlevel2-voltage = <512500>;
> +                    rohm,dvs-runlevel3-voltage = <518750>;
> +                    regulator-boot-on;
> +                };
> +                buck3: BUCK3 {
> +                    regulator-name = "buck3";
> +                    regulator-min-microvolt = <1200000>;
> +                    regulator-max-microvolt = <2000000>;
> +                    regulator-boot-on;
> +                };
> +                buck4: BUCK4 {
> +                    regulator-name = "buck4";
> +                    regulator-min-microvolt = <1000000>;
> +                    regulator-max-microvolt = <1800000>;
> +                    regulator-boot-on;
> +                };
> +                buck5: BUCK5 {
> +                    regulator-name = "buck5";
> +                    regulator-min-microvolt = <2500000>;
> +                    regulator-max-microvolt = <3300000>;
> +                    regulator-boot-on;
> +                };
> +                buck6: BUCK6 {
> +                    regulator-name = "buck6";
> +                    regulator-min-microvolt = <500000>;
> +                    regulator-max-microvolt = <2000000>;
> +                    regulator-ramp-delay = <2500>;
> +                    rohm,dvs-runlvl-ctrl;
> +                    rohm,dvs-runlevel0-voltage = <500000>;
> +                    rohm,dvs-runlevel1-voltage = <506250>;
> +                    rohm,dvs-runlevel2-voltage = <512500>;
> +                    rohm,dvs-runlevel3-voltage = <518750>;
> +                    regulator-boot-on;
> +                };
> +                buck7: BUCK7 {
> +                    regulator-name = "buck7";
> +                    regulator-min-microvolt = <500000>;
> +                    regulator-max-microvolt = <2000000>;
> +                    regulator-ramp-delay = <2500>;
> +                    rohm,dvs-runlvl-ctrl;
> +                    rohm,dvs-runlevel0-voltage = <500000>;
> +                    rohm,dvs-runlevel1-voltage = <506250>;
> +                    rohm,dvs-runlevel2-voltage = <512500>;
> +                    rohm,dvs-runlevel3-voltage = <518750>;
> +                    regulator-boot-on;
> +                };
> +                ldo1: LDO1 {
> +                    regulator-name = "ldo1";
> +                    regulator-min-microvolt = <800000>;
> +                    regulator-max-microvolt = <3300000>;
> +                    regulator-boot-on;
> +                };
> +                ldo2: LDO2 {
> +                    regulator-name = "ldo2";
> +                    regulator-min-microvolt = <800000>;
> +                    regulator-max-microvolt = <3300000>;
> +                    regulator-boot-on;
> +                };
> +                ldo3: LDO3 {
> +                    regulator-name = "ldo3";
> +                    regulator-min-microvolt = <800000>;
> +                    regulator-max-microvolt = <3300000>;
> +                    regulator-boot-on;
> +                };
> +                ldo4: LDO4 {
> +                    regulator-name = "ldo4";
> +                    regulator-min-microvolt = <800000>;
> +                    regulator-max-microvolt = <3300000>;
> +                    regulator-boot-on;
> +                };
> +                ldo5: LDO5 {
> +                    regulator-name = "ldo5";
> +                    regulator-min-microvolt = <800000>;
> +                    regulator-max-microvolt = <3300000>;
> +                    regulator-boot-on;
> +                };
> +                ldo6: LDO6 {
> +                    regulator-name = "ldo6";
> +                    regulator-min-microvolt = <1800000>;
> +                    regulator-max-microvolt = <1800000>;
> +                    regulator-boot-on;
> +                };
> +                ldo7_reg: LDO7 {
> +                    regulator-name = "ldo7";
> +                    regulator-min-microvolt = <800000>;
> +                    regulator-max-microvolt = <3300000>;
> +                    regulator-boot-on;
> +                };
> +            };
> +
> +            leds {
> +                compatible = "rohm,bd71828-led";
> +
> +                led-1 {
> +                    function = LED_FUNCTION_INDICATOR;
> +                    color = <LED_COLOR_ID_GREEN>;
> +                };
> +                led-2 {
> +                    function = LED_FUNCTION_CHARGING;
> +                    color = <LED_COLOR_ID_AMBER>;
> +                };
> +            };
> +        };
> +    };
> -- 
> 2.21.0
> 
> 
> -- 
> Matti Vaittinen, Linux device drivers
> ROHM Semiconductors, Finland SWDC
> Kiviharjunlenkki 1E
> 90220 OULU
> FINLAND
> 
> ~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
> Simon says - in Latin please.
> ~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
> Thanks to Simon Glass for the translation =] 
