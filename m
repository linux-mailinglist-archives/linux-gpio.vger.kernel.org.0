Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4169F388970
	for <lists+linux-gpio@lfdr.de>; Wed, 19 May 2021 10:30:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245160AbhESIcG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 May 2021 04:32:06 -0400
Received: from mga03.intel.com ([134.134.136.65]:34329 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244959AbhESIcF (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 19 May 2021 04:32:05 -0400
IronPort-SDR: 6C5Dr4t6r5QknYSrDgPH67vi2+5zfgCMIVi70gZoBbpEPZnKZrG36eTG9s5s6REuWDWjEeIDsv
 pvglub9W1ilg==
X-IronPort-AV: E=McAfee;i="6200,9189,9988"; a="200982647"
X-IronPort-AV: E=Sophos;i="5.82,312,1613462400"; 
   d="scan'208";a="200982647"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2021 01:30:28 -0700
IronPort-SDR: xTbh/GsgBHbPnnZtHA1+mOELbVKlC/3T0j19wwWAqm+E0gXXDO5KhBmbHh4vlGtg9yJd7K12zi
 I3AlsE9jcqcw==
X-IronPort-AV: E=Sophos;i="5.82,312,1613462400"; 
   d="scan'208";a="405414713"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2021 01:30:25 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1ljHaw-00DAuF-4V; Wed, 19 May 2021 11:30:22 +0300
Date:   Wed, 19 May 2021 11:30:22 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Suresh Balakrishnan <suresh.balakrishnan@intel.com>
Subject: Re: [PATCH v1 1/2] gpiolib: Never return internal error codes to
 user space
Message-ID: <YKTMninSSY3MK6Hf@smile.fi.intel.com>
References: <20210518155013.45622-1-andriy.shevchenko@linux.intel.com>
 <20210518232451.GA7362@sol>
 <YKTCDNcyUlrgE0Y4@smile.fi.intel.com>
 <20210519080434.GA22854@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210519080434.GA22854@sol>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 19, 2021 at 04:04:34PM +0800, Kent Gibson wrote:
> On Wed, May 19, 2021 at 10:45:16AM +0300, Andy Shevchenko wrote:
> > On Wed, May 19, 2021 at 07:24:51AM +0800, Kent Gibson wrote:
> > > On Tue, May 18, 2021 at 06:50:12PM +0300, Andy Shevchenko wrote:
> > > > Currently it's possible that character device interface may return
> > > > the error codes which are not supposed to be seen by user space.
> > > > In this case it's EPROBE_DEFER.
> > > > 
> > > > Wrap it to return -ENODEV instead as sysfs does.
> > 
> > > > Fixes: d7c51b47ac11 ("gpio: userspace ABI for reading/writing GPIO lines")
> > > > Fixes: 61f922db7221 ("gpio: userspace ABI for reading GPIO line events")
> > > > Fixes: 3c0d9c635ae2 ("gpiolib: cdev: support GPIO_V2_GET_LINE_IOCTL and GPIO_V2_LINE_GET_VALUES_IOCTL")
> > 
> > ...
> > 
> > > You immediately revert this patch in patch 2.
> > > My understanding is that is not allowed within a patch set.
> > 
> > > Why split the patches instead of going direct to the new helper?
> > 
> > It's for backporting to make it easier. (I deliberately left the context above)
> > 
> > I can fold them if maintainers think it's okay to do.
> > 
> 
> Not sure what the constraints are on backporting, but wouldn't it be
> simpler and cleaner to backport the new helper?

Logically (and ideally) it would be three different patches:
 1) introduce helper
 2) use helper
 3) fix places where it's needed to be done

But the above scheme doesn't fit backporting idea (we don't backport new
features and APIs without really necessity). So, the options left are:

Option a: One patch (feels a bit like above)
Option b: Two patches like in this series (yes, you are correct about
          disadvantages)

> But, as you say, it is the maintainers' call.

-- 
With Best Regards,
Andy Shevchenko


