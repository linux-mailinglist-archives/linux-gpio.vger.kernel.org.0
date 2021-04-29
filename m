Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EF9636EE88
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Apr 2021 19:03:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240843AbhD2REE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Apr 2021 13:04:04 -0400
Received: from mga11.intel.com ([192.55.52.93]:17807 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240748AbhD2RED (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 29 Apr 2021 13:04:03 -0400
IronPort-SDR: jr2NNkfsY9kkMHayYnFmBUNgkKtPBEgPJvSW9HzjMM7g16kep6opEPm9s1uNBYjhIqwO93WmWs
 Yf6LTquCT69g==
X-IronPort-AV: E=McAfee;i="6200,9189,9969"; a="193872814"
X-IronPort-AV: E=Sophos;i="5.82,259,1613462400"; 
   d="scan'208";a="193872814"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2021 10:03:05 -0700
IronPort-SDR: dlEHNk6bEyjytbbkahF16sV+rsXaY2xhfkDe2URRYN/ig6Qy+BI/i1D9eYCepExz8BZHMYMm6S
 nYndB5nmPvRw==
X-IronPort-AV: E=Sophos;i="5.82,259,1613462400"; 
   d="scan'208";a="605330643"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2021 10:03:03 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lcA45-008C9h-4o; Thu, 29 Apr 2021 20:03:01 +0300
Date:   Thu, 29 Apr 2021 20:03:01 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod][PATCH 2/3] libgpiosim: new library for controlling
 the gpio-sim module
Message-ID: <YIrmxckO0P1Z4w/a@smile.fi.intel.com>
References: <20210429094734.9585-1-brgl@bgdev.pl>
 <20210429094734.9585-3-brgl@bgdev.pl>
 <YIqXHXU/tqxXjaKA@smile.fi.intel.com>
 <CAMRc=MeKciVDxdFvq6_d8mN8M08tqDSc1qDqmywswF2gbUa=Dg@mail.gmail.com>
 <YIrmHkaKnrr4IdCT@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YIrmHkaKnrr4IdCT@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 29, 2021 at 08:00:14PM +0300, Andy Shevchenko wrote:
> On Thu, Apr 29, 2021 at 03:07:49PM +0200, Bartosz Golaszewski wrote:
> > On Thu, Apr 29, 2021 at 1:23 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Thu, Apr 29, 2021 at 11:47:33AM +0200, Bartosz Golaszewski wrote:

...

> > > > +/* We don't have mkdtempat()... :( */
> > >
> > > But we have tmpnam() / tmpnam_r(), why to reinvent it below?
> > >
> > 
> > Because of this:
> > 
> > $man tmpnam_r
> > ...
> > The created pathname has a directory prefix P_tmpdir.
> > ...
> > 
> > And this:
> > 
> > ./stdio.h:120:# define P_tmpdir "/tmp"
> 
> Still you may advance the pointer by the length of P_tmpdir + 1.

There is also tempnam().

-- 
With Best Regards,
Andy Shevchenko


