Return-Path: <linux-gpio+bounces-20064-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C7AAB563E
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 15:37:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0BE0919E2DCC
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 13:38:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EF4828F93E;
	Tue, 13 May 2025 13:37:45 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3061728C87D;
	Tue, 13 May 2025 13:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747143465; cv=none; b=Br3fyGBgpmTTL2eVLwPWFSv2jECV5p8ebpGJMWt0tldQF720Y7AxNA7ZaMh6qs7X8xXSsPyv/jU30xtnlIlXNpm+mUFGban75OJ1hGJkvKUaRqiXowaIuiki32maz9CYWNXO3jlBornTDZREjrC8Uhi+641WdURG+5kGCTTDAzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747143465; c=relaxed/simple;
	bh=xaSrdxOWc5LB0dHY9T6rZvtzrfo23rdHF6/lCp5oYDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kpwpUMPh6Sg/Z72LfhD6NrXBjXW3JEc0OjH/dbwhkFtIlRtYRy5qA8gCfG5tPinjkwPumk8clizakSsxsphgkZIrPvsGU1ikUdrz30sq9tHDdSV4fZC4qosGmOgK5FZCFdzjcfWIet2zgllhiAwJWiFqBUOCS02ftMDMVbur0xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: ExiDh1YrQl+gI1QmBCheLw==
X-CSE-MsgGUID: 4UmXDupDQwSVBj0KwkMjAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="51645166"
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; 
   d="scan'208";a="51645166"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 06:37:42 -0700
X-CSE-ConnectionGUID: rBkZQB+qQwORMn0Jifto4g==
X-CSE-MsgGUID: 43AkM+AzRQeU/pFbJg+qqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; 
   d="scan'208";a="174837265"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 06:37:38 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy@kernel.org>)
	id 1uEppA-00000001GvW-0TdT;
	Tue, 13 May 2025 16:37:36 +0300
Date: Tue, 13 May 2025 16:37:35 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH 00/12] gpio: convert more GPIO chips to using new value
 setters - part 3 for v6.16
Message-ID: <aCNLHxb-o3Kadpui@smile.fi.intel.com>
References: <20250506-gpiochip-set-rv-gpio-part3-v1-0-0fbdea5a9667@linaro.org>
 <174714214927.9467.6551553602169960677.b4-ty@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174714214927.9467.6551553602169960677.b4-ty@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, May 13, 2025 at 03:15:51PM +0200, Bartosz Golaszewski wrote:
> On Tue, 06 May 2025 11:01:43 +0200, Bartosz Golaszewski wrote:

> [12/12] gpio: ml-ioh: use new GPIO line value setter callbacks
>         https://git.kernel.org/brgl/linux/c/d3f960365b8c35449d22b780383dc9b40d96203e

I have already picked this up.

-- 
With Best Regards,
Andy Shevchenko



