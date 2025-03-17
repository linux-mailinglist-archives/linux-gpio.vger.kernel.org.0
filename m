Return-Path: <linux-gpio+bounces-17705-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2465BA65A8A
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Mar 2025 18:22:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9C08885EB3
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Mar 2025 17:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF1B4202C48;
	Mon, 17 Mar 2025 17:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XhnrXpsO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3756E1FFC48;
	Mon, 17 Mar 2025 17:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742231619; cv=none; b=dh/q1esSGioPN6osEWjh9dPsdA8+mw8ujIY9yHi3KHwDJAcPzXDwj1OBj8nXWKdZpU9msE8T1RDC0jQUVGYDrXSHF3ZVCLOlpiNGIBMIFGZwbXY/e0njAuRuA+qVljbiYWu7pJHjapb6F3L3BZRiK02vVebnD/q8ulkpL16XlDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742231619; c=relaxed/simple;
	bh=Bpas9khNOZhuXSrWH8wA3+xQCgFSGtO/L32BeKe7MV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dn3gVMadnxefGFY/+Mr85z5UnmV4/ggIwyX75GcoMBfW/dgAanziSFE6u4njkoaVQO1XweJQtCfGqTitdcfQqE6zPjZNU3i7sCcWCy4qcXM8r+Z/LhvMNJSCCIGk6Jx61MWUwQoPk2tr+wfrmzibjihMCPNXmf/Isv514ge6Mrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XhnrXpsO; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742231618; x=1773767618;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Bpas9khNOZhuXSrWH8wA3+xQCgFSGtO/L32BeKe7MV4=;
  b=XhnrXpsOS9mZsQ6rifb5SeQyUxo3AjmYJkTMPbr5+pNSwxbaKO10bQLu
   lVzSPwHa4HqRp05iLMIdkapSfQNvYaqCrCRNjN4fG2JnJK3j8K9NnZdxU
   hGqWiAQEAyVxHpH9xVGbb0QMW8YOkWjQPeK+fknPJy4OlRUsuUI5NPkZT
   y4Gx2V12XvPz8/ar2Klwp4dAC+sXzwKYLpMGZMzQ1CAJosanVlZGAoyGO
   NStxnytaCXYSsJ4938CEpkFcDxqyNFrqLPprNT0Vc9Y3i40xIi/AwWa4b
   7Amt0aLXHrHr3ZSFLlpt2sYJSKD9JvxgNaka0DZ6G4H22cg2p/dt6TaQ8
   A==;
X-CSE-ConnectionGUID: y8fV/fwMQcGTOVsw7DsoCg==
X-CSE-MsgGUID: vh+Io3p5S8izVZpdn5wwRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="54722519"
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; 
   d="scan'208";a="54722519"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 10:13:37 -0700
X-CSE-ConnectionGUID: 4gwrpRceSgmhf+hDMsCapQ==
X-CSE-MsgGUID: kfaisGJjQmOsDl4sioM3Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; 
   d="scan'208";a="122499998"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 10:13:35 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tuE1s-00000003MrH-1s38;
	Mon, 17 Mar 2025 19:13:32 +0200
Date: Mon, 17 Mar 2025 19:13:32 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu,
	GaryWang@aaeon.com.tw
Subject: Re: [PATCH RFC v2 4/6] gpio: aggregator: handle runtime registration
 of gpio_desc in gpiochip_fwd
Message-ID: <Z9hYPHmFYEeeCTZ5@smile.fi.intel.com>
References: <20250317-aaeon-up-board-pinctrl-support-v2-0-36126e30aa62@bootlin.com>
 <20250317-aaeon-up-board-pinctrl-support-v2-4-36126e30aa62@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250317-aaeon-up-board-pinctrl-support-v2-4-36126e30aa62@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Mar 17, 2025 at 04:38:02PM +0100, Thomas Richard wrote:
> Add request() callback to check if the GPIO descriptor was well registered
> in the gpiochip_fwd before to use it. This is done to handle the case
> where GPIO descriptor is added at runtime in the forwarder.
> 
> If at least one GPIO descriptor was not added before the forwarder
> registration, we assume the forwarder can sleep as if a GPIO is added at
> runtime it may sleep.

Hmm... This should rather be reformatted each time a new descriptor is added,
no?

...

> +int gpio_fwd_request(struct gpio_chip *chip, unsigned int offset)
> +{
> +	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
> +
> +	return fwd->descs[offset] ? 0 : -ENXIO;

Why was this error code chosen?

> +}

...

>  	struct gpio_chip *chip = &fwd->chip;
>  	struct device *dev = fwd->dev;
> -	int error;
> +	int ndescs = 0;
> +	int error, i;

The new added variables are signed. Why?

-- 
With Best Regards,
Andy Shevchenko



