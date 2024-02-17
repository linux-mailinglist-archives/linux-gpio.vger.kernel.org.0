Return-Path: <linux-gpio+bounces-3428-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA00E8591C8
	for <lists+linux-gpio@lfdr.de>; Sat, 17 Feb 2024 19:36:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DDC671C20AF0
	for <lists+linux-gpio@lfdr.de>; Sat, 17 Feb 2024 18:36:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C2187CF1E;
	Sat, 17 Feb 2024 18:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="uOrJmrNR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54BB1E4AE
	for <linux-gpio@vger.kernel.org>; Sat, 17 Feb 2024 18:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708194956; cv=none; b=J9PSfULqYFbr8wYa2hDOGBh8c1GWBtcDiJhUiJmoR2pSgY/BITEftuZBkLwE9sjtnyBcE4QMmIybWvG5LfKnpGR6/Vnyt1Ao/Fs5AR5PDmD+F3DhaDw7Tq6bcxu6/pqtXzQIQH3hRnogOMXva0hpvgtzk91cvItDcUktmLdDkns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708194956; c=relaxed/simple;
	bh=1wXUHXHyq2tnpbAbYVAELt55zyGXrlOlKXd2MP2w1h4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cLE16j1FrYFXK/jZX3a3MWeYN1MzVSUwwmK+AfZKXuENW5ALTWyXLHF/+8Y/w4ipLw3jz0GJZ7z81ufFLqhmfa96nmrlZDUFsTSKmCD3SlsSrxhMA5PaJJB0EcV1Hti60BQ7PEaDG4xpUJzxPWzqvB1AXVjsbvMsvdwYWS9O5SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=uOrJmrNR; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-7d6275d7d4dso1565403241.2
        for <linux-gpio@vger.kernel.org>; Sat, 17 Feb 2024 10:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1708194954; x=1708799754; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vk9hxovM04MFGDknCtAXhj6QKEuZtEiEa4FrrltAbFk=;
        b=uOrJmrNRqVPEHVxhY0916eSLnrQ8cxhGo6rFu87bXGDnsNLnMaD5cZZbS8pHn7E4OC
         ZHbSc6DUbrxaa5PmlfaJ3UIXQ0TMuqFswS0wESL9f3NIZnCPo8PwgLjbzO6dRX2DTKVO
         Toc6x0pd4n4pGZcQ4BKga7gZeDG9mPbTlYONpjaJrbq3BFzi/eU1UrNWypsiSRIbisI9
         KX8wbj3N8F2qkT55P7f9vJqlXVe2G/DLDtDCeg8uAV7kvSrBdEBY50kEZ7odK7fObfLX
         CBM9QNgYPqPhuaXliSjvUTAWD75ggNiqAHhzMd4kKNreVzHtWw2gk9dOA9h3/4AflDVA
         XuRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708194954; x=1708799754;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vk9hxovM04MFGDknCtAXhj6QKEuZtEiEa4FrrltAbFk=;
        b=V9YZ5qR+/s170sW0q9AJdTa25I7zSgsDAtyi+1CYUeEPYZ/slZGCl+VcZdNEhbmHUm
         D3nMFHMKqTtUltfYsap9OL1Mz1A8pc88aFzbAsVclMxdVoBoT1KTLjkSWE5Et1QHzgd+
         EO8QuxQ5WG1Gf9oBFTonFrwmyAuiwr4xDy15q0vRvPj8b0iELkC4AWhjnPOJ84FXlHlm
         nHb0L/4opkRNGXoso+D+pmB7sRmqMKmSj04146Tek+wjGyihq07xy25q6gKsK8NplEkl
         mdAguIq0S+tx9OK7fcRSathx+MWgF4w0mT71UaNxMjRK7S61xgPZEcTkE0EiEwq+4rgd
         6i4w==
X-Forwarded-Encrypted: i=1; AJvYcCWARODf0MSjs55mmMkxw+gSFlfYelLYl8an0Si86XrPkc/cyCVRskTLeuTWRWhLNWjr0ieCYLP3G5yONtdEnQZ6/Xg5ND4A5bZUNg==
X-Gm-Message-State: AOJu0YyeAN7YamULgHKXDM0/7hXX+hbgQaJ5pAbw5wWbr3FgZMwV0DQ9
	ZUy5M5tNlIX9n8gk/soDu/o/hN/O7MSIu98Gj99A4ew7YxvWnyfvwcBB/pPkIjaJtGx82qg8i6K
	vfU7LalGZnt06uzqkgibW0XvEGVd4JfoAhcYBwQ==
X-Google-Smtp-Source: AGHT+IEE2e5PqfvrP9qVLvCFjih0+BMjKLKf+gSSzgOk6AJcsbIJqFQIl46fzwx6F8ihh8DAIJvKPD5uyKKwtmptSQA=
X-Received: by 2002:a05:6102:a4f:b0:46d:2956:6b11 with SMTP id
 i15-20020a0561020a4f00b0046d29566b11mr9612132vss.16.1708194953955; Sat, 17
 Feb 2024 10:35:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240217135255.1128716-1-xiaolei.wang@windriver.com>
In-Reply-To: <20240217135255.1128716-1-xiaolei.wang@windriver.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sat, 17 Feb 2024 19:35:43 +0100
Message-ID: <CAMRc=MdGhfHSWPB0FCHbK+uA0MAZNFstupgm7-Zkw9dbuTmyVQ@mail.gmail.com>
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

No, we *want* to copy it if it's not in .rodata for the same reason we
introduced SRCU. This may be a valid report but the fix is wrong.

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

Can you post the full kmemleak report for this, please?

Bart

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

