Return-Path: <linux-gpio+bounces-19384-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D83A9E9FF
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 09:50:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C11B3B79D6
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 07:48:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FC7A1DDC2B;
	Mon, 28 Apr 2025 07:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EPktEH1D"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D100B23C9;
	Mon, 28 Apr 2025 07:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745826467; cv=none; b=o/h7NxLsXUjdhlvkrHUOniQqsBpY+sctjeUfMGDrA1Kyr5gz5dbfaOaC8cLcVHpCgXI3pQyqOEmh26EWb6LomgMnePbF3rmLbGjiN4QnkjlM+Y7mU8mUxFmRsCV8y/53yEeQg89oRIG/uX2qDbZS9rPuA3o3hMarxXqYdhtEo14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745826467; c=relaxed/simple;
	bh=V9VO8d7GqRn1Ql1CwDZyQu1tYggE7XNW+vS8mR6BDDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uXTa+8bB12MI8+NgaTDfjPSUgdT/VzeAYaGGNqonvBFwZKyvSKxepsrv8SFfEsMjEj0uUm00Ip5asr/e3+Cz9iJTr2+S1epZRWSYQC2gtf09YKbUbzBXSlkivvhLK158H9bJhIO62ESABj23b6GmGGdOdUPVVjVDEH1EkVXLBGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EPktEH1D; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745826466; x=1777362466;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=V9VO8d7GqRn1Ql1CwDZyQu1tYggE7XNW+vS8mR6BDDc=;
  b=EPktEH1D6VAx/+uXcUPUusV7Z7SVdMVa4NxcfMzyMS+iBlPoaKyLPVc0
   86wXNmRjnb1zJbW40SmorTP4woAeuADB2fMfNyQhsWe6HSG8VA0a3HrJo
   ugJdLNFG8lMpA322UT/THA4qnlyxePsw3PlqPhoTKM0Yl9TdrHnEVnByM
   s4ZtyVQ+dpCifUggT3u0VtXsCBt9EB9aUkoQro3o8NXllkhvoSzZ9SBCh
   tP5NxxrP7mPm+UoZRolvcbaorcEv/YsB20ykAcBNpUG9MDGV95POSlVtN
   wbobr6t9a/W11mRH4xWaXqnrA0/V54VjGJo/2l3IFDaFCTf4qxQorraX+
   A==;
X-CSE-ConnectionGUID: 6g0JmwdYQyavyS68Zdm4RQ==
X-CSE-MsgGUID: pml7PYGeTVq66dwedX6L8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="50060258"
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; 
   d="scan'208";a="50060258"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 00:47:45 -0700
X-CSE-ConnectionGUID: sbVqtqoyQiO34GlzQs/iVw==
X-CSE-MsgGUID: hw9NucE/RAmkdkz81dmYqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; 
   d="scan'208";a="137494097"
Received: from smile.fi.intel.com ([10.237.72.55])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 00:47:42 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u9JDH-000000011Mm-3j3O;
	Mon, 28 Apr 2025 10:47:39 +0300
Date: Mon, 28 Apr 2025 10:47:39 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Zijun Hu <quic_zijuhu@quicinc.com>,
	Raag Jadav <raag.jadav@intel.com>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: (subset) [PATCH v2 0/3] gpiolib: finish conversion to
 devm_*_action*() APIs
Message-ID: <aA8ym3GYoAK4lI2y@smile.fi.intel.com>
References: <20250220162238.2738038-1-andriy.shevchenko@linux.intel.com>
 <174582608319.15717.12211907178640999391.b4-ty@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174582608319.15717.12211907178640999391.b4-ty@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Apr 28, 2025 at 09:41:52AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> On Thu, 20 Feb 2025 18:20:25 +0200, Andy Shevchenko wrote:
> > GPIOLIB has some open coded stuff that can be folded to the devm_*_action*()
> > calls. This mini-series is for that. The necessary prerequisites are here
> > as well, namely:
> > 1) moving the respective APIs to the devres.h;
> > 2) adding a simple helper that GPIOLIB will rely on;
> > 3) finishing the GPIOLIB conversion to the device managed action APIs.

[...]

> Applied, thanks!

Thanks!

> [3/3] gpiolib: devres: Finish the conversion to use devm_add_action()
>       https://git.kernel.org/brgl/linux/c/d1d52c6622a61a0ae8dd2bd2097b25c0f553d2f3

Only one? What about the first two?

-- 
With Best Regards,
Andy Shevchenko



