Return-Path: <linux-gpio+bounces-23888-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2DDB1586C
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Jul 2025 07:17:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5177C3B9813
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Jul 2025 05:17:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD0EB1CD215;
	Wed, 30 Jul 2025 05:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Shcesim2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E7E3D6F;
	Wed, 30 Jul 2025 05:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753852663; cv=none; b=QVnpBp3XW4BwO5amwg8gwJ6TJ7/D7Z7A8MckCQPjG9v+gLrWgoOZBjmslsfK4v/NKyR7AH7Ob1CD61+VxwewkT06tPWCb7m1MHVNfO8vF/SAgPPf0aNflz9HCTaPUDMPQ/B2vyTlu8ZKfQuO1m0TuxlH1IET9JIlPPLSFhr7go8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753852663; c=relaxed/simple;
	bh=VixFtb5oORhu/C1bxbcICmN+ltPGz5m7gF0aZ4AaCc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oZGZS8Y4e5W2tI1Kchq2R8DHsz4SdjXjsPEs3LNccAxrDyiyzyG2dI5iFsRyI08o2qINL8SD0Zu0Ydsbh2pUk/o5iOJXQ2nTHEvGwnW4PcUxnpky7ovqrAt68s8bbhnlby4TnZZofj9UCYAVyqWSqIVKcbK6/6uFtDTzsTiDcW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Shcesim2; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753852662; x=1785388662;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=VixFtb5oORhu/C1bxbcICmN+ltPGz5m7gF0aZ4AaCc0=;
  b=Shcesim2cJJVsMtlxy+YBDsvUAc6vHd4NCMOctClLQcyakJvin/rRT8W
   tMmTJFjsjodJ1RxE8FbB/fuluPsVMIB5/SHmTMcgKUfOnzdVqSS5rmkSS
   brRINZ058OfcrW4qRxjXg4FtR/Tpj4jIj5UvwI+7UwNGcvCl/kbXr/FPp
   p3cGQh2Ox4yaugWJ/r6YA9UEUU3wvAzwvz7zONmIu1gPze41gijEAVb8Y
   xUVNE/jZC0U9L4g6lg15zod7Shlas0R2SXaMdOsDQr0CXaIl+IhhPJ7qD
   LC5TcdfZYzt1Fz6x/UURto686PYp/fWBpas96YrjC/FAyEXGvalpaT6xC
   A==;
X-CSE-ConnectionGUID: 14BjN1jUQuurzG/GazBAdQ==
X-CSE-MsgGUID: iSo3tZdrQqSky9GAsyKzdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="59969370"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="59969370"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 22:16:47 -0700
X-CSE-ConnectionGUID: 38eeLNlwRkylXBdehf478g==
X-CSE-MsgGUID: RR2qH/lnQs+8jT1kSY7eRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="162148879"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa010.jf.intel.com with ESMTP; 29 Jul 2025 22:16:44 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 90334161; Wed, 30 Jul 2025 08:16:42 +0300 (EEST)
Date: Wed, 30 Jul 2025 08:16:42 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: David Thompson <davthompson@nvidia.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linus.walleij@linaro.org, davem@davemloft.net, asmaa@nvidia.com,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Shravan Kumar Ramani <shravankr@nvidia.com>
Subject: Re: [PATCH v4] gpio-mlxbf2: use platform_get_irq_optional()
Message-ID: <20250730051642.GV2824380@black.fi.intel.com>
References: <20250728144619.29894-1-davthompson@nvidia.com>
 <CAMRc=Mc1cQL+fcFOPA1NBSHh+foVyT1mxFt+R7f73PEB=Pjuyw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mc1cQL+fcFOPA1NBSHh+foVyT1mxFt+R7f73PEB=Pjuyw@mail.gmail.com>

On Tue, Jul 29, 2025 at 08:58:44AM +0200, Bartosz Golaszewski wrote:
> On Mon, Jul 28, 2025 at 4:46 PM David Thompson <davthompson@nvidia.com> wrote:
> >
> > The gpio-mlxbf2 driver interfaces with four GPIO controllers,
> > device instances 0-3. There are two IRQ resources shared between
> > the four controllers, and they are found in the ACPI table for
> > instances 0 and 3. The driver should not use platform_get_irq(),
> > otherwise this error is logged when probing instances 1 and 2:
> >   mlxbf2_gpio MLNXBF22:01: error -ENXIO: IRQ index 0 not found
> >
> > Fixes: 2b725265cb08 ("gpio: mlxbf2: Introduce IRQ support")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: David Thompson <davthompson@nvidia.com>
> > Reviewed-by: Shravan Kumar Ramani <shravankr@nvidia.com>
> > ---
> > v4: updated logic to simply use platform_get_irq_optional()
> > v3: added version history
> > v2: added tag "Cc: stable@vger.kernel.org"
> >
> >  drivers/gpio/gpio-mlxbf2.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpio/gpio-mlxbf2.c b/drivers/gpio/gpio-mlxbf2.c
> > index 6f3dda6b635f..390f2e74a9d8 100644
> > --- a/drivers/gpio/gpio-mlxbf2.c
> > +++ b/drivers/gpio/gpio-mlxbf2.c
> > @@ -397,7 +397,7 @@ mlxbf2_gpio_probe(struct platform_device *pdev)
> >         gc->ngpio = npins;
> >         gc->owner = THIS_MODULE;
> >
> > -       irq = platform_get_irq(pdev, 0);
> > +       irq = platform_get_irq_optional(pdev, 0);
> >         if (irq >= 0) {
> >                 girq = &gs->gc.irq;
> >                 gpio_irq_chip_set_chip(girq, &mlxbf2_gpio_irq_chip);
> > --
> > 2.43.2
> >
> 
> Cc'ed Andy and Mika for review.

Looks good to me,

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>

