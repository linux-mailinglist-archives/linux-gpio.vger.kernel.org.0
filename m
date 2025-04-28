Return-Path: <linux-gpio+bounces-19405-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD04A9EF8C
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 13:43:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3254F172FC2
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 11:43:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4547F266B43;
	Mon, 28 Apr 2025 11:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="O9XK9Xvm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE65264A95
	for <linux-gpio@vger.kernel.org>; Mon, 28 Apr 2025 11:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745840618; cv=none; b=GRlg84o0iAROs/gsbCNIwqX9JG74qMU9rmKO4I0YFJ0zCY0Xk7bSpDPpX8h9dxEnIPvA67BkPBCO5BXIcJB0Uk+JBEGfJWDttoUqxX1DlfTiSjfGFaMnesyZD4mJcmk+qTqllAmYtRgDkKkOPWajQTzo8vGq0zJjhreKz/U0eQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745840618; c=relaxed/simple;
	bh=N7WIWDwBiFPBHG6RtziOKsfaaUWsA49kMC7wZCjMKe0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fzqts23XpfGMdJDYP3VykugudorRD4zQoasBTVsiZ87C8hQhWBrDtyU2C9B5zLxptpa7hgZGmnz/WSXN7PIUAPSKv5EAU8PGwBGhgirmHyqZhFFYFCqTRIU4UyOVtCmD7JJaVTyqeqsDqwsMQZbcqnIPd0YOQChidZwSrZ19L4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=O9XK9Xvm; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30db1bd3bebso49331621fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 28 Apr 2025 04:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745840613; x=1746445413; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kX/tC8coeF6pt/Nd0vQ2pLOJWZbhUUNTjjg2AdFwINU=;
        b=O9XK9XvmuRofTbQRIwS9OOX/K+Iz2cRiedvAQGwffCwGvuQQJ6aI2EKnMj8IfJvqrf
         g0uztvsm2trOG4QqvbZrM3yWKuQNdcX9fW39rX5uN4DXrCfJb1D4PEAlAIC3650cXccM
         fZcYDqMTpCwDv2LlV5NzIPwbCfE5vrb/UFPfodFsF8B83OP/hskd1Ly72eAHHPhT22x/
         ilgqAyetGgM4Xl9y5L1BzcPCHx1VXHGX32ZK5+MJMW7TG3ohj5amztf3/hxTuCbqgACk
         pqrERuQg+gG0zUoIOwNXizSyjE2IAJLL/KaeciGd7fC/PmHYuTacSr9Uam/CXhVtY3c6
         7kqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745840613; x=1746445413;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kX/tC8coeF6pt/Nd0vQ2pLOJWZbhUUNTjjg2AdFwINU=;
        b=is5zGC6fGUKhXnzwKS562rGtHig0gbg988BXV9Xt36nLhHJBXPIU8kogE703nWq+kr
         Kydavn75GxH/V7jkCd1bXfZ3CoAZOwv8uuAVKfObxokeZQIJrW6s3wkzWSWP9ftcSD61
         HKPhn9ZuJr5N8pN/XK5AwYPHN9WsXUk6mTPY43jYrmUsI3hfyHNPL85KUDmLsfQLAtqV
         qSYUf3sId0RwtM05raG0jgo7dxERt7m0hvTOoQDLE9LmS0pvfsHqsrOERXua+kEgWoCX
         g6dFxQNQkrGZ3cDVhzRjB4bdRFetQ0n1SxbEE+fKaj8kajXyVK8oZpTtGl4veAdt16zK
         UnLg==
X-Forwarded-Encrypted: i=1; AJvYcCXlcJivkNA+HgtLbpUjkYYGmw0pxQc5DTQ5vLe0bc66AL+pBBARiz43/yWoK3MQ4PNHaLj6dnLJmvAI@vger.kernel.org
X-Gm-Message-State: AOJu0YzMYjoQS8nKuKMOUui5PxhLyLcoFCm9FDVOVSb7DxQwWVGTUbLV
	Ls2lEk/FQbZK7T1dT07odtjvOd5zUGhikWn6gVF+pgkMIBJzg/A9fmVJm1VqGaiGO0npeK4NtjD
	zYU9k8zD9SX5YJKpnKLqRrHFnifJJoWnNCMzhrw==
X-Gm-Gg: ASbGnctIcCoBR1Qlu4KMYQe5skUh/e5dcI2bU5sqWOv9Yu+T+TtFlPN9mXyT5THxGVK
	6HpYvVbzCvO2Hhq1/OA+/FsoqGPYweZffkMJJ60+j8uqg9x/nTMcwxNvQaswIhN/aJGjkibxF5P
	tBZxD/fmqnrGsStvQ+Co1N6Wb6pU1EF62GqiHo9Hx3qPZdeSDDzjsUiQ==
X-Google-Smtp-Source: AGHT+IEX8jJV7HnhVW7+fghG4q9+ghyZY/XzjHuCql+UIJeBm8TXPQiK12eFFODxXmy05fbna2r7j5iNKaow+pXqX44=
X-Received: by 2002:a05:651c:158b:b0:30b:ca48:1089 with SMTP id
 38308e7fff4ca-319dba4f9d9mr29996981fa.2.1745840613339; Mon, 28 Apr 2025
 04:43:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250428-max77759-mfd-v7-0-edfe40c16fe8@linaro.org> <20250428-max77759-mfd-v7-5-edfe40c16fe8@linaro.org>
In-Reply-To: <20250428-max77759-mfd-v7-5-edfe40c16fe8@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 28 Apr 2025 13:43:22 +0200
X-Gm-Features: ATxdqUFCxRnO3E7xcEweLG1JpD07L7-5rWx-FRd1gKrBNZ7uwi1zJAM7VnHWVBE
Message-ID: <CAMRc=MdDH7UPkhjBKr6hO-j2J158_u4Mp=++hjh=V0OtoJHX1g@mail.gmail.com>
Subject: Re: [PATCH v7 5/6] gpio: max77759: add Maxim MAX77759 gpio driver
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-hardening@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 1:36=E2=80=AFPM Andr=C3=A9 Draszik <andre.draszik@l=
inaro.org> wrote:
>
> The Maxim MAX77759 is a companion PMIC for USB Type-C applications and
> includes Battery Charger, Fuel Gauge, temperature sensors, USB Type-C
> Port Controller (TCPC), NVMEM, and a GPIO expander.
>
> This driver supports the GPIO functions using the platform device
> registered by the core MFD driver.
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

[snip]

> +
> +       chip->gc.names =3D max77759_gpio_line_names;
> +       chip->gc.ngpio =3D MAX77759_N_GPIOS;
> +       chip->gc.get_direction =3D max77759_gpio_get_direction;
> +       chip->gc.direction_input =3D max77759_gpio_direction_input;
> +       chip->gc.direction_output =3D max77759_gpio_direction_output;
> +       chip->gc.get =3D max77759_gpio_get_value;
> +       chip->gc.set =3D max77759_gpio_set_value;

Please use the set_rv variant now, the old set is deprecated. Until
that's changed, my Ack is revoked.

Bartosz

