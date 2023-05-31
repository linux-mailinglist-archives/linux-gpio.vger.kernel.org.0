Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22FA071879A
	for <lists+linux-gpio@lfdr.de>; Wed, 31 May 2023 18:38:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229585AbjEaQiF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 May 2023 12:38:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbjEaQiE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 May 2023 12:38:04 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 240E81BE
        for <linux-gpio@vger.kernel.org>; Wed, 31 May 2023 09:37:24 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-96f8d485ef3so930005766b.0
        for <linux-gpio@vger.kernel.org>; Wed, 31 May 2023 09:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685551034; x=1688143034;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mI/Z+AOJe77MYRVNtpeDPQoy64/AS/Rw3B+qEnWzB1Y=;
        b=tm9VH58Fsh0081cO5HE+79bYqZjkTUWv79a2vWGXoegxO8DrJbKVlnuxLWDoxfypuh
         oTKGRg5ZtSXbXXlaojuYUVgECR+vnD2ctKD5pANvclxwj25d6kBMMYSqGvbh9JPbpO6d
         GkhFPEAgDUYJTLA7rzBozYRy+WQtzjGf42Bdl6ZkklKIXvMzB2s8KR+u5+TUV+5N11G0
         ipYSq5becnGZKB8j87m9vJkylL2YFTvKTEvIAJqClFaOV7ApRjf49qQYLcByLrePiTcQ
         5qtvnznk+RCk0eh4O5M5l/k6P8dp3Yjek0gBb5euznBZsZb5+nEq94F3g7bnGR+xcD/p
         uWHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685551034; x=1688143034;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mI/Z+AOJe77MYRVNtpeDPQoy64/AS/Rw3B+qEnWzB1Y=;
        b=cL1iQUCBB9zSk0P5Y4cqXNhbgEwHcGCllnqcWyIdznAeZUg89ekN5IHzl+I1Q4kGgu
         jJUlLo56jUmzEKm8dIv3pvBdHxUnNEDKM0BIbhyzUTFB/b/XE9AaIyutpuQzVC9XFKwN
         em7jO2rQMKo8iCOIXC4WZlFxmiLfAK87La+y6U2r1RWEcyLdYwzasuSQQmELOj3+H1qp
         6blXLSIWkJDEDCn7JsFaesWx/k49Bbkn5KXso0pH4s5H33Vrb/uJSbvSbef0fVHD/ALC
         7S05SViB36OlQla1yjW7D54XKgK7hPjCPk01QNuHnAiYpkvFpz2+/KzOJuJgQrUbs4mm
         00UQ==
X-Gm-Message-State: AC+VfDw83A/rjPya0FCjQ9jLXL2hDRpesNC1gYqC5a7NU0DyKgxNRXvD
        ATtvrOAXFQIJjOk2T2SCJ/gP4Od8ERtgmn/1Ez2KxQ==
X-Google-Smtp-Source: ACHHUZ6mk17104IpQqaV9WJrLhDKZ8/xdRyYGkqpmnwxdPbatNtB1dyYzFae4LvTWskaYKjzTZ1eJQ==
X-Received: by 2002:a17:907:6d29:b0:96f:5747:a0de with SMTP id sa41-20020a1709076d2900b0096f5747a0demr5836897ejc.6.1685551033920;
        Wed, 31 May 2023 09:37:13 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id e18-20020a170906249200b0096f503ae4b0sm9265816ejb.26.2023.05.31.09.37.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 09:37:13 -0700 (PDT)
Message-ID: <edde585c-40df-4e5e-fee0-8b8c38eff2d9@linaro.org>
Date:   Wed, 31 May 2023 18:37:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v1 1/3] dt-bindings: gpio: Add gpio-delay binding document
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20230406093344.917259-1-alexander.stein@ew.tq-group.com>
 <20230406093344.917259-2-alexander.stein@ew.tq-group.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230406093344.917259-2-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 06/04/2023 11:33, Alexander Stein wrote:
> This adds bindings for a GPIO enable/disable delay driver.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

