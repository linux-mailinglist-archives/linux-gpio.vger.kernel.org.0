Return-Path: <linux-gpio+bounces-18979-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C20A90AC8
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 20:05:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A35CA188BA48
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 18:05:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ED38219A75;
	Wed, 16 Apr 2025 18:05:14 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7B6217712;
	Wed, 16 Apr 2025 18:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744826714; cv=none; b=h3Jwm8Y1myW+KB4eYn7dY3INS5YdZ0/SOEMAzchdZ2y6T8ObKuEVvc+LAx6jxX6cNtWhiCcSThu00LX2vhRXS5SC1aNLzC/N8CTwEyQVGqQeof31//cj6BlHHD3Ya9rH9bWDmLn9yrvRAVfwNL8QzqcIg6QGXUwfEp0VQcQ8I1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744826714; c=relaxed/simple;
	bh=utxXC83Mt8uWnMQFYqlctgBj9oEN/njFfKMPjo/tbz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MMMTHyD3NmgrO35m4KutN3459At10zhplbfstwv7f6DbAaDH6rTg+8vRqvx62StpWuEvRnAV0+puwLPXavdRrEPiCD2NQ7EWXAXdwkuTUyZmDPtsNI9XaswbEPvqn1TS78zFwUerPvzdhRqZvhpZRf1II3JJY8fnHVLv8htsObU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: NNhEtVbVRU+qHlvk3rlwkg==
X-CSE-MsgGUID: ssayU+bpTcaxQuBn39lIbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="71781787"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="71781787"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 11:05:11 -0700
X-CSE-ConnectionGUID: R20vEJt3TlmyohtIwNJocg==
X-CSE-MsgGUID: 33M2/ymAQIeRNRGAvZUUoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="130416755"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 11:05:09 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy@kernel.org>)
	id 1u578E-0000000CvvZ-1tEa;
	Wed, 16 Apr 2025 21:05:06 +0300
Date: Wed, 16 Apr 2025 21:05:06 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Peter Tyser <ptyser@xes-inc.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 00/12] gpio: convert more GPIO chips to using new value
 setters
Message-ID: <Z__xUsSeYNQAvnNp@smile.fi.intel.com>
References: <20250407-gpiochip-set-rv-gpio-part1-v1-0-78399683ca38@linaro.org>
 <174481898215.8191.2166208947252160548.b4-ty@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174481898215.8191.2166208947252160548.b4-ty@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Apr 16, 2025 at 05:56:24PM +0200, Bartosz Golaszewski wrote:
> 
> On Mon, 07 Apr 2025 09:13:09 +0200, Bartosz Golaszewski wrote:
> > struct gpio_chip now has callbacks for setting line values that return
> > an integer, allowing to indicate failures. We're in the process of
> > converting all GPIO drivers to using the new API. This series converts
> > another round of GPIO controllers.

> [07/12] gpio: graniterapids: use new line value setter callbacks

> [12/12] gpio: ich: use new line value setter callbacks

I believe I have taken these two via my tree. Can it be like this?

-- 
With Best Regards,
Andy Shevchenko



