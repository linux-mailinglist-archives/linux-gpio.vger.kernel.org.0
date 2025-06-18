Return-Path: <linux-gpio+bounces-21796-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AADADF07E
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 16:58:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 71EBD1BC35A0
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 14:58:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36B4A2F2351;
	Wed, 18 Jun 2025 14:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="qgmnI1M0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4EB2ED87C
	for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 14:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750258506; cv=none; b=JBNHeHr1/SKq/MVB5ri7FZzZ/4w7eDaWIli5t8+kyF0KKxPK0gji+5T7scR7kb21dPJBRudy3adPorA/eb8pyOfqUMWYrAJ7hjuygWeJaWzoUAktSWGAI9aSgR4D7MtKJKcKLEc5ajmWREWcV3kEmnWX0YCJu0eUiqk5GmYLZ1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750258506; c=relaxed/simple;
	bh=fc7O/wmYgMPdJVmmCcg3jlKQZllYAnc1wvEFbsPJ3Lc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WWdhjstmQtPLj4KWzG45Id+nSezQYO2OB9nPmOAgqGBedx58V7JKfkUL2kx1uiqffj5kUkxsx30UCojDJjxyI3tFN3rmg0i4jL5/5D3FUGPxgiXpQTDUeFjgcwHtyFz5f77hnkHfvbQ17AjqMBiSY54WaIu7l9svPkPFT9frwYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=qgmnI1M0; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-553be4d2fbfso4301950e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 07:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750258502; x=1750863302; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x2oAVn9KVGI+HUyEOjfOpwAt2Y7ge0L8Penbs6vSYVw=;
        b=qgmnI1M0Ue171EJRmMj2i5sqgVu/SKMWtls4rg7LAtE/iCf0LkOb3ICp2sdWnwkTZv
         WSqK6mvnMoXPSWSWVj23iL5z7znMGYcMpaWk3oPK3j0kz+BN3lY652zit+ktoCOJjHhg
         KBiB3uTa6amnqpHmBWDQ/4AmHzS3qLsTFUvkMB+JLplN/in+YBvZeoES3AB8jIIIjlP+
         GSpG04oe4hswyFaiQih5r/Mr/7H5H07HUAVjz9ao8W8IDQLzSNQz1ca9tL7NoB68zJdT
         1u5amTddhdEisBH3O0uD9qMORcUAX/6pzIauAL0320okQYpqy7FivWTF9ZPhRKfIuRd0
         H9aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750258502; x=1750863302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x2oAVn9KVGI+HUyEOjfOpwAt2Y7ge0L8Penbs6vSYVw=;
        b=SwoVDO/ai0xAcyBXZspQsJ5plFpod/L9u1BkJpzTUtZxZP+d54zVtQ7EJ4waVGie/b
         eANYEdVp5W3bLmCM5qVpnzlywCpH6Tt/i6n86G7xeli3ocynKwewiy5XgkdNA2qjVYd0
         wsFOaGMN1uJteSlENU2DmhSnfEJfIUYedUFrQfM9S2v7IX4+JFPUb7ec/DzoiqHTh0rm
         0nyRv41qa3nlXbIqER3NDg9j/AZrUrecJ9s3Hu8yGsJB5SJmyY0u6U5sMx541gv+Z92a
         BjXAa3YoPd+D83YjW0U3FEbsMNGSggg9N2Z9hYmFWH5upihmXpyxaXfxLl1+6+4+XyHC
         J0kg==
X-Gm-Message-State: AOJu0Ywh6x48wJg7iS2cNoYoSWmemN0TzFcZfgpMxd+yHd5hTSfXRKq6
	TkFv2SSBwJoeSGM/78WdBHEay2zwmB/VAvLR8mcW/mZ4LAOaad5eM0wsOX8/Yof8OQbXFqBG7IG
	R4RXhYCQ7lAYM597C8mztlwsafke7bxUAyIlCELqepg==
X-Gm-Gg: ASbGnculxhkPPkPkKSGnzLJLHeeNb2j90QVKfWLrAiYlwnmx6wPvuF9njRZtuZ9lBHI
	E6BLlMKAnx8Mp4vmba/5KlZP/GHEeU8E/IhLc/tdUyLMWatHz0SmCUDJBFxrFjy1VnJG6begbXA
	1zdAymolDq1mvSVDYOKK3NU9oGE2mRY72IQljmwX78aZrocsIv75hPQ0u4JMLNDolYNGD2SrCAQ
	Q==
X-Google-Smtp-Source: AGHT+IHw0lEN1jWaoojr+cMDLo2s1BdLMltGZpcQsXnAZhb6e3vJXyws3Cka3U8+avcGc79uliP6ALPWhjwO9Z4A1Rg=
X-Received: by 2002:a05:6512:12ca:b0:553:2ed2:15b4 with SMTP id
 2adb3069b0e04-553b6f4d916mr5107616e87.57.1750258501912; Wed, 18 Jun 2025
 07:55:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610-gpio-sysfs-chip-export-v1-0-a8c7aa4478b1@linaro.org>
In-Reply-To: <20250610-gpio-sysfs-chip-export-v1-0-a8c7aa4478b1@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 18 Jun 2025 16:54:49 +0200
X-Gm-Features: AX0GCFuiP37UW_0Skps8Xa1OXikExkFFjhwNu3XM4YwdMJdVjFa_PBxRRYzWXQU
Message-ID: <CAMRc=MdRA40RHus9xPpXyq_baVaPObozqX9w8-syXaHjr_9K6w@mail.gmail.com>
Subject: Re: [PATCH RFC/RFT 00/15] gpio: sysfs: add a per-chip export/unexport
 attribute pair
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, Kent Gibson <warthog618@gmail.com>, 
	=?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, Marek Vasut <marex@denx.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 4:38=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> Following our discussion[1], here's a proposal for extending the sysfs
> interface with attributes not referring to GPIO lines by their global
> numbers in a backward compatible way.
>
> Long story short: there is now a new class device for each GPIO chip.
> It's called chipX where X is the ID of the device as per the driver
> model and it lives next to the old gpiochipABC where ABC is the GPIO
> base. Each new chip class device has a pair of export/unexport
> attributes which work similarly to the global ones under /sys/class/gpio
> but take hardware offsets within the chip as input, instead of the
> global numbers. Finally, each exported line appears at the same time as
> the global /sys/class/gpio/gpioABC as well as per-chip
> /sys/class/gpio/chipX/gpioY sysfs group.
>
> First, there are some documentation updates, followed by a set of
> updates to the sysfs code that's useful even without the new
> functionality. Then the actual implementation of a parallel GPIO chip
> entry not containing the base GPIO number in the name and the
> corresponding sysfs attribute group for each exported line that lives
> under the new chip class device. Finally: also allow to compile out the
> legacy parts leaving only the new elements of the sysfs ABI.
>
> This series passes the compatibility tests I wrote while working on the
> user-space compatibility layer for sysfs[2].
>
> [1] https://lore.kernel.org/all/CAMRc=3DMcUCeZcU6co1aN54rTudo+JfPjjForu4i=
KQ5npwXk6GXA@mail.gmail.com/
> [2] https://github.com/brgl/gpio-sysfs-compat-tests
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Bartosz Golaszewski (15):
>       Documentation: gpio: undocument removed behavior
>       Documentation: gpio: document the active_low field in the sysfs ABI
>       gpio: sysfs: call mutex_destroy() in gpiod_unexport()
>       gpio: sysfs: refactor the coding style
>       gpio: sysfs: remove unneeded headers
>       gpio: sysfs: remove the mockdev pointer from struct gpio_device


If there are no objections, I'd like to queue patches 1-6 for v6.17
already in the coming days. They are largely preparatory, have been
reviewed by Linus and don't introduce any changes to the sysfs
interface.

Bart

>       gpio: sysfs: add a parallel class device for each GPIO chip using d=
evice IDs
>       gpio: sysfs: only get the dirent reference for the value attr once
>       gpio: sysfs: pass gpiod_data directly to internal GPIO sysfs functi=
ons
>       gpio: sysfs: don't use driver data in sysfs callbacks for line attr=
ibutes
>       gpio: sysfs: rename the data variable in gpiod_(un)export()
>       gpio: sysfs: don't look up exported lines as class devices
>       gpio: sysfs: export the GPIO directory locally in the gpiochip<id> =
directory
>       gpio: sysfs: allow disabling the legacy parts of the GPIO sysfs int=
erface
>       gpio: TODO: remove the task for the sysfs rework
>
>  Documentation/ABI/obsolete/sysfs-gpio |  12 +-
>  drivers/gpio/Kconfig                  |   8 +
>  drivers/gpio/TODO                     |  13 -
>  drivers/gpio/gpiolib-sysfs.c          | 650 ++++++++++++++++++++++++----=
------
>  drivers/gpio/gpiolib.h                |   3 -
>  5 files changed, 474 insertions(+), 212 deletions(-)
> ---
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> change-id: 20250402-gpio-sysfs-chip-export-84ac424b61c5
>
> Best regards,
> --
> Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>

