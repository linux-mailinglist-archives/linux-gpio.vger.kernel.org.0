Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3997A55FC2E
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jun 2022 11:38:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232840AbiF2JiH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Jun 2022 05:38:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232959AbiF2JiG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jun 2022 05:38:06 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B35CCB86
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jun 2022 02:38:04 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id eq6so21322783edb.6
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jun 2022 02:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=I9e0lYWy7uCJKoc96qsb2y1N0WG5Wc6UBbbE3PgOBhw=;
        b=wE4NGpCV0Qay9co9/9Z/AnRX+pXDoASpC/BRAAOfsOfqnzKaCl+um6OjOKSdMJAWGt
         i458BtNboglnzROsVbkmWr0nF9xFgY+lusy85PBuQMsMPscSoW7gE3hSTK8vt3wlM0GP
         Qojxy2hBc8G+vA4fgosegavTaZ84SbgYNZgIVsInn7IkxUgRiYxtou4HAEMPRk1BlbjI
         hQWRIxQym6yQl/K+3BxNtGvZIJSPwJGV1bOjVxHqhA9p0E1CPDIyClElmT8sgM8La3lv
         KmGK99lnc30oNTJHvVV9YkAolJ858I+VG4nOO2H0+0XOsZdGZUc+Oyvrj8ke8JQdfp8U
         Uq4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=I9e0lYWy7uCJKoc96qsb2y1N0WG5Wc6UBbbE3PgOBhw=;
        b=gs6Rj9/oJppD/PXUyD+/2KBXbopT9y6Pih6urH5d+9Nu6VC1KZ5s1wYYtSktvTkPVb
         7Ibg1AngTeXccRSNPhedTn0/NUcLJ4dEhrtfbTPIN3VBF2Yv5GScMRlhtmwGKdZIlBu0
         yl2wuyRSzcPc/IryJYUj8VvTGI/VSXIIG4pURVKjq514Q+0zkIdd/Nx4IEL4HaVTSrL8
         p+6uhEF5tIp/jShJ9DDxM9sZpT/WoOI1gIIcUoty7KtSdVaAuA1lLbJv5HLZJc87Xa/J
         DLqEq0AmBlEaQfwz1A/ksMpuD9cwp5cdhB3KrPwOfqLrhRchEQ9ymPp1ob+tbxfNbB7q
         Oj0A==
X-Gm-Message-State: AJIora/8KY8jOPfDUnxMBr0ngZeKj2rP+7mvTvOzDBPbaBSVZ26/4Qau
        dNbKnj/keJ8/JMb/XAxdhvEmTQ==
X-Google-Smtp-Source: AGRyM1seX/TiNSAbkRI6XBjpkxXx0lXfchCFWLwc9HbhIIJqmmot84t+JZ4qoenRaC6OqphS1co2yw==
X-Received: by 2002:a05:6402:448a:b0:435:3fbe:2593 with SMTP id er10-20020a056402448a00b004353fbe2593mr2956604edb.226.1656495483272;
        Wed, 29 Jun 2022 02:38:03 -0700 (PDT)
Received: from [192.168.0.183] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id a4-20020a170906274400b00726b03f83a0sm3289270ejd.33.2022.06.29.02.38.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 02:38:02 -0700 (PDT)
Message-ID: <91d972d2-689c-d357-869f-fbd826173e33@linaro.org>
Date:   Wed, 29 Jun 2022 11:38:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: Add DT schema for
 qcom,msm8909-tlmm
Content-Language: en-US
To:     Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220628145502.4158234-1-stephan.gerhold@kernkonzept.com>
 <20220628145502.4158234-2-stephan.gerhold@kernkonzept.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220628145502.4158234-2-stephan.gerhold@kernkonzept.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 28/06/2022 16:55, Stephan Gerhold wrote:
> Document the "qcom,msm8909-tlmm" compatible for the TLMM/pin control
> block in the MSM8909 SoC, together with the allowed GPIOs and functions.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
> ---
>  .../bindings/pinctrl/qcom,msm8909-tlmm.yaml   | 152 ++++++++++++++++++
>  1 file changed, 152 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml
> new file mode 100644
> index 000000000000..e03530091478
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml
> @@ -0,0 +1,152 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/qcom,msm8909-tlmm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies, Inc. MSM8909 TLMM block
> +
> +maintainers:
> +  - Stephan Gerhold <stephan@gerhold.net>
> +
> +description: |
> +  This binding describes the Top Level Mode Multiplexer (TLMM) block found
> +  in the MSM8909 platform.
> +
> +allOf:
> +  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,msm8909-tlmm
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts: true
> +  interrupt-controller: true
> +  '#interrupt-cells': true
> +  gpio-controller: true
> +  gpio-reserved-ranges: true
> +  '#gpio-cells': true
> +  gpio-ranges: true
> +  wakeup-parent: true
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +patternProperties:
> +  '-state$':
> +    oneOf:
> +      - $ref: "#/$defs/qcom-msm8909-tlmm-state"

No quotes here and other places, should be needed. I know you copied
from other bindings, but at least let's try new files to be proper.

> +      - patternProperties:
> +          ".*":
> +            $ref: "#/$defs/qcom-msm8909-tlmm-state"
> +
> +$defs:
> +  qcom-msm8909-tlmm-state:
> +    type: object
> +    description:
> +      Pinctrl node's client devices use subnodes for desired pin configuration.
> +      Client device subnodes use below standard properties.
> +    $ref: "qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state"

Overall looks ok, to me, so with quote changes:


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
