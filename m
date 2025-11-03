Return-Path: <linux-gpio+bounces-27954-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B05C1C2B1A0
	for <lists+linux-gpio@lfdr.de>; Mon, 03 Nov 2025 11:39:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5433B18906C7
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Nov 2025 10:37:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D2082FF144;
	Mon,  3 Nov 2025 10:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="iv5OUXrD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038AB2FD7B9
	for <linux-gpio@vger.kernel.org>; Mon,  3 Nov 2025 10:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762166213; cv=none; b=QWPB3zUtNJqGejHuZTGYHWvs69/pLsGR7rvaWlylHaZDNenrhHUe+eRHFpnAatkl2vcrIUmeRfAWey16Pf8uyBpiF7JHoi3lh/paIgXJBwsCDRM+zbgTq99JXPxIUfGyCw6yL/t1jS6XV8ukCJX4wzO2HyQiJUdI78+QnFDk+w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762166213; c=relaxed/simple;
	bh=+MmxogPhCLs9ZpI9QmsWexfExGRNeJu+3ZnjBRPUXe4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZRaV+SWpGQItbPWjdAJ+pxr42YpgiT51alX0NedXZOIUTRagHpLdJNg++e2CLPif9ai0MWZKSjo+g9b4lbuwrp/NQUIocomXK4IF4w7yToyUhZAaS2wWjrSCRg4xdAAu4KttK/hHApVuKtevAv8bsvBXim+r0s6Rc0nXnnHA9Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=iv5OUXrD; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-378d50e1c82so40437441fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 03 Nov 2025 02:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762166210; x=1762771010; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XjLBSonYsqmv8UYBTszg3fkXjFKAEIXlmbkscAA6YbA=;
        b=iv5OUXrDCZogogcKkaAr2xU9qPJ09nejdz8PXi5j3gPIVivtB1RBQgE/F3QQ1nGwJy
         GM9OxBnVhI69OguE+YQ7/B/GI52YjpVurtceaK4SWItb4Ti4zaspM7rSK1pjYPgrf+Mr
         A1gvN1fUAPQGqfCrRl7KInQJhbEXUifSN+iXHGctNMfg1p8gdekdjQKk6gv4Jrsmv634
         YBcUTXIAutvtHOfq+12fr44JLfo+3VEqlNnL6rW457Y8XcOpWL0t/zWO1O6idx/UMzUX
         Dm7X27jtovNir7m0HYSf8kz6CqTWalrqRMx+znF2vcqmeFUXZuqRVoEqVlC/emLTmyhs
         FqJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762166210; x=1762771010;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XjLBSonYsqmv8UYBTszg3fkXjFKAEIXlmbkscAA6YbA=;
        b=MCfE1nQLxV55pPpnhFlkJF3OUbFWYZn8CiQuAa0/7gb3n8sWxRsXUTpsxZM7Xati9c
         xeqAPZI1eMvSdt3qQ0nKUfXtuAE6rUGRgoir+jd0ngboSEybrj2LedKbOsSUwhMUjn7g
         4AMiQzMGvcHffWrDObh1DdeseFDttznG7SkxvEBDt06Oh4B9G55mkJqa0ERxKNHU47CS
         LfPO17ElUp7Lnto76iZHpukUYoA8pz5af3XJNsYr9AbAaFXmJdS0rREx7yJM/g9gqk7x
         wUZVg3RTXr9XTx0GAXYPg33qbcBjzSOgHENYvWWxsz6SwnxiCAXThzUofj/oaKpoJEzo
         dF7g==
X-Forwarded-Encrypted: i=1; AJvYcCUd4yhrWonSFiG+1aDUoakh8sW8hms+cqrpvWE1ayP6FQwIO23XMgJpxxKI7qFgc+B7UOLTbwZUBNLb@vger.kernel.org
X-Gm-Message-State: AOJu0YxNSBbZBs1sWYLOC7K9p6axrFpxXfkPbaGeKbl1XdEM0AYJL5F9
	vIGiJkGs2ArLMFqrU2AEz5/aSPhOsnCICwGajspKp5dtyMRd1UGUsfTg/QOAYAtamT1fPU1kqkq
	3PaGETQENZ+H44GE5Ie5JWoC9bRRQDprYvlYgdSOJxw==
X-Gm-Gg: ASbGncvoAeo5ND1OUAh3/3T06wAdadq6fV4IASRDJc8Gz6Q2YY9t+APgtn61859mbUP
	KEAw6+7Cg03qlx21extOsNzxT1t/5KCElnV//gkntNbMQlTB1buAdpSa1H13YZx1bVaRFE5jfZG
	BCIwO09tXWNJb71msKU7Te9/EIWv4LxVUA7GpCMKRXkSGUh/c5P+zU+Sc5pqGvzgJ2j4DQDScZa
	PG8Ynqfvqwr667x27HLpVcY54i3pZNgnPjzfRGO5WdGawKYwGrAa45CAs23migfeLjI15awLziP
	vP7p7PZJkFRT1fckl2CJ7N0hUHw=
X-Google-Smtp-Source: AGHT+IE87NQ2wrN4nbBrNGJFPIv5zQc1LIytN9zHMv4eWDwdCr6Is7aAXMrMg0as6kgGpZ9GoAeO7eWblG8JuiJzHas=
X-Received: by 2002:a2e:be27:0:b0:37a:2b3d:12cc with SMTP id
 38308e7fff4ca-37a2b3d178fmr22342871fa.44.1762166210020; Mon, 03 Nov 2025
 02:36:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251103-reset-gpios-swnodes-v4-0-6461800b6775@linaro.org>
 <20251103-reset-gpios-swnodes-v4-3-6461800b6775@linaro.org> <aQh6n2XuI0oayg2g@smile.fi.intel.com>
In-Reply-To: <aQh6n2XuI0oayg2g@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 3 Nov 2025 11:36:36 +0100
X-Gm-Features: AWmQ_bkxzE88tRObcETZ4rhIp4MxY1YrBBIl6dy0Tsm5UlD4jZWeoUiNmbbz8tk
Message-ID: <CAMRc=Md=r7GaO3A_7de+EqzboyA2cqNSTZx7+64VSMvRBb9gpw@mail.gmail.com>
Subject: Re: [PATCH v4 03/10] software node: allow referencing firmware nodes
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

On Mon, Nov 3, 2025 at 10:49=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Nov 03, 2025 at 10:35:23AM +0100, Bartosz Golaszewski wrote:
> >
> > At the moment software nodes can only reference other software nodes.
> > This is a limitation for devices created, for instance, on the auxiliar=
y
> > bus with a dynamic software node attached which cannot reference device=
s
> > the firmware node of which is "real" (as an OF node or otherwise).
> >
> > Make it possible for a software node to reference all firmware nodes in
> > addition to static software nodes. To that end: add a second pointer to
> > struct software_node_ref_args of type struct fwnode_handle. The core
> > swnode code will first check the swnode pointer and if it's NULL, it
> > will assume the fwnode pointer should be set. Rework the helper macros
> > and deprecate the existing ones whose names don't indicate the referenc=
e
> > type.
> >
> > Software node graphs remain the same, as in: the remote endpoints still
> > have to be software nodes.
>
> ...
>
> > +     /*
> > +      * A software node can reference other software nodes or firmware
> > +      * nodes (which are the abstraction layer sitting on top of them)=
.
> > +      * This is done to ensure we can create references to static soft=
ware
> > +      * nodes before they're registered with the firmware node framewo=
rk.
> > +      * At the time the reference is being resolved, we expect the swn=
odes
> > +      * in question to already have been registered and to be backed b=
y
> > +      * a firmware node. This is why we use the fwnode API below to re=
ad the
>
> A nit-pick (since anyway it requires a new version): move 'the' to the ne=
xt
> line to make them more equal in the length.
>
> > +      * relevant properties and bump the reference count.
> > +      */
>
> ...
>
> > -#define SOFTWARE_NODE_REFERENCE(_ref_, ...)                  \
> > +#define __SOFTWARE_NODE_REF(_ref, ...)                               \
>
> No, NAK. The renaming of the parameters is not related to this change _at=
 all_.
> Why do you change established style here? Did I miss your answer to my qu=
estion
> in the previous rounds?
>

Ah, my brain just filtered out the trailing '_'.

> >  (const struct software_node_ref_args) {                              \
> > -     .node =3D _ref_,                                          \
> > +     .swnode =3D _Generic(_ref,                                \
> > +                        const struct software_node *: _ref,  \
> > +                        default: NULL),                      \
> > +     .fwnode =3D _Generic(_ref,                                \
> > +                        struct fwnode_handle *: _ref,        \
> > +                        default: NULL),                      \
> >       .nargs =3D COUNT_ARGS(__VA_ARGS__),                       \
> >       .args =3D { __VA_ARGS__ },                                \
> >  }
>
> ...
>
> > +#define SOFTWARE_NODE_REF_SWNODE(_ref, ...)                  \
> > +     __SOFTWARE_NODE_REF(_ref, __VA_ARGS__)
> > +
> > +#define SOFTWARE_NODE_REF_FWNODE(_ref, ...)                  \
> > +     __SOFTWARE_NODE_REF(_ref, __VA_ARGS__)
> > +
> > +/* DEPRECATED, use SOFTWARE_NODE_REF_SWNODE() instead. */
> > +#define SOFTWARE_NODE_REFERENCE(_ref, ...)                   \
> > +     SOFTWARE_NODE_REF_SWNODE(_ref, __VA_ARGS__)
>
> Now, useless.
>

No, why? With these changes, SOFTWARE_NODE_REFERENCE()'s name is a bit
misleading or incomplete, so I'm proposing to start replacing it with
SOFTWARE_NODE_REF_SWNODE() which is compatible with the former but has
a better name.

> ...
>
>
> > -#define PROPERTY_ENTRY_REF(_name_, _ref_, ...)                        =
       \
> > +#define __PROPERTY_ENTRY_REF(_type, _name, _ref, ...)                 =
       \
> >  (struct property_entry) {                                            \
> > -     .name =3D _name_,                                                =
 \
> > +     .name =3D _name,                                                 =
 \
> >       .length =3D sizeof(struct software_node_ref_args),               =
 \
> >       .type =3D DEV_PROP_REF,                                          =
 \
> > -     { .pointer =3D &SOFTWARE_NODE_REFERENCE(_ref_, ##__VA_ARGS__), },=
 \
> > +     { .pointer =3D &_type(_ref, ##__VA_ARGS__), },                   =
 \
> >  }
>
> Do we need this now? I assume that _Generic() takes case of this.
>

Ah, right, it should be done here as well.

> ...
>
> > +#define PROPERTY_ENTRY_REF_SWNODE(_name, _ref, ...)                  \
> > +     __PROPERTY_ENTRY_REF(SOFTWARE_NODE_REF_SWNODE,                  \
> > +                          _name, _ref, __VA_ARGS__)
> > +
> > +#define PROPERTY_ENTRY_REF_FWNODE(_name, _ref, ...)                  \
> > +     __PROPERTY_ENTRY_REF(SOFTWARE_NODE_REF_FWNODE,                  \
> > +                         _name, _ref, __VA_ARGS__)
> > +
> > +/* DEPRECATED, use PROPERTY_ENTRY_REF_SWNODE() instead. */
> > +#define PROPERTY_ENTRY_REF(_name, _ref, ...)                         \
> > +     PROPERTY_ENTRY_REF_SWNODE(_name, _ref, __VA_ARGS__)
>
> Seems like useless churn.
>

This is the same argument as with SOFTWARE_NODE_REF_SWNODE(). It's not
clear from the name what PROPERTY_ENTRY_REF() is really referencing.

Bart

