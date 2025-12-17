Return-Path: <linux-gpio+bounces-29675-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D2CCC6CC9
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Dec 2025 10:30:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E354D3017F3D
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Dec 2025 09:30:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80F1F2C026F;
	Wed, 17 Dec 2025 09:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UzT0jM1v"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4049533A706
	for <linux-gpio@vger.kernel.org>; Wed, 17 Dec 2025 09:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765963822; cv=none; b=oghSNQzyuSRD/REq6EuqUdQBgBuT6/rkYdJTrEYLyP6FHeQId7VXzkhUnziHCjdr1aBsI1h3LmDGP5vX+PZ+M/xrl5Vxx6JWNvmXH7ypttb0GkMZEcKFRt6oHIdoeEJnhd9n16JwnwucudmWIVY+f9wQMd3eyglBlj9XTsdYWMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765963822; c=relaxed/simple;
	bh=fJCFKMQi/tKxFywJrgrXRFleavIuPTur0ad3RANFPNk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GKUneUXc2Dzbyoj/zB8zxgnzrOufecxP6Dwghu8wWa6p/CABQkN+LE6AbLx59PziZLDSUfqPL78jQPbBVmAbCuf1/NnkLCgQnnmqqY6vzNjT6AMfjbr9Kd9f7m7v1iBLpNj+Ux1Tjud1dsOeygzYF6xyLfO7tgKuS6fuSacnAZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UzT0jM1v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFEB6C4CEFB
	for <linux-gpio@vger.kernel.org>; Wed, 17 Dec 2025 09:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765963821;
	bh=fJCFKMQi/tKxFywJrgrXRFleavIuPTur0ad3RANFPNk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UzT0jM1vStl1Toph6c8dHyjDROY48cYOEtzGncblWHJPpszsTKoSTb2e+VySgBoET
	 35C3rDALfU0QOhjrekYBDBkScRTZVIOo1+TQw2HGYSk65WMqq+QpLEHGwZHwkFxwPg
	 69k33h0YJbKg0F/FxQb52zL1FJRfIgdIwT/0KxuA8NpKJoxbUEjrE8d4WayIy2OA9p
	 uDkO1cSzxu50qc1V55BAgSOSqso8eCT2omoR31+LfB0EXnp9rkgowRszGv9DCRgaxV
	 8yrL2lbfIM2nTIxmqt0dMC49jT7ySTi1I25PV+QKlvei4MgWPURAe7yGOZTBGNIyD5
	 m/BoydPbp3J+Q==
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-bf1b402fa3cso5220002a12.3
        for <linux-gpio@vger.kernel.org>; Wed, 17 Dec 2025 01:30:21 -0800 (PST)
X-Gm-Message-State: AOJu0Ywr0nHMaEMKZS4nK/JbrBI3chErf/QG6kCGm/HeNP4iIz2zeTm4
	q23mSg8vZ1CBwMasVCf+0Mm6ELESjaMUEi69GG47YLZJOpEDcko8KUBviWMKWgyEJ0vs0hmccxU
	YfAPbHiVo8z7qwNtw9XTez0WUkHVHnknMa5JD5Hy+oQ==
X-Google-Smtp-Source: AGHT+IG9ibMY6NyU0rA9k1l3wkGvhoJ/w1YAwEk5/7zF5I26tkfWWA7rBNAD4MbI+D6MsJICO4FJ5+orGfiiu1KcI5k=
X-Received: by 2002:a05:7023:884:b0:119:e56c:18b1 with SMTP id
 a92af1059eb24-11f34c1baf7mr13000496c88.25.1765963821355; Wed, 17 Dec 2025
 01:30:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251217063229.38175-1-rosenp@gmail.com> <20251217063229.38175-4-rosenp@gmail.com>
In-Reply-To: <20251217063229.38175-4-rosenp@gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 17 Dec 2025 10:30:04 +0100
X-Gmail-Original-Message-ID: <CAMRc=MfnN0sD=yb7NO6ixHC-mhv2Cg5qw_wb8cZGtg23chwmOg@mail.gmail.com>
X-Gm-Features: AQt7F2o-FwAWYmWdUWyLhIfwwoYP2GmeYvx-O3mrXSj6x_4MEKVZU4tI-CQGtiY
Message-ID: <CAMRc=MfnN0sD=yb7NO6ixHC-mhv2Cg5qw_wb8cZGtg23chwmOg@mail.gmail.com>
Subject: Re: [PATCH 3/3] gpio: realtek-otto: use of instead of device handlers
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 17, 2025 at 7:32=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wrot=
e:
>
> This is an OF only driver. No point in using generic device handlers.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/gpio/gpio-realtek-otto.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-realtek-otto.c b/drivers/gpio/gpio-realtek=
-otto.c
> index efcddbe01308..8bad43afc586 100644
> --- a/drivers/gpio/gpio-realtek-otto.c
> +++ b/drivers/gpio/gpio-realtek-otto.c
> @@ -372,10 +372,10 @@ static int realtek_gpio_probe(struct platform_devic=
e *pdev)
>         if (!ctrl)
>                 return -ENOMEM;
>
> -       dev_flags =3D (unsigned int)(kernel_ulong_t)device_get_match_data=
(dev);
> +       dev_flags =3D (unsigned int)(kernel_ulong_t)of_device_get_match_d=
ata(dev);
>
>         ngpios =3D REALTEK_GPIO_MAX;
> -       device_property_read_u32(dev, "ngpios", &ngpios);
> +       of_property_read_u32(dev->of_node, "ngpios", &ngpios);
>
>         if (ngpios > REALTEK_GPIO_MAX) {
>                 dev_err(&pdev->dev, "invalid ngpios (max. %d)\n",
> --
> 2.52.0
>

Yeah, no, there's almost *never* a point in using OF-specific accessors. NA=
K.

Bart

