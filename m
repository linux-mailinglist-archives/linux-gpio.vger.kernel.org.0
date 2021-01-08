Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94E8A2EEDB4
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jan 2021 08:08:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727075AbhAHHIF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jan 2021 02:08:05 -0500
Received: from mga14.intel.com ([192.55.52.115]:38339 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727016AbhAHHIF (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 8 Jan 2021 02:08:05 -0500
IronPort-SDR: sRAJtt0t0Rue5ejGbfIQeIM//67AUBagEaqBH0dqrjM2rtG3F4gbF2ebWkAodEfgkfR2+nlPn0
 6llxly9ng3Kw==
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="176777655"
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; 
   d="scan'208";a="176777655"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 23:05:58 -0800
IronPort-SDR: dOrsVDQVQrFHUnJJbmY4kb48v3iALNVRk+I+ezxVwU9leDkDlkr+WjytDiWCMnIsw6wGTRU95M
 SiTB/5ZH1yIw==
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; 
   d="scan'208";a="422860087"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 23:05:56 -0800
Received: by lahna (sSMTP sendmail emulation); Fri, 08 Jan 2021 09:05:51 +0200
Date:   Fri, 8 Jan 2021 09:05:51 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 3/4] pinctrl: intel: Convert revision conditional to
 switch-case
Message-ID: <20210108070551.GW968855@lahna.fi.intel.com>
References: <20210107190200.41221-1-andriy.shevchenko@linux.intel.com>
 <20210107190200.41221-3-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210107190200.41221-3-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jan 07, 2021 at 09:01:59PM +0200, Andy Shevchenko wrote:
> switch-case is slightly better to maintain in case some new features will come
> in new revisions of the hardware.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/pinctrl/intel/pinctrl-intel.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
> index 1a479112ed85..00979acb0203 100644
> --- a/drivers/pinctrl/intel/pinctrl-intel.c
> +++ b/drivers/pinctrl/intel/pinctrl-intel.c
> @@ -1483,9 +1483,13 @@ static int intel_pinctrl_probe(struct platform_device *pdev,
>  
>  		/* Determine community features based on the revision */
>  		value = readl(regs + REVID);
> -		if (((value & REVID_MASK) >> REVID_SHIFT) >= 0x94) {
> +		switch ((value & REVID_MASK) >> REVID_SHIFT) {
> +		case 0x0094 ... 0xffff:
>  			community->features |= PINCTRL_FEATURE_DEBOUNCE;
>  			community->features |= PINCTRL_FEATURE_1K_PD;
> +			break;
> +		default:
> +			break;

This adds 4 new lines and I don't think it improves anything so I
suggest we leave it as is for now. Once we have hardware that actually
implements some new features we can reconsider something like this.
