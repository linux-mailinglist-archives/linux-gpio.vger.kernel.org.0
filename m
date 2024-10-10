Return-Path: <linux-gpio+bounces-11161-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F257199933E
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Oct 2024 21:57:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7ADEBB2B39E
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Oct 2024 19:53:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B12BC1CDFC2;
	Thu, 10 Oct 2024 19:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l6hv54ez"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC4719B3CB;
	Thu, 10 Oct 2024 19:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728589972; cv=none; b=SclLe8wvtf5LHK2H81s11W6phZbt23d9UtLSNljxpWrEC3trXVozuSqrIftDWCWPkahBxAAeyPJb8VIDxMBRtdoUPg1ynKfFSHye2LfRLmpTIW1LvK8J5SH6CP3hLr0VZEhXhhAN/Be1x7Q+W/vLKjpQi0Fyx5ozd2wQGS4KmsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728589972; c=relaxed/simple;
	bh=Dv8ScenVzzecZ9PQIm1c8dRNjUPdLBI18C5uRbFisgg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i3paAbp+84+ZgSllb7dfGJUawy91GoLbVXMTiGuobcxAQCnJJ5UIXi9T2S2TkubZiyY2Q99MGBWqacDHzZaBtlflBvXpmqKT4zDj1WnkzrNZ8NF/BnC3gwyEXItKhGE6Gecgx7u+9Sxt7X1OkTGJFX2LNhz0PyZkMQt16q+HB7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l6hv54ez; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-50cf67a2ef7so368592e0c.1;
        Thu, 10 Oct 2024 12:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728589970; x=1729194770; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dv8ScenVzzecZ9PQIm1c8dRNjUPdLBI18C5uRbFisgg=;
        b=l6hv54ezvBxqsID6a/MW6jz2QF9urOXgA5INMUhcb0wgG2ODfSdT2b9Dfng91KiyUl
         497DHVpvgrS6Wcv5cXtc8dKLBSUIubzsCnnirGMvusQEZEBtYDKSoB3TsZprrSII97So
         GquhK+CjLbEko9Ai4wl0vXnYu8tZWTzjJnYKh5nPlfATMDNqxlZB9jyAvpazOmQacXS/
         0iqPxOqgqCziujv0ghdl9CkyWfPByIf0kU+GXsBzUBdvksInk9YdyrtO40egu5KJknds
         4mOzQlT9lX5TjKqeOuX0lifEgdWw70ksnnZiPb9aJn+Fn9+AAwIVSANr0ulyDG+U7v68
         lIDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728589970; x=1729194770;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dv8ScenVzzecZ9PQIm1c8dRNjUPdLBI18C5uRbFisgg=;
        b=GUhAjNqLbBXFJJI8MwvuCb/dz1kQJDVUKo+u7JR97BVq1AxQIZVuAxH2OBVmKpSRZH
         1b2WjGgLiOVBvSHV75S2ChRbsySTENNt3KTQdad73fksZfDZlpa0Hw5OlCqLuckv5KgY
         MT+lM5ko7kokGyswHx1Q8x1+15534H3AjkW+SKkkfVjoHTQkrWetvE6lOkner2nsSwqi
         vkhIl7Pozh0FDydSbZBxvF/CZSNoVOG2T8rvllQrvZA4gN1j7x0DrwA4Nmjr7NFxykkK
         zIL/eyiqzm4NRn+8eWO4kXbM0jQKn4ihlUMrvuxUoxCmTQbszf7IevB8RxRoUEv2ih7S
         FD4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVviTHnglYpHHe1IxPsH/9VcSQUXFJiu1ae/BoyXTaRVusv20Wv4AvoDGbL2HvGIbS8LpiTPVIx+yxN@vger.kernel.org, AJvYcCWOFED+may6Ub2zl/1xla4MgXSid/jXcUcKYd8ZVoghfYe0GTAIThN3hsSuksQ4e5lJ2PqEdTL8uFLfO/yeeTksr7Y=@vger.kernel.org, AJvYcCWaB1g8spb50ZiIhd0P1kWetEUen6JU9xMdxm1d4qDUSjKn4zVo4hCpdFcyfYBO+DsgUM1EDL3EoalP5NQX@vger.kernel.org
X-Gm-Message-State: AOJu0YwxNRp808GBj326jtVwTspMv6uSVyVvyF87LkPzVwVVLZJo3g2p
	2swCRUuXDzqE6/w840q6mhGyRpWVJgf37uVChovnmMPVB/cPANkNOi5Xt/NnK5M7xO7isDB+O+q
	GmBPCX+OYFQ9L9PNS1Au5Dd+eMyz5SOXF
X-Google-Smtp-Source: AGHT+IECnwyYm6oX3xIJTYXOyAK8E60VhUQWoVlZLK4j55nxlb/55YA4vppnZ8HKR3hqPj5gdj7Zx0SPDrLilqG1imI=
X-Received: by 2002:a05:6122:3116:b0:50b:e9a5:cd7b with SMTP id
 71dfb90a1353d-50cf0c4d769mr6149491e0c.9.1728589969790; Thu, 10 Oct 2024
 12:52:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241003131642.472298-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <7fe863c8-b883-45b0-b0e9-e376764d0bb7@tuxon.dev> <CA+V-a8tQ5vYbzhpdoeBFX483DV-nRpARCdWJnhm-vvTLzpTW2g@mail.gmail.com>
 <CACRpkdak=nv3R4z6PxNEcGgc7B6MV3bjwRbuFoTjgRCQ6CVOXw@mail.gmail.com>
In-Reply-To: <CACRpkdak=nv3R4z6PxNEcGgc7B6MV3bjwRbuFoTjgRCQ6CVOXw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 10 Oct 2024 20:52:23 +0100
Message-ID: <CA+V-a8uQ=b_3VRA9tbkfCNZt-UGt-_rfWbfx6HpMj6D3QWALsQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: rzg2l: Always call rzg2l_gpio_request()
 for interrupt pins
To: Linus Walleij <linus.walleij@linaro.org>
Cc: claudiu beznea <claudiu.beznea@tuxon.dev>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Thu, Oct 10, 2024 at 8:47=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Wed, Oct 9, 2024 at 10:27=E2=80=AFAM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> > On Wed, Oct 9, 2024 at 9:11=E2=80=AFAM claudiu beznea <claudiu.beznea@t=
uxon.dev> wrote:
>
> > > All these ports are hogs to configure them as input. Removing the hog
> > > property make this patch work but I'm not sure this is the right appr=
oach
> > > (see below diff).
> > >
> > I have dropped a query [0] to GPIO maintainers to check on the correct =
approach.
> >
> > https://lore.kernel.org/all/CA+V-a8vxUjTWccV-wLgy5CJiFYfEMsx-f+8weCJDP6=
uD_dh4AA@mail.gmail.com/
>
> Yeah I replied, the callbacks in struct irq_chip rzg2l_gpio_irqchip
> should be calling the following callbacks:
>
Sorry I wanted to do some poc before I responded to your email.

> /* lock/unlock as IRQ */
> int gpiochip_lock_as_irq(struct gpio_chip *gc, unsigned int offset);
> void gpiochip_unlock_as_irq(struct gpio_chip *gc, unsigned int offset);
>
> In its
> .irq_request_resources and .irq_release_resources callbacks.
>
> And it currently doesn't even define these callbacks.
>
> If the driver was using the GPIOLIB_IRQCHIP and adding the
> irqchip in the standard way along with the gpiochip, this would
> not be a problem.
>
> Can you look into simply using GPIOLIB_IRQCHIP like most
> other drivers as well?
>
Thanks for the pointers, I'll investigate and add support for it.

Cheers,
Prabhakar

