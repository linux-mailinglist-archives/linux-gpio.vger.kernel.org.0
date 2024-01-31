Return-Path: <linux-gpio+bounces-2849-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CE984493E
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 21:56:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 967801C21CAE
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 20:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B798038DD2;
	Wed, 31 Jan 2024 20:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G1+wMIIJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EAC38DD4
	for <linux-gpio@vger.kernel.org>; Wed, 31 Jan 2024 20:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706734568; cv=none; b=dhbPIrihzQPODu2Xd13SotZGiy5Ztaa0gCdOnOlVGN7LfQ7X/CFSvsjh6Ckr0BNFw18oiJ/eQf26qd6rIfoQXZf0QPwAoeVrFvJTE7shlO5Ahp2omO8ur1mgY/auh1ysAKA1aqNvpzFl4RIeDVU01e20W/hmS1cMxBtj2bxrnug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706734568; c=relaxed/simple;
	bh=SN8BqaoqK4IhvOPgDP2RdQxe6JgLeGUnxbb+hDI6eKI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c+/o6h1wrRATxJ/DConUHvounqlbkHJoQy8HHjfnloc7LulaAAKAIIMC9EcYjxuhqY2hMLJlGkZUO9kPPSPFF3t6N8IQy+aQTZdfk0FHrErlh4LsMGXVURXdrZBEK5srMu04S/93VubBdud0MHt76kDjn3MFytDS1hXBuwwJdWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G1+wMIIJ; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-60406302a5eso2393747b3.0
        for <linux-gpio@vger.kernel.org>; Wed, 31 Jan 2024 12:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706734564; x=1707339364; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F7hyd0uUWhkbaFe/33mIS/9rt+Zgy9D3j/1s4opCgVA=;
        b=G1+wMIIJIU7EHJ6Og+6RLOHz5Oq7bJJZzdngxPfE+D+l1rbrZneMFjhsnQoVe6n4wW
         BqReeI164HGr4joyYJblNT/2NmchMOS9jhi7lRivQ+fFlykiPKAaYGPL4rydmf58NQSd
         HhmnQGOWFvraor9flr7N/7lMLfsfBF5+8hpYuwfp9NS+9TBErT3q+nXa2rNtr59oqm00
         1NoRvK35Jgy4zs6mxK088X5ZaIQ7pczl6Sy/qeriJsAPBIK7yHd8WVt9DqHFZ94mzr27
         ituI3qc+cwZGzWzqS12A0SybqPK42F6IzoyxLbPNOoenFy+r8b8uBxrFM2I+E29HAZgC
         kYqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706734564; x=1707339364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F7hyd0uUWhkbaFe/33mIS/9rt+Zgy9D3j/1s4opCgVA=;
        b=bE3oTiGVDj6G8NYUWXeA5WMBR6pdGqUREM4IHa2O07umBbIhWR3izhC60FkdWZKyFH
         VjNIyv2tVLvQd8Q+RWdyUrUIDsukAS/A9rWsNPCpXSmWZwTelHphit5HwmVcWw9+5Pu1
         G/V4F5h8ii8KE81hgbqiar5GXVcK21f1Vz9b70bOxWAjO/5DAGYiGoHgKRzvUyEVSkys
         gvxFbui/USataIIXdtqtNio4YBFpYEEVUPfL257qXZNA6HhyEG5O013tOBQt8wVaC3rm
         9wCHRufA2HmyfYbFd1DEkUIOfkNyDjM6jDsfH+GHbV/YDEu0dDq2KEKAgbG0DtgNn8TN
         7sqQ==
X-Gm-Message-State: AOJu0YxP1goYdH1dWxfSdZTUqMmnaU96dLQgJVga0xlenUFqtWllnuoQ
	JpMbe1Mjvxp9XFH6qjYkfxLaPY2K70LelS7NkJ3xTuDt4uqTMXteneTxZi6mgJVqAbZxCMvJbXF
	0vVQOMjh+fQqgbQVAk9s54MAX40hGPHXJ4gfTAw==
X-Google-Smtp-Source: AGHT+IFJ/1xZgCSwoaduRMuAwfRIZptre9CM/jzrBsxgmGVbsa52bCGEib3ffEWOgkTlCCPbnjv9iZn0wOW7R+22/YA=
X-Received: by 2002:a81:6c97:0:b0:5ff:956d:8b7f with SMTP id
 h145-20020a816c97000000b005ff956d8b7fmr2745745ywc.10.1706734564562; Wed, 31
 Jan 2024 12:56:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240131-mbly-clk-v4-0-bcd00510d6a0@bootlin.com> <20240131-mbly-clk-v4-10-bcd00510d6a0@bootlin.com>
In-Reply-To: <20240131-mbly-clk-v4-10-bcd00510d6a0@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 31 Jan 2024 21:55:52 +0100
Message-ID: <CACRpkdZvj2E1zfSU1RGY2+_6sCCYxu=pbQ0yv+-bmTLGzEyFwg@mail.gmail.com>
Subject: Re: [PATCH v4 10/18] pinctrl: eyeq5: add platform driver
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Philipp Zabel <p.zabel@pengutronix.de>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, linux-mips@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Theo,

thanks for your patch!

On Wed, Jan 31, 2024 at 5:27=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@bootl=
in.com> wrote:

> Add the Mobileye EyeQ5 pin controller driver. It might grow to add later
> support of other platforms from Mobileye. It belongs to a syscon region
> called OLB.
>
> Existing pins and their function live statically in the driver code
> rather than in the devicetree, see compatible match data.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

The driver looks very nice and is using all standard features, I'm pretty s=
ure
we can merge this soon.

> +static void eq5p_update_bits(const struct eq5p_pinctrl *pctrl,
> +                            enum eq5p_bank bank, enum eq5p_regs reg,
> +                            u32 mask, u32 val)
> +{
> +       void __iomem *ptr =3D pctrl->base + eq5p_regs[bank][reg];
> +
> +       writel((readl(ptr) & ~mask) | (val & mask), ptr);
> +}

This is in practice a reimplementation of regmap MMIO.

Can't you just use regmap MMIO to access the banks then...?

Maybe it doesn't add much here. I'm not sure.

> +static bool eq5p_readl_bit(const struct eq5p_pinctrl *pctrl,

eq5p_test_bit() maybe? that describes better what the
function does.

> +                          enum eq5p_bank bank, enum eq5p_regs reg, int b=
it)
> +{
> +       u32 val =3D readl(pctrl->base + eq5p_regs[bank][reg]);
> +
> +       return (val & BIT(bit)) !=3D 0;
> +}

Maybe add a check for bit > 31?

> +static int eq5p_pinctrl_get_group_pins(struct pinctrl_dev *pctldev,
> +                                      unsigned int selector,
> +                                      const unsigned int **pins,
> +                                      unsigned int *num_pins)
> +{
> +       *pins =3D &pctldev->desc->pins[selector].number;
> +       *num_pins =3D 1;
> +       return 0;
> +}

One pin per group, also known as the "qualcomm trick".

(It's fine.)

> +       mask =3D 0b11 << offset;

That's pretty nonstandard but it's quite readable so let's keep it!

Yours,
Linus Walleij

