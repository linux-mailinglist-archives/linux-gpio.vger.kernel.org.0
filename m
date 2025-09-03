Return-Path: <linux-gpio+bounces-25525-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3986B425B9
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 17:41:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 238383BA2D2
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 15:41:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D22D283CBF;
	Wed,  3 Sep 2025 15:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dVWNYOve"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B57D23D7E3;
	Wed,  3 Sep 2025 15:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756914093; cv=none; b=tHKPVZG2mc8wlYyEE+47vO3uOXQAz/zx8ug4rjYHeBItfnn19JbdSAFAhxYlkiAC1NyM3c+EEbHW1kNvrds189K/j4tg5EmLJIV9xALy+D+rhLhax06yk2lAvBZn3Vl5wues0ulAiJNc3hg4o64cKP/nx94yRKr4ktat7/exRXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756914093; c=relaxed/simple;
	bh=N2s+b8yQSCdu263w8kaJufSOphTU+OL/XziV+EYWFfk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T2cfH2dPE2zmC8JriuEOzYOi2hg+bMaBuy1QeNUTFxSEfMF8TIU02Zc7tVVdq7nZfmEdR72G5XQzjOEyf2MKJvaUXB/0Ky2wEgGqGt3oAARl6l+neH0Fh1yB4WFVrZpNRNQanlebABA5hLmP937See8ziNnMlESUJoUao/ZElow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dVWNYOve; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756914091; x=1788450091;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N2s+b8yQSCdu263w8kaJufSOphTU+OL/XziV+EYWFfk=;
  b=dVWNYOvecE456RUT59zo4zC1jyi8ELzbkBMkg7Sv2+zlEV9cRinWKi7s
   a25j3ZFfVLdicQ7PmvTWEWjVLkfv57/xy9RrSQAtlOfOVqkqXMUDgddqN
   XDgpeM621EiOdqNqLVeIRd4Q9sqgP+Gya5elGKKakMY49/ulR59qIWqjP
   N+eb9fPaehsmmNG6BYnGKaMj39Q8KPOz+hSQdn/B2+zmp7uoVOCR+HwIW
   +VTtMmhSeTQCDX6D/WxgxrvaJqXZBGOzd1Hn6hId5Jsk/1kj8GCo+sRtI
   ig1tF8yGZAkKlGjTg8+aJKWe6/iALq4kOydUF/wy4CvumgLYLLf2PL0K4
   w==;
X-CSE-ConnectionGUID: Q1PBT0isSRCPIwwtmrhvqQ==
X-CSE-MsgGUID: KyPAyp7UQ42FlauTGe3p4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="46806233"
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="46806233"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 08:41:30 -0700
X-CSE-ConnectionGUID: IBh6LXKgSQKHmQGUyFcJKw==
X-CSE-MsgGUID: VDwwqc9DSbe5Dh0/U+6bsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="171564223"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 03 Sep 2025 08:41:28 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 9DA5C95; Wed, 03 Sep 2025 17:41:26 +0200 (CEST)
Date: Wed, 3 Sep 2025 17:41:26 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Yang Shen <shenyang39@huawei.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-unisoc@lists.infradead.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH RESEND 05/14] gpio: ts4800: use generic device properties
Message-ID: <aLhhpiVpGscOFydS@black.igk.intel.com>
References: <20250825-gpio-mmio-gpio-conv-v1-0-356b4b1d5110@linaro.org>
 <20250825-gpio-mmio-gpio-conv-v1-5-356b4b1d5110@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-gpio-mmio-gpio-conv-v1-5-356b4b1d5110@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Aug 25, 2025 at 11:48:46AM +0200, Bartosz Golaszewski wrote:
> 
> Avoid pulling in linux/of.h by using the generic device properties.

...

> -	retval = of_property_read_u32(node, "ngpios", &ngpios);
> +	retval = device_property_read_u32(dev, "ngpios", &ngpios);
>  	if (retval == -EINVAL)
>  		ngpios = DEFAULT_PIN_NUMBER;
>  	else if (retval)

Don't we have a method in GPIOLIB that does this (can be called explicitly by the drivers)?

-- 
With Best Regards,
Andy Shevchenko



