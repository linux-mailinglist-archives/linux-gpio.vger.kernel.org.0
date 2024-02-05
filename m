Return-Path: <linux-gpio+bounces-2978-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B018E849C28
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Feb 2024 14:47:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B595284C17
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Feb 2024 13:47:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E77A208CF;
	Mon,  5 Feb 2024 13:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MhtDcma8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A65F210E6
	for <linux-gpio@vger.kernel.org>; Mon,  5 Feb 2024 13:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707140860; cv=none; b=SZviWainvBiJOOwP/nrbTS6N75nQ1Xt7mM2vjwCLAE30SCni+6XnDgMMbc1vw24/1oRA/1LiqHgZiJlHv5i/za7Cw+9dAPvTY7/5kYqWUi27hlrQkDADwgfejWg7xx/QvDiy1T6sijZLWIo5XeN9fp9Mlf9QvRO1d0z+/3ombzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707140860; c=relaxed/simple;
	bh=RtTlx6KHa14TGuCYGKyp4jsnm9AKJ1lz1W/UGueHRbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sjb2QtBIAhwhGd7BnYzzbiCFaH2Y5+PcKomPf+9Tax6vTvfCfo4qDvMTqbzAPH7XqysGGikLemCSln51WgfveEM0pcr6kMN1VdUDUEgwn6F2XBUt2QkqqAqdIY8v1fzbUtZANYaIkrkgbDugU27sDnJliN3G3sZdYseQsvUleNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MhtDcma8; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707140858; x=1738676858;
  h=resent-from:resent-date:resent-message-id:resent-to:date:
   from:to:cc:subject:message-id:references:mime-version:
   in-reply-to;
  bh=RtTlx6KHa14TGuCYGKyp4jsnm9AKJ1lz1W/UGueHRbE=;
  b=MhtDcma8dr2NKmm1FqSzduYaOJ5yIChxFL6Ipl+4wV2BcQKsUzt7PGzW
   gjcHfNwaZVCSu0C6h26Vv/5FK5kGq3pFILckdpZMguqmRJc2Q0DDD7hUy
   WW/Fwcas/l/ZOCQR/aYJt3uB5VZ8PZ+jxpka7byrLCkAgb8NcBHwzEFqL
   PkfHSiGkoc4qkESAGDEfQcITqBz5ajSRdmy7EKl6Flaw7oGB7C0vmL8bT
   zVB8/XTDJhyfjW+r74BH6RyrS418nujeuQ/xVAFNWrbPOE+Mh9oXvJAAr
   P55O3loNgBTPbfW7r6/NTXw6eedcCjNz4ezeVl7BqagMrdusTN637QWfz
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="430696"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="430696"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2024 05:47:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="909300341"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="909300341"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2024 05:47:35 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1rWzJt-000000025oj-32N4;
	Mon, 05 Feb 2024 15:47:33 +0200
Resent-From: Andy Shevchenko <andriy.shevchenko@intel.com>
Resent-Date: Mon, 5 Feb 2024 15:47:33 +0200
Resent-Message-ID: <ZcDm9RKHsftOqc7G@smile.fi.intel.com>
Resent-To: brgl@bgdev.pl, linux-gpio@vger.kernel.org
Date: Mon, 5 Feb 2024 14:22:03 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>, Alex Elder <elder@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Wolfram Sang <wsa@the-dreams.de>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 17/23] gpio: reduce the functionality of
 validate_desc()
Message-ID: <ZcDS60dB39y-B6WR@smile.fi.intel.com>
References: <20240205093418.39755-1-brgl@bgdev.pl>
 <20240205093418.39755-18-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240205093418.39755-18-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Feb 05, 2024 at 10:34:12AM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Checking desc->gdev->chip for NULL without holding it in place with some
> serializing mechanism is pointless. Remove this check. Also don't check
> desc->gdev for NULL as it can never happen. We'll be protecting
> gdev->chip with SRCU soon but we will provide a dedicated, automatic
> class for that.

...

>  void gpiod_free(struct gpio_desc *desc)
>  {
> -	/*
> -	 * We must not use VALIDATE_DESC_VOID() as the underlying gdev->chip
> -	 * may already be NULL but we still want to put the references.
> -	 */
> -	if (!desc)
> -		return;
> +	VALIDATE_DESC_VOID(desc);

IIRC we (used to) have two cases like this (you added one in some code like
last year).

-- 
With Best Regards,
Andy Shevchenko



