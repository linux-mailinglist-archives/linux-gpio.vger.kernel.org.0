Return-Path: <linux-gpio+bounces-23286-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5C1B054CA
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 10:24:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EAE6B7B54E2
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 08:21:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 805D1276030;
	Tue, 15 Jul 2025 08:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AoWH77Bh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED21F275873;
	Tue, 15 Jul 2025 08:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752567721; cv=none; b=iULBu1xz78QKuRHp1lyAa9REny8tfQnexhtgDsiT/ECCoVCg4KE1TW1OkSAz5nJzAI+9k3/DgVzA1jpPkmPV6y2NgXKhNnFvLzzQuEpJIer7NJSt1BfTsC0GZClZ+WOkCKPJcuLwsttq/u61DrpEC7iAkcwuROS8YiMFYlqKD40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752567721; c=relaxed/simple;
	bh=qh3iKXB6e+tUcjfkW8kmUKXqJF2goUOYE8q4iC5PdoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DvyraBD7uzKbrcuDYMIYhsIvJxGSaOl24g/Wd9zUrt6p5C/TsLJG7lbHMaNc7kaBDa+OdE5HHpZiVfJaW2IC16XtzPjfSJYyrk2bf+9M90vluciz/QuX1R7aUtaFTPKHq2vJTg2RJXhu6GaksdiSjNsUqCnZcUHBVhFehcDjtpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AoWH77Bh; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752567720; x=1784103720;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qh3iKXB6e+tUcjfkW8kmUKXqJF2goUOYE8q4iC5PdoU=;
  b=AoWH77BhoG8kaEs1ilRbHUlRfCI4RZn/hM5lFewr5NLzJ15xqyLhK6+n
   cjkd8Y1uWPaq3VsgCP75mSKxy0NMBT7BePgv3x58/nkGLMZSjAvSMD0Uu
   6j9//MbX3Pnm1xkFT3QdFdHSiSkepltfA7xtokRPlpeUBU3v388HcAdaF
   7+VBEIxE5hy+CNkRE0P21m7JwYZDnG8W+bvQlh60lg5ABeT3J79/QD7Yy
   2TnsX/RfibGo2aWi72L6SZMLnJZbHDtT7Ked3/qfjkkPbaycsJAmrBwz5
   YlyCVhrXTve0DEX9UbYZ3QtCC6KJUGg6B7CbRyiPDYKfzohCNm8nz2R1Y
   A==;
X-CSE-ConnectionGUID: JqY+Ev5hTQSrvPExI60YDg==
X-CSE-MsgGUID: hq8Vzd+DQ9yZJsbOX3LOZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54649079"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="54649079"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 01:21:59 -0700
X-CSE-ConnectionGUID: nmlhfCi9TxiaA30+CCz/Fw==
X-CSE-MsgGUID: mXEYMokGT4m8tJAJYkTIlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="180864367"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 01:21:56 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ubavB-0000000Favp-1Klz;
	Tue, 15 Jul 2025 11:21:53 +0300
Date: Tue, 15 Jul 2025 11:21:53 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
	linux-arm-kernel@lists.infradead.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 1/2] gpio: wcove: use regmap_assign_bits() in .set()
Message-ID: <aHYPoR5JVP4OO0QZ@smile.fi.intel.com>
References: <20250715-gpiochip-set-rv-gpio-remaining-v2-0-072b4cf06330@linaro.org>
 <20250715-gpiochip-set-rv-gpio-remaining-v2-1-072b4cf06330@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715-gpiochip-set-rv-gpio-remaining-v2-1-072b4cf06330@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Jul 15, 2025 at 10:19:44AM +0200, Bartosz Golaszewski wrote:
> 
> Replace the if-else with a direct call to the regmap_assign_bits()
> helper and save a couple lines of code.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



