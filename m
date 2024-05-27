Return-Path: <linux-gpio+bounces-6687-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CDC8D086E
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 18:27:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ABC721C22A48
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 16:27:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19F6127442;
	Mon, 27 May 2024 16:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zp0ml6KC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9F12629C
	for <linux-gpio@vger.kernel.org>; Mon, 27 May 2024 16:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716826807; cv=none; b=I+2uQktJZHmrHINHKACMTO29eHdzFjrpU3+qeyb37sJd7eZwrefj/MR4IERo61rb+YT3cEMNbLHbncx46J6B5cvKVNV6sRA18DTGoA4XjxEC4FlWsrpzOM6DfdIoXqejd4OzbZRA2UZfVZgOxFDZ52QWP3G1F4ho70CsvLaXTew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716826807; c=relaxed/simple;
	bh=paqah35wK7UHfAY+o4yWBNvGXjX05ZG0aeMp6H2T0EA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PrnerLZB4LWV0MOWwUQfjwxFVzdyE00iQoker3Q9ISggoVSLq7wP4k7S08YWrEDlXLUu8viX3N+bxuB3fAjBvAKwvlGcHgGY2Py0o5wOtxbC5f6ggc3ZpBzXrboydUVR7N46uP3Yfd4Loep1soju7so9vMJKen7dXdqIZIZhDQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zp0ml6KC; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716826807; x=1748362807;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=paqah35wK7UHfAY+o4yWBNvGXjX05ZG0aeMp6H2T0EA=;
  b=Zp0ml6KCeWkefHEibnzKhgoZExzJV/ulaBxLll3PdIG+vahbbia10Zhz
   Hf1V2DOxonUJijNeudssIevxL/Lb8d28FS8JvvrQxRG17C7a09Bywsp/Q
   EWsp/bOI2PJlU05MBqh4EfBNFMgHDQUfa+UkENlB12YMQfaM6eFDqTsuj
   s2IbftkazV16C1aAkFlJMyZ+e2Zvv18JEXj2SfW5fpliIpXyXxF/73KQf
   oeXpEn1SMLtMGjzpAkL5UUkJ8Lfmo3O4NlED42leNEmqmnPCOQ+fq5dup
   hgZkZLaBQyrXg4IrMSlfDQJwLzh00M4PEWNK1KbtMrMWQ+/65+Vy0P12i
   Q==;
X-CSE-ConnectionGUID: QfYEdCxcSJKsWJf1j9HowQ==
X-CSE-MsgGUID: YCklZfbESUapXIQVjtjMag==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="16985954"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="16985954"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 09:20:06 -0700
X-CSE-ConnectionGUID: n+5S0vzIQuSjk2cw+zGw3g==
X-CSE-MsgGUID: 4umqhQxHS5azjSuqDGBg7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="34693426"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 09:20:04 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sBd4r-0000000BJrC-2qFO;
	Mon, 27 May 2024 19:20:01 +0300
Date: Mon, 27 May 2024 19:20:01 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Kent Gibson <warthog618@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH libgpiod v2 2/4] tools: tests: use "$@" instead of $*
Message-ID: <ZlSyscNCrZv0LRHL@smile.fi.intel.com>
References: <20240527-fix-bash-tests-v2-0-05d90cea24cd@linaro.org>
 <20240527-fix-bash-tests-v2-2-05d90cea24cd@linaro.org>
 <20240527124420.GA108041@rigel>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240527124420.GA108041@rigel>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, May 27, 2024 at 08:44:20PM +0800, Kent Gibson wrote:
> On Mon, May 27, 2024 at 02:02:34PM +0200, Bartosz Golaszewski wrote:

...

> It also doesn't like looping on find results in patch 4[2], though that
> is not related to your change, so leave it and I'll fix it later?

Does it really mean _to fix_ rather than _to "fix"_? I mean how do we know that
shellcheck is 100% correct tool and has no bugs?

-- 
With Best Regards,
Andy Shevchenko



