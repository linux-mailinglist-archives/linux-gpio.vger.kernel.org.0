Return-Path: <linux-gpio+bounces-19179-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9BFA980CF
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 09:28:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2351017E2D3
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 07:28:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32A3326A087;
	Wed, 23 Apr 2025 07:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UrxlmXVK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CDE1DEFE7;
	Wed, 23 Apr 2025 07:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745393303; cv=none; b=Hrhe5g3DQqjQo/bYiAcX3acv0xnLbWfc40VpzfsRgNK3XsWDSKArdlIxfl3N6Gg15jfkLSdx/GCtAa8x5/nYgqLWPKmUMMzTzaD25FYypR80tyh63fHQUIzjT5c2e5X3OUsZjY08sGiMZTn4R4oO5v8NGYuhGSdZOju1XQXYKl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745393303; c=relaxed/simple;
	bh=4wTnwK7o8uegywRLEmUdj8ibpoPv/EFkeYiSplsAtMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mDvNAh15hd39thPmScjxWldzVetzXXuw2Vn1YuZGJ8Aw8W/pKRyNRW4EEgq7rvUhAz2Xfbx3XfrW98d4pSMOvAk85jz/lp7m3omd/M5cnjbJkhDFwg0LZDnZjnbDzNvdYW69txx7hRF9v58UQttDj0fNPKXVSbKIZtb3yTQOVOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UrxlmXVK; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745393301; x=1776929301;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4wTnwK7o8uegywRLEmUdj8ibpoPv/EFkeYiSplsAtMI=;
  b=UrxlmXVKqSqxls1QBlMKydaMziZAJ7bxdFHCs+6U6SNNquavRRS3EX4O
   mrgwsLwaqGPmZ6g4irRcXljbT34ZkxaELaX6tPYRB9dfw4oRQnawfYrMj
   b/12BJXkIKMmWREtqOQGG2LaqVxBY4KdbmUXBJkB8/Ir/xmqckQZXCwTr
   DTiXp+b8yFzljo5Fz8HYz5P90TmKLaeusrVodHRnv7hvm75vXl4z//kzw
   8Hr8CvU0G6/lpBJJ5ZXhIwJLRyCkqVcJI8Mbx2ipK7CbfFijOqGCE8RqD
   WtE0OCCJdh6lQeZzG5wkQ27aeyzqOfyvWuqCtFexJXDeBhXPjr39laxPp
   A==;
X-CSE-ConnectionGUID: 6WGU9qsTQiWxp40utHMejA==
X-CSE-MsgGUID: Smn29sEkQWK+dIFF6nhhPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="47072323"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="47072323"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 00:28:21 -0700
X-CSE-ConnectionGUID: gMtjzeN7RMKoxzuh9aGefQ==
X-CSE-MsgGUID: WX3s9Va4SCKJaRqAFfR4zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="137314255"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 00:28:18 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 4648411FC44;
	Wed, 23 Apr 2025 10:28:15 +0300 (EEST)
Date: Wed, 23 Apr 2025 07:28:15 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Lixu Zhang <lixu.zhang@intel.com>, Yinbo Zhu <zhuyinbo@loongson.cn>,
	linux-gpio@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 08/12] gpio: ljca: use new line value setter callbacks
Message-ID: <aAiWj7QFQMtzjLww@kekkonen.localdomain>
References: <20250423-gpiochip-set-rv-gpio-part2-v1-0-b22245cde81a@linaro.org>
 <20250423-gpiochip-set-rv-gpio-part2-v1-8-b22245cde81a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423-gpiochip-set-rv-gpio-part2-v1-8-b22245cde81a@linaro.org>

On Wed, Apr 23, 2025 at 09:15:10AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Thanks, Bartosz!

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus

