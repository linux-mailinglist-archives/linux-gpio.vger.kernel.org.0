Return-Path: <linux-gpio+bounces-18326-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E96CAA7D8E2
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 11:01:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60CD93B104F
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 09:00:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEADD22B598;
	Mon,  7 Apr 2025 09:00:21 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00819224AEB;
	Mon,  7 Apr 2025 09:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744016421; cv=none; b=lbwO+eG3vK+LzGkepws8AwfUBb0u/kEfBB5WxTePXTgnURvmT/JrpeRUyF28DfVuItjKDOt240r0zfCCR1cv+QqhWhHTZOGVsQduV4PailQOjIN9s5+Jjk8CB+NNsD3rlqlytBbbJDgK7ni12Plg2svqr02RCMsd3JjdkbbDaow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744016421; c=relaxed/simple;
	bh=kbfKIWbU2qkEejFmSd7rCl9igaPP/nOQgBjxtPen4tE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a/BDOm17Y5OV6rtwvllqaShjlISnP7LfzZKOG6GbJ8ihurOnxEUy9ZHJP6JHnv3DFp/qojw1o12yyNhrFm6FzAVsXRG1OlfGFyB2J7JnYAyHENizcKoyqSvXnl5MsPf0YUqOI+uOuVx12elUFFhoL18vM01nFAUiOX1YnFYyeos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: xTzDVyY0TympXeG3N812xQ==
X-CSE-MsgGUID: BE1bn6KsRiqXyqPRQEikTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="45279812"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="45279812"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 02:00:19 -0700
X-CSE-ConnectionGUID: FKdYtSnsSK6nNs3NaEf24A==
X-CSE-MsgGUID: knvpajQqRjeDELdRVxFLzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="132740528"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 02:00:17 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy@kernel.org>)
	id 1u1iKz-0000000A0jy-3a6L;
	Mon, 07 Apr 2025 12:00:13 +0300
Date: Mon, 7 Apr 2025 12:00:13 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Peter Tyser <ptyser@xes-inc.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 05/12] gpio: allow building port-mapped GPIO drivers with
 COMPILE_TEST=y
Message-ID: <Z_OUHXS747yUSA9c@smile.fi.intel.com>
References: <20250407-gpiochip-set-rv-gpio-part1-v1-0-78399683ca38@linaro.org>
 <20250407-gpiochip-set-rv-gpio-part1-v1-5-78399683ca38@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-gpiochip-set-rv-gpio-part1-v1-5-78399683ca38@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Apr 07, 2025 at 09:13:14AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Extend the build coverage by allowing the port-mapped drivers to be
> build with COMPILE_TEST enabled.

...

>  menu "Port-mapped I/O GPIO drivers"
> -	depends on X86 && HAS_IOPORT # I/O space access
> +	depends on (X86 && HAS_IOPORT) || COMPILE_TEST # I/O space access

Are you sure about this? Do we have IO accessor stubs? I don't remember that.

What about

	depends on HAS_IOPORT # I/O space access
	depends on X86 || COMPILE_TEST

instead?

-- 
With Best Regards,
Andy Shevchenko



