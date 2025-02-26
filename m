Return-Path: <linux-gpio+bounces-16633-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACB3A46299
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 15:25:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 170323B52FF
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 14:24:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4747D227EA0;
	Wed, 26 Feb 2025 14:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GrHNHGgL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7701227E84;
	Wed, 26 Feb 2025 14:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740579785; cv=none; b=dP8ZD4tFmehUeNkH+lJ6iB9E/yuO5bFCp7+QJ43Xu0URgT4eR32kiPGTWUSSWTxUCDh4AdVBsFN6N2m100wbi+gf6v9tslOOcvEx7TFm6MnXI8ay0ZYAc/WCS5yhCNGAvwO44HiP76cxbqM5oDfJVYxkuaSFn3Fc6A9/4TCJZ0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740579785; c=relaxed/simple;
	bh=OrOB40cYbVLCfH0lnAsYoiZZ2zB91mfdMiAb0yEbrLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mkNhILPA2ZhRQPgJgOyXBgqpDZiFJ8j2XgQ/hQ3212v48X6Gtr8h1Aicfsdvh7zh1nN8et6TXqA4mVnDiSLw2LXoGG5MfMJBVpgHmF9DJ7dm/SDDy2CTPu3Lw9vbu7eDcRHQYv0KHq50iAp2E9flm076qBjyTihMgLqoTPNyA38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GrHNHGgL; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740579784; x=1772115784;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OrOB40cYbVLCfH0lnAsYoiZZ2zB91mfdMiAb0yEbrLQ=;
  b=GrHNHGgL+O0wMr+2WkVlR+mCtD1pseDSTD7LCJE/cGH+vH/3U6BzOYQm
   GlRwg9uIQB133YkZFIuaCDvWZFSDdQbZ0Yo2xyA54KBQxPHRdmGy5l3y+
   IWmjPn5qyW9/wy874k9nkbFSval02JXC5DwITxG2Jsj6RC/qj5QvF5VVA
   fIvdfXsP7fyrlY5+Zw7NIaOU+MsBClJBKvbQGHiiGS4+Mwm3qKhhm3GRH
   eJyODHSwdMrtW48KMoDO6zkkevEdVnv7z9YRbveW53wcqqLd0vaoh7622
   x8AoW0IAlLD1vGeEf0PY+ga3RZONwnKXUp6bAcqA3KZzBTzkvYsJeJS4c
   w==;
X-CSE-ConnectionGUID: /8sdt59+QMm8DwoA0bkS1A==
X-CSE-MsgGUID: GD/M6vmXRlmIe6gH6aphKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="63890715"
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="63890715"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 06:23:04 -0800
X-CSE-ConnectionGUID: qRUPd3CBTbyC46Q47oFPzA==
X-CSE-MsgGUID: WVf+wpDaR9a69sA3ZOCNwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="117202774"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 06:23:01 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tnIJO-0000000FLVY-2saw;
	Wed, 26 Feb 2025 16:22:58 +0200
Date: Wed, 26 Feb 2025 16:22:58 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: =?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.ne@posteo.net>,
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/1] pinctrl: wpcm450: Switch to use
 for_each_gpiochip_node() helper
Message-ID: <Z78jwi8s34t3H8fG@smile.fi.intel.com>
References: <20250220155036.2734838-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220155036.2734838-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Feb 20, 2025 at 05:50:11PM +0200, Andy Shevchenko wrote:
> Switch the code to use for_each_gpiochip_node() helper.
> 
> While at it, correct header inclusion as device property APIs
> are provided in property.h.

Linus, Are you okay with the change?

-- 
With Best Regards,
Andy Shevchenko



