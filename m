Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 205E8F0761
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 21:57:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725806AbfKEU5V (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 15:57:21 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:35109 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729632AbfKEU5U (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 15:57:20 -0500
Received: by mail-oi1-f195.google.com with SMTP id n16so18903672oig.2;
        Tue, 05 Nov 2019 12:57:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YH8No3YE+SfIIhr1pRJYlkmraO4srBIJPhAWx/BUo7o=;
        b=LtJCMP9BEuJo7AoGc9whEW4mnbuPZPsc+twyDY6qbUHYR6y48eKt9sSOr024qIZMpC
         +vBPT3LwkjdhPd8/zomVZvQJYCTFUTe3Na+3wWdneNNiuZy0hk4pTjTYjw8Z4aojRiGN
         1dMAu7b2yoLyaCXjMxGJOtwYumKQVUkkSp9CNNB2m8j1qDWIk6gM9k6V83Q+U3nx5pEq
         0XkkGLCXoN6OSU63kzVaLamiCLKMlunMLgpmHv3PJG1W0p26OWQfJDGc0Wc05EBv5HTK
         V9kabL72vZ/VYqQXAKuMVkp51jG3O1tN28DXCyTqLfAm7ZxD43kfT3cEbOoVglm+SV56
         AISA==
X-Gm-Message-State: APjAAAV1sf4kuI/iLEkWfM8e5uV/g4ZlAASe7p8y/PImIdU9nCZ+pf3Z
        uWfjp2gcTFKOqN1PnI6mJQ==
X-Google-Smtp-Source: APXvYqz4PTn4LH3MKQJeJhit6JeqNJpYt06BezFqeq80P3WV6oQcYKUwj76O8XCo+mV0pvazH22q3A==
X-Received: by 2002:aca:ecd0:: with SMTP id k199mr873786oih.166.1572987439487;
        Tue, 05 Nov 2019 12:57:19 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id o18sm6597103otj.38.2019.11.05.12.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 12:57:18 -0800 (PST)
Date:   Tue, 5 Nov 2019 14:57:18 -0600
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
Subject: Re: [RFC PATCH v3 04/15] dt-bindings: leds: ROHM BD71282 PMIC LED
 driver
Message-ID: <20191105205718.GC629@bogus>
References: <cover.1572606437.git.matti.vaittinen@fi.rohmeurope.com>
 <f9178204ea3925b454ecbe58df4c297fec346a4f.1572606437.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f9178204ea3925b454ecbe58df4c297fec346a4f.1572606437.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 01, 2019 at 01:32:33PM +0200, Matti Vaittinen wrote:
> Document ROHM BD71828 PMIC LED driver device tree bindings.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
> 
> Changes from v2 - new patch
> 
>  .../bindings/leds/rohm,leds-bd71828.yaml      | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/rohm,leds-bd71828.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/rohm,leds-bd71828.yaml b/Documentation/devicetree/bindings/leds/rohm,leds-bd71828.yaml
> new file mode 100644
> index 000000000000..d8aeac9911ef
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/rohm,leds-bd71828.yaml
> @@ -0,0 +1,46 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/rohm,leds-bd71828.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ROHM BD71828 Power Management Integrated Circuit LED driver
> +
> +maintainers:
> +  - Jacek Anaszewski <jacek.anaszewski@gmail.com>
> +  - Pavel Machek <pavel@ucw.cz>
> +  - Dan Murphy <dmurphy@ti.com>
> +  - Rob Herring <robh+dt@kernel.org>
> +  - Mark Rutland <mark.rutland@arm.com>
> +
> +description: |
> +  This module is part of the ROHM BD71828 MFD device. For more details
> +  see Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml.
> +
> +  The LED controller is represented as a sub-node of the PMIC node on the device
> +  tree.
> +
> +  The device has two LED outputs referred as GRNLED and AMBLED in data-sheet.
> +
> +properties:
> +  compatible:
> +    const: rohm,bd71828-led
> +
> +patternProperties:
> +  "^led-[1-2]$":
> +    type: object
> +    description:
> +      Properties for a single LED. Nodes must be named as led-1 and led-2.
> +    properties:
> +      #$ref: "common.yaml#"
> +      function:
> +        description:
> +          Purpose of LED as defined in dt-bindings/leds/common.h
> +        $ref: "/schemas/types.yaml#/definitions/string"
> +      color:
> +        description:
> +          LED colour as defined in dt-bindings/leds/common.h
> +        $ref: "/schemas/types.yaml#/definitions/uint32"

You can assume that we will have a common schema for these. So the only 
thing needed is whether you use the properties ("true" is enough for 
that), any additional constraints (not likely here), and whether 
required or not.

> +
> +required:
> +  - compatible
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
