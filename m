Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE15C2AD9BB
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 16:09:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731024AbgKJPJY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 10:09:24 -0500
Received: from mga05.intel.com ([192.55.52.43]:19863 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731353AbgKJPJY (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 10 Nov 2020 10:09:24 -0500
IronPort-SDR: nurg3yc4O8dpmVZFQ1k9ektZ2UAlK+JYBNm2IZR4YWM99SNc/yNsNQMNX8B7Rivnr6qbbahN4/
 k5SVAMrC6KSA==
X-IronPort-AV: E=McAfee;i="6000,8403,9801"; a="254699235"
X-IronPort-AV: E=Sophos;i="5.77,466,1596524400"; 
   d="scan'208";a="254699235"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2020 07:09:22 -0800
IronPort-SDR: TqSLfs/e1RpTETQ5GReLeg2RaHnNzer0gKK/Hok2R5iw56ymOZAq/W4WrQnxOj+XpS0r0096bI
 CvDDflTf9lgA==
X-IronPort-AV: E=Sophos;i="5.77,466,1596524400"; 
   d="scan'208";a="529829569"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2020 07:09:20 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kcVHq-005VSQ-I9; Tue, 10 Nov 2020 17:10:22 +0200
Date:   Tue, 10 Nov 2020 17:10:22 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        David Laight <David.Laight@aculab.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v4 6/7] gpio: exar: switch to using regmap
Message-ID: <20201110151022.GY4077@smile.fi.intel.com>
References: <20201110145552.23024-1-brgl@bgdev.pl>
 <20201110145552.23024-7-brgl@bgdev.pl>
 <20201110150447.GW4077@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201110150447.GW4077@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 10, 2020 at 05:04:47PM +0200, Andy Shevchenko wrote:
> On Tue, Nov 10, 2020 at 03:55:51PM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > 
> > We can simplify the code in gpio-exar by using regmap. This allows us to
> > drop the mutex (regmap provides its own locking) and we can also reuse
> > regmap's bit operations instead of implementing our own update function.
> 
> ...
> 
> > +static const struct regmap_config exar_regmap_config = {
> > +	.name		= "exar-gpio",
> > +	.reg_bits	= 16,
> 
> As per previous version comment.
> 
> Hold on, the registers are 16-bit wide, but their halves are sparsed!
> So, I guess 8 and 8 with helpers to get hi and lo parts are essential.
> 
> 
> TABLE 5: DEVICE CONFIGURATION REGISTERS SHOWN IN BYTE ALIGNMENT
> 
> > +	.val_bits	= 8,
> > +};
> 
> This is basically represents two banks out of 6 8-bit registers each.

...which makes me wonder if gpio-regmap can be utilized here...

-- 
With Best Regards,
Andy Shevchenko


