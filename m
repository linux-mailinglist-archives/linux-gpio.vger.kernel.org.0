Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9137C447CC2
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Nov 2021 10:26:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238397AbhKHJ3O (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Nov 2021 04:29:14 -0500
Received: from mga14.intel.com ([192.55.52.115]:51294 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238401AbhKHJ3K (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 8 Nov 2021 04:29:10 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10161"; a="232442046"
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800"; 
   d="scan'208";a="232442046"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2021 01:26:23 -0800
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800"; 
   d="scan'208";a="499814430"
Received: from smile.fi.intel.com ([10.237.72.184])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2021 01:26:18 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1mk0ui-004cSx-N0;
        Mon, 08 Nov 2021 11:26:04 +0200
Date:   Mon, 8 Nov 2021 11:26:04 +0200
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Joe Perches <joe@perches.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Jianqun Xu <jay.xu@rock-chips.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-rockchip@lists.infradead.org" 
        <linux-rockchip@lists.infradead.org>,
        Bamvor Jian Zhang <bamv2005@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Andy Shevchenko <andy@kernel.org>
Subject: Re: [PATCH v1 14/19] pinctrl: st: Use temporary variable for struct
 device
Message-ID: <YYjtLGlSCDPM4UVL@smile.fi.intel.com>
References: <20211105124242.27288-1-andriy.shevchenko@linux.intel.com>
 <20211105124242.27288-14-andriy.shevchenko@linux.intel.com>
 <4b3f1ee1179dd6d4b010cb110b38d26e7d91c19f.camel@perches.com>
 <CAHp75Ve0Bv9VsWFFZxL9wYk=Z_Mm7nat-vf7g8HHTiROi7EY=Q@mail.gmail.com>
 <103d7321a2d18e44fb8c01483b1197766aff645a.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <103d7321a2d18e44fb8c01483b1197766aff645a.camel@perches.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Nov 06, 2021 at 01:28:17AM -0700, Joe Perches wrote:
> On Sat, 2021-11-06 at 10:07 +0200, Andy Shevchenko wrote:
> > On Saturday, November 6, 2021, Joe Perches <joe@perches.com> wrote:
> > > On Fri, 2021-11-05 at 14:42 +0200, Andy Shevchenko wrote:

...

> > > > -     new_map = devm_kcalloc(pctldev->dev,
> > > > -                             map_num, sizeof(*new_map), GFP_KERNEL);
> > > > +     new_map = devm_kcalloc(dev, map_num, sizeof(*new_map), GFP_KERNEL);
> > > 
> > > Are pctldev->dev and dev the same pointer?
> > 
> > Seems so.
> 
> OK.
> 
> > https://elixir.bootlin.com/linux/latest/source/drivers/pinctrl/core.c#L2015
> > 
> > > It seems they are not.
> > 
> > Can you elaborate, please?

> From code shape, you assign dev to info->dev rather than pctldev->dev

Yes. And they are the same. TBH these three drivers seem to be written by
copy'n'paste method where the first one, whichever it was, is simply messy
and buggy.

The extra redundant parameter (often struct platform_device) is passed to
zillions of functions when at the same time info structure already has pointer
to struct device is the easiest one to notice. And I believe so on, so on...

> I also believe this single 19 patch series would be better as
> multiple patch series.

I'm fine with either, but I would like to hear from Linus about what he wishes
as the maintainer. You know that we don't add code without users? So that's why
my motive to send it in full.

> IMO: the strarray variants introduction and use should be a separate
> patchset from the rest.

It will add unnecessary churn. Yeah, I have planned to send just that, but then
it took more and more cleanups and I have to stop at some point, the code there
is bad (historically or by other reasons, dunno).

-- 
With Best Regards,
Andy Shevchenko


