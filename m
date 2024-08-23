Return-Path: <linux-gpio+bounces-9061-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2C095D05B
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 16:48:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A8672852B3
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 14:48:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD124188903;
	Fri, 23 Aug 2024 14:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FnEb8l61"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287A0187FFC;
	Fri, 23 Aug 2024 14:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724424492; cv=none; b=YPjPOigx16UyHx2zSGUaDubSE4YCMVZFjyiYihgXdDQAFCjvf2oBzq2e5zf/kJKk8a1oPWTx9lT9KQDngLuGbVrxEA68eyFBH2djY2/63Kyt2IG5WfoZIVw64ulWCWcv1HsSfe1F1OKf8/BDmGDZ/xMZZ2/WvPbz08zqJcv90KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724424492; c=relaxed/simple;
	bh=oRK6C/+tY1XXLhNr5QfIgOfUkuRNl5VuJiB4P1b7u8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J4n4il/NMf/4u5YJJ5d5QadPWFx2NnUeJ2DCT+kcI//FVIjqR26EtaT7oAdANhp6GmUmLKhhPWQPI7zE7bRCN98osNYD5heWQtKGxkvQqJ8fCV3nnAhPvwOdjYddNmoGNgYZThLEM9j/yXxL10iweLH7ZUi9wpGY/j+dC9kRvKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FnEb8l61; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724424491; x=1755960491;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oRK6C/+tY1XXLhNr5QfIgOfUkuRNl5VuJiB4P1b7u8E=;
  b=FnEb8l61/vCnJIb9FRcudbziax1602kub0yAzg29Gk1RpBXkZ5fi7Esp
   2DCboiRsqLZFe40W2kmOXSPWS+MsnViIIV7dQFLb1rTqNbgbl5ULTHp5n
   jqrPPLN/6hkFD1WUT0Y/XSk9Ihs8VuaxWpu/LQd/TLXt5lkq/zSiSOjnw
   loC0cA7w+xLg2e1bq0Cq4BlEgsqo7M+fpu7aUSzrdYGaeU+cddNEyY47o
   104TXx8eBKnzclyPSCYVQMVMvrC54PErQYwYACZF5AeFVeGQlBEgOFeIT
   ydowAVTSegJqelT4FL/SWsghs7hEws2abW1qBmJMfD+9a3vy0WiiNi+JR
   Q==;
X-CSE-ConnectionGUID: K1w6F9/rT46r8EBFdeNUVg==
X-CSE-MsgGUID: h+m4/Vi2TzOKf+ZtAdMUQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="23065988"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="23065988"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 07:48:10 -0700
X-CSE-ConnectionGUID: d/4Oulh+QpmEw0y6SEvIpg==
X-CSE-MsgGUID: o5xH+gyqTVm500thYnpgAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="92542653"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 07:48:06 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1shVa7-00000000pED-1VXN;
	Fri, 23 Aug 2024 17:48:03 +0300
Date: Fri, 23 Aug 2024 17:48:03 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, heiko@sntech.de,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	mika.westerberg@linux.intel.com, tao.huang@rock-chips.com,
	finley.xiao@rock-chips.com, tim.chen@rock-chips.com,
	elaine.zhang@rock-chips.com
Subject: Re: [PATCH v2] gpio: rockchip: resolve overflow issues
Message-ID: <ZsihI71S8ep7j_Ke@smile.fi.intel.com>
References: <20240823034314.62305-1-ye.zhang@rock-chips.com>
 <20240823034314.62305-4-ye.zhang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823034314.62305-4-ye.zhang@rock-chips.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Aug 23, 2024 at 11:43:06AM +0800, Ye Zhang wrote:
> Prevent overflow issues when performing debounce-related calculations.

...

> -		max_debounce = (GENMASK(23, 0) + 1) * 2 * 1000000 / freq;
> +		div = (u64)(GENMASK(23, 0) + 1) * 2 * 1000000;

You probably want to use HZ_PER_MHZ from units.h or so?

-- 
With Best Regards,
Andy Shevchenko



