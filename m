Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E1082EF3AA
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jan 2021 15:06:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726077AbhAHOFK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jan 2021 09:05:10 -0500
Received: from mga09.intel.com ([134.134.136.24]:34284 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726006AbhAHOFK (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 8 Jan 2021 09:05:10 -0500
IronPort-SDR: 6io2YzJqDKxfZ/IEUVgfg7FD0J56+s3ElNpH3SMyaT0D5QvoaimGMYB93KMgsKsVswWyD6XsZQ
 TUvrW2S9kjlw==
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="177746834"
X-IronPort-AV: E=Sophos;i="5.79,331,1602572400"; 
   d="scan'208";a="177746834"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2021 06:03:24 -0800
IronPort-SDR: GRdH5tfBeITlj8OAKSM5ZGRQ1B1rmSNl+zuWYgs312sZs1xAb9tKbBAmEzHb2MCHXiaN0mW/pQ
 S2ZoC73czFow==
X-IronPort-AV: E=Sophos;i="5.79,331,1602572400"; 
   d="scan'208";a="422960920"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2021 06:03:23 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kxsNN-006DHh-V0; Fri, 08 Jan 2021 16:04:25 +0200
Date:   Fri, 8 Jan 2021 16:04:25 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 3/3] pinctrl: intel: Convert capability list to
 features
Message-ID: <20210108140425.GQ4077@smile.fi.intel.com>
References: <20210108134005.30048-1-andriy.shevchenko@linux.intel.com>
 <20210108134005.30048-3-andriy.shevchenko@linux.intel.com>
 <20210108134635.GC968855@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210108134635.GC968855@lahna.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 08, 2021 at 03:46:35PM +0200, Mika Westerberg wrote:
> On Fri, Jan 08, 2021 at 03:40:05PM +0200, Andy Shevchenko wrote:
> > Communities can have features provided in the capability list.
> > Traverse the list and convert to respective features.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

All three pushed to my review and testing queue. Thanks!

-- 
With Best Regards,
Andy Shevchenko


