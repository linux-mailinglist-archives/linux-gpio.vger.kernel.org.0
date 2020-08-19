Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71F70249BAF
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Aug 2020 13:26:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727818AbgHSLZ6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Aug 2020 07:25:58 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:48752 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727120AbgHSLZz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Aug 2020 07:25:55 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07JBPeYY087325;
        Wed, 19 Aug 2020 06:25:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1597836340;
        bh=d8xkBAnSbq3umBZnWpxmsCEjKGQKRE34DIf3IK1myR8=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=hpaLGLgGICXHASzY7oga7ddBQ3Me9Q62QSpPJUPslECNguzUGATsEZYsCg+KS9l/t
         L+dL5JOnxkjYiKuwBFI87SZn/jiW+gXZqjQ72PIdPGktsXwSGyIe/LPBWRRiG2PE4v
         jt6YCTCJcnPYbI/byDrENhPGJVFrRBFMPZweVayA=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07JBPewB079926
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 19 Aug 2020 06:25:40 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 19
 Aug 2020 06:23:18 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 19 Aug 2020 06:23:18 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07JBNGkg045953;
        Wed, 19 Aug 2020 06:23:17 -0500
Subject: Re: [PATCH] gpio: omap: Fix warnings if PM is disabled
To:     Tony Lindgren <tony@atomide.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     <linux-gpio@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Arnd Bergmann <arnd@arndb.de>
References: <20200819092445.15702-1-tony@atomide.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <55e4be8a-86da-7682-be7e-a969d2d0f4fb@ti.com>
Date:   Wed, 19 Aug 2020 14:23:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200819092445.15702-1-tony@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 19/08/2020 12:24, Tony Lindgren wrote:
> Fix warnings for omap_gpio_resume and omap_gpio_suspend
> defined but not used when PM is disabled as noticed when
> doing make randconfig builds.
> 
> Fixes: f02a03985d06 ("gpio: omap: Add missing PM ops for suspend")
> Cc: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>   drivers/gpio/gpio-omap.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
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

Thank you.
Acked-by: Grygorii Strashko <grygorii.strashko@ti.com>

-- 
Best regards,
grygorii
