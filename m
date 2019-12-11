Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 148BB11A93E
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2019 11:47:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727469AbfLKKr0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Dec 2019 05:47:26 -0500
Received: from mga17.intel.com ([192.55.52.151]:9140 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726119AbfLKKr0 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Dec 2019 05:47:26 -0500
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Dec 2019 02:47:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,301,1571727600"; 
   d="scan'208";a="387891033"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga005.jf.intel.com with ESMTP; 11 Dec 2019 02:47:23 -0800
Received: from andy by smile with local (Exim 4.93-RC7)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1iezWd-0004t4-O7; Wed, 11 Dec 2019 12:47:23 +0200
Date:   Wed, 11 Dec 2019 12:47:23 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v1 1/2] gpiolib: Fix line event handling in compatible
 mode
Message-ID: <20191211104723.GO32742@smile.fi.intel.com>
References: <20191204194229.64251-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=Mc88eiLtu7_0y51nGDzM0nRmwaOurLx9isf=qRB0uj7KA@mail.gmail.com>
 <20191210143902.GA3509@sol>
 <20191210165548.GY32742@smile.fi.intel.com>
 <CAMpxmJVMW=3k2odB9UKEzeopZ0q7T48Cux6ux=1j72Hv5A4yOQ@mail.gmail.com>
 <20191211092921.GA21730@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191211092921.GA21730@sol>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 11, 2019 at 05:29:21PM +0800, Kent Gibson wrote:
> On Wed, Dec 11, 2019 at 10:18:39AM +0100, Bartosz Golaszewski wrote:
> > wt., 10 gru 2019 o 17:55 Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> napisał(a):

> > > > Neither of those options are available for the
> > > > gpioevent_data, as that would break the ABI.
> > >
> > > ABI needs v2 actually.
> > >
> > 
> > I finally sat down to integrate this with my series and figured that
> > this can't go on top of it. It's a bug-fix actually and maybe even
> > stable material.
> > 
> > On the other hand - if we have so few users of GPIO chardev with
> > 32-bit user-space and 64-bit kernel - maybe we should just bite the
> > bullet, not fix this one, deprecate it and introduce a proper v2 of
> > the API?
> > 
> 
> Fixing it in API v2 makes the most sense to me.

I agree. Please, use only second patch in my series (if needed I can resend
it separately) and drop this one.

P.S. Actually it's not a bugfix since it's never worked from the day 1.

-- 
With Best Regards,
Andy Shevchenko


