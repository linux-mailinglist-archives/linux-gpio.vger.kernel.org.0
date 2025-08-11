Return-Path: <linux-gpio+bounces-24163-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D4796B20949
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 14:50:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CDCA188C9DF
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 12:51:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D499D26D4CE;
	Mon, 11 Aug 2025 12:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fjn0H0Ib"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5AE22D29CD;
	Mon, 11 Aug 2025 12:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754916580; cv=none; b=FAqAAImI38N8H1tDx92yTaws0CWHXyZbMdssIsipmgczHYpKhzNHWpi9rCCmxLcs6Eo5WRCQOtcLU6CLW97ko0d7XSmn20Zw87Hfb2xAc4xvfUeXkzIILGcVL5Qe9pBqo/nTrzewf1Gvm7Yl3LqJuy5JdqNLQKHwJGF3i6D3NTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754916580; c=relaxed/simple;
	bh=xR7X62KP1TBwPyC2MDDmPeCD8CWHYaE5C6arF/VsysQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O9YTaXZlKr0bdPouvcb13QvlDs1KuphSJlWXRMDIKkYqm7dPV3SMOJUU3M1+lUGRtId7MbLQ2gd2poTIxkyU38ZA3nzLQ7BwBd8G7K3CvvpxxRUI5Yfq7JndbpRlnTOB+zj5fM74Iy/XJEFeU0iKQJIyaB7S40HYjRNRq99JsK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fjn0H0Ib; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754916579; x=1786452579;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xR7X62KP1TBwPyC2MDDmPeCD8CWHYaE5C6arF/VsysQ=;
  b=Fjn0H0IbqQ9DW/QN07hscjaIvcstW4VtkyAzfo8Ftbhtj+teBnF+JPRq
   mJCsRRxI2VZdtrpl3jxuZRrE2kbRWc3xjg3pl46I0MWnZvKVYKjNxqaol
   rt9gVcirnea8Ep9F6zrQTrAQO1JS6ew51SP+oVwPJ7kJ3FPTdw6fJ4Tsq
   KXom0BWDELx9bCnSHjyJzXQt/miLnrBUdzVlJqrskWZ87PYWIjoV/z9K+
   bjwEdK/5mKxUmtUsR8PiqqAL4lEm3wRh9uCldlXXLokzZbU7BNfk/JazM
   pSU7P4SYWbKaC1apl2wd1YWbX+qYDQ73zSosOpWPofa/Jq2JKhC0ECtl9
   A==;
X-CSE-ConnectionGUID: 7yrZwh6kQsSrnwXw0kA5Tw==
X-CSE-MsgGUID: lZ1hLNXbRHOEIH/MBj4/mQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="56196510"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="56196510"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 05:49:36 -0700
X-CSE-ConnectionGUID: hEUsNFGNR3GsgYB+QfxNsg==
X-CSE-MsgGUID: vTQuvXFKS+izHXbIiTWnLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="165904003"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 05:49:33 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ulRxy-000000052aU-0Z4s;
	Mon, 11 Aug 2025 15:49:30 +0300
Date: Mon, 11 Aug 2025 15:49:29 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Koichiro Den <koichiro.den@canonical.com>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 21/21] gpiolib: turn off legacy interface by default
Message-ID: <aJnm2dpNWJDXbTb5@smile.fi.intel.com>
References: <20250808151822.536879-1-arnd@kernel.org>
 <20250808151822.536879-22-arnd@kernel.org>
 <aJcgZLWgMy01re08@smile.fi.intel.com>
 <c7d66744-29c9-4f70-905f-7ef133a22422@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7d66744-29c9-4f70-905f-7ef133a22422@app.fastmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Aug 09, 2025 at 09:47:31PM +0200, Arnd Bergmann wrote:
> On Sat, Aug 9, 2025, at 12:18, Andy Shevchenko wrote:
> > On Fri, Aug 08, 2025 at 05:18:06PM +0200, Arnd Bergmann wrote:
> >
> >> All users of the legacy interface now select CONFIG_GPIOLIB_LEGACY,
> >> so it can be turned off by default.
> >> 
> >> Allow turning it on manually for compile testing, in order to keep
> >> the build coverage of the legacy drivers.
> >
> >>  config GPIOLIB_LEGACY
> >> -	def_bool y
> >> +	bool "Legacy GPIO interfaces" if COMPILE_TEST
> >
> > Maybe I'm missing something, but how does it supposed to be compiled for old
> > platforms? (No, COMPILE_TEST is not a correct option for that)
> > Perhaps you meant EXPERT ?
> 
> The COMPILE_TEST is really just meant for enabling some drivers
> that would otherwise be skipped in allmodconfig builds.
> 
> All the old platforms that use one of the GPIOLIB_LEGACY drivers
> select that symbol once the first six patches are merged.

Ah, that makes sense. Perhaps a word to be added into commit message?

-- 
With Best Regards,
Andy Shevchenko



