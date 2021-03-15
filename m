Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D52DF33B311
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Mar 2021 13:51:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229681AbhCOMuw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Mar 2021 08:50:52 -0400
Received: from mga18.intel.com ([134.134.136.126]:22548 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229703AbhCOMui (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 15 Mar 2021 08:50:38 -0400
IronPort-SDR: pP0tAGJLaFZFEB/N7t1b0+h3IW/+SX7tSTKMrS3NPGrCHy6pjbF8S1HcLCVWMIGN74Drb0natm
 tRZLmgXVhodw==
X-IronPort-AV: E=McAfee;i="6000,8403,9923"; a="176674480"
X-IronPort-AV: E=Sophos;i="5.81,249,1610438400"; 
   d="scan'208";a="176674480"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2021 05:50:36 -0700
IronPort-SDR: g/R/Dq5gGR6hM1qKL2p3YOCWWXbGCRbjXmDdbPgLRKqwjhnevWJ27efpXhWDwkunU4gtMvonah
 GvV3A6xBHkow==
X-IronPort-AV: E=Sophos;i="5.81,249,1610438400"; 
   d="scan'208";a="511013126"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2021 05:50:35 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lLmg4-00Cg6W-2c; Mon, 15 Mar 2021 14:50:32 +0200
Date:   Mon, 15 Mar 2021 14:50:32 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Marek Vasut <marex@denx.de>,
        Roman Guskov <rguskov@dh-electronics.com>
Subject: Re: [PATCH v1 1/1] gpiolib: Read "gpio-line-names" from a firmware
 node
Message-ID: <YE9YGGB+k7CsCNDI@smile.fi.intel.com>
References: <20210305120240.42830-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=Mfye=O4mMiK01Q6Ok+ztSfMwMcrfaZSs+LhRxi=AM+C2w@mail.gmail.com>
 <YE8z+ohM9abBs9SD@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YE8z+ohM9abBs9SD@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 15, 2021 at 12:16:26PM +0200, Andy Shevchenko wrote:
> On Mon, Mar 15, 2021 at 10:01:47AM +0100, Bartosz Golaszewski wrote:
> > On Fri, Mar 5, 2021 at 1:03 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> 
> > Unfortunately while this may fix the particular use-case on STM32, it
> > breaks all other users as the 'gpio-line-names' property doesn't live
> > on dev_fwnode(&gdev->dev) but on dev_fwnode(chip->parent).
> > 
> > How about we first look for this property on the latter and only if
> > it's not present descend down to the former fwnode?
> 
> Oops, I have tested on x86 and it worked the same way.
> 
> Lemme check this, but I think the issue rather in ordering when we apply fwnode
> to the newly created device and when we actually retrieve gpio-line-names
> property.

Hmm... I can't see how it's possible can be. Can you provide a platform name
and pointers to the DTS that has been broken by the change?


-- 
With Best Regards,
Andy Shevchenko


