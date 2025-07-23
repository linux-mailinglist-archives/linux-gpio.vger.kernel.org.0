Return-Path: <linux-gpio+bounces-23697-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F7BB0F4AC
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Jul 2025 15:58:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FF0A96149B
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Jul 2025 13:57:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B2B32EB5D3;
	Wed, 23 Jul 2025 13:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FYazDCRi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273162E88B4;
	Wed, 23 Jul 2025 13:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753279074; cv=none; b=KGFnOQbQwx6xq7Rz+3qy+QtsFDdVbN6eUZWc2FE88pe5QtflzS+tQaZ/CKACzgpjdogOXJX+J2a1rIFPcn12ZWBCJ8NdkzmKo1aclxFk0Swl5vXZWsThi7Py9L9mkzzMl3TVAlo2OIKww7ONBhgo/Oo675lpvKvg9pMWjBBOz1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753279074; c=relaxed/simple;
	bh=spDblF3sLpAdvUAQNfjoEm8dRFvQyApn+0uyWPPqgAY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VgbOt6K00y6POYR30yjzJhagnPqJEs//NHgcWDyZFDU6bH7c1Kfxb0fkOGd0n8GcPC5zqqW+18J9OOmb3O22IohYDgyFlDLVQQJ0nvHW3F3Ig+WoA5Sr/o7kqFClXIQPGuBAU+myf8KBwOk5L5aKqvXBZxBF15K3rcp6O7lHeT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FYazDCRi; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753279072; x=1784815072;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=spDblF3sLpAdvUAQNfjoEm8dRFvQyApn+0uyWPPqgAY=;
  b=FYazDCRiBTtFEQnQGcJfy1qnApJdJaq3qPoz4MF5oDGfZP5UBcvdAoH4
   T5I6ecMVg/hfXbRhFqrIhjViJtvL/qEKvmKzWJi/vRDBLCfI/p65xmM5W
   ekE2RmkevTtGHSpUiXG+HWGaXe9NGWRX+5mVUO1uNYhFvsAo/HpB03qT1
   G7ArHco90hHwKhA7CDiEz7Ea3srhqJPK/23t9cjClWh3zpTULG2vUhna6
   KZEUUehUa85r4f/ViV5pj4ccN/Pa613f7XK7Pn9emv1kKkF34rWwFmazV
   J+Ymr3nqUwba5WBP0adnln3J7V6kjudh0jHwKv08BpPvIBgS4vIZTZX4+
   g==;
X-CSE-ConnectionGUID: 1wNdOZvlSeOYLD/lsw5oEQ==
X-CSE-MsgGUID: ABCCjkW1QbO43iw/RSuI0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="66258497"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="66258497"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 06:57:51 -0700
X-CSE-ConnectionGUID: uNEv/CkEShi07qaF/WEBIQ==
X-CSE-MsgGUID: y6+VAcqjRv+bxlpKqX3+zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="163761150"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 06:57:48 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ueZyc-00000000J3A-00g9;
	Wed, 23 Jul 2025 16:57:46 +0300
Date: Wed, 23 Jul 2025 16:57:45 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: David Thompson <davthompson@nvidia.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linus.walleij@linaro.org, davem@davemloft.net, asmaa@nvidia.com,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Shravan Kumar Ramani <shravankr@nvidia.com>
Subject: Re: [PATCH v3] gpio-mlxbf2: only get IRQ for device instances 0 and 3
Message-ID: <aIDqWRmijLIyqcDB@smile.fi.intel.com>
References: <20250721162215.30327-1-davthompson@nvidia.com>
 <CAMRc=Mfg42wvT9qdYrhvFq_wdvThmWpbvvo-p9bHSsyK0pn+bw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mfg42wvT9qdYrhvFq_wdvThmWpbvvo-p9bHSsyK0pn+bw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Jul 22, 2025 at 04:52:02PM +0200, Bartosz Golaszewski wrote:
> On Mon, Jul 21, 2025 at 6:22 PM David Thompson <davthompson@nvidia.com> wrote:
> >
> > The gpio-mlxbf2 driver interfaces with four GPIO controllers,
> > device instances 0-3. There are two IRQ resources shared between
> > the four controllers, and they are found in the ACPI table for
> > device instances 0 and 3.  The driver should not attempt to get
> > an IRQ resource when probing device instance 1 or 2, otherwise
> > the following error is logged:
> >   mlxbf2_gpio MLNXBF22:01: error -ENXIO: IRQ index 0 not found

...

> > -       irq = platform_get_irq(pdev, 0);

So, why not simply change this to the _optional() call?

> > -       if (irq >= 0) {
> > -               girq = &gs->gc.irq;
> > -               gpio_irq_chip_set_chip(girq, &mlxbf2_gpio_irq_chip);
> > -               girq->handler = handle_simple_irq;
> > -               girq->default_type = IRQ_TYPE_NONE;
> > -               /* This will let us handle the parent IRQ in the driver */
> > -               girq->num_parents = 0;
> > -               girq->parents = NULL;
> > -               girq->parent_handler = NULL;
> > -
> > -               /*
> > -                * Directly request the irq here instead of passing
> > -                * a flow-handler because the irq is shared.
> > -                */
> > -               ret = devm_request_irq(dev, irq, mlxbf2_gpio_irq_handler,
> > -                                      IRQF_SHARED, name, gs);
> > -               if (ret) {
> > -                       dev_err(dev, "failed to request IRQ");
> > -                       return ret;
> > +       colon_ptr = strchr(dev_name(dev), ':');
> > +       if (!colon_ptr) {
> > +               dev_err(dev, "invalid device name format\n");
> > +               return -EINVAL;
> > +       }
> > +
> > +       ret = kstrtol(++colon_ptr, 16, &num);
> > +       if (ret) {
> > +               dev_err(dev, "invalid device instance\n");
> > +               return ret;
> > +       }
> > +
> 
> That is *really* fragile. Andy, Mika: does this look remotely correct
> to you? I don't know much about ACPI systems.

I totally agree with you. This is an ugly hack and here is formal NAK from me.
The ACPI tables that doesn't provide an IRQ resources (in any of its possible
type) can be simply ignored by not requesting that IRQ. The message above
AFAICT is harmless. Above I proposed the better fix.

> > +       if (!num || num == 3) {
> > +               irq = platform_get_irq(pdev, 0);
> > +               if (irq >= 0) {
> > +                       girq = &gs->gc.irq;
> > +                       gpio_irq_chip_set_chip(girq, &mlxbf2_gpio_irq_chip);
> > +                       girq->handler = handle_simple_irq;
> > +                       girq->default_type = IRQ_TYPE_NONE;
> > +                       /* This will let us handle the parent IRQ in the driver */
> > +                       girq->num_parents = 0;
> > +                       girq->parents = NULL;
> > +                       girq->parent_handler = NULL;
> > +
> > +                       /*
> > +                        * Directly request the irq here instead of passing
> > +                        * a flow-handler because the irq is shared.
> > +                        */
> > +                       ret = devm_request_irq(dev, irq, mlxbf2_gpio_irq_handler,
> > +                                              IRQF_SHARED, name, gs);
> > +                       if (ret) {
> > +                               dev_err(dev, "failed to request IRQ");
> > +                               return ret;
> > +                       }
> >                 }
> >         }

-- 
With Best Regards,
Andy Shevchenko



