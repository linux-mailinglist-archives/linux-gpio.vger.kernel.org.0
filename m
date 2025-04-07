Return-Path: <linux-gpio+bounces-18324-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC06AA7D8B3
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 10:56:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 493E53B291D
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 08:54:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC70C22A7E7;
	Mon,  7 Apr 2025 08:54:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE27222A4EA;
	Mon,  7 Apr 2025 08:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744016047; cv=none; b=DgPpB/Ss29uGb+Q6SrwODsBlvU/CntRK8UYHeJAD+2VmF9laQjHwV0IvgGZUxR2cqdON9YSzFTzNsqeovItOKORALX0LFZbBn53W7WA7oHao/FiXWJKjpa4RmHfco8YPzLZVTwtX4FxbSXTcI0yZQFCb09vbhdADrfy6d+fRRk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744016047; c=relaxed/simple;
	bh=oP1eI0xG72k5j5b3U9Kc+l+cAJzT0ZWGXloJLeGdxUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n8k4QAym6/RcJasJsPWV5BxHTAuD0O7I56uqyB5D7Au1mAqG1YJsuxgg+I84QPzKrZKzGfOrOnBZeuA3qQ2PoEr9Gi27pKSkJh4ZfTjLmHyz1hf0vT2W1HQaqEL8sH9Pzm3kc/NiQKDwHs40ApZmS7L4Y6cun1KQoL18UZW0WVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: 4YBh4dfQT8mfTPbNTbo5cg==
X-CSE-MsgGUID: p0mBiw2pT5uuTBHPqpzn5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="45103158"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="45103158"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 01:54:05 -0700
X-CSE-ConnectionGUID: JFPLXEn1R1K8dsYI4V89iw==
X-CSE-MsgGUID: V9P9Mzn5TweFkH3poMC6vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="158874643"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 01:54:03 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy@kernel.org>)
	id 1u1iEy-0000000A0dB-22Jb;
	Mon, 07 Apr 2025 11:54:00 +0300
Date: Mon, 7 Apr 2025 11:54:00 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Peter Tyser <ptyser@xes-inc.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 11/12] gpio: ich: enable building with COMPILE_TEST=y
Message-ID: <Z_OSqBgZpJpONuVn@smile.fi.intel.com>
References: <20250407-gpiochip-set-rv-gpio-part1-v1-0-78399683ca38@linaro.org>
 <20250407-gpiochip-set-rv-gpio-part1-v1-11-78399683ca38@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-gpiochip-set-rv-gpio-part1-v1-11-78399683ca38@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Apr 07, 2025 at 09:13:20AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Extend the build coverage by allowing to build the module with
> COMPILE_TEST enabled.

...

>  config GPIO_ICH
>  	tristate "Intel ICH GPIO"
> -	depends on X86
> -	depends on LPC_ICH
> +	depends on (X86 && LPC_ICH) || COMPILE_TEST

I don't see why LPC_ICH should be here.
We do all-or-none approach for compile test for (x86) MFD drivers,
no need to test it separately (it makes a little sense).

	depends on X86 || COMPILE_TEST
	depends on LPC_ICH

-- 
With Best Regards,
Andy Shevchenko



