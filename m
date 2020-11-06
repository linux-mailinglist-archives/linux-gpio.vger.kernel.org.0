Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03ECE2A9DF0
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Nov 2020 20:23:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728187AbgKFTXk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Nov 2020 14:23:40 -0500
Received: from mga02.intel.com ([134.134.136.20]:23604 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728075AbgKFTXj (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 6 Nov 2020 14:23:39 -0500
IronPort-SDR: YI4CBW5bWfbl+lMr4dgNNvKJ3kE2FWHOme/lL6AQS2xYSr97QTRl2jEq3Gvi5KAk6cdUnl3QiW
 Z+cQ035186iQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9797"; a="156591020"
X-IronPort-AV: E=Sophos;i="5.77,457,1596524400"; 
   d="scan'208";a="156591020"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2020 11:23:39 -0800
IronPort-SDR: Z+o+j/YfP3wa8YNKi07pivd/ScmuucM4fcnLBmmIlyyTOlynhDO+bZEz/Fpqt6ai42wqLJVXca
 osmkPZvBDaow==
X-IronPort-AV: E=Sophos;i="5.77,457,1596524400"; 
   d="scan'208";a="529905967"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2020 11:23:37 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kb7Lj-004Qgy-9D; Fri, 06 Nov 2020 21:24:39 +0200
Date:   Fri, 6 Nov 2020 21:24:39 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Jamie McClymont <jamie@kwiius.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v3 0/4] gpiolib: acpi: pin configuration fixes
Message-ID: <20201106192439.GL4077@smile.fi.intel.com>
References: <20201102191722.81502-1-andriy.shevchenko@linux.intel.com>
 <CACRpkda-kiURXfFeU+3yu3q=gEXZe6ZEEKn6E_RrB1QQ++bffQ@mail.gmail.com>
 <CAHp75VfS-MG2WMZvdi1+WWMXrn2+Efq1Z+1DDbAHLvHLB0tsHg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VfS-MG2WMZvdi1+WWMXrn2+Efq1Z+1DDbAHLvHLB0tsHg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 06, 2020 at 05:10:34PM +0200, Andy Shevchenko wrote:
> On Fri, Nov 6, 2020 at 3:53 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> > On Mon, Nov 2, 2020 at 8:17 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> >
> > > I think the best way is to collect tags from GPIO maintainers and I
> > > can incorporate this into our Intel pin control branch which I will
> > > share with you as PR against GPIO and pin control subsystems.
> > >
> > > I'm also all ears for alternatives.
> >
> > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Thanks!
> 
> > However I definitely trust you on any changes to gpiolib-acpi.c
> > so if you want a definitive formal control over that I do not mind
> > if you list yourself as maintainer of this file. I would
> > definitely pull any GPIO-ACPI-stuff from you without any
> > hesitation anyways.
> 
> Let's hear what Mika says. I'm fine to use my Intel GPIO tree for that purpose.

Okay, I have sent v4 with updated MAINTAINERS.

-- 
With Best Regards,
Andy Shevchenko


