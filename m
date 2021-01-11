Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D98192F189C
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Jan 2021 15:46:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730565AbhAKOq1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Jan 2021 09:46:27 -0500
Received: from mga09.intel.com ([134.134.136.24]:26324 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727304AbhAKOq1 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 11 Jan 2021 09:46:27 -0500
IronPort-SDR: kbmC0JMd8ZEaBMfcv8Tw5KBGb5UAD3oa3ne9LhFkc/af7dPZ2Kj2E0MjDmB6CJdO60bRakKjWF
 ngpF3/sEHTCA==
X-IronPort-AV: E=McAfee;i="6000,8403,9860"; a="178020791"
X-IronPort-AV: E=Sophos;i="5.79,338,1602572400"; 
   d="scan'208";a="178020791"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2021 06:45:46 -0800
IronPort-SDR: upYobWMP8UpWBCUXzfo7p17apmL+RYTm9Vp/6PSdb0P/MTFGyie/aAFrMxu+3y5+k3hDWKALtK
 fE8cPkrW1g0A==
X-IronPort-AV: E=Sophos;i="5.79,338,1602572400"; 
   d="scan'208";a="423812929"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2021 06:45:45 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1kyyT1-00AMJ2-1c; Mon, 11 Jan 2021 16:46:47 +0200
Date:   Mon, 11 Jan 2021 16:46:47 +0200
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [libgpiod][PATCH 6/6] core: add the kernel uapi header to the
 repository
Message-ID: <20210111144647.GY4077@smile.fi.intel.com>
References: <20210111133426.22040-1-brgl@bgdev.pl>
 <20210111133426.22040-7-brgl@bgdev.pl>
 <CAHp75VfeO10DXc2nCRKP9=6uppJ28k36E8yr20+YCd0mKUGjWA@mail.gmail.com>
 <CAMRc=MevGmAMBK20O2BBmyD9NjCSpC9-O_j_0HM6DQV66rnA2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MevGmAMBK20O2BBmyD9NjCSpC9-O_j_0HM6DQV66rnA2Q@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 11, 2021 at 03:06:28PM +0100, Bartosz Golaszewski wrote:
> On Mon, Jan 11, 2021 at 2:45 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> >
> > On Mon, Jan 11, 2021 at 3:37 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > >
> > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > >
> > > In order to avoid any problems with symbols missing from the host linux
> > > kernel headers (for example: if current version of libgpiod supports
> > > features that were added recently to the kernel but the host headers are
> > > outdated and don't export required symbols) let's add the uapi header to
> > > the repository and include it instead of the one in /usr/include/linux.
> >
> > I doubt this is a good decision. First of all if the host (or rather
> > target, because host should not influence build of libgpiod) has
> 
> I meant the host as in: the machine on which you build and which
> contains the headers for the target as well but I see what you mean.
> 
> > outdated header it may be for a reason (it runs old kernel).
> > When you run new library on outdated kernel it might produce various
> > of interesting errors (in general, I haven't investigated libgpiod
> > case).
> > On top of that you make a copy'n'paste source code which is against
> > the Unix way.
> >
> > Sorry, but I'm in favour of dropping this one.
> >
> 
> Cc: Thomas
> 
> This problem has been raised by the buildroot people when we started
> requiring different versions of kernel headers to build v1.4 and v1.6.
> It turns out most projects simply package the uapi headers together
> with their sources (e.g. wpa_supplicant, libnl, iproute2) to avoid
> complicated dependencies. It's true that now the library can fail at
> runtime but I'm fine with that. Also: if we add new features between
> two kernel versions, we still allow to build the new library version
> except that these new features won't work on older kernels.

I see.

So known ways to solve this are
 - provide a header with source tree (see above)
 - modify code with ifdeffery against specific kernel versions
 - ...something else... ?

Second item is what ALSA used (not sure if they provide a standalone driver
anymore). Ugly, but won't require header which may be staled.

Any other solutions in mind?


-- 
With Best Regards,
Andy Shevchenko


