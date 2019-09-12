Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCE82B118F
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Sep 2019 16:54:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732846AbfILOyg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Sep 2019 10:54:36 -0400
Received: from mga09.intel.com ([134.134.136.24]:13429 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732808AbfILOyg (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Sep 2019 10:54:36 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Sep 2019 07:54:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,497,1559545200"; 
   d="scan'208";a="200754815"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001.fm.intel.com with ESMTP; 12 Sep 2019 07:54:33 -0700
Received: from andy by smile with local (Exim 4.92.1)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1i8QUT-0006lU-0J; Thu, 12 Sep 2019 17:54:33 +0300
Date:   Thu, 12 Sep 2019 17:54:32 +0300
From:   Andriy Shevchenko <andriy.shevchenko@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Rahul Tanwar <rahul.tanwar@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        qi-ming.wu@intel.com, yixin.zhu@linux.intel.com,
        cheol.yong.kim@intel.com
Subject: Re: [PATCH v1 0/2] pinctrl: Add new pinctrl/GPIO driver
Message-ID: <20190912145432.GD2680@smile.fi.intel.com>
References: <cover.1568274587.git.rahul.tanwar@linux.intel.com>
 <CACRpkdb7bPo7oH9w5OhAsOoQXx=MWjJELd5JvBt3R1sPdMjnpw@mail.gmail.com>
 <20190912135806.GA2680@smile.fi.intel.com>
 <CACRpkdYcdaoA_D6YyKJuT5bfJ5QE4LWfXF8+R1y01xaWJaJZuQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdYcdaoA_D6YyKJuT5bfJ5QE4LWfXF8+R1y01xaWJaJZuQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 12, 2019 at 03:30:52PM +0100, Linus Walleij wrote:
> On Thu, Sep 12, 2019 at 2:58 PM Andriy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> > On Thu, Sep 12, 2019 at 11:11:32AM +0100, Linus Walleij wrote:
> > > Hi Rahul,
> > >
> > > thanks for your patches!
> > >
> > > On Thu, Sep 12, 2019 at 8:59 AM Rahul Tanwar
> > > <rahul.tanwar@linux.intel.com> wrote:
> > >
> > > > This series is to add pinctrl & GPIO controller driver for a new SoC.
> > > > Patch 1 adds pinmux & GPIO controller driver.
> > > > Patch 2 adds the dt bindings document & include file.
> > > >
> > > > Patches are against Linux 5.3-rc5 at below Git tree:
> > > > git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
> > >
> > > OK nice, I think you need to include Mika Westerberg on this review
> > > as well, because I think he likes to stay on top of all things intel
> > > in pin control. (Also included two other Intel folks in Finland who usually
> > > take an interest in these things.)
> >
> > Linus,
> > nevertheless I guess you may give your comments WRT device tree use
> > (bindings, helpers, etc) along with some basics, (like devm_*()
> > [ab]use I just noticed).
> 
> I plan to look at the patches per se but right now I don't have much
> time because soon there is merge window and kernel summit,
> the patches just need to age a little bit like a good wine ;)

I meant in general, I know about merge window, so, I guess this is not
material for v5.4.

I reviewed it a bit, hope this helps.

-- 
With Best Regards,
Andy Shevchenko


