Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE031249BC4
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Aug 2020 13:30:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726752AbgHSL35 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Aug 2020 07:29:57 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:40514 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727019AbgHSL3w (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Aug 2020 07:29:52 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07JBTXxs022945;
        Wed, 19 Aug 2020 06:29:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1597836573;
        bh=uS246ZYUJqNZhzlIuMgrKNWH9MlogOcLDXgYSwY6hDs=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=sdrnjhxyGwBIRLsx9ey1CcGNuzwCbU4h+jQG4q4rSvBX8t3P7A5KsVmZVFkwe9SOU
         AIEtcV1Aoc80nM3DLjL5tPrnc850kQC8w21CDnpyheTbYZNTkc+TswSYJensvvoE8h
         x++qF+h4G3sv4WBwOxrlnEcpfFGe/D1uB2aJSIWA=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07JBTXTQ059446;
        Wed, 19 Aug 2020 06:29:33 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 19
 Aug 2020 06:29:33 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 19 Aug 2020 06:29:33 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07JBTTcq129102;
        Wed, 19 Aug 2020 06:29:30 -0500
Subject: Re: [PATCH] gpio: omap: improve coding style for pin config flags
To:     Drew Fustini <drew@beagleboard.org>,
        Tony Lindgren <tony@atomide.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        <linux-omap@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
References: <20200722120755.230741-1-drew@beagleboard.org>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <220612cc-8f76-cb7a-a98f-0464b7728e83@ti.com>
Date:   Wed, 19 Aug 2020 14:29:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200722120755.230741-1-drew@beagleboard.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 22/07/2020 15:07, Drew Fustini wrote:
> Change the handling of pin config flags from if/else to switch
> statement to make the code more readable and cleaner.
> 
> Suggested-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> Signed-off-by: Drew Fustini <drew@beagleboard.org>
> ---
>   drivers/gpio/gpio-omap.c | 13 +++++++++----
>   1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
> index e0eada82178c..7fbe0c9e1fc1 100644
> --- a/drivers/gpio/gpio-omap.c
> +++ b/drivers/gpio/gpio-omap.c
> @@ -899,13 +899,18 @@ static int omap_gpio_set_config(struct gpio_chip *chip, unsigned offset,
>   	u32 debounce;
>   	int ret = -ENOTSUPP;
>   
> -	if ((pinconf_to_config_param(config) == PIN_CONFIG_BIAS_DISABLE) ||
> -	    (pinconf_to_config_param(config) == PIN_CONFIG_BIAS_PULL_UP) ||
> -	    (pinconf_to_config_param(config) == PIN_CONFIG_BIAS_PULL_DOWN)) {
> +	switch (pinconf_to_config_param(config)) {
> +	case PIN_CONFIG_BIAS_DISABLE:
> +	case PIN_CONFIG_BIAS_PULL_UP:
> +	case PIN_CONFIG_BIAS_PULL_DOWN:
>   		ret = gpiochip_generic_config(chip, offset, config);
> -	} else if (pinconf_to_config_param(config) == PIN_CONFIG_INPUT_DEBOUNCE) {
> +		break;
> +	case PIN_CONFIG_INPUT_DEBOUNCE:
>   		debounce = pinconf_to_config_argument(config);
>   		ret = omap_gpio_debounce(chip, offset, debounce);
> +		break;
> +	default:
> +		break;
>   	}
>   
>   	return ret;
> 

Thank you.
Acked-by: Grygorii Strashko <grygorii.strashko@ti.com>

-- 
Best regards,
grygorii
