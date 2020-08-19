Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C43AA2494FE
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Aug 2020 08:31:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726716AbgHSGbC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Aug 2020 02:31:02 -0400
Received: from muru.com ([72.249.23.125]:40878 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726646AbgHSGbB (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 19 Aug 2020 02:31:01 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 4026F807A;
        Wed, 19 Aug 2020 06:30:59 +0000 (UTC)
Date:   Wed, 19 Aug 2020 09:31:27 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>, linux-omap@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH] gpio: omap: improve coding style for pin config flags
Message-ID: <20200819063127.GU2994@atomide.com>
References: <20200722120755.230741-1-drew@beagleboard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200722120755.230741-1-drew@beagleboard.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

* Drew Fustini <drew@beagleboard.org> [200722 12:09]:
> Change the handling of pin config flags from if/else to switch
> statement to make the code more readable and cleaner.
> 
> Suggested-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> Signed-off-by: Drew Fustini <drew@beagleboard.org>

This looks OK to me:

Acked-by: Tony Lindgren <tony@atomide.com>

I've lost track of the pending pinctrl/gpio/dts patches you've
posted :) Care to also summarized the pending ones and repost
them now that v5.9-rc1 is out?

Regards,

Tony

> ---
>  drivers/gpio/gpio-omap.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
> index e0eada82178c..7fbe0c9e1fc1 100644
> --- a/drivers/gpio/gpio-omap.c
> +++ b/drivers/gpio/gpio-omap.c
> @@ -899,13 +899,18 @@ static int omap_gpio_set_config(struct gpio_chip *chip, unsigned offset,
>  	u32 debounce;
>  	int ret = -ENOTSUPP;
>  
> -	if ((pinconf_to_config_param(config) == PIN_CONFIG_BIAS_DISABLE) ||
> -	    (pinconf_to_config_param(config) == PIN_CONFIG_BIAS_PULL_UP) ||
> -	    (pinconf_to_config_param(config) == PIN_CONFIG_BIAS_PULL_DOWN)) {
> +	switch (pinconf_to_config_param(config)) {
> +	case PIN_CONFIG_BIAS_DISABLE:
> +	case PIN_CONFIG_BIAS_PULL_UP:
> +	case PIN_CONFIG_BIAS_PULL_DOWN:
>  		ret = gpiochip_generic_config(chip, offset, config);
> -	} else if (pinconf_to_config_param(config) == PIN_CONFIG_INPUT_DEBOUNCE) {
> +		break;
> +	case PIN_CONFIG_INPUT_DEBOUNCE:
>  		debounce = pinconf_to_config_argument(config);
>  		ret = omap_gpio_debounce(chip, offset, debounce);
> +		break;
> +	default:
> +		break;
>  	}
>  
>  	return ret;
> -- 
> 2.25.1
> 
