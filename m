Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE423E374
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Apr 2019 15:13:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726017AbfD2NNr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Apr 2019 09:13:47 -0400
Received: from mga07.intel.com ([134.134.136.100]:61113 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725838AbfD2NNr (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 29 Apr 2019 09:13:47 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 Apr 2019 06:13:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,409,1549958400"; 
   d="scan'208";a="165912751"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.86])
  by fmsmga002.fm.intel.com with ESMTP; 29 Apr 2019 06:13:44 -0700
Received: from andy by smile with local (Exim 4.92)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1hL66J-0008BA-M6; Mon, 29 Apr 2019 16:13:43 +0300
Date:   Mon, 29 Apr 2019 16:13:43 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc:     mika.westerberg@linux.intel.com, linus.walleij@linaro.org,
        hotwater438@tutanota.com, hdegoede@redhat.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: intel: Clear interrupt status in unmask callback
Message-ID: <20190429131343.GC9224@smile.fi.intel.com>
References: <20190422044539.16085-1-kai.heng.feng@canonical.com>
 <20190426214758.GC9224@smile.fi.intel.com>
 <6BCF9C55-E365-4638-8030-99EBA348F8D4@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6BCF9C55-E365-4638-8030-99EBA348F8D4@canonical.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Apr 29, 2019 at 05:16:16PM +0800, Kai-Heng Feng wrote:
> at 05:47, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > On Mon, Apr 22, 2019 at 12:45:39PM +0800, Kai-Heng Feng wrote:
> > > Commit a939bb57cd47 ("pinctrl: intel: implement gpio_irq_enable") was
> > > added because clearing interrupt status bit is required to avoid
> > > unexpected behavior.
> > > 
> > > Turns out the unmask callback also needs the fix, which can solve weird
> > > IRQ triggering issues on I2C touchpad ELAN1200.

> > Is it possible scenario when IRQ enable is called, but not masking
> > callbacks?
> > For _AEI or GPE?
> 
> I am unfamiliar with both of them, what are the callbacks to be used for
> _AEI and GPE case?
> Seems like both gpiolib and irqchip call irq_unmask() when irq_enable() is
> absent.

Yes, that's correct, thank you for double checking.

 * @irq_enable:         enable the interrupt (defaults to chip->unmask if NULL)


Wait for v2 with mentioned earlier changes and gathered tags.

-- 
With Best Regards,
Andy Shevchenko


