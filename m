Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C773A598051
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Aug 2022 10:50:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242833AbiHRIs6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Aug 2022 04:48:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242666AbiHRIs5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Aug 2022 04:48:57 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 114A425E96
        for <linux-gpio@vger.kernel.org>; Thu, 18 Aug 2022 01:48:56 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id i19so1246788lfr.10
        for <linux-gpio@vger.kernel.org>; Thu, 18 Aug 2022 01:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=sTINgh/VDz3d4QttZ0lBHpq/pE2mSeJ/2JJsZAy2Pzk=;
        b=yTvK6wSsPYWnIpBu42bKxqyj3Vrm1daDtd6ZSP9jUzdiVx29095LZ091mLgbjaNEjP
         tlJnYBjq7KxcE8CvOIbCunKXaCTHpRwwuDFOesn3oIEb6NFdbTwUeSkinsmZ8vNhS8vY
         mMXZigbokDnaOBkdqXROXE/0JPWujYyqruIAwoPECIb8hyOb+pOroITC4GEihUTd5yTM
         UlNICiDYr1ZRA0ELhiglUXywVNxyxW3Bg2u9dPUW2+7J2wrdOsQDVQv3ZFvPOq0ixecX
         ugWBQNDuI5rA53GXhyAP0+Pzl98Q8Ikcq5MBqtlZ95vR9q4Pt246UvhgvlmVOjgqNpcI
         FXqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=sTINgh/VDz3d4QttZ0lBHpq/pE2mSeJ/2JJsZAy2Pzk=;
        b=cGdFc5+keS27C8n29enU9mLiFpSIf5aIGCLXahlodp1HQM91GThOSbVZKPBcyMR8Z8
         mL2y9zBlVRmq/QZOQwfSQ06ID1q7F+iPB85p9ZeB916sFnLjllIcZdprJd8emUisfW/0
         KDCCa5fEOdEEfBxrKy3F+SsVOj3hn3153C9u1jl6HsJuNNcRSfZ7+8mospXCiL8FRNNB
         guhCVeKCnZtGXWQsgkytQosOlIg4dbx9PsQed9NDF6IdaoJKrSQ+j1jGuFr2/qyIcG56
         W/nYnwHT9Jf0cSZx40nNRadBFZq5gILR7B8gcn6gNTFtMxHk+5f66qZDG43eNvqGdJ5S
         ua6w==
X-Gm-Message-State: ACgBeo1Rfyz7uSPGbtuKWf/Cpj1UMpSUrnWVEO3mXIgQe5LR7zoJlpha
        WzI03q5KY5t4/FQ6fA4jo5tbOw==
X-Google-Smtp-Source: AA6agR6MvWK/mPFFSjBJtucIJk9Iwl/WwiQ9/+pOBVD1t3AFDb744FknS3YKNSkb5rT16Zf4yGQWWw==
X-Received: by 2002:a05:6512:2285:b0:48a:e48b:4aa5 with SMTP id f5-20020a056512228500b0048ae48b4aa5mr752709lfu.556.1660812534391;
        Thu, 18 Aug 2022 01:48:54 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ae:539c:53ab:2635:d4f2:d6d5? (d15l54z9nf469l8226z-4.rev.dnainternet.fi. [2001:14bb:ae:539c:53ab:2635:d4f2:d6d5])
        by smtp.gmail.com with ESMTPSA id m21-20020a2e97d5000000b00261b21ea8a6sm137134ljj.99.2022.08.18.01.48.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Aug 2022 01:48:53 -0700 (PDT)
Message-ID: <5fa60a38-5e7b-bad1-7197-78c96939cf10@linaro.org>
Date:   Thu, 18 Aug 2022 11:48:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/2] gpio: pca9570: add slg7xl45106 support
Content-Language: en-US
To:     Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        linux-gpio@vger.kernel.org
Cc:     git-dev@amd.com, mans0n@gorani.run, devicetree@vger.kernel.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        linus.walleij@linaro.org, brgl@bgdev.pl,
        shubhrajyoti.datta@gmail.com
References: <20220817085550.18887-1-shubhrajyoti.datta@amd.com>
 <20220817085550.18887-3-shubhrajyoti.datta@amd.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220817085550.18887-3-shubhrajyoti.datta@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 17/08/2022 11:55, Shubhrajyoti Datta wrote:
> slg7xl45106 is a I2C GPO expander.
> Add a compatible string for the same. Also update the
> driver to write and read from it.

Please fix your wrapping to match coding style.

> 

>  
> @@ -94,6 +100,7 @@ static void pca9570_set(struct gpio_chip *chip, unsigned int offset, int value)
>  static int pca9570_probe(struct i2c_client *client)
>  {
>  	struct pca9570 *gpio;
> +	struct device_node *np = client->dev.of_node;
>  
>  	gpio = devm_kzalloc(&client->dev, sizeof(*gpio), GFP_KERNEL);
>  	if (!gpio)
> @@ -109,6 +116,9 @@ static int pca9570_probe(struct i2c_client *client)
>  	gpio->chip.ngpio = (uintptr_t)device_get_match_data(&client->dev);
>  	gpio->chip.can_sleep = true;
>  
> +	if (of_device_is_compatible(np, "dlg,slg7xl45106"))

Matching is done once and you have driver data for this. No compatibles
in the code, this does not scale.

> +		gpio->command = SLG7XL45106_GPO_REG;
> +
>  	mutex_init(&gpio->lock);
>  
>  	/* Read the current output level */
> @@ -121,12 +131,14 @@ static int pca9570_probe(struct i2c_client *client)
>  
>  static const struct i2c_device_id pca9570_id_table[] = {
>  	{ "pca9570", 4 },
> +	{ "slg7xl45106", 8 },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(i2c, pca9570_id_table);
>  
>  static const struct of_device_id pca9570_of_match_table[] = {
>  	{ .compatible = "nxp,pca9570", .data = (void *)4 },

This is some old tree, isn't it?

> +	{ .compatible = "dlg,slg7xl45106", .data = (void *)8 },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, pca9570_of_match_table);


Best regards,
Krzysztof
