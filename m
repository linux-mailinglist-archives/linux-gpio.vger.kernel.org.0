Return-Path: <linux-gpio+bounces-24836-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F113FB32308
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 21:41:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D3D811D63849
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 19:41:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FFAA2D46D6;
	Fri, 22 Aug 2025 19:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="abcpVINM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D6715E90;
	Fri, 22 Aug 2025 19:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755891674; cv=none; b=rxTKfpA/sLyPcRwTz5aZslvvVpD68f+KClHPnk1L/sscWVTfGgDVglv1QhgiJYBBH4w4W1+CWN33kRtnPKWGkn2ak9ruDxaQhIQTlfWM2FQ1YAaehlTZg6/7pTjoGFN5eY28vOLLczTA8aQv6VIKKZBjAyg6g1NKua43MTq01+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755891674; c=relaxed/simple;
	bh=wnhJq56I7lMIJYREykBLr5qAtnaHGCueson7w3C/oLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OKuTn4Cy+3cAxGZVJdTfdfAPkXN3SCOV+5L4p75UTzHAjvbA4AmLqnL6HdixfYOPLb/jt3isLtaMPGPw6OCkA9cepwR9bTh8AC2/Ni0kSNWL1XEtjn/DRht3VA7Ag+1JqJpKb33FxLJtfNuC7RL8/8hc9wVjK3bydfg7dvYLXdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=abcpVINM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D118C4CEED;
	Fri, 22 Aug 2025 19:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755891673;
	bh=wnhJq56I7lMIJYREykBLr5qAtnaHGCueson7w3C/oLI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=abcpVINMN7hAw4gMuShkqK4UrCQv1uKT0Wyrl3U7OP9WjTQRFns6EWed77LhxeE15
	 vbyfM4XOx6kEaZln9hMTveq01+2/6VmegTjOUy+RIBNZhlvAKw0flOkK9tHxn4CRZL
	 xHO5iUy+/55RWm8DAuzfqLdO7PIvONvlPV9B7JKKqGP7hi6pvAKn6K35Kj2N3rPgZO
	 5dtfyWJB3KbmeUiNNb7shnYSxcPGUYEtRh4r0PYasdps7gsPgQbnLimyGXXgt+t3r7
	 v7CVb6AEMm/sqGn59ePp0rbTFFkl5qPDQ7Lm5+YuVQcw04LbB29GZuUqCztnVMictT
	 cPHO4/Z5VSpjQ==
Date: Fri, 22 Aug 2025 14:41:12 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ravi Patel <ravi.patel@samsung.com>
Cc: pjsin865@coasia.com, inbaraj.e@samsung.com, s.nawrocki@samsung.com,
	linux-clk@vger.kernel.org, hrishikesh.d@samsung.com,
	pankaj.dubey@samsung.com, cw00.choi@samsung.com,
	jesper.nilsson@axis.com, tomasz.figa@gmail.com,
	shradha.t@samsung.com, sboyd@kernel.org, alim.akhtar@samsung.com,
	swathi.ks@samsung.com, devicetree@vger.kernel.org,
	krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
	mingyoungbo@coasia.com, linux-kernel@vger.kernel.org, arnd@arndb.de,
	soc@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
	conor+dt@kernel.org, krzk@kernel.org, hgkim05@coasia.com,
	linux-arm-kernel@axis.com, linux-gpio@vger.kernel.org,
	smn1196@coasia.com, gwk1013@coasia.com, hypmean.kim@samsung.com,
	kenkim@coasia.com, linus.walleij@linaro.org,
	catalin.marinas@arm.com, will@kernel.org, dj76.yang@samsung.com,
	ksk4725@coasia.com, mturquette@baylibre.com
Subject: Re: [PATCH v2 06/10] dt-bindings: arm: Convert Axis board/soc
 bindings to json-schema
Message-ID: <175589167241.193457.14325190564820337424.robh@kernel.org>
References: <20250710002047.1573841-1-ksk4725@coasia.com>
 <20250821123310.94089-1-ravi.patel@samsung.com>
 <CGME20250821124045epcas5p37f0a50fb18e6f468a7c57ab406795419@epcas5p3.samsung.com>
 <20250821123310.94089-7-ravi.patel@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821123310.94089-7-ravi.patel@samsung.com>


On Thu, 21 Aug 2025 18:02:50 +0530, Ravi Patel wrote:
> Convert Axis SoC bindings to DT schema format using json-schema.
> Existing bindings supports ARTPEC-6 SoC and board.
> 
> Signed-off-by: SungMin Park <smn1196@coasia.com>
> Signed-off-by: SeonGu Kang <ksk4725@coasia.com>
> Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
> ---
>  .../devicetree/bindings/arm/axis.txt          | 13 ---------
>  .../devicetree/bindings/arm/axis.yaml         | 29 +++++++++++++++++++
>  2 files changed, 29 insertions(+), 13 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/axis.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/axis.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


