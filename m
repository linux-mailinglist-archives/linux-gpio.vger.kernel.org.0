Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7C4E459F5F
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Nov 2021 10:38:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231272AbhKWJlf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Nov 2021 04:41:35 -0500
Received: from mga12.intel.com ([192.55.52.136]:56500 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231246AbhKWJlf (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 23 Nov 2021 04:41:35 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10176"; a="215018282"
X-IronPort-AV: E=Sophos;i="5.87,257,1631602800"; 
   d="scan'208";a="215018282"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2021 01:38:27 -0800
X-IronPort-AV: E=Sophos;i="5.87,257,1631602800"; 
   d="scan'208";a="497224484"
Received: from smile.fi.intel.com ([10.237.72.184])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2021 01:38:26 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1mpSFq-009jUu-Ab;
        Tue, 23 Nov 2021 11:38:22 +0200
Date:   Tue, 23 Nov 2021 11:38:22 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Ed Schaller <schallee@darkmist.net>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] mfd: intel-lpss: Add Intel Lakefield PCH PCI IDs
Message-ID: <YZy2jh0hexxgiPcw@smile.fi.intel.com>
References: <20211122223606.GA20997@darkmist.net>
 <YZvYhBB23ITS+Pw0@smile.fi.intel.com>
 <YZywikZuMSnbqpI1@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YZywikZuMSnbqpI1@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 23, 2021 at 09:12:42AM +0000, Lee Jones wrote:
> On Mon, 22 Nov 2021, Andy Shevchenko wrote:
> > On Mon, Nov 22, 2021 at 04:36:06PM -0600, Ed Schaller wrote:
> > > Add new IDs of the Intel Lakefield chip to the list of supported
> > > devices.
> > 
> > Thank you for the patch, it LGTM,
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

...

> Odd.  This didn't make it into my inbox.

Hmm... Maybe it's sorted out due to linux-gpio@ vs. linux-kernel@ ML?

> Would you mind gathering Andy's R-b and re-sending please Ed?

Ed, please Cc also to LKML.

-- 
With Best Regards,
Andy Shevchenko


