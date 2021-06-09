Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B5EA3A10E9
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jun 2021 12:49:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236557AbhFIKOK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Jun 2021 06:14:10 -0400
Received: from mga14.intel.com ([192.55.52.115]:55300 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238713AbhFIKOJ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 9 Jun 2021 06:14:09 -0400
IronPort-SDR: 7lmB7JYsx9n790P0+gUANRiW4jwaQjKn+3e0mNs2dEEPjgJeVko3JOgYGdizNPz0Wh5PLJY1wp
 1XFrAyRYthFA==
X-IronPort-AV: E=McAfee;i="6200,9189,10009"; a="204856276"
X-IronPort-AV: E=Sophos;i="5.83,260,1616482800"; 
   d="scan'208";a="204856276"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2021 03:12:15 -0700
IronPort-SDR: pey1hy4lWcbNXtApZ+gklHNM8u9X4ImYuAMexfsr9+hmL4C+xcRF/RKzUFwuoDxCB/0+SHwX12
 u8u/HZp9hq1w==
X-IronPort-AV: E=Sophos;i="5.83,260,1616482800"; 
   d="scan'208";a="402397538"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2021 03:12:12 -0700
Received: by lahna (sSMTP sendmail emulation); Wed, 09 Jun 2021 13:12:10 +0300
Date:   Wed, 9 Jun 2021 13:12:10 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Henning Schild <henning.schild@siemens.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: intel: fix NULL pointer deref
Message-ID: <YMCT+izizEg0gPLD@lahna.fi.intel.com>
References: <20210609062722.9132-1-henning.schild@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210609062722.9132-1-henning.schild@siemens.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Wed, Jun 09, 2021 at 08:27:22AM +0200, Henning Schild wrote:
> match could be NULL in which case we do not go ACPI after all
> 
> Signed-off-by: Henning Schild <henning.schild@siemens.com>
> ---
>  drivers/pinctrl/intel/pinctrl-intel.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
> index 85750974d182..dca17bb76cac 100644
> --- a/drivers/pinctrl/intel/pinctrl-intel.c
> +++ b/drivers/pinctrl/intel/pinctrl-intel.c
> @@ -1601,12 +1601,12 @@ const struct intel_pinctrl_soc_data *intel_pinctrl_get_soc_data(struct platform_
>  	const struct intel_pinctrl_soc_data *data = NULL;
>  	const struct intel_pinctrl_soc_data **table;
>  	struct acpi_device *adev;
> +	const void *match;
>  	unsigned int i;
>  
>  	adev = ACPI_COMPANION(&pdev->dev);
> -	if (adev) {
> -		const void *match = device_get_match_data(&pdev->dev);
> -
> +	match = device_get_match_data(&pdev->dev);

Actually we don't even call intel_pinctrl_get_soc_data() if the ACPI ID
is not listed in the corresponding driver's module table. So I don't
think match can ever be NULL.

But feel free to prove me wrong ;-)
