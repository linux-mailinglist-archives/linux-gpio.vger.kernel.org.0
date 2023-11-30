Return-Path: <linux-gpio+bounces-798-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C87537FF8B0
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Nov 2023 18:46:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 56F2DB20DF7
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Nov 2023 17:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58EDD584C1;
	Thu, 30 Nov 2023 17:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="mFN//AFQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-x934.google.com (mail-ua1-x934.google.com [IPv6:2607:f8b0:4864:20::934])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CD6610DE
	for <linux-gpio@vger.kernel.org>; Thu, 30 Nov 2023 09:46:33 -0800 (PST)
Received: by mail-ua1-x934.google.com with SMTP id a1e0cc1a2514c-7c55a04cd9eso212776241.0
        for <linux-gpio@vger.kernel.org>; Thu, 30 Nov 2023 09:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701366392; x=1701971192; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WhlHn25QeHPYSjMHyn9yKbAJlm6toOyf7s9qJJhl0TU=;
        b=mFN//AFQpl7Ftr1iiWpcxvjubqFtRcaht1EvMAVPqLuZ0p/+7P7QmwuZzL1nYchx5p
         3iPZj5BYkLo72PE+YW+36PimC64m9G4QuhKKllb58iUQxTp+3gtoXE19aUwAmoXBds9P
         8xpWkuRFdPn6pop+QvPTfa7l0TQfubeZviB3nEpHBqx3CDdLrgYZrQc/1FOUhrqH24gc
         IljWU5Fvd6TNj+jefKqwRdk00WkfvmCLKFsE1dX5rw1l+pb9Ft5Cui/zOv3lofOgS5Iw
         dsbYNOL1y2/hNk2Y6xIIpz4+nbFovuuHXHvjhwyuV9HQ3iO3OQXju6bPJslEKOoxa0Ud
         noDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701366392; x=1701971192;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WhlHn25QeHPYSjMHyn9yKbAJlm6toOyf7s9qJJhl0TU=;
        b=gcVuRBypJ4u/4ahml3lBcdNrvJinXm/KuLQRGDhlCwY4BRoHi4x3xPFMPkaSII8ihH
         0nlmFlXl6EdngL6QaLo0WnFQO/wzqCzIQ8nP3pyZ/aIWjEKdBEucWRm2571cO+28dI0l
         rrQ4hVNmFU9zAkDXppV44QQ9fcYV2vSEcZNCFJHGEcZ86ngGeFBAgWypUNVmtYY18gwb
         fWB7hxq6SLiQ5TH1/Og3sPCI4nFUQdkJJIYkCeekb9i14wCAMU5Ng96J0yzakr5AN2Tz
         4eksHOBKpHN9sBLIkiJ0/7icmtdxz8R9TSBIDPnrcKu00UdV+lxEzaPtySo5Ho2UR1pd
         RYMQ==
X-Gm-Message-State: AOJu0YzxiljEgUMYYcz9UVee2FikOPltjweWUeBokz77mectB23CpKMS
	AN+F+4wPMllpKq+K1u0InVVZiJ9nxoHVFp4IwneG/AoX71qwG4P+
X-Google-Smtp-Source: AGHT+IGZP8hjbo4MKcnG+l1MjuGzVxe7X8C2UCXD0GfRN+1nVFxVu8VDRCBLE2m3vSP/3CtSfMNJxiwCPiL84Zfh1oI=
X-Received: by 2002:a67:e3d9:0:b0:464:5b30:1f78 with SMTP id
 k25-20020a67e3d9000000b004645b301f78mr2303709vsm.26.1701366391796; Thu, 30
 Nov 2023 09:46:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231130134630.18198-1-brgl@bgdev.pl> <20231130134630.18198-11-brgl@bgdev.pl>
 <ZWi8X7pQpUm-nIpN@smile.fi.intel.com>
In-Reply-To: <ZWi8X7pQpUm-nIpN@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 30 Nov 2023 18:46:20 +0100
Message-ID: <CAMRc=McpYK9vLA65zdoteUa72_cpwzmv3X_pZt5purocDYBJnw@mail.gmail.com>
Subject: Re: [PATCH v2 10/10] gpiolib: remove gpiochip_is_requested()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2023 at 5:46=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Nov 30, 2023 at 02:46:30PM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > We have no external users of gpiochip_is_requested(). Let's remove it
> > and replace its internal calls with direct testing of the REQUESTED fla=
g.
>
> ...
>
> > -     cpy =3D kstrdup(label, GFP_KERNEL);
> > -     if (!cpy)
> > -             return ERR_PTR(-ENOMEM);
> > +     scoped_guard(spinlock_irqsave, &gpio_lock) {
> > +             if (!test_bit(FLAG_REQUESTED, &desc->flags))
> > +                     return NULL;
>
> > +             cpy =3D kstrdup(desc->label, GFP_KERNEL);
> > +             if (!cpy)
> > +                     return ERR_PTR(-ENOMEM);
>
> You just introduced these lines earlier in the series, and here you moved
> them again. With guard() instead it may be kept in a better shape.
>

I wanted to limit the critical section to a minimum hence scoped
variant. And this will go away as soon as we have a desc lock so it's
temporary anyway. What matters to me is how the code looks when
sending it to Torvalds. On the off chance that we don't get the
locking rework merged in time for v6.8, I want this to at least be
under the existing lock.

Bart

> > +     }
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

