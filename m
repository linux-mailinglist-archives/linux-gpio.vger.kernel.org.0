Return-Path: <linux-gpio+bounces-13039-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8330C9C9543
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 23:38:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F1621F23058
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 22:38:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A55371B3956;
	Thu, 14 Nov 2024 22:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h5E96mHB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504871B3949;
	Thu, 14 Nov 2024 22:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731623852; cv=none; b=bJ/pR87YYBdi8UFaHUY457qjFuXlrZIwbJT1Vs9Vi0c66Whtk4f1pZxxkXBvd8Nqs6egASZITvAB9LHES44O/+9G1ugu5a2bYq3lC2vcf90639QMgT1Eh8DPmOfdQ4U2DHsEwPNxcYqRu4vfqkX3EHkYDjCWA1a4+PFNtY25ED8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731623852; c=relaxed/simple;
	bh=jgfv88l0pkkQROxiMEECHApj7OBPMmgs9Sc7Um3nOVo=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=RAPM7kKQO8lnjAP7xmeSyiL4YfQWmJm4Hw30npSz7DH8MGo44oJZtzU6yBVn1W5fWUmZ9hBP+pFUNrqvAsGPjA7i09i730h86k6KjsF8ujzVeXDx6eZi37iHK8kCEs9Mh8kIliYbGF/KgYdy1LtLauJ/xP+ssPdXr7nbNEBNu3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h5E96mHB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAF9EC4CECD;
	Thu, 14 Nov 2024 22:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731623851;
	bh=jgfv88l0pkkQROxiMEECHApj7OBPMmgs9Sc7Um3nOVo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=h5E96mHBaVfC3StuUkyOqE9mzUbLWkWLMZyTdbHbtrGxK0/wcoHjCwEXiSiicaahZ
	 kpWMqdADtOj19PSiNZQIOi8kQ6jjnmoFhL3Em9KPORK4iJJqFdyVI6ctVAZ1DnZEXc
	 KMFsyXh3QqaskukEsx7/PPxw3en/ud261+/uyE4YlxJU9zm2xgluVIDxK/dzYWHU+F
	 mgss9jVW/Fpo101mfp4pWiVW76K3X66xn9tYlnejGGiit8yZS4lBzZITt/UTsFnExn
	 sKpLGn/SWZg+c94Q+FOwptFahRLJazhUSYhgQJzI8zydPfVxGZpzwbjlebJBTZ7kvt
	 2w2YnFEviGsgA==
Message-ID: <9cdfdae176bf25831f0500abd2d0699e.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241104-pxa1908-lkml-v13-8-e050609b8d6c@skole.hr>
References: <20241104-pxa1908-lkml-v13-0-e050609b8d6c@skole.hr> <20241104-pxa1908-lkml-v13-8-e050609b8d6c@skole.hr>
Subject: Re: [PATCH RESEND v13 08/12] clk: mmp: Add Marvell PXA1908 MPMU driver
From: Stephen Boyd <sboyd@kernel.org>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, Karel Balej <balejk@matfyz.cz>, David Wronek <david@mainlining.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
To: Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley <conor+dt@kernel.org>, Duje =?utf-8?q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, Duje =?utf-8?q?Mihanovi=C4=87?= via B4 Relay <devnull+duje.mihanovic.skole.hr@kernel.org>, Haojian Zhuang <haojian.zhuang@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Lubomir Rintel <lkundrak@v3.sk>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, Tony Lindgren <tony@atomide.com>, Will Deacon <will@kernel.org>
Date: Thu, 14 Nov 2024 14:37:30 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Duje Mihanovi=C4=87 via B4 Relay (2024-11-04 08:37:10)
> From: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>
>=20
> Add driver for the MPMU controller block on Marvell's PXA1908 SoC. The
> driver is incomplete, currently only supporting the fixed PLL1; dynamic
> PLLs 2-4 and CPU/DDR/AXI clock support is missing.
>=20
> Signed-off-by: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>
> ---

Applied to clk-next

