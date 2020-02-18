Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1115116239F
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2020 10:42:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726338AbgBRJmI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Feb 2020 04:42:08 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:37158 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726293AbgBRJmH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Feb 2020 04:42:07 -0500
Received: by mail-wm1-f65.google.com with SMTP id a6so2092993wme.2
        for <linux-gpio@vger.kernel.org>; Tue, 18 Feb 2020 01:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=iSpUEW7beHak9UFrM6ih/G70K0ztc6Y3OmsEa5YMS5I=;
        b=AU8BMEdHS2+zOtGQ5oh+Xfc3PTOg7SSXbjXfZNjvQDQEGL28W3Vzys5I6GuBWU+WzU
         IRIornPAr3QGw9Fs/tV2y1jjC7nXn1lCWsonLmvTw2grML8+9n/KLfvHeJVt3PYFEYVD
         hv7v4pnz3i6grhRfKP/20gv3cMmQkw4WFElD3Pibh3Wd9mLUhFjKt4JwrIsfMX2LAzkq
         GiJ9zKeEvg91pVZbaIRA+kHY4LfgQXbCmA02PlIhViCERfDyxc3nLfc37o0+bt28UkR9
         WmSNh9UtraWmEHah/zTkR6LkYVuA/Trb8SY4XxRIShbSGdPxRgTcS6UcxuqU91yype3P
         S1LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iSpUEW7beHak9UFrM6ih/G70K0ztc6Y3OmsEa5YMS5I=;
        b=tl4KPI3XkGLKs4b4G3gT5qm82ZD1QBlAEJ7/zGODTcHrZwf7Y3nIrWd9MY2qqF86JL
         /hQASNBoDWahgJXLSVnbX2IYCHhrQRpkOOP22tyIFnmeRBKlLw/2PcnB9P+gxGNWdc1O
         nMuM8ZOv7Nk83uSAxPYRBy/euu6AChGuu4tMO9E4F0M06K/CBYguAmiweHYSOiCcVl3D
         dKMm0fHb1myMLbLjmyDYyjlTDS/PCb5/S3OKxpiW7/5GP+GD4VrHEGKg/Za954CmQ+D/
         MnjdsOQSO6n0k2pW9zF9zP2obhkAeQoEn41tNrV8NnCGhyUrSjpNWoKwsTh0nY8D5IDP
         1YxQ==
X-Gm-Message-State: APjAAAXC3qwqazN3sn73aSqbMVmJfDbPT512FD+JQHXiS9IQBVy/9IdS
        P7NPlco+soEKxSqpReyahKQECg==
X-Google-Smtp-Source: APXvYqwMloa/+poSBCxwhlV66qSC7pyEfKb3TWpN7dVptDyzjqcUEWDGxXop8faC5858jO3UJIYwYQ==
X-Received: by 2002:a7b:ce18:: with SMTP id m24mr2105877wmc.123.1582018926170;
        Tue, 18 Feb 2020 01:42:06 -0800 (PST)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id y17sm5041589wrs.82.2020.02.18.01.42.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Feb 2020 01:42:05 -0800 (PST)
Subject: Re: [PATCH 2/6] nvmem: fix memory leak in error path
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Khouloud Touil <ktouil@baylibre.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20200217195435.9309-1-brgl@bgdev.pl>
 <20200217195435.9309-3-brgl@bgdev.pl>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <f539c993-52b5-766d-d6e5-51836998f445@linaro.org>
Date:   Tue, 18 Feb 2020 09:42:04 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200217195435.9309-3-brgl@bgdev.pl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 17/02/2020 19:54, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> We need to remove the ida mapping when returning from nvmem_register()
> with an error.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Was too quick in my last reply..

> ---
>   drivers/nvmem/core.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> index ef326f243f36..b0be03d5f240 100644
> --- a/drivers/nvmem/core.c
> +++ b/drivers/nvmem/core.c
> @@ -353,7 +353,7 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
>   		nvmem->wp_gpio = gpiod_get_optional(config->dev, "wp",
>   						    GPIOD_OUT_HIGH);
>   	if (IS_ERR(nvmem->wp_gpio))
> -		return ERR_CAST(nvmem->wp_gpio);
> +		goto err_ida_remove;

Looks like this is adding  nvmem leak here.
May be something like this should help:


if (IS_ERR(nvmem->wp_gpio)) {
	rval =  ERR_CAST(nvmem->wp_gpio);
	ida_simple_remove(&nvmem_ida, nvmem->id);
	kfree(nvmem);
	return rval;

}

--srini
>   
>   
>   	kref_init(&nvmem->refcnt);
> @@ -430,6 +430,8 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
>   	device_del(&nvmem->dev);
>   err_put_device:
>   	put_device(&nvmem->dev);
> +err_ida_remove:
> +	ida_simple_remove(&nvmem_ida, nvmem->id);
>   
>   	return ERR_PTR(rval);
>   }
> 
