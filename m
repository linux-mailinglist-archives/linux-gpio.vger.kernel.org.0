Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A76A9608E89
	for <lists+linux-gpio@lfdr.de>; Sat, 22 Oct 2022 18:33:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229755AbiJVQdg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 22 Oct 2022 12:33:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229695AbiJVQdf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 22 Oct 2022 12:33:35 -0400
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A19F31AD6AC
        for <linux-gpio@vger.kernel.org>; Sat, 22 Oct 2022 09:33:34 -0700 (PDT)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-1322d768ba7so7244549fac.5
        for <linux-gpio@vger.kernel.org>; Sat, 22 Oct 2022 09:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0eWt7RNkEO1k0Vy71F3m9QFvlipPWRxYBl0GDBgLXxQ=;
        b=HPM7TBSPn6XyRzba2y61Argt2pfR9SnLyOrcJ1uN25igs/q49TLBm9Ls1v8NQ/ej5d
         HR7elhujfgfudOhnU8HP+KHqX++/4/ycS9s8jj4Pqh+dPtj7gvPKjEmFMEWhA4PjfvEe
         6t4uKmc2aQ+9FeftUrTJvpAUhAbcSa/IdnMOZ37yNiyDmDRBpIe94m/XBkYotqZO+VeY
         n+a9Vvt+vryKO5gkPvqH3UgaqmdklTULjaZHq155K7LG+CiCF7klsGz8q1k9N0rmoQOd
         LeR2M7kTBqE3MrQ+lW229LdEx6Z69Et6XsS47GMmveVFdDkHaO17A4XeyJgC+jvpweRg
         6MMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0eWt7RNkEO1k0Vy71F3m9QFvlipPWRxYBl0GDBgLXxQ=;
        b=mEBXOe4CBZTrenLFiurZX5FdEue80ytE7tWMEDdwYwr3XRFcp1Ouv2w4EGyBA7rYi3
         lVUuNutBJXA4ebzm1Vy5n5GpZ0HeDYmW6mWjuSWb31Z78HN0aos31u1c6jmJGTrYryez
         +X+w05iKKkLa1k3Q3l31SAihx3L+clPfJvepMo1PR88bLL3aAqJmqJcfH8TKSzIZEruC
         jR6pAkJ+PrQHkRrTmk8TqiWppaDqJUCrVq4ci3B4Zg2AcCt6Eq10Q/AvFOM1/SNGZP5X
         YznC5j/zB9L0YL7yt30V+MxA5JZlzTsm1CudZZPDte6fY3bA7SkZf1eS6UswSc48EGp/
         O/wA==
X-Gm-Message-State: ACrzQf0KniVjnCLKG0OHQ5OxkXdPoVgI28jRCV9CETlWroGzaLvrv21b
        nbroP0SwMfGJ5U44GR9tw/DnLw==
X-Google-Smtp-Source: AMsMyM7cmmw4Q4tbF+hKNHlAHcWM8zZ7Ek2n4AmlIPDBF5GhC+nGoV2ULzfNrUm7BbQB5KP/Jv+gWw==
X-Received: by 2002:a05:6871:1d5:b0:12b:239:ef00 with SMTP id q21-20020a05687101d500b0012b0239ef00mr15917193oad.85.1666456414055;
        Sat, 22 Oct 2022 09:33:34 -0700 (PDT)
Received: from [10.203.8.70] ([205.153.95.177])
        by smtp.gmail.com with ESMTPSA id f20-20020a4aeb14000000b004805b00b2cdsm9740972ooj.28.2022.10.22.09.33.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Oct 2022 09:33:33 -0700 (PDT)
Message-ID: <88863ec4-be36-cd47-f727-3452075b15bf@linaro.org>
Date:   Sat, 22 Oct 2022 12:33:30 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2 2/2] dt-bindings: pinctrl: add loongson2 pinctrl
Content-Language: en-US
To:     Yinbo Zhu <zhuyinbo@loongson.cn>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        zhanghongchen <zhanghongchen@loongson.cn>
References: <20221022020927.25485-1-zhuyinbo@loongson.cn>
 <20221022020927.25485-2-zhuyinbo@loongson.cn>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221022020927.25485-2-zhuyinbo@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 21/10/2022 22:09, Yinbo Zhu wrote:
> Add the loongson2 pinctrl binding with DT schema format using
> json-schema.
> 
> Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
> ---
> Change in v2: 
>                 1. Add "$ref to pinctrl.yaml".
>                 2. Put required after patternProperties.
>                 3. Add "additionalProperties: false" after '-pins$'
>                 4. Add "unevaluatedProperties: false" after 'pinmux$'
>                 5. Fixup the broken indentation in patternProperties node.
>                 6. Use 4 spaces for example indentation. 
> 
>  .../pinctrl/loongson,ls2k-pinctrl.yaml        | 126 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 127 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/loongson,ls2k-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/loongson,ls2k-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/loongson,ls2k-pinctrl.yaml
> new file mode 100644
> index 000000000000..bb511e103a4b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/loongson,ls2k-pinctrl.yaml
> @@ -0,0 +1,126 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/loongson,ls2k-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Loongson2 SoC Pinctrl Controller
> +
> +maintainers:
> +  - zhanghongchen <zhanghongchen@loongson.cn>
> +  - Yinbo Zhu <zhuyinbo@loongson.cn>
> +
> +allOf:
> +  - $ref: "pinctrl.yaml#"

Drop the quotes.

> +
> +properties:
> +  compatible:
> +    const: loongson,ls2k-pinctrl
> +
> +  reg:
> +    maxItems: 1
> +
> +patternProperties:
> +  '-pins$':
> +    type: object
> +
> +    additionalProperties: false
> +
> +    patternProperties:
> +      'pinmux$':
> +        type: object
> +        description: node for pinctrl.
> +        $ref: pinmux-node.yaml#
> +
> +        unevaluatedProperties: false
> +
> +        properties:
> +          groups:
> +            description:
> +              One or more groups of pins to mux to a certain function
> +            items:
> +              enum: [gpio, sdio, can1, can0, pwm3, pwm2, pwm1, pwm0, i2c1, i2c0,
> +                     nand, sata_led, lio, i2s, hda, uart2, uart1, camera, dv01,
> +                     dvo0]
> +          function:
> +            description:
> +              The function that a group of pins is muxed to
> +            items:

Function is one string, so no items.

> +              enum: [gpio, sdio, can1, can0, pwm3, pwm2, pwm1, pwm0, i2c1, i2c0,
> +                     nand, sata_led, lio, i2s, hda, uart2, uart1, camera, dv01,
> +                     dvo0]
> +
> +        dependencies:
> +          groups: [function]
> +          function: [groups]

If you wanted to say they are both required, add "required:" here.
Otherwise you allow a pinmux without groups and function. Is it desired?

> +
> +required:
> +  - compatible
> +  - reg
> +

Best regards,
Krzysztof

