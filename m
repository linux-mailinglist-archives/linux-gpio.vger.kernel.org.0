Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1D3933DA3D
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Mar 2021 18:06:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239008AbhCPRGT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Mar 2021 13:06:19 -0400
Received: from mga17.intel.com ([192.55.52.151]:32050 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239014AbhCPRFz (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 16 Mar 2021 13:05:55 -0400
IronPort-SDR: Qn0wfbxoMZUatrpKtYDN4yobilay2fQFalwfaqCl+510QvKtsyTygHV93UBpY0Z7Yvc0HFJY75
 HL8sAHKO3hRg==
X-IronPort-AV: E=McAfee;i="6000,8403,9925"; a="169213788"
X-IronPort-AV: E=Sophos;i="5.81,254,1610438400"; 
   d="scan'208";a="169213788"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2021 10:05:53 -0700
IronPort-SDR: FA3KiXXjyqZfFiLvNVY1Ehj/bzd5P2bj8V8My5izYkm9lIoSrtSDYT6GG4DsKtdhkrzeu/HMB6
 pCbIZDHxzcLg==
X-IronPort-AV: E=Sophos;i="5.81,254,1610438400"; 
   d="scan'208";a="405605306"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2021 10:05:51 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lMD8e-00D0vn-MK; Tue, 16 Mar 2021 19:05:48 +0200
Date:   Tue, 16 Mar 2021 19:05:48 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jan Kiszka <jan.kiszka@siemens.com>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v4 2/2] gpio: sch: Hook into ACPI SCI handler to catch
 GPIO edge events
Message-ID: <YFDlbKD4Q13lDmM3@smile.fi.intel.com>
References: <20210316162613.87710-1-andriy.shevchenko@linux.intel.com>
 <20210316162613.87710-3-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210316162613.87710-3-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 16, 2021 at 06:26:13PM +0200, Andy Shevchenko wrote:
> From: Jan Kiszka <jan.kiszka@siemens.com>
> 
> Neither the ACPI description on the Quark platform provides the required
> information is to do establish generic handling nor hardware capable of
> doing it. According to the datasheet the hardware can generate SCI events.
> Therefore, we need to hook from the driver directly into SCI handler of
> the ACPI subsystem in order to catch and report GPIO-related events.

> Validated on the Quark-based IOT2000 platform.

This depends on the test by Jan or somebody with the same hardware available.

> +static u32 sch_gpio_sci_handler(void *context)
> +{
> +	struct sch_gpio *sch = context;
> +	struct gpio_chip *gc = &sch->chip;
> +	unsigned long core_status, resume_status;
> +	unsigned long pending;
> +	int offset;

> +	core_status = inl(sch->iobase + GTS + 0x00);
> +	resume_status = inl(sch->iobase + GTS + 0x20);
> +
> +	pending = (resume_status << sch->resume_base) | core_status;
> +
> +	for_each_set_bit(offset, &pending, sch->chip.ngpio)
> +		generic_handle_irq(irq_find_mapping(gc->irq.domain, offset));
> +
> +	outl(core_status, sch->iobase + GTS + 0x00);
> +	outl(resume_status, sch->iobase + GTS + 0x20);

I guess this still needs to be protected by spin_lock.

> +	return pending ? ACPI_INTERRUPT_HANDLED : ACPI_INTERRUPT_NOT_HANDLED;
> +}

...

Also I am in doubt that we need to instantiate an IRQ chip if the ACPI SCI
handler registration fails. But I don't know what is better approach here, to
NULL the pointer, or try to register handler before we will have an IRQ chip in
place. Any recommendations?

-- 
With Best Regards,
Andy Shevchenko


