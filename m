Return-Path: <linux-gpio+bounces-28791-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 062A0C6FB93
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 16:43:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9246A365421
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 15:36:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A965E334695;
	Wed, 19 Nov 2025 15:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="gNKoq11G"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADDC2E62C6
	for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 15:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763566522; cv=none; b=c4Qtm6I8D6D16hStAaFf/VsMMkoTvdUXIk+JKTgHZ7MpW2jOvJAEquFN0Tg6sVkCnPNJ2br2fUgmFcXauwKbbwjVQL9m/vr94kIFV87GSIW4+dkxa4OgjlXE5eo0uEdLe1IYN91jam/8os5bY/vT/1Ss0ga17kaaCAcS3you5l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763566522; c=relaxed/simple;
	bh=dZ9L98f2PuYQsCa84kCuzAxcE1+OBoNNzwX1TSryc+g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F+gVV77s76tlESV2GGCVEOArlfKXYtxf7LHXzsgiGAWz4pukuf+9GVUX2i6l2MNNaT0y+1rhiW3HaGbDHQg4K0IdQ92cGVMVsY0sboNpPa0rjEscngok8l30Ahxz1LVTy9sUHrjt4cShXplQYEMX4RHlhaInjf811Vh6edMtu6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=gNKoq11G; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-595819064cdso1601840e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 07:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763566519; x=1764171319; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7IydEXySMWUHqmFerMe7mRnMNYes9BgDXaMYqlH2tSM=;
        b=gNKoq11GIW7C3w8//xLuuQl6qXM1T1Jtyd3NiuT9E9LpOJmH0KbxmsRUUrx1rHaQvu
         7A8M0zAAtAI3UAjptYgLOB2U81pghCuL5Jb71N6G55QFeJLs/fULFneeN9razQq3IZxa
         ZukMyXIwwcoUASLmpPEWqc8G1YeH3+qKdkaPLiAm46r0JYu61qfaJA8bqVd520eSzQeE
         sCy31ceowsinu2lYk4nR8Q1PDgAgSXzNi2/yMXWiLHQhUGWSddlmZK4ngFkZ3Wxhp00r
         XxhGVP39F2rgRSB5MBJehwJ1PrJ7fv97xLiZMkqZrcodacExHrB9yOB9vmrdeI1j0RCb
         M97A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763566519; x=1764171319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7IydEXySMWUHqmFerMe7mRnMNYes9BgDXaMYqlH2tSM=;
        b=kupsUG0S+nZE46Jq1//LxcxZYn9nKUXglxkOTc6QrBM6qQ5hdug/frbgzp+iTiVJo0
         VLJCzl/B+k08sLtqp6gfaXRWT5RbHpqLRv8czCTk+4OqSDBS7D24SXjqN1CMvQpVvisN
         MQa2kj4su7wmPNdkUn6QRNXWnC83VqJXPjkSqdHlzkxIVomaXUl1nTBu0i7tgrQMZbC4
         12Lh2YOtaxbMZd/V5pSDWo4Tjvycme6SwTvxy3J+2ANesZVqenXnq6VjFt5o7hQ+TBb3
         90fu3TMxSlzmUDHgTA8X3G2sb7NspCgiuES++EI3/3ZpIpzvVzWfW+ezXB/AehYxsR9I
         iMmg==
X-Gm-Message-State: AOJu0YxFOQZZuBcdkuKAV5ncrCcGXaFhMVwalnXJUyljfBhgROnLssc8
	/v/zyzsPR1wDfmJlDIKc3Jd4tJPgIQ/pkTsnvh3N90rX54BIEWclaPJtKiV2gxPJS+Vu4wdvyjP
	gddfzGUB/+lJixF+sLtR+IUV2FpwqiRbPBqXjks5NHw==
X-Gm-Gg: ASbGncueUH798zZhHhuDtwVgvGunTdve/zeNkPcpmLcY0Xh5zXyp1uFbKaOyJ3M590Z
	pPcvRtRNflZy/WlwvNpL5bdpe3lgZRw/Mb79pfE5Ubl0YcYbPXxOtdKgQC+NTwWQExMnPi0gZcH
	mzmEoHUbM3aBoX4lO14AawVuuLP0YWOplmvTDzb4Lo3x07SLz7xKpa8uccbPTGqBtlxUNqBC+AY
	xwj1BHw0DsS+MW4poURdB8ox6qbxTSvBu6yZzGN+36vJjpBqnRsM4Y59DN65L6BbHbYRlwgS58U
	gzho561yP3iCVQ2VtHOY/c4AzGM=
X-Google-Smtp-Source: AGHT+IHK0Mb5IbsIXovH9AZ+vaAiOLG0JdoUbQew/7QWVATijkMIFFzHu/wta9ZYFWpKqsmevcWXR2EwsiN7NKLZrVw=
X-Received: by 2002:a05:6512:3b81:b0:594:2f72:2f89 with SMTP id
 2adb3069b0e04-5964b392a2dmr991382e87.9.1763566518707; Wed, 19 Nov 2025
 07:35:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251119-cs42l43-gpio-lookup-v1-0-029b1d9e1843@linaro.org> <20251119-cs42l43-gpio-lookup-v1-2-029b1d9e1843@linaro.org>
In-Reply-To: <20251119-cs42l43-gpio-lookup-v1-2-029b1d9e1843@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 19 Nov 2025 16:35:07 +0100
X-Gm-Features: AWmQ_blpRQ133EE0oYpbJ5_4MjMnF3kIkZ7Ed8doweIC99ATG8RMZUhgAozZ4C0
Message-ID: <CAMRc=Md4jHrHxHUOM=eFuWRSaEO9jFEoHGTjEEJLj9w6E53gOA@mail.gmail.com>
Subject: Re: [PATCH RFT/RFC 2/2] mfd: cs42l43: use GPIO machine lookup for cs-gpios
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Maciej Strozek <mstrozek@opensource.cirrus.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Andy Shevchenko <andy@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-spi@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2025 at 4:21=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Currently the SPI driver sets up a software node referencing the GPIO
> controller exposing the chip-select GPIO but this node never gets
> attached to the actual GPIO provider. The lookup uses the weird way GPIO
> core performs the software node lookup by the swnode's name. We want to
> switch to a true firmware node lookup in GPIO core but without the true
> link, this driver will break.
>
> We can't use software nodes as only one software node per device is
> allowed and the ACPI node the MFD device uses has a secondary node
> already attached.
>
> Let's switch to GPIO machine lookup instead.
>
> Fixes: 439fbc97502a ("spi: cs42l43: Add bridged cs35l56 amplifiers")
> Reported-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Closes: https://lore.kernel.org/all/aRyf7qDdHKABppP8@opensource.cirrus.co=
m/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>
> +static struct gpiod_lookup_table cs42l43_gpio_lookup =3D {
> +       .dev_id =3D "cs42l43-spi",
> +       .table =3D {
> +               GPIO_LOOKUP("cs42l43-pinctrl", 0, "cs", GPIO_ACTIVE_LOW),
> +               GPIO_LOOKUP(INIT_ERR_PTR(-ENOENT), 0, "cs", 0),

I sent the wrong version, sorry. This should have been:

GPIO_LOOKUP_IDX("cs42l43-pinctrl", 0, "cs", 0, GPIO_ACTIVE_LOW),
GPIO_LOOKUP_IDX(INIT_ERR_PTR(-ENOENT), 0, "cs", 1, 0),

Charles: Can you fix it up yourself before testing?

Bart

