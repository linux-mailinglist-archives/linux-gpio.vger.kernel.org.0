Return-Path: <linux-gpio+bounces-17037-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F304A4DD9E
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 13:15:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3FF9A177EB3
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 12:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E937E1FF603;
	Tue,  4 Mar 2025 12:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="J1ruolJ8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E191EF390
	for <linux-gpio@vger.kernel.org>; Tue,  4 Mar 2025 12:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741090517; cv=none; b=E6RoFCcfdN4xxurSIbbsNL36n5SMEG9UjEvmbd1nL7A9PWn6VjW/kTXReGFpffpBPTEHjgYKfOWsvNj+2zVXYs3PcmT+lo5v520LTMzI+afonsnXKjKvPIDxQKMOitK2EQicuST6jzrL7MCtScLvJ6jSdrTLVSliHbxbjrNJn3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741090517; c=relaxed/simple;
	bh=Qow8xds9CZA9GIvGQvdDqUg80Y9c5uovg0RsurwB2cA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NxofHZw6tKoDhkfN5+Eyst3mmJXyCH/SmiEWhbwfvruco/cDJdGJcTn7wRSPxZ53H1yGD8cU21yJslsuTYmE6oxxvXhRHQopMa021wgOwQ95/YSXJqO3Qf9BuBKLd6vcF5hkgem43eu9XFg4brefamu2A1KjIarg2rZ6nnLD1pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=J1ruolJ8; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5495e926364so2524989e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 04 Mar 2025 04:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741090514; x=1741695314; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=26QQ4C9f8ZtK5Z3yV57qMJ+4CyZ13YCNpHk5Sha+078=;
        b=J1ruolJ8jBuW+2/InV3WVjqJx0VzeQJQyPd8/ZG1z/TbQ8KQrAw6B1YmBo4ufmw4Kc
         +ceznU1mMd+xpCHeqjHa1OEh/UYi0OBnTouupfMJ+pWq75DblTjyMSwTOEJocr/qPYX2
         eyiy/NI69Tw8OYfYqkUwn2nGdPI/8mfWF08wJr0MuNjz7WiMRpyLsG5MZYb2sz1rvqer
         ooCPJxVu6U0nOWfY2cU7rz3n0l8e0BqD96sr+QpSBxhE9oviu6XpE8UERNmsi5j9L9Ik
         efofBQ3/Y0+NoIhp2cszGOgDhGvwdOaDsCSXTxHmxkggAlQE71RlOGejGaZWaAU7vAIr
         q1fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741090514; x=1741695314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=26QQ4C9f8ZtK5Z3yV57qMJ+4CyZ13YCNpHk5Sha+078=;
        b=ej+5c6DU1igfTRtT5ksUacNmxEzOzUi9U98/1MzpdZtOTWAP0GSTqZ1cZ6t5rSfB5E
         dqenlG4ELHGrBSydi1Vq1ZPxd+qIxh8zb1zHI3po64A+/JvgcsiGO5XkoDgwX6BpCn6j
         OwHyLs5ZNdj7v/wI0V+dY0o+f5C6VuII4DJkzg7S8ZRFdjiy5ColkUrU3H95ntVbAtIs
         uNjzFIgmU/fBbSjfcVHiDamzJtaC8d81422ZNohtPjlR7FdN/QxZufG+Tf4AxRTdzf9K
         L/Ffm8prDZhuLT86MBFkAXxJ0ePPGjsTxbXThUS3Vgq2txa6j3geHWSDUtirUQpNPhwH
         AhAA==
X-Forwarded-Encrypted: i=1; AJvYcCUHTx1Tv+dXIFVg62uRezupnzz1bp68iCqQtQ/+O3+cXmmn/z9bXYNukY7WVT6Qd9WpYGHP8MJlZMaj@vger.kernel.org
X-Gm-Message-State: AOJu0YxDf23XbjoZKOZU2wzxrTksrf/opCOib03P28JQPyqZ0S4PsdX0
	d3zUSKSh1ixfl6MDZGxKvJ7OGSDIO2J+ZP9atGHAzIbe16hRCrduxJ2QP9w81alH+wI89Hr6Cr1
	vWDJjtfe3A8idmgFKAvjGdYcHMCkOd35RvTagpg==
X-Gm-Gg: ASbGncsHtzNLd7o+IT+HpzcvheJ6rDkX1Eb4yMAW+qivur7j3ue6m/5kVFug0ADfPJy
	CXBsdveJmlY807e4c56HBE8uO4E+A7EnB45dtxnlq84Yu+vQGQFGFssEVV0UL6AcIheDujRwyYg
	abnHrEwZe2Wz2HtagAH0XhqDVkuKNn4Dk1aRSgga3myyPFuoOMYAFgwh91Jw==
X-Google-Smtp-Source: AGHT+IH6aA1cSv/VX/CTXkwBECWnxt+ctn3sBHz6xIrxMKUb7MlaznRYT0wkyZbB0sMu1JegypYNOD60U7dDxS1giJY=
X-Received: by 2002:a05:6512:693:b0:545:4d1:64c0 with SMTP id
 2adb3069b0e04-5494c3173d4mr8227858e87.27.1741090513979; Tue, 04 Mar 2025
 04:15:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303160341.1322640-1-andriy.shevchenko@linux.intel.com>
 <20250303160341.1322640-3-andriy.shevchenko@linux.intel.com>
 <20250304091804.GG3713119@black.fi.intel.com> <Z8bdDQGg_xcamZv2@smile.fi.intel.com>
 <20250304111157.GJ3713119@black.fi.intel.com> <Z8bhJq3kn_uw3iYE@smile.fi.intel.com>
 <20250304113135.GK3713119@black.fi.intel.com> <Z8brYjfL1yj_BvpN@smile.fi.intel.com>
In-Reply-To: <Z8brYjfL1yj_BvpN@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 4 Mar 2025 13:15:02 +0100
X-Gm-Features: AQ5f1JpKog-kPN4LvJWddwDWsb99i4_YBPgcK-rxvgJerwFu569NcpOLQvA21c0
Message-ID: <CAMRc=MfsKc+r=uhDZVbd_BW=Gs1BpaidPC1tfF6TGqcq9bgP6Q@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] gpiolib: Rename gpio_set_debounce_timeout() to gpiod_do_set_debounce()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mika Westerberg <westeri@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 4, 2025 at 1:00=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Mar 04, 2025 at 01:31:35PM +0200, Mika Westerberg wrote:
> > On Tue, Mar 04, 2025 at 01:16:54PM +0200, Andy Shevchenko wrote:
> > > On Tue, Mar 04, 2025 at 01:11:57PM +0200, Mika Westerberg wrote:
> > > > On Tue, Mar 04, 2025 at 12:59:25PM +0200, Andy Shevchenko wrote:
> > > > > On Tue, Mar 04, 2025 at 11:18:04AM +0200, Mika Westerberg wrote:
> > > > > > On Mon, Mar 03, 2025 at 06:00:33PM +0200, Andy Shevchenko wrote=
:
> > > > > > > In order to reduce the 'gpio' namespace when operate over GPI=
O descriptor
> > > > > > > rename gpio_set_debounce_timeout() to gpiod_do_set_debounce()=
.
> > > > > >
> > > > > > To me anything that has '_do_' in their name sounds like an int=
ernal static
> > > > > > function that gets wrapped by the actual API function(s).
> > > > > >
> > > > > > For instance it could be
> > > > > >
> > > > > >   int gpio_set_debounce_timeout()
> > > > > >   {
> > > > > >       ...
> > > > > >       gpiod_do_set_debounce()
> > > > > >       ...
> > > > > >
> > > > > > However, gpiod_set_debounce_timeout() or gpiod_set_debounce() s=
ounds good
> > > > > > to me.
> > > > >
> > > > > Then please propose the second name for gpiod_set_config_XXX to f=
ollow
> > > > > the same pattern. The series unifies naming and reduces the curre=
nt
> > > > > inconsistency.
> > >
> > > > gpiod_set_config()?
> > >
> > > The problem is that
> > >
> > > gpiod_set_debounce() and gpiod_set_config() are _existing_ public API=
s.
> > > That's why I considered "_do_" fitting the purpose.
> >
> > I see.
> >
> > Hmm, we have:
> >
> > int gpiod_set_debounce(struct gpio_desc *desc, unsigned int debounce)
> > {
> >         unsigned long config;
> >
> >         config =3D pinconf_to_config_packed(PIN_CONFIG_INPUT_DEBOUNCE, =
debounce);
> >         return gpiod_set_config(desc, config);
> > }
> >
> > and
> >
> > int gpio_set_debounce_timeout(struct gpio_desc *desc, unsigned int debo=
unce)
> > {
> >       int ret;
> >
> >       ret =3D gpio_set_config_with_argument_optional(desc,
> >                                                    PIN_CONFIG_INPUT_DEB=
OUNCE,
> >                                                    debounce);
> >       if (!ret)
> >               gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG=
);
> >
> >       return ret;
> > }
> >
> > I wonder if there is an opportunity to consolidate? ;-)
>
> Send a patch! I would be glad to see less functions and internal APIs in
> GPIOLIB.
>

I'm definitely in favor of consolidation instead of renaming to
gpiod_go_set_debounce(). If anything a better name would be:
gpiod_set_debounce_nocheck() to indicate the actual functionality.

How about first extending gpio_set_config_with_argument() to take a
boolean "optional" argument and removing
gpio_set_config_with_argument_optional() altogether? Both are internal
to drivers/gpio/ so it would have no effect on consumers.

Bart

