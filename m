Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB9E01B270B
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2020 15:03:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728391AbgDUNDC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Apr 2020 09:03:02 -0400
Received: from mga18.intel.com ([134.134.136.126]:43388 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728285AbgDUNDC (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 21 Apr 2020 09:03:02 -0400
IronPort-SDR: YYmp132VINyO4epBEgINVsmUS0kb+BKucTUekILYfIYrCw+uoOuVYYbUD38pGq1DZuYgc99yp6
 cbQK8EhDpWyA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2020 06:03:01 -0700
IronPort-SDR: t9IDWKfEdiAcuR1hEbOEz3hoSJnPkGGdqaqjjMjlZjn8aGfmmStgKhZSKot0kSg4TyLO6sDekz
 AEQjJ4ZQ6c8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,410,1580803200"; 
   d="scan'208";a="258704512"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga006.jf.intel.com with ESMTP; 21 Apr 2020 06:02:57 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jQsYG-002F5y-6r; Tue, 21 Apr 2020 16:03:00 +0300
Date:   Tue, 21 Apr 2020 16:03:00 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Paul Thomas <pthomas8589@gmail.com>
Subject: Re: [PATCH v3 1/3] gpio: pca953x: Rewrite ->get_multiple() function
Message-ID: <20200421130300.GK185537@smile.fi.intel.com>
References: <20200420172752.33588-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200420172752.33588-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Apr 20, 2020 at 08:27:50PM +0300, Andy Shevchenko wrote:
> The commit 96d7c7b3e654 ("gpio: gpio-pca953x, Add get_multiple function")
> basically did everything wrong from style and code reuse perspective, i.e.
> - it didn't utilize existing PCA953x internal helpers
> - it didn't utilize bitmap API
> - it misses the point that ilog2(), besides that BANK_SFT is useless,
>   can be used in macros
> - it has indentation issues.
> 
> Rewrite the function completely.

Bart, Linus, please, consider this series to be applied, because it has Uwe's fixes.
We may still discuss the approach with ->get_multiple(), though.

For the record, should some of us volunteer to be a reviewer for this driver.
It's awful that almost every release we get something either ugly or broken in it.
Uwe, would you like to be a designated reviewer (I would also support)?

> Cc: Paul Thomas <pthomas8589@gmail.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpio-pca953x.c | 41 ++++++++++---------------------------
>  1 file changed, 11 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index 60ae18e4b5f5a..41be681ae77c2 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -115,7 +115,6 @@ MODULE_DEVICE_TABLE(acpi, pca953x_acpi_ids);
>  
>  #define MAX_BANK 5
>  #define BANK_SZ 8
> -#define BANK_SFT 3 /* ilog2(BANK_SZ) */
>  #define MAX_LINE	(MAX_BANK * BANK_SZ)
>  
>  #define NBANK(chip) DIV_ROUND_UP(chip->gpio_chip.ngpio, BANK_SZ)
> @@ -469,38 +468,20 @@ static int pca953x_gpio_get_direction(struct gpio_chip *gc, unsigned off)
>  }
>  
>  static int pca953x_gpio_get_multiple(struct gpio_chip *gc,
> -				      unsigned long *mask, unsigned long *bits)
> +				     unsigned long *mask, unsigned long *bits)
>  {
>  	struct pca953x_chip *chip = gpiochip_get_data(gc);
> -	unsigned int reg_val;
> -	int offset, value, i, ret = 0;
> -	u8 inreg;
> +	DECLARE_BITMAP(reg_val, MAX_LINE);
> +	int ret;
>  
> -	/* Force offset outside the range of i so that
> -	 * at least the first relevant register is read
> -	 */
> -	offset = gc->ngpio;
> -	for_each_set_bit(i, mask, gc->ngpio) {
> -		/* whenever i goes into a new bank update inreg
> -		 * and read the register
> -		 */
> -		if ((offset >> BANK_SFT) != (i >> BANK_SFT)) {
> -			offset = i;
> -			inreg = pca953x_recalc_addr(chip, chip->regs->input,
> -						    offset, true, false);
> -			mutex_lock(&chip->i2c_lock);
> -			ret = regmap_read(chip->regmap, inreg, &reg_val);
> -			mutex_unlock(&chip->i2c_lock);
> -			if (ret < 0)
> -				return ret;
> -		}
> -		/* reg_val is relative to the last read byte,
> -		 * so only shift the relative bits
> -		 */
> -		value = (reg_val >> (i % 8)) & 0x01;
> -		__assign_bit(i, bits, value);
> -	}
> -	return ret;
> +	mutex_lock(&chip->i2c_lock);
> +	ret = pca953x_read_regs(chip, chip->regs->input, reg_val);
> +	mutex_unlock(&chip->i2c_lock);
> +	if (ret)
> +		return ret;
> +
> +	bitmap_replace(bits, bits, reg_val, mask, gc->ngpio);
> +	return 0;
>  }
>  
>  static void pca953x_gpio_set_multiple(struct gpio_chip *gc,
> -- 
> 2.26.1
> 

-- 
With Best Regards,
Andy Shevchenko


