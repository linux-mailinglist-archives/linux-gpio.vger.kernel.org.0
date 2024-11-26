Return-Path: <linux-gpio+bounces-13298-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A409D9F42
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Nov 2024 23:38:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7F458B24C79
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Nov 2024 22:38:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB00D1DF984;
	Tue, 26 Nov 2024 22:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SC9UlK3e"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC261C07C0;
	Tue, 26 Nov 2024 22:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732660713; cv=none; b=uyo0nuvEBwkZnFYrMbBGvMT5gG//sd5HwIdEcP6Dn8clFKIWbobmxhhMKwch5D+YrPnH0jmWIX/1YcA+yGnE1qeLCTXsNaVWNmY2sRyclxdULaZZcSEjyuEY3cOylB/Hv6vZYASf0TUny6Ac4itbrqSSauwHgZX8S6bAROn4/bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732660713; c=relaxed/simple;
	bh=cA4z4O+O40fzwe5KcZ45hTGqNQgIMfgpa78Q3apr8AY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tpLXA6/LFT8MgK7B2RfjNsz9JTnzT5yseF6ceV+IhFlXmDdFKOJiVppjjXPBD1y7gQQaK4DxC9FrdbSFt1FnsvZv8Ub8rUjFy6vTx8MSFGSEC+bJJFtH6JWwXB+kV7E7dsEbe2pJ1bSGbi2vmrW66G8A+9SJ6kRfLrCOLP9d4OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SC9UlK3e; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732660712; x=1764196712;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cA4z4O+O40fzwe5KcZ45hTGqNQgIMfgpa78Q3apr8AY=;
  b=SC9UlK3eHAoQroR+PtTX7M6T1klyzx66Qnfvgyls47zKIhwrqbL6IDPS
   w4KnLudCP2ieQqvGhKvXpYPmsHuvMMwJIvHV4BDT7/17Cq6tIGs9vCuCB
   Tx+CZ1aGY8CphpXedJbn0XEl/JzoszXTALhSyxYUqssoIKOq8osp4tZY/
   KAUlQ+Q5r4GSAtmhkaVKV3JJJMVJGpvWb20TkslDBVtr856MEvJd9aHKv
   +qC8d3d1iUu8S+v/njzQ2hOyqCK4L3xIovcDRtzZy6ZpZ6C35OaQvsm13
   XEJtmncE3NQTrw6986EWozshD9m3AcLHUTTmIlmdcV5qWI6zXgbIbqrTc
   g==;
X-CSE-ConnectionGUID: AAMtzLBYQGuggi7h5JTkOg==
X-CSE-MsgGUID: fnJVdCTATJmGQdUy5Bsl4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="36509773"
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; 
   d="scan'208";a="36509773"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 14:38:32 -0800
X-CSE-ConnectionGUID: 7oIy0EKaSQ2AvKIfL3GnvA==
X-CSE-MsgGUID: oVFQ9dr3Q9ST10FpbPqM/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; 
   d="scan'208";a="122730480"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 14:38:29 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tG4CQ-00000001RfA-0vOg;
	Wed, 27 Nov 2024 00:38:26 +0200
Date: Wed, 27 Nov 2024 00:38:25 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: gregkh@linuxfoundation.org, linus.walleij@linaro.org,
	mika.westerberg@linux.intel.com, dmitry.torokhov@gmail.com,
	broonie@kernel.org, pierre-louis.bossart@linux.dev,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 3/6] pinctrl: tangier: use devm_kmemdup_array()
Message-ID: <Z0ZN4eXYFxaqzsCy@smile.fi.intel.com>
References: <20241126172240.6044-1-raag.jadav@intel.com>
 <20241126172240.6044-4-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241126172240.6044-4-raag.jadav@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Nov 26, 2024 at 10:52:37PM +0530, Raag Jadav wrote:
> Convert to use devm_kmemdup_array() which is more robust.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



