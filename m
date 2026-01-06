Return-Path: <linux-gpio+bounces-30193-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7927FCF7F0D
	for <lists+linux-gpio@lfdr.de>; Tue, 06 Jan 2026 12:01:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1BA7130F4D63
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Jan 2026 10:55:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB66333067F;
	Tue,  6 Jan 2026 10:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nlyilOyZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EC332ABFE
	for <linux-gpio@vger.kernel.org>; Tue,  6 Jan 2026 10:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767696936; cv=none; b=rGDqFQg4Wafg1w4rxnjr+BP668Y7F2ZsvoSvf+pNSCian2HwMcwCNwMa/2d7Znt+YdjTsywSggCJpU0mOEw43PLhcJDCMDBuRTkBTZ0DqYBCCjrzRmKQXw1e1j//N4mOaye80V5bk7QHYW7T3xiO38apcrT+qcXJfsDsFso9n7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767696936; c=relaxed/simple;
	bh=tGjbyumm3Njxu+jH/AQm5cd4gsvAb1EpoKZIyWS+pe4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TMinarDJiUm7nZ9LR2jt65dEafOFcJEYMIzsI7jya72J+MPALizkp8uDTuS92Q7af89Wx+tSXPl6ktAG20sa30KQbvR8pEhUNP9W4e9JzQ03kelMC/gC6GUL4U9P4yYHgOMC+HhcCd+0J2r8D8w4Za2OKa9CUqcSYZfQlIExk1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nlyilOyZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02D73C19424
	for <linux-gpio@vger.kernel.org>; Tue,  6 Jan 2026 10:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767696936;
	bh=tGjbyumm3Njxu+jH/AQm5cd4gsvAb1EpoKZIyWS+pe4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nlyilOyZUpDCew3L6tyEIzdw+BdhQhv6VmvWbuIMLIOHQ4TJiGzHiIDJnUDKYm24/
	 IhxuB+vgDYJ2VJesnC0DSvVmZWJS0QEnkJfG1JmV393Sgp0FwSpydLKO9GZUbZOD31
	 LZKsxsk+cVOL0tKpfebmf43jbDCUTNwHoq77qtUzofMYJzXCjWL63WE3MgiEcRHIHI
	 qQ4HBSG5dwgrGx3bFqWON1PSmLfUOeO/9Ekw/8hnHl8+COKKSMBP20xR+sZ3WCnIiM
	 18e3sjvuTFxh21OhR7A6jKN80WauASbEYt4rq6VJlD0XJOqPzv2ROpTpRJM0RpeI18
	 6W2EoFZ97ggow==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-37ba5af5951so8039821fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 06 Jan 2026 02:55:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVOtyHSgMcBr72FAE+PpBShSdGT3WTSVxRjIqkcuE/Euq+/wptOpXlIZOo0lZMqHb2+zynGMY1i0N+g@vger.kernel.org
X-Gm-Message-State: AOJu0YwYoGXwZIAqIs08dbMFRQ/Ap13OPqQ9l6SZjgBUws9yZppePxA3
	15oQ7NNcUhA2JvXMT28JS/hsdRFqFj9B7lo1EokjE5KvB4iZoXPel6zGFvEbcAFPIq4SfN5INcQ
	XYFR9GLAj/il13WOsL5a0nkFMP8dLei7Ff4k7/wsPxA==
X-Google-Smtp-Source: AGHT+IFhB+XAn7zv9YfLe9lNUivJvFp1plUWjMXLlIb+A6No8KKn6zOi3++VfmXBUPzX0NBh4BhE3SW+1QtSpiNsv64=
X-Received: by 2002:a2e:bc15:0:b0:37f:8332:6ae0 with SMTP id
 38308e7fff4ca-382eaacdb89mr7096461fa.33.1767696934644; Tue, 06 Jan 2026
 02:55:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251222-gpio-shared-reset-gpio-proxy-v1-0-8d4bba7d8c14@oss.qualcomm.com>
 <CGME20260105115023eucas1p1af1f8e80041f94843beb664966894fb9@eucas1p1.samsung.com>
 <20251222-gpio-shared-reset-gpio-proxy-v1-3-8d4bba7d8c14@oss.qualcomm.com>
 <00107523-7737-4b92-a785-14ce4e93b8cb@samsung.com> <CAMRc=Mc7dqqpNTb9WSLD7ZZr9dmUTO_rvujJi3LhhjVncjE-8w@mail.gmail.com>
 <3cb799ed-6760-481b-991d-5d90a23b9128@samsung.com> <eac0d2aa-fcc0-4aa4-a266-89957dcf7b70@samsung.com>
In-Reply-To: <eac0d2aa-fcc0-4aa4-a266-89957dcf7b70@samsung.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 6 Jan 2026 11:55:20 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mcu07hjSFHdAf6rJphmFoc62D4D19=Xo8PkaFbDfp8EZA@mail.gmail.com>
X-Gm-Features: AQt7F2owXjmD2cWmM2NehY38JmEXxnt-zKQjLVX0d885J3u4n1aTGpBPL2Zv2dw
Message-ID: <CAMRc=Mcu07hjSFHdAf6rJphmFoc62D4D19=Xo8PkaFbDfp8EZA@mail.gmail.com>
Subject: Re: [PATCH 3/3] gpio: shared: allow sharing a reset-gpios pin between
 reset-gpio and gpiolib
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 5, 2026 at 7:16=E2=80=AFPM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> >>
> >>> 1. Samsung TM2e - arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts
> >>>
> >>> exynos-dsi 13900000.dsi: [drm:samsung_dsim_host_attach] Attached
> >>> s6e3hf2
> >>> device (lanes:4 bpp:24 mode-flags:0x6e0)
> >>> Unable to handle kernel NULL pointer dereference at virtual address
> >> Could you use faddr2line to point me to the exact offending line? This
> >> would speed up the debugging.
> >
> > I need some time to get that output, but this issue is caused by a
> > devm_gpiod_get_optional() call for a gpio that is not defined for that
> > board.
> >
> I think that everything is in the call stack:
>
> Call trace:
>   gpiod_direction_input_nonotify+0x20/0x39c (P)
>   gpiod_configure_flags+0x23c/0x480
>   gpiod_find_and_request+0x1a0/0x574
>   gpiod_get_index+0x58/0x84
>   devm_gpiod_get_index+0x20/0xb4
>   devm_gpiod_get_optional+0x18/0x30
>   samsung_dsim_host_attach+0x1c8/0x284
>   mipi_dsi_attach+0x30/0x54
>   s6e3ha2_probe+0x148/0x200 [panel_samsung_s6e3ha2]
>
> ...
>
>
> The issue is in gpiod_direction_input_nonotify+0x20/0x39c:
>
> $ grep gpiod_direction_input_nonotify System.map
> ffff800080810360 T gpiod_direction_input_nonotify
>
> $ aarch64-linux-gnu-addr2line -f -e vmlinux ffff800080810380
> class_gpio_chip_guard_constructor
> /home/m.szyprowski/dev/kernel/linux-next/drivers/gpio/gpiolib.h:231
>
> IMHO it looks that gpiod_configure_flags() is called for NULL gpio_chip.
>

The whole point of this macro is to make sure the chip is not NULL. It
dereferences gdev->chip under SRCU for that reason.

Is it the descriptor (struct gpio_desc *desc) pointer passed to
gpiod_direction_input_nonotify() that is NULL by any chance? It
shouldn't be possible but I want to rule it out.

Also: it doesn't really look like it has anything to do with shared
GPIO management. I looked into the DTS and there are no shared GPIOs.
Can you enable CONFIG_DEBUG_GPIO and post the entire kernel log just
to make sure? Is the issue reproducible and goes away when that commit
is reverted?

Bartosz

