Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 384B2107B02
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Nov 2019 00:00:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726568AbfKVXAP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Nov 2019 18:00:15 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:34094 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726089AbfKVXAO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Nov 2019 18:00:14 -0500
Received: by mail-oi1-f196.google.com with SMTP id l202so8041790oig.1;
        Fri, 22 Nov 2019 15:00:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9LwCRvhO7R94JulpPxLdqzrBMeyFJ+AqBIaV+PL8C7U=;
        b=EszKpTRlT22qGn2Gx0Gm+fQIaim4PbywWaxkDP5734I4JVRtNN93/5ICLrx9hMzU+O
         zOHjeyrr+69jO6v2qAPr8vw6iDc9t0ucM/mzQzcWxjYj1lhC9E1jKEuvD4DZ61pbG0r4
         1VvLjNfouGI8mT6ZmaYxl/7D6Jw3WwznNEsrpsMo7oMc++hRsIT/c6HoCzwe57bVa1eZ
         QK/yTOSV70hq0RCmXGOKv+rbwC1R3Da1NjzQ9GPasXSZuINnh82GAHgQtfCfF536m0pR
         6+z5OjKJqEBj8TuSHv4j6AmaLje7cHMto7AtyCe0Mu3bfBNsyHNrRrOZ3SdVamoi2KHQ
         1uMA==
X-Gm-Message-State: APjAAAV9d8RXPXqm0xcGVOzEcuwEzjXlGiFc9Uaa7lDrQtFbzHHN91Mn
        OvhO3VNw1Xl8SDGglOhe7g==
X-Google-Smtp-Source: APXvYqwTL8bjFI5tVNQBBTCNhP02sJX9ZPEHD4VPjeQbl6c0C/OqMqJKLEX0e8Ab52Vqg3PRv0jP0Q==
X-Received: by 2002:aca:ed0f:: with SMTP id l15mr13707382oih.111.1574463613504;
        Fri, 22 Nov 2019 15:00:13 -0800 (PST)
Received: from localhost ([2607:fb90:bde:716a:c9ec:246b:67b7:9768])
        by smtp.gmail.com with ESMTPSA id p3sm2667296oti.22.2019.11.22.15.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2019 15:00:12 -0800 (PST)
Date:   Fri, 22 Nov 2019 17:00:11 -0600
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
Subject: Re: [PATCH v5 02/16] dt-bindings: leds: ROHM BD71282 PMIC LED driver
Message-ID: <20191122230011.GA15812@bogus>
References: <cover.1574059625.git.matti.vaittinen@fi.rohmeurope.com>
 <acbac03f409dd531ad58d094b1605e5752e5a17d.1574059625.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acbac03f409dd531ad58d094b1605e5752e5a17d.1574059625.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 18, 2019 at 08:54:25AM +0200, Matti Vaittinen wrote:
> Document ROHM BD71828 PMIC LED driver device tree bindings.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
> 
> No changes from v4
> 
>  .../bindings/leds/rohm,bd71828-leds.yaml      | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/rohm,bd71828-leds.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/rohm,bd71828-leds.yaml b/Documentation/devicetree/bindings/leds/rohm,bd71828-leds.yaml
> new file mode 100644
> index 000000000000..e72c9ae0fc2a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/rohm,bd71828-leds.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: GPL-2.0-only

Dual license please.

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/rohm,bd71828-leds.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ROHM BD71828 Power Management Integrated Circuit LED driver
> +
> +maintainers:
> +  - Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> +
> +description: |
> +  This module is part of the ROHM BD71828 MFD device. For more details
> +  see Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml.
> +
> +  The LED controller is represented as a sub-node of the PMIC node on the device
> +  tree.
> +
> +  The device has two LED outputs referred as GRNLED and AMBLED in data-sheet.

Since you include this from the MFD schema, add a 'select: false' here 
or this node gets checked twice.

> +
> +properties:
> +  compatible:
> +    const: rohm,bd71828-leds
> +
> +patternProperties:
> +  "^led-[1-2]$":
> +    type: object
> +    description:
> +      Properties for a single LED.
> +    properties:
> +      #$ref: "common.yaml#"

Will need to be:

allOf:
  - $ref: ...

> +      rohm,led-compatible:
> +        description: LED identification string
> +        allOf:
> +          - $ref: "/schemas/types.yaml#/definitions/string"
> +          - oneOf:
> +            - const: bd71828-ambled
> +            - const: bd71828-grnled

Use enum rather than oneOf+const

> +      function:
> +        description:
> +          Purpose of LED as defined in dt-bindings/leds/common.h
> +        $ref: "/schemas/types.yaml#/definitions/string"
> +      color:
> +        description:
> +          LED colour as defined in dt-bindings/leds/common.h
> +        $ref: "/schemas/types.yaml#/definitions/uint32"
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
