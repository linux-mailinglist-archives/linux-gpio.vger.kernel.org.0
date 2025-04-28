Return-Path: <linux-gpio+bounces-19423-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5FAA9F34C
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 16:18:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FAF73A8859
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 14:18:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1D2B26B951;
	Mon, 28 Apr 2025 14:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jDr2VHzL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB754209F45
	for <linux-gpio@vger.kernel.org>; Mon, 28 Apr 2025 14:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745849905; cv=none; b=uDm9ipWMT3W4IEbHFkuyeFuiGtMqjbkq8aHnYxPZIC+7iQMZOyNrvz6Ak6JTSJdPgPnwZr55TEv/cIzQtO1p9b2k4hGyVWwlhd23r/B/NEPlI113aINmJp9HEGq+5hvPinmiVUj4dmkevg+JcD4ky0xy16s19vurUMPSErANYjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745849905; c=relaxed/simple;
	bh=PjRdXlsmJUpPvlWjlRcduIR1Eq5Vgg2u25y7fkkDmyw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YmJ4gXaVVG89qP1bP4g+x1e1Xx/LGXQVWteV8Fp1HhdPS7jAuRj9ut7fjzq71u+XOkT19faEaF17QH01pqX3UpPbcRu9VO/ygeuCiO7c5guzfFWoqBHip+mg0P4fhb7bioyQdfwUpzqnm6XqzMmjdn93Ug6rBBaZdZKWajgiA6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jDr2VHzL; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54c090fc7adso5026654e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 28 Apr 2025 07:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745849902; x=1746454702; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nXVvurz23J2+L5kt96WXTroBQ39jU0y6cCqiWeSQLFk=;
        b=jDr2VHzLbJ50BiFc8j1G0V7lsRiKW0Se2ri1Et6wLxdaTxeg0lkudTAWLFGqdvz0AF
         lD+teb4cYJzIBQ7buAdqQV78SOo7R6uod5Gh92hVNbqhSAOxQpqiu1kpyPXyZAjoGgSz
         gmWDu67pV/X9SBZfns7cFhc+0Fip+luuTNVntv5/y61h7C6CclqkedG0nUlrYmAAYezP
         UU2GrIxHri4vbhyGsNhoWp2UjyfANNbzCaN/JK16ZRU8JFPgZnCO1+7eDmVkQJyuHGh8
         x9nPpSfMpXCPLHa6AbXE8KY7YhSYLyb4pUPdskyJOJvXiBis/yyZBkw21SuRGnOnKKM0
         3GHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745849902; x=1746454702;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nXVvurz23J2+L5kt96WXTroBQ39jU0y6cCqiWeSQLFk=;
        b=egqdhvVI6djUlzbu15weUQiZmjaODalyvZH0DKl2BxB9W1X5dzC7q0xvRQ5fMEJImU
         kmyjQPOeFKxLZvMohkRim8wIKMN3tdG1s0wq4rOn7kXBMyLUVy/Xbnun7qVtuXhvJZFd
         +lMJvgcw6su3KaGS+vy7l6RSCdWV40pIAYdkiDfp+vpyB/YTfx0fLSVExa+vputJQKlM
         S8hPOfn3Ds54ACzITOS504QX0JDLSRRf23+azY+9EMa0KEffK+cmv9JUwWmMoBRpEoMF
         //0Qevm+/2aXgCgcMMtcFwinzGKAhA56d/de6sdHRD3onPGeT24gI6D1DNNPizHNzFJg
         nL6A==
X-Forwarded-Encrypted: i=1; AJvYcCV+smifS4k4FzIJ8EUBOvNP3JmMpZD/9QwrtPI6CpJu3qDo8dyIvVVlRy8Qf1lMOWn4Ir7ojj+7JMwM@vger.kernel.org
X-Gm-Message-State: AOJu0YzFrrvOG99Wjz1TQZqnWNo6I9503X+tPE3WgDFu70Z80H89XhCQ
	3GgSNDX5WtflckyOoxfhJp4cRi8T9CHi+pRp4qkDhAxjJpNs6iKBCoKQ5z8xCpB/UCzceXhSGos
	nfLbWrkm5dwkkuaxoIW6iEEgjo4TVhyArXujtovZBdFhSLUFZ
X-Gm-Gg: ASbGnctG0lY4I69hlCqJcz3b8pvzXgSj9cEJJmIBpeNv0KWujjQ6hBWmvhIRnC/tDaH
	u2QHSIS5f95BMpPk+HYVdlx9fHvEF2b8Z2bpkPQ7FIZzgLAfVvYl5nXJXxQg8dn8AQXPgY1ksaW
	Z/y4Q2d4zXhuhIpqTLVkDyDg==
X-Google-Smtp-Source: AGHT+IGvhJeqWQVl7wUSjEu9Tai7VZXnkdRdnljHuHSmsEW0zEOC9vXIPg78pJyadRV6QxI6VqKiX008Vk2HwfUHtNE=
X-Received: by 2002:a05:6512:108f:b0:549:6cac:6717 with SMTP id
 2adb3069b0e04-54e8cc0cb31mr3406763e87.53.1745849901807; Mon, 28 Apr 2025
 07:18:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424062017.652969-1-uwu@icenowy.me> <20250424062017.652969-2-uwu@icenowy.me>
 <CACRpkdaX0hTJSsZN6YNXASY3noZw=JsOSXzFBbxKegJ6A+2usA@mail.gmail.com>
 <7e62e720ccc51fb5c7d023adae3eab35aecf0bba.camel@icenowy.me>
 <CACRpkdY0DXxDixZVhnRuKvSVbKQ6pSfLMiT2hf9818sbNG-4hg@mail.gmail.com> <0606c146d97ff98ff1412b98f49e6da0071801d1.camel@icenowy.me>
In-Reply-To: <0606c146d97ff98ff1412b98f49e6da0071801d1.camel@icenowy.me>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 28 Apr 2025 16:18:10 +0200
X-Gm-Features: ATxdqUFE5Aj3lBDc4lYvvht68VXq-83pWEXQcwlO7tgbNAkueD3gpN4Y7TmGwKM
Message-ID: <CACRpkdbPhKwjb0dkOom6HyzTrhPWvMPhX5M=nyxw1HBHNJa0fQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: pinctrl: starfive,jh7110: add
 PAD_INTERNAL_* virtual pins
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Hal Feng <hal.feng@starfivetech.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 2:26=E2=80=AFPM Icenowy Zheng <uwu@icenowy.me> wrot=
e:
[Me]
> > I guess what rubs me the wrong way is why the external users
> > (devices, device drivers or even pin hogs) cannot trigger the chain
> > of
> > events leading to this configuration, instead of different "magic"
> > configurations that are just set up in the pin controller itself.
>
> Well I am just extending what's already in use...
>
> Currently it's already supported to route GPIOs to GPI signals, I added
> the support to route fixed level sources to them, in a similar way.
>
> If any external users ever have the need of banging the internal
> signals instead of tying it fixedly, maybe switching between different
> pinctrl configuration sets is enough? (Because this kind of operation
> could never be as high speed enough as real hardware pins)

What I am thinking is that one of the following must be true:

1. The internal pads are always set up the same way for this SoC
  in which case they should be just hardcoded instead, or at
  least just implied from the compatible string of the pin controller.

2. The internal pads are routed differently depending on different
  use cases, in which case they need to be set up or implied
  from configuration in other DT nodes describing this use.

I guess this binding if for (2)?

Yours,
Linus Walleij

