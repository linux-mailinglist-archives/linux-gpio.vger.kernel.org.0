Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97A1C723D63
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Jun 2023 11:30:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237464AbjFFJaK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Jun 2023 05:30:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237323AbjFFJaJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Jun 2023 05:30:09 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36A03E64
        for <linux-gpio@vger.kernel.org>; Tue,  6 Jun 2023 02:30:07 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9745ba45cd1so734123866b.1
        for <linux-gpio@vger.kernel.org>; Tue, 06 Jun 2023 02:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686043805; x=1688635805;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8C7J2EP7bxfF86Ze7Zs92uWFQqFnCC2m1aZWYmT84Zs=;
        b=tGkjbZYmLWSdkDcu75EdGvL7xeOarlbXiuCscDikNy5U1FH0hRKBdGbP1XrHQ6WjHp
         g9XGG856Zw0mWOjOYQq21uLPYNYsjWF5d5S3iYhYv6ykHF/1NsTy9y+L4DsUM5bnT2ak
         YfZdrqH0MzLXHEZeP7Di8s/7YGUccw0E/GLO0YBgRlH+yPw/VZWN6YUp0DgeUw2hKseX
         uq5KIpGq9uA4R9iuS4z1/DjJLzPjoSHpBCGLQZaZGCZVBnA0uaBUv1DpdoEaakjRYyGa
         0o1iSjadvh3YAiowFZMd4C+lY1qz0iizqD38HH+v2abcms4PeT9IDk6BqPKUK4xWxG8e
         wXeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686043805; x=1688635805;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8C7J2EP7bxfF86Ze7Zs92uWFQqFnCC2m1aZWYmT84Zs=;
        b=JV5cl48EkYzfAHSnrw00VlFJzf88kz66JUEDSNI9ZL1k939lvU0rvz3qz2/BIWF8XD
         v+07+Akly4FrdE3hgN3B6/9iDu5ZiUW9DqAuSxG16xcP4WObJt3ya5KW1rfQK4uTAmzy
         0QOZZJ5tXx4tQLUFdU9hO6UOSTwnkOh/J58RTpZ+v5uIdKoI02jqYhpf+GHScqLATe7/
         FVSgRcxjTepMLpGrOhaR6ugsKwK5UZllgC8J7jFHuJIhNl59gd5dRRd7Rc6h4nGhXIx9
         Kz9yj1YWKnnSEpW0uW/fCMMLbgbYsPOXSQZFmZSOtOUFumK8WDSbn+Ypk2MNCS/mTnAk
         vO7A==
X-Gm-Message-State: AC+VfDwpgqqNAEauNSg46kXipjeuuXQE3Om3FBfyynq6Fbp2KeJwxsAD
        lAHLJvt2I06zf+YpGJgCcrXODg==
X-Google-Smtp-Source: ACHHUZ42UU5n5EGxsYZ22/AmAv6c1F/PV+SDPZXSYXRUB2KwsmObEJud9vcktGF2FEFkMg31pJIvOg==
X-Received: by 2002:a17:907:948c:b0:974:5487:6054 with SMTP id dm12-20020a170907948c00b0097454876054mr1575957ejc.71.1686043805717;
        Tue, 06 Jun 2023 02:30:05 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id a22-20020a1709063e9600b0096637a19dccsm5295726ejj.210.2023.06.06.02.30.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 02:30:05 -0700 (PDT)
Message-ID: <5101ce0a-277c-7104-145f-75543922fe0f@linaro.org>
Date:   Tue, 6 Jun 2023 11:30:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v3 1/5] dt-bindings: gpio: Add HPE GXP GPIO
Content-Language: en-US
To:     nick.hawkins@hpe.com, verdun@hpe.com, linus.walleij@linaro.org,
        brgl@bgdev.pl, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jdelvare@suse.com,
        linux@roeck-us.net, andy.shevchenko@gmail.com,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
References: <20230606014234.29491-1-nick.hawkins@hpe.com>
 <20230606014234.29491-2-nick.hawkins@hpe.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230606014234.29491-2-nick.hawkins@hpe.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 06/06/2023 03:42, nick.hawkins@hpe.com wrote:
> From: Nick Hawkins <nick.hawkins@hpe.com>
> 
> Provide access to the register regions and interrupt for GPIO. There
> will be two drivers available. The first driver under the hpe,gxp-gpio
> binding will provide GPIO information for the VUHC, CSM, and FN2
> host interfaces. The second driver under the hpe,gxp-gpio-pl will
> provide GPIO information from the CPLD interface. The main difference
> and need for two separate bindings is they have different interrupt
> parents. The other is hpe,gxp-gpio is a combination of physical
> and virtual GPIOs where as hpe,gxp-gpio-pl are all physical
> GPIOs from the CPLD.
> 
> Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>

Thank you for your patch. There is something to discuss/improve.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - hpe,gxp-gpio
> +      - hpe,gxp-gpio-pl
> +
> +  reg:
> +    minItems: 2
> +    maxItems: 6

Why 6? You have 4 items in allOf:if:then.

> +
> +  reg-names:
> +    minItems: 2
> +    maxItems: 6
> +
> +  gpio-controller: true
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  gpio-line-names:
> +    minItems: 80
> +    maxItems: 300
> +
> +  interrupts:
> +    maxItems: 1
> +

Best regards,
Krzysztof

