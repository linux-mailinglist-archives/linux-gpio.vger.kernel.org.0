Return-Path: <linux-gpio+bounces-28650-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6631FC692C6
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 12:47:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 17DD42AADF
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 11:47:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42089339B43;
	Tue, 18 Nov 2025 11:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WNSPZLtm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40D0336EFB;
	Tue, 18 Nov 2025 11:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763466456; cv=none; b=ip3CrLXjpzsgoZhK7wFsG1QDK/FRRyhTzHZMDpnzJSND6I9b+8pZFn2RYZSI/7VZi2+LhFs15unaM13aSR69ZmdKUF66ZOu6m111h3kNfjF3tkCmdHDDuNcSdG5UgLa8Yv70mq6HY+0ZWM8qd64VaE2Xhj4rdiXphOY7TryQ4z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763466456; c=relaxed/simple;
	bh=dWC5QTAum309pmYNtjbFaR64ymVnbCGgyLsPU+EbDFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bdTDB79s7S2USMZv8ixK8qWyhpvk/HmCz2gNnxkJnhCpC9uVPEmU0Z6AC2sEjhS//vcmTpxYitw/5QJ+8IZAlu+oTVlvMFLwRDOqc8zT7OJ6/vnxy1Y8yOwIxL1LJzm8EkaiUWAZ5VYgvM9IbxiSTCGTvspBulU83CNvxHABm4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WNSPZLtm; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763466454; x=1795002454;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dWC5QTAum309pmYNtjbFaR64ymVnbCGgyLsPU+EbDFw=;
  b=WNSPZLtmydK9JUh2jln+O41l9eVmt7c3VwtGrzdmbpvPpZdGlcYMwRN2
   onhRhtMQTnHaLnsUSSyjEOf9Ee/LAtEVECenCCe2ZxYvOfCQcFU/CWK6v
   1she591fPVR8N0JeEpHVKpUSEY2G3mdP7TA2Lm7cGhBtJHCjjckTcRUXB
   A8DLRgfLeKSM8NBf8+GwMv93ewIWcGSAzNIEu7m33YuooR3rf6qF/5pqH
   9da0maiUBnAkMfPKkA2Slne73UbmAvGQcq9TVFmXwqSzXK636UpVE9us3
   IVDLZ9P4A9Td+Tumk8UYEbJkcV8wBWhrTQvsZh30pOPGu4GpZm2EJTWnh
   A==;
X-CSE-ConnectionGUID: CC5bHpDYTd6fToMLFSAztg==
X-CSE-MsgGUID: KZMWe5kwSp2NLeZ82iSiJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="76163734"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="76163734"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 03:47:33 -0800
X-CSE-ConnectionGUID: Eh9mPQhKQuK2UF4Qaz16wQ==
X-CSE-MsgGUID: SN6iJwDrQEmCRFDeF6N5/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="190764510"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 18 Nov 2025 03:47:31 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 9DA2496; Tue, 18 Nov 2025 12:47:30 +0100 (CET)
Date: Tue, 18 Nov 2025 12:47:30 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 2/3] pinctrl: intel: Export intel_gpio_add_pin_ranges()
Message-ID: <20251118114730.GG2912318@black.igk.intel.com>
References: <20251117075826.3332299-1-andriy.shevchenko@linux.intel.com>
 <20251117075826.3332299-3-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251117075826.3332299-3-andriy.shevchenko@linux.intel.com>

On Mon, Nov 17, 2025 at 08:57:00AM +0100, Andy Shevchenko wrote:
> Export intel_gpio_add_pin_ranges() for reuse in other drivers.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/pinctrl/intel/pinctrl-intel.c | 3 ++-
>  drivers/pinctrl/intel/pinctrl-intel.h | 2 ++
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
> index a8b80a24e81f..2424b1bcc322 100644
> --- a/drivers/pinctrl/intel/pinctrl-intel.c
> +++ b/drivers/pinctrl/intel/pinctrl-intel.c
> @@ -1345,7 +1345,7 @@ static int intel_gpio_irq_init_hw(struct gpio_chip *gc)
>  	return 0;
>  }
>  
> -static int intel_gpio_add_pin_ranges(struct gpio_chip *gc)

As this is now exported, can you add kernel-doc too?

> +int intel_gpio_add_pin_ranges(struct gpio_chip *gc)
>  {
>  	struct intel_pinctrl *pctrl = gpiochip_get_data(gc);
>  	struct device *dev = pctrl->dev;
> @@ -1361,6 +1361,7 @@ static int intel_gpio_add_pin_ranges(struct gpio_chip *gc)
>  
>  	return 0;
>  }
> +EXPORT_SYMBOL_NS_GPL(intel_gpio_add_pin_ranges, "PINCTRL_INTEL");
>  
>  static unsigned int intel_gpio_ngpio(const struct intel_pinctrl *pctrl)
>  {
> diff --git a/drivers/pinctrl/intel/pinctrl-intel.h b/drivers/pinctrl/intel/pinctrl-intel.h
> index 654af5977603..545bed9fb96c 100644
> --- a/drivers/pinctrl/intel/pinctrl-intel.h
> +++ b/drivers/pinctrl/intel/pinctrl-intel.h
> @@ -273,6 +273,8 @@ int intel_pinctrl_probe_by_uid(struct platform_device *pdev);
>  
>  extern const struct dev_pm_ops intel_pinctrl_pm_ops;
>  
> +int intel_gpio_add_pin_ranges(struct gpio_chip *gc);
> +

Can you move this down a bit, above intel_get_groups_count()?

>  const struct intel_community *intel_get_community(const struct intel_pinctrl *pctrl,
>  						  unsigned int pin);
>  
> -- 
> 2.50.1

