Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0819032C7B7
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 02:11:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353349AbhCDAck (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Mar 2021 19:32:40 -0500
Received: from mga17.intel.com ([192.55.52.151]:55483 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1359237AbhCCOEv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 3 Mar 2021 09:04:51 -0500
IronPort-SDR: VL+Q5kWggOTIJ0Z4rrAZvz7JnKAPjgCjhI0xVD1wOU49epBU4t18ZIbbfyqw9ksGMzfjgP+hXz
 eLz1+UZcUdnA==
X-IronPort-AV: E=McAfee;i="6000,8403,9911"; a="167095330"
X-IronPort-AV: E=Sophos;i="5.81,220,1610438400"; 
   d="scan'208";a="167095330"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2021 06:04:15 -0800
IronPort-SDR: 3O+LflCqYvuIAAEnR6SZiruCPCt7pZyuJCFrrgfzHjXqsXy6by2bOZDYxVEGbeY8SeiiqBJK5K
 SPZMCEpViI8w==
X-IronPort-AV: E=Sophos;i="5.81,220,1610438400"; 
   d="scan'208";a="399728926"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2021 06:04:13 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1lHS6j-009eOy-3S; Wed, 03 Mar 2021 16:04:09 +0200
Date:   Wed, 3 Mar 2021 16:04:09 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: sc8180x: add ACPI probe support
Message-ID: <YD+XWQ8oDzDWfpjI@smile.fi.intel.com>
References: <20210303132622.4115-1-shawn.guo@linaro.org>
 <20210303132622.4115-3-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210303132622.4115-3-shawn.guo@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 03, 2021 at 09:26:22PM +0800, Shawn Guo wrote:
> It adds ACPI probe support with tile offsets passed over to msm core
> driver via sc8180x_tile_offsets, as TLMM is described a single memory
> region in ACPI DSDT.

> +#include <linux/acpi.h>

It's not used here.

property.h
mod_devicetable.h


-- 
With Best Regards,
Andy Shevchenko


