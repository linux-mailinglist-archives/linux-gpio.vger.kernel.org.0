Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4158E2AD9AE
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 16:07:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731407AbgKJPHD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 10:07:03 -0500
Received: from mga18.intel.com ([134.134.136.126]:4059 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730200AbgKJPHD (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 10 Nov 2020 10:07:03 -0500
IronPort-SDR: JuUwofRJdp2tMWMmLJOmobUQQDEPmBU5XNwChhiRfE2Ju8NUD/qD2yR2REDyRF6zVsiO5fxYGi
 6k8oDWSmt0/w==
X-IronPort-AV: E=McAfee;i="6000,8403,9801"; a="157766396"
X-IronPort-AV: E=Sophos;i="5.77,466,1596524400"; 
   d="scan'208";a="157766396"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2020 07:06:48 -0800
IronPort-SDR: I+0IXTGtkR1+xohygxGDWZsVXi9d3EJBaRwYuCNV+pt59xhkB5JDhXNq++hvGubxCXr46vhaRl
 Jz/rGkyCXWOw==
X-IronPort-AV: E=Sophos;i="5.77,466,1596524400"; 
   d="scan'208";a="322893785"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2020 07:06:45 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kcVFL-005VRE-Nx; Tue, 10 Nov 2020 17:07:47 +0200
Date:   Tue, 10 Nov 2020 17:07:47 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        David Laight <David.Laight@aculab.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v4 0/7] gpio: exar: refactor the driver
Message-ID: <20201110150747.GX4077@smile.fi.intel.com>
References: <20201110145552.23024-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201110145552.23024-1-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 10, 2020 at 03:55:45PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> I just wanted to convert the driver to using simpler IDA API but ended up
> quickly converting it to using regmap. Unfortunately I don't have the HW
> to test it so marking the patches that introduce functional change as RFT
> and Cc'ing the original author.

Thanks.
With reverted reg_width change
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> v1 -> v2:
> - add new regmap helper: regmap_assign_bits()
> - fix lvl vs sel register access
> - set value in direction_output callback
> 
> v2 -> v3:
> - drop the regmap helper from series
> 
> v3 -> v4:
> - renamed the regmap variable to 'regmap' as leaving the old name caused me
>   to miss an assignment leading to a crash (culprit spotted by Andy Shevchenko)
> 
> Bartosz Golaszewski (7):
>   gpio: exar: add a newline after the copyright notice
>   gpio: exar: include idr.h
>   gpio: exar: switch to a simpler IDA interface
>   gpio: exar: use a helper variable for &pdev->dev
>   gpio: exar: unduplicate address and offset computation
>   gpio: exar: switch to using regmap
>   gpio: exar: use devm action for freeing the IDA and drop remove()
> 
>  drivers/gpio/Kconfig     |   1 +
>  drivers/gpio/gpio-exar.c | 155 +++++++++++++++++++--------------------
>  2 files changed, 77 insertions(+), 79 deletions(-)
> 
> -- 
> 2.29.1
> 

-- 
With Best Regards,
Andy Shevchenko


