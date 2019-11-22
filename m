Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68A6C107B0E
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Nov 2019 00:06:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbfKVXGa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Nov 2019 18:06:30 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:40226 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726089AbfKVXG3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Nov 2019 18:06:29 -0500
Received: by mail-oi1-f193.google.com with SMTP id d22so8007027oic.7;
        Fri, 22 Nov 2019 15:06:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wcKdGosymsUOVGdTEOvG7xsOelc+cJ0jqsZ9kEeoTLU=;
        b=HfHmMkPLb85EJ/k7lWISznfxeFVurta20ZXQeUPSxd9cYBbRT9VQy7RP+LbPDufa5I
         ybJL05i0ZSrFFfxrvtnTTnYiT2w7kJqtzLfCa2hZGGdJWUgzBhq/j+AKlqcVKOrMhZUa
         D65hmQ/sAqMvfHSLP65fpidGEqhwdMJc7v1cCbCwOIa9NK8xrPGr75QjzTnmgj/50BMs
         i9poR0O6j2A2jtlm4MwlsHGRT48uHNhURbDNVyLCLY9h88dvfYg1QJpDKu6QPBibtd8P
         bM0bO0xpbvyfsFl07oMTomCywM2YSMG0/siMAE1FWruSwjRwB0k9N1Y4zfPtqZy44c/P
         WCxw==
X-Gm-Message-State: APjAAAVF1toa9zvcozvtBQmFnFLgidrcKvx1eVLZwCUH8OmjeyPls9AQ
        r4MUmyNEGSTsfIEGAiajRA==
X-Google-Smtp-Source: APXvYqxS1S6F+xsos4EydjukJsMoPSKPksbCzJq60Zq8X4Yz8/1K7q1e+lZ/Sx+Fx33zpKLLzwZvrA==
X-Received: by 2002:aca:b38b:: with SMTP id c133mr13817416oif.2.1574463988188;
        Fri, 22 Nov 2019 15:06:28 -0800 (PST)
Received: from localhost ([2607:fb90:bde:716a:c9ec:246b:67b7:9768])
        by smtp.gmail.com with ESMTPSA id f62sm2517900oib.38.2019.11.22.15.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2019 15:06:27 -0800 (PST)
Date:   Fri, 22 Nov 2019 17:05:14 -0600
From:   Rob Herring <robh@kernel.org>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     mazziesaccount@gmail.com, Lee Jones <lee.jones@linaro.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jeff Kirsher <jeffrey.t.kirsher@intel.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Nicholas Mc Guire <hofrat@osadl.org>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH v5 03/16] dt-bindings: mfd: Document ROHM BD71828 bindings
Message-ID: <20191122230514.GB15812@bogus>
References: <cover.1574059625.git.matti.vaittinen@fi.rohmeurope.com>
 <00abd88e370ec155b0717413d324a1c96c01a13d.1574059625.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00abd88e370ec155b0717413d324a1c96c01a13d.1574059625.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 18, 2019 at 08:54:56AM +0200, Matti Vaittinen wrote:
> ROHM BD71828 Power management IC integrates 7 buck converters, 7 LDOs,
> a real-time clock (RTC), 3 GPO/regulator control pins, HALL input
> and a 32.768 kHz clock gate.
> 
> Document the dt bindings drivers are using.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
> 
> No changes from v4
> 
>  .../bindings/mfd/rohm,bd71828-pmic.yaml       | 249 ++++++++++++++++++
>  1 file changed, 249 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml b/Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml
> new file mode 100644
> index 000000000000..17ea9fa463e8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml
> @@ -0,0 +1,249 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/rohm,bd71828-pmic.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ROHM BD71828 Power Management Integrated Circuit bindings
> +
> +maintainers:
> +  - Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
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
> +
> +  reg:
> +    description:
> +      I2C slave address.
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +    description:
> +      The interrupt line the device is connected to.

The description here is not too useful, I'd drop it.

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
> +    maxItems: 1
> +    description:
> +      The parent clock connected to PMIC.

The description here is not too useful, I'd drop it.

> +
> +  "#clock-cells":
> +    const: 0
> +
> +  rohm,charger-sense-resistor-ohms:
> +    minimum: 10000000
> +    maximum: 50000000
> +    description: |
> +      BD71827 and BD71828 have SAR ADC for measuring charging currents.
> +      External sense resistor (RSENSE in data sheet) should be used. If some
> +      other but 30MOhm resistor is used the resistance value should be given
> +      here in Ohms.
> +
> +  regulators:
> +    $ref: ../regulator/rohm,bd71828-regulator.yaml
> +    description:
> +      List of child nodes that specify the regulators.
> +
> +  leds:
> +    $ref: ../leds/rohm,bd71828-leds.yaml
> +
> +  rohm,dvs-vsel-gpios:
> +    maxItems: 2
> +    description: |
> +      GPIOs used to control PMIC run-levels. Should describe two GPIOs.
> +      (See run-level control in data-sheet). If this property is omitted but
> +      some bucks are marked to be controlled by run-levels - then OTP option
> +      allowing run-level control via I2C is assumed.
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
