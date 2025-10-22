Return-Path: <linux-gpio+bounces-27488-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A1006BFD9A8
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 19:34:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4D2A54F1A0F
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 17:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C8AA2D248F;
	Wed, 22 Oct 2025 17:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iEpl5Qva"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699682D0C60;
	Wed, 22 Oct 2025 17:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761154458; cv=none; b=Mx0KvpaHNBLJkkfFoKF3KEDCAKeomD/IxtAwsl9z0dUWFNAZwLI8gJRbNG6582FYlTkKsRPt0om413lUsyuJ92d6crpa2lzT7Z9shWDobPsVEs6AWRKO9Ai1+2jSolAvuDTKuvamgp7fpcNjhIKxM8VEU9RSmJmSclVvbf5fAp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761154458; c=relaxed/simple;
	bh=dV+5NKwJdbhUSGEqeN+AL+dVtPcIoMxzkpXqx3wMka4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fT93nrcVuTl7xHjYqjt0qxRT87QAKokUAS8WCbp1ZtiCJ/zE2fcHhkW1jXGQQPmWIKV3VTMJDfGS68GLSr22B3hTtzbQZFMaGsFMI/qfUG+KbW+cdWjuUI7q9YXtYCMUMTLYJ7EfZGeUDNsYeWOkEMYEFTbwGeHI+C25Uixuvl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iEpl5Qva; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761154456; x=1792690456;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dV+5NKwJdbhUSGEqeN+AL+dVtPcIoMxzkpXqx3wMka4=;
  b=iEpl5QvagBe8QTi77Kos2/H0Rmqmq68hu6eaxCDXkCXdWgt9X5NQ9CrS
   dbOYWAVNOPVg2N1y2AuKu15evlR6B5meW7fK/XVYpgQYkUlP1SK/cWe8F
   BXveU2kmw/0ujkx9IadkeRA/CG+euedewavEBz8t1cJHm+60JnN0xS0Jj
   gN5C5VFl0QVYZyfB/rD2svEYZBOFdNph9LQqgKjaDyMJX9a3JaHgcwFaY
   If8RVdsCGOYn49Wp459fDvBJxOlu2rOwOuy9BThBJmM2rcil3zaO/Y2y6
   j7doRg4iuHoQol18QN96b7PNq39awVlM/GAnV/I3cROciWyt3N7EIwWfO
   A==;
X-CSE-ConnectionGUID: 6vZEv/DNTliRjRehUvLAcA==
X-CSE-MsgGUID: CeD4EQwPSM2kUaXP+if3rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74751315"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="74751315"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 10:34:15 -0700
X-CSE-ConnectionGUID: X7hpJLYNShiXzOXB9nCdEA==
X-CSE-MsgGUID: jAZp2GJASS2/Swqf9D3Xmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="184326068"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.244.83])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 10:34:10 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1vBcit-00000001l1m-0V63;
	Wed, 22 Oct 2025 20:34:07 +0300
Date: Wed, 22 Oct 2025 20:34:06 +0300
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
	Takashi Iwai <tiwai@suse.com>, linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 03/10] gpiolib: implement low-level, shared GPIO
 support
Message-ID: <aPkVjoWkP04Q-2xP@smile.fi.intel.com>
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
 <20251022-gpio-shared-v2-3-d34aa1fbdf06@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022-gpio-shared-v2-3-d34aa1fbdf06@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Oct 22, 2025 at 03:10:42PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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

...

> +		if (!strends(prop->name, "-gpios") &&
> +		    !strends(prop->name, "-gpio") &&

> +		    strcmp(prop->name, "gpios") != 0 &&
> +		    strcmp(prop->name, "gpio") != 0)

We have gpio_suffixes for a reason (also refer to for_each_gpio_property_name()
implementation, and yes I understand the difference, this is just a reference
for an example of use of the existing list of suffixes).

> +			continue;

...

> +			if (strends(prop->name, "gpios"))
> +				suffix = "-gpios";
> +			else if (strends(prop->name, "gpio"))
> +				suffix = "-gpio";
> +			else
> +				suffix = NULL;
> +			if (!suffix)
> +				continue;

In a similar way.

> +			/* We only set con_id if there's actually one. */
> +			if (strcmp(prop->name, "gpios") && strcmp(prop->name, "gpio")) {

And again...

> +				ref->con_id = kstrdup(prop->name, GFP_KERNEL);
> +				if (!ref->con_id)
> +					return -ENOMEM;
> +
> +				con_id_len = strlen(ref->con_id);
> +				suffix_len = strlen(suffix);
> +
> +				ref->con_id[con_id_len - suffix_len] = '\0';
> +			}

...

> +	adev->dev.parent = gdev->dev.parent;
> +	/* No need to dev->release() anything. */

And is it okay?

See drivers/base/core.c:2567

WARN(1, KERN_ERR "Device '%s' does not have a release() function, it is broken and must be fixed. See Documentation/core-api/kobject.rst.\n",

...

> +	pr_debug("Created an auxiliary GPIO proxy %s for GPIO device %s\n",
> +		 dev_name(&adev->dev), gpio_device_get_label(gdev));

Are you expecting dev_name() to be NULL in some cases? Otherwise why is this
not a dev_dbg() call?


> +	return 0;
> +}

...

> +			char *key __free(kfree) =
> +				kasprintf(GFP_KERNEL,
> +					  KBUILD_MODNAME ".proxy.%u",
> +					  ref->adev.id);

This looks awful. Just allow a bit longer line

> +			if (!key)
> +				return -ENOMEM;

...

> +static void gpio_shared_remove_adev(struct auxiliary_device *adev)
> +{
> +	lockdep_assert_held(&gpio_shared_lock);
> +
> +	auxiliary_device_uninit(adev);
> +	auxiliary_device_delete(adev);

_destroy() ? Esp. taking into account the (wrong?) ordering.

> +}

...

> +		set_bit(GPIOD_FLAG_SHARED, flags);

Do you need this to be atomic?

> +		/*
> +		 * Shared GPIOs are not requested via the normal path. Make
> +		 * them inaccessible to anyone even before we register the
> +		 * chip.
> +		 */
> +		set_bit(GPIOD_FLAG_REQUESTED, flags);

Ditto.

...

> +struct gpio_shared_desc *devm_gpiod_shared_get(struct device *dev)
> +{
> +	struct auxiliary_device *adev = to_auxiliary_dev(dev);
> +	struct gpio_shared_desc *shared_desc;
> +	struct gpio_shared_entry *entry;
> +	struct gpio_shared_ref *ref;
> +	struct gpio_device *gdev;
> +	int ret;

> + +	scoped_guard(mutex, &gpio_shared_lock) {

Much better to split the below to a helper and make it run under a
scoped_guard() here or call a guard()() there.

> +		list_for_each_entry(entry, &gpio_shared_list, list) {
> +			list_for_each_entry(ref, &entry->refs, list) {
> +				if (adev != &ref->adev)
> +					continue;
> +
> +				if (entry->shared_desc) {
> +					kref_get(&entry->ref);
> +					shared_desc = entry->shared_desc;
> +					break;
> +				}
> +
> +				shared_desc = kzalloc(sizeof(*shared_desc), GFP_KERNEL);
> +				if (!shared_desc)
> +					return ERR_PTR(-ENOMEM);
> +
> +				gdev = gpio_device_find_by_fwnode(entry->fwnode);
> +				if (!gdev) {
> +					kfree(shared_desc);
> +					return ERR_PTR(-EPROBE_DEFER);
> +				}
> +
> +				shared_desc->desc = &gdev->descs[entry->offset];
> +				shared_desc->can_sleep = gpiod_cansleep(shared_desc->desc);
> +				if (shared_desc->can_sleep)
> +					mutex_init(&shared_desc->mutex);
> +				else
> +					spin_lock_init(&shared_desc->spinlock);
> +
> +				kref_init(&entry->ref);
> +				entry->shared_desc = shared_desc;
> +
> +				pr_debug("Device %s acquired a reference to the shared GPIO %u owned by %s\n",
> +					 dev_name(dev), desc_to_gpio(shared_desc->desc),
> +					 gpio_device_get_label(gdev));
> +				break;
> +			}
> +		}
> +	}
> +
> +	ret = devm_add_action_or_reset(dev, gpiod_shared_put, entry);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return shared_desc;
> +}

...

> +/*
> + * This is only called if gpio_shared_init() fails so it's in fact __init and
> + * not __exit.
> + */

Fine. Have you checked if there are any section mismatch warnings during kernel
(post)build?

-- 
With Best Regards,
Andy Shevchenko



