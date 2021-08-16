Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C84EC3ED859
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Aug 2021 16:00:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231447AbhHPOBG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Aug 2021 10:01:06 -0400
Received: from mga06.intel.com ([134.134.136.31]:28333 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232050AbhHPOAw (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 16 Aug 2021 10:00:52 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10077"; a="276893477"
X-IronPort-AV: E=Sophos;i="5.84,326,1620716400"; 
   d="scan'208";a="276893477"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2021 07:00:20 -0700
X-IronPort-AV: E=Sophos;i="5.84,326,1620716400"; 
   d="scan'208";a="423553512"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2021 07:00:18 -0700
Received: from andy by smile with local (Exim 4.94.2)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1mFd9w-00APcH-07; Mon, 16 Aug 2021 17:00:12 +0300
Date:   Mon, 16 Aug 2021 17:00:11 +0300
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v1 3/4] mfd: intel_quark_i2c_gpio: Convert GPIO to use
 software nodes
Message-ID: <YRpva4gS1LfncPUj@smile.fi.intel.com>
References: <20210726125436.58685-1-andriy.shevchenko@linux.intel.com>
 <20210726125436.58685-3-andriy.shevchenko@linux.intel.com>
 <YRpihHP3kDz5nYV9@google.com>
 <CAHp75VdcWsNFervoU7e4_m7qVKAnWXzF2z2mUgKg06-qmwn-2A@mail.gmail.com>
 <YRppKOxp4Jya5iEI@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YRppKOxp4Jya5iEI@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 16, 2021 at 02:33:28PM +0100, Lee Jones wrote:
> On Mon, 16 Aug 2021, Andy Shevchenko wrote:
> 
> > On Mon, Aug 16, 2021 at 4:11 PM Lee Jones <lee.jones@linaro.org> wrote:
> > > On Mon, 26 Jul 2021, Andy Shevchenko wrote:
> > >
> > > > The driver can provide a software node group instead of
> > > > passing legacy platform data. This will allow to drop
> > > > the legacy platform data structures along with unifying
> > > > a child device driver to use same interface for all
> > > > property providers, i.e. Device Tree, ACPI, and board files.
> > > >
> > > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > > ---
> > > >  drivers/mfd/intel_quark_i2c_gpio.c | 70 ++++++++++++++++--------------
> > > >  1 file changed, 37 insertions(+), 33 deletions(-)
> > >
> > > Doesn't seem to want to apply.
> > 
> > Would it be okay for you to pull the immutable tag?
> 
> What immutable tag?

It's here:
https://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git/tag/?h=intel-gpio-v5.15-1


-- 
With Best Regards,
Andy Shevchenko


