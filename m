Return-Path: <linux-gpio+bounces-11158-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 63800999272
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Oct 2024 21:36:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E6AE1C2598F
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Oct 2024 19:36:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEA9C1CF2A5;
	Thu, 10 Oct 2024 19:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tg5Djhk8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E319719884C
	for <linux-gpio@vger.kernel.org>; Thu, 10 Oct 2024 19:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728588988; cv=none; b=lOLOGjAecSZ2+rRj20ZoF4GPv0yh6v3/J/+/U6pjQI/U94ahPvu3qqKrm5cU2oALGJTG/TKoWbgeGUhJo2O5oRDZGIaSeyZxzdMNrMeDxTkVIyXIvrIF2o6UdTHQADC2N/6mim6Y0oTEggsX31uDwqAQY2oNuPG3IZPPswJtDHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728588988; c=relaxed/simple;
	bh=Ip3chL8Bss1a08NOwaypbXfYRjqRoK2PDdFzgYiK+7g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ScrEmZjNkS4AwzhuI3gYY24dk1rYmUYZcjqPquA1MmygaGd6t8w8mnE3CnIVtbhjUbLI7BgQ8wUnX/fdECPs6HZ/yyIyAyTEWLUeL7TTc1uKNf9oZ2k0C78+RFip6dshge5EcyGcGlF+JRzdAMylA0P2KSvdq5/6HMcuk2RXWQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tg5Djhk8; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fad15b3eeeso12308501fa.2
        for <linux-gpio@vger.kernel.org>; Thu, 10 Oct 2024 12:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728588985; x=1729193785; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ip3chL8Bss1a08NOwaypbXfYRjqRoK2PDdFzgYiK+7g=;
        b=tg5Djhk8jjKJop1DduXwjpAXJRzcjZJHK3NVQjmmrtE5riIR5OhvNo1AOd4O0YSJ8h
         4XRLKPsCa04z/rkXXyFHpSBiUE/O5gedqreLYiTG9HQQj0dkJLm2menTgLSScYQ/ZbLc
         WdPgGx83SESREOf61WdOfoxJAbMQk0HI/VP0RcX7i+iYvqpbYft6zdZZiJaJKg0r5ho4
         1G5rw2r/UXz9JXENExzJr8WHazf2WIlVX42g7g6kt8lz/w1kWFicK+4rW7vkvfZEoGiJ
         4JZlDVtMmXyf5UdKUD/tobVP76UQLOHf+hsFL/Hlnw9KihokuTiTWkcAslY0QEpdv17z
         fgkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728588985; x=1729193785;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ip3chL8Bss1a08NOwaypbXfYRjqRoK2PDdFzgYiK+7g=;
        b=hIqjs+E1rXO9+BnuOxtFCdqYg9YTcDocwOE512qs/mbv92b+OYgvXfsZDdMO20rmx6
         m1YTz8AoF6WC2kbAaH8Ko8DU/x+nwcvjbFH3NAlKBf4NV7KNu9+ysdaGXJ3QmdbnTQT9
         rxDQud+bktEHZTXjgx+Th6iGv5Ja8Izn3iyqYXFxYwObdMUmuhJaQypGNmdg3rUXiLCe
         91WDqtgwj/z24PH+JiTPAGxN36Bt83dnRc53plIqknSWBegiU4e4+6HbVV1VAEsdH0BB
         5vUDdvHdmeY2QMJ6LfT1o2mhubArGYUii9q3/GDyvmDuqOz3FzvZoWf516MjluWAyWe6
         HDWA==
X-Gm-Message-State: AOJu0Yx2/wC+jeivAcoFoBVQngb3iAiEW2goCJqulfBHodcAf5Aw3mHv
	+kEiItDSf/AdHVzPZWSI9hpKqbHMleK553o9kcNZ5BW5vOydn3J1G/HC0yfnq3NvEd3ErskPDVC
	9siKIUtA2cPWQZ82vGy7J7O9crrl6mcVMNY347JV7Oh8bqiN6
X-Google-Smtp-Source: AGHT+IF1JPtswPqXRowOIiK4P5X8Uj/d9e4V75wvy5zFvANGLSPcvYHJKLPcx2qzkyv2Qy3Z4IEyqYV3wScisgfF/fY=
X-Received: by 2002:a05:651c:1987:b0:2fa:d296:6fc6 with SMTP id
 38308e7fff4ca-2fb1f7a2a69mr29389541fa.13.1728588984996; Thu, 10 Oct 2024
 12:36:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241010080347.7759-1-brgl@bgdev.pl>
In-Reply-To: <20241010080347.7759-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 10 Oct 2024 21:36:14 +0200
Message-ID: <CACRpkdaTfzzdXhBrXd8SxWNupay_Q9ZW=MJi1Po3x7BOUhcgDg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: aw9523: fix kerneldoc for _aw9523_gpio_get_multiple()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 10, 2024 at 10:03=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The parameters' descriptions are wrong, drop the invalid ones and
> document the ones that are missing the description.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Patch applied, thanks!

Yours,
Linus Walleij

