Return-Path: <linux-gpio+bounces-14514-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 361D2A01689
	for <lists+linux-gpio@lfdr.de>; Sat,  4 Jan 2025 20:32:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06EB4162F4A
	for <lists+linux-gpio@lfdr.de>; Sat,  4 Jan 2025 19:32:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4E391A00F8;
	Sat,  4 Jan 2025 19:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eV2GxFOv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5252BCF5;
	Sat,  4 Jan 2025 19:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736019157; cv=none; b=GiJZtzyD4LMqtojvTfqyKTO2GEPvs0zp+7MkWUXpub1OZaR3UUAoZ+b2OsqNXuJoYKUF2lZKHzxV8ZCtC1j96pV0N1a/2mpc4M2CIb7JmrHVexjOChWa16lbGh2NkussuvpZkZSI/4LhPFs4WCIYDbTWArpoEKk+MfDM5enTRTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736019157; c=relaxed/simple;
	bh=pRQFPeweERPeNwHnJNk+MFSqm+Ikegv95CW8Y1eGXq4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n3rMRJIrMynlwtAvojOpv+0nECxIF0AtN3f6VTJ5Rq7JrgwCIfjSIz4r/c30CYxP9n35NgX0fsEiG8EsgJh/d6gaHvaveJyA98btjmLdUAbwXnMr2+cTTX0KSJytiWvdzjaQiyrmznyhKd9kdraR80s70Hk8rmKsIZeRbymlgNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eV2GxFOv; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e3978c00a5aso17427637276.1;
        Sat, 04 Jan 2025 11:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736019155; x=1736623955; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pRQFPeweERPeNwHnJNk+MFSqm+Ikegv95CW8Y1eGXq4=;
        b=eV2GxFOv/0c3n8PqqxutdYQ/1WMx2QsPxDpbkpoXIzoUAybKWjWmA4/qPg7+nxSzDH
         aclsrr/iCNqS1/mgBSIZkDFE7oTEeurgLe+dp68fZ8yN7gG9klM/KdpxyV9I4YChMU3e
         jT1jskBCLgLPKgUKKbGw+FbW1rkn5oWS3AKrWhVl8icvAUqQXoDe8q6QFWUylmOWPFOD
         Zi/08BfL0nODR4/7HcsnBY2k9hDI96yD7L3N628mNtl2nZaShiHyTClznc388Cw3JNgP
         1BqsLack5eRoRZzb7vZfuh2RtyeEkwIMuuDidZAq/dBKesy7T371etIjmQ3GFJFG87PL
         JSKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736019155; x=1736623955;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pRQFPeweERPeNwHnJNk+MFSqm+Ikegv95CW8Y1eGXq4=;
        b=rBcymF1nEPhD1LlFIr1tXD9SCbRq+mv8Nt+bW2d0DQSuyLpOJ9HvBAkIeFVjOscOrS
         d4NUVX8HNTiAGxARTu4IEq4DVH9NhK3tOFuwN7WSpKSvpTKHcVGIui/qfVhGWtBU9HUL
         p5NVQB0XGMI2cwlXqfFiaOqV29Tnjik8EfSejAQ0zzWovtvfPl2v92PflJrPy9OpZ/tt
         uazFRq+duPlCzgXeYk2EA/bEDP3MrZYF6yt2ubQw0keGw2D/8svUurTjE2dpnyoXlfuQ
         sUzXf3GNddBxlikaNFwcegw27ZGr5x8hXb+FYAJon4/iO5gGjzl5yXxDbULdyJ4nl4o8
         d9Sg==
X-Forwarded-Encrypted: i=1; AJvYcCVK6f09wj5bobBlphB1JbC7AcJpefb0yrKaCmpmhYldcc28qLOMff2VybtYHEX/6tNO4Mj8hny/SgvF29X+@vger.kernel.org, AJvYcCVqUwPpcAETRmfK4J5McKEZr/DqMc/6RoJMQfWTwKbDE16NtWDOrnMvrd0TKc0HqTgZ6/oPlCmw3cJc@vger.kernel.org
X-Gm-Message-State: AOJu0YwS5GyudGokKpMKOs0v4FxySMjCsA8YsEA8DoNEjlU6/FbL/e3n
	ZLc2XtoicdisQczGikhSpnkposIEPAs0aQC3BTD9y0SSjEcXhUX35xUe4yZnMOJ6y8qB0mhIop8
	y8JF1qcRb8+8pA/OsJhtnIglNWq0=
X-Gm-Gg: ASbGncsN6xwflnNycg3km0FWeIgDpyi/PXXbgrsU1LYSV2SN8HRCZgwP7KnefC60pFc
	4if4XbHLeJAZwhXmXgT0wZF2s2s4MeQHwqMRGAQ==
X-Google-Smtp-Source: AGHT+IF3WbWs/XuU0P4XHSNiPaCB/yT/fohNjEaD9CdFNK28vsnjFTb0Spj9LqmwJr2leRZATeNl5zTqWBoMKHa9lEI=
X-Received: by 2002:a05:6902:210e:b0:e38:920a:12ab with SMTP id
 3f1490d57ef6-e538c411846mr38636200276.49.1736019155122; Sat, 04 Jan 2025
 11:32:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241207223335.17535-1-kylehendrydev@gmail.com>
 <20241224103645.1709996-1-noltari@gmail.com> <CAOiHx=kvsCx0cd5C8eza-V7H+ML2ff5zB=vjM6zDmb0A7d16+A@mail.gmail.com>
 <07a21d3f-539e-4609-bc60-ff320935db8a@gmail.com> <CAKR-sGesWUbxQY6SmeW4mGM_89=SkNMbL=TJJQtAiDKMjC6y+g@mail.gmail.com>
 <CAKR-sGeyRkJ2Mo2rObVyNRcupo3FXvCn0vbZPW0rzyCdjxK-+A@mail.gmail.com>
In-Reply-To: <CAKR-sGeyRkJ2Mo2rObVyNRcupo3FXvCn0vbZPW0rzyCdjxK-+A@mail.gmail.com>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Sat, 4 Jan 2025 20:32:24 +0100
Message-ID: <CAOiHx==-c=HtNQWFuJnVX15pTXqtXsbzoEGSQXDbSpYExw4K9A@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: bcm63268: add gpio function
To: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Cc: Kyle Hendry <kylehendrydev@gmail.com>, linus.walleij@linaro.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 4, 2025 at 6:02=E2=80=AFPM =C3=81lvaro Fern=C3=A1ndez Rojas <no=
ltari@gmail.com> wrote:
>
> El s=C3=A1b, 4 ene 2025 a las 16:44, =C3=81lvaro Fern=C3=A1ndez Rojas
> (<noltari@gmail.com>) escribi=C3=B3:
> >
> > El vie, 3 ene 2025 a las 4:04, Kyle Hendry (<kylehendrydev@gmail.com>) =
escribi=C3=B3:
> > >
> > > On 2024-12-30 08:42, Jonas Gorski wrote:
> > > > Hi,
> > > >
> > > > On Tue, Dec 24, 2024 at 11:41=E2=80=AFAM =C3=81lvaro Fern=C3=A1ndez=
 Rojas
> > > > <noltari@gmail.com> wrote:
> > > >> From: Kyle Hendry <kylehendrydev@gmail.com>
> > > >>
> > > >> There is no guarantee that the bootloader will leave the pin confi=
guration
> > > >> in a known default state, so pinctrl needs to be explicitly set in=
 some
> > > >> cases. This patch adds a gpio function for drivers that need it, i=
.e.
> > > >> gpio-leds.
> > > >>
> > > >> Signed-off-by: Kyle Hendry <kylehendrydev@gmail.com>
> > > >> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com=
>
> > > >
> > > > bcm63268-pinctrl implements pinmux_ops::gpio_request_enable(), whic=
h
> > > > should automatically set any requested GPIO pin to the GPIO functio=
n,
> > > > so explicitly requesting the gpio function for a pin should not be
> > > > needed. Is this not enough?
> > > >
> > > > Best Regards,
> > > > Jonas
> > > >
> > > >
> > > I assumed that as well, but nothing I tried worked with gpio-leds.
> > > gpiochip_generic_request() does call gpio_request_enable(), but gpio-=
leds
> > > uses devm_fwnode_gpiod_get() which looks like a different code path. =
The
> > > only place it seems to be configuring the gpio is in create_gpio_led(=
)
> > > where it needs a pinctl node in the device tree. That's just my readi=
ng
> > > of the code, though. I haven't set up a ftrace to verify it.
> > >
> > > Best Regards,
> > > Kyle
> >
> > As Kyle pointed out it's not enough and gpio_request_enable() doesn't
> > get called from gpio-leds.
> > I will try to investigate this and report back.
> >
> > Best regards,
> > =C3=81lvaro.
>
> I've performed some tests and so far I haven't been able to get
> bcm63268_gpio_request_enable() called.
>
> Even exporting a gpio from userspace doesn't trigger that function,
> which seems strange because in that case we won't have a "gpio"
> function on the pinctrl for that gpio, even with this patch...

On a first glance it looks like that regmap-gpio does not populate
gpio_chip::request and gpio_chip:free, so the gpio subsystem is not
aware that it needs to request anything. Not sure if just using
gpiolib_generic_request() / gpiolib_generic_free() is fine. Currently
on vacation, so no hardware to test anything at hand ;-)

Best Regards,
Jonas

