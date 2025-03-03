Return-Path: <linux-gpio+bounces-16909-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 672FBA4BCE0
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 11:50:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 229D2171F9E
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 10:49:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15E831F3BA4;
	Mon,  3 Mar 2025 10:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PE+n11FZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6801F30CC;
	Mon,  3 Mar 2025 10:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740998973; cv=none; b=csZ88eY2SRiMyzFKdu7qKsycAzb9BfcK5V23UcQJGQ51Otn/gM699VHLFVaSlttCgtmqK1ijcn7jtDLIAn5S4IdOewowyJmqfUZkYwVaUxhSXbfXmxqx/4/sxq+XnthdPpgNoymRyAyQY7zgS19H2EmX+Ds2Uh3U0BLMjm7mrRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740998973; c=relaxed/simple;
	bh=/yqduZ+R0gLNCbq3I1AYJKs+bEIfhUC+wAPOaxmWpOc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JRqPczFfXBZNwAf8lJehqMykZ5h4/nJpR9TzjMVWjbhCP2LtgYv5NfjaAzJw6IkX0re1J1AJV9SxPTEqDa0yWZsj46+jJTNMQvWNXF7GD2G53KTgeW5xCh9FrI8lyzTZ++uD/dUhi8RCLyFVop1H5la21mrFds0pV2xU9p4YYPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PE+n11FZ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740998973; x=1772534973;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/yqduZ+R0gLNCbq3I1AYJKs+bEIfhUC+wAPOaxmWpOc=;
  b=PE+n11FZ8Lph7kTrYWqxynjYMgSprD4typzCNvfboEppaKxPnN6dKL57
   6/utmEkXzZg70n5+aenCXyuTzS0AJ41ihzUtn8J3V/PFjqBZU5tIT8z4i
   K50rnhJM1ry898/X7Vq+npnXiYbPOe4s7+jYEJm9HKRzI8ZV/nRk3VPQo
   alN2g8FMtrPd5rWanm27K79HL9aMCs52jfm7gHjzVcw5WjMoJsVCbNIG0
   BDhrk5PxlgwEJ8kiH13fnwuLRmqU2AXF8dOaboJKzlJZVMdl/XyXtwPdx
   ZgjpNV+fUaFUOVAZDALlFA/M41f+/kjw5oVoJvecUWJ+EtyxoKt0QNrtQ
   g==;
X-CSE-ConnectionGUID: 8JRcponKRfahF7zNy4JYdw==
X-CSE-MsgGUID: teDR0GrzTu6TSHs7+r9DwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="53258112"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="53258112"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 02:49:31 -0800
X-CSE-ConnectionGUID: ZuM9/BHDTTaBKGKDnCniHg==
X-CSE-MsgGUID: iy8IRePER4qB30Qd3C3Z2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="118002295"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 02:49:28 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tp3MT-0000000GmkM-1Kpg;
	Mon, 03 Mar 2025 12:49:25 +0200
Date: Mon, 3 Mar 2025 12:49:24 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Zijun Hu <quic_zijuhu@quicinc.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Raag Jadav <raag.jadav@intel.com>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v2 0/3] gpiolib: finish conversion to devm_*_action*()
 APIs
Message-ID: <Z8WJNPrD6033anWw@smile.fi.intel.com>
References: <20250220162238.2738038-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220162238.2738038-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Feb 20, 2025 at 06:20:25PM +0200, Andy Shevchenko wrote:
> GPIOLIB has some open coded stuff that can be folded to the devm_*_action*()
> calls. This mini-series is for that. The necessary prerequisites are here
> as well, namely:
> 1) moving the respective APIs to the devres.h;
> 2) adding a simple helper that GPIOLIB will rely on;
> 3) finishing the GPIOLIB conversion to the device managed action APIs.
> 
> The series is based on another series that's available via immutable tag
> devres-iio-input-pinctrl-v6.15 [1]. The idea is to route this via GPIOLIB
> tree (or Intel GPIO for the starter) with an immutable tag for the device
> core and others if needed. Please, review and acknowledge.

Bart, I know it's still 2 days left till the two-week ping time, but since we
are at rc-5 and this may affect other subsystems I gently ask for your
Ack/Review and I push it to my branch for GPIO (as it has dependencies which
are already in my and a few other trees).

-- 
With Best Regards,
Andy Shevchenko



