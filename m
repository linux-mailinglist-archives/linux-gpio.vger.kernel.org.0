Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89FF83A3ABD
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jun 2021 06:09:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229510AbhFKELC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Jun 2021 00:11:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231143AbhFKELB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Jun 2021 00:11:01 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACB48C0617AD
        for <linux-gpio@vger.kernel.org>; Thu, 10 Jun 2021 21:08:50 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id t40so4521577oiw.8
        for <linux-gpio@vger.kernel.org>; Thu, 10 Jun 2021 21:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Np3k6CK9NjalVZtaexn2XbHqvBfeGTYroieMiT0qCqE=;
        b=o2V9o9YdQb6tLPXwkx7DQI31/snWFD/wNJg6E3+jdN5/4R/Y7AKaZvo3QZ+XjHRrng
         h1aVwNLMlPvuLjT2n/21DhCigvWK+p+hB0y+EpSxOLxhtESv12pb6GwwWrkEBU2UXUh/
         ATpC1W+iPebELDOkgZaWBsJkOI9ct5jAvWOsYUijf8zn3Pq5z2UGDrjZ9OqsLtc6p1zT
         pdAHUZbecdzk+/fwQZvR4jTN74hCDZmJcEk6vRsUfRqbIY1vxIn3Dia61HCbvieTbSAv
         QxGnWDP3gtMgDD+BwDdSR5DEHV57z1W0ytC9lLruVcJSiSl6399jvjo8+Q9gNQN+cKgU
         oVSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Np3k6CK9NjalVZtaexn2XbHqvBfeGTYroieMiT0qCqE=;
        b=alKd/4CqFZJDVc8wz4YX2e7Lkqe3GuAQ1o2yrZUbJ87X4pqZK34FfdJ/lk1cbDrWeJ
         00lIDbtwlBa+YqZeZbAo5Cp4gE8yMtMf6MmZd33BbtZdZU1MCBl7g2OGD+NzY47kreHc
         m6fBJVhe1WUYuFPGTEI/cFEqfRfb092LBdK79Che0G0fdiADuDvIVbEanjUHSogk5R7h
         P4ZWY5E2ngOVVvZQLLN0a5xNvhgtgZOx9yqbBAS3YSpymKctesnaxSMi0y1+oAqlrxV2
         sR5ZwTuObK5I525IQQWnSML1J4thXq/qIGd+yzMdzGOfS/agOZA/G/DYxs2d4LITMA++
         LQNQ==
X-Gm-Message-State: AOAM530BPlmSYIAdfC2bRFN6tAw2OdpoiQnwVg4IYBFAFz7T9iMC1vsI
        wP+/WvVugExd0is0nq5fl5zwPw==
X-Google-Smtp-Source: ABdhPJzWEjcBbx8kFeB+uFJXKM84tlfmpPgMIWKdCWOMQeFiq69vKBN7Dq/fjfBm+lievXEBVtLqow==
X-Received: by 2002:aca:ab15:: with SMTP id u21mr12474126oie.155.1623384529975;
        Thu, 10 Jun 2021 21:08:49 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id d12sm1040897otf.65.2021.06.10.21.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 21:08:49 -0700 (PDT)
Date:   Thu, 10 Jun 2021 23:08:47 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, kgunda@codeaurora.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH V4] dt-bindings: pinctrl: qcom-pmic-gpio: Convert qcom
 pmic gpio bindings to YAML
Message-ID: <YMLhzxMpbSRQac+P@builder.lan>
References: <1621578615-4613-1-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1621578615-4613-1-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri 21 May 01:30 CDT 2021, satya priya wrote:

> Convert Qualcomm PMIC GPIO bindings from .txt to .yaml format.
> 

While the structure of the binding is a proper binding, the definition
of the pinctrl states doesn't properly represent what we need to be able
to describe with this binding; see below.

[..]
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
> new file mode 100644
> index 0000000..d9024eb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
> @@ -0,0 +1,256 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/qcom,pmic-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm PMIC GPIO block
> +
> +maintainers:
> +  - Bjorn Andersson <bjorn.andersson@sonymobile.com>

Please make that bjorn.andersson@linaro.org

> +
> +description: |

I don't think you need this defined in literal style, so omit the '|'

> +  This binding describes the GPIO block(s) found in the 8xxx series of
> +  PMIC's from Qualcomm.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - qcom,pm8005-gpio
> +          - qcom,pm8018-gpio
> +          - qcom,pm8038-gpio
> +          - qcom,pm8058-gpio
> +          - qcom,pm8916-gpio
> +          - qcom,pm8917-gpio
> +          - qcom,pm8921-gpio
> +          - qcom,pm8941-gpio
> +          - qcom,pm8950-gpio
> +          - qcom,pm8994-gpio
> +          - qcom,pm8998-gpio
> +          - qcom,pma8084-gpio
> +          - qcom,pmi8950-gpio
> +          - qcom,pmi8994-gpio
> +          - qcom,pmi8998-gpio
> +          - qcom,pms405-gpio
> +          - qcom,pm660-gpio

Please keep these sorted alphabetically.

> +          - qcom,pm660l-gpio
> +          - qcom,pm8150-gpio
> +          - qcom,pm8150b-gpio
> +          - qcom,pm8350-gpio
> +          - qcom,pm8350b-gpio
> +          - qcom,pm8350c-gpio
> +          - qcom,pmk8350-gpio
> +          - qcom,pm6150-gpio
> +          - qcom,pm6150l-gpio
> +          - qcom,pm7325-gpio
> +          - qcom,pmr735a-gpio
> +          - qcom,pmr735b-gpio
> +          - qcom,pm8008-gpio
> +          - qcom,pmx55-gpio
> +
> +      - enum:
> +          - qcom,spmi-gpio
> +          - qcom,ssbi-gpio
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    minItems: 1
> +    maxItems: 44
> +    description: |
> +        Must contain an array of encoded interrupt specifiers for
> +        each available GPIO

We no longer specify "interrupts" but it seems we forgot to update the
binding. So perhaps it's the right thing to keep it as part of the
conversion and add a second patch that removes this.

> +
> +  '#interrupt-cells':
> +    const: 2
> +
> +  interrupt-controller: true
> +
> +  gpio-controller: true
> +
> +  gpio-ranges:
> +    maxItems: 1
> +
> +  '#gpio-cells':
> +    const: 2
> +    description: |
> +        The first cell will be used to define gpio number and the
> +        second denotes the flags for this gpio
> +
> +  gpio-keys:

This is the name of the pinctrl state defined in the example, as defined
here we will only ever be able to describe the volume keys.

You need to describe all valid states - and you need to support the two
different nesting of the properties.

See qcom,tlmm-common.yaml and how we use that in the various bindings.

> +    type: object
> +    properties:
> +      volume-keys:
> +        type: object
> +        anyOf:
> +          - $ref: "pinmux-node.yaml"
> +          - $ref: "pincfg-node.yaml"
> +        properties:
> +          pins:
> +            description: |
> +                List of gpio pins affected by the properties specified in
> +                this subnode.  Valid pins are
> +                     - gpio1-gpio4 for pm8005
> +                     - gpio1-gpio6 for pm8018
> +                     - gpio1-gpio12 for pm8038
> +                     - gpio1-gpio40 for pm8058
> +                     - gpio1-gpio4 for pm8916
> +                     - gpio1-gpio38 for pm8917
> +                     - gpio1-gpio44 for pm8921
> +                     - gpio1-gpio36 for pm8941
> +                     - gpio1-gpio8 for pm8950 (hole on gpio3)
> +                     - gpio1-gpio22 for pm8994
> +                     - gpio1-gpio26 for pm8998
> +                     - gpio1-gpio22 for pma8084
> +                     - gpio1-gpio2 for pmi8950
> +                     - gpio1-gpio10 for pmi8994
> +                     - gpio1-gpio12 for pms405 (holes on gpio1, gpio9
> +                                                and gpio10)
> +                     - gpio1-gpio10 for pm8150 (holes on gpio2, gpio5,
> +                                                gpio7 and gpio8)
> +                     - gpio1-gpio12 for pm8150b (holes on gpio3, gpio4
> +                                                 and gpio7)
> +                     - gpio1-gpio12 for pm8150l (hole on gpio7)
> +                     - gpio1-gpio10 for pm8350
> +                     - gpio1-gpio8 for pm8350b
> +                     - gpio1-gpio9 for pm8350c
> +                     - gpio1-gpio4 for pmk8350
> +                     - gpio1-gpio10 for pm6150
> +                     - gpio1-gpio12 for pm6150l
> +                     - gpio1-gpio10 for pm7325
> +                     - gpio1-gpio4 for pmr735a
> +                     - gpio1-gpio4 for pmr735b
> +                     - gpio1-gpio2 for pm8008
> +                     - gpio1-gpio11 for pmx55 (holes on gpio3, gpio7, gpio10
> +                                                and gpio11)
> +
> +            items:
> +              pattern: "^gpio([0-9]+)$"
> +
> +          function:
> +            items:
> +              - enum:
> +                  - normal
> +                  - paired
> +                  - func1
> +                  - func2
> +                  - dtest1
> +                  - dtest2
> +                  - dtest3
> +                  - dtest4
> +                  - func3  # supported by LV/MV GPIO subtypes
> +                  - func4  # supported by LV/MV GPIO subtypes
> +
> +          bias-disable: true
> +
> +          bias-pull-down: true
> +
> +          bias-pull-up: true
> +
> +          qcom,pull-up-strength:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            description: |
> +                Specifies the strength to use for pull up, if selected.
> +                Valid values are defined in
> +                <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> +                If this property is omitted 30uA strength will be used
> +                if pull up is selected
> +
> +          bias-high-impedance: true
> +
> +          input-enable: true
> +
> +          output-high: true
> +
> +          output-low: true
> +
> +          power-source: true
> +
> +          qcom,drive-strength:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            description: |
> +                Selects the drive strength for the specified pins
> +                Valid drive strength values are defined in
> +                <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> +            enum: [0, 1, 2, 3]
> +
> +          drive-push-pull: true
> +
> +          drive-open-drain: true
> +
> +          drive-open-source: true
> +
> +          qcom,analog-pass:
> +            $ref: /schemas/types.yaml#/definitions/flag
> +            description: |
> +                The specified pins are configured in
> +                analog-pass-through mode.
> +
> +          qcom,atest:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            description: |
> +                Selects ATEST rail to route to GPIO when it's
> +                configured in analog-pass-through mode.
> +            enum: [1, 2, 3, 4]
> +
> +          qcom,dtest-buffer:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            description: |
> +                Selects DTEST rail to route to GPIO when it's
> +                configured as digital input.
> +            enum: [1, 2, 3, 4]
> +
> +        required:
> +          - pins
> +          - function
> +
> +        additionalProperties: false
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg

I think it makes sense to require gpio-controller, '#gpio-cells',
gpio-ranges and interrupt-controller as well.

> +
> +examples:
> +  - |
> +    #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> +
> +    pm8921_gpio: gpio@150 {
> +      compatible = "qcom,pm8921-gpio", "qcom,ssbi-gpio";
> +      reg = <0x150 0x160>;
> +      interrupts = <192 1>, <193 1>, <194 1>,
> +                   <195 1>, <196 1>, <197 1>,
> +                   <198 1>, <199 1>, <200 1>,
> +                   <201 1>, <202 1>, <203 1>,
> +                   <204 1>, <205 1>, <206 1>,
> +                   <207 1>, <208 1>, <209 1>,
> +                   <210 1>, <211 1>, <212 1>,
> +                   <213 1>, <214 1>, <215 1>,
> +                   <216 1>, <217 1>, <218 1>,
> +                   <219 1>, <220 1>, <221 1>,
> +                   <222 1>, <223 1>, <224 1>,
> +                   <225 1>, <226 1>, <227 1>,
> +                   <228 1>, <229 1>, <230 1>,
> +                   <231 1>, <232 1>, <233 1>,
> +                   <234 1>, <235 1>;

As noted above, this list of interrupts should be omitted from the
example - but better done separate from the conversion patch.

Thanks,
Bjorn

> +
> +      gpio-controller;
> +      #gpio-cells = <2>;
> +
> +      pm8921_gpio_keys: gpio-keys {
> +        volume-keys {
> +          pins = "gpio20", "gpio21";
> +          function = "normal";
> +
> +          input-enable;
> +          bias-pull-up;
> +          drive-push-pull;
> +          qcom,drive-strength = <PMIC_GPIO_STRENGTH_NO>;
> +          power-source = <PM8921_GPIO_S4>;
> +        };
> +      };
> +    };
> +...
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
> of Code Aurora Forum, hosted by The Linux Foundation
> 
