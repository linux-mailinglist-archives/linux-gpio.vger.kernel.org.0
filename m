Return-Path: <linux-gpio+bounces-23063-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 991D2AFFB4F
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 09:48:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A39081C83790
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 07:49:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9873928A719;
	Thu, 10 Jul 2025 07:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Vk43m7rp";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="NQl9a9qS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C8A1F1313;
	Thu, 10 Jul 2025 07:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752133717; cv=none; b=ZK+OWyM04ay5+DUHfrcJ5yjETjBcKvsdWOEBlHT+gKM6Ft91mduJvmXDLFmjOKb8XARI6k8RrXpyWlA7BqjUhbKyEL6DDsn6lqMlHMwtBaCSJvttrIWNsGxPSypflp0rEhSQusswmTq4A9u3odb+cj4zmDrbm/WlI296T58R5Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752133717; c=relaxed/simple;
	bh=NrxJi9mtfyDGqO728dsGOwO3Lk8FmcnbL6fsms/datc=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=sydzqFuovseNy5nDIZZtBzDyJQ/qcBgipZ15x6YXdjuoXMBe3bePqEaaks/9BaZM2k7wtt47CXKzVWGjEzcPyfYZKsoupAGFQqqYjcywKAI3vF1x6iCStgA///Weo4zJtyNvtQ7ysPgGIDWu5fDgPLV1nHPq+ACO/C3KLkcrKJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Vk43m7rp; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=NQl9a9qS; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 89DD01D001AA;
	Thu, 10 Jul 2025 03:48:32 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Thu, 10 Jul 2025 03:48:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1752133712;
	 x=1752220112; bh=VFGB/39PUQRNUuopd0MS0kGVSVfgQHVyMjplY4VKnOg=; b=
	Vk43m7rpatUNVCIm/eUsqs4Ivfk2UAWEuI+3QdpF6tq/2p2Lh+ghW7sXZwf7ePRP
	lp1BH169XV5kIeDOARAgRA1RkWeVcUsv5pGboRcW25/sB+En4ZlTAFgBwWAqCEBZ
	N9xOxBE2ykDt0nVZlO/n22T/8p5uvUXSFGRb9RaHZfatZP18GgfRuciyDsrhcmbm
	T5izMMofJ6sb6QNuY6GAVceWyMpZNCLpIMpkhU9qE5hSwxNe2bS34pCqadzKGk3V
	B3aEQ378TjhU+DW3V7s5SRStGQvK8NOuqvkX5LHnL2qTCskFnh+RZWKx+s7ySJDf
	A4UYNGq8sf1naJ1hGcTAmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1752133712; x=
	1752220112; bh=VFGB/39PUQRNUuopd0MS0kGVSVfgQHVyMjplY4VKnOg=; b=N
	Ql9a9qSupN5QGTE+AgKygTP9In0dw1wIlfecsFJ11CmzNeXW44dST/zm5C5AUR2b
	iSSmoJ0E6wL/POomU+JF0IfWJEsWhwtmfvVq1Pxt6gUz4jHWE49Zepy0+KHEfR88
	698DKrgkzF5BR+Y5zvGYmiaSORLqleZ/IzjJJqF3iJ2YA/QHfap8g84DpKZjMYPi
	JOnnhgsF8Kilim/YzjuZGNPt43Ds0VSBrXOBLPhDwJ3x7baR0v3jfUTZ9Qg99LKL
	DcAC30i6Ohxdg1j9FLowUyK3DEhVPGivjApMA+aYkfmgGmkd7fO1EXEqbAa2b5Pj
	/rp61DMIPZWEGWMnrRsjA==
X-ME-Sender: <xms:TnBvaFCPUNXTh3IvTOxOLzdDHNHZNRbcvlNXqh5rRJbrXGkNso61Bg>
    <xme:TnBvaDgBxfku5Iv_jnwEfXQWOxZj7ezk_uh2m_oMLc8idRJhArJNus_I6hZ3EKQqv
    G8LwwXBAqKoRUK_sRc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefleekkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeefjedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtph
    htthhopehjvghsphgvrhdrnhhilhhsshhonhesrgigihhsrdgtohhmpdhrtghpthhtohep
    lhhinhhugidqrghrmhdqkhgvrhhnvghlsegrgihishdrtghomhdprhgtphhtthhopehmth
    hurhhquhgvthhtvgessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtohepghifkhdutddu
    feestghorghsihgrrdgtohhmpdhrtghpthhtohephhhgkhhimhdtheestghorghsihgrrd
    gtohhmpdhrtghpthhtohepkhgvnhhkihhmsegtohgrshhirgdrtghomhdprhgtphhtthho
    pehkshhkgeejvdehsegtohgrshhirgdrtghomhdprhgtphhtthhopehmihhnghihohhunh
    hgsghosegtohgrshhirgdrtghomh
X-ME-Proxy: <xmx:TnBvaGptIpdFPbsUo13BNf8hpBhqyqysy3fq_yWLHl13xPdF6tSqxA>
    <xmx:TnBvaGe9Vhef7xcrOIfQrP9rdJviWHKY6trwBHqDzDAQFB2ePiR0gA>
    <xmx:TnBvaM9YcmmE4mbvyo2Gkxwpd7nYsDvTmU_J2YlrV-Dqs2KmNiNmLw>
    <xmx:TnBvaHGUb8p777hi5CV08Iy0wnhXfH-l5giCPKNtmAy72YNH5WICTw>
    <xmx:UHBvaOxDqHidI8CwbxD1Qo4ftx7FkbIJU0nBSF2y3Yd3Sf3_svEj6zLU>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 8E75D700065; Thu, 10 Jul 2025 03:48:30 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T040df5ea49d69849
Date: Thu, 10 Jul 2025 09:48:10 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: ksk4725@coasia.com, "Jesper Nilsson" <jesper.nilsson@axis.com>,
 "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Sylwester Nawrocki" <s.nawrocki@samsung.com>,
 "Chanwoo Choi" <cw00.choi@samsung.com>,
 "Alim Akhtar" <alim.akhtar@samsung.com>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Tomasz Figa" <tomasz.figa@gmail.com>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Ravi Patel" <ravi.patel@samsung.com>, "SungMin Park" <smn1196@coasia.com>
Cc: kenkim <kenkim@coasia.com>, "Jongshin Park" <pjsin865@coasia.com>,
 "GunWoo Kim" <gwk1013@coasia.com>, "HaGyeong Kim" <hgkim05@coasia.com>,
 "GyoungBo Min" <mingyoungbo@coasia.com>,
 "Pankaj Dubey" <pankaj.dubey@samsung.com>,
 "Shradha Todi" <shradha.t@samsung.com>, "Inbaraj E" <inbaraj.e@samsung.com>,
 "Swathi K S" <swathi.ks@samsung.com>, Hrishikesh <hrishikesh.d@samsung.com>,
 "Dongjin Yang" <dj76.yang@samsung.com>,
 "Sang Min Kim" <hypmean.kim@samsung.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@axis.com, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, soc@lists.linux.dev
Message-Id: <5494bedb-6907-43dc-8580-04ef1e47c8d0@app.fastmail.com>
In-Reply-To: <20250710002047.1573841-15-ksk4725@coasia.com>
References: <20250710002047.1573841-1-ksk4725@coasia.com>
 <20250710002047.1573841-15-ksk4725@coasia.com>
Subject: Re: [PATCH 14/16] arm64: dts: axis: Add initial device tree support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Jul 10, 2025, at 02:20, ksk4725@coasia.com wrote:
> From: sungminpark <smn1196@coasia.com>
>
> Add initial device tree support for Axis ARTPEC-8 SoC and Grizzly board.
> This SoC contains four cores of cortex-a53 CPUs and other various
> peripheral IPs.

> diff --git a/MAINTAINERS b/MAINTAINERS
> index fa1e04e87d1d..371005f3f41a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2320,6 +2320,20 @@ F:	drivers/crypto/axis
>  F:	drivers/mmc/host/usdhi6rol0.c
>  F:	drivers/pinctrl/pinctrl-artpec*
> 
> +ARM/ARTPEC ARM64 MACHINE SUPPORT
> +M:	Jesper Nilsson <jesper.nilsson@axis.com>
> +M:	Ravi Patel <ravi.patel@samsung.com>
> +M:	SeonGu Kang <ksk4725@coasia.com>
> +M:	SungMin Park <smn1196@coasia.com>
> +L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> +L:	linux-samsung-soc@vger.kernel.org
> +L:	linux-arm-kernel@axis.com
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/clock/axis,artpec*-clock.yaml
> +F:	arch/arm64/boot/dts/axis/
> +F:	drivers/clk/samsung/clk-artpec*.c
> +F:	include/dt-bindings/clock/axis,artpec*-clk.h

I'm trying to understand the SoC family tree here. I see that
you have an entry for ARTPEC SoCs above it, which currently
covers artpec6 (Cortex-A9, apparently not Samsung based).

Is the reason for having two entries here that artpec6/7 and
artpec8/9 are two separate SoC families, or is this just because
they are using 32-bit and 64-bit cores, respectively?

> 
> +config ARCH_ARTPEC
> +	bool "Axis Communications ARTPEC SoC Family"
> +	help
> +	   This enables support for the ARMv8 based ARTPEC SoC Family.
> +
> +config ARCH_ARTPEC8
> +	bool "Axis ARTPEC-8 SoC Platform"
> +	depends on ARCH_ARTPEC
> +	depends on ARCH_EXYNOS
> +	select ARM_GIC
> +	help
> +	  This enables support for the Axis ARTPEC-8 SoC.
> +

I would prefer to be less fine-grained here, especially as
it seems that ARTPEC9 is again quite similar to ARTPEC8, as
far as I can guess from public information.

Could you fold both entries into a single ARCH_ARTPEC?

     Arnd

