Return-Path: <linux-gpio+bounces-16896-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41914A4B905
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 09:21:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 62E6A169281
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 08:21:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFC031EF08A;
	Mon,  3 Mar 2025 08:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QHSENisG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128C51EEA37;
	Mon,  3 Mar 2025 08:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740990080; cv=none; b=gs5fJW50takPlpyW9JaU0qqzeqXxPaRHuFcHnptgENnz85S6G5oQmXHQ5ymzX51I8M6PtmE3GemEXOWrydvwwzVMjT1pTMkXOFYB/FaP1XlM32nE8cBGfWrQnyN2IdPAKyhuGQbduKdKvACJDAO4SM+NSPiOMpVLZ4qRbxlZGbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740990080; c=relaxed/simple;
	bh=N9mZl4TD3z0y0yE+U4uxZdByy4waB69DBjZwBEDVK0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YXWjaz6tBqVMryOVu3hfIC3+AuJFnNlrOjT7PGuIk6L6xou9tQR8VFfW7ABpAm/F/b/ekeranwpNvddmRM5IeuF2SIgxoAq5XSfsfvexc8AKCkmTXL2TOnORrjECgmq/B+x+NO0tM8wNT/Bs890QD9UVgIfMQt47AELVWcHpiHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QHSENisG; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740990079; x=1772526079;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N9mZl4TD3z0y0yE+U4uxZdByy4waB69DBjZwBEDVK0s=;
  b=QHSENisGlf/P1/vlyD6SApEXNHQJkWY20TlJYqH1FZC/Bh9T8nyP4Nft
   dgTH4OpTZohvcW2Nj19rlcmC7F0+v52HaOLhUuDFLjRuVD0szL8aCmq+s
   DWf32KIQ6f6DW7tvvmFuMo1BLgqeNdGL4+VqyEuhPARi9ol2mvjJhuRw/
   qHV8exm9TbSghvvFjh+3aXJqPgJq398MMvxs6zuce0O0kmpC7kTXlGFGk
   zXNczbuE3vULP4C/omPsTYZG7kgzpDsJPVImEVPylaPUrt1NGbc4tcKcI
   AAchiUTrG00DW1+TWqod1xpfRv3KfPH7Xvafrgsh7xtNazGztAVp8vS21
   g==;
X-CSE-ConnectionGUID: PZlu3JROTVu1UWbU2Mn6Sw==
X-CSE-MsgGUID: bxck2UHdSAmiEmA5UYIWlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="41741002"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="41741002"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 00:21:18 -0800
X-CSE-ConnectionGUID: 97up0/dCQbWEIlFstbw+Gg==
X-CSE-MsgGUID: VKhMROqeTjyq46TDp4kIKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="122947971"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 00:21:17 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tp133-0000000Gkip-2FPH;
	Mon, 03 Mar 2025 10:21:13 +0200
Date: Mon, 3 Mar 2025 10:21:13 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: lee@kernel.org, giometti@enneenne.com, gregkh@linuxfoundation.org,
	raymond.tan@intel.com, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] gpio: elkhartlake: depend on
 MFD_INTEL_EHL_PSE_GPIO
Message-ID: <Z8VmebNcrH6CjHp6@smile.fi.intel.com>
References: <20250303044745.268964-1-raag.jadav@intel.com>
 <20250303044745.268964-3-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250303044745.268964-3-raag.jadav@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Mar 03, 2025 at 10:17:42AM +0530, Raag Jadav wrote:
> Now that we have Intel MFD driver for PSE GPIO, depend on it.

...

>  config GPIO_ELKHARTLAKE
>  	tristate "Intel Elkhart Lake PSE GPIO support"
> -	depends on X86 || COMPILE_TEST
> +	depends on (X86 && MFD_INTEL_EHL_PSE_GPIO) || COMPILE_TEST
>  	select GPIO_TANGIER

Looking on how GPIO PMIC drivers are written, I would redo this as

	depends on (X86 || COMPILE_TEST) && MFD_INTEL_EHL_PSE_GPIO

-- 
With Best Regards,
Andy Shevchenko



