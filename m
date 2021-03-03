Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A49B32C7FB
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 02:13:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234447AbhCDAdU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Mar 2021 19:33:20 -0500
Received: from mga06.intel.com ([134.134.136.31]:45588 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1345603AbhCCQRC (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 3 Mar 2021 11:17:02 -0500
IronPort-SDR: +fY9EY1RT8j4SqWvBwDCMEm/dH+On6pY8U966gZKACt4IiVaHuWEwTZPoitXSY3AdMUwM4Ip3I
 FsVXfgSxrclA==
X-IronPort-AV: E=McAfee;i="6000,8403,9912"; a="248628677"
X-IronPort-AV: E=Sophos;i="5.81,220,1610438400"; 
   d="scan'208";a="248628677"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2021 08:14:12 -0800
IronPort-SDR: KeNVribgt6OPFS/r6x2VT9fOQLwW7PQrUc2NanSBrGfBMUnOXnkCranScDzRJT4c0pAOF6LxFL
 ifzvU3Xo3POA==
X-IronPort-AV: E=Sophos;i="5.81,220,1610438400"; 
   d="scan'208";a="407302046"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2021 08:14:11 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1lHU8X-009g2a-3m; Wed, 03 Mar 2021 18:14:09 +0200
Date:   Wed, 3 Mar 2021 18:14:09 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/2] pinctrl: qcom: handle tiles for ACPI boot
Message-ID: <YD+10cmeWfppgj0I@smile.fi.intel.com>
References: <20210303132622.4115-1-shawn.guo@linaro.org>
 <20210303132622.4115-2-shawn.guo@linaro.org>
 <YD+YSS/s79gqwEpS@smile.fi.intel.com>
 <20210303144526.GC17424@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210303144526.GC17424@dragon>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 03, 2021 at 10:45:27PM +0800, Shawn Guo wrote:
> On Wed, Mar 03, 2021 at 04:08:09PM +0200, Andy Shevchenko wrote:
> > On Wed, Mar 03, 2021 at 09:26:21PM +0800, Shawn Guo wrote:
> > > It's not always the case that DT and ACPI describe hardware resource in
> > > the same schema, even for a single platform.  For example, on SC8180X,
> > > DT uses the tiles schema while ACPI describe memory resource as a single
> > > region.  It patches msm_pinctrl_probe() function to map tiles regions
> > > only for DT.  While for ACPI, it maps the single memory resource and
> > > calculate tile bases with offsets passed from SoC data.
> > 
> > ...
> > 
> > > +#include <linux/acpi.h>
> > 
> > There are at least two possibilities to avoid this:
> 
> So could you explain why we should avoid including this header?

Here you can include it, but it's quite huge in order to have just one little
function out of it. But main point is it seems that relying on firmware type
for the tiles support is fragile.

> >  - use is_of_node(dev_fwnode(dev)), or in case you need board files support,
> >    !(fwnode && is_of_fwnode(fwnode))
> >  - provide the tiles support directly from the driver thru internal data structures
> > 
> >  And to me the second approach seems better, because there is no guarantee that
> >  tiles support is only defined by the fwnode type.

-- 
With Best Regards,
Andy Shevchenko


