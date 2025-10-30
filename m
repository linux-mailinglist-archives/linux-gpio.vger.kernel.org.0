Return-Path: <linux-gpio+bounces-27864-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 29995C1F502
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Oct 2025 10:32:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 40AC14E9BDE
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Oct 2025 09:31:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1F88340D84;
	Thu, 30 Oct 2025 09:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z5QbBZUZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C279518DB26;
	Thu, 30 Oct 2025 09:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761816663; cv=none; b=L9eTA97T3fx7289NjOcNXSUSyc0kxB8Bj1J1upYF2F1kNeMQlRjzcqX68ccmdyYVICOVzfDJJd+39mE550iCSu+cTiBSRNsnQjkIBeRdubzJZCkzx0MdfuF4LGButhp1KVfsmjN7Kaw1ea1uvMNpD7rch4qY8Fp1ViIYhGho904=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761816663; c=relaxed/simple;
	bh=bf2Q132NqZ4zOHvgkziC0uP8Th7d9mOHbt28bTwZI1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DPLta3sWtafn66q1mCCnPaK44OBCkDLP7mBskjSndkrlMoR2O9UBZemdFS7X958Q0/4DVa81g/5nvaLOu3olXfd5JjmBMyucdG4hU9MYydbnDpzRCAa5swMs02tm8BKB/5lSt00SI64NR0WLXmGr9c1ph4YxlHircSmTqW/xKHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z5QbBZUZ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761816662; x=1793352662;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=bf2Q132NqZ4zOHvgkziC0uP8Th7d9mOHbt28bTwZI1E=;
  b=Z5QbBZUZr7U84jOVgwhpDk1FPoXAjq7Zl5GRQyMHUxIlexeMpVZftFUT
   voFcYMvmKiL8ONZhWAuJytMzsxkc7j873uVdX1RQsGJsFE7z0qfWN7ZyD
   eU2hTiuW0NobBnZ8CZ34EzaUPFV9nvqx/TzONJ00jhK5mlwnULQ7PKd+0
   Z0f/733MVhtPMdfGsr/JUTlmG8Oip6z5Tm2Cwe7c7WDq/l9x7KIsebgSI
   c17MJgKyevnR12W0hCymKcyT9V/XdCbb7U0N05cop2jvtZma0EC+eMMNt
   PdilvkJvAlJ7JJ3JeVVPGxIUK3Q/RM+83TIVwDRulvbb+HNRagMGFJ77K
   A==;
X-CSE-ConnectionGUID: o83Vl/5USGiN9H9tR/HPAQ==
X-CSE-MsgGUID: TKbYHgqpRzGC2MaItIfCww==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="64048893"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; 
   d="scan'208";a="64048893"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 02:31:01 -0700
X-CSE-ConnectionGUID: zSu7nv+DRgqFVKcwQIqyaQ==
X-CSE-MsgGUID: nPzZm7POSO6Mw90VTnTUtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; 
   d="scan'208";a="185165359"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.245.174])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 02:30:55 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1vEOzb-00000003rIo-3pF9;
	Thu, 30 Oct 2025 11:30:51 +0200
Date: Thu, 30 Oct 2025 11:30:51 +0200
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
Message-ID: <aQMwS5gyqVwYrGoS@smile.fi.intel.com>
References: <20251029-gpio-shared-v3-0-71c568acf47c@linaro.org>
 <20251029-gpio-shared-v3-3-71c568acf47c@linaro.org>
 <aQH-NcXry6_IlqXQ@smile.fi.intel.com>
 <CAMRc=Me5qPS2PhLK5hpK8BbTS8b9q3T-+86mq6rVDpyKZZUfoA@mail.gmail.com>
 <aQIwWXM8BfjQs7kv@smile.fi.intel.com>
 <CAMRc=Mfz+Se0Wq4cXjgP=DBOMkTqSBdoV-CcC-+Ma0hfELARzA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mfz+Se0Wq4cXjgP=DBOMkTqSBdoV-CcC-+Ma0hfELARzA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Oct 29, 2025 at 04:57:02PM +0100, Bartosz Golaszewski wrote:
> On Wed, Oct 29, 2025 at 4:19 PM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> > On Wed, Oct 29, 2025 at 01:39:34PM +0100, Bartosz Golaszewski wrote:
> > > On Wed, Oct 29, 2025 at 12:45 PM Andy Shevchenko
> > > <andriy.shevchenko@intel.com> wrote:
> > > > On Wed, Oct 29, 2025 at 12:20:39PM +0100, Bartosz Golaszewski wrote:

...

> > > > Besides strcmp_suffix() that already exists in OF core, there are also some
> > > > existing pieces that seems being repeated here (again). Can we reduce amount
> > > > of duplication?
> > >
> > > I'm afraid you need to be more specific here.
> >
> > You can simply browse the file, it's not long to find and think about it.
> > I'm _thinking_ that it's possible to improve the situation overall by
> > try our best of deduplicating (or rather not duplicating) things.
> 
> Sorry, but this is not how reviewing works. You can't just say: "I
> think this can be improved, go figure out what can and fix it, you can
> browse this file for reference". You need to specifically point out
> issues in code and propose alternatives.

Then consider this as a hint and not a review.

...

> > > > > +#if IS_ENABLED(CONFIG_OF)
> > > > > +static int gpio_shared_of_traverse(struct device_node *curr)
> > > > > +{
> > > >
> > > > I believe parts of this code may be resided somewhere in drivers/of/property.c
> > > > or nearby as it has the similar parsing routines.
> > >
> > > I don't think this is a good idea, I want to keep it within the
> > > confines of drivers/gpio/ and the use-case is so specific, there's
> > > really no point in putting parts of it under drivers/of/.
> > >
> > > If I could only iterate over all properties of an fwnode, I'd have
> > > skipped using OF-specific routines altogether.
> >
> > The problem is that every subsystem considers "it's not a good idea" or
> > "historical reasons" or other excuses. Since you are adding OF-specific
> > stuff that has something already done inside OF specific code, why to
> > spread it over the kernel by duplicating in another place(s)?
> 
> Well, point me to the things that have been done already and I'll see
> about reusing them.

I already gave a direction, but if you think the duplication is okay, up to
you. It can be addressed later, just a bit more of technical debt.

-- 
With Best Regards,
Andy Shevchenko



