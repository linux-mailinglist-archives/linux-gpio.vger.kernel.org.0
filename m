Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4A9930E15
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2019 14:27:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726330AbfEaM1r (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 31 May 2019 08:27:47 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:45493 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726415AbfEaM1r (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 31 May 2019 08:27:47 -0400
Received: from [192.168.1.110] ([77.7.63.28]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MMoXE-1hGFi146Q0-00Il8N; Fri, 31 May 2019 14:27:30 +0200
Subject: Re: [PATCH -next] x86: apuv2: Make two symbols static
To:     YueHaibing <yuehaibing@huawei.com>, info@metux.net,
        dvhart@infradead.org, andy@infradead.org, linus.walleij@linaro.org
Cc:     linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20190529143844.23084-1-yuehaibing@huawei.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <abbb799c-07d1-1c8e-dac0-259678f53a20@metux.net>
Date:   Fri, 31 May 2019 14:27:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190529143844.23084-1-yuehaibing@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:9EgrzZs0sVlzNy1LbqYZBr4fsjC/c0wL4kwv8y8gUl+ppMRDt/N
 /Tl9/jXG828zpp9Q6XVDpIoHj3NKDMi8HVhsSftaZSnO0fvDNF/MEmykYzy09URxMho1JdS
 FQ/Lagz4RFiFs8CZVgHYuUPabctTlJ61WKy815SAh7l4QFCJguHJwbnY1dM71yxyRFg9PFl
 8NDvRNPvQ3cTXo+XouDzw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:1RAZlWEqpOk=:ZHh41jLhluryaRA021Cpdu
 yLgCVf1xRyPN4VVCEHQWZ/gWtqTTgMVohjN52ZjKgOyZZdnRg/+LfZEaRkUHQy1WB18ZOqjja
 /6m3yRDGV279qBsDHmFPaHlQ1PNRJZz7jj1AL78Te5ycExrax4eEVguTlE+RkSDDnmh3Do+9G
 Cz4awr374VzRt3ykEzm4HgzktTgDFHYYpiRCsT1f9cARJthTa+qGAP1amEXBlaYFLYTRA82CG
 kuwRt9mdwO905KXMo5du3YEovC1Hketk3UCgCSTttKBAJJ0qvxqmw2vkQbJwKRRCxv5PyfpAD
 SgY5vejr5o0NBMEy21ZhbUEXPx+iJZtFM1PgzGNwy3BpkEs4gAW4EfZ/aTfpG/022f34Yvrag
 SofuX3pcKpKQY2m4A13mM5objPps2B05mV8nJSAvWB4bwcn4u3AI1/+tktfFump2BUt3kc2Yx
 USnECAXXyRDv8916QxYBRCUj6HCyl5V+ZvHDkxgBBPdUhlEdLkmF5iwMCZxaNXehHjMMLwQSX
 UJUansj64azhcnw67ml1pa2ipS/iiHIzvBbpjLSkxXDHdFR47ZGHk9P2ohlbg3MKvqumPi5lc
 kaHx1smnR1o5Qjwk/XDzvaCPS+nyXj0EcDKykDn/tEUpF+XPahB2Tn9O6zmSKbgAtnvMeUscg
 g6BXU7FuWQjYG0Dre1M+V73TekRFLb1Vw4HDbuvbYysGvNreI1tqGaszlfImyBxEAILL95g5+
 XD2e/mE729RD2DMSiRAl8HAzkMZBf5t1RfQwaD84gkcEoNv+2TWnmdO0QSU=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 29.05.19 16:38, YueHaibing wrote:
> Fix sparse warnings:
> 
> drivers/platform/x86/pcengines-apuv2.c:80:27: warning: symbol 'gpios_led_table' was not declared. Should it be static?
> drivers/platform/x86/pcengines-apuv2.c:113:27: warning: symbol 'gpios_key_table' was not declared. Should it be static?
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/platform/x86/pcengines-apuv2.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/pcengines-apuv2.c b/drivers/platform/x86/pcengines-apuv2.c
> index c1ca931e1fab..b0d3110ae378 100644
> --- a/drivers/platform/x86/pcengines-apuv2.c
> +++ b/drivers/platform/x86/pcengines-apuv2.c
> @@ -77,7 +77,7 @@ static const struct gpio_led_platform_data apu2_leds_pdata = {
>  	.leds		= apu2_leds,
>  };
>  
> -struct gpiod_lookup_table gpios_led_table = {
> +static struct gpiod_lookup_table gpios_led_table = {
>  	.dev_id = "leds-gpio",
>  	.table = {
>  		GPIO_LOOKUP_IDX(AMD_FCH_GPIO_DRIVER_NAME, APU2_GPIO_LINE_LED1,
> @@ -110,7 +110,7 @@ static const struct gpio_keys_platform_data apu2_keys_pdata = {
>  	.name		= "apu2-keys",
>  };
>  
> -struct gpiod_lookup_table gpios_key_table = {
> +static struct gpiod_lookup_table gpios_key_table = {
>  	.dev_id = "gpio-keys-polled",
>  	.table = {
>  		GPIO_LOOKUP_IDX(AMD_FCH_GPIO_DRIVER_NAME, APU2_GPIO_LINE_MODESW,
> 

thanks.


Acked-By: Enrico Weigelt, metux IT consult <info@metux.net>


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
