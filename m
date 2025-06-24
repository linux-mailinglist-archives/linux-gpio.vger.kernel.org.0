Return-Path: <linux-gpio+bounces-22102-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDFAAE7030
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 21:52:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C1ADB7B4547
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 19:50:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E7082E6D0F;
	Tue, 24 Jun 2025 19:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bx4nC00S"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F95C2512DD
	for <linux-gpio@vger.kernel.org>; Tue, 24 Jun 2025 19:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750794703; cv=none; b=EQmbM+WPiN/XqeZse9b9M0TgBeX8Hnxco7t1/G8Hd5hK6jNmdIZeEODrlEHxTA35U6YKEzx86O24NqoE0DwAG6YuOWRSAiqEAFxDceledCTWmkGa1Jyh6VnXgRtpMDu32rncyZQUobMtkMnkdjeamXhYmHiJ326tvEZFNuLAzrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750794703; c=relaxed/simple;
	bh=B/ULaHUETU6DovdIQRhQ/RyujC0Dkl9fSx3NjtmEe7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HEL4qEkxrKwVl4rjf3Njjp8lx3nlZVK2ARTH9168o9bADF78kq/qaGA78fG8p+pcjCL7ldTp9iw+9LLLHQZFOunjRuOPDY7LBlKakVt40oHEBerakbgqW3FR8RBRO/w318hmDTEY/a463iXJeVdKjj5j6XBaNcAJbNry51V7Ir0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bx4nC00S; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-55220699ba8so6233916e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 24 Jun 2025 12:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750794699; x=1751399499; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B/ULaHUETU6DovdIQRhQ/RyujC0Dkl9fSx3NjtmEe7Q=;
        b=bx4nC00S1X0r3LL2R/hiqiaf8/D6l8Q6+/3VxcLz6FsOkAcJu15PLb3a11a5Ea3Pum
         ILW8cMasruwTlIVvM8njMKJA9urHb5nK3ePOPakW19RW/ieOjdzAJ57Z7ul4OPDxKFFx
         soZK1wyh7s2ydB2jZS0f66zZ2qhb70eQDaj3v/iVqxpA5T5XnLZqgtXjJ9cJYJC+CoDR
         qEnkJAIG41ScY4k8Bk1eWej5sRj5cKZJltwtuxvyFU44zGBbABPhGOCLbBi4bgZymI7H
         ztnf4+U0rK/C+O6sAqhPW2QMGm+2Mt0ZhpuCUa9WePXAd4hqJzPl4qgnnqsTJ2M4AxKL
         23Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750794699; x=1751399499;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B/ULaHUETU6DovdIQRhQ/RyujC0Dkl9fSx3NjtmEe7Q=;
        b=ldFTI54GNLg2a85SFPxB+7uzS/bjM0xLNMsaVrEGXzcDDWzHJkZ7ghkFOh2mfH/ULJ
         2UwVGiY8aTWfVAkBi6xJwPLn0WISNdPnOwyL4ZNcAKNyW6e6qUWZchl5Ar4ICzXEjL6I
         hdjakVtaN9xGWXautaEsIlCVUYS1mBso4gsWijGG0T0fGOmtMDPar8P8kexNj+5czXX7
         Do6HmOI626eddOrpwCE+2J8UKTtxJvTEyIm2BVuSWozhVAm0nMBa08ttJKwISXHbrgf+
         2TGhxL1HP0teOTNPweZfbuUarp2c1/zK6ZwjAdsH7HILCv1nMKWhzL2qCUdIDvQ4aFtV
         09iQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlPprFE+W7CYVUEGxebOcTPVZFLlEYuNBm2ZBNurpKw/fR1TDSlsBnAJveGHMJEm9JnNACpwwHdfmE@vger.kernel.org
X-Gm-Message-State: AOJu0YwP/JfZJv7uqvItcVFFHzTZveTHZpS+5NIbxBf0uy6/PxqtaCyW
	dyrxEK5221QgyjhKYpiWLukqg08l71CyR6TzeWFLGxlzEv9hzWRLUIeJwQU5BzAjKidi+vo3nmE
	zRCHHD1brP8VS7lF20ZPGFNjBk7RU2Nvu3lCiB0zLWQ==
X-Gm-Gg: ASbGncs7Pg5U/rWzIXlTYwfm6HpP7bkWGxTBWrAGyopbV1KDnxZelQjBv2lDxtmYiTD
	H4czqz9jrkLPsAuTZI5ZvmgNpAjRhWQmtmkqsisQ3aqk/mJPQhzTgl/6qxqBCgAzHIi2zTIflAo
	kwBPZWcBSwtLcEV+OLN/KMexs2lfv+iRcDKZF9ZYQclSI=
X-Google-Smtp-Source: AGHT+IE7ZhidhDycmbWSPBv1SXukyv4UOsTnptIV0NVFDdvfjdJisylDEZywOQMLRXTZuVgtEJHSpJFFFA3MmjtlJ4s=
X-Received: by 2002:a05:6512:3b9d:b0:553:358e:72a8 with SMTP id
 2adb3069b0e04-554fdd5d263mr47305e87.38.1750794699262; Tue, 24 Jun 2025
 12:51:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624-gpio-mmio-rework-v1-0-aea12209d258@linaro.org>
In-Reply-To: <20250624-gpio-mmio-rework-v1-0-aea12209d258@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:51:27 +0200
X-Gm-Features: AX0GCFuix9QqcfdydgWIF-t3O-vbnn63nX5F5wQyNw4KZuxuAr9t5L-dWlGRbto
Message-ID: <CACRpkdYdZQ4rKXPbiUve4n-p6q+HG4QS_oFkY1JDkJeqP4mZwg@mail.gmail.com>
Subject: Re: [PATCH 0/8] gpio: move generic GPIO chip fields out of the
 top-level gpio_chip struct
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 3:27=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> The conversion of GPIO drivers to using the new line value setters is
> moving nicely along and we're on track to have all the existing
> providers converted upstream after the next merge window. There's
> another piece of technical debt that bothers me - the fact that struct
> gpio_chip contains a bunch of fields that are only relevant to the
> generic GPIO chip implementation from gpio-mmio.c.
>
> Let's work towards moving them out of struct gpio_chip and into their
> own struct gpio_generic_chip. Doing this in a single series would
> require some ~40 commits which is way too many to review at a time.
> There are also users of gpio-mmio under drivers/pinctrl/ and
> drivers/mfd/ which would require cross-subsystem merges. I think it's
> better to do this in stages over 3 release cycles. This series adds a
> new API for gpio-mmio users, hiding the implementation details and
> converts the first set of GPIO drivers. Once upstream, we'll convert all
> remaining users and once that's done, we'll move all the
> gpio-mmio-specific fields to the new structure, convert the internals to
> using them and remove bgpio_init(). The last step will be done in a
> backward-compatible way, not affecting the users.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

I'm in. And I know you will push through with it as well.
Patch 1/8 looks like a dream, approved.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

