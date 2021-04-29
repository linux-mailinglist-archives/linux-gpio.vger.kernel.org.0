Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7517736EE90
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Apr 2021 19:05:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236036AbhD2RFe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Apr 2021 13:05:34 -0400
Received: from mga06.intel.com ([134.134.136.31]:57157 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233846AbhD2RFe (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 29 Apr 2021 13:05:34 -0400
IronPort-SDR: MjPYZoSvTU4FpAGOmu/h3T4XG/+JFwFssNzpBb8Bh0LO2BaOpatbmmKtBkwl1ZTXgXh1AY+NZb
 xPKdHh9mpFiA==
X-IronPort-AV: E=McAfee;i="6200,9189,9969"; a="258342305"
X-IronPort-AV: E=Sophos;i="5.82,259,1613462400"; 
   d="scan'208";a="258342305"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2021 10:04:47 -0700
IronPort-SDR: uFOpMm3oqN5H/tDdXYeTci52y9mMG7BKv/2eqNW/lpaQeiySK4PZxTMLPkl9SqWYi6FRMW8FZX
 fRpEL15T0iQQ==
X-IronPort-AV: E=Sophos;i="5.82,259,1613462400"; 
   d="scan'208";a="393974627"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2021 10:04:46 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lcA5j-008CBO-Jp; Thu, 29 Apr 2021 20:04:43 +0300
Date:   Thu, 29 Apr 2021 20:04:43 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod][PATCH 2/3] libgpiosim: new library for controlling
 the gpio-sim module
Message-ID: <YIrnK105JB0vNVva@smile.fi.intel.com>
References: <20210429094734.9585-1-brgl@bgdev.pl>
 <20210429094734.9585-3-brgl@bgdev.pl>
 <YIqXHXU/tqxXjaKA@smile.fi.intel.com>
 <CAMRc=MeKciVDxdFvq6_d8mN8M08tqDSc1qDqmywswF2gbUa=Dg@mail.gmail.com>
 <YIrmHkaKnrr4IdCT@smile.fi.intel.com>
 <YIrmxckO0P1Z4w/a@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YIrmxckO0P1Z4w/a@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 29, 2021 at 08:03:01PM +0300, Andy Shevchenko wrote:
> On Thu, Apr 29, 2021 at 08:00:14PM +0300, Andy Shevchenko wrote:
> > On Thu, Apr 29, 2021 at 03:07:49PM +0200, Bartosz Golaszewski wrote:

...

> > Still you may advance the pointer by the length of P_tmpdir + 1.
> 
> There is also tempnam().

Scratch it. It seems legacy one that actually tries to create file...

-- 
With Best Regards,
Andy Shevchenko


