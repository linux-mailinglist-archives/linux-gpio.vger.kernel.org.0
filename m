Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2478220993
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2020 12:09:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728048AbgGOKJi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Jul 2020 06:09:38 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:43622 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725850AbgGOKJh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jul 2020 06:09:37 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06FA9XaT078988;
        Wed, 15 Jul 2020 05:09:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1594807773;
        bh=sMTWcQwj9SSVWBBOYJxyCg8cA16h64wowoGr34SIHPg=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=vboyXu33Odc33bxOb9zYBNP19dEf/g3Hs5QUsKdc7m2H9sgEGErwByuimfya75MTm
         MYmVYABrsdcgaeH7ZW+mjsjIz2Q2YnlljuSrr78x7vyzpvBKx5OyeBPqs5nCsb69Dv
         FmgzhSSFkmOTGRnh1zGTMrQkHP6nGEDYqBEOTIkQ=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06FA9XsK021398
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 15 Jul 2020 05:09:33 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 15
 Jul 2020 05:09:32 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 15 Jul 2020 05:09:32 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06FA9JOd099515;
        Wed, 15 Jul 2020 05:09:23 -0500
Subject: Re: [PATCH] gpio: omap: handle pin config bias flags
To:     Drew Fustini <drew@beagleboard.org>,
        Tony Lindgren <tony@atomide.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        <linux-omap@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20200709223401.780051-1-drew@beagleboard.org>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <1a0180f3-7693-672a-8070-7032854bb73c@ti.com>
Date:   Wed, 15 Jul 2020 13:09:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200709223401.780051-1-drew@beagleboard.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 10/07/2020 01:34, Drew Fustini wrote:
> Modify omap_gpio_set_config() to handle pin config bias flags by calling
> gpiochip_generic_config().
> 
> The pin group for the gpio line must have the corresponding pinconf
> properties:
> 
> PIN_CONFIG_BIAS_PULL_UP requires "pinctrl-single,bias-pullup"
> PIN_CONFIG_BIAS_PULL_DOWN requires "pinctrl-single,bias-pulldown"
> 
> This is necessary for pcs_pinconf_set() to find the requested bias
> parameter in the PIN_MAP_TYPE_CONFIGS_GROUP pinctrl map.
> 
> Signed-off-by: Drew Fustini <drew@beagleboard.org>
> ---
>   drivers/gpio/gpio-omap.c | 21 +++++++++++++++++----
>   1 file changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
> index b8e2ecc3eade..a471a152f318 100644
> --- a/drivers/gpio/gpio-omap.c
> +++ b/drivers/gpio/gpio-omap.c
> @@ -896,12 +896,25 @@ static int omap_gpio_set_config(struct gpio_chip *chip, unsigned offset,
>   				unsigned long config)
>   {
>   	u32 debounce;
> +	int ret;

ret =  -ENOTSUPP;

>   
> -	if (pinconf_to_config_param(config) != PIN_CONFIG_INPUT_DEBOUNCE)
> -		return -ENOTSUPP;
> +	if ((pinconf_to_config_param(config) == PIN_CONFIG_BIAS_DISABLE) ||
> +	    (pinconf_to_config_param(config) == PIN_CONFIG_BIAS_PULL_UP) ||
> +	    (pinconf_to_config_param(config) == PIN_CONFIG_BIAS_PULL_DOWN))
> +	{
> +		ret = gpiochip_generic_config(chip, offset, config);
> +	}
> +	else if (pinconf_to_config_param(config) == PIN_CONFIG_INPUT_DEBOUNCE)
> +	{
> +		debounce = pinconf_to_config_argument(config);
> +		ret = omap_gpio_debounce(chip, offset, debounce);
> +	}
> +	else
> +	{
> +		ret = -ENOTSUPP;
> +	}

drop above "else"?

>   
> -	debounce = pinconf_to_config_argument(config);
> -	return omap_gpio_debounce(chip, offset, debounce);
> +	return ret;
>   }
>   
>   static void omap_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
> 

Minor comment, Otherwise:
Acked-by: Grygorii Strashko <grygorii.strashko@ti.com>

-- 
Best regards,
grygorii
