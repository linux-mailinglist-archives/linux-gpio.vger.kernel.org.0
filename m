Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31DED2AF593
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 16:57:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727514AbgKKP5X (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 10:57:23 -0500
Received: from mga07.intel.com ([134.134.136.100]:64961 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727497AbgKKP5W (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Nov 2020 10:57:22 -0500
IronPort-SDR: nx/EIMv0ZS+yxNeao9SrsoBH3Ozpz1d9ejP4XIxssv6nCOh9ZEYtocKpKlxvzpK9S0a6WWPPD4
 KyV0X2r4JimQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9801"; a="234331488"
X-IronPort-AV: E=Sophos;i="5.77,469,1596524400"; 
   d="scan'208";a="234331488"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 07:57:22 -0800
IronPort-SDR: VVLm/SQjPkG02kbsPMO/u7NE7jtC3WxSsnlPgFeTS3q5KN/nKwRTu+KwwCKJXm+vccgrDHW9yi
 ZSz0GaSG1r9A==
X-IronPort-AV: E=Sophos;i="5.77,469,1596524400"; 
   d="scan'208";a="541852171"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 07:57:19 -0800
Received: by lahna (sSMTP sendmail emulation); Wed, 11 Nov 2020 17:57:17 +0200
Date:   Wed, 11 Nov 2020 17:57:17 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v5 16/17] gpiolib: acpi: Use BIT() macro to increase
 readability
Message-ID: <20201111155717.GL2495@lahna.fi.intel.com>
References: <20201109205332.19592-1-andriy.shevchenko@linux.intel.com>
 <20201109205332.19592-17-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201109205332.19592-17-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 09, 2020 at 10:53:31PM +0200, Andy Shevchenko wrote:
> We may use BIT() macro to increase readability in
> acpi_gpio_adr_space_handler().
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpiolib-acpi.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
> index 31008b0aef77..b9c3140cbd6d 100644
> --- a/drivers/gpio/gpiolib-acpi.c
> +++ b/drivers/gpio/gpiolib-acpi.c
> @@ -1097,8 +1097,7 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
>  		mutex_unlock(&achip->conn_lock);
>  
>  		if (function == ACPI_WRITE)
> -			gpiod_set_raw_value_cansleep(desc,
> -						     !!((1 << i) & *value));
> +			gpiod_set_raw_value_cansleep(desc, !!(*value & BIT(i)));

Nit: Here I would use a helper variable to make it (much) more readable.

Anyway,

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
