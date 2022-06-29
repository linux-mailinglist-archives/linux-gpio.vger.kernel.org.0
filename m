Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96B4156079E
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jun 2022 19:46:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231772AbiF2Rq5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Jun 2022 13:46:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231754AbiF2Rq4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jun 2022 13:46:56 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95B4A3C737
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jun 2022 10:46:52 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id r18so15377198edb.9
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jun 2022 10:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Xj8KYBMxIXHvOyiU4Z2mgS/vdHnq9bALri3yt1aiv1c=;
        b=LMLK9CMKYfcCCde1mzzTCAVpgkAvify1XeN+DPrlC7muTHWNXIPuHm5OMoaKmFCI99
         oxDy+T1G4xjbXE0r3lBVd9wmcN6uk8YeaLkci4BtFehnh8aQX0z1RTE3TSDTSiHBadNB
         qFLG52gJZmVRO+9ayB/3LAl1mYyGSCpIL1fMOI0uhaNLNpHqPdFj5VO+at/9nUVq0vrL
         xTHQUb7z9K2M3wnYPGD/G6um0QrAjHW8w8IxoLE6WmTErGQnwVipqw9MSzWU4Cc0FAuW
         KkzXRy2tm+Wo+IsODh5/e4g6ucEnSrlBsdTnKn7aJmX1h5qqiX7qQWKAxwCXMUlNXWOS
         ++xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Xj8KYBMxIXHvOyiU4Z2mgS/vdHnq9bALri3yt1aiv1c=;
        b=QeFme2MZThQKN1Tb0dJjn8/1SiUsdNjs+OXS1sRB4p00f+4tL18kEbhCsVHqshI7fC
         QQJOFZroh6fJ/vsXOC/DBVp+n3E0ECqcERm12FxkAeGyR8x/rqUXsLyRsGe9adeqoKoo
         e8PoY2PfdWLVrHzv15NXtGzCrIiv0FAZRRgRezwi91OY6Spy9BjvrEtaU/TPmCp+UAqr
         MoPYrgPfvv+b0cW8iqLGu7fGp8eIzZP/f3s3wBIpmZ1e1XLE0m9fCXBczyyETnI582tD
         UBbqVstptjT0nHjBLR8KC0nj7mdV8IYZQzRjjNakhFwJfdXnEAmWFjU2Fm9/QUxlrkJn
         qzSg==
X-Gm-Message-State: AJIora/tal2T+ncdesZNBXtsfzA/ZrVJ/Np8Rvv+M9q2LF3XRpLHiGYc
        F00gW0l2BpnLwPlLJe50cmIxYg==
X-Google-Smtp-Source: AGRyM1tlsatjUt6BNSfWIUKLcq3TCqWC1HHWCKujc+N6jjnj9QFCJ4i7h/7H6rIwxHOGjzxR499Dnw==
X-Received: by 2002:a05:6402:606:b0:435:72af:4680 with SMTP id n6-20020a056402060600b0043572af4680mr5816972edv.224.1656524811195;
        Wed, 29 Jun 2022 10:46:51 -0700 (PDT)
Received: from [192.168.0.187] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id k11-20020a1709062a4b00b00726abf9a32bsm3808687eje.138.2022.06.29.10.46.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 10:46:50 -0700 (PDT)
Message-ID: <11b937dd-0f05-9126-5ec0-73518b29e8aa@linaro.org>
Date:   Wed, 29 Jun 2022 19:46:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 1/2] gpio: pca9570: Add DT bindings for NXP PCA9571
Content-Language: en-US
To:     Lucas Stach <l.stach@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de, patchwork-lst@pengutronix.de
References: <20220629170420.2712077-1-l.stach@pengutronix.de>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220629170420.2712077-1-l.stach@pengutronix.de>
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

On 29/06/2022 19:04, Lucas Stach wrote:
> This patch adds device tree bindings for the NXP PCA9571,
> a 8-bit I2C GPIO expander.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
