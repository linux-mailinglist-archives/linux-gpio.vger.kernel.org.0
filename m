Return-Path: <linux-gpio+bounces-6310-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE008C29C5
	for <lists+linux-gpio@lfdr.de>; Fri, 10 May 2024 20:20:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 32BD3B23E22
	for <lists+linux-gpio@lfdr.de>; Fri, 10 May 2024 18:20:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 655BF22F19;
	Fri, 10 May 2024 18:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cX0DXVNp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CA322EE3
	for <linux-gpio@vger.kernel.org>; Fri, 10 May 2024 18:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715365240; cv=none; b=UiAYNFh/qWOxeb45AX3SGninsl0ZK+gxfHmvKj+fBbOT+8D7xuDZvXcVmGsDN1HcUyBYQy2AtjWYdwqtbkVQMMIlJl/WJMm+B8nlU456xPWbwPHzMvDZgy3cYtzybRCyVR/pt73vR464cifwVJE1knt2hOv7OiTjwvp1bHssqTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715365240; c=relaxed/simple;
	bh=FIh9mIJOztl95rUL7+7HOkA/jTMURvkLGAkBDDGq7lc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WdnWVnbymUjC4NckuLxEFwaurqtwQ+M8kmbllJ3GgtDSGbPYy/vJ/25eG0L5O3QFmmH4vGMqlySER0HpiODKF85zuPkEIolmrHjgDrrjmDHmx5va/4bEDp1K23Pbnj88RD+HKmc5G2EAAFuT1dJpASsQ+0Qs6TwDWXQscGSFDcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cX0DXVNp; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715365239; x=1746901239;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FIh9mIJOztl95rUL7+7HOkA/jTMURvkLGAkBDDGq7lc=;
  b=cX0DXVNpk6Ko0r4rsflNrrdfueofjbcohf6e4Y5/qCgRAHGECGr9yWZg
   2ENEgONaBaI2PN+dmfxbMgvqPDsyKLocPWXKdCHkyzfAXwu4oUZg9a/UZ
   ILq8AA1/+4Kqvd5+EMs+mIGd1bqpbVqsSPKEfqfqvy039nXT0ZHVL43JC
   PpEOqz015guGcjxLEQP7ZgQ+O642JXg5vhHvIA/Cuc3Sl0M8WDcz0CG3x
   lYDGyFrQjtJLXpnRA5Q4CfZAgWxE8yVpkV3sJfm6c+WGcdR/xFD+astJK
   obky2OKas0GqNKKcSF4dD7zp2XZNA79CbMSE6+42vB1Uw+8kZ/ktraQqC
   w==;
X-CSE-ConnectionGUID: M0YX+i+lQ+GNOffD9Tu3JQ==
X-CSE-MsgGUID: SJ2YCw8hSdWh1d9uNKjJWg==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="28846168"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="28846168"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 11:20:39 -0700
X-CSE-ConnectionGUID: JLVWtboYRu6UOyrBwpQ1Dg==
X-CSE-MsgGUID: giDbbcm+RDyFBAa3RanYCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="60546505"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 11:20:36 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1s5UrB-00000006DMO-3RNN;
	Fri, 10 May 2024 21:20:33 +0300
Date: Fri, 10 May 2024 21:20:33 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	William Breathitt Gray <wbg@kernel.org>
Subject: Re: GPIO drivers under drivers/char/
Message-ID: <Zj5lce8vzGhJWVeA@smile.fi.intel.com>
References: <Zj5agJGxhpyO4zp-@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zj5agJGxhpyO4zp-@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

(Update William's email; btw, William, it seems MAINTAINERS need an update, or .mailcap)

On Fri, May 10, 2024 at 08:33:53PM +0300, Andy Shevchenko wrote:
> Hi!
> 
> Due to patch bomb from Jens, I noticed that we have two interesting drivers
> (and a common library) under drivers/char/. Shouldn't we move them to
> drivers/gpio/ to keep an eye on that (with the respective update of MAINTAINERS
> if needed)? Also William might say something about this since those are old ISA
> (?) related ones and (perhaps?) might utilise PC-104 code.

-- 
With Best Regards,
Andy Shevchenko



