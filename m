Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11499132A92
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 16:58:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728118AbgAGP65 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jan 2020 10:58:57 -0500
Received: from mga14.intel.com ([192.55.52.115]:26224 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727974AbgAGP65 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 7 Jan 2020 10:58:57 -0500
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 Jan 2020 07:58:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,406,1571727600"; 
   d="scan'208";a="370629795"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004.jf.intel.com with ESMTP; 07 Jan 2020 07:58:54 -0800
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1iorFu-0006gd-RA; Tue, 07 Jan 2020 17:58:54 +0200
Date:   Tue, 7 Jan 2020 17:58:54 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stefani Seibold <stefani@seibold.net>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Kent Gibson <warthog618@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 00/13] gpiolib: add an ioctl() for monitoring line
 status changes
Message-ID: <20200107155854.GK32742@smile.fi.intel.com>
References: <20191224120709.18247-1-brgl@bgdev.pl>
 <CACRpkdZ_TroKCAnDWiY-jPbe0NL+ingm1pMLQLPxT1Uh78kx8g@mail.gmail.com>
 <CAMpxmJXikLw0d1e1Eq7vVzoORz3utEBxfG6nRmkngLqezVqtuA@mail.gmail.com>
 <CACRpkdY2NXNrAk9VY18YDeQ2WDfDfAyi4mgW26JuTPHdEOE-uQ@mail.gmail.com>
 <20200107144455.GF32742@smile.fi.intel.com>
 <20200107144548.GG32742@smile.fi.intel.com>
 <CAMpxmJWkKPQYAE3_JdWVkdtSZLeky=bouOyyJ+c2ySMc+1LFyw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMpxmJWkKPQYAE3_JdWVkdtSZLeky=bouOyyJ+c2ySMc+1LFyw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 07, 2020 at 04:19:59PM +0100, Bartosz Golaszewski wrote:
> wt., 7 sty 2020 o 15:45 Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> napisał(a):
> >
> > On Tue, Jan 07, 2020 at 04:44:55PM +0200, Andy Shevchenko wrote:
> > > On Tue, Jan 07, 2020 at 01:50:28PM +0100, Linus Walleij wrote:
> > >
> > > ...
> > >
> > > > Let's try to CC the actual author (Stefani Seibold) and see if the mail
> > > > address works and if he can look at it. Or did you already talk to
> > > > Stefani?
> > > >
> > > > (git blame is always my best friend in cases like this, hehe)
> > >
> > > Recently I started to be smarted in such cases, i.e. I run also
> > > `git log --author='$AUTHOR'` to see if they are still active and
> > > what address had been used lately.
> >
> > ...and another possibility to `git log --grep '$AUTHOR'`.

> So if some module doesn't have an official maintainer listed in
> MAINTAINERS, we should still get a review from the original author?

If you asking me, I do it in a way of playing good citizen. It's not required,
but may give a good feedback.

> KFIFO lives in lib/ - is there even an official maintainer for all
> library helpers?

lib/ is (in most cases) under akpm@ realm.

-- 
With Best Regards,
Andy Shevchenko


