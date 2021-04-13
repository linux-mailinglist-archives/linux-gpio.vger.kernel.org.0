Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96D3335DD8F
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Apr 2021 13:14:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237361AbhDMLOt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Apr 2021 07:14:49 -0400
Received: from mga11.intel.com ([192.55.52.93]:27266 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237697AbhDMLOs (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 13 Apr 2021 07:14:48 -0400
IronPort-SDR: vQxWAXxSIgbVZVH2oTu2xRdtZmtVLdwsvivW+rxw+m6ljB34crYqg/bdd3rI6CebwwfkW7hDFj
 +kqdcmZSJLQA==
X-IronPort-AV: E=McAfee;i="6200,9189,9952"; a="191202522"
X-IronPort-AV: E=Sophos;i="5.82,219,1613462400"; 
   d="scan'208";a="191202522"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2021 04:14:29 -0700
IronPort-SDR: AxhDKi/U5SSsDVmgdciE0ZdxKu4gSARdxXxFVCRxafb/rKSECuhg/wk37H/GVh1S6IQ81N2ibu
 rtcjlRx1oNEQ==
X-IronPort-AV: E=Sophos;i="5.82,219,1613462400"; 
   d="scan'208";a="381937166"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2021 04:14:27 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1lWGzw-003k1g-Tj; Tue, 13 Apr 2021 14:14:24 +0300
Date:   Tue, 13 Apr 2021 14:14:24 +0300
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Yuanyuan Zhong <yzhong@purestorage.com>
Cc:     mika.westerberg@linux.intel.com, andy@kernel.org,
        linus.walleij@linaro.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] pinctrl: lewisburg: Update number of pins in community
Message-ID: <YHV9ENRnQPBJBQ9R@smile.fi.intel.com>
References: <20210412231759.15474-1-yzhong@purestorage.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210412231759.15474-1-yzhong@purestorage.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Apr 12, 2021 at 05:17:59PM -0600, Yuanyuan Zhong wrote:
> When updating pin names for Intel Lewisburg, the numbers of pins were
> left behind. Update them accordingly.

Applied, thanks!

> Fixes: e66ff71fd0db ("pinctrl: lewisburg: Update pin list according to v1.1v6")
> Signed-off-by: Yuanyuan Zhong <yzhong@purestorage.com>
> ---
>  drivers/pinctrl/intel/pinctrl-lewisburg.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-lewisburg.c b/drivers/pinctrl/intel/pinctrl-lewisburg.c
> index 7fdf4257df1e..ad4b446d588e 100644
> --- a/drivers/pinctrl/intel/pinctrl-lewisburg.c
> +++ b/drivers/pinctrl/intel/pinctrl-lewisburg.c
> @@ -299,9 +299,9 @@ static const struct pinctrl_pin_desc lbg_pins[] = {
>  static const struct intel_community lbg_communities[] = {
>  	LBG_COMMUNITY(0, 0, 71),
>  	LBG_COMMUNITY(1, 72, 132),
> -	LBG_COMMUNITY(3, 133, 144),
> -	LBG_COMMUNITY(4, 145, 180),
> -	LBG_COMMUNITY(5, 181, 246),
> +	LBG_COMMUNITY(3, 133, 143),
> +	LBG_COMMUNITY(4, 144, 178),
> +	LBG_COMMUNITY(5, 179, 246),
>  };
>  
>  static const struct intel_pinctrl_soc_data lbg_soc_data = {
> -- 
> 2.31.1
> 

-- 
With Best Regards,
Andy Shevchenko


