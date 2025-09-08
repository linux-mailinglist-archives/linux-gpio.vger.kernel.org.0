Return-Path: <linux-gpio+bounces-25748-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC9DB4906D
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 15:55:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F1388345F73
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 13:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6658E30CDA7;
	Mon,  8 Sep 2025 13:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DYtp9zra"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6363730C350;
	Mon,  8 Sep 2025 13:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757339596; cv=none; b=UxGQYWSJE3K4xGwSABy23SJ6p1tCS10FrjNgnTu1B7Qpz8C98cWuSM7Y3LiQgIjm9DCv0y4DtpMD8ha55HDQ6LiMdAmoVGaWmFE8WPf0nUpX9I3ile6pJdcJHpxk0kEALDVN+93hmXjJ2O+LaFWouy8IST3FxemeO1xqzi9pVKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757339596; c=relaxed/simple;
	bh=XHCWMZvvdtWa1+WbwLMOHSGAMdRjcSr+YUaIUbFqFFI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j/O2SxdA5Yp5mw/rXGtfLHNuvI0xb7gfwko1upPjudK4saL9DrPr5JcOkza1pi26CpwZrdlf9RcGtbLklCgnOuFkxAafpJuTvo2rP5YWv5qLhq85+gg3u77QgkfC3uc/AemV2q70cQA7VXScgeTU0+Kga0vgvyHCpwqTaou5Q2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DYtp9zra; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45dcff2f313so26779745e9.0;
        Mon, 08 Sep 2025 06:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757339593; x=1757944393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bi8yTXJoOBwCylt9q6MtHjP7YgyhzTMi3lxmixfzTvA=;
        b=DYtp9zraeLsI/Dp7TPjQvnF0QADziHlPtV8XyQocfKuoXJnm8IJN/f1q46BMaio4FX
         tYVRAceNUHwU1yUtgrCC62/GDQ9C4bA3iJWIkDrvUx2NhSo7XH/4hRm8Yr5uQ6rpU1Gw
         XU56sBSSHba2itZO7EzkWOPWVvUh9YCPqzQa7bOvj62DZLaHeJTLcNs3aJFBopVsF5B4
         ngqMjl0IJV6vOUzFhFkl5oa0js+3P7enR2CJ2WcTeriI7+42jQqGEnNlksXRbx+OKNtg
         00qNUO4DXdhvB/b/8zmynz3WfRne7eIGN6JeuD7ZU2ETPQMT6U5udiMIbsak6EnWZooW
         vHRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757339593; x=1757944393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bi8yTXJoOBwCylt9q6MtHjP7YgyhzTMi3lxmixfzTvA=;
        b=cuaLlE4kTmdDE240/ZMw8xqftukWQtIlyBm2zG2GItFI6uUnVYt4jqXTSa4ZJ3aS4N
         R+/oILybaL0hUhDu7qknUfd6wKHpVKSxEVBE7tXlHEKn4Uyn8AUwkqufNYLn3gDj+yF8
         1j4Q3r9lP0qvxmHzhU5CACCARBHnG1yugFisMx5rVu8Qi97FwS2eMSsvbTH3hH8vQFAX
         3MKQvrbvGGnOrT7UnfYoHdDbmv4rNeRhW3gtG8LlWcqsrHZRTbbJfVhxY9YleBxDatAn
         +fO8THAQ+vrV/74d5f6tqCjuW9kz1cApYvN4nlGjQ0967TH067Q1NJt6nRa7ZJNIACv/
         MjtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYQ2WJoxtiWpOhBLYTct18MkGJ/6ILTXTAldFg/F4o2sAwf9R1YYGiqqnv4ha/OTk818NY5zIcAHwZ@vger.kernel.org, AJvYcCW5ycFVn/SFOwbP5RGmJeIxG9p5nnyRER6bITMTgH9UU1CYc79wML8AOj6h3/wAN1Yu6tjZxD/lRN/+JA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEAWGDgbMrBB02NqmtWRQR12gXoX/QCe1AprchnIAc6BqHOQ0W
	Ro51D4MEswxAf9khEg2WtPi9fgbP69VFTr3czJpEsbWisfZJJh3TAGWs
X-Gm-Gg: ASbGncs5bNHpqbdImLrfC94JLqSRlQxU5lMjkfLZ6J/tJLgx8q8MpoiFF5crQE9kdPL
	0t6BPMWUW87m3Jlfn9c7dc9MvRLJPn40xIj4uaBXJzpOHWS8YQNIs/q/pS5miwfEMTRy8W19vk0
	QxecZkVq1ndpIcTNyaJ5rTECWI6Va5PMPp+reg270GP1Y0Y8Ol2SMnCnw7xWtI0kZP98mO7p3ml
	FDrxgOLNKcb2YBeLX2/jG8NnkpmaDMlwU96xNtiy23giFzkDFSmeX+mjrlByK//0uO2tLj+DnfF
	Jipslyp5sAaWj15hE0xoD5+Rs7KZ6sVMV5rXJIDsxd5XVvxLVRgV05GLoTA4zpq4YJnR5l46Bl+
	OyGdTs7FL/tgJactuzX9TG3sxHO1SFEh0YGIKCqC4PHI9OpqTfvF/5vhX9f+z7r9WAVM6UxyPeF
	E=
X-Google-Smtp-Source: AGHT+IFymJM5Q/838u4sNcO2o9XEJ5qNZ4BhV9dGgjKVBrrKdv1vk6q5UfzwHAK51v7oPTW2ilOY8A==
X-Received: by 2002:a05:600c:3b8b:b0:45d:d356:c358 with SMTP id 5b1f17b1804b1-45dddec3b92mr84964785e9.16.1757339592629;
        Mon, 08 Sep 2025 06:53:12 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45d468dbf48sm206620575e9.11.2025.09.08.06.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 06:53:12 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject:
 Re: [RFC PATCH 1/9] pinctrl: sunxi: rename SUNXI_PINCTRL_NEW_REG_LAYOUT
Date: Mon, 08 Sep 2025 15:53:11 +0200
Message-ID: <5037008.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20250821004232.8134-2-andre.przywara@arm.com>
References:
 <20250821004232.8134-1-andre.przywara@arm.com>
 <20250821004232.8134-2-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne =C4=8Detrtek, 21. avgust 2025 ob 02:42:24 Srednjeevropski poletni =C4=
=8Das je Andre Przywara napisal(a):
> After keeping the pinctrl IP mostly register compatible for almost a
> decade, in 2021 Allwinner introduced some changes to the register
> layout, which made us use a flag called SUNXI_PINCTRL_NEW_REG_LAYOUT.
> Now with their latest SoC (A733), Allwinner changed the pinctrl IP
> again, so "NEW" isn't really a fitting name anymore.

That was bound to happen.

>=20
> Rename the symbol to SUNXI_PINCTRL_NCAT2_REG_LAYOUT, with "NCAT2" being
> a name often used in vendor source code to signify this "new" generation
> of SoCs.
>=20
> Just a rename of the symbol, no actual code changes.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviwed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/pinctrl/sunxi/pinctrl-sun20i-d1.c     | 2 +-
>  drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c | 2 +-
>  drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c   | 2 +-
>  drivers/pinctrl/sunxi/pinctrl-sunxi.c         | 2 +-
>  drivers/pinctrl/sunxi/pinctrl-sunxi.h         | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun20i-d1.c b/drivers/pinctrl/=
sunxi/pinctrl-sun20i-d1.c
> index 8efe35b77af4d..37a60e5d1163b 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sun20i-d1.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sun20i-d1.c
> @@ -821,7 +821,7 @@ static const struct sunxi_pinctrl_desc d1_pinctrl_dat=
a =3D {
>  static int d1_pinctrl_probe(struct platform_device *pdev)
>  {
>  	return sunxi_pinctrl_init_with_flags(pdev, &d1_pinctrl_data,
> -					     SUNXI_PINCTRL_NEW_REG_LAYOUT);
> +					     SUNXI_PINCTRL_NCAT2_REG_LAYOUT);
>  }
> =20
>  static const struct of_device_id d1_pinctrl_match[] =3D {
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c b/drivers/pinc=
trl/sunxi/pinctrl-sun55i-a523-r.c
> index 69cd2b4ebd7d7..86a12bce0e335 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
> @@ -36,7 +36,7 @@ static int a523_r_pinctrl_probe(struct platform_device =
*pdev)
>  	return sunxi_pinctrl_dt_table_init(pdev, a523_r_nr_bank_pins,
>  					   a523_r_irq_bank_muxes,
>  					   &a523_r_pinctrl_data,
> -					   SUNXI_PINCTRL_NEW_REG_LAYOUT);
> +					   SUNXI_PINCTRL_NCAT2_REG_LAYOUT);
>  }
> =20
>  static const struct of_device_id a523_r_pinctrl_match[] =3D {
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c b/drivers/pinctr=
l/sunxi/pinctrl-sun55i-a523.c
> index 7d2308c37d29e..0f703cacfe5e3 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
> @@ -35,7 +35,7 @@ static int a523_pinctrl_probe(struct platform_device *p=
dev)
>  	return sunxi_pinctrl_dt_table_init(pdev, a523_nr_bank_pins,
>  					   a523_irq_bank_muxes,
>  					   &a523_pinctrl_data,
> -					   SUNXI_PINCTRL_NEW_REG_LAYOUT |
> +					   SUNXI_PINCTRL_NCAT2_REG_LAYOUT |
>  					   SUNXI_PINCTRL_ELEVEN_BANKS);
>  }
> =20
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunx=
i/pinctrl-sunxi.c
> index 0fb057a07dccb..0a5acbd978da9 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> @@ -1521,7 +1521,7 @@ int sunxi_pinctrl_init_with_flags(struct platform_d=
evice *pdev,
>  	pctl->dev =3D &pdev->dev;
>  	pctl->desc =3D desc;
>  	pctl->variant =3D flags & SUNXI_PINCTRL_VARIANT_MASK;
> -	if (flags & SUNXI_PINCTRL_NEW_REG_LAYOUT) {
> +	if (flags & SUNXI_PINCTRL_NCAT2_REG_LAYOUT) {
>  		pctl->bank_mem_size =3D D1_BANK_MEM_SIZE;
>  		pctl->pull_regs_offset =3D D1_PULL_REGS_OFFSET;
>  		pctl->dlevel_field_width =3D D1_DLEVEL_FIELD_WIDTH;
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunx=
i/pinctrl-sunxi.h
> index ad26e4de16a85..fb17fae2dab69 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> @@ -88,7 +88,7 @@
>  #define SUN4I_FUNC_IRQ		6
> =20
>  #define SUNXI_PINCTRL_VARIANT_MASK	GENMASK(7, 0)
> -#define SUNXI_PINCTRL_NEW_REG_LAYOUT	BIT(8)
> +#define SUNXI_PINCTRL_NCAT2_REG_LAYOUT	BIT(8)
>  #define SUNXI_PINCTRL_PORTF_SWITCH	BIT(9)
>  #define SUNXI_PINCTRL_ELEVEN_BANKS	BIT(10)
> =20
>=20





