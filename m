Return-Path: <linux-gpio+bounces-36669-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +gb4NA4PA2qX0AEAu9opvQ
	(envelope-from <linux-gpio+bounces-36669-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 13:29:18 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4479E51F562
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 13:29:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6FC7C30578A1
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 11:26:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D37C4C77D9;
	Tue, 12 May 2026 11:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nUtKqz0R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FA1389454;
	Tue, 12 May 2026 11:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778585183; cv=none; b=ezi/tmC8PL21FdrmL9mXiwLCyRkgMvilW+Uw6uOqi9E3ntdvJaj5fOfrmBq1LVXe7tPXWYNBsWn+HAd8lvb2HW2AN/N7N+vvKrDsoF1u5S5PBQd91gIXYVvj3PIl/qHclCDiLRiE6DcL103eJdxxGapToQ9aPIBN7ILiZedQHwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778585183; c=relaxed/simple;
	bh=53DBMlKkfiAeBOgRgTQe8lRFc8+g8uGxzl/ji6L+mVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XHKNpINOKwFBjgN86cjNMQ1dEC7VFZnMjxqF2gQh6AGg+umA6Eg2biKa4zfyndGTLZkz0s8YGyRdKldsLg427NXXXxzQac2F7KWVD1bx7ia7bihBOB32WkofR29BNJiqO+Dv13U4RiPejc+137G1kJQaGOKua5f50heH8VIaeU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nUtKqz0R; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778585182; x=1810121182;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=53DBMlKkfiAeBOgRgTQe8lRFc8+g8uGxzl/ji6L+mVQ=;
  b=nUtKqz0RbnbRPya0Pl1y3f9KC4U9uPMOH45FTcEw/i4q+SoYHK6M7ILq
   xE5nSud7KV9NKhVrIFre7V0wGYz/pJiKOl+oYhfpdtSB6Wt4rqDxwgy5B
   6b7g1vPVfRs4TewomfTF2NQZ91VZ3BWBC3O/XSDPuOODf1Ky9thJ9mTja
   s2uoizGq5bzYGBOq/4jh6cIoPmzjXOre0kARtEyCzmYvjZegvW2vU374+
   j61Om/O2X2q9o8XAZow5NlZ2kYOTwsxF8ce6sVZSRIZd3t7zW5zzYrd1Y
   EyYGINzaT75tHU53RA6CLexmUwuLxMLppmus0QUVfz95iMh196Q6P2dLF
   A==;
X-CSE-ConnectionGUID: fN50iNSPQ3mu2r2qffxs+A==
X-CSE-MsgGUID: z+CTFK3sTqCkHuaglj/uSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79512026"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="79512026"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 04:26:21 -0700
X-CSE-ConnectionGUID: ziLjYj4/QpSJWTTVZ++n9w==
X-CSE-MsgGUID: FlPvWD+4QOuKYhoES0hRVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="237983683"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.112])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 04:26:13 -0700
Date: Tue, 12 May 2026 14:26:13 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: linusw@kernel.org, brgl@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, afaerber@suse.com, wbg@kernel.org,
	mathieu.dubois-briand@bootlin.com, mwalle@kernel.org,
	lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org,
	nuno.sa@analog.com, andy@kernel.org, dlechner@baylibre.com,
	tychang@realtek.com, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org, linux-iio@vger.kernel.org,
	cy.huang@realtek.com, stanley_chang@realtek.com,
	james.tai@realtek.com, Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 3/7] gpio: regmap: Add gpio_regmap_operation and
 write-enable support
Message-ID: <agMOVcg38vQ4GxAh@ashevche-desk.local>
References: <20260512033317.1602537-1-eleanor.lin@realtek.com>
 <20260512033317.1602537-4-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512033317.1602537-4-eleanor.lin@realtek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: 4479E51F562
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36669-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ashevche-desk.local:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 11:33:13AM +0800, Yu-Chun Lin wrote:
> Extend the reg_mask_xlate callback with an operation type parameter
> (gpio_regmap_operation) to allow drivers to return different
> register/mask combinations for different GPIO operations.
> 
> Also add write-enable mechanism for hardware that requires setting a
> write-enable bit before modifying GPIO control registers.
> 
> Consequently, update all existing drivers utilizing the gpio-regmap
> framework (across drivers/gpio, drivers/iio, and drivers/pinctrl)
> to accommodate the new reg_mask_xlate function signature.

Dunno if we want per-driver patches (in that case it will be a new name and
callback, conversion per driver, removal old name, and, if required, renaming
back). In any case looks reasonable change.

...

> -static int idi_48_reg_mask_xlate(struct gpio_regmap *gpio, unsigned int base,
> -				 unsigned int offset, unsigned int *reg,
> -				 unsigned int *mask)
> +static int idi_48_reg_mask_xlate(struct gpio_regmap *gpio,
> +				 enum gpio_regmap_operation op,
> +				 unsigned int base, unsigned int offset,
> +				 unsigned int *reg, unsigned int *mask)

In every case, use this logical split.

...

> -static int i8255_reg_mask_xlate(struct gpio_regmap *gpio, unsigned int base,
> -				unsigned int offset, unsigned int *reg,
> +static int i8255_reg_mask_xlate(struct gpio_regmap *gpio, enum gpio_regmap_operation op,
> +				unsigned int base, unsigned int offset, unsigned int *reg,
>  				unsigned int *mask)

Exempli gratia, this one looks illogical, harder to read.

...

> +	ret = gpio->reg_mask_xlate(gpio, GPIO_REGMAP_SET_DIR_WREN_OP, base, offset, &reg,
> +				   &wren_mask);

Ditto. Easier to follow when

	ret = gpio->reg_mask_xlate(gpio, GPIO_REGMAP_SET_DIR_WREN_OP, base, offset,
				   &reg, &wren_mask);

>  	if (ret)
>  		return ret;

...

> +/**
> + * enum gpio_regmap_operation - Operation type for reg_mask_xlate callback
> + *
> + * This enum is used to distinguish between different types of GPIO operations
> + * so that the reg_mask_xlate callback can return the appropriate mask for each
> + * operation type.
> + *
> + * Value operations:

Have you checked the rendered text (HTML, PDF)? I believe this will look awfully wrong.

> + * @GPIO_REGMAP_GET_OP: Mask for reading direction to detect if GPIO is input or output.
> + *                      Used in gpio_regmap_get() to determine the GPIO direction.
> + * @GPIO_REGMAP_IN: Mask for reading input value. Used when GPIO is configured as input.
> + * @GPIO_REGMAP_OUT: Mask for reading output value. Used when GPIO is configured as output.
> + *
> + * Output operations:
> + * @GPIO_REGMAP_SET_OP: Mask for setting GPIO output value.
> + * @GPIO_REGMAP_SET_WITH_CLEAR_OP: Mask for setting/clearing GPIO using separate registers.
> + * @GPIO_REGMAP_SET_WREN_OP: Write-enable mask for output operations. May be used to enable
> + *                           writes to protected registers.
> + *
> + * Direction operations:
> + * @GPIO_REGMAP_GET_DIR_OP: Mask for reading GPIO direction (input/output).
> + * @GPIO_REGMAP_SET_DIR_OP: Mask for setting GPIO direction (input/output).
> + * @GPIO_REGMAP_SET_DIR_WREN_OP: Write-enable mask for direction operations. May be used to
> + *                               enable writes to protected direction registers.
> + */

-- 
With Best Regards,
Andy Shevchenko



