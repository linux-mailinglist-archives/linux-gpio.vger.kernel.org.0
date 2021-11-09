Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A9A644AD32
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Nov 2021 13:10:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236589AbhKIMNA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Nov 2021 07:13:00 -0500
Received: from mga18.intel.com ([134.134.136.126]:23388 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236467AbhKIMNA (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 9 Nov 2021 07:13:00 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10162"; a="219331197"
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800"; 
   d="scan'208";a="219331197"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2021 04:10:14 -0800
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800"; 
   d="scan'208";a="469954033"
Received: from smile.fi.intel.com ([10.237.72.184])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2021 04:10:07 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1mkPwo-0054ma-Cc;
        Tue, 09 Nov 2021 14:09:54 +0200
Date:   Tue, 9 Nov 2021 14:09:54 +0200
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
Message-ID: <YYplEi/F24greu+P@smile.fi.intel.com>
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

...

> I can queue the whole series in pinctrl when you
> think it's mature.

Forgot to react on this.

I have compile tested the pin control stuff (of course, library including)
and gpio-mockup. To me it's all ready (taking into account the tags we got).

If you feel like pulling it now, go for it and thanks!

-- 
With Best Regards,
Andy Shevchenko


