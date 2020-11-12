Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2AA92B0115
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Nov 2020 09:16:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725941AbgKLIQn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Nov 2020 03:16:43 -0500
Received: from mga02.intel.com ([134.134.136.20]:51872 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725884AbgKLIQn (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Nov 2020 03:16:43 -0500
IronPort-SDR: qRNntFaU2XfC348pKquxbo1AXvWO1D0lsPTo+bKOXRb1FfA0e/rU3r4bNuwpJjJW0D2pzPBxSN
 u62pu6CHvVfA==
X-IronPort-AV: E=McAfee;i="6000,8403,9802"; a="157292457"
X-IronPort-AV: E=Sophos;i="5.77,471,1596524400"; 
   d="scan'208";a="157292457"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2020 00:16:43 -0800
IronPort-SDR: SFz5KYzr442wB9VrhLI3A2OaWIIireo0LWY6X/k7h8vBtiHS+mbASOako3W/oUsX7+xRSEY4dt
 akpV9r4A481g==
X-IronPort-AV: E=Sophos;i="5.77,471,1596524400"; 
   d="scan'208";a="542167021"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2020 00:16:40 -0800
Received: by lahna (sSMTP sendmail emulation); Thu, 12 Nov 2020 10:16:38 +0200
Date:   Thu, 12 Nov 2020 10:16:38 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v7 07/18] gpiolib: Introduce gpio_set_debounce_timeout()
 for internal use
Message-ID: <20201112081638.GV2495@lahna.fi.intel.com>
References: <20201111222008.39993-1-andriy.shevchenko@linux.intel.com>
 <20201111222008.39993-8-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201111222008.39993-8-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 12, 2020 at 12:19:57AM +0200, Andy Shevchenko wrote:
> In some cases we would like to have debounce setter which doesn't fail
> when a feature is not supported by a controller.
> 
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpio/gpiolib.c | 7 +++++++
>  drivers/gpio/gpiolib.h | 1 +
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index c4f73597a54d..0d691ec512a4 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -2161,6 +2161,13 @@ static int gpio_set_bias(struct gpio_desc *desc)
>  	return gpio_set_config_with_argument_optional(desc, bias, arg);
>  }
>  
> +int gpio_set_debounce_timeout(struct gpio_desc *desc, unsigned int debounce)
> +{
> +	return gpio_set_config_with_argument_optional(desc,
> +						      PIN_CONFIG_INPUT_DEBOUNCE,
> +						      debounce);
> +}

Sorry for commenting this late but I realized we have
gpiod_set_debounce() already. At least this new function should follow
the naming (gpiod as it takes descriptior):

int gpiod_set_debounce_optional(struct gpio_desc *desc, unsigned int debounce);
