Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A32213B702
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2020 02:36:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728890AbgAOBfM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jan 2020 20:35:12 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:35613 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728874AbgAOBfM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jan 2020 20:35:12 -0500
Received: by mail-pj1-f66.google.com with SMTP id s7so6818844pjc.0;
        Tue, 14 Jan 2020 17:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=HtbP7TN0dIXc8VrE7ZmhXKNLNzpdhRSTmtA7hff41gs=;
        b=uZFk91MhHXvsIDL7rzOsfPRCSaWlKk3XuAwSFVmBgqwD+NRZD/DuFWip+/yrYde/6M
         8k9E+JK5phL+u3DKefR/hYf/Sq6pMhVdyvJYpAhWeuWq99+u2hfo4Bi4wy3bAeEpXU89
         RzkfaFRd23PUvQ8n0/588o/9FCOxTmaSvKW/n4KJsNxK5jXNkqGio76HFVhwF4Jvcdex
         5W3NWC5MpJJA3Y5NMyopIDVoxNd75uHCZFOwsCs4G0w0kmXWobXUc3U6jeiaR/CqYqu5
         VG7B9by4qWM7TzcOpFbWZ3p6j16o9i2CCER/tUaFdsLyA0cNM+x7fwgz6uSpt7RrbOV6
         172Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=HtbP7TN0dIXc8VrE7ZmhXKNLNzpdhRSTmtA7hff41gs=;
        b=IjQFY8i70QUbE/URsfkz/ELQrkhHWAUCZTj1CdFL3HlUscedRU43gCZQ1MGconTwZz
         SBuF4QMzSHho6SUC2s71/Gx1cGYzKQ9vqIAD93Rm6cgOJWQAFN8Y7w7eGGyCUSZqlTgr
         fAK3hBMvakR987yY+2Dx3VFo04r86E/QVowAd6YTFDrv4fKRTuCn+G0vqjMsWw6OpA/j
         wN7DMQtNwofdecvwCIjbn2SeVmA/eC3KuoIvvWtAUEVAxha3Z6pPm9XiRtfNoP7h5Yj5
         zbIlFSeAOE5nwD3rodYQizvAM4OSYfKHaUYswsRmSLzyQVKrkDubmf3kcRKouaqhXzNM
         j69w==
X-Gm-Message-State: APjAAAXPcNc1ROYX7uCM0+APItDljTjCROhobm47tIkc9jQJXLB8Dl0L
        ZewwvDjce0n2Xgt1Xq6RK1DUFoHh
X-Google-Smtp-Source: APXvYqyLekBhQe7W94Th/2bxTIE2nK/qQrPfFt/QIp1Cuu23Nt6URjyDDYQcXBd+mSHoBt+oUS733A==
X-Received: by 2002:a17:90a:f314:: with SMTP id ca20mr31070149pjb.112.1579052112027;
        Tue, 14 Jan 2020 17:35:12 -0800 (PST)
Received: from ?IPv6:2402:f000:1:1501:200:5efe:166.111.139.105? ([2402:f000:1:1501:200:5efe:a66f:8b69])
        by smtp.gmail.com with ESMTPSA id c34sm18234973pgc.61.2020.01.14.17.35.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jan 2020 17:35:11 -0800 (PST)
Subject: Re: [PATCH -next] gpio: Remove the unused flags
To:     Shaokun Zhang <zhangshaokun@hisilicon.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <1579009062-7154-1-git-send-email-zhangshaokun@hisilicon.com>
From:   Jia-Ju Bai <baijiaju1990@gmail.com>
Message-ID: <9bb9cc43-444d-3084-4d67-419dde9d67b5@gmail.com>
Date:   Wed, 15 Jan 2020 09:34:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <1579009062-7154-1-git-send-email-zhangshaokun@hisilicon.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 2020/1/14 21:37, Shaokun Zhang wrote:
> drivers/gpio/gpio-grgpio.c: In function ‘grgpio_remove’:
> drivers/gpio/gpio-grgpio.c:438:16: warning: unused variable ‘flags’ [-Wunused-variable]
>    unsigned long flags;
>                   ^
> Fixes: 25d071b3f6db ("gpio: gpio-grgpio: fix possible sleep-in-atomic-context bugs in grgpio_remove()")
> Cc: Jia-Ju Bai <baijiaju1990@gmail.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Signed-off-by: Shaokun Zhang <zhangshaokun@hisilicon.com>
> ---
>   drivers/gpio/gpio-grgpio.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-grgpio.c b/drivers/gpio/gpio-grgpio.c
> index 1922adf96fc9..f954359c9544 100644
> --- a/drivers/gpio/gpio-grgpio.c
> +++ b/drivers/gpio/gpio-grgpio.c
> @@ -435,7 +435,6 @@ static int grgpio_probe(struct platform_device *ofdev)
>   static int grgpio_remove(struct platform_device *ofdev)
>   {
>   	struct grgpio_priv *priv = platform_get_drvdata(ofdev);
> -	unsigned long flags;
>   	int i;
>   	int ret = 0;
>   

Reviewed-by: Jia-Ju Bai <baijiaju1990@gmail.com>

