Return-Path: <linux-gpio+bounces-696-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 300897FDBC6
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 16:45:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF681281F5D
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 15:45:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A115C38FBA;
	Wed, 29 Nov 2023 15:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="GWxpmhzk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com [IPv6:2607:f8b0:4864:20::a36])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AA8CD46
	for <linux-gpio@vger.kernel.org>; Wed, 29 Nov 2023 07:45:23 -0800 (PST)
Received: by mail-vk1-xa36.google.com with SMTP id 71dfb90a1353d-4b28e7a5b41so176271e0c.1
        for <linux-gpio@vger.kernel.org>; Wed, 29 Nov 2023 07:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701272722; x=1701877522; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L6jMs2Axo+LfFoaIsfa4QKnclPqL7Dul1t/4aJ0KGYU=;
        b=GWxpmhzkczvo8ZUOem+a3KISEsNCtCF0m63AAgJgXJj6m3feH/lWVYlFDmzZhDPoz1
         3e4gnCnOA0Vmd+lD77NL+WC+KiYh4hlTs0BB2RaY6n8POZfiyPAXb8sYXCynV/LBPGj3
         /RKGNDuG1bt+f1hDgp676lAm5yBm5N+xcg1EN9pYH6NMOT3yWSpjG0f4WOnmDG2DRmww
         IPPMMmPCjesUwk1bEmSn+n/827aDBF8HRbtyLfLOJBudI1BTtuIz3JDnuu/d5fkV3xil
         gw5qR5prJRw+GeLjc3ULB9MeTIBAwil7AdSh5FXlKMCq/zBg/Peg6zVvQWnwFEyJPZ25
         rgOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701272722; x=1701877522;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L6jMs2Axo+LfFoaIsfa4QKnclPqL7Dul1t/4aJ0KGYU=;
        b=vtGd2YBBvAcNnidJf5RjMn5A0RM5aIX6J3XkA4o6ZD7OnPp8tv9jIO5zSqy9Aa9Mcj
         RMbb960HLCn+ov3M1Jz4u9wYcA7jmTG95MuOXTOYKx85FAQ3T7gHX7hanbK02iJt/SaK
         oDJ+BY2kjV6beJfjRHeRw1lKmngNpVATymc3MnsIC/OYi7i+kuLSsfBfGPtReSdq+v18
         mG51PIqDs1YxYhvExEvVUATOy+uzc8lW4IDYs9LOmAIg7U7w+PsmnL4u8xJnJklNiuCJ
         zfAwnnUFSrR2ASq8B4LdNGgfqQSACzLxsdEqxgbMYOnQf4CkQSJKw2Ltg/mbUtc62+Fu
         nX+g==
X-Gm-Message-State: AOJu0YxX++XSXJfni+IwprxXQc6EflKKW/VGtb6/BiGbx3Hwx7OmbPQq
	eq6BumANuAbrXWiW05G+EtOJg1c9mGt+1r0pUpjtM1HEsjxH80nV
X-Google-Smtp-Source: AGHT+IFalB9Ut8aNqDhUVR0uM7dSjewsX/mbzDOTXJln2bARbIFZLViMOgH532oONy169goiiTSZzOMIPIlbqfDhpbo=
X-Received: by 2002:a1f:c342:0:b0:4b2:8bdb:3449 with SMTP id
 t63-20020a1fc342000000b004b28bdb3449mr1609871vkf.13.1701272722205; Wed, 29
 Nov 2023 07:45:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231129142411.76863-1-brgl@bgdev.pl> <20231129142411.76863-2-brgl@bgdev.pl>
 <ZWdRUosYLAzXQrTT@smile.fi.intel.com>
In-Reply-To: <ZWdRUosYLAzXQrTT@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 29 Nov 2023 16:45:11 +0100
Message-ID: <CAMRc=Mc6ce_gThRfZ78DzHGWdTAO-abY=Ythbd4KRHQ=Yfd_mw@mail.gmail.com>
Subject: Re: [PATCH 01/10] gpiolib: provide gpiochip_dup_line_label()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2023 at 3:57=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Nov 29, 2023 at 03:24:02PM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > gpiochip_is_requested() not only has a misleading name but it returns
> > a pointer to a string that is freed when the descriptor is released.
> >
> > Provide a new helper meant to replace it, which returns a copy of the
> > label string instead.
>
> ...
>
> > +/**
> > + * gpiochip_dup_line_label - Get a copy of the consumer label.
> > + * @gc: GPIO chip controlling this line.
> > + * @offset: Hardware offset of the line.
> > + *
> > + * Returns:
> > + * Pointer to a copy of the consumer label if the line is requested or=
 NULL
> > + * if it's not. If a valid pointer was returned, it must be freed usin=
g
> > + * kfree(). In case of a memory allocation error, the function returns=
 %ENOMEM.
>
> kfree_const() ? (see below)
>
> > + * Must not be called from atomic context.
> > + */
> > +char *gpiochip_dup_line_label(struct gpio_chip *gc, unsigned int offse=
t)
> > +{
> > +     const char *label;
> > +     char *cpy;
>
> Why not "copy"?
>
> > +
> > +     label =3D gpiochip_is_requested(gc, offset);
> > +     if (!label)
> > +             return NULL;
>
> > +     cpy =3D kstrdup(label, GFP_KERNEL);
>
> You probably want to have kstrdup_const(). However, I haven't checked
> if we have such use cases.

I thought about it but I'm thinking that it would be confusing to
users and lead to bugs. This is not used very much and only for
debugfs output. Let's keep it simple.

>
> > +     if (!cpy)
> > +             return ERR_PTR(-ENOMEM);
> > +
> > +     return cpy;
> > +}
>
> So, how does this differ from the previous one? You need to hold a refere=
nce
> to the descriptor before copying and release it after.
>

The last patch reworks it to hold the obsolete gpio_lock and the
upcoming changes will make this perform the copy under the descriptor
lock and return it once it's released.

Bart

> --
> With Best Regards,
> Andy Shevchenko
>
>

