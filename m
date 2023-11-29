Return-Path: <linux-gpio+bounces-688-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 807F77FDA96
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 15:57:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C679282F88
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 14:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26DB83526B;
	Wed, 29 Nov 2023 14:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g1DsyNZF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D870A10C6;
	Wed, 29 Nov 2023 06:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701269848; x=1732805848;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gfneZWepAl9jLm0NnKBW/0r/uzscw6oV8aFhIe4Kn6w=;
  b=g1DsyNZFEwwyM4TGZvpPoBnFMaCyUHJ03Xt0I/y0gLfaHhRjLtgu4XAB
   iH7CaGHA7h74Kmf2LALgjwX0qM4EjSF1r9HnNkYhJsZjxWUYMnfxNC3vW
   ooDutVDzJBSAZrgvelYqnvpDg0/j508MYxGwwwEKR/V0d4nKY0VEqDrHg
   taf0T2K0tXqKcl9rYeYX3KnLmJIj2n+clIcfFnjI4e6ivZYGRrfE/oqYp
   1Bg4TAxH6nR26f8s6d82w2p4HchXwHgWWD/3LrbIsO7AcYbpb1OYJypk3
   eFB0Xk+bjGxzwlrXe+Vvry7dZFXNv13t5dP1ke9FrhInEZAIt1cj3jDUn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="378205213"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="378205213"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 06:57:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="762337563"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="762337563"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 06:57:24 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r8M0A-00000000T20-1lUQ;
	Wed, 29 Nov 2023 16:57:22 +0200
Date: Wed, 29 Nov 2023 16:57:22 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 01/10] gpiolib: provide gpiochip_dup_line_label()
Message-ID: <ZWdRUosYLAzXQrTT@smile.fi.intel.com>
References: <20231129142411.76863-1-brgl@bgdev.pl>
 <20231129142411.76863-2-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231129142411.76863-2-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Nov 29, 2023 at 03:24:02PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> gpiochip_is_requested() not only has a misleading name but it returns
> a pointer to a string that is freed when the descriptor is released.
> 
> Provide a new helper meant to replace it, which returns a copy of the
> label string instead.

...

> +/**
> + * gpiochip_dup_line_label - Get a copy of the consumer label.
> + * @gc: GPIO chip controlling this line.
> + * @offset: Hardware offset of the line.
> + *
> + * Returns:
> + * Pointer to a copy of the consumer label if the line is requested or NULL
> + * if it's not. If a valid pointer was returned, it must be freed using
> + * kfree(). In case of a memory allocation error, the function returns %ENOMEM.

kfree_const() ? (see below)

> + * Must not be called from atomic context.
> + */
> +char *gpiochip_dup_line_label(struct gpio_chip *gc, unsigned int offset)
> +{
> +	const char *label;
> +	char *cpy;

Why not "copy"?

> +
> +	label = gpiochip_is_requested(gc, offset);
> +	if (!label)
> +		return NULL;

> +	cpy = kstrdup(label, GFP_KERNEL);

You probably want to have kstrdup_const(). However, I haven't checked
if we have such use cases.

> +	if (!cpy)
> +		return ERR_PTR(-ENOMEM);
> +
> +	return cpy;
> +}

So, how does this differ from the previous one? You need to hold a reference
to the descriptor before copying and release it after.

-- 
With Best Regards,
Andy Shevchenko



