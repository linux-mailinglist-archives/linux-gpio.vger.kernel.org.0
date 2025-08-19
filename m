Return-Path: <linux-gpio+bounces-24534-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6463B2BE7A
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 12:07:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 938A8621351
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 10:04:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E28B02749C6;
	Tue, 19 Aug 2025 10:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e/dJJhRz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9A631CA60
	for <linux-gpio@vger.kernel.org>; Tue, 19 Aug 2025 10:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755597758; cv=none; b=OuCYC7VmweR9wrhxHRNdTdWe0ZwqQkxIzxqUU6w4B2jNBzlYgPVIZ/W4vWXplJgwH0aR3oA89XS996mGnyv0+pGjmmvZAhJx8HCYIwKyEudJqt3WrO7mbdFeM96DZFCzVhChMfN/SkFGeNg8qav4TCH7zyVHFKr14S59uEvWaCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755597758; c=relaxed/simple;
	bh=2oRJmy6jdudOx3Q3CK1t3Tr8AwssA1mqdMSyvD/J694=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o9VAk+s52hj+AcdaGifTrZ+Kp6vUuDa6CPpYZHTJRi4qE4dSKLIUDzJ5evBTb89d697bsj33gJKPTmP4rnu1+EV1mG9zunGT3avjRg/GWjdqGsAYDDxqTriQBFYbFEVjS1Wrhy9BKXywY22qFzBa0UJW9zp8VFV7+hhCQWCLMQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e/dJJhRz; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-333f90376a3so35581291fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 19 Aug 2025 03:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755597755; x=1756202555; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jEIclbjfDHmWiMYwu7S7lb6mGq8E/UEDhqSMVO/QBNA=;
        b=e/dJJhRzz1jnTLk8ddHqa2XmLp+jJ+Df0foCAEM2JCLb6a61ooak+5fPVLmFDtkRIi
         RYsasorV+IcV78wOZzGj3rj6PnToK/HwvJSvd+/o2szeFD3Fe6Q88p6Q8H9T7Bsdyg+O
         HGrz3GlCbYe/Ia1lyT7JCKhvtlXA6F+PFAjxvUqwOHn2Fqadko+VXj5Wk1Afl5gg4xE7
         99QIenlG7q6w5Ic0uRJrsrLEiTDENkRmAJDYACMf48CSAIAiOMfEO98leX8maFjseN5P
         vw22O2vG7iXNsqwqPxaSKXTgONu+QqqtmwqOFJfQ2JooH9GduM7om55eytr/ZAS7yQrk
         +xkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755597755; x=1756202555;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jEIclbjfDHmWiMYwu7S7lb6mGq8E/UEDhqSMVO/QBNA=;
        b=mpnlLznIMHP9+VsZ2VKUc7iNrfkA2U0A/fgLw9l8kjwRw7ZJvLi1pd+hgOkVoSyuB2
         YF4YYBeVT39sM5nQ0RHK0aJ/yY1GvanU2RYnPSeN54BFj3BB5qnwg0DPW6TV+e+TotBZ
         0+b2qyavAUizJNRWgfUDiZbu9PDz+LD7Iy9rEd+B+PLTDryWXh0mzChthUuSWQaDs6EV
         8XboeAWztOzoAKKyX5yV/G9f5YPJYnQgcdNICDiA6RGGE6o+XqXkRPghGjRgYagUgk0r
         Nen9Np8x6kNuppEv4llSjGDhDDWOBfE2oBwknug3NAMzityqBbxK5QCBIRnag7i3Ep2W
         yCRw==
X-Forwarded-Encrypted: i=1; AJvYcCXXKB5svr2mRkZhnDcFRVspIJECjCYhyE+zTxZVEJJBOSoHrcQsrHCopHw4HQ1Ta3AInRdSorvhUCLO@vger.kernel.org
X-Gm-Message-State: AOJu0YxaYWiLGIK1OAR8tOITVn3nL2kYWZR85s2MEawDInrtBkfpixUg
	aR6TWhTTbKWXWgwB0ZLF7Z6/tZF755HwJ6l/nKMug9dbeKEAOWAU0vLxtU5zI/Aoze6p5iVf5mi
	qmySq3dlG1ioX/N7ermw2+YfwxhyPtVgQcU+MO78bPA==
X-Gm-Gg: ASbGncsi3vhxrSfu3FFMA5lLbvqUoQG7HogcG3ZbmcWZhTQ29vySI5sP6JE4d1kzO3n
	BjgQ4CPjg7pv6m53VgR5XUkoCowIx18XddyftWte2Ng2cfvFlKCGBn68xLnsjOIzmKTiaMnwYok
	F3xAvP7iJSI3rWohpLOH8ogzSRa99cUz342MeOJfNXMkErFOcQ+WH0Pb0pJtXVkhYE7+PUkhEnE
	mMyVRg/LGNA
X-Google-Smtp-Source: AGHT+IH/19oUBfRxFr8epug82uJ7/HieWJyUVlBhoMvAFaMluZmkd3UN9bc0BKENYULFNtqg/fXi8MkFaQZgBnal9yQ=
X-Received: by 2002:a05:651c:4199:b0:333:ac42:8d6a with SMTP id
 38308e7fff4ca-335304ee6damr4961591fa.3.1755597754935; Tue, 19 Aug 2025
 03:02:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250811163749.47028-2-ziyao@disroot.org> <20250811163749.47028-4-ziyao@disroot.org>
In-Reply-To: <20250811163749.47028-4-ziyao@disroot.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Aug 2025 12:02:23 +0200
X-Gm-Features: Ac12FXx1atQmH6QeSnrDLNRud94fhJMECrA9TaInUV_M5vUWxhGJhif4Q5spxjg
Message-ID: <CACRpkdZp8FLrxgkeZ=xzSPgny51iDZ3KRCrxpoSdgF8_=df=KQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: ls2k0300: Support Loongson 2K0300 SoC
To: Yao Zi <ziyao@disroot.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	Mingcong Bai <jeffbai@aosc.io>, Kexy Biscuit <kexybiscuit@aosc.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 11, 2025 at 6:39=E2=80=AFPM Yao Zi <ziyao@disroot.org> wrote:

> Support pin multiplexing and drive-strength setting for Loongson 2K0300
> SoC. Pin multiplexing could be done separately for each pin, while
> drive-strength could be only configured on function basis. This differs
> a lot from the driver for previous generation of Loongson SoC, where
> pinmux setting is based on group.
>
> Pins are represented with pinmux properties in devicetrees, and we use
> the generic pinmux API for parsing. The common pinconf interface isn't
> used for drive-strength setting, since it handles pinconf settings at a
> unit of pin groups or smaller.
>
> Instead, the driver configures drive-strength settings just after
> parsing the devicetree. The devicetree's structure ensures no conflicts
> could happen in drive-strength settings.
>
> Signed-off-by: Yao Zi <ziyao@disroot.org>

Overall the driver looks very good, well done!

Look into Rob's comment on the bindings to use a single node
for mux and config.

I saw that you want to make the pin controller strict, if you also have
some pins with "GPIO mode" that will serve as back-end for a
GPIO driver (and I saw you posted a GPIO driver series as well)
then have a look at Bartosz recent patches to add infrastructure
for pinctrl to know about what a GPIO pin is:
https://lore.kernel.org/linux-gpio/20250815-pinctrl-gpio-pinfuncs-v5-0-955d=
e9fd91db@linaro.org/T/

The current driver does not seem to know about any of these
pins being usable as GPIO and does not implement those:

        int (*gpio_request_enable) (struct pinctrl_dev *pctldev,
                                    struct pinctrl_gpio_range *range,
                                    unsigned int offset);
        void (*gpio_disable_free) (struct pinctrl_dev *pctldev,
                                   struct pinctrl_gpio_range *range,
                                   unsigned int offset);
        int (*gpio_set_direction) (struct pinctrl_dev *pctldev,
                                   struct pinctrl_gpio_range *range,
                                   unsigned int offset,
                                   bool input);
        bool strict;

Which is fine if the pins actually cannot be used for GPIO, but if they
can, and this is just implicit for unconfigured pins ... then add
functions and groups for GPIO.

The other driver using pinconf_generic_parse_dt_pinmux()
drivers/pinctrl/meson/pinctrl-amlogic-a4.c has GPIO awareness.

Yours,
Linus Walleij

