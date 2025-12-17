Return-Path: <linux-gpio+bounces-29676-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D1FCC6D4A
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Dec 2025 10:38:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B983730842AF
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Dec 2025 09:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A3F2340A43;
	Wed, 17 Dec 2025 09:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HJIkl9D1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F3A340280
	for <linux-gpio@vger.kernel.org>; Wed, 17 Dec 2025 09:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765964083; cv=none; b=HSdnpl+4OtrqjcrG1BVeavTL2e1T0bINUq4VWxzOued2WEoCPx3FbP8fpIikILkltzJq3HekQj7aOpf4Mne1TEyHB1ekkaLJwaTIIdod3efz+t8FkyjmsjOWSmK402znCAh+3VChNZdMntSAKhzS/jPryU1VYuKMXD2LYdHB+r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765964083; c=relaxed/simple;
	bh=V4X3kkuRT23EaFeK382FE0ajd1+3+/ye+GSfHuXOmdY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HJ4OZyY71rHDE/HyPtnxecBH7fPSWVYP/TG7yo4XDC2ZVlnkP80++U0m9h0+bgSdlqdH1GaDT6uyaunngMztvlVZMIkPKZp1LQx11UzJpzhxJ7jmSdTJ4Y7MUgz0WbjWmUX8XwbAuAimWS3WpAlKV7ZYn27Q5a89lDgEiaPkUiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HJIkl9D1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07F02C19422
	for <linux-gpio@vger.kernel.org>; Wed, 17 Dec 2025 09:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765964083;
	bh=V4X3kkuRT23EaFeK382FE0ajd1+3+/ye+GSfHuXOmdY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HJIkl9D1F0Mf9ge5FhDZv6io5Q5EqaQpHob4dwGAy/Ge1ItJuOA5qUtyGP5WNRTVG
	 n20jWmTY42DjjEi5drpVy2TCsEehCe1hV6/36YceUy/K/uSL57JKxJYmcTlsLlK+iX
	 9YP7UkODjaRJuwdNs8Rz6spDwPrWIGRoXPz4sLkN0ENwsXZiv2icMBOmqMfvCmR1uW
	 /Wto4Ry419lgsaWfKLN7/PbM3B1E2VMFSWUQrWbVTQjc9NgYDbz4qOR+gf64ZftZnA
	 RcPAKDFX4RwoA0/DEoay4Sa8vv82Wf68MI6aekzyFClN8jGasKF4hi7cbRcEpEP1F/
	 D7OyV7Yfx9xDw==
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a0834769f0so42047825ad.2
        for <linux-gpio@vger.kernel.org>; Wed, 17 Dec 2025 01:34:43 -0800 (PST)
X-Gm-Message-State: AOJu0YzSMn2cEMpaNTkEveLQZpeMlfS/wBVjCvWi/ZadYl9v5zgktdFS
	VuVKo7YIdhUSJBLkcjP7URoU7YWDRO9tGbLMffep76w4KhpWbQzMaU87c1JBLQNwqpCVVL5/BpE
	643fold/vlApc2Q0fPbGD7XB+dHtMKeErjVRyIGLlBg==
X-Google-Smtp-Source: AGHT+IHsiK2nS4reRNW8RRPbIZAQQNz5ED6XLjk0uUVgg3kjbnrqMmqUikD/leiHJV2On+Nxpi1cpYvCZbbPz3euOxo=
X-Received: by 2002:a05:701a:ca85:b0:11b:9386:8258 with SMTP id
 a92af1059eb24-11f34c262eamr11667350c88.45.1765964082548; Wed, 17 Dec 2025
 01:34:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251217063229.38175-1-rosenp@gmail.com> <20251217063229.38175-2-rosenp@gmail.com>
In-Reply-To: <20251217063229.38175-2-rosenp@gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 17 Dec 2025 10:34:26 +0100
X-Gmail-Original-Message-ID: <CAMRc=MdhXqO_b6DU8v6rkuNwsEVO-zY7UP0sXO=2P3tM+uFzHA@mail.gmail.com>
X-Gm-Features: AQt7F2rh0U0jScn7FscQgWepvMr3Fpqu91SEFADcy6o00po2OwN_fK8r6n9baSw
Message-ID: <CAMRc=MdhXqO_b6DU8v6rkuNwsEVO-zY7UP0sXO=2P3tM+uFzHA@mail.gmail.com>
Subject: Re: [PATCH 1/3] gpio: realtek-otto: use kernel_ulong_t
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 17, 2025 at 7:32=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wrot=
e:
>
> Fixes compilation on 64-bit platforms as pointers needed a larger type.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/gpio/gpio-realtek-otto.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-realtek-otto.c b/drivers/gpio/gpio-realtek=
-otto.c
> index de527f4fc6c2..efcddbe01308 100644
> --- a/drivers/gpio/gpio-realtek-otto.c
> +++ b/drivers/gpio/gpio-realtek-otto.c
> @@ -372,7 +372,7 @@ static int realtek_gpio_probe(struct platform_device =
*pdev)
>         if (!ctrl)
>                 return -ENOMEM;
>
> -       dev_flags =3D (unsigned int) device_get_match_data(dev);
> +       dev_flags =3D (unsigned int)(kernel_ulong_t)device_get_match_data=
(dev);
>
>         ngpios =3D REALTEK_GPIO_MAX;
>         device_property_read_u32(dev, "ngpios", &ngpios);
> --
> 2.52.0
>

Just make dev_flags an unsigned long and cast
device_get_match_data(dev) to uintptr_t.

Bart

