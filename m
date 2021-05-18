Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56E57386E8F
	for <lists+linux-gpio@lfdr.de>; Tue, 18 May 2021 02:55:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345206AbhERA4v (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 May 2021 20:56:51 -0400
Received: from mail-oi1-f173.google.com ([209.85.167.173]:33318 "EHLO
        mail-oi1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238397AbhERA4v (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 May 2021 20:56:51 -0400
Received: by mail-oi1-f173.google.com with SMTP id b25so8269310oic.0;
        Mon, 17 May 2021 17:55:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wGTUJVaGi2vt0X1DPJ7HK4WSdmnqY5nH6zbfoY0v/ZM=;
        b=tegbHOriLuSxsgN7gTPAU13b67VS/jUtXrdfGclU3rkz6ev31gYDIkE3DCcFkO72Hl
         aKWcPLwrjWrX5k2trTR54gSED2FOk29I1lOeDd0VSUUAMy233vzyne5d1oB/DIQmlHvO
         K3CZoPNWd2c620sjNjcnwa7E+Ga7H4lGUBTnsn9Ce/be7f28l4mMVvVb/iLEhguLwzhO
         F95+gR2naexqglmlWz4Z2fAq/zx5FiSVwnrKbcTaq7o8LzoE1tkivivhrzE9XpK/v3E0
         VQ+W11seVWFC9RRc4IGQ6PgWk6VxslpdfaDzHjg1gbA75UE2bFNkc2nHUmC3uduAfHDy
         syWQ==
X-Gm-Message-State: AOAM532/C+UiEZ2f+38sGHP+lIoDbxSue6rChKajFTj+K0DLaVdlXx9I
        f6AVwc9nQ9VniZIvSWXW5drOKdM0/Q==
X-Google-Smtp-Source: ABdhPJx9y6NYXD/QSwdJQBZpXT3hnfJO77xc5bRiLZ0+Wo1uzpD0xR2XaeaNda9tMrrOGvAC0Q1aWQ==
X-Received: by 2002:aca:47ca:: with SMTP id u193mr1424602oia.69.1621299332631;
        Mon, 17 May 2021 17:55:32 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id o20sm3385995oos.19.2021.05.17.17.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 17:55:32 -0700 (PDT)
Received: (nullmailer pid 3548426 invoked by uid 1000);
        Tue, 18 May 2021 00:55:31 -0000
Date:   Mon, 17 May 2021 19:55:31 -0500
From:   Rob Herring <robh@kernel.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        kgunda@codeaurora.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH V3 3/3] dt-bindings: pinctrl: qcom-pmic-gpio: Convert
 qcom pmic gpio bindings to YAML
Message-ID: <20210518005531.GA3539579@robh.at.kernel.org>
References: <1620817988-18809-1-git-send-email-skakit@codeaurora.org>
 <1620817988-18809-4-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1620817988-18809-4-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 12, 2021 at 04:43:08PM +0530, satya priya wrote:
> Convert Qualcomm PMIC GPIO bindings from .txt to .yaml format.
> 
> Signed-off-by: satya priya <skakit@codeaurora.org>
> ---
> Changes in V3:
>  - As per Rob's comments fixed bot erros.
>  - Moved this patch to end of the series so that other patches are not
>    blocked on this.
> 
> Changes in V4:
>  - As per Rob's comments, added maxItems for reg and interrupts.
>    Added reference of "pinmux-node.yaml" and "pincfg-node.yaml".
>    Made 'additionalProperties' as false.
> 
>  .../devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 288 ---------------------
>  .../bindings/pinctrl/qcom,pmic-gpio.yaml           | 245 ++++++++++++++++++
>  2 files changed, 245 insertions(+), 288 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml


> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
> new file mode 100644
> index 0000000..85381a0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
> @@ -0,0 +1,245 @@
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
> +
> +description: |
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
> +          - qcom,pm660l-gpio
> +          - qcom,pm8150-gpio
> +          - qcom,pm8150b-gpio
> +          - qcom,pm6150-gpio
> +          - qcom,pm6150l-gpio
> +          - qcom,pmx55-gpio
> +          - qcom,pm7325-gpio
> +          - qcom,pm8350c-gpio
> +          - qcom,pmk8350-gpio
> +          - qcom,pmr735a-gpio
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

Please say something about what the 1-44 interrupts are if you can't 
define each one.

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
> +                     - gpio1-gpio10 for pm6150
> +                     - gpio1-gpio12 for pm6150l
> +                     - gpio1-gpio10 for pm7325
> +                     - gpio1-gpio9 for pm8350c
> +                     - gpio1-gpio4 for pmk8350
> +                     - gpio1-gpio4 for pmr735a
> +
> +            items:
> +              pattern: "^gpio([0-9]+)$"
> +
> +          function:
> +            description: |
> +                Specify the alternative function to be configured for the
> +                specified pins.

No need to redescribe a common property.

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

Please define the constraints here.

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
> +            enum: [1 2 3 4]

enum: [ 1, 2, 3, 4 ]

> +
> +          qcom,dtest-buffer:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            description: |
> +                Selects DTEST rail to route to GPIO when it's
> +                configured as digital input.
> +            enum: [1 2 3 4]

Ditto.

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
