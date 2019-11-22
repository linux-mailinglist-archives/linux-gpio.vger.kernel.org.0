Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F4F8107ACE
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Nov 2019 23:48:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726568AbfKVWsk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Nov 2019 17:48:40 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:39657 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726526AbfKVWsj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Nov 2019 17:48:39 -0500
Received: by mail-oi1-f195.google.com with SMTP id v138so7975609oif.6;
        Fri, 22 Nov 2019 14:48:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rN+xXlHiqtwE2I732mBe4YEtOdoVVWt0shahQQ1i45E=;
        b=nvP07f099V0+hP3fXH6zVK/mOSKBBJLgfTadVnJlsiBeRbjosOOjaer8+pYZRm+SDc
         ZBjiNvpSpUGTlZko4lxD9FrthGYTpkvxvWG72WQA39j3bWTmtA0nrAZ0HWW1e/0VYCuP
         PviO7EQBT7iB4j7qG5h9ACEk0zCB5skMa0km1clbsrHFU+N2t16N9Z0QYK1WXis4T+s1
         eJO0YCsvKkxDw9DAfmW50JGhwdoFU0LydaMOraR+XWzJPULs6DJh9iq23qVAeldNLTbs
         YNaT8fcKZ1UQFMYWcti4Ig0m3Vj5j7DpY2d1vC9rRkOIbYAwgAIc7kABfz6nE4Ou417p
         aFow==
X-Gm-Message-State: APjAAAUma2TtgRmMWjQ2OP46EPkekrT9BpbeReldV1eX9uMiZlyWiuaS
        S/t3VvHOTLCKRFr4ykdnog==
X-Google-Smtp-Source: APXvYqwqXhlYdVOA8XmvWt0YO3nV0XXcoxh6FqvqjrFA1/yoNOu5VtpLAI7i/HQFdZ5mkGPvM/Umjw==
X-Received: by 2002:aca:b10a:: with SMTP id a10mr14438745oif.26.1574462918016;
        Fri, 22 Nov 2019 14:48:38 -0800 (PST)
Received: from localhost ([2607:fb90:bde:716a:c9ec:246b:67b7:9768])
        by smtp.gmail.com with ESMTPSA id 4sm2676245otc.77.2019.11.22.14.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2019 14:48:36 -0800 (PST)
Date:   Fri, 22 Nov 2019 16:48:34 -0600
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
Subject: Re: [PATCH v5 01/16] dt-bindings: regulator: Document ROHM BD71282
 regulator bindings
Message-ID: <20191122224834.GA9158@bogus>
References: <cover.1574059625.git.matti.vaittinen@fi.rohmeurope.com>
 <d29e0eb587b764f3ea77647392e45fac67bbd757.1574059625.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d29e0eb587b764f3ea77647392e45fac67bbd757.1574059625.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 18, 2019 at 08:53:57AM +0200, Matti Vaittinen wrote:
> Document ROHM BD71828 PMIC regulator device tree bindings.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
> 
> No changes from v4
> 
>  .../regulator/rohm,bd71828-regulator.yaml     | 122 ++++++++++++++++++
>  1 file changed, 122 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/rohm,bd71828-regulator.yaml
> 
> diff --git a/Documentation/devicetree/bindings/regulator/rohm,bd71828-regulator.yaml b/Documentation/devicetree/bindings/regulator/rohm,bd71828-regulator.yaml
> new file mode 100644
> index 000000000000..c23ec4d8584b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/rohm,bd71828-regulator.yaml
> @@ -0,0 +1,122 @@
> +# SPDX-License-Identifier: GPL-2.0-only

Please dual license new bindings:

(GPL-2.0-only OR BSD-2-Clause)

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/rohm,bd71828-regulator.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ROHM BD71828 Power Management Integrated Circuit regulators
> +
> +maintainers:
> +  - Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> +
> +description: |
> +  This module is part of the ROHM BD71828 MFD device. For more details
> +  see Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml.
> +
> +  The regulator controller is represented as a sub-node of the PMIC node
> +  on the device tree.
> +
> +  Regulator nodes should be named to BUCK_<number> and LDO_<number>.
> +  The valid names for BD71828 regulator nodes are
> +  BUCK1, BUCK2, BUCK3, BUCK4, BUCK5, BUCK6, BUCK7
> +  LDO1, LDO2, LDO3, LDO4, LDO5, LDO6, LDO7
> +
> +patternProperties:
> +  "^LDO[1-7]$":
> +    type: object
> +    allOf:
> +      - $ref: regulator.yaml#
> +    description:
> +      Properties for single LDO regulator.
> +
> +    properties:
> +      #Is there a nice way to check the name is same as node name but lower case

Nope.

Why not make the node names lower case? That's the preference though 
the regulator binding is special.

> +      regulator-name:
> +        pattern: "^ldo[1-7]$"
> +        description:
> +          should be "ldo1", ..., "ldo7"
> +
> +  "^BUCK[1-7]$":
> +    type: object
> +    allOf:
> +      - $ref: regulator.yaml#
> +    description:
> +      Properties for single BUCK regulator.
> +
> +    properties:
> +      #Is there a nice way to check the name is same as node name but lower case
> +      regulator-name:
> +        pattern: "^buck[1-7]$"
> +        description:
> +          should be "buck1", ..., "buck7"
> +
> +      rohm,dvs-run-voltage:
> +        allOf:
> +          - $ref: "/schemas/types.yaml#/definitions/uint32"
> +          - minimum: 0
> +            maximum: 3300000
> +        description:
> +          PMIC default "RUN" state voltage in uV. See below table for
> +          bucks which support this. 0 means disabled.
> +
> +      rohm,dvs-idle-voltage:
> +        allOf:
> +          - $ref: "/schemas/types.yaml#/definitions/uint32"
> +          - minimum: 0
> +            maximum: 3300000
> +        description:
> +          PMIC default "IDLE" state voltage in uV. See below table for
> +          bucks which support this. 0 means disabled.
> +
> +      rohm,dvs-suspend-voltage:
> +        allOf:
> +          - $ref: "/schemas/types.yaml#/definitions/uint32"
> +          - minimum: 0
> +            maximum: 3300000
> +        description:
> +          PMIC default "SUSPEND" state voltage in uV. See below table for
> +          bucks which support this. 0 means disabled.
> +
> +      rohm,dvs-lpsr-voltage:
> +        allOf:
> +          - $ref: "/schemas/types.yaml#/definitions/uint32"
> +          - minimum: 0
> +            maximum: 3300000
> +        description:
> +          PMIC default "LPSR" state voltage in uV. See below table for
> +          bucks which support this. 0 means disabled.
> +
> +#Supported default DVS states:
> +#buck		| run		| idle		| suspend	| lpsr
> +#----------------------------------------------------------------------------
> +#1, 2, 6, and 7	| supported	| supported	| 	supported (*)
> +#----------------------------------------------------------------------------
> +#3, 4, and 5	| 			supported (**)
> +#----------------------------------------------------------------------------
> +#(*)  LPSR and SUSPEND states use same voltage but both states have own enable /
> +#     disable settings. Voltage 0 can be specified for a state to make regulator
> +#     disabled on that state.
> +#(**) All states use same voltage but have own enable / disable settings.
> +#     Voltage 0 can be specified for a state to make regulator disabled on that
> +#     state.

Would be nicer if indented to the same level.

> +
> +      rohm,dvs-runlvl-ctrl:
> +        description: |
> +          buck control is done based on run-level. Regulator is not
> +          individually controllable. See ../mfd/rohm,bd71828-pmic.yaml for
> +          how to specify run-level control mechanism. Only bucks 1, 2, 6
> +          and 7 support this.
> +        type: boolean
> +
> +      rohm,dvs-runlevel-microvolts:
> +        minimum: 0
> +        maximum: 2000000
> +        maxItems: 4

Mixing array and scalar constraints.

maxItems: 4
items:
  minimum: 0
  maximum: 2000000


> +        description:
> +          Array of voltages for run-levels. First value is for run-level 0,
> +          second for run-level 1 etc. Microvolts.
> +
> +    required:
> +      - regulator-name
> +  additionalProperties: false
> +additionalProperties: false
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
