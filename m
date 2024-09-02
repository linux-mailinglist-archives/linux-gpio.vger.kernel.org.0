Return-Path: <linux-gpio+bounces-9576-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E6896875F
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 14:18:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 43EE4B26295
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 12:18:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7115519E974;
	Mon,  2 Sep 2024 12:18:38 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E168F19E964;
	Mon,  2 Sep 2024 12:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725279518; cv=none; b=q2PZjdcXzPTqWieVeYVn/9gFR3YnoXn0YEdfzIh18AG4/7/tR03Q4lXWRmIuQhjmQ4S9GWvG8/vXWqv5hRh9xzxx6jNgO1CDZRvCEDMXJK9uDGz6WDvhtHsEfCNB8U8Iyjt1vfojeymYLjx5807V3GMuFx/ePbLDWqEnCnUyUzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725279518; c=relaxed/simple;
	bh=fxVY6dBiWuDLEpVY3cC9s81DNtS4B2Lptr5+oMNkXkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HLJC6elmcjdIc9UwgrMBOovUlMephbHAYVsX5mEulwN3v6cxfVSnMiu0LoXm+iNjiw+acZTXur8oYm36B0YNaloicyp6/OZWBlYTVXi/n+SBHXifMEcQOnR0jkF4L0uN5TdkIkktTmTUVMpwQP+lQtbGmOek0g36V8qfNDowN7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: 6pM/DsbTQ06uMYPqOuDM2A==
X-CSE-MsgGUID: NYjkNNRQTICfHwEv5+wJwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="23732816"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="23732816"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 05:18:36 -0700
X-CSE-ConnectionGUID: OPLZp/o0Rpitp0EQM4MhlA==
X-CSE-MsgGUID: th07cN+aTTmfY/16FslFrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="65094483"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 05:18:34 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1sl60u-00000004M6B-1Oia;
	Mon, 02 Sep 2024 15:18:32 +0300
Date: Mon, 2 Sep 2024 15:18:32 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] gpio: pch: kerneldoc fixes for excess members
Message-ID: <ZtWtGPrycW1rIHLj@smile.fi.intel.com>
References: <20240902121258.64094-1-krzysztof.kozlowski@linaro.org>
 <413bfe77-5942-428e-a0ad-43d9e8605270@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <413bfe77-5942-428e-a0ad-43d9e8605270@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Sep 02, 2024 at 02:13:56PM +0200, Krzysztof Kozlowski wrote:
> On 02/09/2024 14:12, Krzysztof Kozlowski wrote:
> > Drop kerneldoc description of 'lock' to fix W=1 warning:
> > 
> >   drivers/gpio/gpio-pch.c:101: warning: Excess struct member 'lock' description in 'pch_gpio'

...

> Eh, crap, forgot tag which now applies completely:
> 
> Reviewed-by: Andy Shevchenko <andy@kernel.org>

Yep, thank you!

-- 
With Best Regards,
Andy Shevchenko



