Return-Path: <linux-gpio+bounces-27883-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A08C23FB9
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Oct 2025 10:02:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B428E4F1ABD
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Oct 2025 09:01:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92CAE32E698;
	Fri, 31 Oct 2025 09:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LVppijZ0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7067032E132
	for <linux-gpio@vger.kernel.org>; Fri, 31 Oct 2025 09:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761901261; cv=none; b=Lbj9HeS2LrHBTW/G2m/rI6gjvjzoKx4x4rMtNb/Ybpqja8ze4pUx+qvNPKRCStieXLp8K2x6anwani5zSAhO6i934UDNSKHyTt9KCXgG/nrn3bn2onS7a/4/Yr/vFX9Kun4uk61g81HTKTigk+oq4cjjbKb+Dpw7G0xTloTVEZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761901261; c=relaxed/simple;
	bh=kfJpm0mLG9RdVDLearjYwAtnnJ9GdvDB4BJl81FcoME=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pANwkjiXBO8Vozn4ZRPI1BDVx7PMo8InfUfvyK8IVhAylpy+PKjfVFC2h8cEC9ctJAu0FgOkotyeBePnUj9ODtK4EfRVbsLISDAnZyJQVAuBmgRfaQaGvhcaAVUGwAmPjfGf/kf3EI39R1r/cW0q6S345IbK0cCcFP3zf9h/DX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=LVppijZ0; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-57bd04f2e84so2515927e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 31 Oct 2025 02:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761901256; x=1762506056; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U2zWXQAb4J66gJtbZXDf79DLTVt9tmjwLAqTV9wFU9Q=;
        b=LVppijZ0bwV1UeNDdSHBcJd9EMgD9LrVMFS43UPzvOIZftr2Z4K0+RkELCXNIrXuqT
         98mRxZSsufxOpKzDwLO1ToPsQDaRKnWiF+Gry3IoZuTZUfY6In7qkCLeNzv3jjIKDf2t
         xPJgkaY0pXusnA+i2bvyuBBkafcjfuxy+QPu1ZlhsAGpGAvMtBv1uM5VHdjITIGKlQRq
         +IL+G/kBLqXjzoHHTwfw8JmHQRzdPUWwzKCo+G57EotNczvO13gSZ/m7JzYCu4ZGEK0T
         SnBLunfpWe/pwRkOLWfmeaLnYV7os2ZfIBYy2SDsnyzP35tP8pi6W/nU/bYGC+1ZO+Bi
         h9FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761901256; x=1762506056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U2zWXQAb4J66gJtbZXDf79DLTVt9tmjwLAqTV9wFU9Q=;
        b=e2fLuAg4yAkxkhubsteWVo6qe0knOk/NmIpqiC42SY9n7x7qQX02++LWrHT4/vmRys
         uNEjYK2+XKQKSuKvTGhHVELQVWvwy8GZLb/KLa29uKhGZVjIA6V8iEcXCSPV3011virk
         ZYrDISb7IyvSnwwA9E66RGJLYr6pEfOajfez9yTcCe41mGqRJyux0H3LuB06KId9dyeG
         r7KeEjA2UIbtnXQhqvk2t2BBv7uD1btfuJWb8NHzJhiE3bkCDPzh3RWScpXKX1AWWHwa
         f1LDsagSip006BP0PDvBOfOpuMmm1U90dthLJZdNmvK92I8YEIpb+5CtO/25tdKCyrTb
         u9/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWzwFcASLcoPt7sDPrpQmbfwdvYyOJ7KVXh7BTONp3qh8/xY1vun3binV9Og5++C3j8Yhl93zcotF4D@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt7gQAXQJ76I81vtgG78s/dFcdgGIO0Qf0yIm1F2wfe8h+ttST
	EwsYHfoGTnlyLpqNaexOt8/D0OTMk26TSUjHLWJQxduT/JJuLA9ElyTSPWGIaQBSEXJLOk8qmGK
	iktQy2pC06U2aXRlTIk5WqMhv4OZsnQzRK4LpII7bSw==
X-Gm-Gg: ASbGncuTju+bhJsxsL6VseKEkz5jx1EDBWo1hK1WMB5Be8aR+4KfeYLFRq4gq5OnJh+
	LG5It1vowcxUhnj1OhKB3IzEY0ySOB4XNukhwxFYDnO6BrRTrRBHbBddZxU/tkevEcqP4UI2Psg
	gTja40TYoO/MlQNNzI+4xAXuLsd2WczaC9O7+fXgEd0FXOwsid2jZNBf/kGlnITqF92CJlLB6JH
	IPJS6oWYRbeAvseWHE1Zrq736f19pofDbwWLVrMT1C+EYOke+GfXO1Fqn9Kh/1j6X0DllOTp+5L
	sUzVWnqXpvUhWS+G
X-Google-Smtp-Source: AGHT+IH9CdyA/9CpR4yuZJkUQBQIcmzJf4sYm4WcPQACoUSrA5BoL7natdG3cIpjNxAp+exZosbxpHf54nNaLort178=
X-Received: by 2002:a05:6512:3e0d:b0:592:f9c6:9736 with SMTP id
 2adb3069b0e04-5941d563fdfmr953358e87.56.1761901249206; Fri, 31 Oct 2025
 02:00:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251029-reset-gpios-swnodes-v3-0-638a4cb33201@linaro.org>
 <20251029-reset-gpios-swnodes-v3-3-638a4cb33201@linaro.org>
 <aQMy00pxp7lrIrvh@smile.fi.intel.com> <CAMRc=MdP58d=o7ZL4bAdsaYwzrs6nJo3bhS7Jf1UkDNwPOnAsg@mail.gmail.com>
 <aQRyFSHWzccTPa3M@smile.fi.intel.com>
In-Reply-To: <aQRyFSHWzccTPa3M@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 31 Oct 2025 10:00:37 +0100
X-Gm-Features: AWmQ_bknobk-QJWbVtapIqlH_lufop-oiWv3enLciZJOoLidz7raNrtQVaowNic
Message-ID: <CAMRc=McT+Q8ZVk9_HTyWd6uS0OoP92E_phwef7CDyDVeNbJCqA@mail.gmail.com>
Subject: Re: [PATCH v3 03/10] software node: allow referencing firmware nodes
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-acpi@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 31, 2025 at 9:24=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Oct 30, 2025 at 04:17:48AM -0700, Bartosz Golaszewski wrote:
> > On Thu, 30 Oct 2025 10:41:39 +0100, Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> said:
> > > On Wed, Oct 29, 2025 at 01:28:37PM +0100, Bartosz Golaszewski wrote:
> > >>
> > >> At the moment software nodes can only reference other software nodes=
.
> > >> This is a limitation for devices created, for instance, on the auxil=
iary
> > >> bus with a dynamic software node attached which cannot reference dev=
ices
> > >> the firmware node of which is "real" (as an OF node or otherwise).
> > >>
> > >> Make it possible for a software node to reference all firmware nodes=
 in
> > >> addition to static software nodes. To that end: add a second pointer=
 to
> > >> struct software_node_ref_args of type struct fwnode_handle. The core
> > >> swnode code will first check the swnode pointer and if it's NULL, it
> > >> will assume the fwnode pointer should be set. Rework the helper macr=
os
> > >> and deprecate the existing ones whose names don't indicate the refer=
ence
> > >> type.
> > >>
> > >> Software node graphs remain the same, as in: the remote endpoints st=
ill
> > >> have to be software nodes.
> > >
> > > ...
> > >
> > >> -#define SOFTWARE_NODE_REFERENCE(_ref_, ...)                       \
> > >> +#define __SOFTWARE_NODE_REF(_ref, _node, ...)                     \
> > >>  (const struct software_node_ref_args) {                           \
> > >> -  .node =3D _ref_,                                          \
> > >> +  ._node =3D _ref,                                          \
> > >>    .nargs =3D COUNT_ARGS(__VA_ARGS__),                       \
> > >>    .args =3D { __VA_ARGS__ },                                \
> > >>  }
> > >
> > > Okay, looking at this again I think we don't need a new parameter.
> > > We may check the type of _ref_
> > > (actually why are the macro parameters got renamed here and elsewhere=
?)
> > > and assign the correct one accordingly. I think this is what _Generic=
()
> > > is good for.
> > >
> >
> > Oh, that's neat, I would love to use _Generic() here but I honest to go=
d have
> > no idea how to make it work. I tried something like:
> >
> > #define __SOFTWARE_NODE_REF(_ref, ...)                          \
> > _Generic(_ref,                                                  \
> >         const struct software_node *:                           \
> >                 (const struct software_node_ref_args) {         \
> >                         .swnode =3D _ref,                         \
> >                         .nargs =3D COUNT_ARGS(__VA_ARGS__),       \
> >                         .args =3D { __VA_ARGS__ },                \
> >                 },                                              \
> >         struct fwnode_handle *:                                 \
> >                 (const struct software_node_ref_args) {         \
> >                         .fwnode =3D _ref,                         \
> >                         .nargs =3D COUNT_ARGS(__VA_ARGS__),       \
> >                         .args =3D { __VA_ARGS__ },                \
> >                 }                                               \
> >         )
> >
> >
> > But this fails like this:
> >
> > In file included from ./include/linux/acpi.h:16,
> >                  from drivers/reset/core.c:8:
> > drivers/reset/core.c: In function =E2=80=98__reset_add_reset_gpio_devic=
e=E2=80=99:
> > drivers/reset/core.c:958:52: error: initialization of =E2=80=98const st=
ruct
> > software_node *=E2=80=99 from incompatible pointer type =E2=80=98struct=
 fwnode_handle
> > *=E2=80=99 [-Wincompatible-pointer-types]
> >   958 |                                                    parent->fwno=
de,
> >       |                                                    ^~~~~~
> > ./include/linux/property.h:374:35: note: in definition of macro
> > =E2=80=98__SOFTWARE_NODE_REF=E2=80=99
> >   374 |                         .swnode =3D _ref,                      =
   \
> >
> > So the right branch is not selected. How exactly would you use it here?
>
> I believe this is an easy task.
>
> But first of all, your series doesn't compile AFAICS:
>
> drivers/reset/core.c:981:6: error: variable 'ret' is used uninitialized w=
henever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
>   981 |         if (IS_ERR(rgpio_dev->swnode))
>       |             ^~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/reset/core.c:1001:9: note: uninitialized use occurs here
>        1001 |         return ret;
>             |                ^~~
> drivers/reset/core.c:981:2: note: remove the 'if' if its condition is alw=
ays false
>   981 |         if (IS_ERR(rgpio_dev->swnode))
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   982 |                 goto err_put_of_node;
>       |                 ~~~~~~~~~~~~~~~~~~~~
> drivers/reset/core.c:905:13: note: initialize the variable 'ret' to silen=
ce this warning
>   905 |         int id, ret, lflags;
>       |                    ^
>       |                     =3D 0
> 1 error generated.
>

You're not wrong but for the record: it builds fine for me with
aarch64-linux-gnu-gcc 14.2 for some reason so I didn't notice it. I'll
fix it.

> So, but to the topic
>
> I have applied this and get the only error as per above
>
>  (const struct software_node_ref_args) {                                \
>  -       ._node =3D _ref,                                          \
>  +       .swnode =3D _Generic(_ref, const struct software_node *: _ref, d=
efault: NULL), \
>  +       .fwnode =3D _Generic(_ref, struct fwnode_handle *: _ref, default=
: NULL), \
>

That works, thanks for the idea.

Bartosz

