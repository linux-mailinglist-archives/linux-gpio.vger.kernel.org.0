Return-Path: <linux-gpio+bounces-3207-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A19D88516C7
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Feb 2024 15:15:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5F741C23610
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Feb 2024 14:15:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 080C23CF61;
	Mon, 12 Feb 2024 14:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="L2JNuybY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05D73D0A7
	for <linux-gpio@vger.kernel.org>; Mon, 12 Feb 2024 14:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707747117; cv=none; b=Tm71UHuevzLoVre+olM/pV8xnR7b9EyK/Q//pRMGGgmn0QaMn9TIUgKX9pHE3BXCoEIBGmxekDIhy6RaTd0X/JO7aeI9lyCE1cuX4v5F6gkyWuo61qPPsYc9VCIzWRA3fa3Gu8wapGwMQqirgQxscGP1iPOU9Kt7ERWr6kNdlcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707747117; c=relaxed/simple;
	bh=bacCSiP3K6iWljBhFbG2us+oZG+NPc1uWB6ejgp3MpY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kknvq4hf5D3CUPclVTAD+AUvt4B9AELkiL0oMUEdnHQ+rqmZ0Qq3NWrIkpqNnR/ysgtS9cQjU9sVRrvAqqYe+HABaAtobbuxzTfI3sHHgZpYS03ikOsfklHs45ruYLKfdkt38FRaq3bEu5523tcJF6CbNvObW6lFai+fkP1Y5OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=L2JNuybY; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-59883168a83so1045693eaf.2
        for <linux-gpio@vger.kernel.org>; Mon, 12 Feb 2024 06:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707747115; x=1708351915; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O7saV+8Gn54+hmqDZSFiqf48BnX0D8VPbhZkhU13pOo=;
        b=L2JNuybYWoZlA20P3y66rdu77x5HhKSRn+QT74CTu3MVZWdJZzDM8PQsNFoOQR/Bzu
         xBErC5fg5/38LlJeSGhGl3pK6KUEHt51SCvTLx7tZr4k76x8Sto/wVlgtjzBlUzasuY/
         kY8pVHr2aYQCV3MyI7ThG3izuqxzexuIdjapIF1meE/bK0DDM/6juJ9o3jV7gFyWpHjF
         Wng+AKbohCYdhF0hPDhCuTdbDSWJYa9tWDGYf+aGjDIW1/o6p+LQ/LQrqD32lr6vR+Tc
         fOWsr3KW/S8sy55ajSik7IMNIKxPIfbx3Fw4DGWsCk7POeZIh2z2O+CAEkXYqJw3Mlsj
         CtFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707747115; x=1708351915;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O7saV+8Gn54+hmqDZSFiqf48BnX0D8VPbhZkhU13pOo=;
        b=Dmw7ApuWrFpVk5DE/GeQERSXXuJKMcFplfoAmvHi1XSIQpFuneHqZ+0PxEGH9sg+D+
         /HOlpVdtUbCuoCQuVqUeMfNHhW8Ctc0dVi7wIl7+GW2c8EqFrXrUbEo9t4V4+OEPosfD
         xm7ENr0586q4O4K3RdHBa+Xz0wf5d3pQunHetUqHEJpZ3GQXBm46MBVE/++5vel7dhFM
         L8UeOOKRxcg+5DAcRuKXGFH5VHp7IEArkr31yk2LLzcEYnpN5PRbXTkSnZuYS+TiSqnk
         4G9CXNjwB8JRKSlLelNeBNx1QCpv+eL+Qr8HJHMHtT/h7UIYHe/YlXOFhnULmvZ7Fgqa
         88Bg==
X-Gm-Message-State: AOJu0Ywkz67mhmfBHfxq1NppSHll2MMrvoYsPz7zCe94iVB0oqEnR2O1
	iSgLqlXSThjUal+UR2YQG8JRJZdgx3KmQIeJfJtTwJm+zwWe/G9khxMkFB015Bvz2fY+Y6RGBkr
	bhbswcIjHeYo/0a7vhuKVDDv1X9to9zu93LYEGdrMyecz11jyWsg=
X-Google-Smtp-Source: AGHT+IFqM6qPfkeLwuG/pFbZq4GFhU2ACIwTdqsYI8NhTSxNzP40uGXTgM6oqcvGePMAP48qeC8siZaek6qMwdjxkhw=
X-Received: by 2002:a05:6820:c0f:b0:59d:4a67:cebc with SMTP id
 eh15-20020a0568200c0f00b0059d4a67cebcmr3270172oob.8.1707747114905; Mon, 12
 Feb 2024 06:11:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <39fe95cb-aa83-4b8b-8cab-63947a726754@gmx.net> <CACRpkdax5HaGoW+uZzt0v2Bx+1sPErYRZh7FWQixd0AFFTeiwA@mail.gmail.com>
 <CAMuHMdUCR5DxBW9yxqukq50FRpSsYnP=Lj20QKJtAo7hz=5yUA@mail.gmail.com>
In-Reply-To: <CAMuHMdUCR5DxBW9yxqukq50FRpSsYnP=Lj20QKJtAo7hz=5yUA@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 12 Feb 2024 15:11:43 +0100
Message-ID: <CAMRc=McSdtnqLWrRHoi=6bAuUWfvGqnB+B9FavDDrMfH2vbCkw@mail.gmail.com>
Subject: Re: WARNING: fs/proc/generic.c:173 __xlate_proc_name
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Stefan Wahren <wahrenst@gmx.net>, 
	Kent Gibson <warthog618@gmail.com>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 12, 2024 at 2:47=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Linus,
>
> On Mon, Feb 12, 2024 at 2:35=E2=80=AFPM Linus Walleij <linus.walleij@lina=
ro.org> wrote:
> > looping in Geert becaus I think he wants to look into this!
>
> Oh no ;-)
>
> > On Sat, Feb 10, 2024 at 11:06=E2=80=AFAM Stefan Wahren <wahrenst@gmx.ne=
t> wrote:
> > > we are using libgpiod-2.0.1 with Linux 6.1.49 on our Tarragon hardwar=
e
> > > platform. Recently we implemented an application which waits for GPIO
> > > interrupts and we were able to trigger a warning by naming the owner =
of
> > > the GPIO as "R1/S1":
> > >
> > > WARNING: CPU: 0 PID: 429 at fs/proc/generic.c:173
> > > __xlate_proc_name+0x78/0x98 name 'R1/S1'
> > > CPU: 0 PID: 429 Comm: cb_tarragon_dri Not tainted
> > > 6.1.49-00019-g9dbc76303a17 #147
> > > Hardware name: Freescale i.MX6 Ultralite (Device Tree)
> > > unwind_backtrace from show_stack+0x10/0x14
> > > show_stack from dump_stack_lvl+0x24/0x2c
> > > dump_stack_lvl from __warn+0x74/0xbc
> > > __warn from warn_slowpath_fmt+0xc8/0x120
> > > warn_slowpath_fmt from __xlate_proc_name+0x78/0x98
> > > __xlate_proc_name from __proc_create+0x3c/0x284
> > > __proc_create from _proc_mkdir+0x2c/0x70
> > > _proc_mkdir from proc_mkdir_data+0x10/0x18
> > > proc_mkdir_data from register_handler_proc+0xc8/0x118
> > > register_handler_proc from __setup_irq+0x554/0x664
> > > __setup_irq from request_threaded_irq+0xac/0x13c
> > > request_threaded_irq from edge_detector_setup+0xc0/0x1f8
> > > edge_detector_setup from linereq_create+0x30c/0x384
> > > linereq_create from vfs_ioctl+0x20/0x38
> > > vfs_ioctl from sys_ioctl+0xbc/0x8b0
> > > sys_ioctl from ret_fast_syscall+0x0/0x54
> > > Exception stack(0xe0b61fa8 to 0xe0b61ff0)
> > > 1fa0:                   01b019b8 01a9f428 0000000d c250b407 beeae888
> > > beeae880
> > > 1fc0: 01b019b8 01a9f428 01af7e40 00000036 beeaeb88 beeaeb80 beeaeb58
> > > beeaeb60
> > > 1fe0: 00000036 beeae868 b6a88569 b6a01ae6
> > > ---[ end trace 0000000000000000 ]---
> > >
> > > I'm not sure where this should be fixed.
>
> Any names ending up in sysfs cannot contain a slash?

It's actually procfs. Every irq has an entry under /proc/irq/xyz/
containing a directory named after the name of the interrupt. In this
case the path of the directory would have been /proc/irq/xyz/R1/S1 but
of course this wouldn't work. Should we replace every `/` in GPIO line
names with `:` for interrupts?

Bart

>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds

