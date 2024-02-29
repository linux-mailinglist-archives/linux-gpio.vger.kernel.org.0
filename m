Return-Path: <linux-gpio+bounces-3937-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BD386C58B
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 10:39:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2FA2E1C23C1B
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 09:39:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47869608FD;
	Thu, 29 Feb 2024 09:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sMAZZZV9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F736086F
	for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 09:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709199547; cv=none; b=GtGiA4JCMwXnfTu+yk+amhU/kgq5K6Z8GmwUAuchwkRHkDY697dJYugWARK4ysfd5xIY7dtKBjKRfVtc8926KaTtvrpMCg8SOpYJitLp2upT16QX7LGtNYYrQSQu8DYwLL/aGpe8D/Mx/DozR5gWRXHxIcMRrX9AqhzXAL7RYN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709199547; c=relaxed/simple;
	bh=Id/0hLb1OoVGa9urk2OII9ZHzTzUCiC9fqBjkpo4oTk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bgZFk+FxT62mSMasMKt3hVf5OhzgWJpRqXkNwM8uvMJieZ8c4Z0cAOzOjyRkyBgs+bH4OyQ1fUPWRSiqY1IWhL3/SUA5VWFKNsu4w3oA6B1DryRQeaq12tma1pkX1NBsUvsxXyYkcDH6OJ2zgmDQBhTwx1ajBLde7uEEmaus9gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sMAZZZV9; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dbed179f0faso1312115276.1
        for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 01:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709199543; x=1709804343; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Id/0hLb1OoVGa9urk2OII9ZHzTzUCiC9fqBjkpo4oTk=;
        b=sMAZZZV90iPYI4/G9PGJcTNCCMvv5Qd5Fcc8Oegz654V2iHCOAvmzhvHLmVmUHUM1C
         jjyQ0MOeoX/csV6JLIxyt85OZa9kVEizTi1jw9NblPqmOlxcbEwX30IeRfY6J9IFIawA
         AbV+bcXUiJD9z8nn6J/VpEfUMBanERNJjGQ+YeH1sLYoKet6NPi6pEL03YUtgNeyyfos
         m780tFibJOfT+Da2Z5wNZlCQCPhUToDXgig+2tqJvzvOfIqUghowkXm30w6UdRI86dkG
         vDpGNc2Tn1wtjnEYAkQgWkCeMlYgzJ7BVSUzlujOb3R1r1QQBaVdhvSenerGvD/usYQj
         a8DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709199543; x=1709804343;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Id/0hLb1OoVGa9urk2OII9ZHzTzUCiC9fqBjkpo4oTk=;
        b=Zy6rk/23q5N2xeTT2EfxlNKdB9YWP74lxrcfu2njTj9ZREABomirUsUcSJRBuuSZkf
         MhwZxl18cBd28T6dJ0QuzouSmqAkqrZ0rM7JR+fozDQgJQF6WfgPnWc9AfBJkDDjEdnJ
         UH8tzm+L2cE0ZqqlOp0xmBIe3bqEC5dTwCCL111QCynzTntIpHlAeWd3oqq3iU7Xw88Y
         w+q8BcwoiIDkFh+HVB1Hd7rEPU6phXxiNmScpguWc0Pe2NYQAiBXvtzV2scFcRaG7QAN
         Axbl+8Y9DnVFVygHJcTHzOYyEV1EuFlVBT5cG2xOLjvKHzK/sjVOgFZRNAdfx+q635Cn
         mNfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVn89IDfn5qGEzXdDJlOapxtF43Ex5g1KkJlTpUtgSmnNSdF3vx4Z8yFIiDFdsR2Kg/UzmpVe7R0BUApz+DlZpscKr7qz1IscgRoA==
X-Gm-Message-State: AOJu0Ywr+DeYtoLrxDOOLKc5a5C9i/0bFxyz8f5wJxxbQWxef2dKVuM3
	BRFoWtOsdGtasJkyj+15mIO2nyykxWnmMgQsAQtaM4SXKJMYtUnd7DvdTsCh8gHO58g65053ARp
	Jl6miFRfeY3dleB/y1FWdugGzZIZf+X55hxTBgg==
X-Google-Smtp-Source: AGHT+IFptHANPFZRp7pQwEznjk6ScLV2D3Oe6Z2gcGFVq3bPrlRpc7Zj2hsVukPM6YMB6JUz8/NILyAx36hRTe8VGnM=
X-Received: by 2002:a25:8308:0:b0:dc2:2d55:4179 with SMTP id
 s8-20020a258308000000b00dc22d554179mr861584ybk.17.1709199543032; Thu, 29 Feb
 2024 01:39:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228-mbly-gpio-v2-0-3ba757474006@bootlin.com> <20240228-mbly-gpio-v2-25-3ba757474006@bootlin.com>
In-Reply-To: <20240228-mbly-gpio-v2-25-3ba757474006@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Feb 2024 10:38:52 +0100
Message-ID: <CACRpkdZE-hZGPg-1cnFZ_amYT6t3p=fOpvEOcsaZY3E-Y7_Weg@mail.gmail.com>
Subject: Re: [PATCH v2 25/30] gpio: nomadik: grab optional reset control and
 deassert it at probe
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

On Wed, Feb 28, 2024 at 12:28=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@boot=
lin.com> wrote:

> Fetch a reference to the optional shared reset control and deassert it
> if it exists.
>
> Optional because not all platforms that use this driver have a reset
> attached to the reset block. Shared because some platforms that use the
> reset (at least Mobileye EyeQ5) share the reset across banks.
>
> Do not keep a reference to the reset control as it is not needed
> afterwards; the driver does not handle suspend, does not use runtime
> PM, does not register a remove callback and does not support unbinding
> from sysfs (made explicit with suppress_bind_attrs).
>
> The operation is done in nmk_gpio_populate_chip(). This function is
> called by either gpio-nomadik or pinctrl-nomadik, whoever comes first.
> This is here for historic reasons and could probably be removed now; it
> seems gpio-ranges enforces the ordering to be pinctrl-first. It is not
> the topic of the present patch however.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Patch applied!

Yours,
Linus Walleij

