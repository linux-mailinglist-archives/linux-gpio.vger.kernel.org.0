Return-Path: <linux-gpio+bounces-12466-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A4B9B9348
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 15:32:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 023591C20F41
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 14:32:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B29C1AA787;
	Fri,  1 Nov 2024 14:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="u7dsnBWD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18111A727F
	for <linux-gpio@vger.kernel.org>; Fri,  1 Nov 2024 14:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730471551; cv=none; b=q0CIiRqW4YcnDXFxL9kZx6kpiCM3EI4N7f+Qip7xobutO+X80qGcQTVXfGe+iTMe3kGnAmIEOKk+/yk03ZKF6EAKt7ACdi3cOOhNcK0FHGGi5tnKPBei2HqcKZgC3OUhc5TnVK8QTFHB8nHR20OEJv+TZnhW+XvRnpv1C6gg1iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730471551; c=relaxed/simple;
	bh=bkAPgEsow5iij4uYTkHXF1Qb9lXnLVf9f5VgBdEJLgQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SdFqXnhiRMT4DJQcHfqZDOC1wG2gRRNHk30610lx+68/8j+QL6nYjP2BDY5cheraW/Wb/ukXmjOf0h1Rk9Odz8F4IOO2n87mC9Hxh8OKB1vGZgGdHQP7Z19fUNMQuwejVLcmwdxsbnpyCPspRNDa/5FxPUAhwhNFEn5sajsNb0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=u7dsnBWD; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2fb599aac99so18392151fa.1
        for <linux-gpio@vger.kernel.org>; Fri, 01 Nov 2024 07:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1730471548; x=1731076348; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tDOy0cOtGPA0M4sqOvktcHNZh/QP+XtR3qZUrxtbbEg=;
        b=u7dsnBWDSGjKqbCp4mJZu++Ea+VKA5XWQ0q3YAIIsTDP3ELwN8+J158V+THOhTcXum
         QX8CzkrASDp6iq3gqigv13CY2EI48ZOV6JLgCtvW1X4oSubCycDmcLFnlbB6py0QEU98
         /+D8fRAv2jHlBTNvJZp/fEeN2zhtPslXzbho4D848glCzWK4U28Rqz5uASwL/sGe16Vc
         O/4aqHRZ9qG4SmrlWOdH9U8upkktsxjw2cA974qxRGdGfYyIFPnnL7aSSKAoYYC9Xk1q
         lmNep8HCt0f+aJYf3hici3/DiuNY8ETeHJeElvK0wPzGvsKZaA+kJU/zU3gcO6/CP2HT
         mECA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730471548; x=1731076348;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tDOy0cOtGPA0M4sqOvktcHNZh/QP+XtR3qZUrxtbbEg=;
        b=lRp90ymzfhBieyT8K2Q5lM+x4MyZOOvHILNFiu+vW5kcr5l8xLnjcTanFvhiafyy1a
         iur3voicn33aYUwjyLIhtCwYHXtFjACDrfUQlmRrwDNKhatfIfbRnlb2RKpJj3pwOqBd
         t3tV/G3LdzGWElNA/ZazpcCQk+CMzoeXLLnMO4LvNb8Uxu/W3qRStZ1WcQaVP65boeai
         2gsz8u99Pg/Ha6B2MTDf4d1REl891nw01qHNU27UyRsKsZ20Bs6waCRm6LE6ojdRlS0n
         R5Yupj5vKDTYkkLF+dQ659vsUMvbUECriWTZOw2PEkP/1HHLzDr9mvpsafWVcyqM9zLF
         NSUQ==
X-Gm-Message-State: AOJu0YxQK4e1LlrpZpWP2kEPoSt9yfYHGu4Jixgmq1Hzp7QUbZUJMDyx
	zybasbImvFQBGFL72R+IjqOjbb4cgFU/PyD8PcMe+Bfs6E76Ab4H34Ij1umY3feUsa1XYnw+t/5
	UpjfnGG/9mZDzV6smhZUpZdmSbU3BFNWlwPmncA==
X-Google-Smtp-Source: AGHT+IFe8JDOcQCMzCVUmJGLtsWjx3RZpVVlFuAKhqouiy88ZZX4htTxtOPKfM6Kj7wiU3E/0yLynyTwuvE59cFE7m4=
X-Received: by 2002:a05:651c:19a0:b0:2fa:c6b3:bf1c with SMTP id
 38308e7fff4ca-2fedb794b76mr21407531fa.8.1730471547765; Fri, 01 Nov 2024
 07:32:27 -0700 (PDT)
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
 <20241101-culprit-ascend-de1a8f1967d7@spud>
In-Reply-To: <20241101-culprit-ascend-de1a8f1967d7@spud>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 1 Nov 2024 15:32:16 +0100
Message-ID: <CAMRc=MfhwPij=t+PBicHCE6xsfBxYeKK1+r5UKMZ5vqHAbuZ2w@mail.gmail.com>
Subject: Re: [PATCH v9 1/1] gpio: mpfs: add polarfire soc gpio support
To: Conor Dooley <conor@kernel.org>
Cc: linux-gpio@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, valentina.fernandezalanis@microchip.com, 
	Linus Walleij <linus.walleij@linaro.org>, Lewis Hanly <lewis.hanly@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 1, 2024 at 3:28=E2=80=AFPM Conor Dooley <conor@kernel.org> wrot=
e:
>
> On Fri, Nov 01, 2024 at 02:47:51PM +0100, Bartosz Golaszewski wrote:
> > On Fri, Nov 1, 2024 at 2:37=E2=80=AFPM Conor Dooley <conor@kernel.org> =
wrote:
> > >
> > > On Fri, Nov 01, 2024 at 02:09:06PM +0100, Bartosz Golaszewski wrote:
> > > > On Fri, Nov 1, 2024 at 1:17=E2=80=AFPM Conor Dooley <conor@kernel.o=
rg> wrote:
> > > > >
> > > > > On Thu, Oct 31, 2024 at 02:00:22PM +0100, Bartosz Golaszewski wro=
te:
> > > > > > On Thu, Oct 31, 2024 at 1:04=E2=80=AFPM Conor Dooley <conor@ker=
nel.org> wrote:
> > > > >
> > > > > > > +       mpfs_gpio->gc.direction_input =3D mpfs_gpio_direction=
_input;
> > > > > > > +       mpfs_gpio->gc.direction_output =3D mpfs_gpio_directio=
n_output;
> > > > > > > +       mpfs_gpio->gc.get_direction =3D mpfs_gpio_get_directi=
on;
> > > > > > > +       mpfs_gpio->gc.get =3D mpfs_gpio_get;
> > > > > > > +       mpfs_gpio->gc.set =3D mpfs_gpio_set;
> > > > > > > +       mpfs_gpio->gc.base =3D -1;
> > > > > > > +       mpfs_gpio->gc.ngpio =3D ngpios;
> > > > > >
> > > > > > The "ngpios" property will be parsed by GPIO core so no need to=
 set it.
> > > > >
> > > > > Are you sure it'll work here? I tried dropping the ngpios parsing=
, but I
> > > > > get:
> > > > > gpiochip_add_data_with_key: GPIOs 0..-1 (20122000.gpio) failed to=
 register, -22
> > > > >
> > > > > That's coming from the device_property_read_u32(dev, "ngpios", &n=
gpios);
> > > > > in gpiochip_get_ngpios(). Checking against the bluefield driver a=
nd the
> > > > > code in gpiochip_add_data_with_key(), it's not immediately obviou=
s what
> > > > > I am missing.
> > > >
> > > > Does dev have an fwnode correctly assigned? What does dev_fwnode(de=
v) return?
> > >
> > > It's not a null pointer or something obviously wrong by virtue of bei=
ng
> > > null-adjacent, it is a virtual address but not one that %ps can ident=
ify.
> >
> > This is an OF system right? If you do dev_of_node(dev), does the
> > returned node->name show the OF node you expect?
>
> Yes.

I mean inside gpiochip_get_ngpios(), sorry for confusion.

>
> > Does it have the
> > "ngpios" property? Can you read it with of_property_read_u32()?
>
> No, EINVAL there too.

I assume the node is not assigned correctly. What if in your probe you
do: gc->fwnode =3D dev_fwnode(dev)?

Bart

