Return-Path: <linux-gpio+bounces-27937-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7FFC2A654
	for <lists+linux-gpio@lfdr.de>; Mon, 03 Nov 2025 08:48:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64CBC3B0B2D
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Nov 2025 07:45:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 853D123EAB8;
	Mon,  3 Nov 2025 07:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FyezRC6m"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10653EEC0;
	Mon,  3 Nov 2025 07:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762155913; cv=none; b=HXuZbbmWupr6w9qxL72vt1uinRItc+HeahJotxiJhbIONIGFpOlAKcr8hbMA6xvd/26P79thGCOVpAHr/7iKTYslXa1gZZOOwoqnZo7hgJuttrNb2UVzr8M2rY4cP7OJgK8pkRUFad871JhcBoXpqHY22lkmtJ/dcRFTfllARcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762155913; c=relaxed/simple;
	bh=N/vD6EsoJxXNYruo5Bv5lyi/PWy6Ab33FALdv7PLr7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PCT6mqgdEfzs1exMApqEIToxIXs8Ar0iF43gbPlMr4h7lTi+mwIy5Zo0309lMYAxMwmQqxBtJdTFkaygbftf38aLiwz0euvVdrV7j3PWjS/B7z0zFSbqNobVNAUxyCwwJ1D452pb0AN/XdFibi9ZoI3AFkcRofSUjUoxUf3B1dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FyezRC6m; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762155911; x=1793691911;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N/vD6EsoJxXNYruo5Bv5lyi/PWy6Ab33FALdv7PLr7c=;
  b=FyezRC6mjB7nBZho6Z3Y9ynHcE4RHUoQPBsOGavie0Wvn1y5XuXYGQw8
   zmUzXJy3hM8k9R7gm0CZDRVeoK+QwDPi21G2wrx4FiTI19RRz2GsMxB8Z
   iJPQ2hiJ86EQlY45QWjDjlbxEeu1caGNqLkbADVXm52IbXTW8CZWC7Mqh
   QA7iv3DemDRhGwmvZ9m6iSlJIZsmFoyHBGdnYELTkw+IEKM3o1Ku141xk
   7fA8Sh6BRNFRPXZ87IizSbNAbZ7cQXO+HeJ/EG3E2bN7y/L7eiqbHthmA
   tqFaMu8+ap7cDHU54UsJbc5cD5a54hjSj1elX2CeD6AeVon1o0fw73NXg
   A==;
X-CSE-ConnectionGUID: zp+thio7R/6qD9H2ghUx8Q==
X-CSE-MsgGUID: rGRSWKPHTcq9rzKJW3Dfzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="63922136"
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; 
   d="scan'208";a="63922136"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2025 23:45:11 -0800
X-CSE-ConnectionGUID: sqTbvWXiSeqCKp1t1FzOFQ==
X-CSE-MsgGUID: 9SE2x2E1RGG3M9w8wXHkRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; 
   d="scan'208";a="186751767"
Received: from smoehrl-linux.amr.corp.intel.com (HELO ashevche-desk.local) ([10.124.220.216])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2025 23:45:09 -0800
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1vFpFR-000000054tK-1uh5;
	Mon, 03 Nov 2025 09:45:05 +0200
Date: Mon, 3 Nov 2025 09:45:04 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] gpiolib: fix invalid pointer access in debugfs
Message-ID: <aQhdgI33_f-tfHWu@smile.fi.intel.com>
References: <20251031150631.33592-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031150631.33592-1-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Oct 31, 2025 at 04:06:31PM +0100, Bartosz Golaszewski wrote:
> 
> If the memory allocation in gpiolib_seq_start() fails, the s->private
> field remains uninitialized and is later dereferenced without checking
> in gpiolib_seq_stop(). Initialize s->private to NULL before calling
> kzalloc() and check it before dereferencing it.

...

> static void gpiolib_seq_stop(struct seq_file *s, void *v)
>  {
>  	struct gpiolib_seq_priv *priv = s->private;
>  
> +	if (!priv)
> +		return;

My preference is to have the assignment be decoupled in such a case:

	struct gpiolib_seq_priv *priv;

	priv = s->private;
	if (!priv)
		return;

This will prevent from doing subtle mistakes (as dereferencing before check and
so on) in the future. Not that I expect this function to grow that way, but still...
always keep in mind that somebody who is not familiar with the code may take the
piece as high standard in the kernel and copy to their code without much thinking.

>  	srcu_read_unlock(&gpio_devices_srcu, priv->idx);
>  	kfree(priv);
>  }

-- 
With Best Regards,
Andy Shevchenko



