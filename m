Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E05DD32C7BB
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 02:11:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355679AbhCDAcl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Mar 2021 19:32:41 -0500
Received: from mga01.intel.com ([192.55.52.88]:14698 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1359446AbhCCOTi (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 3 Mar 2021 09:19:38 -0500
IronPort-SDR: +j4insH0YKwL73IpK0yMN9xRJi0RbtT2m/bV2VwIzj0JF+hQXnHtRoVoZxBK3ssGqsmzQm/Wqz
 5UEVXbU+8H5w==
X-IronPort-AV: E=McAfee;i="6000,8403,9911"; a="206886447"
X-IronPort-AV: E=Sophos;i="5.81,220,1610438400"; 
   d="scan'208";a="206886447"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2021 06:08:14 -0800
IronPort-SDR: YYxpnDkXZKG/fOmU1CffepywSFzHiFjxUDMeHKxJdjGiH1WKMwrPGmgFRsZLwZbXElLoq+9YzQ
 BugvG8wZAa5w==
X-IronPort-AV: E=Sophos;i="5.81,220,1610438400"; 
   d="scan'208";a="399730372"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2021 06:08:11 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1lHSAb-009eRb-7j; Wed, 03 Mar 2021 16:08:09 +0200
Date:   Wed, 3 Mar 2021 16:08:09 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/2] pinctrl: qcom: handle tiles for ACPI boot
Message-ID: <YD+YSS/s79gqwEpS@smile.fi.intel.com>
References: <20210303132622.4115-1-shawn.guo@linaro.org>
 <20210303132622.4115-2-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210303132622.4115-2-shawn.guo@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 03, 2021 at 09:26:21PM +0800, Shawn Guo wrote:
> It's not always the case that DT and ACPI describe hardware resource in
> the same schema, even for a single platform.  For example, on SC8180X,
> DT uses the tiles schema while ACPI describe memory resource as a single
> region.  It patches msm_pinctrl_probe() function to map tiles regions
> only for DT.  While for ACPI, it maps the single memory resource and
> calculate tile bases with offsets passed from SoC data.

...

> +#include <linux/acpi.h>

There are at least two possibilities to avoid this:
 - use is_of_node(dev_fwnode(dev)), or in case you need board files support,
   !(fwnode && is_of_fwnode(fwnode))
 - provide the tiles support directly from the driver thru internal data structures

 And to me the second approach seems better, because there is no guarantee that
 tiles support is only defined by the fwnode type.

-- 
With Best Regards,
Andy Shevchenko


