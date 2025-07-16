Return-Path: <linux-gpio+bounces-23336-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C10F1B06CC4
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 06:43:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2F0BC7B40F0
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 04:42:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 128F3265637;
	Wed, 16 Jul 2025 04:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jEjC93v6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F86253356
	for <linux-gpio@vger.kernel.org>; Wed, 16 Jul 2025 04:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752641010; cv=none; b=mWYgPBEzv3mcvvCbL2+R2Yj1ha09mGj4iLzSNIb3L03yY2jCeG7UP8sN/uVi1cR2BQIqqF0/28iyRRwGcLTbuRvmipcrpb5aP+lzPC6mddEbSCXCO1QEsY6xaUTOT+iG9SOKOTWJp1rDKzCuzzSnrsBkOC4+PO4iUt63EF+WkbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752641010; c=relaxed/simple;
	bh=zwB4EjVhaGmCzUl5B4SCz6jWqAHvNe6rLsTwWNK4olg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nkLTcvk5gE7ICV4boV4HudpUVzKLd9DRAZh6rH9QH6FUWtkmVLIWRXslKvfGtzhMRBZYvWX2nLYcW3IdU7VCkcXdEgOSlmKG4FY1s8EODLci69vfBMkdXBLKfLQ5RmqZ9WvdZC+Vk17S+1A8osHEjmZLABbdBDKOvtfQ2NAAMWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jEjC93v6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BE90C4CEF4
	for <linux-gpio@vger.kernel.org>; Wed, 16 Jul 2025 04:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752641010;
	bh=zwB4EjVhaGmCzUl5B4SCz6jWqAHvNe6rLsTwWNK4olg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jEjC93v6Jt8RzgQUuC7aBRFsirlWknsvl/IZ0Zh2AD2FEhcHo3ezUm9MVSRepF4NI
	 ALBXuzGBToN5XhyBA/6xffk3Om9EzQGM2bcNh6BaGUKSZPtaM9ZvZeVOAvSrs5emCk
	 dl3MYJO5piqt7Ri8ShWSRKRpxsSkCsBwoQr4U8IPDlZEpcvYlMMwqcF92fuqhL0/4r
	 dU5BfjacM5318QgIKXq4R5y9jyLoexHBUJRAhbyLkdaZ27gYL1TsbQGiyxDCJfG0tT
	 OxgrKzh3lO1YViyN/bh11cmxcHcigCyNdF9KinBsNACyodnwXM6ZnGF4rnvhJijCqQ
	 HwP9bR6PK2o0w==
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-60789b450ceso11465649a12.2
        for <linux-gpio@vger.kernel.org>; Tue, 15 Jul 2025 21:43:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUr1M+CPmDvjLTB+1B2tu74P54PRYoM0Uj4Aa6fzbAmaK5t66s0CFAFsyfxLSoNULNewYOVZlyNA/9t@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc3vBIpBwo14JN8t+fZ+1b+NKajWhlblk7ow9st+eSQcuido85
	KjhZmXTuKFSSC5N0F6/qMiTGIc1yN0xjgyIoOTWDiDbvu8wxwR5aocebuia/5+2VXN2Ivnd9j63
	qiIIcSLMZa/bAmc1FDX43px85Z3eo9Mc=
X-Google-Smtp-Source: AGHT+IGeE+if8Ayb0ICa+ec73Rjvr/DANiAwMLEAUbemzHM+pI0fSLh5p4fkDBTdx5OyuBtATeyOPBfm4N4WGQj5di4=
X-Received: by 2002:a05:6402:34d6:b0:608:6754:ec67 with SMTP id
 4fb4d7f45d1cf-61285bf3730mr1035681a12.30.1752641009015; Tue, 15 Jul 2025
 21:43:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250714064542.2276247-1-zhoubinbin@loongson.cn>
In-Reply-To: <20250714064542.2276247-1-zhoubinbin@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 16 Jul 2025 12:43:18 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5Pjbza1cAwjBDbUo+=r0Om3CkX6f7K2tWhgaWkQpVqGw@mail.gmail.com>
X-Gm-Features: Ac12FXxhAE9VbIwEVo1EYDrMHOHDVPu806Tbuv8tKeVIwSSgB_xzla3Sy5CmiR0
Message-ID: <CAAhV-H5Pjbza1cAwjBDbUo+=r0Om3CkX6f7K2tWhgaWkQpVqGw@mail.gmail.com>
Subject: Re: [PATCH] gpio: loongson-64bit: Add loongson gpio irq support
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, linux-gpio@vger.kernel.org, 
	Xi Ruoyao <xry111@xry111.site>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>

On Mon, Jul 14, 2025 at 2:46=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.cn=
> wrote:
>
> Add the interrupt enable register offset (inten_offset) so that GPIO
> interrupts can be enabled normally.
>
> According to the latest interface specifications, the definition of GPIO
> interrupts in ACPI is similar to that in FDT. The GPIO interrupts are
> listed one by one according to the GPIO number, and the corresponding
> interrupt number can be obtained directly through the GPIO number
> specified by the consumer.
>
> Signed-off-by: Xi Ruoyao <xry111@xry111.site>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  drivers/gpio/gpio-loongson-64bit.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpio/gpio-loongson-64bit.c b/drivers/gpio/gpio-loong=
son-64bit.c
> index 26227669f026..d5b2ad848519 100644
> --- a/drivers/gpio/gpio-loongson-64bit.c
> +++ b/drivers/gpio/gpio-loongson-64bit.c
> @@ -222,6 +222,7 @@ static const struct loongson_gpio_chip_data loongson_=
gpio_ls2k2000_data0 =3D {
>         .conf_offset =3D 0x0,
>         .in_offset =3D 0xc,
>         .out_offset =3D 0x8,
> +       .inten_offset =3D 0x14,
>  };
>
>  static const struct loongson_gpio_chip_data loongson_gpio_ls2k2000_data1=
 =3D {
> @@ -230,6 +231,7 @@ static const struct loongson_gpio_chip_data loongson_=
gpio_ls2k2000_data1 =3D {
>         .conf_offset =3D 0x0,
>         .in_offset =3D 0x20,
>         .out_offset =3D 0x10,
> +       .inten_offset =3D 0x30,
>  };
>
>  static const struct loongson_gpio_chip_data loongson_gpio_ls2k2000_data2=
 =3D {
> @@ -246,6 +248,7 @@ static const struct loongson_gpio_chip_data loongson_=
gpio_ls3a5000_data =3D {
>         .conf_offset =3D 0x0,
>         .in_offset =3D 0xc,
>         .out_offset =3D 0x8,
> +       .inten_offset =3D 0x14,
>  };
>
>  static const struct loongson_gpio_chip_data loongson_gpio_ls7a_data =3D =
{
> @@ -254,6 +257,7 @@ static const struct loongson_gpio_chip_data loongson_=
gpio_ls7a_data =3D {
>         .conf_offset =3D 0x800,
>         .in_offset =3D 0xa00,
>         .out_offset =3D 0x900,
> +       .inten_offset =3D 0xb00,
>  };
>
>  /* LS7A2000 chipset GPIO */
> @@ -263,6 +267,7 @@ static const struct loongson_gpio_chip_data loongson_=
gpio_ls7a2000_data0 =3D {
>         .conf_offset =3D 0x800,
>         .in_offset =3D 0xa00,
>         .out_offset =3D 0x900,
> +       .inten_offset =3D 0xb00,
>  };
>
>  /* LS7A2000 ACPI GPIO */
> @@ -281,6 +286,7 @@ static const struct loongson_gpio_chip_data loongson_=
gpio_ls3a6000_data =3D {
>         .conf_offset =3D 0x0,
>         .in_offset =3D 0xc,
>         .out_offset =3D 0x8,
> +       .inten_offset =3D 0x14,
>  };
>
>  static const struct of_device_id loongson_gpio_of_match[] =3D {
>
> base-commit: e502df58b5e3767c00e887744b6eff43b7fde3ea
> --
> 2.47.1
>

