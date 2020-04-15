Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C26061AA12C
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2020 14:45:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S369728AbgDOMdw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Apr 2020 08:33:52 -0400
Received: from mga09.intel.com ([134.134.136.24]:61660 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S369717AbgDOMdk (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 15 Apr 2020 08:33:40 -0400
IronPort-SDR: Tgj+7IgukCttv4C+edDJON8ookhvKM72zcyvJAURrO3heTexrjSHPvQc9fmlKT0S/ESm6CNDca
 GcVc2GWF34FQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2020 05:33:39 -0700
IronPort-SDR: 2+RGo6PUMlKtNAedTTXIlMRJTZel4PZ+T+0h0JtYaBewn4luM5ogyrmn6wfHaGyJ3VvO98SE1e
 Tc2fvhVcDbag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,386,1580803200"; 
   d="scan'208";a="244090018"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga007.fm.intel.com with ESMTP; 15 Apr 2020 05:33:38 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jOhEb-000mdV-9o; Wed, 15 Apr 2020 15:33:41 +0300
Date:   Wed, 15 Apr 2020 15:33:41 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Serge Semin <fancer.lancer@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v1 03/13] gpio: dwapb: set default handler to be
 handle_bad_irq()
Message-ID: <20200415123341.GC185537@smile.fi.intel.com>
References: <20200409141228.49561-1-andriy.shevchenko@linux.intel.com>
 <20200409141228.49561-4-andriy.shevchenko@linux.intel.com>
 <20200415122208.wp7ah6nxwhph4wi5@mobilestation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200415122208.wp7ah6nxwhph4wi5@mobilestation>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 15, 2020 at 03:22:08PM +0300, Serge Semin wrote:
> On Thu, Apr 09, 2020 at 05:12:18PM +0300, Andy Shevchenko wrote:
> > We switch the default handler to be handle_bad_irq() instead of
> > handle_level_irq(), though for now apply it later in the code,
> > to make the difference between IRQ chips more visible.
> 
> s/IRQ chips/IRQ types ?

Actually IRQ chips. The code instantiates two IRQ chips.

> Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

Thanks!

> Note though I'd better refactored the whole dwapb_configure_irqs()
> method with using GPIOlib irqchip API, which is preferred by the current
> GPIO subsystem. This isn't a subject for this series. Just to note, that
> such change is very actual.

I know, but it's indeed out of scope of this series.

-- 
With Best Regards,
Andy Shevchenko


