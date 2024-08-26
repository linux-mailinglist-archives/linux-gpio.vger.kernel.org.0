Return-Path: <linux-gpio+bounces-9183-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F63595F80C
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 19:27:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90F8D1C218DC
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 17:27:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA836199E94;
	Mon, 26 Aug 2024 17:26:03 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123CE1991CB;
	Mon, 26 Aug 2024 17:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724693163; cv=none; b=TC2ArGlsEFU9rj/7OTfncM1jI+WfgUkQwB9q1cM1IvFeVQKEuX1Q5IrDintXMaJTMReaD6Z/EUGj/FArFOqGP8ezchZBcs5/Z+9NogOC8/p/NidU7yjPBf5sHTGsOyxWCBq47I4XNS9Awd0gq5enOi1sznBeI+4U3/TnEINrf1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724693163; c=relaxed/simple;
	bh=JsDdnLS2fGsM8ZypPWIx1C5ELSLkeSsbtZWDRLnMpdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=unCa1wRhCAfsyOFagOoyCpo/rMvD+lHolsk3+CRtFtqeVZ/HxJW8zz5cqJTkbxDSCgIekKynoC2p6iNp0/hBPqP7uMlTmf73+1N6HJvj5ETni3wiAEzyttU4W+c5OlCfgSROps5UBOKT7DiUUtNqWONLq/l7RJ6WR6/8c6TaDrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: D/iLN+GGTSuOCkiplWKSRg==
X-CSE-MsgGUID: lB5PYgEKSfSoaSyZYaGW4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="33795718"
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; 
   d="scan'208";a="33795718"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 10:26:01 -0700
X-CSE-ConnectionGUID: 2/yfE6YpR8KiMBVoXqYIVQ==
X-CSE-MsgGUID: dWEh/z8aSGSZrmH+mDcH4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; 
   d="scan'208";a="93306656"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 10:26:00 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1sidTZ-000000021Wl-1dhC;
	Mon, 26 Aug 2024 20:25:57 +0300
Date: Mon, 26 Aug 2024 20:25:57 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: kerneldoc fixes for excess members
Message-ID: <Zsy6pZ9LYDk0LOHs@smile.fi.intel.com>
References: <20240826161850.74447-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240826161850.74447-1-krzysztof.kozlowski@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Aug 26, 2024 at 06:18:50PM +0200, Krzysztof Kozlowski wrote:
> Drop kerneldoc descriptions of struct members which do not exist to fix
> W=1 warnings:
> 
>   drivers/gpio/gpio-pch.c:101: warning: Excess struct member 'lock' description in 'pch_gpio'
>   drivers/gpio/gpio-syscon.c:46: warning: Excess struct member 'compatible' description in 'syscon_gpio_data'

I prefer on per-driver basis, but since it's simple and I have nothing
in my queue,

Reviewed-by: Andy Shevchenko <andy@kernel.org> # for gpio-pch

in the assumption that Bart takes it directly.

-- 
With Best Regards,
Andy Shevchenko



