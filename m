Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D72907686D0
	for <lists+linux-gpio@lfdr.de>; Sun, 30 Jul 2023 19:46:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229535AbjG3RqI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 30 Jul 2023 13:46:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbjG3RqH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 30 Jul 2023 13:46:07 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03304E7B
        for <linux-gpio@vger.kernel.org>; Sun, 30 Jul 2023 10:46:06 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-992e22c09edso548599666b.2
        for <linux-gpio@vger.kernel.org>; Sun, 30 Jul 2023 10:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690739164; x=1691343964;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S1YU29zqeUxaos3hVgNC2yaFaW8qpla0dKTdA5NLg2Y=;
        b=VbFECZP5mT8avx6h4h2FtXj91veskHtt7LLqUb/ZMy8y6GAfHwKQXJPL99sA2yU4H8
         6GDde+ybLziKJQmTsdwYDqhrR5x8KXrMv1mFNodhxs/3H3k6RjAoFq7ZAuBcX56p3Xrx
         quJN7lOt+7SyIy2xmViZk/Oy0r0b1i/t4mVPptwx/ZxghvptSsvZgN66tc6H++dzMZs2
         lIl/io3wjZR/CXO4MvipJvlK8NvmnphuRWu1cpXQXWxKgBqHdNZM0OHclRPjaKSsRKkL
         oPT59y1KnNJwisfVmQeVM+xwLcyHujyvYL48QZMN9AOTiAJNzabaz07YK+w3W0hqXLna
         waDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690739164; x=1691343964;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S1YU29zqeUxaos3hVgNC2yaFaW8qpla0dKTdA5NLg2Y=;
        b=hAAyC5AW42HEvkno28U9N2Sv/BiR+q2D/GH76VH95Pv7Wk82I2Tl7OiKJEHaTRm41W
         D0whHFFMhzktz9L4S0SCmYuaQoTJ9O3jbn7tecr80L7u5s9vU5x7eDVkfdHej6y3uW+P
         x86GznVGNj6oOuAEMaxsNneFmo8JsOdKhxIIxkqEEUKD2XswUFZbwzbhtyTau/Jk0EKS
         ayIiducfc85rJ1QtjJJpnkxCt22WooUO4pNMvV0JpgEawH0l3mbdh8qQOhlBT4bv+TSQ
         kTIoaYg8xwMb2GQt0UpB3/AnyuDX+kWq2RZSiTc6rhLiT1y7Zl/DQTc4pmECa3aWXpYO
         eaPg==
X-Gm-Message-State: ABy/qLY4cFbyL2OiZo8ee6mrQa14tcnFF1E23bYPBDHVm1dP6ho9opSn
        /oFaeDdAeXwXRRZBMyJCSVfAXQ==
X-Google-Smtp-Source: APBJJlGKsuK7EedFMznaZ471QDNb0j4xmicTbpYHSCeYH5o7U2syAJlFJjxwzLFRaQJN9JF01cuJSw==
X-Received: by 2002:a17:906:2487:b0:993:e94e:7234 with SMTP id e7-20020a170906248700b00993e94e7234mr4162336ejb.77.1690739164410;
        Sun, 30 Jul 2023 10:46:04 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.183])
        by smtp.gmail.com with ESMTPSA id j13-20020a17090686cd00b0098884f86e41sm4890420ejy.123.2023.07.30.10.46.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Jul 2023 10:46:03 -0700 (PDT)
Message-ID: <4707bdea-9398-8cbe-8f96-d56c1744b207@linaro.org>
Date:   Sun, 30 Jul 2023 19:46:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH] dt-bindings: gpio: brcm,kona-gpio: convert to YAML
To:     Stanislav Jakubek <stano.jakubek@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>
Cc:     bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <ZMaAdG9Zj9AL1NiR@standask-GA-A55M-S2HP>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ZMaAdG9Zj9AL1NiR@standask-GA-A55M-S2HP>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 30/07/2023 17:23, Stanislav Jakubek wrote:
> Convert Broadcom Kona family GPIO controller bindings to DT schema.
> 
> Changes during conversion:
>   - add used, but previously undocumented SoC-specific compatibles
> 
> Signed-off-by: Stanislav Jakubek <stano.jakubek@gmail.com>
> ---
> Changes since RFC:
>   - fix interrupts maxItems
>   - narrow interrupts min/maxItems per each variant
>   - thanks for the feedback Linus, Krzysztof :)

For the future
RFC is v1, so this should be v2. And it matters, because:

b4 diff '<ZMaAdG9Zj9AL1NiR@standask-GA-A55M-S2HP>'
ERROR: Could not auto-find previous revision

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

