Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DFA931463B
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Feb 2021 03:26:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230494AbhBICZq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Feb 2021 21:25:46 -0500
Received: from mail-ot1-f48.google.com ([209.85.210.48]:45610 "EHLO
        mail-ot1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230518AbhBICZf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Feb 2021 21:25:35 -0500
Received: by mail-ot1-f48.google.com with SMTP id o12so16121776ote.12;
        Mon, 08 Feb 2021 18:25:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=b7/hT9qbKAcCgZkulvczbazF0JMvvFDDT1MyfQbTV/M=;
        b=W31bc+xcS/bA58mbT2xVR1DMqrwuRzRVbmfarxA+cC4q564g1JEw/ArgbfW18gWwO1
         alji95NP3Gztys35UdF436cdutfBAYmLouBPY7+Y/4geSr2A48Ij5HzFP1OLivN8I/LH
         RaIJqc9v0pTYC2//Pr6LL6Wm5nKAW4kwESfZTq62lobjmPonMDR4DMJdt21xfEHN3xeD
         HE9G0WuDB3xUCr/lvCESlrV0rEhF6axsd0CZD4n1ej5yovewtYU5N/jFNkq8nFTmNpY0
         a3hTavaVFxrHraz91vyzux/0bd2zYXUb16Yym4UPVOeFtPK54/WvdWuN9zjXsJrpfOKo
         7oXw==
X-Gm-Message-State: AOAM531znoxuIot3kwIztkxenXsGi3LtOftgqChELF33XN4INrGZTCuI
        zn2dE3PwE+iF6gECOieC8w==
X-Google-Smtp-Source: ABdhPJy88N6V2wn9GJhtKVQ+tIkvLGUG1M5/zEyTsNwVfQ8Z2M1/lSfT54EuY+fusEa/liPnIQVLkw==
X-Received: by 2002:a9d:32f4:: with SMTP id u107mr8469829otb.308.1612837492791;
        Mon, 08 Feb 2021 18:24:52 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 69sm4068450otc.76.2021.02.08.18.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 18:24:51 -0800 (PST)
Received: (nullmailer pid 2549095 invoked by uid 1000);
        Tue, 09 Feb 2021 02:24:50 -0000
Date:   Mon, 8 Feb 2021 20:24:50 -0600
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
Subject: Re: [PATCH v2 06/17] dt_bindings: regulator: Add ROHM BD71815 PMIC
 regulators
Message-ID: <20210209022450.GA2546257@robh.at.kernel.org>
References: <cover.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
 <950a87e680822ab6457ff95bba96730fed93e14d.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <950a87e680822ab6457ff95bba96730fed93e14d.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 19, 2021 at 09:17:09AM +0200, Matti Vaittinen wrote:
> Add binding documentation for regulators on ROHM BD71815 PMIC.
> 5 bucks, 7 LDOs and a boost for LED.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
> 
> Changes since v1:
> - Changed patch order to fix ref dependecy
> - Added missing schema for nodes wled, ldodvref, ldolpsr
> 
>  .../regulator/rohm,bd71815-regulator.yaml     | 116 ++++++++++++++++++
>  1 file changed, 116 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/rohm,bd71815-regulator.yaml
> 
> diff --git a/Documentation/devicetree/bindings/regulator/rohm,bd71815-regulator.yaml b/Documentation/devicetree/bindings/regulator/rohm,bd71815-regulator.yaml
> new file mode 100644
> index 000000000000..7d0adb74a396
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/rohm,bd71815-regulator.yaml
> @@ -0,0 +1,116 @@
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
> +
> +properties:
> +  wled:
> +    type: object
> +    description:
> +      properties for wled regulator
> +    $ref: regulator.yaml#
> +
> +    properties:
> +      regulator-name:
> +        const: wled
> +
> +patternProperties:
> +  "^((ldo|buck)[1-5]|ldolpsr|ldodvref)$":
> +    type: object
> +    description:
> +      Properties for single LDO/BUCK regulator.
> +    $ref: regulator.yaml#
> +
> +    properties:
> +      regulator-name:
> +        pattern: "^((ldo|buck)[1-5]|ldolpsr|ldodvref)$"
> +        description:
> +          should be "ldo1", ..., "ldo5", "buck1", ..., "buck5" and "ldolpsr"
> +          for ldolpsr regulator, "ldodvref" for ldodvref reglator.
> +
> +      rohm,vsel-gpios:
> +        description:
> +          GPIO used to control ldo4 state (when ldo4 is controlled by GPIO).
> +
> +      rohm,dvs-run-voltage:

Use standard unit suffix.

> +        description:
> +          PMIC "RUN" state voltage in uV when PMIC HW states are used. See
> +          comments below for bucks/LDOs which support this. 0 means
> +          regulator should be disabled at RUN state.
> +        $ref: "/schemas/types.yaml#/definitions/uint32"

And then drop this.

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

Same here.

> +        minimum: 0
> +        maximum: 3300000
> +
> +      rohm,dvs-suspend-voltage:
> +        description:
> +          PMIC "SUSPEND" state voltage in uV when PMIC HW states are used. See
> +          comments below for bucks/LDOs which support this. 0 means
> +          regulator should be disabled at SUSPEND state.
> +        $ref: "/schemas/types.yaml#/definitions/uint32"

And here.

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
