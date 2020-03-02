Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE5271758B4
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Mar 2020 11:53:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727146AbgCBKxJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Mar 2020 05:53:09 -0500
Received: from mga06.intel.com ([134.134.136.31]:54599 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727027AbgCBKxJ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 2 Mar 2020 05:53:09 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 02 Mar 2020 02:53:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,506,1574150400"; 
   d="scan'208";a="228373133"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga007.jf.intel.com with ESMTP; 02 Mar 2020 02:53:07 -0800
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1j8ihB-0066wg-NL; Mon, 02 Mar 2020 12:53:09 +0200
Date:   Mon, 2 Mar 2020 12:53:09 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpiolib: Fix inverted check in gpiochip_remove()
Message-ID: <20200302105309.GP1224808@smile.fi.intel.com>
References: <20200302082448.11795-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200302082448.11795-1-geert+renesas@glider.be>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 02, 2020 at 09:24:48AM +0100, Geert Uytterhoeven wrote:
> The optimization to check for requested lines actually optimized for the
> uncomon error case, where one of the GPIO lines is still in use.
> Hence the error message must be printed when the loop is terminated
> early, not when it went through all available GPIO lines.
> 
> Fixes: 869233f81337bfb3 ("gpiolib: Optimize gpiochip_remove() when check for requested line")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Noticed by review, tested by creating and destroying an otherwise unused
> GPIO aggregator, which triggers:
> 
>     gpio gpiochip8: REMOVING GPIOCHIP WITH GPIOS STILL REQUESTED

Thank you!

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Linus, see below.

> ---
>  drivers/gpio/gpiolib.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 4e78bdc2739693c3..6180cf84fab7ce5e 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1823,7 +1823,7 @@ void gpiochip_remove(struct gpio_chip *chip)
>  	}
>  	spin_unlock_irqrestore(&gpio_lock, flags);
>  
> -	if (i == gdev->ngpio)
> +	if (i != gdev->ngpio)

I prefer more explicit <.

I had sent a patch (before I noticed this), so it's up to Linus which one to choose.

>  		dev_crit(&gdev->dev,
>  			 "REMOVING GPIOCHIP WITH GPIOS STILL REQUESTED\n");
>  
> -- 
> 2.17.1
> 

-- 
With Best Regards,
Andy Shevchenko


