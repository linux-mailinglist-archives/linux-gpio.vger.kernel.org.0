Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7508A3E920F
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Aug 2021 15:00:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229617AbhHKNBD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Aug 2021 09:01:03 -0400
Received: from mga04.intel.com ([192.55.52.120]:44826 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229576AbhHKNBD (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Aug 2021 09:01:03 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10072"; a="213263256"
X-IronPort-AV: E=Sophos;i="5.84,313,1620716400"; 
   d="scan'208";a="213263256"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2021 06:00:38 -0700
X-IronPort-AV: E=Sophos;i="5.84,313,1620716400"; 
   d="scan'208";a="516727576"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2021 06:00:34 -0700
Received: from andy by smile with local (Exim 4.94.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mDnqO-007pRB-HI; Wed, 11 Aug 2021 16:00:28 +0300
Date:   Wed, 11 Aug 2021 16:00:28 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v2 3/4] mfd: intel_quark_i2c_gpio: Convert GPIO to use
 software nodes
Message-ID: <YRPJ7Iws2Hb6pE6G@smile.fi.intel.com>
References: <20210804160019.77105-1-andriy.shevchenko@linux.intel.com>
 <20210804160019.77105-3-andriy.shevchenko@linux.intel.com>
 <YQubJ1s2YuEZk4lm@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YQubJ1s2YuEZk4lm@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 05, 2021 at 09:02:47AM +0100, Lee Jones wrote:
> On Wed, 04 Aug 2021, Andy Shevchenko wrote:
> 
> > The driver can provide a software node group instead of
> > passing legacy platform data. This will allow to drop
> > the legacy platform data structures along with unifying
> > a child device driver to use same interface for all
> > property providers, i.e. Device Tree, ACPI, and board files.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Tested-by: Serge Semin <fancer.lancer@gmail.com>
> > ---
> > v2: added tag (Serge)
> >  drivers/mfd/intel_quark_i2c_gpio.c | 70 ++++++++++++++++--------------
> >  1 file changed, 37 insertions(+), 33 deletions(-)
> 
> For my own reference (apply this as-is to your sign-off block):
> 
>   Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

Thanks!

Just for your information. I think due to spaces in front of your tag
the `b4` tool can't catch this automatically.

-- 
With Best Regards,
Andy Shevchenko


