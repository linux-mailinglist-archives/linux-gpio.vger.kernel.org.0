Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3ECC44AD1B
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Nov 2021 13:07:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237084AbhKIMKV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Nov 2021 07:10:21 -0500
Received: from mga06.intel.com ([134.134.136.31]:22285 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236479AbhKIMKU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 9 Nov 2021 07:10:20 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10162"; a="293265099"
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800"; 
   d="scan'208";a="293265099"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2021 04:07:35 -0800
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800"; 
   d="scan'208";a="469953482"
Received: from smile.fi.intel.com ([10.237.72.184])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2021 04:07:30 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1mkPuH-0054ja-3j;
        Tue, 09 Nov 2021 14:07:17 +0200
Date:   Tue, 9 Nov 2021 14:07:16 +0200
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Joe Perches <joe@perches.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
        Jianqun Xu <jay.xu@rock-chips.com>,
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
Message-ID: <YYpkdAPtLWm9pLOM@smile.fi.intel.com>
References: <20211105124242.27288-1-andriy.shevchenko@linux.intel.com>
 <20211105124242.27288-14-andriy.shevchenko@linux.intel.com>
 <4b3f1ee1179dd6d4b010cb110b38d26e7d91c19f.camel@perches.com>
 <CAHp75Ve0Bv9VsWFFZxL9wYk=Z_Mm7nat-vf7g8HHTiROi7EY=Q@mail.gmail.com>
 <103d7321a2d18e44fb8c01483b1197766aff645a.camel@perches.com>
 <YYjtLGlSCDPM4UVL@smile.fi.intel.com>
 <CACRpkdZQsR1yisaCgmSDfG8OtkYgu1tWPBa_mw25o++suLjf4A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZQsR1yisaCgmSDfG8OtkYgu1tWPBa_mw25o++suLjf4A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 09, 2021 at 12:55:44PM +0100, Linus Walleij wrote:
> On Mon, Nov 8, 2021 at 10:26 AM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> 
> > > IMO: the strarray variants introduction and use should be a separate
> > > patchset from the rest.
> >
> > It will add unnecessary churn. Yeah, I have planned to send just that, but then
> > it took more and more cleanups and I have to stop at some point, the code there
> > is bad (historically or by other reasons, dunno).
> 
> I trust your judgement and taste to a large extent so this will not be
> necessary. I can queue the whole series in pinctrl when you
> think it's mature.
> 
> The library bits I kind of feel uncertain about who maintains, but I might just
> apply it.

No worries, Andrew usually applies that in case it's _solely_ library code.
Otherwise it's on certain maintainer shoulders to decide. Note, that I'm one
of the designated reviewers for lib/string*.

Thanks!

-- 
With Best Regards,
Andy Shevchenko


