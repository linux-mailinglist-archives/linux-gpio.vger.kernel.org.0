Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E1F431BE40
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Feb 2021 17:07:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231791AbhBOQEa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Feb 2021 11:04:30 -0500
Received: from mga02.intel.com ([134.134.136.20]:21245 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232336AbhBOPx1 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 15 Feb 2021 10:53:27 -0500
IronPort-SDR: tWehkKMtFH9CY5WB7N1vWo1aD2GU9vUCgyEeLdW7Hv4Fu0+7Z8wNOtF2Gha5JkH1eldsQv1XWg
 icb91fOb6gyg==
X-IronPort-AV: E=McAfee;i="6000,8403,9896"; a="169842328"
X-IronPort-AV: E=Sophos;i="5.81,180,1610438400"; 
   d="scan'208";a="169842328"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2021 07:51:40 -0800
IronPort-SDR: FUEmh7Vb2fNJDn+bvRi/TFwheK255ZO6sq2OrpMU/5Mja6NE/sb2TujMtjjZd9+BOuAXXY7I62
 3rbujDoNsR1w==
X-IronPort-AV: E=Sophos;i="5.81,180,1610438400"; 
   d="scan'208";a="438615690"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2021 07:51:38 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lBg9w-005G9P-4o; Mon, 15 Feb 2021 17:51:36 +0200
Date:   Mon, 15 Feb 2021 17:51:36 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Syed Nayyar Waris <syednwaris@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        William Breathitt Gray <vilhelm.gray@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 3/3] gpio: xilinx: Utilize generic bitmap_get_value
 and _set_value
Message-ID: <YCqYiIIhKk004Js8@smile.fi.intel.com>
References: <1b1f706b60e4c571c4f17d53ac640e8bd8384856.1613134924.git.syednwaris@gmail.com>
 <202102141226.pmNlFRSx-lkp@intel.com>
 <CACG_h5q5emgfbf4L-Czfh1GRiTUrx7a+LXCfsxUmQ8YSs1aoKw@mail.gmail.com>
 <YCp7QYTe4nVxS3AK@smile.fi.intel.com>
 <CACG_h5qbeSty16A6zmxAV=Pi=BQ=Su7U7Sb=j1t5_2qZ3ExO_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACG_h5qbeSty16A6zmxAV=Pi=BQ=Su7U7Sb=j1t5_2qZ3ExO_Q@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Feb 15, 2021 at 07:23:10PM +0530, Syed Nayyar Waris wrote:
> On Mon, Feb 15, 2021 at 7:16 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Mon, Feb 15, 2021 at 06:56:10PM +0530, Syed Nayyar Waris wrote:
> > > On Sun, Feb 14, 2021 at 10:11 AM kernel test robot <lkp@intel.com> wrote:

> > > > >> ERROR: modpost: "bitmap_get_value" [drivers/gpio/gpio-xilinx.ko] undefined!
> > > > >> ERROR: modpost: "bitmap_set_value" [drivers/gpio/gpio-xilinx.ko] undefined!
> > > >
> > >
> > > Dear All,
> > >
> > > I was able to reproduce the above 2 build errors with the config file
> > > provided and the build command mentioned in the above mail. But I need
> > > help to fix the build errors.
> > >
> > > Scenario:
> > > Function 'bitmap_get_value()' is declared in 'gpiolib.h'. It is
> > > defined in 'gpiolib.c'. Function 'bitmap_get_value()'  is then being
> > > used in gpio-xilinx.c and the build error is thrown. Similar situation
> > > holds for the other function 'bitmap_set_value'.
> > >
> > > How do I resolve the above build error?. Kindly illuminate. The full
> > > patchset can be found at:
> > > https://lore.kernel.org/patchwork/cover/1380056/
> >
> > Missed EXPORT_SYMBOL_GPL() or so?
> 
> It has EXPORT_SYMBOL_GPL(). But the build errors still persist.

Okay, I don't see an email with configuration file, so you need to dig it up to
understand what combination of options brought this.

-- 
With Best Regards,
Andy Shevchenko


