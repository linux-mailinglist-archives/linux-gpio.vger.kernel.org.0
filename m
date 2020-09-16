Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5572026CC8A
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Sep 2020 22:46:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726501AbgIPUpn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Sep 2020 16:45:43 -0400
Received: from mga03.intel.com ([134.134.136.65]:21603 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726325AbgIPRDY (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 16 Sep 2020 13:03:24 -0400
IronPort-SDR: 0S+lRSoIFN1hNt1uyl4BizDuBXwzBRsTUFIYFjCPa6ZXIJ0Dbka/0/aZ+Bcf6hFu5QN4F5Xbd4
 sl440QxVMHAw==
X-IronPort-AV: E=McAfee;i="6000,8403,9745"; a="159522952"
X-IronPort-AV: E=Sophos;i="5.76,433,1592895600"; 
   d="scan'208";a="159522952"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2020 07:29:37 -0700
IronPort-SDR: JLxWPzmpU6s9li6Ml4Q2lqYdMMIDVcaFdVWu1zenXIZs0Q9diPfrJ+nt76t3ZcgyCOsIBZl8YS
 vfwsGEKSfZpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,433,1592895600"; 
   d="scan'208";a="336040902"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 16 Sep 2020 07:29:33 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kIYR8-00H6Ky-0Q; Wed, 16 Sep 2020 17:29:30 +0300
Date:   Wed, 16 Sep 2020 17:29:30 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Anders Roxell <anders.roxell@linaro.org>,
        linux-gpio@vger.kernel.org, linux-next@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH next] gpiolib: check for parent device in
 devprop_gpiochip_set_names()
Message-ID: <20200916142930.GK3956970@smile.fi.intel.com>
References: <20200916134327.3435-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200916134327.3435-1-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 16, 2020 at 03:43:27PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> It's possible for a GPIO chip to not have a parent device (whose
> properties we inspect for 'gpio-line-names'). In this case we should
> simply return from devprop_gpiochip_set_names(). Add an appropriate
> check for this use-case.

Ah, nice!
Can we also add a small comment in the code, b/c w/o it I would stumble over
and eager to remove looks-as-unneeded check?
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Fixes: 7cba1a4d5e16 ("gpiolib: generalize devprop_gpiochip_set_names() for device properties")
> Reported-by: Anders Roxell <anders.roxell@linaro.org>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  drivers/gpio/gpiolib.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index b7b608ef9..ac2c77edc 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -375,6 +375,9 @@ static int devprop_gpiochip_set_names(struct gpio_chip *chip)
>  	int ret, i;
>  	int count;
>  
> +	if (!dev)
> +		return 0;
> +
>  	count = device_property_string_array_count(dev, "gpio-line-names");
>  	if (count < 0)
>  		return 0;
> -- 
> 2.26.1
> 

-- 
With Best Regards,
Andy Shevchenko


