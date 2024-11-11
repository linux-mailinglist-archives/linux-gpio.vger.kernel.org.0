Return-Path: <linux-gpio+bounces-12816-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 679649C3B50
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Nov 2024 10:48:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C9F37B239F1
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Nov 2024 09:48:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F28F1552EB;
	Mon, 11 Nov 2024 09:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RTaG739c"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E8D13BAD5;
	Mon, 11 Nov 2024 09:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731318507; cv=none; b=SC8zmTmRZlusEqNvozIsDFoR3uanHVncAXs1yc9s2WhzLvGjEbMqHMNmGSxyUmGeeGPZsWYO/UuXwVNJFKFy9K0GVA0FwcGD96pmI0OePqEVKkVwse7z2QmVs+HSeyhW8XamKg7+VVHe6r/acSDzxUQ8CQzrMSjHIJ1TrivYklk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731318507; c=relaxed/simple;
	bh=dnK1S3CmbMpjkJBTDuGbtVP12MBQ7Sg1Q3hSdde0Z1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XeaAzWaS3R4Loq2E4OSKhkZcOraE/01iWtHI345xpMpim72bH1S6W4Yje9Wud57U1ZEJZZ1Hj7SsoDUprCpO9t1A5r0cOLxzkTDXSQX9b4wu8o7MJk2jqZUy3/jNE1BDecQ2xXrn5NcqUEQwsZnfgk1y8V4sl7jpRi55gYA4D54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RTaG739c; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731318506; x=1762854506;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dnK1S3CmbMpjkJBTDuGbtVP12MBQ7Sg1Q3hSdde0Z1g=;
  b=RTaG739c43y+MjFhJqmfWCwrVgUZHiIF771qG+eyY/DBP/SxU4m5xz43
   lP/Nf6WJckoxaR60n08Ve5XCGdROGkhgl/S8LqFmcM3AG95j7QN1FsLTs
   6KE6qE6aDmyIsZDgwAGkp5eNR7ejSgHdFOyWomeoT8iw+gF3hyLY3YxqY
   46F5DqUqAZvhwu9e70JQ4iLZsv/H4v3W93qUDJLBfuxygMVSj/OVCYSkD
   KxOzv7Gm4o69SI0lHAot1FyrCGh1eJTphjjFonZnyjagSgC8eFfSxdU6G
   9t7RnOhhuYBa9lol3dzlmy9OTE5dkzDVS8SmA/oEBvFJ6om5QXqkCIR5G
   w==;
X-CSE-ConnectionGUID: uwjDVg4CSvKtVnJF56QcnA==
X-CSE-MsgGUID: DQ31+EEZSSirfBYbjf/hmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11252"; a="34906285"
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="34906285"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 01:48:25 -0800
X-CSE-ConnectionGUID: 756tk182QPiWIKEOWj5bsA==
X-CSE-MsgGUID: 3wm7aZiKT/CJRbT4dpICAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="110092576"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 01:48:22 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tAR1v-0000000DY1B-0fJq;
	Mon, 11 Nov 2024 11:48:19 +0200
Date: Mon, 11 Nov 2024 11:48:18 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, heiko@sntech.de,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	mika.westerberg@linux.intel.com, tao.huang@rock-chips.com,
	finley.xiao@rock-chips.com, tim.chen@rock-chips.com,
	elaine.zhang@rock-chips.com
Subject: Re: [PATCH v4 2/4] gpio: rockchip: change the GPIO version judgment
 logic
Message-ID: <ZzHS4uMpP8qF9F3e@smile.fi.intel.com>
References: <20241111023412.3466161-1-ye.zhang@rock-chips.com>
 <20241111023412.3466161-3-ye.zhang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241111023412.3466161-3-ye.zhang@rock-chips.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Nov 11, 2024 at 10:34:10AM +0800, Ye Zhang wrote:
> Have a list of valid IDs and default to -ENODEV.

...

> -	/* If not gpio v2, that is default to v1. */
> -	if (id == GPIO_TYPE_V2 || id == GPIO_TYPE_V2_1) {
> +	switch (id) {
> +	case GPIO_TYPE_V1:

If you leave the V2 case first...

> +		bank->gpio_regs = &gpio_regs_v1;
> +		bank->gpio_type = GPIO_TYPE_V1;
> +		break;
> +	case GPIO_TYPE_V2:
> +	case GPIO_TYPE_V2_1:

...and the v1 case last, the whole diff will be much more understandable and
reviewable.

>  		bank->gpio_regs = &gpio_regs_v2;
>  		bank->gpio_type = GPIO_TYPE_V2;
>  		bank->db_clk = of_clk_get(bank->of_node, 1);
> @@ -677,9 +682,10 @@ static int rockchip_get_bank_data(struct rockchip_pin_bank *bank)
>  			clk_disable_unprepare(bank->clk);
>  			return -EINVAL;
>  		}
> -	} else {
> -		bank->gpio_regs = &gpio_regs_v1;
> -		bank->gpio_type = GPIO_TYPE_V1;
> +		break;
> +	default:
> +		dev_err(bank->dev, "cannot get the version ID\n");
> +		return -ENODEV;
>  	}

-- 
With Best Regards,
Andy Shevchenko



