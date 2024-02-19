Return-Path: <linux-gpio+bounces-3455-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC4885AE1B
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Feb 2024 22:57:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 92B80B22AEC
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Feb 2024 21:57:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C2BD5475D;
	Mon, 19 Feb 2024 21:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yaKQvI2I"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14A454FA2
	for <linux-gpio@vger.kernel.org>; Mon, 19 Feb 2024 21:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708379807; cv=none; b=ePmBKN7IKEeJmL2Pvcc7e0Bud3ICCkAmi4o8QQhyXNXdTPQisOwTG5bqYBST3cS/H4kHUzBaG9ohP2Ecx17KTUYsfMhjqpj6WEf/epJSjcKmYcpVkZ/ehbzCrqv2Fm6V4MfbqkwUxP/dPZqj54GK2BH+ScAZacSXUHhynfxkYck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708379807; c=relaxed/simple;
	bh=jnwZE4S2VTxOOE1MLufKwv7MLtdIeQ/H3SGA6T3ceVw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gwF7tCJ98/bGQSa9VvXCKKDmdSYbrqwWhQ5chAyzdVzws8kbUEQLXJAUY2ORF0zDbv4GTCr8bl2piQYRMTo35c6iNHi26UXCkTS0i4A4dLx2JaM4lqxNzfafhnI8/V0b1HRlrK2Qy7n6aOwCSVDTFLWHbi8/as8f8/bDkOO8DuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yaKQvI2I; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6081bc96387so16493777b3.0
        for <linux-gpio@vger.kernel.org>; Mon, 19 Feb 2024 13:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708379804; x=1708984604; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0/z7Oth3uWYAoZv2gVpy6Dr4nj1eg780SKedkbWLNvY=;
        b=yaKQvI2IzjqJefvDuWLsiN7ih+t6Ar2DuN96gdel9Da/lXfAe0CyXVGlmNudhJragY
         SAxpmWT2IVinRNrzaJaze/UJLrcjIRBH8gjrEnF9nZ7xUMQ5Pz3qeezT/EXGY2GVF1kG
         /RhvKWGnszItfi9V84Pn4iLNaaupRH9Jh0hhSQxQ3BKz2ozGC04VFtpP4wDrXDup3BUC
         GnQE1aEOmZFViAvgWMKX92tXQuzI7AzuTftCAMqsZGoVRH5X/Fpwz6l1ssAPm2UKJCqw
         js0vmBGHx2zMjkUn6Y6KwefSnUaOBQNEjChV3pz0PVUurPGG3A7qcpAVjAuxKlwJvzmI
         3PdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708379804; x=1708984604;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0/z7Oth3uWYAoZv2gVpy6Dr4nj1eg780SKedkbWLNvY=;
        b=sKQSWc8dY9JEppjrrNSH591LD5fS9bzISz5IhbEL8F1depQr7zj5wviArFh6tP+mpn
         YUJsdaRaTBdpLlSPxH9GMG0vGYyUajzvfh5bKEfr+V6M4OJsKXA005ylR+7DJj3hltEt
         oXjqsx9Ql1FH7NoaYbfgnGc4wXOZwTdJLR0TDtG5kTxGTpS0F1dsjDzb0GkRsGEVJ7/N
         DS+y6Y94tijF9eHF/M0onY7GuMqS27XiFVRmuUbFInKVVDsU5RE7UbeZ9Zu0P1aNEgxA
         qEPh0qDUwF67MzDSTnzTz8B7fzbLc4OFoxwCIcVskJp2ehNq61UvkhWcG6llOOnbC9+/
         qFSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXW7fQDX5eMO1yKiSBjJ/a8DGD0NEYEsJ1xil0yJ9c9aKSDs6D6de7XHh3XFMuzO7Nq+Me4B3zzW0WXt5xGQV+nyBJ59jCh07gvsg==
X-Gm-Message-State: AOJu0YzomYFNh0yOowCa5dpwTh5F2aEp6m9kcFU7NDk+8G1M8nR9tV4e
	KMRAebpg4eGeIOmLHzRYU5bWuCnEJETTmVLWeJHb66Hqc33Uf3geqN0LxL9P08NdBZgORSTF2wt
	iJTNFm2z9vQDvaXQon+7DEuvxxhbuoZbuTWE3OA==
X-Google-Smtp-Source: AGHT+IGcz7rDFrB3H96NwCEBK79eVL4dxmtjY7EUMR+E2Y+tyM0OKpEUleavbf8K7T1I+Q8afEbrz38cYzH/dDLZwL8=
X-Received: by 2002:a81:ae41:0:b0:607:e8c7:f9c9 with SMTP id
 g1-20020a81ae41000000b00607e8c7f9c9mr12782963ywk.1.1708379803904; Mon, 19 Feb
 2024 13:56:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240214-mbly-gpio-v1-0-f88c0ccf372b@bootlin.com> <20240214-mbly-gpio-v1-13-f88c0ccf372b@bootlin.com>
In-Reply-To: <20240214-mbly-gpio-v1-13-f88c0ccf372b@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 19 Feb 2024 22:56:32 +0100
Message-ID: <CACRpkdbq_QxdftNGOv3+-SpfrV_qPTB-m-atdY0hCE_s8DK64A@mail.gmail.com>
Subject: Re: [PATCH 13/23] gpio: nomadik: fix offset bug in nmk_pmx_set()
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

On Wed, Feb 14, 2024 at 5:24=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@bootl=
in.com> wrote:

> Previously, the statement looked like:
>
>     slpm[x] &=3D ~BIT(g->pins[i]);
>
> Where:
>  - slpm is a unsigned int pointer;
>  - g->pins[i] is a pin number which can grow to more than 32.
>
> The expected shift amount is a pin bank offset.
>
> This bug does not occur on every group or pin: the altsetting must be
> NMK_GPIO_ALT_C and the pin must be 32 or above. It is possible that it
> occurred. For example, in pinctrl-nomadik-db8500.c, pin group i2c3_c_2
> has the right altsetting and has pins 229 and 230.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Ah good catch!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I this something I could just apply as a fix or are there
dependencies on other patches?

Yours,
Linus Walleij

