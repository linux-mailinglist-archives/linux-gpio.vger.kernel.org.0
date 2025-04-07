Return-Path: <linux-gpio+bounces-18322-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C07A7D882
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 10:51:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6190617427D
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 08:50:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F88B225A3B;
	Mon,  7 Apr 2025 08:50:38 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BBB211460;
	Mon,  7 Apr 2025 08:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744015838; cv=none; b=Lat6+9pqPW1Q6fXxgUvDPRmjydOp6OTPtY2pbSH5Em5AfNQY+E0w2W3RGjwB5crQD49pwl9Twxi2rXTDCr50TLmdpD1z+115ITuparLuugsRBlI4k6e615uBE797SSg2hCx3lLgRLpgqcSXSuyD35xMKfAGZ5g7jwvcxWHliVL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744015838; c=relaxed/simple;
	bh=Pzt5wycJlkf+e9wpxWW1NN9vBkIs1eaZ3Ka2d8Lwj+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IKiQucZ431mNMCU//rDNeDB5jh5sEFAOlEGL9hS4UQ0bjj7n7oJbZ7sxo+yJRNmow3FaBcpgbQ0b3hDvpHinHj9bPq3+otIF2w8oFQzQjSevvb7DH9dYSCDcEx0CWIam4v/cD1BZGidJa/YEfrRvDjy1AZwuyMEUo+EKM/jpj0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: PA7LLTc+TQK9RqUDehrywQ==
X-CSE-MsgGUID: kTOCl/7DSwu+YYzC4Flc2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="45278748"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="45278748"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 01:50:34 -0700
X-CSE-ConnectionGUID: 54jyaMuLQaiFeBAgQfsjog==
X-CSE-MsgGUID: 02H2fUevQ/ioepiy0FFQaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="132739344"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 01:50:31 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy@kernel.org>)
	id 1u1iBY-0000000A0Zw-2oac;
	Mon, 07 Apr 2025 11:50:28 +0300
Date: Mon, 7 Apr 2025 11:50:28 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Peter Tyser <ptyser@xes-inc.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 01/12] gpio: dln2: use new line value setter callbacks
Message-ID: <Z_OR1HWJMHipH0U9@smile.fi.intel.com>
References: <20250407-gpiochip-set-rv-gpio-part1-v1-0-78399683ca38@linaro.org>
 <20250407-gpiochip-set-rv-gpio-part1-v1-1-78399683ca38@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-gpiochip-set-rv-gpio-part1-v1-1-78399683ca38@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Apr 07, 2025 at 09:13:10AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.

...

> -static void dln2_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
> +static int dln2_gpio_set(struct gpio_chip *chip, unsigned int offset,
> +			 int value)

It gets even shorter. If you are fan of 80 characters from last decade,
it still fits.

-- 
With Best Regards,
Andy Shevchenko



