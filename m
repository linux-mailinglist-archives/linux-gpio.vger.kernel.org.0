Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 788B1BC3FC
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Sep 2019 10:21:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394886AbfIXIVr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Sep 2019 04:21:47 -0400
Received: from mga14.intel.com ([192.55.52.115]:40717 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388712AbfIXIVr (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 24 Sep 2019 04:21:47 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Sep 2019 01:21:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,543,1559545200"; 
   d="scan'208";a="193379870"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga006.jf.intel.com with ESMTP; 24 Sep 2019 01:21:44 -0700
Received: from andy by smile with local (Exim 4.92.1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1iCg4t-0006p5-At; Tue, 24 Sep 2019 11:21:43 +0300
Date:   Tue, 24 Sep 2019 11:21:43 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Alex Levin <levinale@chromium.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: cherryview: restore Strago DMI workaround for
 all versions
Message-ID: <20190924082143.GS2680@smile.fi.intel.com>
References: <20190924024958.GA229906@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190924024958.GA229906@dtor-ws>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 23, 2019 at 07:49:58PM -0700, Dmitry Torokhov wrote:
> This is essentially a revert of:
> 
> e3f72b749da2 pinctrl: cherryview: fix Strago DMI workaround
> 86c5dd6860a6 pinctrl: cherryview: limit Strago DMI workarounds to version 1.0
> 
> because even with 1.1 versions of BIOS there are some pins that are
> configured as interrupts but not claimed by any driver, and they
> sometimes fire up and result in interrupt storms that cause touchpad
> stop functioning and other issues.
> 
> Given that we are unlikely to qualify another firmware version for a
> while it is better to keep the workaround active on all Strago boards.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> 
> Reported-by: Alex Levin <levinale@chromium.org>
> Fixes: 86c5dd6860a6 ("pinctrl: cherryview: limit Strago DMI workarounds to version 1.0")
> Cc: stable@vger.kernel.org
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/pinctrl/intel/pinctrl-cherryview.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
> index 03ec7a5d9d0b..bf049d1bbb87 100644
> --- a/drivers/pinctrl/intel/pinctrl-cherryview.c
> +++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
> @@ -1513,7 +1513,6 @@ static const struct dmi_system_id chv_no_valid_mask[] = {
>  		.matches = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "GOOGLE"),
>  			DMI_MATCH(DMI_PRODUCT_FAMILY, "Intel_Strago"),
> -			DMI_MATCH(DMI_PRODUCT_VERSION, "1.0"),
>  		},
>  	},
>  	{
> @@ -1521,7 +1520,6 @@ static const struct dmi_system_id chv_no_valid_mask[] = {
>  		.matches = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "HP"),
>  			DMI_MATCH(DMI_PRODUCT_NAME, "Setzer"),
> -			DMI_MATCH(DMI_PRODUCT_VERSION, "1.0"),
>  		},
>  	},
>  	{
> @@ -1529,7 +1527,6 @@ static const struct dmi_system_id chv_no_valid_mask[] = {
>  		.matches = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "GOOGLE"),
>  			DMI_MATCH(DMI_PRODUCT_NAME, "Cyan"),
> -			DMI_MATCH(DMI_PRODUCT_VERSION, "1.0"),
>  		},
>  	},
>  	{
> @@ -1537,7 +1534,6 @@ static const struct dmi_system_id chv_no_valid_mask[] = {
>  		.matches = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "GOOGLE"),
>  			DMI_MATCH(DMI_PRODUCT_NAME, "Celes"),
> -			DMI_MATCH(DMI_PRODUCT_VERSION, "1.0"),
>  		},
>  	},
>  	{}
> -- 
> 2.23.0.351.gc4317032e6-goog
> 
> 
> -- 
> Dmitry

-- 
With Best Regards,
Andy Shevchenko


