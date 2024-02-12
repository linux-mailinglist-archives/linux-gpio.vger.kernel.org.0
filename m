Return-Path: <linux-gpio+bounces-3205-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48335851611
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Feb 2024 14:57:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 048BD28375F
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Feb 2024 13:57:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D1C1446C6;
	Mon, 12 Feb 2024 13:47:13 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BAC93BB3D
	for <linux-gpio@vger.kernel.org>; Mon, 12 Feb 2024 13:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707745633; cv=none; b=ke9nHLZKZsdOhOn5E0WsWyLKJQ8Jl2V5p9HwVRWJAjR2Fel1LINWjUjZkIDqUc59tvmb51HXlAgiPpmuUPuEPvH5NEk1MABMY4/U3/aQJU6bzpsNkM+PfJHE6QV0A2JWuv0UitjCdpk051YhOx70/cEKhl9Z5sMk7EapxAGqGnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707745633; c=relaxed/simple;
	bh=RGkr11hWeCH8ktVRWcJAAy84DDkaSllct91oH2zTWYU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eItLxpLHYYLwkt792WuhrjCPNQxS4BrBTvRfkMuYbU2HHb222Zu1OUY+ROOF4AFDrKLPMKdtFjINIjEuB0x9oktWg80LtgsMc0NePFoDKD4xTUe66ONlXRhIGWJORPBVNUdjd+epjW/A/lLtRzZO7s3EW/ztChlD4t+VpS6GbXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6002317a427so28301237b3.2
        for <linux-gpio@vger.kernel.org>; Mon, 12 Feb 2024 05:47:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707745630; x=1708350430;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cgE/7Bolpc5DQgjiV9Z2vvz/dGX2ZXmxJww8YU1AHsY=;
        b=he71D+TuLb3TYpdAOJhuiZKz1j/we1x/g86RuqgJ34emeEBqKsgC7QXNyFDD3F8bS0
         XNFtU9XFp+pUi6vhL1N9l6mqwsQNgAhaoxbWJut8jxEhS7H59+/QSOHWJb+hjZW82clo
         V2AvkKHwp93hyN+hPrYrT0N0wj6rHuX351ojoV1qqFuFpaC15BKw3ufUY99UO7kMSQhg
         bUjWKzNLWwj0qCQwAdbPStiBSP2oudP1Otj3pgwER+xFccycr3rPua6vSGvXF6YOUUNe
         a5V8VbhGCZDnN2hhKm3NeZw6nRrb4G+2U9Fl49yASsBaGjHyJGUJfW9E8sha8zv5y4ke
         J4ZQ==
X-Gm-Message-State: AOJu0YxVQKKjpMyj0RehIDtXFZKc6reFsoJKyq8WNb2A0avTlmJZs4mr
	f7VSf4U0Eyi2Rb6+32NzuFj/AnZQ4ajKYvgXlZsd5t7keWk/9dkPCcQfznKdeRk=
X-Google-Smtp-Source: AGHT+IEKBasaUobPFN0/fB6dAToCioVFtNRCoFrneyo5iqLONsNA+4g205E9fCqSSYeebIRbOYdYDQ==
X-Received: by 2002:a81:5281:0:b0:604:9167:ccf2 with SMTP id g123-20020a815281000000b006049167ccf2mr5222332ywb.42.1707745630080;
        Mon, 12 Feb 2024 05:47:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW0vCTfQBxjUmbCgqOyXumltCyy3ytFklZ2usAb+k+2HW3pLYJnGnqnDt8HlN1ulgYYIbwxN61WbLz8JEk3lYT0ZUYfKBTFyfvmpQ==
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id t125-20020a815f83000000b006048e2331fcsm1192554ywb.91.2024.02.12.05.47.08
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 05:47:09 -0800 (PST)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dc74435c428so3003408276.2
        for <linux-gpio@vger.kernel.org>; Mon, 12 Feb 2024 05:47:08 -0800 (PST)
X-Received: by 2002:a25:8412:0:b0:dcb:d8d1:2d59 with SMTP id
 u18-20020a258412000000b00dcbd8d12d59mr284195ybk.38.1707745628182; Mon, 12 Feb
 2024 05:47:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <39fe95cb-aa83-4b8b-8cab-63947a726754@gmx.net> <CACRpkdax5HaGoW+uZzt0v2Bx+1sPErYRZh7FWQixd0AFFTeiwA@mail.gmail.com>
In-Reply-To: <CACRpkdax5HaGoW+uZzt0v2Bx+1sPErYRZh7FWQixd0AFFTeiwA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 Feb 2024 14:46:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUCR5DxBW9yxqukq50FRpSsYnP=Lj20QKJtAo7hz=5yUA@mail.gmail.com>
Message-ID: <CAMuHMdUCR5DxBW9yxqukq50FRpSsYnP=Lj20QKJtAo7hz=5yUA@mail.gmail.com>
Subject: Re: WARNING: fs/proc/generic.c:173 __xlate_proc_name
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Stefan Wahren <wahrenst@gmx.net>, Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Mon, Feb 12, 2024 at 2:35=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
> looping in Geert becaus I think he wants to look into this!

Oh no ;-)

> On Sat, Feb 10, 2024 at 11:06=E2=80=AFAM Stefan Wahren <wahrenst@gmx.net>=
 wrote:
> > we are using libgpiod-2.0.1 with Linux 6.1.49 on our Tarragon hardware
> > platform. Recently we implemented an application which waits for GPIO
> > interrupts and we were able to trigger a warning by naming the owner of
> > the GPIO as "R1/S1":
> >
> > WARNING: CPU: 0 PID: 429 at fs/proc/generic.c:173
> > __xlate_proc_name+0x78/0x98 name 'R1/S1'
> > CPU: 0 PID: 429 Comm: cb_tarragon_dri Not tainted
> > 6.1.49-00019-g9dbc76303a17 #147
> > Hardware name: Freescale i.MX6 Ultralite (Device Tree)
> > unwind_backtrace from show_stack+0x10/0x14
> > show_stack from dump_stack_lvl+0x24/0x2c
> > dump_stack_lvl from __warn+0x74/0xbc
> > __warn from warn_slowpath_fmt+0xc8/0x120
> > warn_slowpath_fmt from __xlate_proc_name+0x78/0x98
> > __xlate_proc_name from __proc_create+0x3c/0x284
> > __proc_create from _proc_mkdir+0x2c/0x70
> > _proc_mkdir from proc_mkdir_data+0x10/0x18
> > proc_mkdir_data from register_handler_proc+0xc8/0x118
> > register_handler_proc from __setup_irq+0x554/0x664
> > __setup_irq from request_threaded_irq+0xac/0x13c
> > request_threaded_irq from edge_detector_setup+0xc0/0x1f8
> > edge_detector_setup from linereq_create+0x30c/0x384
> > linereq_create from vfs_ioctl+0x20/0x38
> > vfs_ioctl from sys_ioctl+0xbc/0x8b0
> > sys_ioctl from ret_fast_syscall+0x0/0x54
> > Exception stack(0xe0b61fa8 to 0xe0b61ff0)
> > 1fa0:                   01b019b8 01a9f428 0000000d c250b407 beeae888
> > beeae880
> > 1fc0: 01b019b8 01a9f428 01af7e40 00000036 beeaeb88 beeaeb80 beeaeb58
> > beeaeb60
> > 1fe0: 00000036 beeae868 b6a88569 b6a01ae6
> > ---[ end trace 0000000000000000 ]---
> >
> > I'm not sure where this should be fixed.

Any names ending up in sysfs cannot contain a slash?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

