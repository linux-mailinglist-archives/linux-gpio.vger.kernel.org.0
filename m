Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B433869F4A2
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Feb 2023 13:35:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229834AbjBVMfL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Feb 2023 07:35:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231567AbjBVMfK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Feb 2023 07:35:10 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19AF63346A
        for <linux-gpio@vger.kernel.org>; Wed, 22 Feb 2023 04:35:08 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id b12so29694832edd.4
        for <linux-gpio@vger.kernel.org>; Wed, 22 Feb 2023 04:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=txTrJv7AYzOlX/1y7v9G6WCXuMLyCZxtPmCMzn1Diaw=;
        b=L8TSdPMA0EpPJqk7xECFclC0YVKb6uGYx8SoFg/ipiJYYy+pj8AiNc75Gk5kRNCdlP
         LwdZKKbtCD+R7pB9x2uUQ5vbQeSJ9P++trIAjlGfkDVFwiwVslecAouyw5MgssccSJup
         1O3RKsaOpyDspPyUYLH4ANTpnyY9aRL/0PsSbMjxgTJg4qpTC8dsCE8/LpOec3qQwgIr
         u1XeTgI2ZSrX4BAqfYG5tck+gP6dGgWIQ1z71APT6olhsT0SX09ksIfev+EnlxLwdmAR
         3ZzkOtbpEbHZMdmYHisvFpzGN2kgP9o+eAS3D7ShmGByGgHy6JHXK2NXeQjuX8eIftqB
         3mww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=txTrJv7AYzOlX/1y7v9G6WCXuMLyCZxtPmCMzn1Diaw=;
        b=HZ+pP5Rk2QPEulKB3YGzaLMC/UxtpXUQxnDTONrvbgPfpqnedr3mbrbDNGmh0tNCZy
         JcE7lQ7/vFEKdyv18qqspgajZzdhuqXscjQ0s5xbiJvbSyCbbe8snkz77fkSBLXfxybS
         tabh3vCgUzXvyD3h0k4lvr2t3aX0EpbsY88LI16RolNcm0z7G125uixY5/B5Z595BSQp
         aoo6RNQtRzKcNLbJbtpQoYBlELlxRYww2W7JKZ2ggqlf6k//+8T4/Ox/K5GCM0ErzXns
         vKgaTrcBQQzNTM9PeB3MFMJUl6ljrvGXiaRj2O75WX5mkGUydJslmefp/54YNrBhSk87
         jpMg==
X-Gm-Message-State: AO0yUKXwlULQNDS/cdB9tplgWsJ897uYY9BSWQz1HJXdpTkZ1Z0PEpm3
        tyIce7a5wevbpjCFvYWbxfoEI8zszuE8AOif
X-Google-Smtp-Source: AK7set8wGiT4LP0jX+AFzBDqKGFnMBzM3LkPeXWZbxr5Wl65sXW4zkMTqAaYezsLEqG1iGUv1KMRJA==
X-Received: by 2002:a17:906:240f:b0:8b2:b711:5e62 with SMTP id z15-20020a170906240f00b008b2b7115e62mr18521969eja.52.1677069306590;
        Wed, 22 Feb 2023 04:35:06 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id bw10-20020a170906c1ca00b008b133f9b33dsm8340957ejb.169.2023.02.22.04.35.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 04:35:06 -0800 (PST)
Message-ID: <18d1048e-c66b-fea8-2755-6c1c6e23fde9@linaro.org>
Date:   Wed, 22 Feb 2023 13:35:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 4/4] dt-bindings: gpio: Add Loongson-1 GPIO
To:     Keguang Zhang <keguang.zhang@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230222111213.2241633-1-keguang.zhang@gmail.com>
 <20230222111213.2241633-5-keguang.zhang@gmail.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230222111213.2241633-5-keguang.zhang@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 22/02/2023 12:12, Keguang Zhang wrote:
> Add devicetree binding document for Loongson-1 GPIO.
> 
> Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
> ---
>  .../bindings/gpio/loongson,ls1x-gpio.yaml     | 60 +++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/loongson,ls1x-gpio.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpio/loongson,ls1x-gpio.yaml b/Documentation/devicetree/bindings/gpio/loongson,ls1x-gpio.yaml
> new file mode 100644
> index 000000000000..e4ab49d48fae
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/loongson,ls1x-gpio.yaml
> @@ -0,0 +1,60 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/loongson,ls1x-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Loongson-1 GPIO controller
> +
> +maintainers:
> +  - Keguang Zhang <keguang.zhang@gmail.com>
> +
> +properties:
> +  compatible:
> +    const: loongson,ls1x-gpio
> +
> +  reg:
> +    maxItems: 1
> +
> +  gpio-controller: true
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  ngpios:
> +    minimum: 1
> +    maximum: 32

Isn't this fixed at 32? Do you have hardware with different number of GPIOs?

> +
> +required:
> +  - compatible
> +  - reg
> +  - gpio-controller
> +  - '#gpio-cells'

Use consistent quotes - either " or '

> +  - ngpios
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    gpio0: gpio@1fd010c0 {
> +        compatible = "loongson,ls1x-gpio";
> +        reg = <0x1fd010c0 0x4>;
> +
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +
> +        ngpios = <32>;
> +    };
> +
> +  - |
> +    gpio1: gpio@1fd010c4 {
> +        compatible = "loongson,ls1x-gpio";
> +        reg = <0x1fd010c4 0x4>;
> +
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +
> +        ngpios = <32>;
> +    };

These are two the same examples, keep only one.

Best regards,
Krzysztof

