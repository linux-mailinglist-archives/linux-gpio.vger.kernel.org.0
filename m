Return-Path: <linux-gpio+bounces-28352-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 883D2C4D2C9
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Nov 2025 11:51:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 358E94F52B5
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Nov 2025 10:44:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A52A634FF60;
	Tue, 11 Nov 2025 10:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kZfXwY8j"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD56302CBA
	for <linux-gpio@vger.kernel.org>; Tue, 11 Nov 2025 10:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762857872; cv=none; b=NwFRFFAl4LsqPLTeTAY7zQykqKnPuZUWRE09D10bvVQkTO3OfDUIftTS18cBzPV1/7p0E5I6wbcwrDyTypbhmhBLBb6YX4tV/jk1twKN7YWS/j8ItiFHShewstIQq0kK1pGzQy1Ukg6+GuOsm30a71o5LkXiHJXRmsZxCWx1WbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762857872; c=relaxed/simple;
	bh=9cdWyWvVx1HiMmqJtLkBOepfaD6aK6+e9z5z1DN0zTM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VHKHBdFC38g2Hq/xYHC8ARENxdLQ4yUMBSG7eTGmg9/I2wI1pYfdSIJt8iDvnvRbe38UdiVIez22E0+XoUNeyDjrxyvP0BalhQEa2RpIz9jz4Nu+75s+6c6GbGZfI0Ingt49rXlyvEEalRel1rfFzeRQe4BSrP+yb3Gz1YJJJxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kZfXwY8j; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-786d1658793so36192877b3.1
        for <linux-gpio@vger.kernel.org>; Tue, 11 Nov 2025 02:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762857870; x=1763462670; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9cdWyWvVx1HiMmqJtLkBOepfaD6aK6+e9z5z1DN0zTM=;
        b=kZfXwY8jA2RfIv/beanYlCuNRNHEDnYc6FC7/viUrwd3DhBhSMKXVNQ+LBx54BwxQb
         6bRRD7eO7duzXc/3Vk/cdQsVQ3Je9WCIBmTCXNLDXuCe58WxeNkjWVmYseOlz4Iyvcpy
         2CxO2Tdzj6VYV3p3Zo7KPqusjhQWgDJ7TK4NN8KORD4ZzyMagDHoqPnUWP12U7HEliik
         95BYqbIytmiLh93FTrSVi2AYEMFG76DXmIHRS15zq0lq1ySaJQoNNf7ti93YIdZMKyIZ
         jttvw8xqbhoNduIsu2RPnUnh5Z3ZGTRyXcb+M7uxQZZOpTvbE0H35OiLvsfmz46LUpl8
         yfAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762857870; x=1763462670;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9cdWyWvVx1HiMmqJtLkBOepfaD6aK6+e9z5z1DN0zTM=;
        b=MuVNpDO+yz83AjeLoIfrKoZkGjSOVuMIgIEmIWvJHf/M28u3VNIu7Rm7GWCUelB0yN
         c9pk7qiNOu4V1L9U2O2FQrJBKk4H32PYQ4TrFgkgMDQuZ9fsQ9qSkXPytnovNFO8AGwv
         CRMasNx12UFSju8Rl6i4iGWMba7oleRaL7YJccd3/qyxyQUrlbTqeyL6Xn7PkLb7KPmn
         tYdS21r6gq1n7xaE0b8FNzXg/BUQdVdHwcV3JNR3+3qlfFzMKlJpREx0T9BoBbfo5lvb
         a7gilQou6nIls6Nms5aeBlr04qMs9EPm4Ctf0gPJ+QX4WjN3T38j0C/85fmqnGyDYP7q
         XHDA==
X-Forwarded-Encrypted: i=1; AJvYcCXuDGzD/RglifTKSd/InblhROv6wFs6+DjN5SDgBzmB77URqzZBfjRsaUmB/g5cBsd6cxYzIHa18Rpx@vger.kernel.org
X-Gm-Message-State: AOJu0YwjHhUTHWGYfASCg8AMIToLf9J6WSC2Cr0cVq7TK5VfWUzAxyQj
	wNoqlWbsh3gT0uSc9mraNXTKm07/lbBqjIsrgz1TNEgTW7oG7JECP875Zwu8dJkKEjgtNz+J5ql
	qwSygpZxDz8JyEz6zaK6AwaMfgbF2/2UdOhU/p0nqdA==
X-Gm-Gg: ASbGncvFgVInXu+EKOhiaOp6VvKQcm3h9y8VFYGxpWB1wHS1pRaK9qZIclWMBWHjErw
	RaD3U1x8KYopM8J/gpTeZNv+ks5x2PlVeHeTyFq3wpwfNTjpKtgpSy7tzUe9T0IUf+wpCO4sUUj
	dVcx6ibDs+qAeRJt53+/yslfFatfJEMyldO6pKHpM+iWhXXXTeSvUgK3ZngkGW0rCEbvWNJsEad
	i6TLkXonOVK8qcK65kg3+ynUm7eM+Z4TPd6Iuzgknel6O+fo2LqzJkNAYcN
X-Google-Smtp-Source: AGHT+IGM3E/e9Scx4gWocd3epZsySeg+GiSnUa6Lqk3ZWYP/cx+DuGwZohc+rkcKQ1+QYm8c7Jg9lh/z3+tSIbO/Q/8=
X-Received: by 2002:a05:690c:a719:b0:781:32c:b359 with SMTP id
 00721157ae682-787d541c211mr161593377b3.36.1762857869718; Tue, 11 Nov 2025
 02:44:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org> <20251022-gpio-shared-v2-6-d34aa1fbdf06@linaro.org>
In-Reply-To: <20251022-gpio-shared-v2-6-d34aa1fbdf06@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 11 Nov 2025 11:44:06 +0100
X-Gm-Features: AWmQ_bkCgjjs_tm6yJMft7dkXQVENEnuhOT2qvpn5ldswgUFUo9RrRQtDQDlZKU
Message-ID: <CACRpkdbqLyeaZx37yrKjDFWb=C5c=vK6aPgnW8cMQvwi_6Jiug@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] gpio: provide gpiod_is_shared()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2025 at 3:11=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Provide an interface allowing consumers to check if a GPIO descriptor
> represents a GPIO that can potentially be shared by multiple consumers
> at the same time. This is exposed to allow subsystems that already
> work around the limitations of the current non-exclusive GPIO handling
> in some ways, to gradually convert to relying on the new shared GPIO
> feature of GPIOLIB.
>
> Extend the gpiolib-shared module to mark the GPIO shared proxy
> descriptors with a flag checked by the new interface.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

