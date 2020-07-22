Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FE6A2296C1
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jul 2020 12:58:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726161AbgGVK6I (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Jul 2020 06:58:08 -0400
Received: from mga01.intel.com ([192.55.52.88]:29341 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726153AbgGVK6I (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 22 Jul 2020 06:58:08 -0400
IronPort-SDR: 1cT+VhxgMWFPn+20g1cxk9ErZWay8/YU85ZA7B3yzrK2WP24DgFQbB/KaYG3sABREJkuwgkvwk
 ZaVJ1lgj1BDw==
X-IronPort-AV: E=McAfee;i="6000,8403,9689"; a="168449518"
X-IronPort-AV: E=Sophos;i="5.75,381,1589266800"; 
   d="scan'208";a="168449518"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2020 03:58:08 -0700
IronPort-SDR: Jmo1XvCZHKhQRE9hUgBTLEI2mCOeRZGHaf623VRa6oDE+3P04ZVFn8sOjMfWhbieoNFE5Fyrgm
 gLsJuUXYn/ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,381,1589266800"; 
   d="scan'208";a="270712239"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga007.fm.intel.com with ESMTP; 22 Jul 2020 03:58:06 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jyCRq-003F7f-Hn; Wed, 22 Jul 2020 13:58:06 +0300
Date:   Wed, 22 Jul 2020 13:58:06 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Bin Gao <bin.gao@linux.intel.com>
Subject: Re: [PATCH] gpio: wcove: Use irqchip template
Message-ID: <20200722105806.GV3703480@smile.fi.intel.com>
References: <20200717151955.159819-1-linus.walleij@linaro.org>
 <840db56f-d041-6bac-fdca-3dd26152e313@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <840db56f-d041-6bac-fdca-3dd26152e313@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 22, 2020 at 10:57:08AM +0200, Hans de Goede wrote:
> On 7/17/20 5:19 PM, Linus Walleij wrote:
> > This makes the driver use the irqchip template to assign
> > properties to the gpio_irq_chip instead of using the
> > explicit calls to gpiochip_irqchip_add_nested() and
> > gpiochip_set_nested_irqchip(). The irqchip is instead
> > added while adding the gpiochip.
> > 
> > Cc: Bin Gao <bin.gao@linux.intel.com>
> > Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Cc: Hans de Goede <hdegoede@redhat.com>
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > ---
> > Same notices as on the Crystalcove: this one I actually
> > managed to compiletest properly.
> 
> I've given this patch a test-run on a machine with the
> Whiskey Cove PMIC and with the caveat that I've not
> actually tested the GPIO IRQ functionality, since that
> does not seem to be used on any machines, I see no adverse
> side effects from this patch, so it is:
> 
> Tested-by: Hans de Goede <hdegoede@redhat.com>

Applied to my branch, thanks!

Same for Crystal Cove.

-- 
With Best Regards,
Andy Shevchenko


