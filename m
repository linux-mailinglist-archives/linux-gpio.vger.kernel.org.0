Return-Path: <linux-gpio+bounces-13297-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AED09D9F3D
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Nov 2024 23:37:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 154611686FB
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Nov 2024 22:37:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29F151C243D;
	Tue, 26 Nov 2024 22:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fQ3jtbyV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3852B11185;
	Tue, 26 Nov 2024 22:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732660636; cv=none; b=efZVVAbyu6bfksHubG1J36y0RiAfdK1nOSOSUiYMScu679ksgMFN37bttA643wYX9HEXaQYTk6AvrYFKudPbTKk5nMEH1s+tnMseAjq7QiLugf1iSz4cZvKTiXiuc5tNJsAbns+1uSO5bSod1qdY+Ua63k26zFXDKRQsfgMJR/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732660636; c=relaxed/simple;
	bh=3v5DyQUQ8SKX6A97x/6MOm1ejSRScIxuCNnsEsdbG6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nMX5806XH3XJE+CIUaQZrhhleevBRXuy5zb94h+WdieKX92fS2MFrgpXyTVtShDfPiGbbPXdA+IeizsmdkFwqQMYF000h8i+ys3qk3Ww2VG6brcXiMkQ8KgsTWnABsIYG7AOGh5OgRopSa1xiBtfRESRBxdSCPzm4G3s3mtfdFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fQ3jtbyV; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732660635; x=1764196635;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3v5DyQUQ8SKX6A97x/6MOm1ejSRScIxuCNnsEsdbG6s=;
  b=fQ3jtbyV1sYKsawsXt+OOsp1odzvN/Y9sVsmHHsP3vbEutsIOWA+apBZ
   kQNHOW9o/Ly43oaOWJ2O+93M69x27O8qHvE639JhAgEsah4Fqc99OF35A
   8I8AKsRx55znLYUUF5YS2yzJrttpoYO/f1ajcyD6ROsLCXeNrdJCIYlsI
   0CQQPQmdqbAW+jbT6gzhjrkgEn2Iqtt4rY3rwxkX4DfEx8TapbfjNNvSD
   u0ah58WjaRvTjCJoQPxR89u8olUgDT31VUunfNgcC1etDJLky9TBHqiDV
   QUjnQC0j9gcGNuXQilw6vdNXnLn6Wtd/OMCZHFwCzr7dSpMWQxFauthUp
   Q==;
X-CSE-ConnectionGUID: HbToUjJ9TdeICePmVlb7yg==
X-CSE-MsgGUID: bD7GaM2dRv+Me2Bh8Hx0mw==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="32994613"
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; 
   d="scan'208";a="32994613"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 14:37:15 -0800
X-CSE-ConnectionGUID: qzQDlkpES9+yq7nDsS9qVg==
X-CSE-MsgGUID: g1lNK6nwSyGdwuyC/ExJrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; 
   d="scan'208";a="91561421"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 14:37:12 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tG4BB-00000001Rda-1Etn;
	Wed, 27 Nov 2024 00:37:09 +0200
Date: Wed, 27 Nov 2024 00:37:09 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: gregkh@linuxfoundation.org, linus.walleij@linaro.org,
	mika.westerberg@linux.intel.com, dmitry.torokhov@gmail.com,
	broonie@kernel.org, pierre-louis.bossart@linux.dev,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 2/6] pinctrl: intel: copy communities using
 devm_kmemdup_array()
Message-ID: <Z0ZNlY2uJn3d4VYs@smile.fi.intel.com>
References: <20241126172240.6044-1-raag.jadav@intel.com>
 <20241126172240.6044-3-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241126172240.6044-3-raag.jadav@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Nov 26, 2024 at 10:52:36PM +0530, Raag Jadav wrote:
> Copy communities using devm_kmemdup_array() instead of doing it manually.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



