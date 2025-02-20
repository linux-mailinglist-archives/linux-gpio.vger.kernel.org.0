Return-Path: <linux-gpio+bounces-16320-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 591DDA3DE8D
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 16:30:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 11D3B7A3AAF
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 15:22:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 073771FC7E8;
	Thu, 20 Feb 2025 15:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mAULNkvS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB871FC0E4;
	Thu, 20 Feb 2025 15:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740064996; cv=none; b=VLMYgNufDP9a3kggT2RQZYWO7FGYoR+SnWzx+ZdnsUJAMsIwxXklSRio+od7cVDZWT8jOR++2B2w/d7CTvJYbQGA3J9CiA+r5dFEZwI4U8MlqC0gXoDEzPjfxnDliqErTdWxC2YqDLzGXyj18A8aKa+o5Q/rWK1kCuRbwA4PIvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740064996; c=relaxed/simple;
	bh=v2k4eAqAMd8KALBN1SihRNW/X62w2oAbjNKUgU2XIBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V6I5Hl9FSIjeQN93e4x7tXVCZQh8M5PY/UvDV0W+p1X2c0dfXGTQXQG01G1n89izdSpK7Zuh47Dr9668K5N0+a7dvstMr9GcgCsEVAa7ycWD/hyr/KdqHNCgsu/Ui9XnhepF2XnIpLAqE0uz1YNO+4pyfCifT0o60+9ZTl5zv+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mAULNkvS; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740064995; x=1771600995;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=v2k4eAqAMd8KALBN1SihRNW/X62w2oAbjNKUgU2XIBI=;
  b=mAULNkvSjKdJXufflpXHF/EIJlKXwjnmgsc8mhKt1hA10ko3kbEsz3G6
   tevM3DhUW14Oiktx06FFkSmiinyRl/zZe41VXliRlgwkUsHgroKW0dcsT
   YzdvOZLdIwtwlhwQIvYA9zLItHjMRUxaQ2pIbckO0LG2HNZRq2odxNyLE
   x779XildyegZb8/rkohb/manWzwd5UBAuDLrVEUBdg4B2kgqW0y9jxCp6
   d8zOrAXU1Mv0jWO6JeAfM+WqLeXccQAT8nm4cIQmCWjdbmJj3bg07UQTh
   iLiIcxc7pKMM+npl0zJU1bAVObui1PEtR27KbYmLco3dQt8dYR0KY92oP
   A==;
X-CSE-ConnectionGUID: 57L7n4BJTVSAjA0veKaUOg==
X-CSE-MsgGUID: u9AaWvTlQzijyS4dRKHMEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="51838277"
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; 
   d="scan'208";a="51838277"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 07:23:14 -0800
X-CSE-ConnectionGUID: wLkAALD7SGqsfxYsd6urjw==
X-CSE-MsgGUID: z01v9Gf4TuupXNGbyEP7fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="145963107"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 07:23:11 -0800
Date: Thu, 20 Feb 2025 17:23:08 +0200
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
Subject: Re: [PATCH v1 1/4] devres: Move devm_*_action*() APIs to devres.h
Message-ID: <Z7dI3IFbj_FjZGVW@black.fi.intel.com>
References: <20250220141645.2694039-1-andriy.shevchenko@linux.intel.com>
 <20250220141645.2694039-2-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220141645.2694039-2-andriy.shevchenko@linux.intel.com>

On Thu, Feb 20, 2025 at 03:44:57PM +0200, Andy Shevchenko wrote:
> We have a newly created header linux/device/devres.h that gathers
> device managed APIs, so users won't need to include entire device.h
> for only these ones. Move devm_*_action*() APIs to devres.h as well.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Raag Jadav <raag.jadav@intel.com>

