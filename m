Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 375FB132945
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 15:48:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727814AbgAGOs6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jan 2020 09:48:58 -0500
Received: from mga14.intel.com ([192.55.52.115]:18792 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727559AbgAGOs6 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 7 Jan 2020 09:48:58 -0500
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 Jan 2020 06:48:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,406,1571727600"; 
   d="scan'208";a="215574314"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 07 Jan 2020 06:48:55 -0800
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1ioqAC-0005tX-Lo; Tue, 07 Jan 2020 16:48:56 +0200
Date:   Tue, 7 Jan 2020 16:48:56 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH] pinctrl: intel: Pass irqchip when adding gpiochip
Message-ID: <20200107144856.GI32742@smile.fi.intel.com>
References: <20191229013059.495767-1-linus.walleij@linaro.org>
 <20191230102021.GF2628@lahna.fi.intel.com>
 <CACRpkdZONfNCPwTn=Ou7LU=+fPjDXeGGN8jkCzgRLkK2stKeNw@mail.gmail.com>
 <20200107135216.GR465886@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200107135216.GR465886@lahna.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 07, 2020 at 03:52:16PM +0200, Mika Westerberg wrote:
> On Tue, Jan 07, 2020 at 11:32:54AM +0100, Linus Walleij wrote:
> > On Mon, Dec 30, 2019 at 11:20 AM Mika Westerberg
> > <mika.westerberg@linux.intel.com> wrote:
> > > On Sun, Dec 29, 2019 at 02:30:59AM +0100, Linus Walleij wrote:
> > > > We need to convert all old gpio irqchips to pass the irqchip
> > > > setup along when adding the gpio_chip. For more info see
> > > > drivers/gpio/TODO.
> > > >
> > > > Set up the pin ranges using the new callback.
> > >
> > > Maybe have this one split as a separate patch? Same what we do for
> > > Baytrail and Cherryview.
> > 
> > I'm afraid to do that since splitting the semantic ordering was
> > something that broke a lot of times already, I was under the
> > impression that doing the two things (moving to the callback
> > and adding along with the gpio_chip) at the same time was
> > the only way to preserve the semantic ordering.
> 
> Well at least we do the same for others (add the callback in another
> patch and then pass irqchip in another) but no strong feelings. I'm fine
> with this one as well :)
> 
> > But more than anything I want someone to test it ...
> 
> I quickly tested this on Whiskey Lake and SD card detection interrupt
> still works fine after this patch.

My understanding that Linus asked to test a proposed (two patch) series...

Linus, can you send v2 as series of two patches as Mika suggested?

-- 
With Best Regards,
Andy Shevchenko


