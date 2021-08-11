Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F0CB3E91FE
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Aug 2021 14:56:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230018AbhHKM4g (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Aug 2021 08:56:36 -0400
Received: from mga07.intel.com ([134.134.136.100]:51935 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229737AbhHKM4e (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Aug 2021 08:56:34 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10072"; a="278862257"
X-IronPort-AV: E=Sophos;i="5.84,313,1620716400"; 
   d="scan'208";a="278862257"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2021 05:56:10 -0700
X-IronPort-AV: E=Sophos;i="5.84,313,1620716400"; 
   d="scan'208";a="639153610"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2021 05:56:09 -0700
Received: from andy by smile with local (Exim 4.94.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mDnm7-007pMn-81; Wed, 11 Aug 2021 15:56:03 +0300
Date:   Wed, 11 Aug 2021 15:56:03 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v1 1/1] gpiolib: Deduplicate forward declaration in the
 consumer.h header
Message-ID: <YRPI4+weWaSZWYJg@smile.fi.intel.com>
References: <20210803173925.57216-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdawS25uPOf4c2m+Z0aNSN2UMNouhd6SrmRhNrLecnwzEQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdawS25uPOf4c2m+Z0aNSN2UMNouhd6SrmRhNrLecnwzEQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 11, 2021 at 02:05:40PM +0200, Linus Walleij wrote:
> On Tue, Aug 3, 2021 at 7:39 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > struct acpi_device is repeated in two branches of ifdeffery.
> > Move it out and hence deduplicate.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> That's neat!
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks!

Bart, I'll send this inside my usual PR in terms of GPIO ACPI support.

-- 
With Best Regards,
Andy Shevchenko


