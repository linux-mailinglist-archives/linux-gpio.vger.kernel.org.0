Return-Path: <linux-gpio+bounces-9680-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D89C196A396
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 18:05:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 65EB5B26FE8
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 16:05:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DB4E189526;
	Tue,  3 Sep 2024 16:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iYVHZ9XT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8047462;
	Tue,  3 Sep 2024 16:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725379534; cv=none; b=fCyxY8Vgj5rYwQf6vRxHutAqpeSKloOF1vr9HvsUJG2qyZIIbGIEx1pF0uq1xeCPs5TgeeeYhGrt+j3nqAmuPBmXND/JbLNZUjjpr6S2Db0/zMlloNG0kgInLEmL2Bw6DJNG1ywHTRki2sS+if7LMm9LWgKu7Q66zkC7jbn+Y8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725379534; c=relaxed/simple;
	bh=JHv20sPeSrhPSLL+jYVyMfFLG+chzXIHdmnI9Hk2T/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fM5mHiRDjxcYPGJ008KQWfBg0qGTw65A8G5bUiPKSp9XPTzPAzrsEUH9ls0gEI5OUl33xtOQWBQXCuhhxoYHP7dU11kLq6FqlsGd2nV9ERiXmOjohcJZdAFYm0nNe/Iu2/u6NhDHF1hyEqMVsjhduMVodxfPsWTeTxNjQavbKEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iYVHZ9XT; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725379533; x=1756915533;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JHv20sPeSrhPSLL+jYVyMfFLG+chzXIHdmnI9Hk2T/M=;
  b=iYVHZ9XTYB8lltDBlUeLB0D6NnG4GCxyFBSNTuR288pCdtrcsaI8XsRk
   K6qsPuzFW1k6mhhKkCh98r4ZxRiuS2qndLgzrAeH6pFOjUr0xeplF6LMG
   y4VjL5oApJHdh6ame7m0IH1FgspyPddlOZB3j/xBATJSZGmcvPrfMl6fl
   szfI90XyF8gQsrIW3sE5Gf/UPJyCClRMm820/QV+Zy9ioteQpcSOkNxS2
   Cx2w1tSttFdZtzo/irtkA8o5E8mAFljUq4rrMIrta2M0nXkX+TfjlHMHH
   /IWzlLbzermWJJPjnUDA0BOXrIsl9Kt7p+mSiPYEEKnQt02SiSN2X4fL2
   g==;
X-CSE-ConnectionGUID: 5Sf6DstHSR+rFb1tTrHT5A==
X-CSE-MsgGUID: Uh9RCvVaSByPFsVpdYF1zQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="34558996"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="34558996"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 09:05:33 -0700
X-CSE-ConnectionGUID: /Wyly19aRm2ltpGETJZ8Lg==
X-CSE-MsgGUID: wCSx5JsJRMSA7hJYjnnoKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="69110624"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 09:05:30 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1slW22-00000004lMM-3zj4;
	Tue, 03 Sep 2024 19:05:26 +0300
Date: Tue, 3 Sep 2024 19:05:26 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, heiko@sntech.de,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	mika.westerberg@linux.intel.com, tao.huang@rock-chips.com,
	finley.xiao@rock-chips.com, tim.chen@rock-chips.com,
	elaine.zhang@rock-chips.com
Subject: Re: [PATCH v3 09/12] gpio: rockchip: change the GPIO version
 judgment logic
Message-ID: <ZtczxlCJLD3lkrkE@smile.fi.intel.com>
References: <20240903073649.237362-1-ye.zhang@rock-chips.com>
 <20240903073649.237362-10-ye.zhang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240903073649.237362-10-ye.zhang@rock-chips.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Sep 03, 2024 at 03:36:46PM +0800, Ye Zhang wrote:
> Have a list of valid V1 IDs and default to -ENODEV.

s/V1//

...

>  	id = readl(bank->reg_base + gpio_regs_v2.version_id);

>  

You may remove this blank line now...

> -	/* If not gpio v2, that is default to v1. */
> -	if (id == GPIO_TYPE_V2 || id == GPIO_TYPE_V2_1) {
> -		bank->gpio_regs = &gpio_regs_v2;
> -		bank->gpio_type = GPIO_TYPE_V2;
> -	} else {
> +	/* The GPIO version ID is incrementing. */
> +	switch (id) {

...basically to have

	/* The GPIO version ID is incrementing. */
	id = readl(bank->reg_base + gpio_regs_v2.version_id);
	switch (id) {

> +	case GPIO_TYPE_V1:
>  		bank->gpio_regs = &gpio_regs_v1;
>  		bank->gpio_type = GPIO_TYPE_V1;
> +		break;
> +	case GPIO_TYPE_V2:
> +	case GPIO_TYPE_V2_1:
> +		bank->gpio_regs = &gpio_regs_v2;
> +		bank->gpio_type = GPIO_TYPE_V2;
> +		break;
> +	default:
> +		dev_err(bank->dev, "cannot get the version ID\n");
> +		return -ENODEV;
>  	}

-- 
With Best Regards,
Andy Shevchenko



