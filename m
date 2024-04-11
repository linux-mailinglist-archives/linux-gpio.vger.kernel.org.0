Return-Path: <linux-gpio+bounces-5335-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DD36D8A0AC1
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Apr 2024 10:00:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9430F1F230FC
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Apr 2024 08:00:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9948F13EFFF;
	Thu, 11 Apr 2024 08:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bElwz7Tm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3898C13E8AD;
	Thu, 11 Apr 2024 08:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712822416; cv=none; b=SaES5X7RfGM412Vg7q7Mq2M4CUEu2Oeapn5lHRoEB0GFvRoF6RyA0KN32esKNv1p9nq2pzLZKSBNXOBwLs9Mt5JBwc/Pz03nHfSgtP/FPrAd3La2nHNOjqsDs4nGhxLwcCOYXlh+tdHxD0eQDQwpXkpV3/P55ocn9ReJRd53yEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712822416; c=relaxed/simple;
	bh=waEt8fKtfTAHPrtNAXCwzW9ODp2LwQ41zoYR/MtoFg0=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=ZrWTAASFhYgRoFCgRKQPG7u1/b0RVDPxTvDUaP8rL4pLTnkIRyrZpm0bDp9Ibc6FmY69QmbnR4IiSziqIXw3p2IhFplEuRBC3FgQYuwzXE/o0CagHgj5rksdl7PP0NCtpvfAc/6InMmBIODYINwhxHcrwvq9zq9/qwavN+00Q58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bElwz7Tm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97C3FC433C7;
	Thu, 11 Apr 2024 08:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712822415;
	bh=waEt8fKtfTAHPrtNAXCwzW9ODp2LwQ41zoYR/MtoFg0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=bElwz7TmiuY0Qzn2A4CYKyVm6jRxsPz9fLs3tgdB5vbkfrFqq/CvpYY+HiqvhvcWw
	 lqtS7Dsd7UV0xkKAnYzrbfp+De5XTarO7RjpWMJXiZzzs4K0klARaTsx7eta1gBAOb
	 WeCh5Pt0hpJbL/YwkNUT3ZG70LkqMnsyzFK/z4XK2FQNILTpQQf/RqjV6GAN9nEK39
	 zViN+RjWkiJ4qdKDYzT6kEAcwCIq30WgrhGNr1z4TmyfaFL8gSPdSaQl5igSG2cN/W
	 HXq6s6AOx3f1Qfg7vP62R6amtAeVDLyJjLMqgR4JhYR9sf+JJwQJT98faBihwRB+MK
	 ntBtZB0ML9u5w==
Message-ID: <3838e4684f98e1ce3818bfb6983844bc.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240402-pxa1908-lkml-v9-5-25a003e83c6f@skole.hr>
References: <20240402-pxa1908-lkml-v9-0-25a003e83c6f@skole.hr> <20240402-pxa1908-lkml-v9-5-25a003e83c6f@skole.hr>
Subject: Re: [PATCH v9 5/9] clk: mmp: Add Marvell PXA1908 clock driver
From: Stephen Boyd <sboyd@kernel.org>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, Karel Balej <balejk@matfyz.cz>, David Wronek <david@mainlining.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
To: Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley <conor+dt@kernel.org>, Duje =?utf-8?q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, Guilherme G. Piccoli <gpiccoli@igalia.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, Kees Cook <keescook@chromium.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Lubomir Rintel <lkundrak@v3.sk>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, Tony Lindgren <tony@atomide.com>, Tony Luck <tony.luck@intel.com>, Will Deacon <will@kernel.org>
Date: Thu, 11 Apr 2024 01:00:13 -0700
User-Agent: alot/0.10

Quoting Duje Mihanovi=C4=87 (2024-04-02 13:55:41)
> diff --git a/drivers/clk/mmp/clk-of-pxa1908.c b/drivers/clk/mmp/clk-of-px=
a1908.c
> new file mode 100644
> index 000000000000..6f1f6e25a718
> --- /dev/null
> +++ b/drivers/clk/mmp/clk-of-pxa1908.c
> @@ -0,0 +1,328 @@
> +// SPDX-License-Identifier: GPL-2.0-only
[...]
> +static void __init pxa1908_apbc_clk_init(struct device_node *np)
> +{
> +       struct pxa1908_clk_unit *pxa_unit;
> +
> +       pxa_unit =3D kzalloc(sizeof(*pxa_unit), GFP_KERNEL);
> +       if (!pxa_unit)
> +               return;
> +
> +       pxa_unit->apbc_base =3D of_iomap(np, 0);
> +       if (!pxa_unit->apbc_base) {
> +               pr_err("failed to map apbc registers\n");
> +               kfree(pxa_unit);
> +               return;
> +       }
> +
> +       mmp_clk_init(np, &pxa_unit->unit, APBC_NR_CLKS);
> +
> +       pxa1908_apb_periph_clk_init(pxa_unit);
> +}
> +CLK_OF_DECLARE(pxa1908_apbc, "marvell,pxa1908-apbc", pxa1908_apbc_clk_in=
it);

Is there a reason this file can't be a platform driver?

