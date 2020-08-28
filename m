Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DAF925579A
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Aug 2020 11:28:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728690AbgH1J2l (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Aug 2020 05:28:41 -0400
Received: from mga03.intel.com ([134.134.136.65]:27470 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728362AbgH1J2i (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 28 Aug 2020 05:28:38 -0400
IronPort-SDR: GbEUEp+0kaNVgq8dP753M1QcX3GQ7j37f80HwuSwOl7nASsQO07f8YpldE3tNSWZBAUVGzmekx
 KNKXDeXQ0d9A==
X-IronPort-AV: E=McAfee;i="6000,8403,9726"; a="156641284"
X-IronPort-AV: E=Sophos;i="5.76,363,1592895600"; 
   d="scan'208";a="156641284"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2020 02:28:37 -0700
IronPort-SDR: iVyKu4XviyxQQJXd0QlV9QkFkH31Rj/KiBjOQmy9sYXNob2gBK778SrMAS+c/pNgLXp80rp2Ea
 2N4zbx0Y6zOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,363,1592895600"; 
   d="scan'208";a="329901335"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 28 Aug 2020 02:28:35 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kBagT-00C4dH-87; Fri, 28 Aug 2020 12:28:33 +0300
Date:   Fri, 28 Aug 2020 12:28:33 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Thomas Preston <thomas.preston@codethink.co.uk>,
        Jan =?iso-8859-1?Q?Kundr=E1t?= <jan.kundrat@cesnet.cz>,
        Phil Reid <preid@electromag.com.au>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] pinctrl: mcp23s08: Fixup mcp23x17 regmap_config
Message-ID: <20200828092833.GP1891694@smile.fi.intel.com>
References: <20200814100357.209340-1-thomas.preston@codethink.co.uk>
 <20200814100357.209340-2-thomas.preston@codethink.co.uk>
 <CACRpkdZj-eAz0yse3OcKLiO0sPVHJMmhVZ_yLWFt1YKPe3hkRg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZj-eAz0yse3OcKLiO0sPVHJMmhVZ_yLWFt1YKPe3hkRg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 28, 2020 at 11:06:21AM +0200, Linus Walleij wrote:
> On Fri, Aug 14, 2020 at 12:04 PM Thomas Preston
> <thomas.preston@codethink.co.uk> wrote:
> 
> > - Fix a typo where mcp23x17 configs are referred to as mcp23x16.
> > - Fix precious range to include INTCAP{A,B}, which clear on read.
> > - Fix precious range to include GPIOB, which clears on read.
> > - Fix volatile range to include GPIOB, to fix debugfs registers
> >   reporting different values than `gpioget gpiochip2 {0..15}`.
> >
> > Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
> 
> Since the other two patches seem wrong, please resend this one patch,
> also include the people on TO: here: Andy, Phil and Jan, who all use
> this chip a lot.

And it seems it combines a lot of stuff in one patch. Can we have a split with
appropriate Fixes: tags?

-- 
With Best Regards,
Andy Shevchenko


