Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 319F82D7894
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Dec 2020 16:06:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436906AbgLKPAZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Dec 2020 10:00:25 -0500
Received: from mga01.intel.com ([192.55.52.88]:16394 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2392162AbgLKO7i (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 11 Dec 2020 09:59:38 -0500
IronPort-SDR: iBsOc/F18SFE9ejaSmNonteY8BJVi4aYNyk+EVHyWJ4sL9ffgleQqGsEf9ut/zmsqnTfR0cBJf
 /HkY4LvibD1Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9831"; a="192781594"
X-IronPort-AV: E=Sophos;i="5.78,411,1599548400"; 
   d="scan'208";a="192781594"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2020 06:57:52 -0800
IronPort-SDR: RLjrR+ybVgIFCekUxjQTyg3+6CkxHWzW5fT7pXPWUU3ofjwYxh6u+E/V7RPDuuK1AeBRyhZrtu
 PXKWVQylo/Yw==
X-IronPort-AV: E=Sophos;i="5.78,411,1599548400"; 
   d="scan'208";a="374412712"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2020 06:57:50 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1knjsi-00DgEM-Af; Fri, 11 Dec 2020 16:58:52 +0200
Date:   Fri, 11 Dec 2020 16:58:52 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [libgpiod][PATCH 00/14] treewide: start shaving off cruft for
 v2.0
Message-ID: <20201211145852.GU4077@smile.fi.intel.com>
References: <20201210132315.5785-1-brgl@bgdev.pl>
 <20201210135627.GH4077@smile.fi.intel.com>
 <CAMRc=McJLC23-RcOH+EyCWiwhSjgwfjS4W=tCijBmqWUcqdVRg@mail.gmail.com>
 <20201211143129.GR4077@smile.fi.intel.com>
 <CAMRc=Md8p-JbyM4fQzFry7_7gHwcDy9CE0NRH_6vWPuVfj-Opg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Md8p-JbyM4fQzFry7_7gHwcDy9CE0NRH_6vWPuVfj-Opg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 11, 2020 at 03:33:41PM +0100, Bartosz Golaszewski wrote:
> On Fri, Dec 11, 2020 at 3:30 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Fri, Dec 11, 2020 at 09:38:44AM +0100, Bartosz Golaszewski wrote:
> > > On Thu, Dec 10, 2020 at 2:55 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Thu, Dec 10, 2020 at 02:23:01PM +0100, Bartosz Golaszewski wrote:

...

> > > > One side note, though. Are you already plan to support autotools-2.70?
> > >
> > > Isn't it already supported? 2.69 is the minimum version, 2.70 should just work.
> >
> > Have you read an article on LWN about changes [1]? There are a lot of
> > incompatibilities (note between 2.69 and 2.70 _8_ years passed).
> >
> > [1]: https://lwn.net/Articles/839395/
> 
> How will distros handle the incompatibilities? I don't think all
> projects - many no longer even supported - will suddenly switch to new
> autoconf.

It's PITA for distributions. Last time I remember that nice jump from 2.13 to 2.50.
However, 2.69 should be closer to 2.70. I believe the distributions will patch
all broken packages one-by-one. I think there is no need to keep two autoconf
packages together in this case, but who knows, it might be a last resort.

-- 
With Best Regards,
Andy Shevchenko


