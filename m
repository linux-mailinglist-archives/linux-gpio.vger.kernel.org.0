Return-Path: <linux-gpio+bounces-19042-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EB0A9256A
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 20:03:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3BB121B61A7F
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 18:03:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37AFE256C97;
	Thu, 17 Apr 2025 18:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V8eY/AYO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660B01E832C;
	Thu, 17 Apr 2025 18:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744912928; cv=none; b=fyWapEG4tYYqlb5PdXawTEG6PWZ980JD1OMgpe5g9XhSOGGqyJf8MOi5525f9cvY2nMtYgFpIrpxuhIsgTC3WnOqLqZC/lx8yPdJDwNRH2niUAvnx9XonkIB7gxbW1gODA3Wx7k3HOTAj3Q8OQtuBspsN7jH6UUSzUKHNuMUyCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744912928; c=relaxed/simple;
	bh=Rh9Uqlt+Q/XluaVVgsFDwyqQ1QqDRxuhINLx1AisiHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RaRy6F7tIozG1fcKOjaaJpZ8UwoHTivBg6UbeO7KUe3OGPD4Bun9seoTWsu0l9hMvdovnP8mMRkjYjZu/P4YnhqitBGjWL/iE36wAOq3A9MBQQ4unuoBqoowffxLhZp3WQiBkavHfwBpJ50hLyck/CQLdt4n6jQPdZ2VxP2zjAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V8eY/AYO; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744912927; x=1776448927;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Rh9Uqlt+Q/XluaVVgsFDwyqQ1QqDRxuhINLx1AisiHY=;
  b=V8eY/AYOlVVPxUoUb5OsFENA0cHGZE+3HI0NERJHzxBZrTV0KxxPY1SN
   TJ9kcKXXfK7Gr6MDiAu9TVTf5S7ro1ypg1QpP8IjQz3yylGALvFT/AU3y
   2AAs4hKZ5FT+caitC1xtI0zWXHAKaW+m51F3XSsleVc4cSsA+LWDCDibR
   IBDgrRCPDjVDxH8M5HTWWMhTf8SbyaSQ4+awvJIULRl64ei97VxzKsHof
   toSoD3y+xl8jIj3jCEj/qmL3zODaxalmBtJBQq6RZFBelxWpaU4w+wW9P
   wtuWTy16WYOzXofG85tZeMNV5wmhV5CylG2TAlYpwtl6hoCbKAWecSsU6
   g==;
X-CSE-ConnectionGUID: txGWicMhSTWP+pQ7VFEbEQ==
X-CSE-MsgGUID: 4kEcJDD6QCq2U2BFyjHWqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="50184073"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="50184073"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 11:02:06 -0700
X-CSE-ConnectionGUID: C63pk7jdTouEqjLsjUMe6w==
X-CSE-MsgGUID: bGRhesxwR6CKWIJAkvAKoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="136059053"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 11:02:03 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u5TYm-0000000DH5U-2RkO;
	Thu, 17 Apr 2025 21:02:00 +0300
Date: Thu, 17 Apr 2025 21:02:00 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu,
	GaryWang@aaeon.com.tw
Subject: Re: [PATCH v3 00/10] Add pinctrl support for the AAEON UP board FPGA
Message-ID: <aAFCGHfkYx71ykoG@smile.fi.intel.com>
References: <20250416-aaeon-up-board-pinctrl-support-v3-0-f40776bd06ee@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416-aaeon-up-board-pinctrl-support-v3-0-f40776bd06ee@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Apr 16, 2025 at 04:08:08PM +0200, Thomas Richard wrote:
> This is the third version of this series (rebased on v6.15-rc2).
> 
> The gpiolib part has been reworked, the gpiochip_add_pin_range() was
> renamed to gpiochip_add_pin_range_with_pins() and a new pins parameter was
> addded. Two stubs were created to add consecutive or sparse pin range.
> 
> For the forwarder library, a namespace was added and patches were splitted
> to more simpler changes.
> 
> In the pinctrl core, the function devm_pinctrl_register_mappings() was
> created.
> 
> No big changes in the upboard pinctrl driver, only few fixes and
> improvements.

I reviewed it and the whole impression is very good, it seems much better in
comparison to the previous one(s).

The biggest issue I see here is the exporting the forwarder internal data type.
Most of the rest is the style related comments. Looking forward for a new
version.

-- 
With Best Regards,
Andy Shevchenko



