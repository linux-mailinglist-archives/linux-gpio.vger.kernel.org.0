Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5561D2AF52D
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 16:39:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727359AbgKKPjN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 10:39:13 -0500
Received: from mga06.intel.com ([134.134.136.31]:9986 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727360AbgKKPjN (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Nov 2020 10:39:13 -0500
IronPort-SDR: vIsRtwYlxDnJXnZFlLl7Kw4+S4LSWyATyz73wrxiif9qrzRb2NMATlKorekbXCb9TwzL3Aabfm
 jtTu+XGZDO0Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9801"; a="231786781"
X-IronPort-AV: E=Sophos;i="5.77,469,1596524400"; 
   d="scan'208";a="231786781"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 07:39:12 -0800
IronPort-SDR: fsozQJAvAD1BC/McYR6l5Ws1mN1QWOmMD3fbMlB4C8E0amtbO1WI5dsfI3jHJIHrn6MVCbG21/
 thEZr0sf+dKw==
X-IronPort-AV: E=Sophos;i="5.77,469,1596524400"; 
   d="scan'208";a="541847654"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 07:39:10 -0800
Received: by lahna (sSMTP sendmail emulation); Wed, 11 Nov 2020 17:39:07 +0200
Date:   Wed, 11 Nov 2020 17:39:07 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v5 08/17] gpiolib: Extract gpio_set_debounce_timeout()
 for internal use
Message-ID: <20201111153907.GE2495@lahna.fi.intel.com>
References: <20201109205332.19592-1-andriy.shevchenko@linux.intel.com>
 <20201109205332.19592-9-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201109205332.19592-9-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 09, 2020 at 10:53:23PM +0200, Andy Shevchenko wrote:
> In some cases we would like to have debounce setter which doesn't fail
> when feature is not supported by a controller.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpiolib.c | 7 +++++++
>  drivers/gpio/gpiolib.h | 1 +
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 4558af08df23..9d23fbf1f7cd 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -2162,6 +2162,13 @@ static int gpio_set_bias(struct gpio_desc *desc)
>  	return gpio_set_config_with_argument_optional(desc, bias, arg);
>  }
>  
> +int gpio_set_debounce_timeout(struct gpio_desc *desc, unsigned int debounce)
> +{
> +	enum pin_config_param mode = PIN_CONFIG_PERSIST_STATE;
> +
> +	return gpio_set_config_with_argument_optional(desc, mode, debounce);

Again I think mode variable is pretty useless here and does not improve
readability.
