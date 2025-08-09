Return-Path: <linux-gpio+bounces-24108-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C84BB1F417
	for <lists+linux-gpio@lfdr.de>; Sat,  9 Aug 2025 12:21:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 103057ACF24
	for <lists+linux-gpio@lfdr.de>; Sat,  9 Aug 2025 10:19:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78072258CC4;
	Sat,  9 Aug 2025 10:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UF6jJx0e"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCFC25F994;
	Sat,  9 Aug 2025 10:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754734862; cv=none; b=Gakb8BomUm3o92HIrTnMr83QVHTgmUT2G2kHbYFUEftEYPu6rezLtYj/C4qRGmHrs0IT5mh09BfQvH/TD2ChklvsZB9N9givwv5DegighepR+RjYxnghCfIAZIP/DcS56f6QPk4N6cQBaP+u5gWdWXpmtMT6A/Rekcx+qTJ0A1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754734862; c=relaxed/simple;
	bh=xkhoRCRwaoDqayR583mMtqSwtvLH7lvE+LIjFMy9+EI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bwFzZSkfLSiVwf9x5yh0R4VedbiLr0/dmZ1A/SP46fCAmbeOF8zptJupa/s+sHYYpAcaPbM7KUdhOi35JOv1CRbvsUqJ9cW2niO8gawSsKe1SyxyjbAV2NbQBY3v/QshPq8MScTFK7Er/1d8GPfFZRPqjYvURKUNbrEhejBa+JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UF6jJx0e; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754734860; x=1786270860;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xkhoRCRwaoDqayR583mMtqSwtvLH7lvE+LIjFMy9+EI=;
  b=UF6jJx0e5n6rL9MSXsG3pEID6NrNuhWyGq76R6VloR2XvdbklTDZxGUJ
   tuInbstWB+N1UJqoVdMHJDtsUsNFu5oUxFs6Rer05/2DJtLkRKYr2Ka5w
   4M2tV3Hf42zYwIkRsstgmm0t3zn7cUri1paE4YYP0EC6V5KEu312o99Uj
   xq+KGtEVQDerszb7zXR50gf0qepL7Xb5FpFcPXi0qpacw/Eqbj+dDTO5K
   0yNdh66d12OMCp5G1IBmnHGMWFCnw1O1QJ8Nlep3HX7iR+JpUsFusDz3x
   H1jKys8TVQDMIB4WpvSUDB+PRZIyhhgpkS592VEv9owDmkGOTJocB1H12
   Q==;
X-CSE-ConnectionGUID: SKl6TWGVTfKKGc4/IINV5Q==
X-CSE-MsgGUID: Q44EEy22Tj6UMrygsorFpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="56271853"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="56271853"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2025 03:18:18 -0700
X-CSE-ConnectionGUID: zR0577vPSaCvZHC4n2jlNw==
X-CSE-MsgGUID: WbWozsYRQ/Kqh82BKHVD0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="166311440"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2025 03:18:16 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ukgeT-00000004col-136C;
	Sat, 09 Aug 2025 13:18:13 +0300
Date: Sat, 9 Aug 2025 13:18:12 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Peng Fan <peng.fan@nxp.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Koichiro Den <koichiro.den@canonical.com>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 21/21] gpiolib: turn off legacy interface by default
Message-ID: <aJcgZLWgMy01re08@smile.fi.intel.com>
References: <20250808151822.536879-1-arnd@kernel.org>
 <20250808151822.536879-22-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250808151822.536879-22-arnd@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Aug 08, 2025 at 05:18:06PM +0200, Arnd Bergmann wrote:

> All users of the legacy interface now select CONFIG_GPIOLIB_LEGACY,
> so it can be turned off by default.
> 
> Allow turning it on manually for compile testing, in order to keep
> the build coverage of the legacy drivers.

...

>  config GPIOLIB_LEGACY
> -	def_bool y
> +	bool "Legacy GPIO interfaces" if COMPILE_TEST

Maybe I'm missing something, but how does it supposed to be compiled for old
platforms? (No, COMPILE_TEST is not a correct option for that)
Perhaps you meant EXPERT ?

-- 
With Best Regards,
Andy Shevchenko



