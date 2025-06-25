Return-Path: <linux-gpio+bounces-22184-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 05270AE8317
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 14:46:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A6A34A531A
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 12:46:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F03AD26156F;
	Wed, 25 Jun 2025 12:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SGFjyBvH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD2E25C711;
	Wed, 25 Jun 2025 12:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750855566; cv=none; b=dIc48kKNef+rZFS/RUsMH6Vd52XJ+uXAVxec31todKM7UCC0ukiqo3bsxTlb0X1ucY8CuU01ZdHcZlembQqM2Eb17aqQpS88XDES4WG3n5l/6ifiZro6/bXpzIjS/O+oekrDCbqetHTcID+x99rK2viDfGxP67p8Zu4FmC/rRbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750855566; c=relaxed/simple;
	bh=H2Q5pv8/n1x+u1urkiz+OyiZd1H1/C8DF5+taITB/dQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EIU42x3Et68+YdVx5svdmHr8umwZ6JWnBS5xm737PsMTcIPQV3k/eMO/hfsz2kJpVun6Da/Y8vNWaVxan1k6eEVU0DU88YFvZTec4gbarWW7VMx2oCbBb0eSSnvBEh3stpdpNgVCDelLYgPPsccbfJBJ+dY2/9Hj2if89yCK4Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SGFjyBvH; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750855565; x=1782391565;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=H2Q5pv8/n1x+u1urkiz+OyiZd1H1/C8DF5+taITB/dQ=;
  b=SGFjyBvHYZyp1+Pj80VuazIyIe4+NXu/RHEYLH8RbCBg8g4gFVuoVl/S
   NIJAH2OEsCPcaXBJ3LSQNdDvjfHz3/7PbEN/xOwg9WcRMaQUMg2YA1byI
   EQrVUt/T69x+/501sXGOu2GTHrQ8znO21Nxr42HBI/DwxO1Hkt3VUqWYl
   cJGxU9jznsFBtd3kZFrPrlnaVGEClAJB99OprKb/NWLExGwZ8cklzgOXo
   hfDUAb29w4ZFaBRv8J4oa9VWGqqbZ/Ho8/6hWforADfuSzhpjgCMtAfyg
   mXxzF644MLqnWKKUW5Mp9KqdC/MHLVTxaETz2epQ5COi9EuChMGIjoxid
   Q==;
X-CSE-ConnectionGUID: whiPltgcQeSLFtqXb5zUrg==
X-CSE-MsgGUID: wzyvLOQ+Tfe+93x+GLPy2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="64183624"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="64183624"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 05:46:04 -0700
X-CSE-ConnectionGUID: BJ7SMdQuSVmu4Q7VYDrZEw==
X-CSE-MsgGUID: OM33N+tETeSr9vYH4S1pZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="151629821"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 05:46:01 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uUPVl-00000009lm4-01Fh;
	Wed, 25 Jun 2025 15:45:57 +0300
Date: Wed, 25 Jun 2025 15:45:56 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andy@kernel.org>,
	Thorsten Scherer <t.scherer@eckelmann.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 11/12] gpio: tangier: use new GPIO line value setter
 callbacks
Message-ID: <aFvvhAo9BRFpy7Uy@smile.fi.intel.com>
References: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
 <20250625-gpiochip-set-rv-gpio-round2-v1-11-bc110a3b52ff@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625-gpiochip-set-rv-gpio-round2-v1-11-bc110a3b52ff@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Jun 25, 2025 at 12:33:34PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



