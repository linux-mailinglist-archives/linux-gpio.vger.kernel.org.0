Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D03E42F1EB3
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Jan 2021 20:11:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390639AbhAKTKh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Jan 2021 14:10:37 -0500
Received: from mail-oi1-f177.google.com ([209.85.167.177]:38449 "EHLO
        mail-oi1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387783AbhAKTKh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Jan 2021 14:10:37 -0500
Received: by mail-oi1-f177.google.com with SMTP id x13so460647oic.5;
        Mon, 11 Jan 2021 11:10:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WqmGS/srb/RdCujyvJUUWpr+tBBRlaVJyacWnpWs74E=;
        b=kH5GirgPkJ7aRDE+iJQ1hUaYAqFjAHmVteb+T35m6BrPjwzNVRMR6mTrhLBh4YECCt
         247UuwVHmTnwh4bqvn2dQgrodDdzfociL/qW2iRYf+HUWJqHdZa0rqUmHvtaooALPjNa
         MgMJPDrX98EFFcMSmto0tcN5mdRCH+mEcr7evlMNBeGm9MZUAebtMkkLSUucjSwsFcce
         mCCiH3FQHACerSJKRVlPtVlZMOn5VaiIbmbP57APylx1356dxhvYeaVXXkVdlQZuktzb
         CMRTT/0vmxpvLSPEGNMdHTyrydZus+fX8qN9IprnNlw2uPz3A/YVJmUe3z7z+qynv0As
         eGmg==
X-Gm-Message-State: AOAM533AHXEnb5lheRNCSJRvvHpnbWJMXqi7MPJc2fDkZkNBefXVJQhU
        oZmHI/Xplj8i75UOKMiXSg==
X-Google-Smtp-Source: ABdhPJxYn2jsCihd4TDATUiCJwnokVODaBO2xGxM4HmP6XxB9uJCuAhi5sISW16e/JthyRO70+nr1A==
X-Received: by 2002:aca:b343:: with SMTP id c64mr202394oif.156.1610392195513;
        Mon, 11 Jan 2021 11:09:55 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id b15sm137822otj.15.2021.01.11.11.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 11:09:54 -0800 (PST)
Received: (nullmailer pid 2901354 invoked by uid 1000);
        Mon, 11 Jan 2021 19:09:53 -0000
Date:   Mon, 11 Jan 2021 13:09:53 -0600
From:   Rob Herring <robh@kernel.org>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     mazziesaccount@gmail.com, Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-power@fi.rohmeurope.com, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 06/15] dt_bindings: regulator: Add ROHM BD71815 PMIC
 regulators
Message-ID: <20210111190953.GB2890911@robh.at.kernel.org>
References: <cover.1610110144.git.matti.vaittinen@fi.rohmeurope.com>
 <3ca03c3b76d6898c46ee645ddb5fa25cbfc62367.1610110144.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ca03c3b76d6898c46ee645ddb5fa25cbfc62367.1610110144.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 08, 2021 at 03:36:38PM +0200, Matti Vaittinen wrote:
> Add binding documentation for regulators on ROHM BD71815 PMIC.
> 5 bucks, 7 LDOs and a boost for LED.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
>  .../regulator/rohm,bd71815-regulator.yaml     | 104 ++++++++++++++++++
>  1 file changed, 104 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/rohm,bd71815-regulator.yaml
> 
> diff --git a/Documentation/devicetree/bindings/regulator/rohm,bd71815-regulator.yaml b/Documentation/devicetree/bindings/regulator/rohm,bd71815-regulator.yaml
> new file mode 100644
> index 000000000000..2aa21603698c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/rohm,bd71815-regulator.yaml
> @@ -0,0 +1,104 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/rohm,bd71815-regulator.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ROHM BD71815 Power Management Integrated Circuit regulators
> +
> +maintainers:
> +  - Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> +
> +description: |
> +  This module is part of the ROHM BD718215 MFD device. For more details
> +  see Documentation/devicetree/bindings/mfd/rohm,bd71815-pmic.yaml.
> +
> +  The regulator controller is represented as a sub-node of the PMIC node
> +  on the device tree.
> +
> +  The valid names for BD71815 regulator nodes are
> +  buck1, buck2, buck3, buck4, buck5,
> +  ldo1, ldo2, ldo3, ldo4, ldo5,
> +  ldodvref, ldolpsr, wled

No schema for the last 3?

> +
> +patternProperties:
> +  "^(ldo|buck)[1-5]$":
> +    type: object
> +    description:
> +      Properties for single LDO/BUCK regulator.
> +    $ref: regulator.yaml#
> +
> +    properties:
> +      regulator-name:
> +        pattern: "^(ldo|buck)[1-5]$"
> +        description:
> +          should be "ldo1", ..., "ldo5" and "buck1", ..., "buck5"
> +
> +      rohm,vsel-gpios:
> +        description:
> +          GPIO used to control ldo4 state (when ldo4 is controlled by GPIO).
> +
> +      rohm,dvs-run-voltage:

These should have a unit suffix.

> +        description:
> +          PMIC "RUN" state voltage in uV when PMIC HW states are used. See
> +          comments below for bucks/LDOs which support this. 0 means
> +          regulator should be disabled at RUN state.
> +        $ref: "/schemas/types.yaml#/definitions/uint32"
> +        minimum: 0
> +        maximum: 3300000
> +
> +      rohm,dvs-snvs-voltage:
> +        description:
> +          Whether to keep regulator enabled at "SNVS" state or not.
> +          0 means regulator should be disabled at SNVS state, non zero voltage
> +          keeps regulator enabled. BD71815 does not change voltage level
> +          when PMIC transitions to SNVS.SNVS voltage depends on the previous
> +          state (from which the PMIC transitioned to SNVS).
> +        $ref: "/schemas/types.yaml#/definitions/uint32"
> +        minimum: 0
> +        maximum: 3300000
> +
> +      rohm,dvs-suspend-voltage:
> +        description:
> +          PMIC "SUSPEND" state voltage in uV when PMIC HW states are used. See
> +          comments below for bucks/LDOs which support this. 0 means
> +          regulator should be disabled at SUSPEND state.
> +        $ref: "/schemas/types.yaml#/definitions/uint32"
> +        minimum: 0
> +        maximum: 3300000
> +
> +      rohm,dvs-lpsr-voltage:
> +        description:
> +          PMIC "LPSR" state voltage in uV when PMIC HW states are used. See
> +          comments below for bucks/LDOs which support this. 0 means
> +          regulator should be disabled at LPSR state.
> +        $ref: "/schemas/types.yaml#/definitions/uint32"
> +        minimum: 0
> +        maximum: 3300000
> +
> +        # Bucks 1 and 2 support giving separate voltages for operational states
> +        # (RUN /CLEAN according to data-sheet) and non operational states
> +        # (LPSR/SUSPEND). The voltage is automatically changed when HW
> +        # state changes. Omitting these properties from bucks 1 and 2 leave
> +        # buck voltages to not be toggled by HW state. Enable status may still
> +        # be toggled by state changes depending on HW default settings.
> +        #
> +        # Bucks 3-5 and ldos 1-5 support setting the RUN state voltage here.
> +        # Given RUN voltage is used at all states if regulator is enabled at
> +        # given state.
> +        # Values given for other states are regarded as enable/disable at
> +        # given state (see below).
> +        #
> +        # All regulators except WLED support specifying enable/disable status
> +        # for each of the HW states (RUN/SNVS/SUSPEND/LPSR). HW defaults can
> +        # be overridden by setting voltage to 0 (regulator disabled at given
> +        # state) or non-zero (regulator enabled at given state). Please note
> +        # that setting non zero voltages for bucks 1/2 will also enable voltage
> +        # changes according to state change.
> +
> +    required:
> +      - regulator-name
> +
> +    unevaluatedProperties: false
> +
> +additionalProperties: false
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
