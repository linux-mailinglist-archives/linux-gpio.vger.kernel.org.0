Return-Path: <linux-gpio+bounces-24733-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A953B2F6A5
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 13:30:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C0D955A0742
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 11:27:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0345930EF6B;
	Thu, 21 Aug 2025 11:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ACKT920q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCD03054E0
	for <linux-gpio@vger.kernel.org>; Thu, 21 Aug 2025 11:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755775638; cv=none; b=HU6aFsZ0HfbCuKYItC3fzPe7iz1+pEiY9pKaE5x91/i8tgri+2+MFgOWqRfL2p5f+/lDtkP7Fcz5lB7NDcufmMuKi8+kKBZ4HoeJuKsyrDDXAL9U13VfgP2dAEvV8jS+5jLX/q0evydcpUiU2M/CN/NAVhQPIkNgy+Ge2C8Ke70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755775638; c=relaxed/simple;
	bh=2iuhQehcGJ/STLL1wVwziWidGXccPhxvPLuOUY7+u3Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rBFq+GxtyaD5j3GPfqHxCzHtLTzqboDA17h9Pm0xvdp73lRiZgf/zB4KfJ9pxpHNMr/4+QTXOBmf1VKOZoJUqDrFvg1UQqsbYqSL1dVrL5NcoiORmKJQqh9pp94PBZdiRokfw2e+LkfFIRUarlqgpY85pn2FNOw7uLvrfgc25Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ACKT920q; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-55ce510e769so839650e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 21 Aug 2025 04:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755775635; x=1756380435; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2iuhQehcGJ/STLL1wVwziWidGXccPhxvPLuOUY7+u3Q=;
        b=ACKT920qQiAd6VgrDZoeSP9T5ju8bLYhTZQVbegXxugi68H7x9K3HNxnB5qfatoho4
         9Uc9HqfLTeBngZRWRYZNufcm3st5bEqU/cHCxcCzzPq5L6DtN6mJQzFgIkZhwgWXso6/
         Qfg1ovAePCbYdYQZaZF3P0qV/OJRad1WDvDvW3RyPRMn/hp2t99np+dyIuNTFvhqE5+v
         yXijG82JAdK03KNicdw9RJ81ebZZISm9FJHBX/bwifACDlANFkqL14TDECxWHzClSek3
         8Avha6w1N5awtfvIb/pU39z1/rxaqrC2ROkbTiv8rojq7XbM0u5lqxAGPEy1DU4B1CUZ
         foxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755775635; x=1756380435;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2iuhQehcGJ/STLL1wVwziWidGXccPhxvPLuOUY7+u3Q=;
        b=paoJKGYbnl+hMjUsmrgfv/QgPJovx2GXhL7wQwQR+x/gLT7t3Cz0UW0I5mpLvRJZhp
         EbrSkfxFR5IkIwGqsx5yHVYnYfBFRS51aDfIAXBduN6Fp9pGm6DsaNp1+GoLQdF7XtM4
         xwinC4ESVDMzP6QluyrIYy/aBTB8Vu8mky1/4qo+wDcEZHPnCP86oKZ5LwzJ10y+qf+s
         6DRFAPbQqmlgyZV8Rge7bTzZLE5cJPO/4vbNFT3QQ4lgcFh8ogqE3aT/QS30S6C3qsMv
         2bGJFMX0BPrCYF46XVgeaNkSjCPdJaVmnQJ3puwtqWjSsGRGkkZEntzooDx0ADRYTDph
         7S0w==
X-Forwarded-Encrypted: i=1; AJvYcCVaqNQ6Yrq4sN9DNWd3W//08Yj/MjjpMGfWfFTfaY34/g5PRNWUMIM6vYcw08ywyMWnD1nNlodjt35p@vger.kernel.org
X-Gm-Message-State: AOJu0YwNMbc8dJI9IqGtXpkfpciuRhH2lFGhgxfSaZZlsMCJa890JQ3z
	ebAOEY1A+gfpxalUuHh8pmHLGIsq/XIkuIhpFVR9Wsbe9J+XAojAiWyJfE7kPsuDF7uH819Gxxl
	gYwJwwpYbv0MqfdE++y99O2iDGcxMm5pPc+tTZw9Z4g==
X-Gm-Gg: ASbGncv2P8jzL3QdeEBvvZvbn8pNu8zlU0HUdiNxsxsYfGKGh4VZc+LtIq118F9OsGz
	TD5xqOsU8+Q5ca2Cs/KWG+fBxfKmytKOuOJloBQWp1MGQU8Q+8zAJ0mDO4MH62lyEWPKXhWtMVJ
	BLhxghm+2eXqypZ59g1PhfIt7GJCHaWRAFEg8U5UWB6IyDrUABN0a7qYYXqXtVGlXlO/P0LndVM
	xJvLH8=
X-Google-Smtp-Source: AGHT+IHfxoqcChsLfygBUpUWn2PCNNKaUpVfkw0VSrAeJy75AQZfqbB6MGhf72lV5Y0Gxx16LXjumAnruYNQwdN8gFk=
X-Received: by 2002:a05:6512:2284:b0:553:d702:960c with SMTP id
 2adb3069b0e04-55e0d5c59f0mr805985e87.56.1755775635103; Thu, 21 Aug 2025
 04:27:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250811163749.47028-2-ziyao@disroot.org> <20250811163749.47028-4-ziyao@disroot.org>
 <CACRpkdZp8FLrxgkeZ=xzSPgny51iDZ3KRCrxpoSdgF8_=df=KQ@mail.gmail.com> <aKRw1pEUUwd4cQoW@pie>
In-Reply-To: <aKRw1pEUUwd4cQoW@pie>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 21 Aug 2025 13:27:03 +0200
X-Gm-Features: Ac12FXx9O5o9dI7NgdWBP_7YslWNrW827bj2s6nLtLSzojwBRCZi2QrMsWTrODw
Message-ID: <CACRpkdZCs6u6Tyos_ufBoeZ9V+51btEQ2wbPv1GRp5RNGZcUyA@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: ls2k0300: Support Loongson 2K0300 SoC
To: Yao Zi <ziyao@disroot.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	Mingcong Bai <jeffbai@aosc.io>, Kexy Biscuit <kexybiscuit@aosc.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 19, 2025 at 2:41=E2=80=AFPM Yao Zi <ziyao@disroot.org> wrote:

> > Which is fine if the pins actually cannot be used for GPIO, but if they
> > can, and this is just implicit for unconfigured pins ... then add
> > functions and groups for GPIO.
>
> For 2K0300, we want these pins to be able to multiplexed as GPIOs, but
> since this pinctrl driver could configure nothing for GPIO mode pins, I
> think it's enough to implement only the gpio_request_enable() callback
> and do the multiplexing work here, is this correct?

Yes that is the quick and elegant solution.

> I originally thought it's okay to multiplex pins as GPIO with an usual
> pinctrl configuration, and didn't realize that it causes conflicts on
> strict controllers since the pin will be claimed by both pincontroller
> and GPIO controller. Thanks for the reminder.

This is true as well, some drivers use an explicit "gpio" function
and for these the the new .function_is_gpio() callback is especially
helpful.

I think it is helpful if you're using the callbacks too (we can
determine if we're already in GPIO mode) but it's not necessary.

Yours,
Linus Walleij

