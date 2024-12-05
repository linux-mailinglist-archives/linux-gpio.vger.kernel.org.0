Return-Path: <linux-gpio+bounces-13550-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA569E5717
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Dec 2024 14:31:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD00B285173
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Dec 2024 13:31:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7137C218E83;
	Thu,  5 Dec 2024 13:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cmL7xzxA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAD9218ACC
	for <linux-gpio@vger.kernel.org>; Thu,  5 Dec 2024 13:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733405002; cv=none; b=PB7+tkUYZgH8P+AuOYGa1BtEtuI+aUkiH/AhuJ7o0e98CvkQMsF+MZU29VDhp3r3v/amuS3FoAFcjnGCw7/9O7Soq3FO0mkg4/Fc8Nl+kwFAZECZdvnJDySxadzDG953TwfMmJXWS+TMC/X2ymkY9qhwOEorswbi/aWwgwOH/dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733405002; c=relaxed/simple;
	bh=mHfYTTrLNnlrAnd5h8ap2W5s0JuDG+6YYk2iaXU/iW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AcJ2VEqhq1q7jZb5JhdsKuxwYcmtLxoZRZRw+exsVPn8FTznL5MlPJZ0CUAkaX8wcK4a4XBonEmS9R0Wx+g6oMdOKZPy2u5tNn7q0eSKKW8hW/x0lsCzowXBlfNxJ8PGDQmanskVWkYdU7UXNUYUdGWmZOk5GaTKeCmTKOzFWj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cmL7xzxA; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733405000; x=1764941000;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mHfYTTrLNnlrAnd5h8ap2W5s0JuDG+6YYk2iaXU/iW0=;
  b=cmL7xzxAwUlM3ddH5ZpVpeJhc5FfYM1fO1YNubYaXotCd4cAuEgp+SMK
   pZRrsEAftEfwCPvr6UgQYGfQ1nrIkpVMGLfSV6Zzh0FXkYpn0ZI59uOM6
   +o+QRmeDEt/LmJhY+Ugip775zUGndtdQ3CNVIDjHHSzf50+bNQYqOawbq
   zsbjE6EvJH1eYK9DtXBS190I/NOYdH9tvX7Ryk354jMRgiaTov5X3QrWR
   qLzwSDs3QhDWWU7qSc6OyydNvc0U+4Eq2zON7q+bnduBf3cEETnzwFT83
   vqB05WCXCHE/rB/iGg2GL5S6ZU18C5O5rEVSwjO9MYFw02urvKrD9v6vh
   A==;
X-CSE-ConnectionGUID: SpF0QNpsREKAtgJC4sNEKg==
X-CSE-MsgGUID: SUFa9vXsTuuWZj6iq0vXQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33598115"
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; 
   d="scan'208";a="33598115"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 05:23:20 -0800
X-CSE-ConnectionGUID: F9RwoRzZSn681HlP15lCqQ==
X-CSE-MsgGUID: SYoKzRifSnSf69DG+N+emQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="99131711"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa003.jf.intel.com with ESMTP; 05 Dec 2024 05:23:18 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id BF81542D; Thu, 05 Dec 2024 15:23:17 +0200 (EET)
Date: Thu, 5 Dec 2024 15:23:17 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: gpiolib: fix refcount imbalance in
 gpiochip_setup_dev()
Message-ID: <Z1GpRV4oIbCKRspI@black.fi.intel.com>
References: <20241204122152.1312051-1-joe@pf.is.s.u-tokyo.ac.jp>
 <Z1GoskmQH0_FhxID@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z1GoskmQH0_FhxID@black.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Dec 05, 2024 at 03:20:51PM +0200, Andy Shevchenko wrote:
> On Wed, Dec 04, 2024 at 09:21:52PM +0900, Joe Hattori wrote:
> > In gpiochip_setup_dev(), the refcount incremented in device_initialize()
> > is not decremented in the error path. Fix it by calling put_device().
> 
> First of all, we have gpio_put_device().

Should be gpio_device_put().

> Second, what the problem do you have in practice? Can you show any backtrace?
> Third, how had this change been tested?
> 
> Looking at the current code I noticed the following:
> 1) gpiochip_add_data_with_key() has already that call;
> 2) gpiochip_setup_devs() misses that call.
> 
> This effectively means that you inroduce a regression while fixing a bug.
> 
> The GPIO device initialisation is non-trivial, please pay more attention to the
> code.
> 
> Bart, can this be removed or reverted before it poisons stable?

-- 
With Best Regards,
Andy Shevchenko



