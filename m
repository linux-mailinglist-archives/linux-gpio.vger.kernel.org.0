Return-Path: <linux-gpio+bounces-17775-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AF3A689D3
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Mar 2025 11:40:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F4193ABE52
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Mar 2025 10:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A2D6253B77;
	Wed, 19 Mar 2025 10:40:44 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4DE1E1E0C;
	Wed, 19 Mar 2025 10:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742380844; cv=none; b=efO6xz8XAV2fN+6/Mk6upy5MDOi7BJVnEj/S4mymn2tGdqutzOyqoKXI3a1JO8Ee7TUFC4EVyp8gMG5sOekj9cgrEZkLD3vpSyXL2HOptO5oY1GSnxocLEFGSSpcB3B9fHTOcc9haWIAQ+gl6/W0YbJBFz9atRwzYySx7yLl2lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742380844; c=relaxed/simple;
	bh=uObWPt43675T4/hkotoHP5rdwTWDPTosPToJ92tdbYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hb3Rka9tnjSSLmNe9kHHwHSofBdONbEoaztJELrPNYqxCE9hUxkfeem9oMeSpWcyyKJkJShhN2IyQwvMSUIGBph+EKIRpHNjIdiCAS5svi4YciuQ7g6QovB92giFFsarLE2fiHpeoNvSFo7XMsf8eUIbz8lAtuwFbxH/g/bhFCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: ytC4NU0vSG6AGseKX3xzVA==
X-CSE-MsgGUID: vA6MwdYnSRKk8vwZXE0uQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="47341135"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="47341135"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2025 03:40:42 -0700
X-CSE-ConnectionGUID: /eAtXWszTsG+BSXJiv0R2A==
X-CSE-MsgGUID: IwvCrmIlTRGfXcth2gHWnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="122733164"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2025 03:40:37 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1tuqqg-00000003tMw-0qcG;
	Wed, 19 Mar 2025 12:40:34 +0200
Date: Wed, 19 Mar 2025 12:40:33 +0200
From: Andy Shevchenko <andy@kernel.org>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: tglx@linutronix.de, maz@kernel.org, linux-kernel@vger.kernel.org,
	Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Keerthy <j-keerthy@ti.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Heiko Stuebner <heiko@sntech.de>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 17/57] irqdomain: gpio: Switch to irq_domain_create_*()
Message-ID: <Z9qfIQ2TEhkgLT2Q@smile.fi.intel.com>
References: <20250319092951.37667-1-jirislaby@kernel.org>
 <20250319092951.37667-18-jirislaby@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319092951.37667-18-jirislaby@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Mar 19, 2025 at 10:29:10AM +0100, Jiri Slaby (SUSE) wrote:
> irq_domain_add_*() interfaces are going away as being obsolete now.
> Switch to the preferred irq_domain_create_*() ones. Those differ in the
> node parameter: They take more generic struct fwnode_handle instead of
> struct device_node. Therefore, of_fwnode_handle() is added around the
> original parameter.
> 
> Note some of the users can likely use dev->fwnode directly instead of
> indirect of_fwnode_handle(dev->of_node). But dev->fwnode is not
> guaranteed to be set for all, so this has to be investigated on case to
> case basis (by people who can actually test with the HW).

...

>  	/**
>  	 * @first:
>  	 *
> -	 * Required for static IRQ allocation. If set, irq_domain_add_simple()

> -	 * will allocate and map all IRQs during initialization.

Can we leave this untouched? The new name will make the string 81 characters
long and I don't think we care about that, on the pros side it will reduce
a churn in this patch.

> +	 * Required for static IRQ allocation. If set,
> +	 * irq_domain_create_simple() will allocate and map all IRQs
> +	 * during initialization.
>  	 */

-- 
With Best Regards,
Andy Shevchenko



