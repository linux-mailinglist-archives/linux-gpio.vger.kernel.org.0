Return-Path: <linux-gpio+bounces-27806-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F859C1A1F5
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 12:54:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4BCAE1899AEB
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 11:54:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1EC4337BA1;
	Wed, 29 Oct 2025 11:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hAxze3cv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D592D47FD;
	Wed, 29 Oct 2025 11:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761738855; cv=none; b=aWow6+ncgmVCT3oHx2SZMoGWD7lhBLkP2qbsn9FpCNXkVRchi+ITvPAkWwcDV8HPRP+lPJ4LuHH1k43KXcLVIIs8b1Pum8gWAUTbM5gBLpknPFZkgyPl3Lk9ppNAldx8PXUOMCZ0lzyWEAwFksWDim49rlaq/xkwUXDier+elcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761738855; c=relaxed/simple;
	bh=fuf1LfWN4j/837jd0hVGkh7BL7pxjiKOctcvPtmTalI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VZvmbkMy+YRAbQc9Y3YFhmyKdLov45WbW//KbePOP4aSdVP5+aqkX0BIzhOn7cri65zUVTwXbD45ABiRaU+JYIdo+xfIBxlgPz87+p84QmMM73neSH+X3oXaVXY1aZ8H9GR2LVGwyPfpbzc08+85EQ7IY9VIsZQu0CYJieWL65I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hAxze3cv; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761738854; x=1793274854;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fuf1LfWN4j/837jd0hVGkh7BL7pxjiKOctcvPtmTalI=;
  b=hAxze3cvHdSOJFwLIp37wK+P++/GVMZgrvzlZ1jQK4RcehSNEc54hs/5
   H/et+wNbdKkT5rhQFxWV5OaGC5wRWr0mY9Ssrq4d5lh7sR1ZHko/cjkqg
   FZ1xG/QnKwTZHRgxSdQ8BaHmfTVG1AxWUwrPpSqA4dRHFSQ5f7/7TgIYe
   e3vFJ5pBlimnHT9yi6QGhADNkYt875bQwqCBVk+FT8HXZIDw+3Xp4jKJ4
   +gxYBIR3P27Dc2FSPYqe6lSBTbNF6M+PXG+Vn0C87SFnmv9YdqwbxQ+MS
   TfskKyBbKhjBgtMOxt6wAdeojXO8C+GY+QTmlqxq+raxR7QpBPzxV5GZb
   g==;
X-CSE-ConnectionGUID: tsKMYEY9RgioO/W/jQi7ZQ==
X-CSE-MsgGUID: DmivzIm2TXaGOdb1U+dfEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11596"; a="51430558"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="51430558"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 04:54:13 -0700
X-CSE-ConnectionGUID: 5r6AkawHSf6SHNTAxhpQGg==
X-CSE-MsgGUID: 6g6unhV9Sm+rGyvN/M0+Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="222855207"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.244.248])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 04:54:07 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1vE4ke-00000003bMP-1GBg;
	Wed, 29 Oct 2025 13:54:04 +0200
Date: Wed, 29 Oct 2025 13:54:04 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andy@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v3 10/10] regulator: make the subsystem aware of shared
 GPIOs
Message-ID: <aQIAXO1hUrw4Yp9V@smile.fi.intel.com>
References: <20251029-gpio-shared-v3-0-71c568acf47c@linaro.org>
 <20251029-gpio-shared-v3-10-71c568acf47c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029-gpio-shared-v3-10-71c568acf47c@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Oct 29, 2025 at 12:20:46PM +0100, Bartosz Golaszewski wrote:
> 
> GPIOLIB is now aware of shared GPIOs and - for platforms where access to
> such pins is managed internally - we don't need to keep track of the
> enable count.
> 
> Once all users in the kernel switch to using the new mechanism, we'll be
> able to drop the internal counting of users from the regulator code.

I am wondering if you took into account the layering violation (or others
put it as "transferring of ownership") in the regulator core for the platform
based GPIO regulators? This popped up during the discussion of
https://lore.kernel.org/platform-driver-x86/20251024050537.92440-1-qiuwenbo@gnome.org/

-- 
With Best Regards,
Andy Shevchenko



