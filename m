Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15B2332D37A
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 13:46:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231295AbhCDMpi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 07:45:38 -0500
Received: from mga04.intel.com ([192.55.52.120]:11045 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231380AbhCDMph (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 4 Mar 2021 07:45:37 -0500
IronPort-SDR: u7Idw7SmjT8ACY8yV6SQhV7ssOSdEEv48pEynvt6eNGOiDZ4k0MTnqhfgFn2TGFUUQ3LdQdXql
 pqrzUxhQS5DA==
X-IronPort-AV: E=McAfee;i="6000,8403,9912"; a="184995806"
X-IronPort-AV: E=Sophos;i="5.81,222,1610438400"; 
   d="scan'208";a="184995806"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 04:44:57 -0800
IronPort-SDR: PFS5WN15+/l7ZDnrtTZzkEM1ktnVDiTZU1rPDCCRiJItDwZuygi1rdPCi5EZUz9dfmk2rVbw9c
 E+QKv9TlF1yQ==
X-IronPort-AV: E=Sophos;i="5.81,222,1610438400"; 
   d="scan'208";a="507368416"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 04:44:55 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1lHnLZ-009sSy-9e; Thu, 04 Mar 2021 14:44:53 +0200
Date:   Thu, 4 Mar 2021 14:44:53 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 0/2] Add ACPI support for SC8180X pinctrl driver
Message-ID: <YEDWRXwAp7wouzFN@smile.fi.intel.com>
References: <20210304060520.24975-1-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210304060520.24975-1-shawn.guo@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 04, 2021 at 02:05:18PM +0800, Shawn Guo wrote:
> This is a couple of patches that enable ACPI probe for SC8180X pinctrl
> driver.  It takes pinctrl-sdm845 driver as the example to remove the
> use of tiles, so that we can align memory resource description between
> DT and ACPI, and simpfy the driver code.

Some minor comments, in any case, FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

Thanks!

> Changes for v3:
> - Remove the use of tiles.
> - Drop unneed include of <linux/acpi.h>.
> 
> Changes for v2:
> - Pass soc_data pointer via .driver_data.
> - Drop use of CONFIG_ACPI and ACPI_PTR().
> - Add comment for sc8180x_acpi_reserved_gpios[] terminator.
> - Add comments for tiles handling.
> 
> Shawn Guo (2):
>   pinctrl: qcom: sc8180x: drop the use of tiles
>   pinctrl: qcom: sc8180x: add ACPI probe support
> 
>  drivers/pinctrl/qcom/Kconfig           |  2 +-
>  drivers/pinctrl/qcom/pinctrl-sc8180x.c | 80 ++++++++++++++++----------
>  2 files changed, 52 insertions(+), 30 deletions(-)
> 
> -- 
> 2.17.1
> 

-- 
With Best Regards,
Andy Shevchenko


