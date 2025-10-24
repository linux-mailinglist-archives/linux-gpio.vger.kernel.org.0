Return-Path: <linux-gpio+bounces-27574-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86044C04A20
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Oct 2025 09:11:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D0A53BBD2B
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Oct 2025 07:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 773ED29E0E9;
	Fri, 24 Oct 2025 07:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HUpsfKRo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1916F29BDB8;
	Fri, 24 Oct 2025 07:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761289790; cv=none; b=pU+EOfXyuI84YiPJkOV8qHZOVSPyO3dVi2w9gEVYC7/X7jYNgBB0R6XPVsLuwGANpd5sVzC7PH7jKbL7DsXGiEq3u714ucn1uUgnbbY9b+vh0F8AXG5uRLfdMOrVWzse1Xqou5XxNSKHTvoSJ0Uu+aLz0AQVNvaicSzaE9rg/Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761289790; c=relaxed/simple;
	bh=tjcvyfpnT2ROqnMDp39g2+93M2zfzww2SQf/zXN/Nc4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r1SdQ3Fg9IdYQ5NF8sm2ZgqRF3elk1HGlJ/sMyMGC4CujxqEkKgwsZSTWMIS1Op1wvvxg+sgreXo5iWX+wGepRH9j7PdjvAM/jRaMG49Nl8N0kSFGpyrMrnLeCR2juAgNLWCCI3VpobSb2wz2mUTuRPoBStyBUVQFdQ2Rrt494U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HUpsfKRo; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761289788; x=1792825788;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=tjcvyfpnT2ROqnMDp39g2+93M2zfzww2SQf/zXN/Nc4=;
  b=HUpsfKRoGGDXomUFeT+3xyqF9M2JzqeWgBxdXxTzqh4b593uQx/03cOr
   osmFoSwpxKehVZX0fRm/OjmQR2zssCfCu4k43xFRX4NCiqnAhlLJbjWh5
   GghlSzTSUejLzSqV9gM7rpNO5Npow2pXgA85h2BbbHmWTCtk6Jcf3S0n8
   +VwOXmq8dgYjllaRzq+5pbESLebpnDMfNhGIN/BmnBLc04V5bbjFUdgJZ
   n1dv/wD2PY1N+E0nlohokNexBmfvIWV94TX9xydsem1PVIDovbnO3MzX4
   +GAtGi++hCibo2oA07DPFfWQW1eNqNXiqZoLR2G4V8ePSLep8CZ/VeHRI
   A==;
X-CSE-ConnectionGUID: b5aUOSSeRLytKZ/AaDRU8Q==
X-CSE-MsgGUID: /x0eqJBLQoq9srpswmsXOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62498715"
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; 
   d="scan'208";a="62498715"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 00:09:47 -0700
X-CSE-ConnectionGUID: sOxUcsTpTrCd9fBR4DsQ/g==
X-CSE-MsgGUID: G1OmBVBdTf6OxtSNV8gUnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; 
   d="scan'208";a="184077348"
Received: from opintica-mobl1 (HELO ashevche-desk.local) ([10.245.245.60])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 00:09:42 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1vCBve-0000000257C-2kRs;
	Fri, 24 Oct 2025 10:09:38 +0300
Date: Fri, 24 Oct 2025 10:09:38 +0300
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
Message-ID: <aPsmMruDxOil_wYQ@smile.fi.intel.com>
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
 <20251022-gpio-shared-v2-3-d34aa1fbdf06@linaro.org>
 <aPkVjoWkP04Q-2xP@smile.fi.intel.com>
 <CAMRc=Mc165HSLdug1F+t3qcOoE52mR1e_zEh=rSTUKN_-dB5NA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mc165HSLdug1F+t3qcOoE52mR1e_zEh=rSTUKN_-dB5NA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Oct 23, 2025 at 08:55:27PM +0200, Bartosz Golaszewski wrote:
> On Wed, Oct 22, 2025 at 7:34 PM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> > On Wed, Oct 22, 2025 at 03:10:42PM +0200, Bartosz Golaszewski wrote:

...

> > > +             if (!strends(prop->name, "-gpios") &&
> > > +                 !strends(prop->name, "-gpio") &&
> >
> > > +                 strcmp(prop->name, "gpios") != 0 &&
> > > +                 strcmp(prop->name, "gpio") != 0)
> >
> > We have gpio_suffixes for a reason (also refer to for_each_gpio_property_name()
> > implementation, and yes I understand the difference, this is just a reference
> > for an example of use of the existing list of suffixes).
> 
> And how would you use them here - when you also need the hyphen -
> without multiple dynamic allocations instead of static strings?

Something like

	char suffix[6];
	bool found = false;

	for_each_gpio_property_name(suffix, "")
		found = found || strends();
	for_each_gpio_property_name(suffix, NULL)
		found = found || (strcmp() == 0);
	if (!found)
		continue;

Of course with more thinking this may be optimized to avoid snprintf()
(probably with a new helper macro or so).

But see my next reply, I found something more interesting.

...

> > > +     /* No need to dev->release() anything. */
> >
> > And is it okay?
> >
> > See drivers/base/core.c:2567
> >
> > WARN(1, KERN_ERR "Device '%s' does not have a release() function, it is broken and must be fixed. See Documentation/core-api/kobject.rst.\n",
> 
> Huh... you're not wrong but I haven't seen this warning. Do people
> just use empty functions in this case?

I dunno. Maybe something applies a default release in you case? Can you
investigate that?

...

> > > +     pr_debug("Created an auxiliary GPIO proxy %s for GPIO device %s\n",
> > > +              dev_name(&adev->dev), gpio_device_get_label(gdev));
> >
> > Are you expecting dev_name() to be NULL in some cases? Otherwise why is this
> > not a dev_dbg() call?
> 
> It's the low-level code saying: "I created device X for Y", not "Hey,
> here's X, I'm here for Y".

OK.

> > > +     return 0;
> > > +}

...

> > > +static void gpio_shared_remove_adev(struct auxiliary_device *adev)
> > > +{
> > > +     lockdep_assert_held(&gpio_shared_lock);
> > > +
> > > +     auxiliary_device_uninit(adev);
> > > +     auxiliary_device_delete(adev);
> >
> > _destroy() ? Esp. taking into account the (wrong?) ordering.
> >
> 
> You're right about the order but if you _add() then you should
> _delete(). You typically _destroy() if you earlier _create().

Maybe, but as we noticed above my suggestion would make the code less error
prone to begin with.

> > > +}

...

> > > +     struct auxiliary_device *adev = to_auxiliary_dev(dev);
> > > +     struct gpio_shared_desc *shared_desc;
> > > +     struct gpio_shared_entry *entry;
> > > +     struct gpio_shared_ref *ref;
> > > +     struct gpio_device *gdev;
> > > +     int ret;
> >
> > > + +   scoped_guard(mutex, &gpio_shared_lock) {
> >
> > Much better to split the below to a helper and make it run under a
> > scoped_guard() here or call a guard()() there.
> 
> I'm not following, please rephrase.

	scoped_guard() {
		call_my_new_helper_which_is_easier to read();
	}

	ret = devm_add_...

OR

call_my_new_helper_which_is_easier to read()
{
	guard()()

	...
}

	call_my_new_helper_which_is_easier to read();

	ret = devm_add_...


> > > +             list_for_each_entry(entry, &gpio_shared_list, list) {
> > > +                     list_for_each_entry(ref, &entry->refs, list) {
> > > +                             if (adev != &ref->adev)
> > > +                                     continue;
> > > +
> > > +                             if (entry->shared_desc) {
> > > +                                     kref_get(&entry->ref);
> > > +                                     shared_desc = entry->shared_desc;
> > > +                                     break;
> > > +                             }
> > > +
> > > +                             shared_desc = kzalloc(sizeof(*shared_desc), GFP_KERNEL);
> > > +                             if (!shared_desc)
> > > +                                     return ERR_PTR(-ENOMEM);
> > > +
> > > +                             gdev = gpio_device_find_by_fwnode(entry->fwnode);
> > > +                             if (!gdev) {
> > > +                                     kfree(shared_desc);
> > > +                                     return ERR_PTR(-EPROBE_DEFER);
> > > +                             }
> > > +
> > > +                             shared_desc->desc = &gdev->descs[entry->offset];
> > > +                             shared_desc->can_sleep = gpiod_cansleep(shared_desc->desc);
> > > +                             if (shared_desc->can_sleep)
> > > +                                     mutex_init(&shared_desc->mutex);
> > > +                             else
> > > +                                     spin_lock_init(&shared_desc->spinlock);
> > > +
> > > +                             kref_init(&entry->ref);
> > > +                             entry->shared_desc = shared_desc;
> > > +
> > > +                             pr_debug("Device %s acquired a reference to the shared GPIO %u owned by %s\n",
> > > +                                      dev_name(dev), desc_to_gpio(shared_desc->desc),
> > > +                                      gpio_device_get_label(gdev));
> > > +                             break;
> > > +                     }
> > > +             }
> > > +     }
> > > +
> > > +     ret = devm_add_action_or_reset(dev, gpiod_shared_put, entry);
> > > +     if (ret)
> > > +             return ERR_PTR(ret);
> > > +
> > > +     return shared_desc;
> > > +}

-- 
With Best Regards,
Andy Shevchenko



