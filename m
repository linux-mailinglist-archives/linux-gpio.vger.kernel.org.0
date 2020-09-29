Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F06827C2D5
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Sep 2020 12:53:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727360AbgI2Kxb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Sep 2020 06:53:31 -0400
Received: from mga14.intel.com ([192.55.52.115]:56592 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725536AbgI2Kxb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 29 Sep 2020 06:53:31 -0400
IronPort-SDR: jAKCeDKF9cTH1XH888gZfDIFxsAdTVpEerJjxC/6WIup48L/SVsUCh0JixbfUBZ+yUANFlgYOb
 qHAJGaDzg0Hw==
X-IronPort-AV: E=McAfee;i="6000,8403,9758"; a="161389029"
X-IronPort-AV: E=Sophos;i="5.77,318,1596524400"; 
   d="scan'208";a="161389029"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2020 03:53:28 -0700
IronPort-SDR: d1dT1ERsDeSGD6+2f5WluvaQkB+E/4AMF4TBIPQhgediepRXdfvrvyZ8mtAg/YgI5y7gOcdzi0
 SC6yNt07zmxA==
X-IronPort-AV: E=Sophos;i="5.77,318,1596524400"; 
   d="scan'208";a="312173046"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2020 03:53:25 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kNDG4-002lz6-QZ; Tue, 29 Sep 2020 13:53:20 +0300
Date:   Tue, 29 Sep 2020 13:53:20 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v3 07/10] gpio: mockup: increase the number of supported
 device properties
Message-ID: <20200929105320.GF3956970@smile.fi.intel.com>
References: <20200929101004.20288-1-brgl@bgdev.pl>
 <20200929101004.20288-8-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200929101004.20288-8-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 29, 2020 at 12:10:01PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> The driver actually supports 4 properties but we only ever set up up to
> three. This will change however in upcoming patches so increase the
> number of really (as in: the number the property array can hold)
> supported properties to 4.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reported-by ? (it does not imply the necessity of Fixes tag)

> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  drivers/gpio/gpio-mockup.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
> index de778b52f355..856ba5da1e8c 100644
> --- a/drivers/gpio/gpio-mockup.c
> +++ b/drivers/gpio/gpio-mockup.c
> @@ -29,8 +29,8 @@
>   * of GPIO lines.
>   */
>  #define GPIO_MOCKUP_MAX_RANGES	(GPIO_MOCKUP_MAX_GC * 2)
> -/* Maximum of three properties + the sentinel. */
> -#define GPIO_MOCKUP_MAX_PROP	4
> +/* Maximum of four properties + the sentinel. */
> +#define GPIO_MOCKUP_MAX_PROP	5
>  
>  /*
>   * struct gpio_pin_status - structure describing a GPIO status
> -- 
> 2.26.1
> 

-- 
With Best Regards,
Andy Shevchenko


