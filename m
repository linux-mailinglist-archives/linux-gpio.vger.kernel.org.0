Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F5D2E9C6D
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2019 14:38:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726269AbfJ3NiO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Oct 2019 09:38:14 -0400
Received: from mga18.intel.com ([134.134.136.126]:41532 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726119AbfJ3NiN (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 30 Oct 2019 09:38:13 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Oct 2019 06:38:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,247,1569308400"; 
   d="scan'208";a="203195838"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003.jf.intel.com with ESMTP; 30 Oct 2019 06:38:11 -0700
Received: from andy by smile with local (Exim 4.92.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1iPoAs-0006QN-EQ; Wed, 30 Oct 2019 15:38:10 +0200
Date:   Wed, 30 Oct 2019 15:38:10 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] gpiolib: Switch order of valid mask and hw init
Message-ID: <20191030133810.GW32742@smile.fi.intel.com>
References: <20191030122914.967-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191030122914.967-1-linus.walleij@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 30, 2019 at 01:29:14PM +0100, Linus Walleij wrote:
> The GPIO irqchip needs to initialize the valid mask
> before initializing the IRQ hardware, because sometimes
> the latter require the former to be executed first.
> 

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Reported-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Thinking of applying this for fixes to fix some part
> of the problems that Hans is seeing.
> ---
>  drivers/gpio/gpiolib.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 9afbc0612126..e865c889ba8d 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1411,11 +1411,11 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
>  
>  	machine_gpiochip_add(chip);
>  
> -	ret = gpiochip_irqchip_init_hw(chip);
> +	ret = gpiochip_irqchip_init_valid_mask(chip);
>  	if (ret)
>  		goto err_remove_acpi_chip;
>  
> -	ret = gpiochip_irqchip_init_valid_mask(chip);
> +	ret = gpiochip_irqchip_init_hw(chip);
>  	if (ret)
>  		goto err_remove_acpi_chip;
>  
> -- 
> 2.21.0
> 

-- 
With Best Regards,
Andy Shevchenko


