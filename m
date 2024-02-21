Return-Path: <linux-gpio+bounces-3567-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B6985DFE2
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Feb 2024 15:37:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1ED2728574D
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Feb 2024 14:37:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23DBE7FBA0;
	Wed, 21 Feb 2024 14:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XU0P1dH4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5BA7F7EA
	for <linux-gpio@vger.kernel.org>; Wed, 21 Feb 2024 14:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708526249; cv=none; b=OjfeT1BUH3aHNCSVrFcm2FhGnw8qbR1qx+RDstUBcE9qey9vHSDiw+DwleHbv6oZg45mLYgLv9eJsy2VUngOPM8aCWYANmgeUGVxxCjgXu5AMjUWa2k5nO6SaNuoZxVGQXDTr+O+hoSVGi+LP/I8NAg0+ArSzp7PEImOn51MQ/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708526249; c=relaxed/simple;
	bh=J8q0JlB/CSmcraPRz+OroMVJcRYOKeq7wFX81mHHwC0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AEWoXcljQtwuzS3Bgm3Kskz5W6ko7N87qNV7pGMyP4zRxOlvdC5V8qXu+KJiVYXc4JBMCZT1YmAEPrDqBLMCXUdGacf4Oec+cJgatUgS2DN1HjVKpxUCD6J9f7LaRFlDv22J8waMt5CHsETtM+z0kLDaD4pTdONi/CCB8PXpg7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XU0P1dH4; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-607f8894550so5553137b3.1
        for <linux-gpio@vger.kernel.org>; Wed, 21 Feb 2024 06:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708526247; x=1709131047; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=96dYgcSw1uzHwk35CUcYsL8G15ZF0LlfphttW1dNAO8=;
        b=XU0P1dH47EmAdAw554gnxahswlY2N7CeXgUBjqVbkF2itptU1PLUl42y5XyjO0vZWT
         pRm3JuvaAayAr1GDHyHoBkndoN5hkWSUvvygxeibgytIm46/TNFPG/464m9CnYKKH1xE
         E3xOy3lPOp5Uhv/2I7Sk0CppJSj4N+8fhuR+waXkBOZUAnTU8JK8QrpSLbFqi9y4nq2E
         LgY01q9KHjnEd7ZqVhrCgneVdgXRRXJLMc+sDXL0OuUgKX2r+zkc7sMILzIUvyzY0fE/
         qfJYEgjFiEO1T5mAhfeDH3+ACHt+NjlC3j3QjPw0h9UVEh6bPCHUBIJMU4R4ijBTDFwu
         riSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708526247; x=1709131047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=96dYgcSw1uzHwk35CUcYsL8G15ZF0LlfphttW1dNAO8=;
        b=Az7nssONq0deAmfBzGx+8asnM95G8rFi+dK6ENaLJXswY5hMuLRkdxh5MYEsTT5QnK
         3qaEVf2wLV9D8rkoVH8CRwxAo8AE+Xn3mUgGq06p9VivsIISUwApu5SXxlQ4rEhHwlmq
         /yiNs3U37GYczdfM4hPbXNGxZJVtrTY+7aUUvMFbWLKpronVoscgUIxA8bueLtfNkTWb
         5TAG+KI7Xr8znwFGVY6DvvLAt7oR/YTbFeqGVcQvFz2Lp0KORq0WSRCLsEh/Lp1RqZ0d
         gfnyAN6/LVxUh7MKH3EPlWURS2p0GZKrYvB697LJceD/O0v5exktuJASx6fyn+415oP5
         zd6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVMpp3yADlLhqLprsqOXfM3DYshY/NAIZeO9AjA/KEGMUdxoGHpGljM72EsjiqjxZONcGAtJWYmWH1aOel8JIx07QvvMc0Cvu53oA==
X-Gm-Message-State: AOJu0YyD9/abjonIQD9z27Pyv0R0bbWEaH9ZLvqqwYLO1Xem+QvWDD3q
	KtVpAFSPp9YUfO0Dj5XxjCxeskk84DhuLt1jUqx8adAjiWR4QX4TfJuzVVLMvoufgZT2dBgoVuy
	7Wa3r6ORzBJ0pvvXR12rU5PkNDELpW19w0OYYiQ==
X-Google-Smtp-Source: AGHT+IF7pOoDUqDYgFCWHrS/yspiLu24Q9Cz2m39Sye6lsyfXxK+C51y7B3RynHaRvKVKc9Ic8TVoo8lot4no3c5fF8=
X-Received: by 2002:a81:6f0b:0:b0:607:ca2e:f23e with SMTP id
 k11-20020a816f0b000000b00607ca2ef23emr17929112ywc.30.1708526247225; Wed, 21
 Feb 2024 06:37:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240214-mbly-gpio-v1-0-f88c0ccf372b@bootlin.com> <20240214-mbly-gpio-v1-5-f88c0ccf372b@bootlin.com>
In-Reply-To: <20240214-mbly-gpio-v1-5-f88c0ccf372b@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 Feb 2024 15:37:15 +0100
Message-ID: <CACRpkdaSMJBFrmbTu+C1Ls8HkLH4FZsAQ6t7dC76+sVTXXHEyw@mail.gmail.com>
Subject: Re: [PATCH 05/23] gpio: nomadik: extract GPIO platform driver from drivers/pinctrl/nomadik/
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Theo,

just a quick note here:

On Wed, Feb 14, 2024 at 5:24=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@bootl=
in.com> wrote:

> +config GPIO_NOMADIK
> +       bool "Nomadik GPIO driver"
> +       depends on ARCH_U8500 || ARCH_NOMADIK || COMPILE_TEST
> +       select OF_GPIO
> +       select GPIOLIB_IRQCHIP

Could you add:

default PINCTRL_NOMADIK

so it is turned on by default when we have that, since they are jitted toge=
ther
so closely.

Yours,
Linus Walleij

