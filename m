Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E162FF0748
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 21:52:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727888AbfKEUwc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 15:52:32 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:33417 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725806AbfKEUwb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 15:52:31 -0500
Received: by mail-oi1-f193.google.com with SMTP id m193so18901615oig.0;
        Tue, 05 Nov 2019 12:52:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/XIB9kBX8rgCqucb9RY+pGi1vrT74BwyH3QkaAjqeZI=;
        b=sU8J6WEKTeOUi/7uzPBqqod/e15bObVKBzjM3DmmbRt2DSDY8DWUycW+z0japOkKVM
         o8WBDCuDOjBwzHYC/Jh7KXTdDU8uGnvlNEo23t1OERv/D2rGbenWj+NAavqAobfJcAzB
         BuJYJqcb0R52C2LaFfTuoiJsm9/Oikovv2WHHZ71WQHBkk07G7hJVuWXx6rllf+g4YU9
         upAbO7F/ky84yBE2QnFiCzpiS0Nq9rI4DPcyH4ncKy2VQRK5N3A7U5+ezuDQFPdHICj5
         LCaULAyPWzGG8pscO4+btjiaAjsnoNPLVktrU0WXWomfs02XrdqTPtf6QrDeXTcYFZP9
         mDHA==
X-Gm-Message-State: APjAAAWUPG5ply+1qvbBq3+pfvXpENKWT8Xwe/lwLRze7GfxRHAqaodE
        Qt+IDnvRyHFTomOe6b2FGg==
X-Google-Smtp-Source: APXvYqziVaKnSp1xfCY+f3pe1zGb9MsRO7KRl9lFwrGYmuJyVtsFZKoZqvFpq4JGdrLoT+WF5ro1Sw==
X-Received: by 2002:aca:4d8d:: with SMTP id a135mr895431oib.1.1572987150187;
        Tue, 05 Nov 2019 12:52:30 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id z6sm6504247otb.66.2019.11.05.12.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 12:52:29 -0800 (PST)
Date:   Tue, 5 Nov 2019 14:52:28 -0600
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
Subject: Re: [RFC PATCH v3 03/15] dt-bindings: regulator: Document ROHM
 BD71282 regulator bindings
Message-ID: <20191105205228.GB629@bogus>
References: <cover.1572606437.git.matti.vaittinen@fi.rohmeurope.com>
 <ce43bfd90455b14216262494f4ba4028827239c0.1572606437.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ce43bfd90455b14216262494f4ba4028827239c0.1572606437.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 01, 2019 at 01:31:46PM +0200, Matti Vaittinen wrote:
> Document ROHM BD71828 PMIC regulator device tree bindings.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
> 
> Changes from v2 - my first encounter with yaml :/
> 
>  .../regulator/rohm,bd71828-regulator.yaml     | 123 ++++++++++++++++++
>  1 file changed, 123 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/rohm,bd71828-regulator.yaml
> 
> diff --git a/Documentation/devicetree/bindings/regulator/rohm,bd71828-regulator.yaml b/Documentation/devicetree/bindings/regulator/rohm,bd71828-regulator.yaml
> new file mode 100644
> index 000000000000..60715d8b92df
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/rohm,bd71828-regulator.yaml
> @@ -0,0 +1,123 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/rohm,bd71828-regulator.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ROHM BD71828 Power Management Integrated Circuit regulators
> +
> +maintainers:
> +  - Liam Girdwood <lgirdwood@gmail.com>
> +  - Mark Brown <broonie@kernel.org>
> +  - Rob Herring <robh+dt@kernel.org>
> +  - Mark Rutland <mark.rutland@arm.com>
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

Well, lowercase nodenames are preferred... But still, no, there's not.

And I think you could just drop this and the nodename is used instead.

> +      regulator-name:
> +        description:
> +          should be "ldo1", ..., "ldo7"

You can at least do:

pattern: "^ldo[1-7]$"


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
> +        description:
> +          should be "buck1", ..., "buck7"
> +
> +      rohm,dvs-run-voltage:
> +        $ref: "/schemas/types.yaml#/definitions/uint32"
> +        description:
> +          PMIC default "RUN" state voltage in uV. See below table for
> +          bucks which support this.

Use standard unit-suffixes on all these (-microvolt). And then drop the 
$ref.

Any constraints on the range?

> +
> +      rohm,dvs-idle-voltage:
> +        $ref: "/schemas/types.yaml#/definitions/uint32"
> +        description:
> +          PMIC default "IDLE" state voltage in uV. See below table for
> +          bucks which support this.
> +
> +      rohm,dvs-suspend-voltage:
> +        $ref: "/schemas/types.yaml#/definitions/uint32"
> +        description:
> +          PMIC default "SUSPEND" state voltage in uV. See below table for
> +          bucks which support this.
> +
> +      rohm,dvs-lpsr-voltage:
> +        $ref: "/schemas/types.yaml#/definitions/uint32"
> +        description:
> +          PMIC default "LPSR" state voltage in uV. See below table for
> +          bucks which support this.
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
> +
> +      rohm,dvs-runlvl-ctrl:
> +        description: |
> +          buck control is done based on run-level. Regulator is not
> +          individually controllable. See ../mfd/rohm,bd71828-pmic.yaml for
> +          how to specify run-level control mechanism. Only bucks 1, 2, 6
> +          and 7 support this.
> +        type: boolean
> +
> +      rohm,dvs-runlevel0-voltage:
> +        $ref: "/schemas/types.yaml#/definitions/uint32"
> +        description:
> +          voltage for run-level 0. Microvolts.
> +
> +      rohm,dvs-runlevel1-voltage:
> +        $ref: "/schemas/types.yaml#/definitions/uint32"
> +        description:
> +          voltage for run-level 1. Microvolts.
> +
> +      rohm,dvs-runlevel2-voltage:
> +        $ref: "/schemas/types.yaml#/definitions/uint32"
> +        description:
> +          voltage for run-level 2. Microvolts.
> +
> +      rohm,dvs-runlevel3-voltage:
> +        $ref: "/schemas/types.yaml#/definitions/uint32"
> +        description:
> +          voltage for run-level 3. Microvolts.

Perhaps an array of 4 values for runlevel?

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
