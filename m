Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0148244AD1E
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Nov 2021 13:07:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236479AbhKIMKb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Nov 2021 07:10:31 -0500
Received: from mga01.intel.com ([192.55.52.88]:62495 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237666AbhKIMKb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 9 Nov 2021 07:10:31 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10162"; a="256113349"
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800"; 
   d="scan'208";a="256113349"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2021 04:05:07 -0800
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800"; 
   d="scan'208";a="588658106"
Received: from smile.fi.intel.com ([10.237.72.184])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2021 04:05:03 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mkPru-0054hE-NF;
        Tue, 09 Nov 2021 14:04:50 +0200
Date:   Tue, 9 Nov 2021 14:04:50 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Jianqun Xu <jay.xu@rock-chips.com>,
        Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org,
        Bamvor Jian Zhang <bamv2005@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Andy Shevchenko <andy@kernel.org>
Subject: Re: [PATCH v1 13/19] pinctrl: st: Drop wrong kernel doc annotations
Message-ID: <YYpj4ksl0rnmKYBV@smile.fi.intel.com>
References: <20211105124242.27288-1-andriy.shevchenko@linux.intel.com>
 <20211105124242.27288-13-andriy.shevchenko@linux.intel.com>
 <CACRpkdbUKJVz=pzdw0Egw39gCUTxJRkyNjxOTOqCnJ1k_j406g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdbUKJVz=pzdw0Egw39gCUTxJRkyNjxOTOqCnJ1k_j406g@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 09, 2021 at 12:32:31PM +0100, Linus Walleij wrote:
> On Fri, Nov 5, 2021 at 1:43 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > Kernel doc validator is not happy:
> >
> >   .../pinctrl-st.c:59: warning: This comment starts with '/**', but isn't a kernel-doc comment.
> >   .../pinctrl-st.c:73: warning: This comment starts with '/**', but isn't a kernel-doc comment.
> >
> > Drop them as they are indeed not a kernel doc comments.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Hm maybe I could just apply this patch, shouldn't collide with anything.
> Let me know your preference.

You may apply whatever patches you want that are precursors for the strarray()
idea. Basically you may apply somewhat 9 patches if I'm not mistaken.
Of course if you have no objections.

-- 
With Best Regards,
Andy Shevchenko


