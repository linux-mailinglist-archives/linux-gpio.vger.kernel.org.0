Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 020D145A008
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Nov 2021 11:22:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231221AbhKWKZO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Nov 2021 05:25:14 -0500
Received: from mga06.intel.com ([134.134.136.31]:44413 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229847AbhKWKZO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 23 Nov 2021 05:25:14 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10176"; a="295803825"
X-IronPort-AV: E=Sophos;i="5.87,257,1631602800"; 
   d="scan'208";a="295803825"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2021 02:22:06 -0800
X-IronPort-AV: E=Sophos;i="5.87,257,1631602800"; 
   d="scan'208";a="457006733"
Received: from smile.fi.intel.com ([10.237.72.184])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2021 02:22:05 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1mpSw5-009k8x-Lv;
        Tue, 23 Nov 2021 12:22:01 +0200
Date:   Tue, 23 Nov 2021 12:22:01 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Ed Schaller <schallee@darkmist.net>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] mfd: intel-lpss: Add Intel Lakefield PCH PCI IDs
Message-ID: <YZzAyZgqVwPsjsSh@smile.fi.intel.com>
References: <20211122223606.GA20997@darkmist.net>
 <YZvYhBB23ITS+Pw0@smile.fi.intel.com>
 <YZywikZuMSnbqpI1@google.com>
 <YZy2jh0hexxgiPcw@smile.fi.intel.com>
 <YZy+mf9E4YVsv9Ru@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YZy+mf9E4YVsv9Ru@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 23, 2021 at 10:12:41AM +0000, Lee Jones wrote:
> On Tue, 23 Nov 2021, Andy Shevchenko wrote:
> > On Tue, Nov 23, 2021 at 09:12:42AM +0000, Lee Jones wrote:
> > > On Mon, 22 Nov 2021, Andy Shevchenko wrote:

...

> > > Odd.  This didn't make it into my inbox.
> > 
> > Hmm... Maybe it's sorted out due to linux-gpio@ vs. linux-kernel@ ML?
> 
> No, I mean it doesn't appear anywhere in my mail.
> 
> Including LKML et al. sub-folders.

I see, this is indeed odd.

-- 
With Best Regards,
Andy Shevchenko


