Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AC3248447A
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jan 2022 16:26:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233471AbiADP0R (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Jan 2022 10:26:17 -0500
Received: from mga01.intel.com ([192.55.52.88]:43961 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232085AbiADP0R (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 4 Jan 2022 10:26:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641309977; x=1672845977;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uC1jHFOtBT2P5BL2PLqo0Ki+CPPKnchFx1+GRMNeyGM=;
  b=A5i6gO53u7gruZXYLXWIoG03I3K2fcFmJxgQy1WR0ustfbF7MELJL4O/
   qiUO+N4xF2vteCDdncJHJ+06QL4Nqf+jdPdDL2vjN8W3yXtTaPZMumgnw
   FQsR+hKZCYHt2f0mwoeVSvBbaEHsLnIc20SbybxPKMmHzLvaxdSpV57Tm
   +ezBDdrEsm6OcDNklZpd2lXbCaubFcv962IpPIjX8U6lK7WQEYubypz4s
   VyXpR6O9v3m8TE8nqPX9LERNB5fRAxn+yqBO4Z2rCjQ7WVPAnfhCrgwtC
   BuHJ6joQTB3wUN2kLiQJe9mP7cnklBTCUJAwPmJglG+jxlrYBkEgrhRBd
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10216"; a="266509517"
X-IronPort-AV: E=Sophos;i="5.88,261,1635231600"; 
   d="scan'208";a="266509517"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2022 07:26:16 -0800
X-IronPort-AV: E=Sophos;i="5.88,261,1635231600"; 
   d="scan'208";a="556195913"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2022 07:26:13 -0800
Received: by lahna (sSMTP sendmail emulation); Tue, 04 Jan 2022 17:26:11 +0200
Date:   Tue, 4 Jan 2022 17:26:11 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-gpio@vger.kernel.org, Andy Shevchenko <andy@kernel.org>
Subject: Re: pinctrl-cherryview regression in linux-next on preproduction
 Braswell
Message-ID: <YdRnExZuPuvdfXgT@lahna>
References: <70004f1a-fef5-f6e9-6824-47eeb59f8014@linux.intel.com>
 <6d133b89-cc03-6308-6da7-dcea95a93a8c@redhat.com>
 <a8b6d8f1-ad8c-23ac-a85b-2c903530735f@linux.intel.com>
 <c29e98f5-c8e4-1967-a249-a461776488ad@redhat.com>
 <65271fd1-1c1c-f2ad-9b0f-60174e791eaa@linux.intel.com>
 <27a870e5-675a-564f-2bfe-ee913bdec0ac@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27a870e5-675a-564f-2bfe-ee913bdec0ac@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Tue, Jan 04, 2022 at 11:22:53AM +0100, Hans de Goede wrote:
> Andy, Mika, why don't we just mask out all IRQs at boot unconditionally:
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
> index 683b95e9639a..8981755a5d83 100644
> --- a/drivers/pinctrl/intel/pinctrl-cherryview.c
> +++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
> @@ -1552,19 +1552,10 @@ static int chv_gpio_irq_init_hw(struct gpio_chip *chip)
>  	const struct intel_community *community = &pctrl->communities[0];
>  
>  	/*
> -	 * The same set of machines in chv_no_valid_mask[] have incorrectly
> -	 * configured GPIOs that generate spurious interrupts so we use
> -	 * this same list to apply another quirk for them.
> -	 *
> -	 * See also https://bugzilla.kernel.org/show_bug.cgi?id=197953.
> +	 * Start with all normal interrupts in the community masked,
> +	 * but leave the ones that can only generate GPEs unmasked.
>  	 */
> -	if (!pctrl->chip.irq.init_valid_mask) {
> -		/*
> -		 * Mask all interrupts the community is able to generate
> -		 * but leave the ones that can only generate GPEs unmasked.
> -		 */
> -		chv_pctrl_writel(pctrl, CHV_INTMASK, GENMASK(31, community->nirqs));
> -	}
> +	chv_pctrl_writel(pctrl, CHV_INTMASK, GENMASK(31, community->nirqs));
>  
>  	/* Clear all interrupts */
>  	chv_pctrl_writel(pctrl, CHV_INTSTAT, 0xffff);
> 
> ?

IIRC masking them all broke some systems at the time. Unfortunately I
don't remember the details anymore :(
