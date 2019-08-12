Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 610988A2C6
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Aug 2019 17:59:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725843AbfHLP76 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Aug 2019 11:59:58 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:39188 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725648AbfHLP76 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Aug 2019 11:59:58 -0400
Received: by mail-pf1-f193.google.com with SMTP id f17so45910315pfn.6
        for <linux-gpio@vger.kernel.org>; Mon, 12 Aug 2019 08:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=R8zKtsrZlzRiuqo5Lr6uS7Zz5vZz4cfJeHF7vKw2cRo=;
        b=QkpaS7c2K1Rce00zT6rwH6D9yFdfJjH4WNF3Tb5YmjP5nBT6CW7bQjJPOAG3eHqAsR
         IA40v/3Lhx81VBN1nqXtCzFChgoeAysYfRiD6obvt7x4NHZIrZOrJvvySLLHIrG32ILU
         g03LIQxp0IhYeOM1I0nIuCGZHWzdWih2H98lo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=R8zKtsrZlzRiuqo5Lr6uS7Zz5vZz4cfJeHF7vKw2cRo=;
        b=fsGAxaApcNRPWVU6BTLCE26Hx7HXENrVpGEvPRSVFT6ykbO57uEJHk4HdUU/saxbWh
         N2mvGzWW92p/TQmeh1GEx+uuG5bBnsI0l91tG9fev9XYKKIe4wuCvPIEXtx/odDxOU1b
         bJWL7MfEL2YRssBKEEeLHtrl+dfr+6nf6HdO+MkenUTS+ipycyiysBY3bjI5vwftNB7b
         +fTISTZxEXzmOtkklW2Jn43043Pq2c/sgHzJ+6ka9le8vxOdrJ0rtePOA9URBf8NHs1+
         JEJzI3rO0YE9yafhQedoKjrsvVtYyUsVVvbbyln3TbxjqaBGOYjnAGE14g6ckkfAqeRC
         oU7A==
X-Gm-Message-State: APjAAAWN/WyxET0Eqd5bHlDXxxqQM+kZJP/zDYUYTHIXfJ4ZyCOt9eTk
        VmZZw+pE18oBaVogrGHqpPlltg==
X-Google-Smtp-Source: APXvYqzXJnpllqpIYFF1YgpprMf8SnB0J0ZhrK1f1CecaLBpD4rUSUBKmGYtmj1ZEQ/Sur/poiTxQA==
X-Received: by 2002:a17:90a:358a:: with SMTP id r10mr22263pjb.30.1565625597884;
        Mon, 12 Aug 2019 08:59:57 -0700 (PDT)
Received: from [10.136.13.65] ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id f6sm108604526pga.50.2019.08.12.08.59.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Aug 2019 08:59:57 -0700 (PDT)
Subject: Re: [PATCH] pinctrl: bcm-iproc: Use SPDX header
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Cc:     Pramod Kumar <pramodku@broadcom.com>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>
References: <20190812130401.22769-1-linus.walleij@linaro.org>
From:   Scott Branden <scott.branden@broadcom.com>
Message-ID: <60da7536-2d41-69b2-5730-4678b6e84cf9@broadcom.com>
Date:   Mon, 12 Aug 2019 08:59:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190812130401.22769-1-linus.walleij@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On 2019-08-12 6:04 a.m., Linus Walleij wrote:
> This convert the BCM IPROC driver to use the SPDX header
> for indicating GPL v2.0 only licensing.
>
> Cc: Pramod Kumar <pramodku@broadcom.com>
> Cc: Ray Jui <rjui@broadcom.com>
> Cc: Scott Branden <sbranden@broadcom.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>   drivers/pinctrl/bcm/pinctrl-iproc-gpio.c | 12 +-----------
>   1 file changed, 1 insertion(+), 11 deletions(-)
>
> diff --git a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
> index b70058caee50..18ff01727e0e 100644
> --- a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
> +++ b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
> @@ -1,17 +1,7 @@
> +// SPDX-License-Identifier: GPL-2.0-only
>   /*
>    * Copyright (C) 2014-2017 Broadcom
>    *
> - * This program is free software; you can redistribute it and/or
> - * modify it under the terms of the GNU General Public License as
> - * published by the Free Software Foundation version 2.
> - *
> - * This program is distributed "as is" WITHOUT ANY WARRANTY of any
> - * kind, whether express or implied; without even the implied warranty
> - * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> - * GNU General Public License for more details.
> - */
> -
> -/*

Please leave the file description comment separate from the license 
header/copyright notices.

ie. leave the above 3 lines intact.

>    * This file contains the Broadcom Iproc GPIO driver that supports 3
>    * GPIO controllers on Iproc including the ASIU GPIO controller, the
>    * chipCommonG GPIO controller, and the always-on GPIO controller. Basic
