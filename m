Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB3E82D77EE
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Dec 2020 15:35:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406263AbgLKOcl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Dec 2020 09:32:41 -0500
Received: from mga18.intel.com ([134.134.136.126]:24406 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2406239AbgLKOcQ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 11 Dec 2020 09:32:16 -0500
IronPort-SDR: o3OqOs9s4Yn9d8Bt7dmUs29RnbJ0IY4P/cfxTT2W3sjEaUwEeuy00DMq/sY58RlSCgb4RH7Ato
 lcW/P1YRTuOA==
X-IronPort-AV: E=McAfee;i="6000,8403,9831"; a="162193959"
X-IronPort-AV: E=Sophos;i="5.78,411,1599548400"; 
   d="scan'208";a="162193959"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2020 06:30:29 -0800
IronPort-SDR: iibC4NCEmIeEbfsdl6GPKiHLLORZejO7cN2t76hxFE7SeGuTb3uEJm6sWjExRYFxcyHBbK2SgY
 LxM7Kx9JcT1g==
X-IronPort-AV: E=Sophos;i="5.78,411,1599548400"; 
   d="scan'208";a="409237892"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2020 06:30:27 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1knjSD-00Dfzl-G0; Fri, 11 Dec 2020 16:31:29 +0200
Date:   Fri, 11 Dec 2020 16:31:29 +0200
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
Message-ID: <20201211143129.GR4077@smile.fi.intel.com>
References: <20201210132315.5785-1-brgl@bgdev.pl>
 <20201210135627.GH4077@smile.fi.intel.com>
 <CAMRc=McJLC23-RcOH+EyCWiwhSjgwfjS4W=tCijBmqWUcqdVRg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=McJLC23-RcOH+EyCWiwhSjgwfjS4W=tCijBmqWUcqdVRg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 11, 2020 at 09:38:44AM +0100, Bartosz Golaszewski wrote:
> On Thu, Dec 10, 2020 at 2:55 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Thu, Dec 10, 2020 at 02:23:01PM +0100, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > >
> > > The following series removes a lot of interfaces that were deemed overkill
> > > in libgpiod and the removal of which was suggested to me before proceeding
> > > with the new API.
> > >
> > > This leaves a couple holes in the library but we'll follow them up with
> > > more improvements all over the tree. We'll create a new object called
> > > gpiod_request for dealing with line requests of arbitrary size. We'll
> > > probably remove the the bulk objects from bindings and eventually we'll
> > > switch to using the v2 kernel uAPI.
> > >
> > > Andy - a note for you: I know you're always very thorough in your reviews
> > > but in this case let's consider this series preparing a construction zone
> > > for the new API. Please don't nitpick too much. :)
> >
> > I don't know what you are talking about. The series looks nice, esp. taking
> > into account statistics! FWIW,
> >
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >
> > One side note, though. Are you already plan to support autotools-2.70?
> >
> 
> Isn't it already supported? 2.69 is the minimum version, 2.70 should just work.

Have you read an article on LWN about changes [1]? There are a lot of
incompatibilities (note between 2.69 and 2.70 _8_ years passed).

[1]: https://lwn.net/Articles/839395/

-- 
With Best Regards,
Andy Shevchenko


