Return-Path: <linux-gpio+bounces-16322-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26001A3DEA7
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 16:33:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6089716BDC4
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 15:31:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 332F51D6DC8;
	Thu, 20 Feb 2025 15:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bkXd8DgQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6871DE4C4;
	Thu, 20 Feb 2025 15:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740065415; cv=none; b=nBy1VFn2jNjXex1Gz8EujhrJP32zHDjmFiBFK/QVWQ39W1bcNG1vS1OyLJjzNpHHENQJt1j8L4zBkRCMFfe5CsEfd9RB/NpRYP9jNzb0VJ7ylAAf7HypvhR3YF5RUo88GiueFDfRpEAh9KYKVn4qFE8Mwvr5F4X3HqqAP0/VFfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740065415; c=relaxed/simple;
	bh=r/M/bPndAlP+GNlFaTADgHs3OA6x8a7RY+1cjmuo+W0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=swFDy/jZ7bRJfjnloxug2ToviMcAypykFK2fg6URXjOcuFTcAdLzrlu/kGEQrJuPeP4vuimd4WhvbZr+u2mm5iHONeur1WMqI3GznI0IXMv0QWbe6/YVeI7RIDRwmA0jnx8Ku0InzDY6SSk72ShugnCa/7tvwesFduY3pTY4+yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bkXd8DgQ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740065413; x=1771601413;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=r/M/bPndAlP+GNlFaTADgHs3OA6x8a7RY+1cjmuo+W0=;
  b=bkXd8DgQJJdz7Dca4ijNGTblrsHph7unIIxTapGCV+nVSNE3Ll8zvN8U
   PMh8P4Im7Yja7xXauNdStoafWWsZcu83xvkXWY1XQSBYIKv/FWIy+VgyQ
   wEYXVIE4FYBcuW8U4cV+GsQ/PuiOu6Kl6mqX9PiWw4JkHa1X205ivje7k
   kloNS9bj4ihT62P7cPMAV6NEDuFF+Z+MaajTumnNNItD4PqnqGnBWbORA
   PGR6KCOct/ZOgElIg2EifIr/Tqa/jgYs31Xaw1Erl2aoj7bu7LTyiYsyo
   QhuWUKwdLBTkb7oY2pOg8PetBbpw2s2ljxcuDiYH9ZO+JSQ8TpakReqeH
   w==;
X-CSE-ConnectionGUID: wIxpCY57Tp+TlVfcogkmtg==
X-CSE-MsgGUID: KRitf4w7QwK3M++tC/f8vA==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="40705935"
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; 
   d="scan'208";a="40705935"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 07:30:13 -0800
X-CSE-ConnectionGUID: g7I2XIQPTC64sXjXrpKBKA==
X-CSE-MsgGUID: k4xD1jSdRKulTt44LzFVjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; 
   d="scan'208";a="145924731"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 07:30:10 -0800
Date: Thu, 20 Feb 2025 17:30:07 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Zijun Hu <quic_zijuhu@quicinc.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v1 3/4] devres: Add devm_remove_action_optional() helper
Message-ID: <Z7dKfwOrAuhuZvQt@black.fi.intel.com>
References: <20250220141645.2694039-1-andriy.shevchenko@linux.intel.com>
 <20250220141645.2694039-4-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220141645.2694039-4-andriy.shevchenko@linux.intel.com>

On Thu, Feb 20, 2025 at 03:44:59PM +0200, Andy Shevchenko wrote:
> Add a new helper to remove an action that was added via devm_add_action()
> family of calls, but not warn in the cases where action wasn't found since
> it is optional and wasn't even added.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  include/linux/device/devres.h | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/include/linux/device/devres.h b/include/linux/device/devres.h
> index ae696d10faff..4daebbf7f227 100644
> --- a/include/linux/device/devres.h
> +++ b/include/linux/device/devres.h
> @@ -145,6 +145,19 @@ void devm_remove_action(struct device *dev, void (*action)(void *), void *data)
>  	WARN_ON(devm_remove_action_nowarn(dev, action, data));
>  }
>  
> +/* Same as devm_remove_action(), but doesn't WARN() if action wasn't added before */
> +static inline
> +void devm_remove_action_optional(struct device *dev, void (*action)(void *), void *data)
> +{
> +	int ret;
> +
> +	ret = devm_remove_action_nowarn(dev, action, data);
> +	if (ret == -ENOENT)
> +		return;
> +
> +	WARN_ON(ret);
> +}

Trying to wrap my head around this one, can't the user simply do

	if (devm_is_action_added())
		devm_remove_action/_nowarn();

Raag

