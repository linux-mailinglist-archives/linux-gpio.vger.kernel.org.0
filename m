Return-Path: <linux-gpio+bounces-21994-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6DCAE379E
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 09:59:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 904513AFF91
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 07:59:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4ABB20408A;
	Mon, 23 Jun 2025 07:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="WS4BNiJG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB81E1A00E7
	for <linux-gpio@vger.kernel.org>; Mon, 23 Jun 2025 07:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750665562; cv=none; b=uLu6h7mu8fdt3Uf3keNnm/kA4gvTntmaa/YZ4r9IZZKhJhPK1nQMEzC3yWqzFcDFwI7MibmqN276MedgVtHewTzy06Q1hteSj12xL1Y1qgR93Cugad7QMCNoa2BTW/cNTj2QKk1JG2NMl8ZbHKflQQo/Z7G3ZJbKxVMj7GGPu2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750665562; c=relaxed/simple;
	bh=pjCYEu+T8+MSu+Y4AtQlwN2m/aFPkSagdtGGVLNEyiM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=apmrKvom8xYMtzkEwceJqS6hHeide22Xsgpue3wqxGJ+nQ9i/V3W6b/VVMFb9/Oorv8kzzk0DfuxPMYEy5GvLas42EhT3r5nHiUmQTohIkJkxvDktlj1UMnzho30HTsiFr+C9xnMAeQz0p0AG3qq/F+FLn4pfRb5osjoal/Hpy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=WS4BNiJG; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-553b165c80cso3660285e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 23 Jun 2025 00:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750665558; x=1751270358; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=smoBqfSuZnFdhyBkSJPUgnQLJaDXAPEi9w2rGP6B9Xk=;
        b=WS4BNiJGbaMckDcZ+88ElGm2nnREtxUBndMHfSjZxhoGecjKP44OJZQPiOsw+8ob4m
         p96j5AIGl83hj6q2u3Z6du1ilBLJy1QAw20X0je3mRaOyWXDTRQtgwtazU8LLSdMdS2+
         pn4kIaFhxXroseFGRuGhYVdfbLTNRsxz2umEmc113Ebmydn0IOCJ3E575EA7jK1lIDdJ
         /1hLkykLQu5AmFqlqyybG3ZGCzA5ff7/+Zq7vzdtTf3dp6vY1f5csXjBqGndv1gyDUlO
         YZ7ZCMZNMiUyBMEgmrRASrduhnM1JaHXLkwzYJ54gBEZvl/PDx19/p6u7y6CwggKUWbg
         p7uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750665558; x=1751270358;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=smoBqfSuZnFdhyBkSJPUgnQLJaDXAPEi9w2rGP6B9Xk=;
        b=h0PUvUT0uyo6q6vewyIEzkuTsDUvtCfmEgUcYSXPVflO+qicRur2oKHRpSuIiesv1v
         8duoxTymrQ8Z+kv4cCtmFY1DSfNUOcYibD1sGNUZHNnbumW3BvFPDyfU8qs+POoqXFYU
         ZArcFQxmTtyBqjnilMHIXEHpW1j7tWuVb6MQU1kcDmJQzSg601MVarmlfvzwuvQLXRU6
         Goa2/IDmYVtg6rp/qBYzjW25JtW7PzIWm9g7Iq30oaqbJA0ZILIwertI7isLdarYqkH4
         E7oTP4g2YjLx6yImkGZxOz7GHKBmiwyYfMbcK3/WRPm7yu8XR34HVW8v1dH66UVyjXFR
         PuxA==
X-Forwarded-Encrypted: i=1; AJvYcCXZi2PBPMqwx+DiK82dfRSBxKx323/9PueQ2xaZh9we4Cd0R/yfep6qPpgZSGhs9H0b+R9Xi2ubtIz0@vger.kernel.org
X-Gm-Message-State: AOJu0YzIVy0luIoajjb7RGUy2BGb4CGsj1CWLKjWXv26e4KbsT0HXRqu
	HpY6OIJTu6t16ACZRKi9M/7NIMMlxBzU1EzQ1SwHe6ZHEIufI8SU+qIeFN4MxU26IgobiJ3aToG
	PbAH4LHe7r8bY70J7uv3ThxsBjBQE4SPZszOEoVskJg==
X-Gm-Gg: ASbGncv1Mc7nBBqmZi5Ct7g22L7LB5s/2gf87zHV//dSqh69zMXfjvXozfyQTcdj973
	j+na2CAW/+ut/nDObZL6wsJMX5AsaBZH4vPlZJKyRqYVyCQQbSdu5GrmNMHH7GD+vZQaNg/XIgq
	m7EJQndkikQwFjVMBysGIY/VC0+dK0OXibawGPe8yDScMegiKqpvWZTUx2dJPO/jhaERJFPzaZQ
	g==
X-Google-Smtp-Source: AGHT+IH+6LTwSV3jwUqV3aPvfnzYjXE5iOgYqlBgzZnEHwJGAvMDmVnjyWJSTqk2dHdZCzhIYeV1I8Q3DyqdMFZFHSI=
X-Received: by 2002:a05:6512:1056:b0:553:b052:aa8a with SMTP id
 2adb3069b0e04-553e3d259afmr3639343e87.55.1750665557990; Mon, 23 Jun 2025
 00:59:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-input-v1-0-5875240b48d8@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-input-v1-0-5875240b48d8@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 23 Jun 2025 09:59:07 +0200
X-Gm-Features: AX0GCFvWIu5ZKsG_6ucxVHVp5MEFaQgRXOfRuK6Ma_rPpGs558LExeSTdVQ0gY0
Message-ID: <CAMRc=MdAKpmVNQe=5yrGkVdmbfZ-Bsh_0p3-mrifEF2x1SVBhw@mail.gmail.com>
Subject: Re: [PATCH RESEND 0/3] Input: convert GPIO chips to using new value setters
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Michael Hennerich <michael.hennerich@analog.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 11:40=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> Never got any further feedback on this series last cycle. Resending for
> v6.17.
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. We're in the process of
> converting all GPIO drivers to using the new API. This series converts
> all the GPIO controllers under drivers/input/.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Bartosz Golaszewski (3):
>       Input: ad7879 - use new GPIO line value setter callbacks
>       Input: adp5588 - use new GPIO line value setter callbacks
>       Input: adp5589 - use new GPIO line value setter callbacks
>
>  drivers/input/keyboard/adp5588-keys.c |  9 +++++----
>  drivers/input/keyboard/adp5589-keys.c | 11 ++++++-----
>  drivers/input/touchscreen/ad7879.c    | 11 +++++++----
>  3 files changed, 18 insertions(+), 13 deletions(-)
> ---
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> change-id: 20250331-gpiochip-set-rv-input-bc12818c5732
>
> Best regards,
> --
> Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>

Dmitry,

Could you please pick these patches up for v6.17? They already missed
the last cycle and we're on track to complete the conversion in the
next one so I'd really appreciate these going upstream in the next
merge window.

Bart

