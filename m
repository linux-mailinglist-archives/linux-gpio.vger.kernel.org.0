Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D221252C65
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Aug 2020 13:24:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728842AbgHZLXy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Aug 2020 07:23:54 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:43262 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728925AbgHZLXn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Aug 2020 07:23:43 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07QBNOw4052331;
        Wed, 26 Aug 2020 06:23:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1598441004;
        bh=DRtBxRFRiFGn6igRLk1g28R+FpZYk/3k74FzagIipkg=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=we+R3fg6fdtS4alXj7YpXJQHda6znTRuxSGjCb7jVcHlIARN9MIdso8Ig5dVZfjsP
         xZcf3qoN7LP/Tt//PK4/2HA+X/iw4rA7M+8HvV4b9nZzGSfxXEt5K6B/2OUx3Htpz2
         aLZp94XAQtiYRroDeGQttwqao8EJeKxanmRPPBME=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07QBNOMJ104622
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 26 Aug 2020 06:23:24 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 26
 Aug 2020 06:23:24 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 26 Aug 2020 06:23:24 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07QBNMlF030213;
        Wed, 26 Aug 2020 06:23:23 -0500
Subject: Re: [PATCH] gpio: omap: Pass __maybe_unused to the suspend()/resume()
 hooks
To:     Fabio Estevam <festevam@gmail.com>, <linus.walleij@linaro.org>
CC:     <khilman@kernel.org>, <tony@atomide.com>,
        <linux-gpio@vger.kernel.org>
References: <20200824130327.21113-1-festevam@gmail.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <ef3101cd-6cf1-d571-7ac6-6208373c0155@ti.com>
Date:   Wed, 26 Aug 2020 14:23:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200824130327.21113-1-festevam@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 24/08/2020 16:03, Fabio Estevam wrote:
> When building a defconfig that does not have CONFIG_PM_SLEEP
> selected, the following build warnings are seen:
> 
> drivers/gpio/gpio-omap.c:1531:12: warning: 'omap_gpio_resume' defined but not used [-Wunused-function]
> drivers/gpio/gpio-omap.c:1519:12: warning: 'omap_gpio_suspend' defined but not used [-Wunused-function]
> 
> Pass __maybe_unused to avoid these warnings.
> 
> Fixes: f02a03985d06 ("gpio: omap: Add missing PM ops for suspend")
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>   drivers/gpio/gpio-omap.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
> index 7fbe0c9e1fc1..0ea640fb636c 100644
> --- a/drivers/gpio/gpio-omap.c
> +++ b/drivers/gpio/gpio-omap.c
> @@ -1516,7 +1516,7 @@ static int __maybe_unused omap_gpio_runtime_resume(struct device *dev)
>   	return 0;
>   }
>   
> -static int omap_gpio_suspend(struct device *dev)
> +static int __maybe_unused omap_gpio_suspend(struct device *dev)
>   {
>   	struct gpio_bank *bank = dev_get_drvdata(dev);
>   
> @@ -1528,7 +1528,7 @@ static int omap_gpio_suspend(struct device *dev)
>   	return omap_gpio_runtime_suspend(dev);
>   }
>   
> -static int omap_gpio_resume(struct device *dev)
> +static int __maybe_unused omap_gpio_resume(struct device *dev)
>   {
>   	struct gpio_bank *bank = dev_get_drvdata(dev);
>   
> 

Duplicates
https://www.spinics.net/lists/arm-kernel/msg830596.html

-- 
Best regards,
grygorii
