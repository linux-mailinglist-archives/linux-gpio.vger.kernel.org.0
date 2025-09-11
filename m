Return-Path: <linux-gpio+bounces-25933-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5F0B52A7F
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Sep 2025 09:50:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 107E8189B7FB
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Sep 2025 07:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3571226CE02;
	Thu, 11 Sep 2025 07:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cYTD3Z+j"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80379267B7F;
	Thu, 11 Sep 2025 07:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757577034; cv=none; b=fbDw3ZLCkEVmr7W8g10QW7ra4aIFl5cXKsGYlFynd0m9vWS5l7kAwe6dMvCcmFMspxJh8n97O97HR6o0ek9wKwOQ88to/ZmzdGowYuRHHaxumukuB44XtaxOnyJbBe5hZ+Rg5tubB64HvBabp9OQ9Ga6hDKDXWBwJQJlIAgOOgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757577034; c=relaxed/simple;
	bh=m30L7S1WvoRggLHv6LreiIlctXHF+XJ1XKVdT0+e9qo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cx1i5Aus6eO3UnCtDVA+OpXxpr6hC9l/RRHJv2x2PyzAPC3JMUn0CvdIIklcNHT68wJYD3OAgfwZSkEmrfSP0iFgPFDd10IJZaMdZxhSHpA3cL9veWDL7VrH9peOwUabEAjOeSWZuQegfEjziuPxPBrHLFyHwd7qT/Hh6S9ADlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cYTD3Z+j; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757577033; x=1789113033;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=m30L7S1WvoRggLHv6LreiIlctXHF+XJ1XKVdT0+e9qo=;
  b=cYTD3Z+jVrnTnd+ax8CniyL9wCCIrU39kQ2kCsqPB86fHwq/dodoLqsM
   7wvrTYNaLhLZkp7uiB66+DN5wRqDWIACq7ROnFZilW9nBqbmePNYsRagU
   zIe26nDcheavVzEE15kBP0lXFJXLtUcs8/RNgigp2akp5dF1OHRj9a7Wq
   gwE+RkP75WeEhjgNhTTzhp6SIFWbK/muwPdgCr7ABAKI8/HT6n5he//Pv
   U1mwujWx5zTG8J5jh9ldzFFxdgCt1AVGyvVY05jGr1EQjUVsrgICxk6nb
   buF//Ceghj+IR0xkN9PIHSrMwc0+q1kddeGvQvqzJwS9JYmapuDvwCRyf
   Q==;
X-CSE-ConnectionGUID: 9iNcqjASRm+TBvYVltk7+g==
X-CSE-MsgGUID: 3SifTtzVTWmL+zXuclYbtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="58941625"
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; 
   d="scan'208";a="58941625"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2025 00:50:32 -0700
X-CSE-ConnectionGUID: /rkAzoZPQPW19fuKTvUXuA==
X-CSE-MsgGUID: uzsJIT7GTJKG20+iNoc2mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; 
   d="scan'208";a="178821912"
Received: from smile.fi.intel.com ([10.237.72.51])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2025 00:50:23 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uwc4R-000000022QJ-0Efr;
	Thu, 11 Sep 2025 10:50:19 +0300
Date: Thu, 11 Sep 2025 10:50:18 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Lee Jones <lee@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	=?iso-8859-1?Q?Cl=E9ment?= Le Goffic <legoffic.clement@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	James Cowgill <james.cowgill@blaize.com>,
	Matt Redfearn <matt.redfearn@blaize.com>,
	Neil Jones <neil.jones@blaize.com>,
	Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Yang Shen <shenyang39@huawei.com>, Imre Kaloz <kaloz@openwrt.org>,
	Yinbo Zhu <zhuyinbo@loongson.cn>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com, imx@lists.linux.dev,
	linux-unisoc@lists.infradead.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 0/3] gpio/pinctrl/mfd: use more common syntax for
 compound literals
Message-ID: <aMJ_Ohp5YtYNFnYV@smile.fi.intel.com>
References: <20250910-make-compound-literals-normal-again-v1-0-076ee7738a0b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910-make-compound-literals-normal-again-v1-0-076ee7738a0b@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Sep 10, 2025 at 09:25:44AM +0200, Bartosz Golaszewski wrote:
> As discussed[1] with Andy: it's probably better to use a more common
> syntax for compound literals so fix the commits that converted GPIO
> chips to using the new generic GPIO chip API and make them explicitly
> spell out the type they're initializing.
> 
> Each commit in this series can go directly into its respective tree:
> MFD, pinctrl and GPIO.

Thank you! All look good to me,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

> [1] https://lore.kernel.org/all/20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org/

-- 
With Best Regards,
Andy Shevchenko



