Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C21C65A9B4D
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Sep 2022 17:11:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233933AbiIAPLh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Sep 2022 11:11:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233492AbiIAPLf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Sep 2022 11:11:35 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE12985A8D
        for <linux-gpio@vger.kernel.org>; Thu,  1 Sep 2022 08:11:33 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id br21so19104259lfb.0
        for <linux-gpio@vger.kernel.org>; Thu, 01 Sep 2022 08:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=Ns5DU1nOfngp2+7giOu7t5+idfy4C3d8IqsGOFXmUks=;
        b=qs4Pv/jPOG27EPrTtcvWNOKNnbfrLo6Aw9McLhC5oHtI4egYvTBcREOdjcSplah8jh
         lzXxie+rxnziunZanrrAAkdjYVCAz2aAmVR+wlsAWplfgdlpwyFT7Y377hZRl4fLrtZz
         L/K4IrA7jAj3NuY1jOkCEoZ+NBJL9+46pOHdUjS02J8zkXuAsFZeNqG8nJ4inAwywNPH
         LnMTqZyfCxbqooKkNHGxIPI5MTb/koENgLx5XmTGw4R18RKo7LteRkrLBfJ7tu5Qv9VP
         iV8Hcj97sEWTAKOMO1hsjnAbjNhcknguZFI7GPn3L6Oz+tOy6ZrWRL7YZy/2DH82hwJD
         WwNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=Ns5DU1nOfngp2+7giOu7t5+idfy4C3d8IqsGOFXmUks=;
        b=bNDohq1F/t8KV6Zv0UYtQ7E5uYRTVQwDByENoioUoKnPIFb7Ob57dZhAaa+yYvGvHJ
         algmD1kHDX/SYhsrYe+cAMqgAVVVEwpeYIZXNSYBOE5vZTs7DOiXpo1vkt+CZiiiWYng
         m3HP8dCeC0UNb08Ye+MyVGS3u6/7eKkbvObuyWHVFBHbI7o/c3+J6R7elG9RF5NeIKas
         eMvkXLj5Gec9dtZHMUqYcUYv/JgMezmtIv6Y07dBUKRcKMS+hAsnPAznh2YAG2vUqGCY
         1LXYqVUDWcNVkTnLfx//aDhZAScdhTfiLXjdCo407sxxy9wMvg3VsLDGwA8CYtYY1uG8
         A4Ig==
X-Gm-Message-State: ACgBeo0OBYwLj19Ekst2HXdj5IccBaOj1FlvgPgp98Miw+ciXgd99713
        HUsFmYqpSiUJqBG0KY/98IXC3A==
X-Google-Smtp-Source: AA6agR6IuPNoybT1QM6ZvPT+EzZ7MbGZbMoz+EYsaE+0RKePK2D7gBiB5KtdC+0rly55i7aUrgmDeg==
X-Received: by 2002:a05:6512:402a:b0:494:9bb5:820 with SMTP id br42-20020a056512402a00b004949bb50820mr1018259lfb.175.1662045091971;
        Thu, 01 Sep 2022 08:11:31 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id i3-20020a2ea223000000b00262fa7bae79sm2102476ljm.81.2022.09.01.08.11.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 08:11:31 -0700 (PDT)
Message-ID: <5ad90366-e7ac-1cae-77ee-cc084e5a69d3@linaro.org>
Date:   Thu, 1 Sep 2022 18:11:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 2/6] dt-bindings: gpio: add binding for the GPIO block for
 Apple Mac SMC
Content-Language: en-US
To:     "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Hector Martin <marcan@marcan.st>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        Sven Peter <sven@svenpeter.dev>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk>
 <E1oTkeM-003t9G-7S@rmk-PC.armlinux.org.uk>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <E1oTkeM-003t9G-7S@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 01/09/2022 16:54, Russell King (Oracle) wrote:
> Add the DT binding for the Apple Mac System Management Controller GPIOs.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../devicetree/bindings/gpio/gpio-macsmc.yaml | 28 +++++++++++++++++++
>  .../devicetree/bindings/mfd/apple,smc.yaml    |  4 +++
>  2 files changed, 32 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-macsmc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-macsmc.yaml b/Documentation/devicetree/bindings/gpio/gpio-macsmc.yaml
> new file mode 100644
> index 000000000000..ee620fe50ca8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-macsmc.yaml
> @@ -0,0 +1,28 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/gpio-macsmc.yaml#

filename based on the compatible... which is missing here, so this leads
to the question - why this is separate device/child node? It won't bind
to anything, won't be populated, right?

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Apple Mac System Management Controller GPIO
> +
> +maintainers:
> +  - Hector Martin <marcan@marcan.st>
> +
> +description:
> +  This describes the binding for the Apple Mac System Management Controller
> +  GPIO block.
> +
> +properties:
> +  gpio-controller: true
> +  '#gpio-cells':
> +    const: 2
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    smc_gpio: gpio {
> +      gpio-controller;
> +      #gpio-cells = <2>;
> +    };
> diff --git a/Documentation/devicetree/bindings/mfd/apple,smc.yaml b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
> index 794d3a6eb04a..bb799a27638d 100644
> --- a/Documentation/devicetree/bindings/mfd/apple,smc.yaml
> +++ b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
> @@ -34,6 +34,10 @@ title: Apple Mac System Management Controller
>      description:
>        A phandle to the mailbox channel
>  
> +patternProperties:

This is not a pattern, so "gpio" goes to "properties:".

> +  gpio:
> +    $ref: /schemas/gpio/gpio-macsmc.yaml
> +
>  additionalProperties: false
>  
>  required:


Best regards,
Krzysztof
