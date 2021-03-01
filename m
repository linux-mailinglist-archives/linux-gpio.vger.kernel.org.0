Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A654D328107
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Mar 2021 15:35:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236397AbhCAOfX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Mar 2021 09:35:23 -0500
Received: from mga09.intel.com ([134.134.136.24]:38085 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236445AbhCAOfP (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 1 Mar 2021 09:35:15 -0500
IronPort-SDR: 6l3h96A23yDAtG6NpF4z818YQuKjhmYjOBwIc3qDEgRm/b455qNo5Lw+Xra9NyzZHCmaMf+p9y
 mQ0hruh2yu3A==
X-IronPort-AV: E=McAfee;i="6000,8403,9909"; a="186594661"
X-IronPort-AV: E=Sophos;i="5.81,215,1610438400"; 
   d="scan'208";a="186594661"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2021 06:34:34 -0800
IronPort-SDR: RoQ1I3Al4b2qDTE0xaUFyml0oh/+To1HDFYJLYCdK4SSYya8Ezxv5D6jhSIPj5z/1BlINXptDE
 gdksxnNDmq7Q==
X-IronPort-AV: E=Sophos;i="5.81,215,1610438400"; 
   d="scan'208";a="397748768"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2021 06:34:33 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1lGjd0-0099zS-Qm; Mon, 01 Mar 2021 16:34:30 +0200
Date:   Mon, 1 Mar 2021 16:34:30 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/2] pinctrl: qcom: handle tiles for ACPI boot
Message-ID: <YDz7dko8kmg5mOqa@smile.fi.intel.com>
References: <20210301014329.30104-1-shawn.guo@linaro.org>
 <20210301014329.30104-2-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210301014329.30104-2-shawn.guo@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 01, 2021 at 09:43:28AM +0800, Shawn Guo wrote:
> It's not always the case that DT and ACPI describe hardware resource in
> the same schema, even for a single platform.  For example, on SC8180X,
> DT uses the tiles schema while ACPI describe memory resource as a single
> region.  It patches msm_pinctrl_probe() function to map tiles regions
> only for DT.  While for ACPI, it maps the single memory resource and
> calculate tile bases with offsets passed from SoC data.

...

> +#include <linux/acpi.h>

No use of this header. See below.
(Perhaps you meant mod_devicetable.h)

...

> -	if (soc_data->tiles) {
> +	if (soc_data->tiles && !has_acpi_companion(&pdev->dev)) {

Any documentation to understand this change?

...

> +		if (soc_data->tiles) {
> +			for (i = 0; i < soc_data->ntiles; i++)
> +				pctrl->regs[i] = base +
> +						 soc_data->tile_offsets[i];
> +		} else {
> +			pctrl->regs[0] = base;
> +		}

And so this?

-- 
With Best Regards,
Andy Shevchenko


