Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF97B1683D9
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2020 17:42:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726443AbgBUQmi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Feb 2020 11:42:38 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:35793 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726393AbgBUQmi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Feb 2020 11:42:38 -0500
Received: by mail-wr1-f67.google.com with SMTP id w12so2778652wrt.2
        for <linux-gpio@vger.kernel.org>; Fri, 21 Feb 2020 08:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=dU2FhZUg2nCekHubWuHKH9Qi01Tr3wAsi874rYY3BI8=;
        b=Z5vwtae1LsCNztwbIoExKjaWqzNs/h/oWnLldNPNgBEuLaJZaLgrERr0VI3ivLsJmb
         hc7nHMh/yNMDUb2h7uYOii6r04XrlNTY14jG/kRzfIhUJ/mVaYqibeawq5FNeYpvH4su
         aIOP3j3BLeXWHsdm8C561jaKIzzttgeoW7xKDrOmzUPAHsogqIimdULOucFzTbWr8rhN
         uW0h0UmYZqOS0dczW5jLvRMW8ZwyjACq1t/GnLI/UfiGFATr4Nw0J6Y62XGPL0HA2OQ4
         eNv/qEaSCv36XIelTbD5XG6qWcP5dvdxxy9fcbE1frMYhgVIBMdAEc4msYW1K0ud2khJ
         v0Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dU2FhZUg2nCekHubWuHKH9Qi01Tr3wAsi874rYY3BI8=;
        b=g3Q7jUj9UnARh+gjo5Zb25Jq6MP2CN3EsQtZK9J2yz6xMhy8KKLFfNKr1uzCfTyFWL
         VmdEUfxAgHM1ObZI1PDS9T6gkuALCTZz8U2VaACuzPNn/qy59rCd2PKK+431y75sefwC
         fvpK81f0eetzbs0E/0IjMwfLCuLApZii0/4pLZwQ6WYly8t/ffhVY70C837394VkjfXr
         r9LOVZTSylrtGyrk1kFLTDs90zhOQmprWpxOKoOlKM0xzTzWm15jXHXWMb7jzV3GQ5CO
         lgNU9Emp5fZK5rRWj9MDwpfcVbyacM4D9MJxGuR8wlBZbI8+1xraG3/GiCasb/0TpPIq
         bWSw==
X-Gm-Message-State: APjAAAWpviNJfOg49Xm9nXTlROBU6zhNXME1vNegdz2FzRXXLJk658vB
        NRNpjspM5K83R+zXmsaXcG6RoHXEjfM=
X-Google-Smtp-Source: APXvYqzEW8eMMaKghIYJJvqFmuMwp40oiakJn3yx4aBzoUuiaoFVtdKXFaak7l01hmWSQmn3qzzK4Q==
X-Received: by 2002:adf:dd46:: with SMTP id u6mr47574637wrm.13.1582303356072;
        Fri, 21 Feb 2020 08:42:36 -0800 (PST)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id j15sm4709860wrp.9.2020.02.21.08.42.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Feb 2020 08:42:35 -0800 (PST)
Subject: Re: [PATCH v5 1/5] nvmem: fix memory leak in error path
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Khouloud Touil <ktouil@baylibre.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20200221154837.18845-1-brgl@bgdev.pl>
 <20200221154837.18845-2-brgl@bgdev.pl>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <39750efc-47e0-5711-2619-2a14cb4dbc65@linaro.org>
Date:   Fri, 21 Feb 2020 16:42:34 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200221154837.18845-2-brgl@bgdev.pl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 21/02/2020 15:48, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> We need to free the ida mapping and nvmem struct if the write-protect
> GPIO lookup fails.
> 
> Fixes: 2a127da461a9 ("nvmem: add support for the write-protect pin")
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>


Applied this and 5/5

Thanks,
srini

> ---
>   drivers/nvmem/core.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> index 503da67dde06..2758d90d63b7 100644
> --- a/drivers/nvmem/core.c
> +++ b/drivers/nvmem/core.c
> @@ -353,8 +353,12 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
>   	else
>   		nvmem->wp_gpio = gpiod_get_optional(config->dev, "wp",
>   						    GPIOD_OUT_HIGH);
> -	if (IS_ERR(nvmem->wp_gpio))
> -		return ERR_CAST(nvmem->wp_gpio);
> +	if (IS_ERR(nvmem->wp_gpio)) {
> +		ida_simple_remove(&nvmem_ida, nvmem->id);
> +		rval = PTR_ERR(nvmem->wp_gpio);
> +		kfree(nvmem);
> +		return ERR_PTR(rval);
> +	}
>   
>   	kref_init(&nvmem->refcnt);
>   	INIT_LIST_HEAD(&nvmem->cells);
> 
