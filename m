Return-Path: <linux-gpio+bounces-18323-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D5595A7D88B
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 10:52:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 594BD1892AD6
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 08:52:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77256229B28;
	Mon,  7 Apr 2025 08:51:46 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6CC225A3B;
	Mon,  7 Apr 2025 08:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744015906; cv=none; b=LJjwCNFl5UzwIubnvVo6GftO/YfMX209OgZztYKI/vHcqqRqj7Zfu0b6xrjCXKGQLaRzXCOMtegKY7QZQ8zu0So7+QAjdtnwTpZuUTW/dksFC2wsYDTHrgWYyI11InmaiMMO4HiVUImyMLpiKhipxJvJ9Uk8l1asX8ebrOyvNcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744015906; c=relaxed/simple;
	bh=TgwlTKegCo45TJs8/oF3ACvzDA5PXJN4aq2xQfZnIYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tbv5u3Y48kaK0FguK9vPvvUgLka567i9YrgD2YlNTzmPjEz0hIuw0Rf8+JeQp+oq3oQpFKfpW9D8kfGrv5oppixdMzqE0wrWme5cEdWf/Rjrs1sGnAIu5aLSaGcm95JBS7VqSuXJFeWsu6LRzqdJUoXn2SR50tBYyd113AmrEtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: EN6JY2kwRLmykHmmZYzEIw==
X-CSE-MsgGUID: 16rxFEDtSUmZ9lUWnH8nVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="44635208"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="44635208"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 01:51:44 -0700
X-CSE-ConnectionGUID: J+aKm/sYSpS4GRNWS+Uyww==
X-CSE-MsgGUID: zz2q+2knTfGKuED9urpMLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="132859997"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 01:51:41 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy@kernel.org>)
	id 1u1iCg-0000000A0ap-2Gz1;
	Mon, 07 Apr 2025 11:51:38 +0300
Date: Mon, 7 Apr 2025 11:51:38 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Peter Tyser <ptyser@xes-inc.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 04/12] gpio: exar: use new line value setter callbacks
Message-ID: <Z_OSGmIk4AH5xtdp@smile.fi.intel.com>
References: <20250407-gpiochip-set-rv-gpio-part1-v1-0-78399683ca38@linaro.org>
 <20250407-gpiochip-set-rv-gpio-part1-v1-4-78399683ca38@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-gpiochip-set-rv-gpio-part1-v1-4-78399683ca38@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Apr 07, 2025 at 09:13:13AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.

...

> -static void exar_set_value(struct gpio_chip *chip, unsigned int offset,
> -			   int value)
> +static int exar_set_value(struct gpio_chip *chip, unsigned int offset,
> +			  int value)

It can be located on one line (81 characters).

-- 
With Best Regards,
Andy Shevchenko



