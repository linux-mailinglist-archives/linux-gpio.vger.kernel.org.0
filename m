Return-Path: <linux-gpio+bounces-27805-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C355C1A195
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 12:45:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7DA664E9DF1
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 11:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8363C335095;
	Wed, 29 Oct 2025 11:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QLmtwfsc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A565732ED39;
	Wed, 29 Oct 2025 11:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761738304; cv=none; b=glAIXSZvCx2pVaJRQ+mChk6Hdytds83TT4FXq9Ksru0dzqihF+b4dfWyioJL2eEPZHYb6gY1U6VXTzydZN1/D5JDsOkl90q8tYdGwXiPqiH6qU3nzFbwEABGDhhjleEh7CKbHGQnlvJokUcFE2uiGFUngPNoEYZBUqLOqoYQx0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761738304; c=relaxed/simple;
	bh=6XSaKopHyy8KU2O32dbHyC4KZpWAHo6sZdtoZmPCYlE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=emKzQmOxcJYQhuN16ija9MHWSuNB9MU0syRbXAhnkAyFUo11KD/TV8FFLqOIj/LAgs/Ql7VWu+F0QhjflCu/zo/BLt1S01+GIvP5sRkaNkPrTcCSg8bqCQAA3VKCQLhp8ED93SqmNL1XGukQtJBalngBfdbx1jk2H54OFagnI98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QLmtwfsc; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761738303; x=1793274303;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6XSaKopHyy8KU2O32dbHyC4KZpWAHo6sZdtoZmPCYlE=;
  b=QLmtwfscwSthUV14rIhll3wzlhxtOa4H6GAiYzYyZ8+caOg88swyH0yf
   MNpQlc+ABkFRLaJVWzNaV+ShhDw0ojL0rOoFlCkJ3/gF3lsfvDXxHWApF
   NnZRRdU1fiMz/xdegsMH4ujdJ8vPxomlG//HAPFDh5eSJeo0y4cU0Raoy
   uth+pRt7GhhDOmcdWb7FMSarylS0MBxPc83abvGKetDOA/r4X4szjem8Q
   e1C5gvyS+DIue1oKc5A7u7iQYx5v4W6AaTRAfLD8ZSr9xsvMMd/oo0Dpt
   XhwzVRdtwVJwfxKLk4iZfk8/BZ2Rmh6vnaII4zzVUwZ/ae8bjugFyg2uW
   A==;
X-CSE-ConnectionGUID: kFmTePKPT/quZy+BCsHVYw==
X-CSE-MsgGUID: m21KW/qiS56RkPtxbs6BUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11596"; a="64006762"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="64006762"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 04:45:02 -0700
X-CSE-ConnectionGUID: h7d57gFvQ465lpC0qpJFAQ==
X-CSE-MsgGUID: BntByR5dSrqcItPn9r5Fsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="186093336"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.244.248])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 04:44:56 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1vE4bl-00000003bE5-1ZTo;
	Wed, 29 Oct 2025 13:44:53 +0200
Date: Wed, 29 Oct 2025 13:44:53 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andy@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v3 03/10] gpiolib: implement low-level, shared GPIO
 support
Message-ID: <aQH-NcXry6_IlqXQ@smile.fi.intel.com>
References: <20251029-gpio-shared-v3-0-71c568acf47c@linaro.org>
 <20251029-gpio-shared-v3-3-71c568acf47c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029-gpio-shared-v3-3-71c568acf47c@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Oct 29, 2025 at 12:20:39PM +0100, Bartosz Golaszewski wrote:
> 
> This module scans the device tree (for now only OF nodes are supported
> but care is taken to make other fwnode implementations easy to
> integrate) and determines which GPIO lines are shared by multiple users.
> It stores that information in memory. When the GPIO chip exposing shared
> lines is registered, the shared GPIO descriptors it exposes are marked
> as shared and virtual "proxy" devices that mediate access to the shared
> lines are created. When a consumer of a shared GPIO looks it up, its
> fwnode lookup is redirected to a just-in-time machine lookup that points
> to this proxy device.
> 
> This code can be compiled out on platforms which don't use shared GPIOs.

Besides strcmp_suffix() that already exists in OF core, there are also some
existing pieces that seems being repeated here (again). Can we reduce amount
of duplication?

...

> +#if IS_ENABLED(CONFIG_OF)
> +static int gpio_shared_of_traverse(struct device_node *curr)
> +{

I believe parts of this code may be resided somewhere in drivers/of/property.c
or nearby as it has the similar parsing routines.

> +	struct gpio_shared_entry *entry;
> +	size_t con_id_len, suffix_len;
> +	struct fwnode_handle *fwnode;
> +	struct of_phandle_args args;
> +	struct property *prop;
> +	unsigned int offset;
> +	const char *suffix;
> +	int ret, count, i;
> +
> +	for_each_property_of_node(curr, prop) {
> +		/*
> +		 * The standard name for a GPIO property is "foo-gpios"
> +		 * or "foo-gpio". Some bindings also use "gpios" or "gpio".
> +		 * There are some legacy device-trees which have a different
> +		 * naming convention and for which we have rename quirks in
> +		 * place in gpiolib-of.c. I don't think any of them require
> +		 * support for shared GPIOs so for now let's just ignore
> +		 * them. We can always just export the quirk list and
> +		 * iterate over it here.
> +		 */
> +		if (!strends(prop->name, "-gpios") &&
> +		    !strends(prop->name, "-gpio") &&
> +		    strcmp(prop->name, "gpios") != 0 &&
> +		    strcmp(prop->name, "gpio") != 0)
> +			continue;
> +
> +		count = of_count_phandle_with_args(curr, prop->name,
> +						   "#gpio-cells");
> +		if (count <= 0)
> +			continue;
> +
> +		for (i = 0; i < count; i++) {
> +			struct device_node *np __free(device_node) = NULL;
> +
> +			ret = of_parse_phandle_with_args(curr, prop->name,
> +							 "#gpio-cells", i,
> +							 &args);
> +			if (ret)
> +				continue;
> +
> +			np = args.np;
> +
> +			if (!of_property_present(np, "gpio-controller"))
> +				continue;
> +
> +			/*
> +			 * We support 1, 2 and 3 cell GPIO bindings in the
> +			 * kernel currently. There's only one old MIPS dts that
> +			 * has a one-cell binding but there's no associated
> +			 * consumer so it may as well be an error. There don't
> +			 * seem to be any 3-cell users of non-exclusive GPIOs,
> +			 * so we can skip this as well. Let's occupy ourselves
> +			 * with the predominant 2-cell binding with the first
> +			 * cell indicating the hardware offset of the GPIO and
> +			 * the second defining the GPIO flags of the request.
> +			 */
> +			if (args.args_count != 2)
> +				continue;
> +
> +			fwnode = of_fwnode_handle(args.np);
> +			offset = args.args[0];
> +
> +			entry = gpio_shared_find_entry(fwnode, offset);
> +			if (!entry) {
> +				entry = kzalloc(sizeof(*entry), GFP_KERNEL);
> +				if (!entry)
> +					return -ENOMEM;
> +
> +				entry->fwnode = fwnode_handle_get(fwnode);
> +				entry->offset = offset;
> +				entry->index = count;
> +				INIT_LIST_HEAD(&entry->refs);
> +
> +				list_add_tail(&entry->list, &gpio_shared_list);
> +			}
> +
> +			struct gpio_shared_ref *ref __free(kfree) =
> +					kzalloc(sizeof(*ref), GFP_KERNEL);
> +			if (!ref)
> +				return -ENOMEM;
> +
> +			ref->fwnode = fwnode_handle_get(of_fwnode_handle(curr));
> +			ref->flags = args.args[1];
> +
> +			if (strends(prop->name, "gpios"))
> +				suffix = "-gpios";
> +			else if (strends(prop->name, "gpio"))
> +				suffix = "-gpio";
> +			else
> +				suffix = NULL;
> +			if (!suffix)
> +				continue;
> +
> +			/* We only set con_id if there's actually one. */
> +			if (strcmp(prop->name, "gpios") && strcmp(prop->name, "gpio")) {
> +				ref->con_id = kstrdup(prop->name, GFP_KERNEL);
> +				if (!ref->con_id)
> +					return -ENOMEM;
> +
> +				con_id_len = strlen(ref->con_id);
> +				suffix_len = strlen(suffix);
> +
> +				ref->con_id[con_id_len - suffix_len] = '\0';
> +			}
> +
> +			ref->dev_id = ida_alloc(&gpio_shared_ida, GFP_KERNEL);
> +			if (ref->dev_id < 0) {
> +				kfree(ref->con_id);
> +				return -ENOMEM;
> +			}
> +
> +			if (!list_empty(&entry->refs))
> +				pr_debug("GPIO %u at %s is shared by multiple firmware nodes\n",
> +					 entry->offset, fwnode_get_name(entry->fwnode));
> +
> +			list_add_tail(&no_free_ptr(ref)->list, &entry->refs);
> +		}
> +	}
> +
> +	for_each_child_of_node_scoped(curr, child) {
> +		ret = gpio_shared_of_traverse(child);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}

-- 
With Best Regards,
Andy Shevchenko



