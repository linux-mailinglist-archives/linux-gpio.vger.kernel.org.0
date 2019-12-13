Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92E9511E5D5
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2019 15:47:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727724AbfLMOrE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Dec 2019 09:47:04 -0500
Received: from mga03.intel.com ([134.134.136.65]:23270 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727690AbfLMOrE (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 13 Dec 2019 09:47:04 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Dec 2019 06:47:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,309,1571727600"; 
   d="scan'208";a="211456249"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga008.fm.intel.com with ESMTP; 13 Dec 2019 06:47:02 -0800
Received: from andy by smile with local (Exim 4.93-RC7)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1ifmDe-0004Gc-C9; Fri, 13 Dec 2019 16:47:02 +0200
Date:   Fri, 13 Dec 2019 16:47:02 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v1 0/5] pinctrl: baytrail: Clean up (part 3)
Message-ID: <20191213144702.GW32742@smile.fi.intel.com>
References: <20191212102557.87754-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdaMgeqpBN0WydqirDX9eC_ypVcd=7PW+e96rsuMx7wJNg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdaMgeqpBN0WydqirDX9eC_ypVcd=7PW+e96rsuMx7wJNg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 13, 2019 at 02:41:16PM +0100, Linus Walleij wrote:
> On Thu, Dec 12, 2019 at 11:26 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > This is a part 3 of clean up pin control driver for Intel Baytrail.
> > After this applied the driver will use all available data structures
> > from pinctrl-intel.h header.
> >
> > Note, that patch which exposes common pin control data structrure for drivers
> > will be used by Lynxpoint as well.
> >
> > This has been tested on the tablet with SD card detection and buttons pressed.
> >
> > Based on our pinctrl/intel for-next branch.
> 
> The series:
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks!

> Please collect up what you have and send this with a pull
> request so I have the full picture in my tree soon-ish.
> 
> The reason is that I want a clean baseline to deal with this:
> 
> $ git grep gpiochip_set_chained_irqchip drivers/pinctrl/
> drivers/pinctrl/intel/pinctrl-baytrail.c:
> gpiochip_set_chained_irqchip(gc, &byt_irqchip,
> drivers/pinctrl/intel/pinctrl-cherryview.c:
> gpiochip_set_chained_irqchip(chip, &pctrl->irqchip, irq,
> drivers/pinctrl/intel/pinctrl-intel.c:
> gpiochip_set_chained_irqchip(&pctrl->chip, &pctrl->irqchip, irq,
> NULL);
> 
> If you volunteer to get rid of these three gpiochip_set_chained_irqchip()
> calls, even better :D
> 
> They are the three last users before I can delete
> gpiochip_set_chained_irqchip() from the kernel.

I see your point. I would like:
1/ wait for next rc (supposed to have the PR I sent and your applied recently)
2/ the rest to be hanging few days at least in Linux next.

-- 
With Best Regards,
Andy Shevchenko


