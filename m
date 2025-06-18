Return-Path: <linux-gpio+bounces-21774-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FC2ADEDAF
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 15:21:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 96A28189ADD4
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 13:21:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FE2E2E92AA;
	Wed, 18 Jun 2025 13:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="zbatMD3p"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594F22E92A9
	for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 13:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750252830; cv=none; b=srp4qtQ7Iexnv7s8xOlBsx1NORmvMFlJAzABHIy+XsUxvXzMdaWVAy4+03ayeCGqaTkkIas61Szy3xeBtMLzF0LO5MWxlYDNGgjNszMsYRnDWx+OGj8bpWOZEnHiOAg+N8gJnIW5InyZjBOidQEUS02O2Jb0nryw3QRiEjfKLXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750252830; c=relaxed/simple;
	bh=pTJodfwDi8QPGf5WUlAYBwDMYVFJGpwnkqkpDJ/bZ6s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mQ3aqDwyul2v546uar3Pl4xSWFUP9Kr0/qCjJ57w8dZ3r8Kt48rnmjOWMZ49iEvOYhYcfZ+k+aD9q9AYLQqmYItD/ZEns7eksqp7DFSiGFJ52TcTv89ItNg/9/cHm+xsJuFU6Mf66m6Qa3Fv9jIj12WjoBCO0SlcHfioZY8w54Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=zbatMD3p; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-553b60de463so5347801e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 06:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750252827; x=1750857627; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pTJodfwDi8QPGf5WUlAYBwDMYVFJGpwnkqkpDJ/bZ6s=;
        b=zbatMD3pr29TlJKA3nraDWfRJpQ8Z7Ny39U4JWTjtJGPY1sP5RgC7Zvs+2rQatiKm3
         IoL/Wq4ymBIEOyAPJc877iNO93bP5m9R7l6G+XznYx1ikrocQAKeqlLWbRC8jKh9For1
         /229qQ8oaJWtqLWTiiLgYUrq7qMjf+yUBY5I2dWBeV+HQt4O6flaaFbrrsQSTebzJljY
         asmsPFcgjJNDcKK0oN1HRkJWiudgqxVhQnIU7GF8RO7Aew0/4yR8ZRRAQLW4Hk+hbz9+
         X6523v1ub+wGAwMiu3+eb3eqsIyOD32CwR+ntnRdriFdR5SCAlFxG7N1DpqpzQVGOf9I
         rS/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750252827; x=1750857627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pTJodfwDi8QPGf5WUlAYBwDMYVFJGpwnkqkpDJ/bZ6s=;
        b=jjhIUs+6vrC5qOsnq9KMBgU5stWjt/trLO3La0KZF7c+PEEd9j8Lg9368vSopfoSmy
         tvSjdFIDi3XOKptXNJb7LqkVc5bp5pLO0iQvO3H6S4AeyCw8vHgriQ1CIIL4yysqDr+3
         9MxaPlyZF3aKWtLwExeEVDdW+P5YP1MdofjWwJ7IC87CR1M39imasmSytzqoFzs2N9jx
         nY2wxt2fgwe9eksI8NYspv7afRNPT9k/oqa3EQnHTCNhalOzjIuRosIAUHf+4JWBQrpJ
         HRz30BGuortcyl4SU48dr4reQYq2zOHttvaaFkXIM8O/hhDJP8zU1tBRZCKqjBLXo2pn
         ksww==
X-Gm-Message-State: AOJu0Yzd+pwgR/1t6hwmwk1aoKR6gmsKtDxeqgdtL2XuN7ec7nktyaEY
	mUZxfuBwdQdRxUb35HlqAEFv812Sr2uQjP+CCIsnjyvMlkaZVARwvRoxVqI+eurvJrWEBj7xEba
	qa5f0biYtLmhnifTpTPj3vXQyrTaToagUY2XZduF2WQ==
X-Gm-Gg: ASbGnctmSod7T+08WPPuTQoLGcQ/GzfzwgaECdE+9Wxq9PihX6cpLY3O5KQr1qOIVcV
	O1O6orqIbtCg4mhxPybj9pLmAAvYNq9OWXa6a9LsQ7Rdr9BuMlZcuLnuvzBN6Io7LhIRDXAXaOl
	HZaOu3q8NkasVrAl0jibMlf82ZPvn2tg2LSmkabRB99WNqlEsRKkgDYOh+noG6jR4ZUS4s09Z+v
	g==
X-Google-Smtp-Source: AGHT+IEnYD8c9DRu+sgeZ4/zra50A8zvr1u0tIjWrrYY7aXbyZM2E14drwd7rS61sdCTAqyts6sNZw5w8k+gQFEYycQ=
X-Received: by 2002:a05:6512:b2a:b0:553:5e35:b250 with SMTP id
 2adb3069b0e04-553b6f2106cmr5254173e87.32.1750252827241; Wed, 18 Jun 2025
 06:20:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250618124319.19220-1-kabel@kernel.org>
In-Reply-To: <20250618124319.19220-1-kabel@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 18 Jun 2025 15:20:15 +0200
X-Gm-Features: AX0GCFvPKxznhkvAPEwnvWIVZ6FbwqZ_QWUKHDjPShs0JKLfijHXyi7OUR-B7c8
Message-ID: <CAMRc=MfdPc0T_6G7uRUW7BAjFaBQYFFs=u2NGKj29eJGSjRVCw@mail.gmail.com>
Subject: Re: [PATCH] platform: cznic: turris-omnia-mcu: Use new GPIO line
 value setter callbacks
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Andy Shevchenko <andy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 2:43=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.org>=
 wrote:
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Marek Beh=C3=BAn <kabel@kernel.org>
> ---

What's going on with this patch? I sent it a few days ago, now you
just resent it without changes. Who should pick it up?

Bart

