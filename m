Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F075C2AD99E
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 16:03:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730672AbgKJPD4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 10:03:56 -0500
Received: from mga17.intel.com ([192.55.52.151]:32055 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730070AbgKJPDz (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 10 Nov 2020 10:03:55 -0500
IronPort-SDR: N6IaCDI6l/LE+xY/tDc2XXT06qidxv9n0VUcf8bZj1NJZfRqTif4UhvQ5WyhWQBrspRCUINX94
 AnTxsjOU7DpQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9801"; a="149834997"
X-IronPort-AV: E=Sophos;i="5.77,466,1596524400"; 
   d="scan'208";a="149834997"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2020 07:03:47 -0800
IronPort-SDR: VtbmLZyuJi9EZhCKNVLenExelxhc/iqjz98xbD9qIWA/ep5GV4/h65e6kCQ4WYJ4LlBZMCFPRR
 G9aKfaeNA35g==
X-IronPort-AV: E=Sophos;i="5.77,466,1596524400"; 
   d="scan'208";a="531236636"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2020 07:03:45 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kcVCR-005VPO-5F; Tue, 10 Nov 2020 17:04:47 +0200
Date:   Tue, 10 Nov 2020 17:04:47 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        David Laight <David.Laight@aculab.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v4 6/7] gpio: exar: switch to using regmap
Message-ID: <20201110150447.GW4077@smile.fi.intel.com>
References: <20201110145552.23024-1-brgl@bgdev.pl>
 <20201110145552.23024-7-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201110145552.23024-7-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 10, 2020 at 03:55:51PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> We can simplify the code in gpio-exar by using regmap. This allows us to
> drop the mutex (regmap provides its own locking) and we can also reuse
> regmap's bit operations instead of implementing our own update function.

...

> +static const struct regmap_config exar_regmap_config = {
> +	.name		= "exar-gpio",
> +	.reg_bits	= 16,

As per previous version comment.

Hold on, the registers are 16-bit wide, but their halves are sparsed!
So, I guess 8 and 8 with helpers to get hi and lo parts are essential.


TABLE 5: DEVICE CONFIGURATION REGISTERS SHOWN IN BYTE ALIGNMENT

> +	.val_bits	= 8,
> +};

This is basically represents two banks out of 6 8-bit registers each.


-- 
With Best Regards,
Andy Shevchenko


