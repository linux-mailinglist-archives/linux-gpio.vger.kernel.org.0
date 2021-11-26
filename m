Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AAED45F3A2
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Nov 2021 19:19:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230250AbhKZSWw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Nov 2021 13:22:52 -0500
Received: from mga06.intel.com ([134.134.136.31]:26698 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231664AbhKZSUv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 26 Nov 2021 13:20:51 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10180"; a="296503037"
X-IronPort-AV: E=Sophos;i="5.87,266,1631602800"; 
   d="scan'208";a="296503037"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2021 10:13:58 -0800
X-IronPort-AV: E=Sophos;i="5.87,266,1631602800"; 
   d="scan'208";a="510079221"
Received: from smile.fi.intel.com ([10.237.72.184])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2021 10:13:56 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1mqfjO-00As5Z-61;
        Fri, 26 Nov 2021 20:13:54 +0200
Date:   Fri, 26 Nov 2021 20:13:53 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org,
        Yauhen Kharuzhy <jekhor@gmail.com>
Subject: Re: [PATCH v2 2/3] pinctrl: cherryview: Do not allow the same
 interrupt line to be used by 2 pins
Message-ID: <YaEj4WuexzxGiP4L@smile.fi.intel.com>
References: <20211118105650.207638-1-hdegoede@redhat.com>
 <20211118105650.207638-2-hdegoede@redhat.com>
 <YZY1rTL2fnz1pxTq@lahna>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YZY1rTL2fnz1pxTq@lahna>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 18, 2021 at 01:14:53PM +0200, Mika Westerberg wrote:
> On Thu, Nov 18, 2021 at 11:56:49AM +0100, Hans de Goede wrote:
> > It is impossible to use the same interrupt line for 2 pins, this will
> > result in the interrupts only being delivered to the IRQ handler for
> > the pin for which chv_gpio_irq_type() was called last.
> > 
> > The pinctrl-cherryview.c code relies on the BIOS to correctly setup the
> > interrupt line, but there is a BIOS bug on at least the Medion Akoya E1239T
> > and the GPD win models where both INT33FF:02 pin 8, used by the powerbutton
> > and INT33FF:02 pin 21 used as IRQ input for the accelerometer are mapped to
> > interrupt line 0.
> > 
> > This causes 2 problems:
> > 1. The accelerometer IRQ does not work, since the power button is probed
> > later taking over the intr_lines[0] slot.
> > 
> > 2. Since the accelerometer IRQ is not marked as wakeup, interrupt line 0
> > gets masked on suspend, causing the power button to not work to wake
> > the system from suspend.
> > 
> > Likewise on the Lenovo Yogabook, which has a touchscreen as keyboard
> > and the keyboard half of the tablet also has a Wacom digitizer, the BIOS
> > by default assigns the same interrupt line to the GPIOs used
> > for their interrupts.
> > 
> > Fix these problems by adding a check for this and assigning a new
> > interrupt line to the 2nd pin for which chv_gpio_irq_type() gets called.
> > 
> > With this fix in place the following 2 messages show up in dmesg on
> > the Medion Akoya E1239T and the GPD win:
> > 
> >  cherryview-pinctrl INT33FF:02: interrupt line 0 is used by both pin 21 and pin 8
> >  cherryview-pinctrl INT33FF:02: changing the interrupt line for pin 8 to 15
> > 
> > And the following gets logged on the Lenovo Yogabook:
> > 
> >  cherryview-pinctrl INT33FF:01: interrupt-line 0 is used by both pin 49 and pin 56
> >  cherryview-pinctrl INT33FF:01: changing the interrupt line for pin 56 to 7
> > 
> > Note commit 9747070c11d6 ("Input: axp20x-pek - always register interrupt
> > handlers") was added as a work around for the power button not being able
> > to wakeup the system. This relies on using the PMIC's connection to the
> > power button but that only works on systems with the AXP288 PMIC.
> > Once this fix has been merged that workaround can be removed.
> > 
> > Cc: Yauhen Kharuzhy <jekhor@gmail.com>
> > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Pushed to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko


