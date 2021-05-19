Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DC9B38886F
	for <lists+linux-gpio@lfdr.de>; Wed, 19 May 2021 09:45:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238806AbhESHqm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 May 2021 03:46:42 -0400
Received: from mga02.intel.com ([134.134.136.20]:44814 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234879AbhESHql (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 19 May 2021 03:46:41 -0400
IronPort-SDR: Jj44/z2AEc/GK2ugM9JhrnL0moFJFZZ0V3g1gzGzqkJVQESX3KkbGlgdcJnP3sJCYvJwSswYic
 F/fQsMEcEIEQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9988"; a="188042600"
X-IronPort-AV: E=Sophos;i="5.82,312,1613462400"; 
   d="scan'208";a="188042600"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2021 00:45:22 -0700
IronPort-SDR: RPGXIXXASOkQEW3xJ1raYGkgwDAxWM2cnqOVNkfL8WTYoFlUhFZswFiUg4ZWx+qIg/p3nPfQy9
 /qclinwFaDqQ==
X-IronPort-AV: E=Sophos;i="5.82,312,1613462400"; 
   d="scan'208";a="411625304"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2021 00:45:20 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1ljGtI-00DARi-6B; Wed, 19 May 2021 10:45:16 +0300
Date:   Wed, 19 May 2021 10:45:16 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Suresh Balakrishnan <suresh.balakrishnan@intel.com>
Subject: Re: [PATCH v1 1/2] gpiolib: Never return internal error codes to
 user space
Message-ID: <YKTCDNcyUlrgE0Y4@smile.fi.intel.com>
References: <20210518155013.45622-1-andriy.shevchenko@linux.intel.com>
 <20210518232451.GA7362@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210518232451.GA7362@sol>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 19, 2021 at 07:24:51AM +0800, Kent Gibson wrote:
> On Tue, May 18, 2021 at 06:50:12PM +0300, Andy Shevchenko wrote:
> > Currently it's possible that character device interface may return
> > the error codes which are not supposed to be seen by user space.
> > In this case it's EPROBE_DEFER.
> > 
> > Wrap it to return -ENODEV instead as sysfs does.

> > Fixes: d7c51b47ac11 ("gpio: userspace ABI for reading/writing GPIO lines")
> > Fixes: 61f922db7221 ("gpio: userspace ABI for reading GPIO line events")
> > Fixes: 3c0d9c635ae2 ("gpiolib: cdev: support GPIO_V2_GET_LINE_IOCTL and GPIO_V2_LINE_GET_VALUES_IOCTL")

...

> You immediately revert this patch in patch 2.
> My understanding is that is not allowed within a patch set.

> Why split the patches instead of going direct to the new helper?

It's for backporting to make it easier. (I deliberately left the context above)

I can fold them if maintainers think it's okay to do.


-- 
With Best Regards,
Andy Shevchenko


