Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D51A63C7C00
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jul 2021 04:46:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237704AbhGNCth (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Jul 2021 22:49:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237705AbhGNCth (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Jul 2021 22:49:37 -0400
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com [IPv6:2607:f8b0:4864:20::c34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77FB9C0613EF
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jul 2021 19:46:46 -0700 (PDT)
Received: by mail-oo1-xc34.google.com with SMTP id 68-20020a4a00470000b0290258a7ff4058so235735ooh.10
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jul 2021 19:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cgV6xvF1DtRkfWmB2cqboiTr4fd4G4ciBbO2znVwTys=;
        b=WaszFHTXdDfJLzvOlsjOazKXpGizfc7eobnCb9TXjIw2gjE+qKl1XWj+sZNIKT+Ws7
         9ItE/DyErH3FwmUBLV3i+AkAsFnTAFRvMG4zepbyyuNZZkzGRCjYEhBQWCytP4QnXZki
         2F+/2msLt9qa3aDE1g+srPmFCATxkuEj+ilWFWoihbOuLG9eQR0sibFAPR+umM/Clbov
         U97cqRUj43ZpTSy46ovMvhWSCzqSDaF7gENxUQinVkA0+135uyivHLYiLqWCokmuG1IB
         EdYEaZCFWRxDsCBkQBLFa+UZJ1xgp/QJ2nhUGMfr0KhrPQZ1Xg3HFwnwXo1Z7MgTh6GN
         1/kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cgV6xvF1DtRkfWmB2cqboiTr4fd4G4ciBbO2znVwTys=;
        b=PqjkH/k1UtU3Q8KNYxC4uls0O+qKeyNVyHEeml+ovQDaboNfXeRvyL/b2Ay9Dx3Hao
         O2dbrxjBHybWL2dnOacz8N5ijVvs8z3bKJ1kw7QUFkq6fBXZzMttEM3WNWqalMXXaaNC
         Ltqd6ki3c+Mb81n0PY8+LGfycowhRWr3HAzkE9Ey6wXkBXqzIYgOFkY31xnUUyWboJAJ
         3RCPx20a/qaZyU85FZPxbt+kATaUqfEpp0fY1XJVV5mEqKPbIlsKBGNftDJCfswJgj5J
         PVxw2fWonmW7x60pXJ5hI8WpYmBzfAG5JdeYvPpHKNk9fVl2YAxXri7ovbn5nmoiwhph
         gyCQ==
X-Gm-Message-State: AOAM531YzFuKAQrH3GPH21hsi3uHnC8QvyMd3CyBxCoZStqaPDyv0us7
        fZbPPkiiWzIXuuElM5F3q4JYOQ==
X-Google-Smtp-Source: ABdhPJz5mCbUHrJOoO9BdHKGbES4ztyEbvHYamznMTEFnEeAAEmFBn2VKn3zwz42x0c+U2bgKm/YAQ==
X-Received: by 2002:a4a:18c2:: with SMTP id 185mr6167452ooo.6.1626230805694;
        Tue, 13 Jul 2021 19:46:45 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id x20sm218720otq.62.2021.07.13.19.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 19:46:45 -0700 (PDT)
Date:   Tue, 13 Jul 2021 21:46:42 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, kgunda@codeaurora.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH V5 1/2] dt-bindings: pinctrl: qcom-pmic-gpio: Convert
 qcom pmic gpio bindings to YAML
Message-ID: <YO5QErHuGaPhU41k@yoga>
References: <1625032241-3458-1-git-send-email-skakit@codeaurora.org>
 <1625032241-3458-2-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1625032241-3458-2-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed 30 Jun 00:50 CDT 2021, satya priya wrote:

> Convert Qualcomm PMIC GPIO bindings from .txt to .yaml format.
> 

Thanks for updating this Satya, this is looking quite good now. Just got
one issue with the definition of the state child node.

> Signed-off-by: satya priya <skakit@codeaurora.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
[..]
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
> new file mode 100644
> index 0000000..22c58de
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
> @@ -0,0 +1,259 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/qcom,pmic-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm PMIC GPIO block
> +
> +maintainers:
> +  - Bjorn Andersson <bjorn.andersson@linaro.org>
> +
> +description:
> +  This binding describes the GPIO block(s) found in the 8xxx series of
> +  PMIC's from Qualcomm.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - qcom,pm660-gpio
> +          - qcom,pm660l-gpio
> +          - qcom,pm6150-gpio
> +          - qcom,pm6150l-gpio
> +          - qcom,pm7325-gpio
> +          - qcom,pm8005-gpio
> +          - qcom,pm8008-gpio
> +          - qcom,pm8018-gpio
> +          - qcom,pm8038-gpio
> +          - qcom,pm8058-gpio
> +          - qcom,pm8150-gpio
> +          - qcom,pm8150b-gpio
> +          - qcom,pm8350-gpio
> +          - qcom,pm8350b-gpio
> +          - qcom,pm8350c-gpio
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
> +          - qcom,pmk8350-gpio
> +          - qcom,pmr735a-gpio
> +          - qcom,pmr735b-gpio
> +          - qcom,pms405-gpio
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

Not need for the '|', as the formatting isn't significant.

> +        The first cell will be used to define gpio number and the
> +        second denotes the flags for this gpio
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - gpio-controller
> +  - '#gpio-cells'
> +  - gpio-ranges
> +
> +patternProperties:
> +  '.*':

I would prefer this match to follow tlmm and go '-state$'

> +    anyOf:

Either we want the immediate child node to match gpio-pinctrl-state
or we want one of more children matching gpio-pinctrl-state, but not
both. So "oneOf".

> +      - $ref: "pinmux-node.yaml"
> +      - $ref: "pincfg-node.yaml"

The generic definition is not sufficient, you want this to be

	- $ref: "#/$defs/gpio-pinctrl-state"

> +      - patternProperties:
> +          ".*":

The subnodes of the state can be named whatever, so this (the .*) is
good.

> +            $ref: "#/$defs/gpio-pinctrl-state"
> +
> +$defs:
> +  gpio-pinctrl-state:

This is too generic, how about qcom-pmic-gpio-state?

> +    type: object
> +    anyOf:

I have this as "allOf" in the TLMM binding, not entirely sure what the
implications of anyOf here would be though...

> +      - $ref: "pinmux-node.yaml"
> +      - $ref: "pincfg-node.yaml"
> +    properties:
> +      pins:
> +        description: |
> +            List of gpio pins affected by the properties specified in
> +            this subnode.  Valid pins are
> +                 - gpio1-gpio10 for pm6150
> +                 - gpio1-gpio12 for pm6150l
> +                 - gpio1-gpio10 for pm7325
> +                 - gpio1-gpio4 for pm8005
> +                 - gpio1-gpio2 for pm8008
> +                 - gpio1-gpio6 for pm8018
> +                 - gpio1-gpio12 for pm8038
> +                 - gpio1-gpio40 for pm8058
> +                 - gpio1-gpio10 for pm8150 (holes on gpio2, gpio5,
> +                                            gpio7 and gpio8)
> +                 - gpio1-gpio12 for pm8150b (holes on gpio3, gpio4
> +                                             and gpio7)
> +                 - gpio1-gpio12 for pm8150l (hole on gpio7)
> +                 - gpio1-gpio4 for pm8916
> +                 - gpio1-gpio10 for pm8350
> +                 - gpio1-gpio8 for pm8350b
> +                 - gpio1-gpio9 for pm8350c
> +                 - gpio1-gpio38 for pm8917
> +                 - gpio1-gpio44 for pm8921
> +                 - gpio1-gpio36 for pm8941
> +                 - gpio1-gpio8 for pm8950 (hole on gpio3)
> +                 - gpio1-gpio22 for pm8994
> +                 - gpio1-gpio26 for pm8998
> +                 - gpio1-gpio22 for pma8084
> +                 - gpio1-gpio2 for pmi8950
> +                 - gpio1-gpio10 for pmi8994
> +                 - gpio1-gpio4 for pmk8350
> +                 - gpio1-gpio4 for pmr735a
> +                 - gpio1-gpio4 for pmr735b
> +                 - gpio1-gpio12 for pms405 (holes on gpio1, gpio9
> +                                            and gpio10)
> +                 - gpio1-gpio11 for pmx55 (holes on gpio3, gpio7, gpio10
> +                                            and gpio11)
> +
> +        items:
> +          pattern: "^gpio([0-9]+)$"
> +
> +      function:
> +        items:
> +          - enum:
> +              - normal
> +              - paired
> +              - func1
> +              - func2
> +              - dtest1
> +              - dtest2
> +              - dtest3
> +              - dtest4
> +              - func3  # supported by LV/MV GPIO subtypes
> +              - func4  # supported by LV/MV GPIO subtypes
> +
> +      bias-disable: true
> +      bias-pull-down: true
> +      bias-pull-up: true
> +
> +      qcom,pull-up-strength:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: |
> +            Specifies the strength to use for pull up, if selected.
> +            Valid values are defined in
> +            <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> +            If this property is omitted 30uA strength will be used
> +            if pull up is selected


enum: [0, 1, 2, 3]

> +
> +      bias-high-impedance: true
> +      input-enable: true
> +      output-high: true
> +      output-low: true
> +      power-source: true
> +
> +      qcom,drive-strength:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: |
> +            Selects the drive strength for the specified pins
> +            Valid drive strength values are defined in
> +            <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> +        enum: [0, 1, 2, 3]
> +
> +      drive-push-pull: true
> +      drive-open-drain: true
> +      drive-open-source: true
> +
> +      qcom,analog-pass:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description: |
> +            The specified pins are configured in
> +            analog-pass-through mode.
> +
> +      qcom,atest:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: |
> +            Selects ATEST rail to route to GPIO when it's
> +            configured in analog-pass-through mode.
> +        enum: [1, 2, 3, 4]
> +
> +      qcom,dtest-buffer:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: |
> +            Selects DTEST rail to route to GPIO when it's
> +            configured as digital input.
> +        enum: [1, 2, 3, 4]
> +
> +    required:
> +      - pins
> +      - function
> +
> +    additionalProperties: false
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
> +
> +      gpio-controller;
> +      gpio-ranges = <&pm8921_gpio 0 0 44>;
> +      #gpio-cells = <2>;
> +
> +      pm8921_gpio_keys: gpio-keys {

Per my above request of changing the pattern, this would have to be
"gpio-keys-state" instead.

Regards,
bjorn

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
