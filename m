Return-Path: <linux-gpio+bounces-3189-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 013818511A9
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Feb 2024 11:57:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 33F301C20B89
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Feb 2024 10:57:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3821820DCF;
	Mon, 12 Feb 2024 10:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="sTHNvj+h"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A702556F
	for <linux-gpio@vger.kernel.org>; Mon, 12 Feb 2024 10:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707735431; cv=none; b=a3Wdvu5ZOmnZoXMVSZjiOq54sFiaHgksGFQi/VPDj48/DQkUENfaRmeIk3d97rmJDD2Z0TFpFNKizBiGCVMbywUie7jkBkomg9GRmLKkF/Mog3bIKEFuFNO75D/FzbVYIfEwDUzi90pfLr8RYfonX9NRedwCaOg7da4PmywUMAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707735431; c=relaxed/simple;
	bh=4oq6GMP/WgzoZ7+5c2kDEPFCeFbDph5pnb9DVuQlprQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TTEzAh6Iz3+z5ZSCZGkVlN8uSzdi1sAY+6hchwgtFliuooi5S2YGOoHvqmROYZsuR5ND6Y+ZUfVDw4sfTk1Rlj6XyahDfcoeVNjoUgltUHFz1PLBRPNnRhpclSf50tAfftD5FYsvMiAT2NXYBtsYpQ+//XIxGOMJMNOdpyqGJ0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=sTHNvj+h; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-7d2a78c49d1so1554299241.0
        for <linux-gpio@vger.kernel.org>; Mon, 12 Feb 2024 02:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707735428; x=1708340228; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3qMan/iKuS6ykuJzJQnfBzyyzpcjkC7sFfHMWC4EWdE=;
        b=sTHNvj+had85ywl+I4hCa6bQCH7tAvUYQek40wCLFZSF6F8qDFkFmrFwJiyBinzEoY
         0jDMjRnuGmWhwBLVGfLWNKjsmdVCB26cXGHBXiQKIkM8CELepJWnuar9Q8L8dxl5/R9l
         Ni3nddH3azDpqXAtLUe89f5Dbp3v+Z1+fqpL5E1oiZJZyBERC6CxuF+DILbcOoCnF+c3
         /DNGdiq0STVgRkashNblEmvP6fQxhFPw1guz5NM1TTYHwgbTrXgM8ZpLMR1No6IfrIsp
         YLst8xWjbouMX0j5Nj0IyEMQmEUrVZFcAc/nsiC60DPIGMuEivAL5vJOCCAeQlCFxFl6
         pIUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707735428; x=1708340228;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3qMan/iKuS6ykuJzJQnfBzyyzpcjkC7sFfHMWC4EWdE=;
        b=Ha+1kklvY/aEZ/qWY5uyYwedCgiGygrlXHL6Iaxujre3oqj4+03r7EiCQsEndwIo36
         x/JA4vruhS2uU9W8fCfMHq1x9sH+KDlcd8uqMRinE2XlG3kixxj+ZvHqJEHEtKgOp4kn
         YcIx2Zyy1rl8U+E4BWuVcbJBF6bfm4r8L/1GOUNQIDUWXCgzpE5wDadP7n5NpSa5uhBO
         7ytoICTypvcbpXenJlRolP63vfbSwBjhhOpcbdbdZvvzTYZ3rqzz2ZunVWJT/1MQ3acK
         DzW6Ku6RVCCrt0pipE1jqx/Ia5z7aIVAd8qdNqsfnwZ+FFFTsB+8GvknthKOOknjT8Bz
         rqBw==
X-Forwarded-Encrypted: i=1; AJvYcCUQgtV5twiHIR2nWJ76WFdJyFIYUURSlXk5IMyqgeYyw2YwleUmt7BH38sI8X4sU0cKMtZUuuPR3xqAewvBJhyW9DV43V6nL7OnrQ==
X-Gm-Message-State: AOJu0YxNmHVEZyRe9bCWq2YVNScOzex5ZGcVU8i7zg6sThCsEk8gLmnm
	xQhCQph2vdoC+0ZWwvGyqWHBKNIqMAPh1aoDPdi7Homp+DctL73PjnXSm9PDKcKjuiCa15tSQ7y
	rlR3DhRg2sqFMt3w/axsqEkurm2M1n/bcf8iiIw==
X-Google-Smtp-Source: AGHT+IGEtsJVVTC/B/HMxB2qGHTidY0ZOgEl6PmHDUqC4Vs7bLhZXUCbmlBMXpVE1Blc20ON3L8h2hV6NGZHYVYqfyE=
X-Received: by 2002:a05:6102:1355:b0:46e:c7e3:9448 with SMTP id
 j21-20020a056102135500b0046ec7e39448mr145067vsl.3.1707735427855; Mon, 12 Feb
 2024 02:57:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <39fe95cb-aa83-4b8b-8cab-63947a726754@gmx.net>
In-Reply-To: <39fe95cb-aa83-4b8b-8cab-63947a726754@gmx.net>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 12 Feb 2024 11:56:56 +0100
Message-ID: <CAMRc=Md016-T0-hMX2BxOK6MXPC3gKsYCCfqhK9cDV2ktubE+A@mail.gmail.com>
Subject: Re: WARNING: fs/proc/generic.c:173 __xlate_proc_name
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 10, 2024 at 11:06=E2=80=AFAM Stefan Wahren <wahrenst@gmx.net> w=
rote:
>
> Hi,
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
>

Interesting. Seems as if the interrupt subsystem cannot handle '/' in
the interrupt consumer name. I'm wondering if we should filter out any
'/' in GPIO names when using the lines for interrupts? What do we
replace them with?

Bart

