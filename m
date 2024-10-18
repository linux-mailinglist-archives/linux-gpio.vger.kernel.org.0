Return-Path: <linux-gpio+bounces-11619-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A229A3D50
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 13:30:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63CA7281CFB
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 11:30:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 163171D6AA;
	Fri, 18 Oct 2024 11:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j0LuIDjs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D250A1878;
	Fri, 18 Oct 2024 11:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729251018; cv=none; b=Y7Crav+82cokW8Ab6ZLPrGFt/qt9ZbLyuWXX94ilJVriiC2B4hyASYu1J9PwnViS4xsXPSZZdTYb6bbxLulhRN3IVMW2eILEkc/PYL4oEPxxJGS0aPAygGEOekKAC0HCHnLWlIbkfD870MIYEW7AM6d+gQr3cY2KjkWkX2S5uxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729251018; c=relaxed/simple;
	bh=Ej3yAWHr7fbgdNubao4f5dJg0zJXpryb2qGZenUOA9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z45BmmOU5sKAjdJoZGKC9sVSIEC/ZIJieyih/+XBGUQozHMMbezKlgD3tu9yffL1U7N9h8GMKObmaI5W5frqS66EalqEY5y2kFi7bmEEbEU3KiyKfZ6ttu/gbdJ4KTmOPjVNN05Hu7wYcoSgkzvdz+6mwZqmwKzFRf28UN4/H50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j0LuIDjs; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729251017; x=1760787017;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ej3yAWHr7fbgdNubao4f5dJg0zJXpryb2qGZenUOA9c=;
  b=j0LuIDjsUKE9hKUY2jkrh8rp2CaBz//+HueDW1MaXlLkSrMWABbJPUmh
   Sb6GKWhdFrKEO3pznOL0cQILoixTjTlVY85QS1BztAJhE0AmgV8JFiul7
   Qqlk8r59sLD1Vjz/BwqkHOCvTrlSjWvr60KnG/fGiP2e9/vbba717CDRU
   uwj4uZZ3c36jvonPwCXkdCSeGdOAl4kuDY22n1hK+cQ6f2kktC+a87eOK
   D6/vr2O9YiG040IjZeoeaHDQzLg0iDbWUvd9pKuPaJ+CyFQF7Ci7XHUMw
   K48Vi1lwoWtNtnLk+N0apHvywGSS1MM27tdVl9zcaCdpQ1x4+Zqre7XcQ
   Q==;
X-CSE-ConnectionGUID: ao72CHuHTaKKSx99bR5xYg==
X-CSE-MsgGUID: co7F6TwEQuCFSQlUB2xahw==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="40139719"
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; 
   d="scan'208";a="40139719"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 04:30:16 -0700
X-CSE-ConnectionGUID: tIKXeHGsQHWrrHWtKHyfrA==
X-CSE-MsgGUID: LRlr3seTR5yZctmrPc2ejg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; 
   d="scan'208";a="102148533"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa002.fm.intel.com with ESMTP; 18 Oct 2024 04:30:14 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 5F323343; Fri, 18 Oct 2024 14:30:13 +0300 (EEST)
Date: Fri, 18 Oct 2024 14:30:13 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/2] gpio: mmio: Support ngpios property
Message-ID: <ZxJGxXNl29i8d_fA@black.fi.intel.com>
References: <20241017-gpio-ngpios-v2-0-cecfdb38d40e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241017-gpio-ngpios-v2-0-cecfdb38d40e@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Oct 17, 2024 at 08:46:07AM +0200, Linus Walleij wrote:
> I thought this generic property was already supported by the
> generic MMIO bindings and code, but no.

I have two issues with the second patch here.

First one is why? What the *practical* issue you have? Can you elaborate
on that?

Second one, is there any other way to avoid duplication of the code so
we have one place of the property parsing?

For the background I have to mention this commit:
55b2395e4e92 ("gpio: mmio: handle "ngpios" properly in bgpio_init()")

If there is an issue, it should be fixed rather than adding a shortcut
with not fully known consequences.

TL;DR: on a brief look the second patch should be reverted (or simply
dropped as it's easy to do while it's on top of the branch.

> It's a pretty obvious usecase to just use some from 0..n
> of a MMIO GPIO bank, so add support for this.

-- 
With Best Regards,
Andy Shevchenko



