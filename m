Return-Path: <linux-gpio+bounces-24215-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 52601B2168D
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 22:35:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6AE287AB8AA
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 20:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 642B22DAFBE;
	Mon, 11 Aug 2025 20:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mG0dpCkO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45542D9EDA;
	Mon, 11 Aug 2025 20:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754944517; cv=none; b=QFc2eswY8KBXwg0qWuYyaTP2HxLib2qfyJnw43Xi00PsyMInt9k6uR3ymGX7uABIkMMHDZswigKDbP7ELf5DLgC/ntjbDMK2bOQ4DmGfqS074YWi34/lR6QG10bS+40vggWJp9YuAc/VTema3N64ZOA8w7NeAHGzn1X/KOOx8uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754944517; c=relaxed/simple;
	bh=sFtLHLGOijEOOAsFWANpfblMzQIDntPSvojGAi5k3r4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RZ+0oZ972alweJ3A1fgCcQPlbGLALxJlpMAa8K18H04csM1E7xwLFU1TmDYgB48VFIMvC6bF9z9/FnyUlnpNxnAozecuNQw5sbmpYqKlF6RQ7oR9CHpNLebzAhBuo62vMIt7DOW9H87OK1/qXkuM2v2GR2tyC8SFRWDKFYXXX6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mG0dpCkO; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754944516; x=1786480516;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sFtLHLGOijEOOAsFWANpfblMzQIDntPSvojGAi5k3r4=;
  b=mG0dpCkOpFvwL2NuXdjAVOXPkU7XHp7KM7WzXXUvwSaHYcC0nXE8AO3P
   KDzTiTtlXayiTdJPdVqlkHOq3DY58akkI9i6fng2ZKg7Xs7Tkpqd1392K
   BW4kM9IJOMTeM24rFGlQCBocyw8FdxBVPqu5/DZYO8iLaO5xHxgtu87RG
   ZrOJ0syl2NqagYAN5sXSWTGbrba4esX/nXLNa5dZjcPB0e8PhfwSDpe4i
   4mSWhE4vSzpL5t5uMmY5GXJLKI5SBdm84faWZnfFS9+Mk5GfZbmDkly2Z
   twSOrjRHwqSEgKT/h+UlElZogq7mgrDeQ20Y49gyO2iNvN9dkB6Y40JbK
   g==;
X-CSE-ConnectionGUID: YRpLtdwGSsCbcrzps3rP1A==
X-CSE-MsgGUID: VO/1AZY+RxC1ob3bCJgelA==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="57289046"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="57289046"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 13:35:16 -0700
X-CSE-ConnectionGUID: x+zD3fb4RbaIsLj1Pyr8NA==
X-CSE-MsgGUID: SJ0hAw7CRt2zRuDHN1fJ8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="165209244"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 13:35:14 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ulZEc-000000056iv-3S6t;
	Mon, 11 Aug 2025 23:35:10 +0300
Date: Mon, 11 Aug 2025 23:35:10 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: David Thompson <davthompson@nvidia.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl,
	mika.westerberg@linux.intel.com, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] gpio: mlxbf3: use platform_get_irq_optional()
Message-ID: <aJpT_nS5bDNRVn9a@smile.fi.intel.com>
References: <cover.1754928650.git.davthompson@nvidia.com>
 <ce70b98a201ce82b9df9aa80ac7a5eeaa2268e52.1754928650.git.davthompson@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ce70b98a201ce82b9df9aa80ac7a5eeaa2268e52.1754928650.git.davthompson@nvidia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Aug 11, 2025 at 01:50:45PM -0400, David Thompson wrote:
> The gpio-mlxbf3 driver interfaces with two GPIO controllers,
> device instance 0 and 1. There is a single IRQ resource shared
> between the two controllers, and it is found in the ACPI table for
> device instance 0. The driver should not use platform_get_irq(),
> otherwise this error is logged when probing instance 1:
>     mlxbf3_gpio MLNXBF33:01: error -ENXIO: IRQ index 0 not found

Missed Cc to stable@.

-- 
With Best Regards,
Andy Shevchenko



