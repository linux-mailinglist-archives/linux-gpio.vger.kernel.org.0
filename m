Return-Path: <linux-gpio+bounces-19226-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2A8A991B9
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 17:34:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B0FC926978
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 15:24:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58E4328D840;
	Wed, 23 Apr 2025 15:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="OjPls7wN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E341F28CF79
	for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 15:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745421411; cv=none; b=ikZOKRaLGjydHfDH5VpGrrX06w1FLfvwt1j+Sh5Vf+Xoi+p0cacvVcocxkaoPCHVlcL5YK4K3TPXcY13QjtYh1S7rHmyL59kMGJWbb1NqbX2jq3fMBIdRL0cvj4Vn1+er8pAliy2QKGIyE57KV8ZnZk4Ws2g0lqkZtVNP+Y63KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745421411; c=relaxed/simple;
	bh=wiQRxjVfq6FHjvTR4eF4WEQlEgSYtFXiwIFHwN6ZJdA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G7ZJRby5ddlVmDCdeXBwJNXW04QJZ3dkAzVJ2sc8nOAKFb1EpnMlDvJ6/Sx298uU8M5yEvAxxY6cjqlqrV1PZNAkGjIubinpPTcTXrmCFezMkhOhsTv36oZ4qUCZaHFtHnZ8WmR8Z97syy5ltqif8DgoXCfeX3oY+yb7b9eHjWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=OjPls7wN; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30bfca745c7so304921fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 08:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745421407; x=1746026207; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9jo5fNYX7M8KjPw/nzhDjJuKY3qNiI/6SOFAiqZVsVI=;
        b=OjPls7wNqoIHWJqn8Vtmy4jfhirj5aOrFBgpxDsy4m1towrIGT5zXUMNjwFJUO8/IL
         g7jsiWCs5cA8zDI8bGU1znOZXshKwoEX6iqtDXaf9nn/jfZqF64bJ8Zka1mYpCbcRMGr
         KIgHo7WtE2Gofn1RG8ZgGnWel8B5hTJi+IMenI3Zj8hYk2K661e7iNfoahxBX3xG6eOq
         zBO4VR2dYMweIw7CBFBTt+n7ks7rU09WAcSDA2i79ZnCrRDM+nUOpyXh/aalXYIUsTq6
         Frmmyt+DZiPRLJAfqopWdKFCdHGzxYW4Fdw6WWGrPJX9XgeBJzFA/F24E3JwnspCciVz
         +7pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745421407; x=1746026207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9jo5fNYX7M8KjPw/nzhDjJuKY3qNiI/6SOFAiqZVsVI=;
        b=sSsTI/ZrKgJVTzXm0Oq3JfbWACoc95pSUvM6iOqyd3GXQZR/FRsuzvNfLTiwJGo/nL
         nY8t+IpfSh8t3cCzIz8zos+qOyvZYB6UwlNzwP+err8MQsfxVQqQqY111k5WJ1Se3AOB
         VSD9FdrNtYNH6fDn06uzX5YSigpM91xnWfu9X8gkbf/aKU5xl//UgXyzY/Sst1i0GNSe
         9EZHZGaPjYvpbnbIYQUNs5S8x8jMA76/mia+A/JbFVyAz5HCxGxQYYaDx2geCoGh5dpy
         8VuYgciAVbZBluXq0tk1opBEbtGkvIRvzVvnwk4BLPNjOa6x6GyPzwM0jL4zW3YMXAJt
         vOFg==
X-Forwarded-Encrypted: i=1; AJvYcCVmG5HDdLm3gUk+3Enhrx9Ccwfke3MDjXW6lbajR0NPQ0PxCH22KI83BaZmr9FfmrKnnxzN+sDCjkaB@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2JMSp1k/Q0Isd2cU3ITul8MBHCeC/ClcvE2MUIFhFjzA1k8TF
	6VCwBu9owaKneb6DzJGhczhWxW86jglsyTsaPwTPsdiQPiJ7490dMFDoJpwofAdcEqlPHzJmTbZ
	1IXupsRvQMrXS0VKBDhEBFitWBk/jivH8Kc1iXg==
X-Gm-Gg: ASbGnct6TGU4IcjgBh6YUHOmPP2f0D3WIYQTyQLl7OR9gMgMqtkFieZljeV34gqrjzE
	TNBhFPSlYchLUcE0cEPLEKuo5wQ06gNrHQ39TU/A+m9nAnGdO2qQzpCuhwRJWn4+J7pR/e5hrwL
	ytjsF1bVZvLzX9awsDy6J9imsum1aNNoaylPGuvps1kgmMla/ODsAomQ==
X-Google-Smtp-Source: AGHT+IETE/k4w1fu2U8cN+Dnfk6dutM38e/zDtMkQO31fN5/T3kjC7GQG5tDFfOMiRyAghFnvFrA/27CKuuGkDO0Ong=
X-Received: by 2002:a05:651c:1463:b0:30b:b956:53bd with SMTP id
 38308e7fff4ca-310904c7e91mr63840301fa.4.1745421407059; Wed, 23 Apr 2025
 08:16:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407-gpiochip-set-rv-mips-v1-0-e7f74a4eee2b@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-mips-v1-0-e7f74a4eee2b@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Apr 2025 17:16:34 +0200
X-Gm-Features: ATxdqUELgS6WCJFQes3519gHJSdg6pzOWNNHSfSI0N6izE-OdLoImE-rCQIjitc
Message-ID: <CAMRc=MdOVSWzt-J4_g+4H-TSVYyc0tCOmog0WSpHUqE+hCEe6w@mail.gmail.com>
Subject: Re: [PATCH 0/4] MIPS: convert board-file GPIO drivers to using new
 value setters
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 9:25=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. We're in the process of
> converting all GPIO drivers to using the new API. This series converts
> all MIPS board-file level controllers.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Bartosz Golaszewski (4):
>       MIPS: rb532: gpio: use new line value setter callbacks
>       MIPS: bcm63xx: gpio: use new line value setter callbacks
>       MIPS: alchemy: gpio: use new line value setter callbacks
>       MIPS: txx9: gpio: use new line value setter callbacks
>
>  arch/mips/alchemy/common/gpiolib.c | 6 ++++--
>  arch/mips/bcm63xx/gpio.c           | 7 ++++---
>  arch/mips/kernel/gpio_txx9.c       | 8 +++++---
>  arch/mips/rb532/gpio.c             | 8 +++++---
>  arch/mips/txx9/generic/setup.c     | 8 +++++---
>  5 files changed, 23 insertions(+), 14 deletions(-)
> ---
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> change-id: 20250324-gpiochip-set-rv-mips-43c07e67328e
>
> Best regards,
> --
> Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>

Gentle ping.

Bart

