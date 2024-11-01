Return-Path: <linux-gpio+bounces-12475-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C089B99A8
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 21:50:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8A43282989
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 20:50:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E54E1DDA30;
	Fri,  1 Nov 2024 20:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="tV3bu0og"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D44168DA
	for <linux-gpio@vger.kernel.org>; Fri,  1 Nov 2024 20:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730494229; cv=none; b=D9uzDICkfc3ipyn+UXbb1p/LXqh0BfywHoVUmmCMMy9SzgrxSEKOqwH6kiU9aRbMDaCyvrp+YvQYduQxJNhnJtjc7YRJgLR4jan5QMR1K/bquLJFIfjgNphyEBuEnfG/Zp9k83XpDr9mBavCAmTKEItddfeAJRIIdVKporMbf4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730494229; c=relaxed/simple;
	bh=lQ8AhHOFNGp1qoiEQumxXD+R7FDLu6a506cYTPU0qeY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HP2T0Hel86HdnI+QWWb8L8oBCE7Ga2HprGxaWUmEW3OB7XDQu29vSq9u2/H9QcoQ0T3pZu8eqaRcVrqw6WLBzvRHIONOiAUyFryjc4Mig1sVCsGEDiumZH8lpA4cFqxiVOYqapXu9SlJH6tGwL7Q5u5hKa4+I78c6yiRkGu7RaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=tV3bu0og; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-539e4b7409fso2215151e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 01 Nov 2024 13:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1730494225; x=1731099025; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cYckJ3hztD3ou49mgQz2VrIphCCPVqjrMy/+vNG+dOk=;
        b=tV3bu0ogsEHDLcYVAlNEY1TqlEb9wrpXQDqFoONTTReAPlzZJGhEXpLIjiFuvqijKx
         aXjoboUJiQfCvExwpksQgEFXUz7hdkuipjmtFeqUR0PDNTq7wDsfDeZdGuubCw++5nbS
         NnXJdP2wQhiY5fi5Ed3k8MPSI7HbqIcxRmmw5kFglBNEDWF6mXXCpaBMpnPZv830rFKA
         EYRFpK1lpzDjwq//s6ZEwt+pJ9R4SyyvUPbLW1hDC6LVzJf1xJbqVnAvPyCwAhpFVbSH
         qWkiNsScA8SC+ST6FqupjIYYLFWkBh45ccHPwuOHoSfPomaCIwA2YbJ6zAFOB8h5hcKp
         /QHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730494225; x=1731099025;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cYckJ3hztD3ou49mgQz2VrIphCCPVqjrMy/+vNG+dOk=;
        b=e1oF8KzpVbnSc+YBg0qNnOusHLxLWQH+a0v1mzQ4bcLzaEMAsrNrvlC6n3zagxDCe9
         5Yi9Wfol49BXs9f8623GAoFsIRDOS0CEna9imFYxK+9Ksh25AkGdVwM9lhIgRvgJyFc7
         tGaoM90XwHBt33UgMcvuzu7SD/F5vG6sOA5pr2nFF4K7C9yHeyjaLavQlOm6RfLP338V
         rG9Vj1jDAlwgpZ1SWtv/TeNAcvexYbEXEf3+8EdUWZiPMkcfEfPOt+/qSVMpA+2AmV60
         EkcUze6nmkoscymlMKau0LyN077u9jIM5F49HHZDutq+2lhxdWlUCtgVccEHPA/K+Rgw
         q+Uw==
X-Gm-Message-State: AOJu0YxmwUGga0HeXAag2GkPtwOnrQ2M+Eo1qRnwYGCZGkrLCEq403h5
	yJ22YlyBMO7D3tSyxDsRlOICjzKTrLLoXobniif9TpUaXyBDzB1l76ExPoKWLxtINzOtNn+Bk9C
	8FmLXzfBccpkvQSd+CPg2EZfkNpjcAGYJNtDM5g==
X-Google-Smtp-Source: AGHT+IF+MBFvL3LEaFOo9hECao+448u0idzvhYd6/yEiUQG2V0TD0o0QTGiLcux3VMtuKCFXqHwuS8HUcicX1Vxq0aI=
X-Received: by 2002:a05:6512:3d17:b0:539:fbf8:5735 with SMTP id
 2adb3069b0e04-53c7bbdd126mr2981115e87.8.1730494224899; Fri, 01 Nov 2024
 13:50:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241031-scouting-earmark-6b4dfc6bc6e2@spud> <20241031-appease-purse-55145b5dfba4@spud>
 <CAMRc=Men4sxFdSVR_WaJEG1UM7dXeGxTbw0=M_y3NsBmEOZzmQ@mail.gmail.com>
 <20241101-cadmium-speed-78ff7577347a@spud> <CAMRc=Mccc2tD2ZNQWpf6_wFt76p1ckyAqw-u6DBObgJV3n50CQ@mail.gmail.com>
 <20241101-affirm-evict-bbd862b08832@spud> <CAMRc=MfSOUCFBjqeHwyMgKmNWb4==4=kwdT+aUtPHWKuiWm0aA@mail.gmail.com>
 <20241101-culprit-ascend-de1a8f1967d7@spud> <CAMRc=MfhwPij=t+PBicHCE6xsfBxYeKK1+r5UKMZ5vqHAbuZ2w@mail.gmail.com>
 <20241101-impeding-outpour-e68b980c14b8@spud>
In-Reply-To: <20241101-impeding-outpour-e68b980c14b8@spud>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 1 Nov 2024 21:50:13 +0100
Message-ID: <CAMRc=Mfq70=x_4M_AKiAMm2V3ziMbzQm8EFYv1dwWztVZVnt5w@mail.gmail.com>
Subject: Re: [PATCH v9 1/1] gpio: mpfs: add polarfire soc gpio support
To: Conor Dooley <conor@kernel.org>
Cc: linux-gpio@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, valentina.fernandezalanis@microchip.com, 
	Linus Walleij <linus.walleij@linaro.org>, Lewis Hanly <lewis.hanly@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 1, 2024 at 4:16=E2=80=AFPM Conor Dooley <conor@kernel.org> wrot=
e:
>
> On Fri, Nov 01, 2024 at 03:32:16PM +0100, Bartosz Golaszewski wrote:
> > On Fri, Nov 1, 2024 at 3:28=E2=80=AFPM Conor Dooley <conor@kernel.org> =
wrote:
> > >
> > > On Fri, Nov 01, 2024 at 02:47:51PM +0100, Bartosz Golaszewski wrote:
> > > > On Fri, Nov 1, 2024 at 2:37=E2=80=AFPM Conor Dooley <conor@kernel.o=
rg> wrote:
> > > > >
> > > > > On Fri, Nov 01, 2024 at 02:09:06PM +0100, Bartosz Golaszewski wro=
te:
> > > > > > On Fri, Nov 1, 2024 at 1:17=E2=80=AFPM Conor Dooley <conor@kern=
el.org> wrote:
> > > > > > >
> > > > > > > On Thu, Oct 31, 2024 at 02:00:22PM +0100, Bartosz Golaszewski=
 wrote:
> > > > > > > > On Thu, Oct 31, 2024 at 1:04=E2=80=AFPM Conor Dooley <conor=
@kernel.org> wrote:
> > > > > > >
> > > > > > > > > +       mpfs_gpio->gc.direction_input =3D mpfs_gpio_direc=
tion_input;
> > > > > > > > > +       mpfs_gpio->gc.direction_output =3D mpfs_gpio_dire=
ction_output;
> > > > > > > > > +       mpfs_gpio->gc.get_direction =3D mpfs_gpio_get_dir=
ection;
> > > > > > > > > +       mpfs_gpio->gc.get =3D mpfs_gpio_get;
> > > > > > > > > +       mpfs_gpio->gc.set =3D mpfs_gpio_set;
> > > > > > > > > +       mpfs_gpio->gc.base =3D -1;
> > > > > > > > > +       mpfs_gpio->gc.ngpio =3D ngpios;
> > > > > > > >
> > > > > > > > The "ngpios" property will be parsed by GPIO core so no nee=
d to set it.
> > > > > > >
> > > > > > > Are you sure it'll work here? I tried dropping the ngpios par=
sing, but I
> > > > > > > get:
> > > > > > > gpiochip_add_data_with_key: GPIOs 0..-1 (20122000.gpio) faile=
d to register, -22
> > > > > > >
> > > > > > > That's coming from the device_property_read_u32(dev, "ngpios"=
, &ngpios);
> > > > > > > in gpiochip_get_ngpios(). Checking against the bluefield driv=
er and the
> > > > > > > code in gpiochip_add_data_with_key(), it's not immediately ob=
vious what
> > > > > > > I am missing.
> > > > > >
> > > > > > Does dev have an fwnode correctly assigned? What does dev_fwnod=
e(dev) return?
> > > > >
> > > > > It's not a null pointer or something obviously wrong by virtue of=
 being
> > > > > null-adjacent, it is a virtual address but not one that %ps can i=
dentify.
> > > >
> > > > This is an OF system right? If you do dev_of_node(dev), does the
> > > > returned node->name show the OF node you expect?
> > >
> > > Yes.
> >
> > I mean inside gpiochip_get_ngpios(), sorry for confusion.
>
> That is what I checked actually, didn't think you'd ask me to check the
> one in probe that works.
>
> > > > Does it have the
> > > > "ngpios" property? Can you read it with of_property_read_u32()?
> > >
> > > No, EINVAL there too.
> >
> > I assume the node is not assigned correctly. What if in your probe you
> > do: gc->fwnode =3D dev_fwnode(dev)?
>
> Makes no difference, same probe failure as before...
>
>
> ...but I just realised something: ngpios isn't a required property for
> this device as it has a default of 32 and 32 is how many gpios this
> controller has. Simple oversight, hours wasted. That's always the way of
> it I suppose. The core code can't be used here I suppose, since ngpios
> is optional.

Ah right. If we get to gpiochip_get_ngpios() without a GPIO number
set, the property becomes mandatory.

Nevermind my comment from the review then.

Bart

