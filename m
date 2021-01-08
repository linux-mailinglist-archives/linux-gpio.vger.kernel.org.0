Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64F452EF35D
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jan 2021 14:46:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726059AbhAHNpg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jan 2021 08:45:36 -0500
Received: from mga05.intel.com ([192.55.52.43]:13935 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725816AbhAHNpg (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 8 Jan 2021 08:45:36 -0500
IronPort-SDR: o6Pnh5XI9ORbQ8kQJOhqOX5dYMNd2s5y4Cy6oxmezF8GWO7laTy12VDg4b5VGFSlQrenOIMxYl
 71CBBkMW9i9Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="262367724"
X-IronPort-AV: E=Sophos;i="5.79,331,1602572400"; 
   d="scan'208";a="262367724"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2021 05:44:55 -0800
IronPort-SDR: K/FgkxVb1TPkXWsqew2sd35rED4PvOy60sQpxxLA/eHwgmd4rKOfFXzfiQ6Tqw8vByyFivtvOR
 hCZxJD6swpKg==
X-IronPort-AV: E=Sophos;i="5.79,331,1602572400"; 
   d="scan'208";a="347355264"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2021 05:44:54 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1kxs5U-006CFY-I6; Fri, 08 Jan 2021 15:45:56 +0200
Date:   Fri, 8 Jan 2021 15:45:56 +0200
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 4/4] pinctrl: intel: Convert capability list to
 features
Message-ID: <20210108134556.GM4077@smile.fi.intel.com>
References: <20210107190200.41221-1-andriy.shevchenko@linux.intel.com>
 <20210107190200.41221-4-andriy.shevchenko@linux.intel.com>
 <20210108070722.GX968855@lahna.fi.intel.com>
 <CAHp75Vcckax+HYH1aYDG0tsgiL_1xXLqRW-8Xjq4+-OhLWXaLA@mail.gmail.com>
 <CAHp75VcPM0UH6iaCdbakgdaxM7CaJax8-kVLMzYvAeFfRYgdng@mail.gmail.com>
 <20210108124643.GA968855@lahna.fi.intel.com>
 <CAHp75VcrWhnM5xFEwhK8yPAJ9yLeuGMZh7Xr0V8_x7Jyvgvu2g@mail.gmail.com>
 <20210108131138.GB968855@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210108131138.GB968855@lahna.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 08, 2021 at 03:11:38PM +0200, Mika Westerberg wrote:
> On Fri, Jan 08, 2021 at 02:51:09PM +0200, Andy Shevchenko wrote:
> > On Fri, Jan 8, 2021 at 2:46 PM Mika Westerberg
> > <mika.westerberg@linux.intel.com> wrote:

...

> > What about solving the issue when it comes?
> 
> Up to you :)

I have sent v2 with dropped patch 3 and added your tag for patches 1 and 2.
Please, review the patch 3 which is basically kept unchanged.
Thanks!

> > > IMHO it is always good idea to avoid possible infinite loops
> > > especially in the kernel space.
> > 
> > But do PCI / xHCI (the first two that came to my mind) have something like this?
> 
> Yes they do, at least PCI. I would expect xHCI to have it too as the
> hardware can be hot removed in the middle of a capability list walk
> returning 1's on subsequent reads.

Good to know.

-- 
With Best Regards,
Andy Shevchenko


