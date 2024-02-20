Return-Path: <linux-gpio+bounces-3513-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F55285BD6E
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Feb 2024 14:42:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C8775B224D0
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Feb 2024 13:42:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26D3A6A8DC;
	Tue, 20 Feb 2024 13:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="vtGGFpgf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476B76A340
	for <linux-gpio@vger.kernel.org>; Tue, 20 Feb 2024 13:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708436520; cv=none; b=BQuh3OXls4ffsL82GSC4S8X0CqZSMpoxmswQiChEuLPqCue9HflNjyNSKlIihluV9RRRis8zkR3ABsPvruvCQrsItJiN5VQRD0tkn/nftqpyLyF918NGDErikEAMrNxirBPkaTicOhXS/nOtnZQsHKa/fjITaKf1mKbpyYKbtkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708436520; c=relaxed/simple;
	bh=QQBscvCfbaDRlzqcyAKjfFFH/xl7hw7boMX/xj5Gdk4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RMu8QRNnwCNYw1FY1WRqmF0XYOyJ0fRMZNhbA4a4B/FwmsvJ6QwghYB0cewresjoST1a7HfGap+HAU9m23Bguq+8+lbzmlYPLXW/rXLXOaEPvX+3DxswJpkJW8USRbqDZUgzGpEUxMyb1XxVo+4N6N3t39QfdWuXKecPr0Ar6r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=vtGGFpgf; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-7d2a67daa25so3316208241.0
        for <linux-gpio@vger.kernel.org>; Tue, 20 Feb 2024 05:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1708436509; x=1709041309; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xP/TK90neT8X21AtRisPl7685j0CAZc0zErZJvKoQI4=;
        b=vtGGFpgfoQEbBi4YvkwAKlT3/xI0GglK0CG5yXQRrAmagwEdk7vW6JL7qnCJV4xGgK
         X4OxjISO+00dIkd9CcIh+K7UvoX89aaC/O1bL7rlLGuB7ORKAFJABKZbbRfScs+QoOFo
         M3K2RszlnSEEyYP+DSF6w4EvSN0zuR/+7go6mHi86NPbjOFOiU6IZ52O093dS7vgYd+J
         zm06VuYHOQZALEzWtW6ezEJblrci9ih12UYVAXM4WcBo+4d0dobWHt82T/kzlZn7ByQ1
         ft9eUHlK2fQ+MfNqivMKcAJ/ewigYgKA5yP4sVrZepnIZd92AhZnAmoLkDlL9S+gS0k8
         xbIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708436509; x=1709041309;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xP/TK90neT8X21AtRisPl7685j0CAZc0zErZJvKoQI4=;
        b=hnjLwgGBsTV9twCAPNQlna4Ut+vmI0D4uDJOOau2mgZQSWW6euOyPKV1T1e+TNsWsT
         c0P51LydaYxVOHCDcTEVOD1/PlE4xJJpNmxEcMwv+Ss3oX31QRkMC/nAd6j5oW/dcmXs
         uGMWPnllkgbUy0QuKWAQUeaQ1afwd1Al4e3fg9IWELvhNrovjuD9MEKzxhYYzPB6Nz8B
         iS0/Xm2iTabz+io3zfx4wcAG0RS9cLlT0dFSQRDuQNdBToT3bK9+ypLoUOMMg+CetFad
         4hc/1vSlEh4ne/whp15W4iAu3BcZlT8x35IwitSYC+uIWgpaD/mLEON5alpzuGhbRS4s
         y7tA==
X-Forwarded-Encrypted: i=1; AJvYcCXGtHdMg+xegyhGK1Y6V7rlMaii7BYXEI/fZJa5MmZqcX40cwYKwLwXq7NcbaIxxWkbcXLoA82zNMonYfkEGciUVWf6/fdUG4RFwA==
X-Gm-Message-State: AOJu0YyANvmjbLwgKs0ID1jcFfWVnva/Lbdl1X627b7iYZtVZUo6H6UO
	CzmhBcduTmvk3Ys/TQfZhJO9K8NS9ouB41wHJ+ouI1L7AKJupQAEaQy0Xwz+J6R3Nck0qzJl7Aw
	xz1n7AFXhhBAj5DnQtZIddJUSICNifEHNXRo8lw==
X-Google-Smtp-Source: AGHT+IEBVqrGCcl71zhl8y7obE4covazgnsV45hChAyMiiWzAb7U3Rn+DCURtJ9DVwFtq4joCvmggniLbawJuIySIJw=
X-Received: by 2002:a67:ad19:0:b0:470:4aad:7aa4 with SMTP id
 t25-20020a67ad19000000b004704aad7aa4mr5837008vsl.8.1708436509617; Tue, 20 Feb
 2024 05:41:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240220111019.133697-1-herve.codina@bootlin.com>
In-Reply-To: <20240220111019.133697-1-herve.codina@bootlin.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 20 Feb 2024 14:41:38 +0100
Message-ID: <CAMRc=MfpudtuwMEexJdWwhJ3sdbTn4fhpwQvGKOHSPE6+6k4jQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] gpio-cdev: Release IRQ used by gpio-cdev on gpio chip removal
To: Herve Codina <herve.codina@bootlin.com>
Cc: Kent Gibson <warthog618@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 20, 2024 at 12:10=E2=80=AFPM Herve Codina <herve.codina@bootlin=
.com> wrote:
>
> Hi,
>
> When a gpio chip device is removed while some related gpio are used by
> the user-space (gpiomon for instance), the following warning can appear:
>   remove_proc_entry: removing non-empty directory 'irq/233', leaking at l=
east 'gpiomon'
>   WARNING: CPU: 2 PID: 72 at fs/proc/generic.c:717 remove_proc_entry+0x19=
0/0x19c
>   ...
>   Call trace:
>     remove_proc_entry+0x190/0x19c
>     unregister_irq_proc+0xd0/0x104
>     free_desc+0x4c/0xc4
>     irq_free_descs+0x6c/0x90
>     irq_dispose_mapping+0x104/0x14c
>     gpiochip_irqchip_remove+0xcc/0x1a4
>     gpiochip_remove+0x48/0x100
>   ...
>
> Indeed, even if the gpio removal is notified to the gpio-cdev, the
> IRQ used is not released when it should be.
>
> This series calls the gpio removal notifier sooner in the removal
> process in order to give a chance to a notifier function to release
> the IRQ before releasing the IRQ mapping and adds the needed
> operations to release the IRQ in the gpio cdev notifier function.
>
> Best regards,
> Herv=C3=A9 Codina
>
> Herve Codina (2):
>   gpiolib: call gcdev_unregister() sooner in the removal operations
>   gpiolib: cdev: release IRQs when the gpio chip device is removed
>
>  drivers/gpio/gpiolib-cdev.c | 33 ++++++++++++++++++++++-----------
>  drivers/gpio/gpiolib.c      |  8 +++++++-
>  2 files changed, 29 insertions(+), 12 deletions(-)
>
> --
> 2.43.0
>

Thanks for taking a stab at it. I saw this issue some time ago, tried
to fix it directly in interrupt procfs code[1], got yelled at by
Thomas Gleixner for 20 or so emails and eventually forgot about it.
Nice to see someone tackle it again.

Bart

[1] https://lore.kernel.org/lkml/20230814093621.23209-1-brgl@bgdev.pl/

