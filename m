Return-Path: <linux-gpio+bounces-6843-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFF08D3766
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 15:18:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 548151F2477C
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 13:18:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86407F9EC;
	Wed, 29 May 2024 13:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jMvDhC5Y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B2ED27D
	for <linux-gpio@vger.kernel.org>; Wed, 29 May 2024 13:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716988717; cv=none; b=A2MwXj7EbbKXaxSuhWdfvlGKpsG54/PN+tHXUXq0Wz17uPPcXmB9pHLlt67n5RZs6wxti2IDUuDfHBpi86V8ohu2cC3s6NCAGQKJsF4u6DmftMKXIE8RwR8wFLnOHy9Xko6SmVT5JWjt900eXJb5KT60cy71CW4eEgAm8wzNvlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716988717; c=relaxed/simple;
	bh=Ld7Jt1juu+KpjBbrxTXbcxJAasYjlI/BSkom1ubgMBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XVPmp1iQ2LrscE6Kkma/WfwWiNKpX9hZqsw5EnLyOxOTj19WMAWmM2oYwCSgrki2lAKBVSbnjCFCenDnyA5hSP/SwR1HX564gfvmO3D4X05bstfrvmMrclm8gwYKpI8lJ4RgV/nsAHwkppSt2Sek2VAtt4/T+ueBaMvSm77UtYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jMvDhC5Y; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716988716; x=1748524716;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ld7Jt1juu+KpjBbrxTXbcxJAasYjlI/BSkom1ubgMBQ=;
  b=jMvDhC5YHeJPMSRxqnKUugUH4Q7et24wfpUvGBU7v3l6yUiwTQrazkco
   KGwOvo8W2d8Us7HmUQs1HwWypd666KBUXwZf5bOPXJgCivUnoTHwkR0u8
   E4Aple75UDpEA8D77hv38sxY+tPXnJRA0FUnPfEB+zYCBCWzqTeFodjNd
   w1NpSkKFjOq95OHlGYnx+SAi8ZkN52EDGVSbV7q2z93zF4Kc9xLWzx+Ja
   DXzIaA60tqP5SQo2d0kZtJq0g27+qBT7R1Aw56d+W+zvS8ifaDFGQvG6F
   2WUMOGMAlwRVAion7ktEP3R0CuvCRhDhS/15sH/zdhF5+RtggFoLwUhhS
   g==;
X-CSE-ConnectionGUID: /QlIBw4gRRqIH45BKtwXOQ==
X-CSE-MsgGUID: P9A5IpTuRYGuRJi7wrnYRw==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="24524178"
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; 
   d="scan'208";a="24524178"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 06:18:35 -0700
X-CSE-ConnectionGUID: kjlJS7QBQLe6xEhMFY9Qag==
X-CSE-MsgGUID: qBpp88oTRMWN+7KAjhuA4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; 
   d="scan'208";a="35967974"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 06:18:34 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sCJCJ-0000000Bnut-2TSb;
	Wed, 29 May 2024 16:18:31 +0300
Date: Wed, 29 May 2024 16:18:31 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Kent Gibson <warthog618@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH libgpiod v3 0/4] tools: tests: fix a few issues in bash
 scripts
Message-ID: <ZlcrJyo5DxdGtgdi@smile.fi.intel.com>
References: <20240528-fix-bash-tests-v3-0-e9b5be2ba8bf@linaro.org>
 <20240528083405.GA79126@rigel>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240528083405.GA79126@rigel>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, May 28, 2024 at 04:34:05PM +0800, Kent Gibson wrote:
> On Tue, May 28, 2024 at 10:25:47AM +0200, Bartosz Golaszewski wrote:
> > Fix a few issues with tools tests reported by Andy.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Looks good to me.
> 
> Reviewed-by: Kent Gibson <warthog618@gmail.com>

And okay to me,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



