Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDFE22F1E9E
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Jan 2021 20:08:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390754AbhAKTHi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Jan 2021 14:07:38 -0500
Received: from mail-oi1-f175.google.com ([209.85.167.175]:44155 "EHLO
        mail-oi1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732114AbhAKTHi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Jan 2021 14:07:38 -0500
Received: by mail-oi1-f175.google.com with SMTP id d189so402316oig.11;
        Mon, 11 Jan 2021 11:07:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=doYN/VTU/LMbcW85QKFBZ+DDV5pHYxLu7RvwDrqh2aM=;
        b=ZoKDg5ylqtcnUZWlUDxkri2rcyM/d+aBJqdAeWHFpTZp66DfimRWxWo1V+rdmE2HJv
         sAg1AswYFGSlDHlZWlHM7YDjzngQxKzMsMZhotuOIh5FOYZYgbfh8X02I3+4i7xBZ0fk
         3ZeA6O2wwYf5d0rFtx909RyiNSzDgRRsF5qltkavstuGydubt3EVxhFQpu1uvn445iVR
         dWcnDBOeXWOtgybnlsr07vSi2kNgbPcgryvKlHcSUCvGXXxgOTF0x0WgQJ4Hkoq5ifAD
         djpcgje8k2Q6kqMRD/uWnOWfkVRkFMDB0g3J8h1Np6tkXN2ae2O+P8Y1q+7DxjIjvZaq
         TR6w==
X-Gm-Message-State: AOAM532euW1woNHzyyui5UFA8ytKN7fUYDuaITr7var6jkMgT0lrt1Jb
        r4KRqp5GdtPCUZlerpgLbHUZJx2iTQ==
X-Google-Smtp-Source: ABdhPJypeXLMwwFCBoQ1yFh3Fox9trSbxovSrkjmyFz1Ahh3jeRWL51l+U7Pv4le1HBI+MdqElQItA==
X-Received: by 2002:aca:f48b:: with SMTP id s133mr180148oih.59.1610392016097;
        Mon, 11 Jan 2021 11:06:56 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id u3sm134292otk.31.2021.01.11.11.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 11:06:55 -0800 (PST)
Received: (nullmailer pid 2897458 invoked by uid 1000);
        Mon, 11 Jan 2021 19:06:53 -0000
Date:   Mon, 11 Jan 2021 13:06:53 -0600
From:   Rob Herring <robh@kernel.org>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     mazziesaccount@gmail.com, Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-power@fi.rohmeurope.com, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH 05/15] dt_bindings: mfd: Add ROHM BD71815 PMIC
Message-ID: <20210111190653.GA2890911@robh.at.kernel.org>
References: <cover.1610110144.git.matti.vaittinen@fi.rohmeurope.com>
 <4b3a868c07312d630de32e85d31dee7501627b73.1610110144.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b3a868c07312d630de32e85d31dee7501627b73.1610110144.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 08, 2021 at 03:34:52PM +0200, Matti Vaittinen wrote:
> Document DT bindings for ROHM BD71815.
> 
> BD71815 is a single-chip power management IC mainly for battery-powered
> portable devices. The IC integrates 5 bucks, 7 LDOs, a boost driver for
> LED, a battery charger with a Coulomb counter, a real-time clock, a 32kHz
> clock and two general-purpose outputs although only one is documented by
> the data-sheet.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
>  .../bindings/mfd/rohm,bd71815-pmic.yaml       | 198 ++++++++++++++++++
>  1 file changed, 198 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd71815-pmic.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/rohm,bd71815-pmic.yaml b/Documentation/devicetree/bindings/mfd/rohm,bd71815-pmic.yaml
> new file mode 100644
> index 000000000000..2206b2008acd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/rohm,bd71815-pmic.yaml
> @@ -0,0 +1,198 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/rohm,bd71815-pmic.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ROHM BD71815 Power Management Integrated Circuit bindings
> +
> +maintainers:
> +  - Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> +
> +description: |
> +  BD71815AGW is a single-chip power management ICs for battery-powered
> +  portable devices. It integrates 5 buck converters, 8 LDOs, a boost driver
> +  for LED and a 500 mA single-cell linear charger. Also included is a Coulomb
> +  counter, a real-time clock (RTC), and a 32.768 kHz clock gate and two GPOs.
> +
> +properties:
> +  compatible:
> +    const: rohm,bd71815
> +
> +  reg:
> +    description:
> +      I2C slave address.
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  gpio-controller: true

Add a blank line here.

> +  "#gpio-cells":
> +    const: 2
> +    description: |
> +      The first cell is the pin number and the second cell is used to specify
> +      flags. See ../gpio/gpio.txt for more information.
> +
> +  clocks:
> +    maxItems: 1

And here.

> +  "#clock-cells":
> +    const: 0

And here.

> +  clock-output-names:
> +    const: bd71815-32k-out
> +
> +  rohm,clkout-mode:
> +    description: clk32kout mode. Can be set to "open-drain" or "cmos".
> +    $ref: "/schemas/types.yaml#/definitions/string"
> +    enum:
> +      - open-drain
> +      - cmos
> +
> +  rohm,charger-sense-resistor-ohms:
> +    minimum: 10000000
> +    maximum: 50000000
> +    description: |
> +      BD71827 and BD71828 have SAR ADC for measuring charging currents.
> +      External sense resistor (RSENSE in data sheet) should be used. If some
> +      other but 30MOhm resistor is used the resistance value should be given

'something other'

Though this can be expressed as 'default: 30000000'

> +      here in Ohms.
> +
> +  regulators:
> +    $ref: ../regulator/rohm,bd71815-regulator.yaml

This file needs to come first.

> +    description:
> +      List of child nodes that specify the regulators.
> +
> +  gpio-reserved-ranges:
> +    description: |
> +      Usage of BD71828 GPIO pins can be changed via OTP. This property can be
> +      used to mark the pins which should not be configured for GPIO. Please see
> +      the ../gpio/gpio.txt for more information.
> +
> +  rohm,enable-hidden-gpo:
> +    description: |
> +      The BD71815 has undocumented GPO at pin E5. Pin is marked as GND at the
> +      data-sheet as it's location in the middle of GND pins makes it hard to
> +      use on PCB. If your board has managed to use this pin you can enable the
> +      second GPO by defining this property. Dont enable this if you are unsure
> +      about how the E5 pin is connected on your board.
> +    type: boolean
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
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/leds/common.h>
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        pmic: pmic@4b {
> +            compatible = "rohm,bd71815";
> +            reg = <0x4b>;
> +
> +            interrupt-parent = <&gpio1>;
> +            interrupts = <29 IRQ_TYPE_LEVEL_LOW>;
> +
> +            clocks = <&osc 0>;
> +            #clock-cells = <0>;
> +            clock-output-names = "bd71815-32k-out";
> +
> +            gpio-controller;
> +            #gpio-cells = <2>;
> +
> +            rohm,charger-sense-resistor-ohms = <10000000>;
> +
> +            regulators {
> +                buck1: buck1 {
> +                    regulator-name = "buck1";
> +                    regulator-min-microvolt = <800000>;
> +                    regulator-max-microvolt = <2000000>;
> +                    regulator-always-on;
> +                    regulator-ramp-delay = <1250>;
> +                    rohm,dvs-run-voltage = <1150000>;
> +                    rohm,dvs-suspend-voltage = <950000>;
> +                };
> +                buck2: buck2 {
> +                    regulator-name = "buck2";
> +                    regulator-min-microvolt = <800000>;
> +                    regulator-max-microvolt = <2000000>;
> +                    regulator-always-on;
> +                    regulator-ramp-delay = <1250>;
> +                    rohm,dvs-run-voltage = <1150000>;
> +                    rohm,dvs-suspend-voltage = <950000>;
> +                };
> +                buck3: buck3 {
> +                    regulator-name = "buck3";
> +                    regulator-min-microvolt = <1200000>;
> +                    regulator-max-microvolt = <2700000>;
> +                    regulator-always-on;
> +                };
> +                buck4: buck4 {
> +                    regulator-name = "buck4";
> +                    regulator-min-microvolt = <1100000>;
> +                    regulator-max-microvolt = <1850000>;
> +                    regulator-always-on;
> +                };
> +                buck5: buck5 {
> +                    regulator-name = "buck5";
> +                    regulator-min-microvolt = <1800000>;
> +                    regulator-max-microvolt = <3300000>;
> +                    regulator-always-on;
> +                };
> +                ldo1: ldo1 {
> +                    regulator-name = "ldo1";
> +                    regulator-min-microvolt = <800000>;
> +                    regulator-max-microvolt = <3300000>;
> +                    regulator-always-on;
> +                };
> +                ldo2: ldo2 {
> +                    regulator-name = "ldo2";
> +                    regulator-min-microvolt = <800000>;
> +                    regulator-max-microvolt = <3300000>;
> +                    regulator-always-on;
> +                };
> +                ldo3: ldo3 {
> +                    regulator-name = "ldo3";
> +                    regulator-min-microvolt = <800000>;
> +                    regulator-max-microvolt = <3300000>;
> +                    regulator-always-on;
> +                };
> +                ldo4: ldo4 {
> +                    regulator-name = "ldo4";
> +                    regulator-min-microvolt = <800000>;
> +                    regulator-max-microvolt = <3300000>;
> +                    regulator-always-on;
> +                };
> +                ldo5: ldo5 {
> +                    regulator-name = "ldo5";
> +                    regulator-min-microvolt = <800000>;
> +                    regulator-max-microvolt = <3300000>;
> +                    regulator-always-on;
> +                };
> +                ldo6: ldodvref {
> +                    regulator-name = "ldodvref";
> +                    regulator-always-on;
> +                };
> +                ldo7: ldolpsr {
> +                    regulator-name = "ldolpsr";
> +                    regulator-always-on;
> +                };
> +
> +                boost: wled {
> +                    regulator-name = "wled";
> +                    regulator-min-microamp = <10>;
> +                    regulator-max-microamp = <25000>;
> +                };
> +            };
> +        };
> +    };
> -- 
> 2.25.4
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
