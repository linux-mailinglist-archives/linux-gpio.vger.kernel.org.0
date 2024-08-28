Return-Path: <linux-gpio+bounces-9279-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCCF962BCD
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 17:15:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E1E11C23DBF
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 15:15:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8DD0381AD;
	Wed, 28 Aug 2024 15:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ItcOlTwZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D809319FA94;
	Wed, 28 Aug 2024 15:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724858025; cv=none; b=QsI+Pi+/Xq3s3LCx1omMcdrfAcsJJRci3ubNG3GKlihqqOK0qAGJKabFv1sRIE53T3VqPiOymBrDPl3fnZJqZfJfx2I+vXZd3SYUF53dSarfUNRGUQFZEXFTxJgytPNx46RbOih40upBtLe4Vx3FO8B+cS2+jcLaMUnFolCQHIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724858025; c=relaxed/simple;
	bh=dAlTv6V2dwSE30ICo6InuxrPhS/u84UJAwp4J30Nbj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ilG4LNmjPLIazu1GIN49yLWMFN9xk//oEwyGzi5L4s94mhD/qKklbDDuuzGS8aNT/KBdQ7c7GuDnVTQ9mMVKyQ/42zXnbIEb6IIcIuXBeRk7a9izpN0y+b/n3KnRTnsEMpfXSUDmtWi7HUb708akYZfe+SNqjlcUNvvzSrSlPME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ItcOlTwZ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724858024; x=1756394024;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dAlTv6V2dwSE30ICo6InuxrPhS/u84UJAwp4J30Nbj0=;
  b=ItcOlTwZfCXdMTlIrYGRtZEwF7K8jZm20wnFdgNIsEeYKf1mzjbA/fyD
   r9B33lodsDt6Yrm6wb+utGd2ctTsu2bxM/eN/Hg7gjpNbBQjlvqW3Gtb1
   X1Wq55REDyMYIjjML66Rwnrc+JUUQnnkAXQ7lKqrhTaK1/qHFsQXmvZG5
   VkF98x+zqxsWSg6zCjwq5xicWQCslUMVA7GMY87pr+Zih40CysXuVVb5T
   0xPGsBar8nI4tpqy25ykgg9K6VggUx3YulHn+h+eHPfbzMfn9cocGqkYq
   qAgEvaFzbGrDFXHBgINGYgrKn10ttJfxfLlV8NqXJ6wNiJoT7PrITWTrL
   Q==;
X-CSE-ConnectionGUID: Aszlob1BSEi85ge0tH/6IA==
X-CSE-MsgGUID: QAkgm+R/Q/Gt1V3j0pen6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="34773511"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; 
   d="scan'208";a="34773511"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 08:13:43 -0700
X-CSE-ConnectionGUID: T9qqQNRhR/6koRKmjNge2g==
X-CSE-MsgGUID: VgGMUNwXSMadxJIqyiRdsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; 
   d="scan'208";a="63586246"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 08:13:43 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sjKMd-00000002gbb-1thC;
	Wed, 28 Aug 2024 18:13:39 +0300
Date: Wed, 28 Aug 2024 18:13:39 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v1 1/1] gpiolib: legacy: Consolidate devm_gpio_*() with
 other legacy APIs
Message-ID: <Zs8-o1jnzqkA2Afu@smile.fi.intel.com>
References: <20240828145914.2569187-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240828145914.2569187-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Aug 28, 2024 at 05:59:14PM +0300, Andy Shevchenko wrote:
> There is no reason to keep deprecated legacy API implementations
> in the gpiolib-devres.c. Consolidate devm_gpio_*() with other legacy
> APIs. While at it, clean up header inclusion block in gpiolib-devres.c.

Okay, this one is not applicable as it uses wrong base. I'm about to send a v2
based on next-20240828.

-- 
With Best Regards,
Andy Shevchenko



