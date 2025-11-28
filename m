Return-Path: <linux-gpio+bounces-29178-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE68C914EE
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Nov 2025 09:51:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D2C134E277C
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Nov 2025 08:51:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D98122F1FD3;
	Fri, 28 Nov 2025 08:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CzXH5Dw5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A43927B324
	for <linux-gpio@vger.kernel.org>; Fri, 28 Nov 2025 08:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764319868; cv=none; b=hY7pVyVU0mQRhuUwGM7GW5rJLpCDEcMaZqUE0UJ0OHLBMnYbvAhntm/fVq4Ed9wI/GvYUvNhchbbyyDfpqENP93O/01YwYNQkxXKeb3jkrVneSFSICrTk2uITTZdriYrGp1pcmIMm28JYiWPkhskTpLwXKyys+TPk25fZVoR3dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764319868; c=relaxed/simple;
	bh=cStjCdmu/XjU9UdftT+gFtkZTXeDN1Na3NsnkdbDc08=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mrzSccp1P/1sTkdYDKtN5WI4A5/sJ+B9WhdON2FUh8+3iA4ggzII3sb90487uXxL5SMXzG8JqdYf8K2lz88GY1hXPS8/CRD4xlUbDMH7omyn+z7pAbJjjZSZbzK6TSWz9E/Sp2n+tDj/B7mMNQX/PB6HHqyf+YrA0/2Gh0m3KAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CzXH5Dw5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41FE4C2BCFA
	for <linux-gpio@vger.kernel.org>; Fri, 28 Nov 2025 08:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764319868;
	bh=cStjCdmu/XjU9UdftT+gFtkZTXeDN1Na3NsnkdbDc08=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CzXH5Dw5hSHdzGZ2KtAzHDWBKGujRbg5SzD2rN+Cv8ZX86pniZiwy6E74WfkATspT
	 qb4fRsc+yQkKt9FdOHGYDof5iAREE582srdR6yTyWMhBgFBfdDdIYtmK0RhOibJbiZ
	 Gf1gDLuVkheIZassIFrSmhnoGxMhEf3bSOCNR4U2mHWkIcfORcp6MBnMsIfWUS4u+R
	 1r3P3/9JEj2xCltxFBe6jhJ4cPlwOrXvm9m3Q7NIUtxeN/kRZCyi15lKMNFBXzgdLD
	 +Ge9kt1BKYRoizoFCBqKBAAUdj7JaM45ign6f2Du1VyqSBwNeJRELjXh6clH9lKDWN
	 JLiUpzNIA6rdA==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-640aa1445c3so2573628a12.1
        for <linux-gpio@vger.kernel.org>; Fri, 28 Nov 2025 00:51:08 -0800 (PST)
X-Gm-Message-State: AOJu0YwXp8pdCtTf5que4dhp8cjGPbqFmJB8vF/ko5t9oTr91eAHjhwT
	0qw5tO/QI3TGwq6lI5zOad+tubMx5Ao3lzbEWfBMwBtYC0GZRGj5Rppm9bETlx+reVBQ2206aD6
	JRnAAp/zXTqU9SYEWPqZbsFckHs0dsXI=
X-Google-Smtp-Source: AGHT+IGAGHIgD7iYaoiXG/+qhdn4V+4XRkeUjfCaSUCz3qFhqO+0Eq+fKZZEFpacHtC3jd1VFolBOAGdWDW6kBFzCKA=
X-Received: by 2002:a17:906:fd86:b0:b73:8f33:eee6 with SMTP id
 a640c23a62f3a-b76715ac4a4mr2958545666b.23.1764319866787; Fri, 28 Nov 2025
 00:51:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251128075033.255821-1-xry111@xry111.site>
In-Reply-To: <20251128075033.255821-1-xry111@xry111.site>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 28 Nov 2025 16:51:10 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4miSOrtuXS7E9Uc8wbB+-_7KwN97_mna8L58_sEBLvng@mail.gmail.com>
X-Gm-Features: AWmQ_bkvVdTKfZ4tKN5jZ4CcYxS4w6r2VPttqUu2QL8hYPhFhtsstQ4O0ZdxljQ
Message-ID: <CAAhV-H4miSOrtuXS7E9Uc8wbB+-_7KwN97_mna8L58_sEBLvng@mail.gmail.com>
Subject: Re: [PATCH] gpio: loongson: Switch 2K2000/3000 GPIO to BYTE_CTRL_MODE
To: Xi Ruoyao <xry111@xry111.site>
Cc: linux-gpio@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, 
	Mingcong Bai <jeffbai@aosc.io>, loongarch@lists.linux.dev, stable@vger.kernel.org, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Ruoyao,

On Fri, Nov 28, 2025 at 3:51=E2=80=AFPM Xi Ruoyao <xry111@xry111.site> wrot=
e:
>
> The manuals of 2K2000 says both BIT_CTRL_MODE and BYTE_CTRL_MODE are
> supported but the latter is recommended.  Also on 2K3000, per the ACPI
> DSDT the GPIO controller is compatible with 2K2000, but it fails to
> operate GPIOs 62 and 63 (and maybe others) using BIT_CTRL_MODE.
> Using BYTE_CTRL_MODE also makes those 2K3000 GPIOs work.
Use LS2K2000/3000 instead of 2K2000/3000 will be better, others LGTM.
Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>

>
> Fixes: 3feb70a61740 ("gpio: loongson: add more gpio chip support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xi Ruoyao <xry111@xry111.site>
> ---
>  drivers/gpio/gpio-loongson-64bit.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpio/gpio-loongson-64bit.c b/drivers/gpio/gpio-loong=
son-64bit.c
> index 02f181cb219e..82d4c3aa4d2f 100644
> --- a/drivers/gpio/gpio-loongson-64bit.c
> +++ b/drivers/gpio/gpio-loongson-64bit.c
> @@ -407,11 +407,11 @@ static const struct loongson_gpio_chip_data loongso=
n_gpio_ls2k2000_data0 =3D {
>
>  static const struct loongson_gpio_chip_data loongson_gpio_ls2k2000_data1=
 =3D {
>         .label =3D "ls2k2000_gpio",
> -       .mode =3D BIT_CTRL_MODE,
> -       .conf_offset =3D 0x0,
> -       .in_offset =3D 0x20,
> -       .out_offset =3D 0x10,
> -       .inten_offset =3D 0x30,
> +       .mode =3D BYTE_CTRL_MODE,
> +       .conf_offset =3D 0x800,
> +       .in_offset =3D 0xa00,
> +       .out_offset =3D 0x900,
> +       .inten_offset =3D 0xb00,
>  };
>
>  static const struct loongson_gpio_chip_data loongson_gpio_ls2k2000_data2=
 =3D {
> --
> 2.52.0
>

