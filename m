Return-Path: <linux-gpio+bounces-19386-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF2CA9EA03
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 09:51:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 325CD3A4EA3
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 07:50:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53E9E21ABA7;
	Mon, 28 Apr 2025 07:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LUqluV03"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B236218851;
	Mon, 28 Apr 2025 07:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745826656; cv=none; b=XajUkX+EAkRWm4dG71Z43o39IV59zAU9ZpcRvuFnv0/lCE/85RLZL3T6roQD7QPH8pVw3v4qpTDoOLMovH6NNYOZ1oZ12V6r314EqMI7AvElSaKvUhPx9qMZTKFpPZ9sy7fRkO5SaWwkSc21fHlW772N3FRrg+Mt+C3cYV36DDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745826656; c=relaxed/simple;
	bh=xaqPpMf3FLiuOMO0A2MToq8MZrw//Npjwu/pW/T1Rg0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dhgW3hHJxSqR391TEzOwrvzQwZnbQg13rMb/+e8VeK7b9E9wnlhX600zs8HLsweBVeI1UttmkVepi50QuCxB5HwIyz15rU1jzQLYglcIivEMBrHKobDzAylNZyjZ0Onkp60BAhFtmWdzVZinQ8O8mbfxxOXn/Whi0fIId23OyH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LUqluV03; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745826655; x=1777362655;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xaqPpMf3FLiuOMO0A2MToq8MZrw//Npjwu/pW/T1Rg0=;
  b=LUqluV03Xp/XmlcXNsPBJc1AMmnLZxx/J9EjehsZkCqf7tYkJ2kYSJQV
   F0qtWEHZ6OU4LamsRx8v5AIQZQrrU4xCFSm6YfSH3NhYyNPxNdtuvA0lS
   0oUSVRhcDhwKDjMLnE8tlKOoLHKlAiYwppzDc3RWlIIXFQFkNpL6sCAas
   dsvtqjBN9iR72hGlaSP/XsZz0u/XnWJBX7iRwZ3EtQWu9mpzozs7iS6aA
   NMZR7p5gclVaYR77eo2/RiCLix+dVgumWhNOhxHdWMggP341Q55MGwKU8
   5j+B7q6uuwgL3jNSkU4k0qQwCWCwPiC564khz92LV16LDB4FumsEDcjIa
   w==;
X-CSE-ConnectionGUID: eQY6aDx6QnOERxCF9XofzQ==
X-CSE-MsgGUID: NcceSAidRQGJ4zPARt6AkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="47282503"
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; 
   d="scan'208";a="47282503"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 00:50:54 -0700
X-CSE-ConnectionGUID: q3hl097cT3GI5ARUC0Eg4A==
X-CSE-MsgGUID: UkEtZ++dRD2XzVxIEciUBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; 
   d="scan'208";a="138434639"
Received: from smile.fi.intel.com ([10.237.72.55])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 00:50:51 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u9JGK-000000011PW-47Fp;
	Mon, 28 Apr 2025 10:50:48 +0300
Date: Mon, 28 Apr 2025 10:50:48 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Raag Jadav <raag.jadav@intel.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [GIT PULL] gpio: immutable tag for the driver core for v6.16-rc1
Message-ID: <aA8zWA9dpw1CrbZ4@smile.fi.intel.com>
References: <20250428074550.16190-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428074550.16190-1-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Apr 28, 2025 at 09:45:50AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Here is the tag containing the driver core dependencies pulled into the
> GPIO tree to enable picking up the final commit from Andy's series[0].

Ah, Now I see, thanks!

-- 
With Best Regards,
Andy Shevchenko



