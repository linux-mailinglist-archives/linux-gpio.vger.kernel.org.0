Return-Path: <linux-gpio+bounces-24548-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D71B2C2D7
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 14:14:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D1CD6866DF
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 12:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18A4C33470D;
	Tue, 19 Aug 2025 12:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mHCNJYK9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E5C3375A7
	for <linux-gpio@vger.kernel.org>; Tue, 19 Aug 2025 12:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755605586; cv=none; b=aboZMNzJiNAmpZ6tDZDDSaudnJs3Sl4r7aEFNBlzmBCJYmdHmWAeGTKE+/bGXDYlh97yPi5BugMGREZhxkKe4Bn7gS3B8LpvZwM32ZRz9MqVl8Mk34oijYaIjOM8vIol4ZqWGVddHwPTV2BC9cYPezTn91oFri47Kut+gJZoH/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755605586; c=relaxed/simple;
	bh=pT7J7NlbzDj0BcguaBhEfkoD9p8GgWTOtMzLwvbVkTg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ioyRyhRJXCsN+3xYhWIH9LXcS3wTLcNSw7Wlnvu+izXi9nhJuWPMQtKoDXQsrC55OPuRa1cLBmbrIB1EkDDTCwXtDWvj113tz4SwTAReVH3GB7J1/k654PTNKhyjGtdH89DPhe2WJLco4tddUUhY4GG6M4Kfw0Bnod/14214OnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mHCNJYK9; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3352212fefdso13090211fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 19 Aug 2025 05:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755605583; x=1756210383; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pT7J7NlbzDj0BcguaBhEfkoD9p8GgWTOtMzLwvbVkTg=;
        b=mHCNJYK9mo3J7JRL7LLBKUB3sm+8n3Q3l8jiZz0sUCZjmNqgbzNaoPsvT95gz2usZG
         JIfDa9o6DJFez5SH8sGgAmLxZrczNj5p3AVY8CoYQ7Nkgv7wns6D0Im2lRp4SyrJoEqr
         /4MxH2lYVm+c7fBP+30ozGd8P+tsXRBG9sp3W99zB34rxxsZFdgVFQtgMmz6t4r9Gd55
         UjhuykSbX356y2He2eLaZR5aaY5CiChZn3IC09yPMo4DRli8aZ1HFyQGOycCk1Rpshd2
         GEZsSdsLtvYYEgKoserNhWOwVTjmiuQ7ej0l3Wak0CoXCZIH0irMRX3iHLppmvpcvvLh
         f78A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755605583; x=1756210383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pT7J7NlbzDj0BcguaBhEfkoD9p8GgWTOtMzLwvbVkTg=;
        b=q1qzFofcxzOczB+9kDn85me+/w9PgjM6FGwqQ/LwoK4UVgSYcd6hx2/OqN/BkRZRBf
         PX2aNllLrFG3dl5R2i4dMHoIeUd1IwFqR8QdaJo2ymYbUWMZJJJp8BvtA4zQmx7rJ82P
         vnHs48TOAc0GxTGJ+g/0/hvJIt0RQrjETXVaTMYuVswsSxT0P/Y2AvFxmLZBCklub/XF
         JgyOsPEhRb8EnZe0hq67ohGYybFHM3Y+t2NX4eieuxzVLHnE76rVQd+AIMvWyMGWMp/X
         O3/7qcWToucnzvT4HGgtzGAq+ul4/jxALYRQaVBCLZs7e5LxTJVISLP19F3glmedbteQ
         l7EQ==
X-Forwarded-Encrypted: i=1; AJvYcCXL0CbB3R0+9wFXcCJA+XeKQLmZAjw7Ud5+xKjmg0rbtMQ6/PJ5j9uyEt665fCkE1w64dClWzDff0dr@vger.kernel.org
X-Gm-Message-State: AOJu0YxAxjFlAzpq3ftFDoXoxmVEXZ7GUmmfppbhziNWZlwiP5nypUWx
	ZlOU10o9i9coZB7EGqIeWtbIvaVc1q0TgWDLMnDwV4QfHFZzJeIQMHNNM6uTVwn6hCMvYDyAEPS
	cDfw3aMWK99hPJm5nNwgO0hZxZtn0rFgv++b/n8ssDQ==
X-Gm-Gg: ASbGncs+uNK7fS6CJqENZJwvsUcVbYMtWmHByjUL8TE7Cz5VbxxAGu1vwwN9CfDulHF
	lA0TzUPWM6GMA4HKOZQ3lbmI5zIgMUhCK0eI90ma7Vjgi04Hla8tsvdW8uyTzcBEqDM0JTrQ6RY
	huklCfZDfbdcdWn3DQC8bCprCqTIiKL8PRGOJUQgmmcrUd3QynmkL1XkpTA3QRIWQogU0QkHx0h
	4j/MqU=
X-Google-Smtp-Source: AGHT+IH+aPrIJY+DH1gxYk549l1vaPXfQI5WHK+rOHEK+EYvi2ju0qkAP63ibB4HjpirzJmCyfMVeLvlEsTbS+CROto=
X-Received: by 2002:a05:651c:3041:b0:32b:a961:803a with SMTP id
 38308e7fff4ca-335304ce141mr6002291fa.3.1755605583129; Tue, 19 Aug 2025
 05:13:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250814-ltc4283-support-v1-0-88b2cef773f2@analog.com> <20250814-ltc4283-support-v1-6-88b2cef773f2@analog.com>
In-Reply-To: <20250814-ltc4283-support-v1-6-88b2cef773f2@analog.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Aug 2025 14:12:51 +0200
X-Gm-Features: Ac12FXx9DbzpmXtIaYcl4GeGqmQxe243v3rohATjse3LJ-Oaq4DA-z_79QbXSd0
Message-ID: <CACRpkdax9THwKRZmaAHVcKbnBdi1LxjgvibAFOUVnVQJBhBiwA@mail.gmail.com>
Subject: Re: [PATCH 6/6] gpio: gpio-ltc4283: Add support for the LTC4283 Swap Controller
To: nuno.sa@analog.com
Cc: linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nuno,

thanks for your patch!

On Thu, Aug 14, 2025 at 12:52=E2=80=AFPM Nuno S=C3=A1 via B4 Relay
<devnull+nuno.sa.analog.com@kernel.org> wrote:

> From: Nuno S=C3=A1 <nuno.sa@analog.com>
>
> The LTC4283 device has up to 8 pins that can be configured as GPIOs.
>
> Note that PGIO pins are not set as GPIOs by default so if they are
> configured to be used as GPIOs we need to make sure to initialize them
> to a sane default. They are set as inputs by default.
>
> Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>
(...)

Can you check if you can use gpio-regmap.c helper?

select GPIO_REGMAP

git grep devm_gpio_regmap_register
for example drivers using this.

I think it can further cut down the code to very little.

Yours,
Linus Walleij

