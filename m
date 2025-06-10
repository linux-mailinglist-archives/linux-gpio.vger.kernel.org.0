Return-Path: <linux-gpio+bounces-21165-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 10233AD3581
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 14:03:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9EE83A8B0F
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 12:02:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1691226161;
	Tue, 10 Jun 2025 12:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L4840hl8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC7722DA14;
	Tue, 10 Jun 2025 12:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749556990; cv=none; b=accdPfhBfNe8YBEHBoYkukBtHuJ7GFg+sLQLrQ3nNX2wmdBzVvJOxGxscMybUMn7Rr/31MkXPex4V0idqjxOnV2D9hq+yF9tMxl/fucIfL8bRZUBTvLccFdsNESvmKt+8mseQ+9r4Mu9TNA2bacUyOTOrNgkBSHQmg9QJ29SkS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749556990; c=relaxed/simple;
	bh=QmWiAygvj8edZR+MhBol5WXAZW9ghl6ZqYJhUHNoB1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a3ofoEFRF+Ny2lfCV6X/0qD1oryUBo+aqCQpNffr9eqzACS1HRwOSfhW/SUXgk46b5y0l75pGbk0tL5dBiA0rm7S+1cWgUK2oCDqUSoUMODCwxWZrR+xrsZkdWY8wMOn9pQHma4paI2nFBOq95mRnLmtShmwAaBkh6+0+fmJrrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L4840hl8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A19BC4CEF5;
	Tue, 10 Jun 2025 12:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749556990;
	bh=QmWiAygvj8edZR+MhBol5WXAZW9ghl6ZqYJhUHNoB1Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=L4840hl8uQKdsxX9qnd5byyA7sAgQEdNhdt48OJX0fbDN6H/CUWUvrxJxcugSfCUv
	 jFqBuPPvIxOb4HB+lFlUHsC7VxQxMIXTjBRyuK7zoTd8ufpiV5w/sa2JmkcWv+/KCU
	 tyW//EV0/BVGetwgPPqqfm+qZTPAnALSnHoX0L6KPieWGY2Twn2usB/MQqn8onOk5p
	 OiXXUa4H9D2PDTmtLHs3xh+Lmj2g7uscnSJaB5qSCVILYz7HTzoY76DwAgzNnGMGP8
	 S4Mp1HVO7U5hinauqkAnNW/cZOeZTHcsmYYBJ00ncIQichhHyd6K1YNyCkB8YeEysT
	 KLT+UFhQ1fQuw==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-607873cc6c4so7625217a12.1;
        Tue, 10 Jun 2025 05:03:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUtanjRiQkoAf+m61bJCx9Vr9zAHuAYmtLTl6UOSnnPPkj7zz91k+e1YncZuZOl11QKuA/Qkb/5@vger.kernel.org, AJvYcCVktvJt5+yc4E+Tef8evfPkc0hgppMRj79VJ+gzxHBlvz1cKAcxBH+LFAFvYlMGENN4IwWhrlFILfke@vger.kernel.org
X-Gm-Message-State: AOJu0YzhTo0bNc9PA8CXpyIaDQh74U8ERF85OMrduq3NjJn6Bhfjf1Iv
	DAslwS6moAbXKPBAQ1RCK4nS/XyJ4/0oD8eMGfjB1FEkVwYk9P03rsXUOXj7YI1TcwISdSqwewD
	1o3rNXbMK//fgzGCAjwx3/jAQA0PTfOI=
X-Google-Smtp-Source: AGHT+IFHCHL/ee2hFn9QEyn33ksXkw1BklvfIvjLzbDrvdjzzKtCaI+6os+z1UUnWFSFYHKinnnCWpQbo2OQNAi04jo=
X-Received: by 2002:a05:6402:40c6:b0:602:a0:1f2c with SMTP id
 4fb4d7f45d1cf-60818622f77mr2923922a12.9.1749556988625; Tue, 10 Jun 2025
 05:03:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610115926.347845-1-zhoubinbin@loongson.cn>
In-Reply-To: <20250610115926.347845-1-zhoubinbin@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 10 Jun 2025 20:02:56 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5Aq=GoJpY6KH9FQX_RcPfx0D9XUtjjVf=ZfxEdhj93mQ@mail.gmail.com>
X-Gm-Features: AX0GCFuMIhw27w0kkeHJL2qow9985_yOnSIrlzLWYAsJ60bLBiVLgnww5FP0JEM
Message-ID: <CAAhV-H5Aq=GoJpY6KH9FQX_RcPfx0D9XUtjjVf=ZfxEdhj93mQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: loongson-64bit: Correct Loongson-7A2000 ACPI GPIO
 access mode
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-gpio@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>

On Tue, Jun 10, 2025 at 7:59=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.cn=
> wrote:
>
> According to the description of the Loongson-7A2000 ACPI GPIO register in
> the manual, its access mode should be BIT_CTRL_MODE, otherwise there mayb=
e
> some unpredictable behavior.
>
> Cc: stable@vger.kernel.org
> Fixes: 44fe79020b91 ("gpio: loongson-64bit: Add more gpio chip support")
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  drivers/gpio/gpio-loongson-64bit.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-loongson-64bit.c b/drivers/gpio/gpio-loong=
son-64bit.c
> index 26227669f026..70a01c5b8ad1 100644
> --- a/drivers/gpio/gpio-loongson-64bit.c
> +++ b/drivers/gpio/gpio-loongson-64bit.c
> @@ -268,7 +268,7 @@ static const struct loongson_gpio_chip_data loongson_=
gpio_ls7a2000_data0 =3D {
>  /* LS7A2000 ACPI GPIO */
>  static const struct loongson_gpio_chip_data loongson_gpio_ls7a2000_data1=
 =3D {
>         .label =3D "ls7a2000_gpio",
> -       .mode =3D BYTE_CTRL_MODE,
> +       .mode =3D BIT_CTRL_MODE,
>         .conf_offset =3D 0x4,
>         .in_offset =3D 0x8,
>         .out_offset =3D 0x0,
>
> base-commit: e0d4a0f1d066f14522049e827107a577444d9183
> --
> 2.47.1
>

