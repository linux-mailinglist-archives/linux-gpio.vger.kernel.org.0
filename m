Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 057D176C433
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Aug 2023 06:42:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230036AbjHBEmY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Aug 2023 00:42:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229589AbjHBEmW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Aug 2023 00:42:22 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 742C41713
        for <linux-gpio@vger.kernel.org>; Tue,  1 Aug 2023 21:42:21 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-31751d7d96eso5399335f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 01 Aug 2023 21:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1690951340; x=1691556140;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4fq8IrQBjbBrZnSIFTJPM7Fat7+qErOQ84qV/bHh6os=;
        b=ciew+N7IZc8/zYJoOoA9MQRpRD4eSB0/uUEcXt5BK2GIRdiG+W82nav16fwjX95wtX
         1TE34RCUFu7duc8u6FfoWNW4XLWJZhCg/4Wb4DVIdaMrvrhHjo5EwjfuPEVp1aaF/nMQ
         qJgXkiUMMQN9Kz7qxXMMLlvq6FlSAbPtM4HdSfRq/woLpWBPmqglQRMpP6dL8ox+MEdQ
         9qPSCkhyWmiR57/fcohqz1Ey/vTZvU22gD/wuCY8uKRLuqFjh680Ca3P2GmXNxNuvgGx
         U5i48AKgB1kx90jnsteaRDLrSWsR5q1plgi3Saaa12IYIznokSiGnhoSXk+0X6AxLdho
         gkeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690951340; x=1691556140;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4fq8IrQBjbBrZnSIFTJPM7Fat7+qErOQ84qV/bHh6os=;
        b=D9ms4HwcoPUDLY4ym17+r1iraj4+GIiWKkN2uHaNcl5JXDGLQxxxRdujw4aoZ8zjNZ
         rQ+/ba6PQUokDRQMIAxWNU8hKBLF6OZLDo76i3Q60000MY3z9QgjKZWzOpFWbVdn/NYe
         B/aTH622LkKN+AeNHx08IkNKtj43ix58Yc2d26NT9refkZfUUbmo82wANCsG51g4zjWZ
         osmF8kKtMfMUlUO156EJZM/OXNluPGQlLiQzG45NmXz6XnaDQZTjt8r5pzLq3qZIRLHh
         wbA6yImVq5TxII7qCXxFTFn+jmedEKmGaInUrQKon4bGkc0t6BNr+JzV2AJpZVLrKrZj
         xpJw==
X-Gm-Message-State: ABy/qLY+8imynOVKsBK3mECSNV/NL9Q24iJEkDEO4QafyX/B2O72jUfx
        9N/voKq9Cviu7Ho35t5xIBMgZQ==
X-Google-Smtp-Source: APBJJlGS+OnsESDFZ79WgVo4WYKLWy66kVmCr7Ouhb8EnWHUI53UgYp0fP9Npwkz8Rjij8mquxOpwg==
X-Received: by 2002:a05:6000:11:b0:317:5e8e:c2be with SMTP id h17-20020a056000001100b003175e8ec2bemr3590240wrx.63.1690951339976;
        Tue, 01 Aug 2023 21:42:19 -0700 (PDT)
Received: from [10.0.2.15] ([82.78.167.79])
        by smtp.gmail.com with ESMTPSA id g17-20020adfe411000000b0031437299fafsm17940853wrm.34.2023.08.01.21.42.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Aug 2023 21:42:19 -0700 (PDT)
Message-ID: <bdcffc0f-5bd7-d6e5-74a1-ae5f934af3ff@tuxon.dev>
Date:   Wed, 2 Aug 2023 07:42:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] gpio: sama5d2-piobu: remove unneeded call to
 platform_set_drvdata()
Content-Language: en-US
To:     Andrei Coardos <aboutphysycs@gmail.com>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     andy@kernel.org, brgl@bgdev.pl, linus.walleij@linaro.org,
        ludovic.desroches@microchip.com,
        Alexandru Ardelean <alex@shruggie.ro>
References: <20230728182522.18477-1-aboutphysycs@gmail.com>
From:   claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20230728182522.18477-1-aboutphysycs@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 28.07.2023 21:25, Andrei Coardos wrote:
> This function call was found to be unnecessary as there is no equivalent
> platform_get_drvdata() call to access the private data of the driver. Also,
> the private data is defined in this driver, so there is no risk of it being
> accessed outside of this driver file.
> 
> Reviewed-by: Alexandru Ardelean <alex@shruggie.ro>
> Signed-off-by: Andrei Coardos <aboutphysycs@gmail.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

> ---
>  drivers/gpio/gpio-sama5d2-piobu.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpio-sama5d2-piobu.c b/drivers/gpio/gpio-sama5d2-piobu.c
> index 767c33ae3213..d89da7300ddd 100644
> --- a/drivers/gpio/gpio-sama5d2-piobu.c
> +++ b/drivers/gpio/gpio-sama5d2-piobu.c
> @@ -189,7 +189,6 @@ static int sama5d2_piobu_probe(struct platform_device *pdev)
>  	if (!piobu)
>  		return -ENOMEM;
>  
> -	platform_set_drvdata(pdev, piobu);
>  	piobu->chip.label = pdev->name;
>  	piobu->chip.parent = &pdev->dev;
>  	piobu->chip.owner = THIS_MODULE,
