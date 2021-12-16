Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12178477064
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Dec 2021 12:37:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbhLPLhe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Dec 2021 06:37:34 -0500
Received: from mga11.intel.com ([192.55.52.93]:2776 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229521AbhLPLhe (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 16 Dec 2021 06:37:34 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="237007115"
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; 
   d="scan'208";a="237007115"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2021 03:37:19 -0800
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; 
   d="scan'208";a="466012306"
Received: from smile.fi.intel.com ([10.237.72.184])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2021 03:37:17 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mxp3e-00712z-P1;
        Thu, 16 Dec 2021 13:36:22 +0200
Date:   Thu, 16 Dec 2021 13:36:22 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linux GPIO <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [GIT PULL] intel-gpio for 5.17-1
Message-ID: <YbskttzHvxlprBPM@smile.fi.intel.com>
References: <Ybn8pxv5xPgc5nGz@black.fi.intel.com>
 <CAMRc=MceOZWt5Qb6kFSALOOwyYb_MikFusxZqt9KgqqQPfnwgQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MceOZWt5Qb6kFSALOOwyYb_MikFusxZqt9KgqqQPfnwgQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 16, 2021 at 10:14:05AM +0100, Bartosz Golaszewski wrote:
> On Wed, Dec 15, 2021 at 3:33 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > Hi Linux GPIO  maintainers,
> >
> > Approximately a dozen of changes for v5.17 against Intel GPIO drivers and
> > GPIO ACPI library. It has ben a while in Linux Next without any error reported.

> Pulled, thanks!

Thanks!

Are you going to pull series with the OF node assignments clean up?
I forgot to mention here that my PR does not include them.

-- 
With Best Regards,
Andy Shevchenko


