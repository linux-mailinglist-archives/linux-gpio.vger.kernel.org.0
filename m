Return-Path: <linux-gpio+bounces-3190-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FEDF85158A
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Feb 2024 14:42:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 44C6F1F21228
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Feb 2024 13:42:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21F893D3BA;
	Mon, 12 Feb 2024 13:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eYP9Ylih"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6423D55B
	for <linux-gpio@vger.kernel.org>; Mon, 12 Feb 2024 13:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707744908; cv=none; b=NnoKqwzK4qSODOppjuFt9L+315ht+4IMKjkt4tDD13Ch6X+dagumnSD4RdGNmW5G63hU8lKVOGgFDjiFQ33aygEOd/elGK26fHch0E/qOj3EXVzIREtAXFRqBoGEodJSOxQEakpd3//gDGIqG91UF3ecYwYf5oFIVJ3uIFuxBzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707744908; c=relaxed/simple;
	bh=bRMi3dGKToszFxOUpnC7FuKZI4bkSPIvi5lvMc+X31Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GG1SNMHaTZsgvUnYoyajcBAW8jn6IddNp1FIIxM6jQayieRmARdF+OrKTGs95zQUIVKcMJq2r3Jy0Yh7tluMBqKhK6SnRH/wSv9TjwdEynsoux2bKIeRFAqVkHa7SultENRv7dRURh/SbsnPGW+MEI7H72Wi+BBu8mMe2CH29Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eYP9Ylih; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dcbef31a9dbso46735276.1
        for <linux-gpio@vger.kernel.org>; Mon, 12 Feb 2024 05:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707744906; x=1708349706; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iG1QeDQ0pXFiysTAEMRUh5KzXEoTTeGXrnDEHeUIPHg=;
        b=eYP9YlihsdOJ+kPC71GzZ4fygqWUsLWAekS4xcHwSzi4ThuoS7FXQqW2cpfyvmMG4A
         IjQB5th84l4xT/1rqqAAVupN1fPJGl/NDKeoGnTzxFZJneEInvHxnlLYJCIPBco6eEMc
         CqUzZARjQwPIQQ/5T/PGsK+FRiaNNhCg70QOioZUiIE9QYss9Z+WVYap6RpPLcBMoLu+
         FaZGCjZrVfsGnAzIlkMrN+9Aj3JijS+A4P2NmyiIvXTfeLn6TcOtc0q2czAkWDv2FNxz
         vWqbI5Y4/wwiVc7HSVGY0Mn14hvNp3SC+ApZuaFaX7+jmShCt3Ck/LFR5hBWFTtf2l2Y
         8S8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707744906; x=1708349706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iG1QeDQ0pXFiysTAEMRUh5KzXEoTTeGXrnDEHeUIPHg=;
        b=RdEPOEmhC8XpwNp5Ct1gLA3Zh4hi5vxx3j6Y0LjiSNj4WkFPfJI4h3R/Do/fWWOfqE
         8TPfCV66N9jri3XkFm7JQM+8f3PPLxOLxpRGPu/GJ1lph/aMu+Bzk/OSVMR3sORXqAmb
         cshgAQyyCa1L6QVY+DHkBYq1Yi58eTr3zJGGOZne930Ix8CH67s0NQ7YMjYWTs3gZAOW
         57JXThMJAiX7BfkIUt3Vq1Zt+ayN1uORc/p/gwJSU14PjaPV8wym7LUPi/jV4ippGeV8
         ZQYY/ZSf+q6UAHJurT7aTz9W8tXGYd2EmZoomnvBLvzZ7AaxWMOhhPNyeP2aDVCDQtPY
         4eAg==
X-Gm-Message-State: AOJu0YzvYpP8AVMauSbq40n5wFbs639xxNwpl/omQ5S+buk+0XtiV5gq
	ScuUF2NzuUUC0mkQO/AEs3Moxo3netpMI/9PG8sGvordVJBjSlrEuwC4GpvQi+r8gbW4T+vHqMV
	TQ/zsrjJyHXyBDe5J0HMFP9fxv2drcHxIDhQnC4FICnaR04Ir
X-Google-Smtp-Source: AGHT+IH5cY21pbRlX2RHyL7FWZFPRYhZJi6SlwpztPWCBMSvFUakpXlnhdWPC5gqaZ8U2VwsvKoxNw1jvwAlTQlSaZw=
X-Received: by 2002:a25:870a:0:b0:dc2:2576:84d3 with SMTP id
 a10-20020a25870a000000b00dc2257684d3mr4267419ybl.9.1707744906185; Mon, 12 Feb
 2024 05:35:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <39fe95cb-aa83-4b8b-8cab-63947a726754@gmx.net>
In-Reply-To: <39fe95cb-aa83-4b8b-8cab-63947a726754@gmx.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 12 Feb 2024 14:34:55 +0100
Message-ID: <CACRpkdax5HaGoW+uZzt0v2Bx+1sPErYRZh7FWQixd0AFFTeiwA@mail.gmail.com>
Subject: Re: WARNING: fs/proc/generic.c:173 __xlate_proc_name
To: Stefan Wahren <wahrenst@gmx.net>, Geert Uytterhoeven <geert+renesas@linux-m68k.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

looping in Geert becaus I think he wants to look into this!

On Sat, Feb 10, 2024 at 11:06=E2=80=AFAM Stefan Wahren <wahrenst@gmx.net> w=
rote:

> we are using libgpiod-2.0.1 with Linux 6.1.49 on our Tarragon hardware
> platform. Recently we implemented an application which waits for GPIO
> interrupts and we were able to trigger a warning by naming the owner of
> the GPIO as "R1/S1":
>
> WARNING: CPU: 0 PID: 429 at fs/proc/generic.c:173
> __xlate_proc_name+0x78/0x98 name 'R1/S1'
> CPU: 0 PID: 429 Comm: cb_tarragon_dri Not tainted
> 6.1.49-00019-g9dbc76303a17 #147
> Hardware name: Freescale i.MX6 Ultralite (Device Tree)
> unwind_backtrace from show_stack+0x10/0x14
> show_stack from dump_stack_lvl+0x24/0x2c
> dump_stack_lvl from __warn+0x74/0xbc
> __warn from warn_slowpath_fmt+0xc8/0x120
> warn_slowpath_fmt from __xlate_proc_name+0x78/0x98
> __xlate_proc_name from __proc_create+0x3c/0x284
> __proc_create from _proc_mkdir+0x2c/0x70
> _proc_mkdir from proc_mkdir_data+0x10/0x18
> proc_mkdir_data from register_handler_proc+0xc8/0x118
> register_handler_proc from __setup_irq+0x554/0x664
> __setup_irq from request_threaded_irq+0xac/0x13c
> request_threaded_irq from edge_detector_setup+0xc0/0x1f8
> edge_detector_setup from linereq_create+0x30c/0x384
> linereq_create from vfs_ioctl+0x20/0x38
> vfs_ioctl from sys_ioctl+0xbc/0x8b0
> sys_ioctl from ret_fast_syscall+0x0/0x54
> Exception stack(0xe0b61fa8 to 0xe0b61ff0)
> 1fa0:                   01b019b8 01a9f428 0000000d c250b407 beeae888
> beeae880
> 1fc0: 01b019b8 01a9f428 01af7e40 00000036 beeaeb88 beeaeb80 beeaeb58
> beeaeb60
> 1fe0: 00000036 beeae868 b6a88569 b6a01ae6
> ---[ end trace 0000000000000000 ]---
>
> I'm not sure where this should be fixed.

Yours,
Linus Walleij

