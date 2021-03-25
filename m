Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82E26349279
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Mar 2021 13:55:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230182AbhCYMyd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Mar 2021 08:54:33 -0400
Received: from mga17.intel.com ([192.55.52.151]:32934 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230377AbhCYMyR (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 25 Mar 2021 08:54:17 -0400
IronPort-SDR: Sx7xwz8KGMAlYuDKOd+DCtUxEW6VtALRBJ24th0Absde/zChsQzCRTIEknvtrjK31Qz0uWQ4PO
 teDr40wZrytQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9933"; a="170899352"
X-IronPort-AV: E=Sophos;i="5.81,277,1610438400"; 
   d="scan'208";a="170899352"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2021 05:54:17 -0700
IronPort-SDR: 0UZcZSDDN+4EZ6NdZE6wdeQVxlVSZPThBvSUsY1Z0jpTq41Ef7NW/naabCdg2U6qVoUzWm2rBJ
 jJr85sXM+nUA==
X-IronPort-AV: E=Sophos;i="5.81,277,1610438400"; 
   d="scan'208";a="375057264"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2021 05:54:15 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lPPV6-00G2tJ-5t; Thu, 25 Mar 2021 14:54:12 +0200
Date:   Thu, 25 Mar 2021 14:54:12 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Roger Pau Monne <roger.pau@citrix.com>
Cc:     linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3] intel/pinctrl: check REVID register value for device
 presence
Message-ID: <YFyH9Fk5d+289/f/@smile.fi.intel.com>
References: <20210325090947.73729-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210325090947.73729-1-roger.pau@citrix.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 25, 2021 at 10:09:47AM +0100, Roger Pau Monne wrote:
> Use the value read from the REVID register in order to check for the
> presence of the device. A read of all ones is treated as if the device
> is not present, and hence probing is ended.
> 
> This fixes an issue when running as a Xen PVH dom0, where the ACPI
> DSDT table is provided unmodified to dom0 and hence contains the
> pinctrl devices, but the MMIO region(s) containing the device
> registers might not be mapped in the guest physical memory map if such
> region(s) are not exposed on a PCI device BAR or marked as reserved in
> the host memory map.

Applied for fixes, thanks!

> 91d898e51e60 ('pinctrl: intel: Convert capability list to features')
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Changes since v2:
>  - Return ENODEV.
>  - Adjust code comment.
> 
> Changes since v1:
>  - New in this version.
> ---
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Cc: Andy Shevchenko <andy@kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> ---
>  drivers/pinctrl/intel/pinctrl-intel.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
> index 8085782cd8f9..9fc5bba514ea 100644
> --- a/drivers/pinctrl/intel/pinctrl-intel.c
> +++ b/drivers/pinctrl/intel/pinctrl-intel.c
> @@ -1491,8 +1491,13 @@ static int intel_pinctrl_probe(struct platform_device *pdev,
>  		if (IS_ERR(regs))
>  			return PTR_ERR(regs);
>  
> -		/* Determine community features based on the revision */
> +		/*
> +		 * Determine community features based on the revision.
> +		 * A value of all ones means the device is not present.
> +		 */
>  		value = readl(regs + REVID);
> +		if (value == ~0u)
> +			return -ENODEV;
>  		if (((value & REVID_MASK) >> REVID_SHIFT) >= 0x94) {
>  			community->features |= PINCTRL_FEATURE_DEBOUNCE;
>  			community->features |= PINCTRL_FEATURE_1K_PD;
> -- 
> 2.30.1
> 

-- 
With Best Regards,
Andy Shevchenko


