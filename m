Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38AC1F1C82
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2019 18:31:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727894AbfKFRa7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Nov 2019 12:30:59 -0500
Received: from mga02.intel.com ([134.134.136.20]:41154 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727572AbfKFRa7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 6 Nov 2019 12:30:59 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Nov 2019 09:30:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,275,1569308400"; 
   d="scan'208";a="196274080"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 06 Nov 2019 09:30:56 -0800
Received: from andy by smile with local (Exim 4.93-RC1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1iSP8x-0006nH-NI; Wed, 06 Nov 2019 19:30:55 +0200
Date:   Wed, 6 Nov 2019 19:30:55 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [RESEND][PATCH v2 0/7] gpiolib: fix GPIO <-> pin mapping
 registration
Message-ID: <20191106173055.GQ32742@smile.fi.intel.com>
References: <20191105203557.78562-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191105203557.78562-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 05, 2019 at 10:35:50PM +0200, Andy Shevchenko wrote:
> This is the ordering fix for GPIO <-> pin mapping registration to allow
> delegation of IRQ chip to the GPIO library. Two drivers are actually converted
> to use the new callback followed by switching to use of irqchip structure
> inside gpiochip.
> 
> The series has been tested on Merrifield device (though no AEI) and on Thinkpad
> 10 where 4 events are registered, one of which has reasonable amount of
> interrupts coming from battery.
> 
> First two patches are definitely good for v5.4 cycle (and have Fixes tag) while
> the rest can be applied for v5.5 if I didn't miss anything. So, they can go like
> patches 1-3 -> v5.4 (gpio/fixes) and to gpio/for-next and to pinctrl/for-next
> patches 4-5 -> v5.5 (gpio/for-next)
> patches 6-7 -> v5.5 (pinctrl/for-next)
> 
> Perhaps it would require to wait next v5.4 rc in order to avoid dependency
> issues.

So, I consolidated everything I have under my review-andy branch in
pinctrl/intel.git repository.

When I applied Hans' CHV series, I fixed minor conflict due to new small patch
in for-next branch.

Linus, I think it would be good if we have first 3 (okay, I noticed you have
pushed first one to your devel branch) patches to go to v5.4. It will reduce
dependency burden in v5.5.

Hans, if you have time you can test altogether (actually that set I used for
local testing, so, I'm not expecting anything unusual there).

> Changelog v2 (resent):
> - fixed cover letter
> - resent with ML included
> 
> Changelog v2:
> - added fixes tag to the first patch
> - reworked commit message for the second patch
> - added baytrail conversion
> - tested on ThinkPad 10
> 
> Andy Shevchenko (6):
>   gpiolib: No need to call gpiochip_remove_pin_ranges() twice
>   gpiolib: Introduce ->add_pin_ranges() callback
>   gpio: merrifield: Add GPIO <-> pin mapping ranges via callback
>   gpio: merrifield: Pass irqchip when adding gpiochip
>   pinctrl: baytrail: Add GPIO <-> pin mapping ranges via callback
>   pinctrl: baytrail: Pass irqchip when adding gpiochip
> 
> Linus Walleij (1):
>   gpiolib: Switch order of valid mask and hw init
> 
>  drivers/gpio/gpio-merrifield.c           | 76 ++++++++++++++----------
>  drivers/gpio/gpiolib-of.c                |  5 +-
>  drivers/gpio/gpiolib.c                   | 19 +++++-
>  drivers/pinctrl/intel/pinctrl-baytrail.c | 64 ++++++++++++--------
>  include/linux/gpio/driver.h              |  5 ++
>  5 files changed, 107 insertions(+), 62 deletions(-)
> 
> -- 
> 2.24.0.rc1
> 

-- 
With Best Regards,
Andy Shevchenko


