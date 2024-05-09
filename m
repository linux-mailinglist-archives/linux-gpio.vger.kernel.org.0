Return-Path: <linux-gpio+bounces-6283-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 788A38C10B8
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2024 15:58:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C2991F22C23
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2024 13:58:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F0D915B14F;
	Thu,  9 May 2024 13:58:49 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw22-7.mail.saunalahti.fi (fgw22-7.mail.saunalahti.fi [62.142.5.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A72152196
	for <linux-gpio@vger.kernel.org>; Thu,  9 May 2024 13:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715263129; cv=none; b=KpidupJLnfWqUrJZm9V1g0Mm+gNdahh3+CkZakwrJKzN9Zh45ppCHf2TYP651eiSjXYksle30Zzf+9xMtmFTyv/B5uLIDCDTMWF+Dclso0vqdpiDBr2GIdGOSJhSDNOODIDFCJSnvbhTxVyLc0y4jNgamfJsjgUym1FAuqM2FVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715263129; c=relaxed/simple;
	bh=djhplCSiyljApt2TBAA0zMJsT6uxaDKYjtdFumqPhTM=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KenVUxlLsXcC0++Ir9WLXOROca0DpZfJAO+TYrCldYDl8FgPP7D+aABAk1Lx+8NgdvC/0pTzwtGx5kabMmO16uqiP2p9oSI8Lz88zRuXRCvIWAvT6wZGFnMaM3+mP2TDmDSScoayGQd29XIZTi8WZPnfGx9HSFrqlWGbaNr5ZRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-208.elisa-laajakaista.fi [88.113.25.208])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id 4003d86a-0e0c-11ef-b972-005056bdfda7;
	Thu, 09 May 2024 16:58:45 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 9 May 2024 16:58:44 +0300
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] gpiolib: Return label, if set, for IRQ only line
Message-ID: <ZjzWlNdDVVBRD-Ma@surfacebook.localdomain>
References: <20240508144741.1270912-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=Me3XOy6HfqjxDQBwnSW9pOCtK_Ry7keJ2LiXGFB88t4nA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Me3XOy6HfqjxDQBwnSW9pOCtK_Ry7keJ2LiXGFB88t4nA@mail.gmail.com>

Thu, May 09, 2024 at 03:15:05PM +0200, Bartosz Golaszewski kirjoitti:
> On Wed, May 8, 2024 at 4:47 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > If line has been locked as IRQ without requesting,
> > still check its label and return it, if not NULL.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >  drivers/gpio/gpiolib.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > index db536ec9734d..1f1673552767 100644
> > --- a/drivers/gpio/gpiolib.c
> > +++ b/drivers/gpio/gpiolib.c
> > @@ -105,16 +105,16 @@ const char *gpiod_get_label(struct gpio_desc *desc)
> >         unsigned long flags;
> >
> >         flags = READ_ONCE(desc->flags);
> > -       if (test_bit(FLAG_USED_AS_IRQ, &flags) &&
> > -           !test_bit(FLAG_REQUESTED, &flags))
> > -               return "interrupt";
> > -
> > -       if (!test_bit(FLAG_REQUESTED, &flags))
> > -               return NULL;
> >
> >         label = srcu_dereference_check(desc->label, &desc->srcu,
> >                                        srcu_read_lock_held(&desc->srcu));
> >
> > +       if (test_bit(FLAG_USED_AS_IRQ, &flags))
> > +               return label->str ?: "interrupt";
> > +
> > +       if (!test_bit(FLAG_REQUESTED, &flags))
> > +               return NULL;
> > +
> >         return label->str;
> >  }
> 
> What good would it be if gpiochip_dup_line_label() returns NULL for
> unrequested lines anyway?

Then it should be handled differently in those cases. So, consider it as
a preparatory patch which doesn't change current behaviour.

(Yes, I have some hack patches locally which do something useful, but they are
not ready. In any case this one looks to me as a good cleanup on its own for
the sake of readability of the code and reduced amount of checks.)

-- 
With Best Regards,
Andy Shevchenko



