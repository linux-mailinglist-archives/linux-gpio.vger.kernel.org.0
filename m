Return-Path: <linux-gpio+bounces-27417-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 61532BFA86D
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 09:24:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6669D356406
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 07:24:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D17F52F83C4;
	Wed, 22 Oct 2025 07:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="atcQMrZ6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5AD2F7462
	for <linux-gpio@vger.kernel.org>; Wed, 22 Oct 2025 07:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761117832; cv=none; b=eAJorxKR3CPo0Sux6iweI3RPKSV5YZ0RDJFghiq+DRTK1ijuIzma8BP8PK6OLG5NyEqlT56Xv1R7Z6VZIXSS2k8hlTpgUVgnfCWmpDVf/tt5PpFl2OJf6sbntYhi6CIYEzon1xJMLlYK7Zr6A23Tl9RQqXzPvtVXD2NWqTnQu4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761117832; c=relaxed/simple;
	bh=KAzF1t+jG/TWqXNpynShq2i67Mb+W9sWwRnWCZGDy80=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rQvFCFOPpuU7Ec+UWD2fPSnTjC7KkDgZI89CdSCg27aNuLOTuCEThuJ2ZZDIviSpcKvjvXh/GJOWg3C79hu4VjSlO8MMVF0jTGi7FguILEgSe9/czkxsfmlWuPMv4+6jNakXQTkK/L7xD34upPCxH+yww0wP04Gk/HJik0yGuZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=atcQMrZ6; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-57f1b88354eso7273374e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 22 Oct 2025 00:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761117829; x=1761722629; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5A1id1SGRYPwkfypYJ6qRn/5uL2uarF90qzz71rp2EQ=;
        b=atcQMrZ6deXkIw+U1xSYPmcqhQJcgzReuep7WDdtIBDMczeRThGqf3MyYh3Xw+90Gz
         +Xo4db7nB3OYKQtrMXqaJHFtzBS1kPTbjlt8sty3AZ0Ld0WNZU2OC3wue+ybpblXHpEu
         d3PUnSkkwVY9/Jsc88Sf6buE3+Bz2s/hMpky5sdKvL/35UOAKeoY9keGpDc3GWkFDuxd
         otQlTUW1h2iQLDLQMM9AtHydgzVdREv30R8TlK5Mc+OlwKqXj9Z0BGkqVn2/uZQF5KKH
         haQrag1IQ5Qhx2W4S2FmvPUqAcrW3g1E4DtOJHvzqodB3l+nMImTvNp9OlUNXFdRJelE
         FDBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761117829; x=1761722629;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5A1id1SGRYPwkfypYJ6qRn/5uL2uarF90qzz71rp2EQ=;
        b=i+L6J64WFKlVmgp6goP2paVKnIKtKFSrC9FeCTxznLq0oVzURz+0laNHuqwPUuUAKU
         E/YK5+v9mBJ9vXo2UP/yS6R3jQuWwdgCH5BSUAgh4KBI6r/mUKeorj3g5tPE88v50O0j
         qPsr0I34jHDE22uC61UyngP/PJU8UU+kLI71fE5dbmI1LM5zIjwu16N9lnMpqXkpgCrY
         DEnUNTDp/h8uHrxQY8Ib3bsNplVKYJpD6IOnVF3SlMLituIdu0mdzi4I/LrYQYo0BgH/
         +2OELH5jY8JSqzxRLUFGl9NIhSPK8l8OWuGA3GL/wYULFM2fAXRsPu600HcBkt1q7W97
         2klQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSL6vxBiH6EBEcZ/QG6OoHaftNV9nHCKwA5wgtfEfP4RUauA15iLOot9C0O+fFQQd47ilK/1bZCF3C@vger.kernel.org
X-Gm-Message-State: AOJu0YwfcPoWxOIDcW/QP9PtjncZ2wsEyjCJe7S6WjLYsIrzbkYZ5Bb+
	GlTSCWf3CSziaWe2H4Bfak0b/3OGl4SVTwxQUIijj5PNDjBOCS3Zmp440cv+Ny9M4u5Yvkr/lW9
	krtaddsTdYKkXUiB2lG4kmolpjEU/facYu8WGQOc26qqC9Dfn+jbkJ/Qw6Q==
X-Gm-Gg: ASbGncsMu2kYmmyBqxNUaQ78+R6tca9S5UBKiMnCm1f6ldNjQnJKfJhduuRjCpEV5nQ
	0dqgAkFO2S8xHe/b3G1bdlgqm477ZpB3MnUEedAEeLb24Jz0OabzsKNM9P3IngF3fhNBQbEvwNp
	PH2l3Wc7ud+4D1+wzuHjSdtnIVQE3bDMlBrAMrO6WenMfjv0x7/ly/ZD4RCs6b2gnrEiwL5Rt4U
	bRhJloUsU3FMvkNmn3C1OzKr31fCvbbz6f/D7l9/xWdTx2Ouo/Wk8up8Ps3pO7snPvfR8As29rA
	d0gK3o3QBTa5pR+p
X-Google-Smtp-Source: AGHT+IGeyQXjZLLCFK5JPYKsrKRqqZiejy+zuOYqH5QxSDczg7GGQ5xLajlHxEL5O+oHFuqe15LrIT93CQawnFHffbo=
X-Received: by 2002:a05:6512:10d5:b0:591:c5bb:ce44 with SMTP id
 2adb3069b0e04-591d8565542mr6721828e87.43.1761117828734; Wed, 22 Oct 2025
 00:23:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251021181631.25442-1-alitariq45892@gmail.com>
In-Reply-To: <20251021181631.25442-1-alitariq45892@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 22 Oct 2025 09:23:37 +0200
X-Gm-Features: AS18NWCsM_dUl8fxQ2wYJOUQ3nXW_TsGWO5r7_7o5MFypE6AK4VLb7fy2KZDeW4
Message-ID: <CAMRc=Mc9e4P9vCt79yR1Jt5_2wxUngqAR_m1AxG=nbz=Cr3BjQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: starfive: use dynamic GPIO base allocation
To: Ali Tariq <alitariq45892@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	Emil Renner Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 21, 2025 at 8:17=E2=80=AFPM Ali Tariq <alitariq45892@gmail.com>=
 wrote:
>
> The JH7110 pinctrl driver currently sets a static GPIO base number from
> platform data:
>
>   sfp->gc.base =3D info->gc_base;
>
> Static base assignment is deprecated and results in the following warning=
:
>
>   gpio gpiochip0: Static allocation of GPIO base is deprecated,
>   use dynamic allocation.
>
> Set `sfp->gc.base =3D -1` to let the GPIO core dynamically allocate
> the base number. This removes the warning and aligns the driver
> with current GPIO guidelines.
>
> Tested on VisionFive 2 (JH7110 SoC).
>
> Signed-off-by: Ali Tariq <alitariq45892@gmail.com>
> ---
>  drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c b/drivers=
/pinctrl/starfive/pinctrl-starfive-jh7110.c
> index 05e3af75b09f..eb5cf8c067d1 100644
> --- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
> +++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
> @@ -938,7 +938,7 @@ int jh7110_pinctrl_probe(struct platform_device *pdev=
)
>         sfp->gc.set =3D jh7110_gpio_set;
>         sfp->gc.set_config =3D jh7110_gpio_set_config;
>         sfp->gc.add_pin_ranges =3D jh7110_gpio_add_pin_ranges;
> -       sfp->gc.base =3D info->gc_base;
> +       sfp->gc.base =3D -1;
>         sfp->gc.ngpio =3D info->ngpios;
>
>         jh7110_irq_chip.name =3D sfp->gc.label;
> --
> 2.43.0
>
>

That's a NACK until you also remove JH7110_AON_GC_BASE and
JH7110_SYS_GC_BASE assignments after explaining why they are no longer
needed.

Bartosz

