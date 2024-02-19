Return-Path: <linux-gpio+bounces-3437-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 439CE859DAB
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Feb 2024 09:00:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D78171F22E56
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Feb 2024 08:00:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 968D82561D;
	Mon, 19 Feb 2024 07:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="f1TDRla2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2630621115
	for <linux-gpio@vger.kernel.org>; Mon, 19 Feb 2024 07:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708328897; cv=none; b=qMsAn/WDPvtGOMCMyOP82ICMzw68/cmICKSgu1sHOZ3A3dUuRGQEB9cr67CQ4oYRGQ9RvvzPex9j+zjFAzBZdC5ORPFJerRkp5q8X0zyd3xCTPiONDVm5/zlugSggTcXs53bX+w4VtnvHlxhN1PtTlf50XngwWy1m8Xsx2aLtI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708328897; c=relaxed/simple;
	bh=SFHi854Gz/x7BPHly3IFV5lL1cynY+1gHOPArMf/Sqc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AtEjl2qtPTuQOP88z7P0MKBDPdgDIOUVvnhYpsBmctJJJc1J/E601JRPrellAaNAGy20zEsMrJW1wbU3AdPQYLRtuS4bb4JHdMrHg/aekCKD7bXhuRq4sz7/gE1wIaxBecTbrUFhuKTY3IWEjDfPPwDCX6GeoPOMSpFlTrc9whQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=f1TDRla2; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-4cba3807eedso347658e0c.0
        for <linux-gpio@vger.kernel.org>; Sun, 18 Feb 2024 23:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1708328894; x=1708933694; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uh/2kexeGE7bZDqQ3L9KdAdgJ//W8++IP1nzOLGrSe0=;
        b=f1TDRla2ENXS81vfTqE4JbYqZarzGoegd2lw/TpxGcnJ+LdFOXtOE7+V5iAkCnf+64
         hVdwUa1OpWuhb5slQe26HlRHiyAH+038Hnhx3giTDFvzU0QwO9U/tmolKw1XuocRkZu+
         YJgiviGK0Zl5P7CZ1MHxXHhjTFNmcdw8yQK8YeXbNuWvBCBfe5WtKA6yjB1nVEMFZogY
         uMEQccRjsg2HnumiBgj6K46fj8Vfr3lsdtTNUplsAT7/V5Isae98OESJpjO79m8pMEM+
         Ee6Foe4r8MO0/0FxW2px0MwtKXCGhEudhMpctQCRCdFx9IYyWi8t37X8QV8GbIGf5eyK
         UumQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708328894; x=1708933694;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uh/2kexeGE7bZDqQ3L9KdAdgJ//W8++IP1nzOLGrSe0=;
        b=AWGFu88G2oy6tg8RUf2d5dN8hbR9ml4tTypmTubOva+oTamj52RKraY/WrT15x+Bkw
         4w95gxMhh0R5hkVgOkeXS+f6XBWx+vkPUQuYIH7GmGIr2EZ2ash8hz9Lqzq5H32n1afr
         sGE1IBCxyu8arXBBbBfI7WJ+zMDApGL8FnKS+XlN6St5edpdRP+m5sgWwhVaOCSWLrpw
         XvAsgzh92hAmLSDucyxK70NOc9UmaDulVOIYI5BEhI7TjV5022NPQmwfGn0K7UGpm0Yq
         DCWtQ8YsEUoOWhDj08OzTCL7lEMFaiURXiaqPMv12q2l7QGjNLNIwuGanjpXdsojS5YH
         unEg==
X-Forwarded-Encrypted: i=1; AJvYcCXEyiceJUCdVEfHyXPegbIRIgJaztjyQ22UkaeYuHEaK6BnW6YQdlw0yNZwdTxOObS06McREGys8mTkuY0tsAlkjIuXm+HxfboEgw==
X-Gm-Message-State: AOJu0YwhrwAaPrUQ4QXGcAnmuCEev9hl61pdvgj3ub5V1P3uhKcqLuO1
	7Gin1iNLUMWvr3T33B10PhIr4vEB0fIq9YwMmC4Yt+Go6qSraHEpC/+0/YDJvPOaKZW1bGxduPg
	0fZXtt3I08iO5K+Bkgv08SA045XB8Z4Kr5giEkw==
X-Google-Smtp-Source: AGHT+IEr+dKw4FvYGePcQdmMt3uLpUZexzxb5QuFQFS4Hv6gh6AKzZdwd68wOYylylT3jH2O3mOEoXq3c4c3TaOJm6Q=
X-Received: by 2002:a1f:c483:0:b0:4c8:a2c6:c2be with SMTP id
 u125-20020a1fc483000000b004c8a2c6c2bemr2563138vkf.8.1708328894162; Sun, 18
 Feb 2024 23:48:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240217135255.1128716-1-xiaolei.wang@windriver.com>
In-Reply-To: <20240217135255.1128716-1-xiaolei.wang@windriver.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 19 Feb 2024 08:48:03 +0100
Message-ID: <CAMRc=MeQ_kiVndj93fuJOMSALXbd9oFhZD3d+O_fWXiqxwoYTg@mail.gmail.com>
Subject: Re: [linux-next][PATCH 1/1] gpio: Delete excess allocated label memory
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Cc: linus.walleij@linaro.org, andriy.shevchenko@linux.intel.com, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 17, 2024 at 2:53=E2=80=AFPM Xiaolei Wang <xiaolei.wang@windrive=
r.com> wrote:
>
> The changes in commit 1f2bcb8c8ccd ("gpio: protect the
> descriptor label with SRCU"), desc_set_label has already
> allocated memory space for the label, so there is no need
> to allocate it again. otherwise memory leaks will be
> introduced.
>
> unreferenced object 0xffff0000c3e4d0c0 (size 32):
>   comm "kworker/u16:4", pid 60, jiffies 4294894555
>   hex dump (first 32 bytes):
>     72 65 67 75 6c 61 74 6f 72 2d 63 61 6e 32 2d 73  regulator-can2-s
>     74 62 79 00 00 00 ff ff ff ff ff ff eb db ff ff  tby.............
>   backtrace (crc 2c3a0350):
>     [<00000000e93c5cf4>] kmemleak_alloc+0x34/0x40
>     [<0000000097a2657f>] __kmalloc_node_track_caller+0x2c4/0x524
>     [<000000000dd1c057>] kstrdup+0x4c/0x98
>     [<00000000b513a96a>] kstrdup_const+0x34/0x40
>     [<000000008a7f0feb>] gpiod_request_commit+0xdc/0x358
>     [<00000000fc71ad64>] gpiod_request+0xd8/0x204
>     [<00000000fa24b091>] gpiod_find_and_request+0x170/0x780
>     [<0000000086ecf92d>] gpiod_get_index+0x70/0xe0
>     [<000000004aef97f9>] gpiod_get_optional+0x18/0x30
>     [<00000000312f1b25>] reg_fixed_voltage_probe+0x58c/0xad8
>     [<00000000e6f47635>] platform_probe+0xc4/0x198
>     [<00000000cf78fbdb>] really_probe+0x204/0x5a8
>     [<00000000e28d05ec>] __driver_probe_device+0x158/0x2c4
>     [<00000000e4fe452b>] driver_probe_device+0x60/0x18c
>     [<00000000479fcf5d>] __device_attach_driver+0x168/0x208
>     [<000000007d389f38>] bus_for_each_drv+0x104/0x190
>
> Fixes: 1f2bcb8c8ccd ("gpio: protect the descriptor label with SRCU")
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> ---
>  drivers/gpio/gpiolib.c | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 02be0ba1a402..32191547dece 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -2250,12 +2250,6 @@ static int gpiod_request_commit(struct gpio_desc *=
desc, const char *label)
>         if (test_and_set_bit(FLAG_REQUESTED, &desc->flags))
>                 return -EBUSY;
>
> -       if (label) {
> -               label =3D kstrdup_const(label, GFP_KERNEL);
> -               if (!label)
> -                       return -ENOMEM;
> -       }
> -
>         /* NOTE:  gpio_request() can be called in early boot,
>          * before IRQs are enabled, for non-sleeping (SOC) GPIOs.
>          */
> --
> 2.25.1
>

A queued this, sorry for the confusion, this is of course a correct fix.

Bart

