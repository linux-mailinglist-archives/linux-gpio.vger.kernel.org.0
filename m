Return-Path: <linux-gpio+bounces-14317-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6461D9FD5FD
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2024 17:34:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 124E7165845
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2024 16:34:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9A6C1F7580;
	Fri, 27 Dec 2024 16:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XhbKLRoV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDC2446A1
	for <linux-gpio@vger.kernel.org>; Fri, 27 Dec 2024 16:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735317291; cv=none; b=R2KE8xuv8rFlBHoJfqJrzlPYlAJ+IkureK61Eas+wsYMBzRovXaZencaonTmPYKJJIGfIWhpyKs1L4I97Hih6e+K83JTHGoPAGQUU5aLexOk8XwzCS9D+XOyHCI4/z5c60E0YpAEwP6DIm1dLTpbT+u+YvdqKMb3ktLxmixxcZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735317291; c=relaxed/simple;
	bh=PmkOXvBdbDaU20lQ8+3PhioDTFBuRO+YRWDTmCjdKt0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GcQVQh6S5ZGQO4hhuRwFQz8qY13IvJY7kvn7irflucUf5nTMK4wiNtsK0N1PgqbrZBHj/Ll5aPI2rhRe/782xNr1d8niuihroeU5OHp3PbfhqVs4j19jtuAdW0p7yBgaL3g41+SuN/+E/15hbn69ewBJvJ/YQpQgWPIPq38MNV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XhbKLRoV; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53e3a37ae07so8024813e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 27 Dec 2024 08:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735317288; x=1735922088; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8slS+fVOfiBLyjC+6dHOYmEDiQMdL34iQQiuNik54ZE=;
        b=XhbKLRoV17xUG6Yqps1Qr/PjlyEOEo+a/yov9GGcq0t/mEDocI0DCWD0Vn0J2ANti/
         ogehaaLENw+i2s9tEUiXSSxZnEMqlAt45slDrGNI3/jUW5uiHB+XsNQRuU0QKpn5IRV9
         arDx1pFhKr4rIRYy6Uqtn6BL7PSiPiET82rPQxmeTgzlBjpoO4oMD4RqTz7E80WF2beA
         vhof73VzRQi+xUnL2uZsG0EloCy78DJ3lHhj+kjKhdSoy/ME9TNa2E7N70/n0SPRNDaI
         5cYissCYjS5urA+qo0aaXaDefj6BATxKlAHfNeCeH4+1x8R4l+VP8Fcf05ve78brhRO/
         eBjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735317288; x=1735922088;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8slS+fVOfiBLyjC+6dHOYmEDiQMdL34iQQiuNik54ZE=;
        b=NF61YWzJYWzKi9I0xX+C9uHX158CONhoSApAlqhNuIgPs2+pbB2aCbV7TwjYzuJmdj
         wJGTGxdKPZpfhlNLW9t0+A/bpKqEKiHGNs4LLbPNcuDsMmu/oqxGLvK62TzvA5fJlncp
         w9rMdc9/ahM1UMNIxaavfBGI7Uih7Sl/Z679ybIDwbHH+AoA1q9/uU8PoPvUhBbeKgis
         Ys3drrV+yoWriaj4BoXpTQHhzyp0X2koFvT1VVKizhP5CuQ8oHKMnM3AO11TtUHz5LEg
         GJE73hQuuNl8JEU4OVSjJBGCQvlwZZaL+0UOGVvHFg850pYnC5G+vTT4VGSqCa86fs4q
         0HGg==
X-Forwarded-Encrypted: i=1; AJvYcCX+Dq5NokwfPEHhgPXIWHUqpRnMM+CXCDVO6Mmr+Se+l0+tZd4CFe1/XVvFOLFmPCsA4hGdBWIVAYkB@vger.kernel.org
X-Gm-Message-State: AOJu0YwbN/uK7BZyoyc0l+pU+Dgyzf7hUb2MVFQf0iQr3ioYxcyQ4u4F
	XeWt5zs1WaMfGeWyCHy2If0dXHr0PfUk5pfSr+v2RaCmkzn92RLacjD5HW5csWgwhk0Rz/+6kat
	qfsYuvoymUrEaHR+AtQK7bqTMPN/hcxZYLQEWlec3pk8n9jTDsa4=
X-Gm-Gg: ASbGncvt3n5pF7hQ9zXvlMs3yPHQpDNGQ1NOX6uuoBD7D0J+XeeHvpIsy8dcywqiY+x
	RxDxEhkQU2LcOE52B+OZg0zs2bAZhCwReNwxs
X-Google-Smtp-Source: AGHT+IFKcJ0e6+Y7yFc5JdvYtyFElA1kRTbxJ9s2rI8zNUXsWpTXr/ByNHm3P2n/+XL7rUtIOMimAHQYo2dLityB/nk=
X-Received: by 2002:a05:6512:6512:b0:542:297f:4f68 with SMTP id
 2adb3069b0e04-542297f4fcdmr5265487e87.0.1735317288016; Fri, 27 Dec 2024
 08:34:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241225-03-k1-gpio-v3-0-27bb7b441d62@gentoo.org> <20241225-03-k1-gpio-v3-1-27bb7b441d62@gentoo.org>
In-Reply-To: <20241225-03-k1-gpio-v3-1-27bb7b441d62@gentoo.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 27 Dec 2024 17:34:36 +0100
Message-ID: <CACRpkdZPD2C2iPwOX_kW1Ug8jVkdHhhc7iFycHtzj5LQ0XWNgQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: gpio: spacemit: add support for K1 SoC
To: Yixun Lan <dlan@gentoo.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Yangyu Chen <cyy@cyyself.name>, 
	Jisheng Zhang <jszhang@kernel.org>, Jesse Taube <mr.bossman075@gmail.com>, 
	Inochi Amaoto <inochiama@outlook.com>, Icenowy Zheng <uwu@icenowy.me>, 
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 25, 2024 at 1:33=E2=80=AFAM Yixun Lan <dlan@gentoo.org> wrote:

> The GPIO controller of K1 support basic functions as input/output,
> all pins can be used as interrupt which route to one IRQ line,
> trigger type can be select between rising edge, failing edge, or both.
> There are four GPIO banks, each consisting of 32 pins.
(...)
> +description:
> +  The controller's registers are organized as sets of eight 32-bit
> +  registers with each set controlling a bank of up to 32 pins.  A single
> +  interrupt is shared for all of the banks handled by the controller.

I looked at the driver and came to the conclusion that it's better to use
4 different instances of the chip, one for each set of 32bit registers,
so these 4 GPIO controllers are instantiated separately.

The operating system can handle the shared interrupt, there is no
need to use a single device instance just because the interrupt is
shared.

DT bindings are operating system neutral, but for example in Linux
(if we pretend this is just one possible example) then a driver
handling a shared IRQ can be requested with the flag IRQF_SHARED
and the driver can just return IRQ_HANDLED if it handled an IRQ
or IRQ_NONE if it didn't handle the irq (so other instances can
handle it).

Yours,
Linus Walleij

