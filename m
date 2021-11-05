Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 805D3446418
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Nov 2021 14:24:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232946AbhKEN1R (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Nov 2021 09:27:17 -0400
Received: from mga18.intel.com ([134.134.136.126]:49150 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232913AbhKEN1L (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 5 Nov 2021 09:27:11 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10158"; a="218794808"
X-IronPort-AV: E=Sophos;i="5.87,211,1631602800"; 
   d="scan'208";a="218794808"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2021 06:24:31 -0700
X-IronPort-AV: E=Sophos;i="5.87,211,1631602800"; 
   d="scan'208";a="729933654"
Received: from smile.fi.intel.com ([10.237.72.184])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2021 06:24:26 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mizCV-003ni9-8h;
        Fri, 05 Nov 2021 15:24:11 +0200
Date:   Fri, 5 Nov 2021 15:24:11 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-m68k@lists.linux-m68k.org, geert@linux-m68k.org,
        gerg@linux-m68k.org, linux@armlinux.org.uk,
        linux-arm-kernel@lists.infradead.org, linux-sh@vger.kernel.org,
        dalias@libc.org, ysato@users.sourceforge.jp,
        Arnd Bergmann <arnd@arndb.de>,
        Fu Wei <tekkamanninja@gmail.com>, Alex Shi <alexs@kernel.org>,
        Hu Haowen <src.res@email.cn>,
        linux-doc-tw-discuss@lists.sourceforge.net,
        Jonathan Corbet <corbet@lwn.net>,
        Drew Fustini <drew@beagleboard.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC 1/3] gpiolib: remove irq_to_gpio() definition
Message-ID: <YYUwe0fGs6ypDySp@smile.fi.intel.com>
References: <20211105130338.241100-1-arnd@kernel.org>
 <YYUwWFOeiFBC2Nhd@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YYUwWFOeiFBC2Nhd@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 05, 2021 at 03:23:37PM +0200, Andy Shevchenko wrote:
> On Fri, Nov 05, 2021 at 02:03:03PM +0100, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> > 
> > All implementations other than coldfire have returned an error since
> > the avr32 and blackfin architectures got removed, and the last user in
> > driver code was removed in 2016, so just remove this old interface.
> > 
> > The only reference is now in the Chinese documentation, which should be
> > changed to remove this reference as well.
> 
> FWIW,
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

This is for the entire series.

> Thanks, Arnd, for cleaning this up!

-- 
With Best Regards,
Andy Shevchenko


