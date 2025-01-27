Return-Path: <linux-gpio+bounces-15066-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9BEA1D431
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Jan 2025 11:12:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C3913A762B
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Jan 2025 10:12:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F3F91FE464;
	Mon, 27 Jan 2025 10:11:33 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC47A1FE449;
	Mon, 27 Jan 2025 10:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737972693; cv=none; b=ZPOjtq2Ry7r+hWMR8x4KEHyAZ1WvMDIJ+YgFXuoLfGPQb/JvoqznGeMHNVaONdg/A+lMM/S/YLydZrRVQvMFNcIquI0OQduJEFY9O22ouxJZSzc9qP2JAklMa1Q1jMtwaoAXaKKJPk+0R1b2M25C1KhPxy2NCWQl287YweEnPiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737972693; c=relaxed/simple;
	bh=gLc38Gp80/W49q0BiGrPEyyXQruOaxcb8y+imIVoXDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZIcvrd6oxMmKJw46AtUjbXy4jDrJ7UPjrvmnyw17+xasgtN7EgeJPn2XzasrEtU9ehv2AkklNAaAEdxEZ+jIUQvrO5aLleLx2fWPusoVATOCe4Q/nbp7+I+9dLzrPW+lSZmN+8zjvKfuTVeH5n0RLio2eKarECG6C8c9qrXtN1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
X-CSE-ConnectionGUID: 6n7Vuz7OQKen8JgvTw/WLg==
X-CSE-MsgGUID: ipRRPwQIQjaXcDSNCkrbgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11327"; a="42088752"
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; 
   d="scan'208";a="42088752"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2025 02:11:31 -0800
X-CSE-ConnectionGUID: +nOlYbXJTUGZpbanEAd2rQ==
X-CSE-MsgGUID: zfK66e1wRP+XMg5LlH8tDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; 
   d="scan'208";a="108982012"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2025 02:11:29 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy.shevchenko@gmail.com>)
	id 1tcM5W-00000005gf6-2deq;
	Mon, 27 Jan 2025 12:11:26 +0200
Date: Mon, 27 Jan 2025 12:11:26 +0200
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: lakabd <lakabd.work@gmail.com>
Cc: mark.tomlinson@alliedtelesis.co.nz, brgl@bgdev.pl,
	linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abderrahim LAKBIR <abderrahim.lakbir@actia.fr>
Subject: Re: [PATCH] gpio: pca953x: Improve interrupt support
Message-ID: <Z5dbzh3zxdKBWHsq@smile.fi.intel.com>
References: <e407b7b58c966ee35e023618ad428a21f979e761.camel@alliedtelesis.co.nz>
 <20250113220221.13545-1-koute102030@gmail.com>
 <CAHp75VeLyacKo3rY5iyq+kZnLjEQsBN2eOJExHrqHuesaVyTQQ@mail.gmail.com>
 <CAHN=yabQB5jYDd9iQ7s1dMWTScRf3c_zuNtXL8U283+vvenfNA@mail.gmail.com>
 <CAHN=yaaZ3L23JbsQ+fugG-iXdtt9dOss0pe7yT5EG029nsfXFQ@mail.gmail.com>
 <CAHp75VdCwyJhYD9rtxf8H5mi5AfcPOhvSYx2MOqw3==3mnxoSg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VdCwyJhYD9rtxf8H5mi5AfcPOhvSYx2MOqw3==3mnxoSg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Jan 27, 2025 at 09:47:17AM +0200, Andy Shevchenko wrote:
> On Tue, Jan 21, 2025 at 12:12 PM lakabd <lakabd.work@gmail.com> wrote:
> > Le mar. 14 janv. 2025 à 16:44, work work <lakabd.work@gmail.com> a écrit :
> > > Le mar. 14 janv. 2025 à 10:37, Andy Shevchenko
> > > <andy.shevchenko@gmail.com> a écrit :
> > > > On Tue, Jan 14, 2025 at 12:03 AM lakabd <lakabd.work@gmail.com> wrote:

...

> > > > > +                             /* Store irq_mask for later use when checking pending IRQs */
> > > > > +                             bitmap_or(chip->unmasked_interrupts, chip->unmasked_interrupts, chip->irq_mask, gc->ngpio);
> > > >
> > > > This solution has a flaw. Where is any code that clears this new
> > > > bitmap? The code starts with 0 (obviously) and step by step it gets
> > > > saturated to all-1s.
> > >
> > > Yes indeed, and actually the new bitmap is not necessary at all
> > > because what we need does already exist which is chip->irq_mask (I
> > > noticed it just now!).
> > > chip->irq_mask is updated whenever a pin is masked or unmasked via
> > > pca953x_irq_mask() and pca953x_irq_unmask().
> > >
> > > The solution should look like this:
> > >
> > > diff --git a/gpio-pca953x.c b/gpio-pca953x.c
> > > index 272febc..29e8c20 100644
> > > --- a/gpio-pca953x.c
> > > +++ b/gpio-pca953x.c
> > > @@ -842,11 +842,6 @@ static bool pca953x_irq_pending(struct
> > > pca953x_chip *chip, unsigned long *pendin
> > >   int ret;
> > >
> > >   if (chip->driver_data & PCA_PCAL) {
> > > - /* Read the current interrupt status from the device */
> > > - ret = pca953x_read_regs(chip, PCAL953X_INT_STAT, trigger);
> > > - if (ret)
> > > - return false;
> > > -
> > >   /* Check latched inputs and clear interrupt status */
> > >   ret = pca953x_read_regs(chip, chip->regs->input, cur_stat);
> > >   if (ret)
> > > @@ -855,7 +850,7 @@ static bool pca953x_irq_pending(struct
> > > pca953x_chip *chip, unsigned long *pendin
> > >   /* Apply filter for rising/falling edge selection */
> > >   bitmap_replace(new_stat, chip->irq_trig_fall, chip->irq_trig_raise,
> > > cur_stat, gc->ngpio);
> > >
> > > - bitmap_and(pending, new_stat, trigger, gc->ngpio);
> > > + bitmap_and(pending, new_stat, chip->irq_mask, gc->ngpio);
> > >
> > >   return !bitmap_empty(pending, gc->ngpio);>
> 
> > >   }
> >
> > Hi Andy, do you have any other suggestions regarding the proposed fix ?
> 
> Currently I'm reading the datasheet to understand how the chip
> actually works. I'll come back to you soon.
> 
> Nevertheless, I would like to hear from Mark if your patch fixes the
> issue. Preliminary I can say that it looks like we need slightly
> different and more complex logic there.
> 
> P.S. Sorry for the delays.

Okay, I have read a lot the datasheet (PCAL9535A), and while Fig.12 shows
an example of what happens in practice, neither the schematic on Fig.6 nor
the description of the interrupt status register doesn't clarify this
behaviour. The bottom line is that the latch helps only to keep the input data
for longer and doesn't anyhow affect the input change on another pin while
servicing the one that asserts the interrupt. Basically what they should have
said is that the interrupt status register snapshot is made on the very first
event and doesn't reflect the actual status anymore in case more input changes
are coming. Hence there is no practical use of the interrupt status register.

Seems to me a good candidate for errata. Does anybody inform NXP about this?

Meanwhile looking into the code I'm wondering why we can't actually use
just input port register data with the logic as for PCAL. Nonetheless this
can be optimized later. I think Mark's patch is good enough as current fix.

-- 
With Best Regards,
Andy Shevchenko



