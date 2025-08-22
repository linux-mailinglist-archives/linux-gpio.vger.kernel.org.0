Return-Path: <linux-gpio+bounces-24834-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C49B322FB
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 21:39:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A025587F1E
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 19:39:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F04C82D3ECA;
	Fri, 22 Aug 2025 19:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rXpJdOxL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C50E15E90;
	Fri, 22 Aug 2025 19:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755891592; cv=none; b=SSd759AGR0M8rI7PI9FnkG9z2HZoe6PZnRj4VF6Zcg0KVDKUr66TzvhsPnsNTy05g7LXNQ3hfoTq3UfVgWwd4L+Wy6GA3aQ5mX+caK2X511HpVHE3FfYs6gUdJ+Zb8T5JG7PrJ43KXb+JDgnjiqR+3Wd/EusO9txhVIAZeuSJDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755891592; c=relaxed/simple;
	bh=dg74KSkRhAtNHcxY1z8fkqMzfxeeOVWbECFvFRXHLSM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SJQVpmHC2W710oGsR7yVTFCp51NAk1pgw8SP876HBqye+maz6Hp/g/kOe6fM7D8m6Potc5y4DEong+oxYHWucVabd20LbVzxcxFlH6XfXivHaIjFmt7XqfMpQdLLNqNCP5szDG9YBdbY2SL94htjVTtgvgWXiKXlwah5iDiQO6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rXpJdOxL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5934C4CEED;
	Fri, 22 Aug 2025 19:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755891592;
	bh=dg74KSkRhAtNHcxY1z8fkqMzfxeeOVWbECFvFRXHLSM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rXpJdOxLNycUvIsw2gMPg9zMyrLykVSU8bb4RU5BVW/xSq/Vls3DtK2GulvNfNh9p
	 /rpm9efCsTWFz55az9lBRAVaMmZiGzjSsotLl8YIGj4dj0OL1EqiXNjVaBvR/chQHn
	 FJwOBlmJrRSZv1V9sGHuFLwlhgpHSqv3rIKsjVAOvH/4dU0x0AWtCEAxY9LzMV8N8T
	 lOEPz2/kOoJUySu0oi7CU5zLpNuTGEadrKYU279/tloaEh9YOUYVRhJmsPl6CKPWmx
	 SC8vBb2xd29j9VoS+ye0Hqo7k0xubgxT4jOs15OBMDOUSw0agE3Ivnzt8NlGqhTNQu
	 uk8aLClwGeRfg==
Date: Fri, 22 Aug 2025 14:39:51 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ravi Patel <ravi.patel@samsung.com>
Cc: swathi.ks@samsung.com, linux-arm-kernel@axis.com, krzk@kernel.org,
	conor+dt@kernel.org, linux-gpio@vger.kernel.org,
	hypmean.kim@samsung.com, linux-kernel@vger.kernel.org,
	krzk+dt@kernel.org, hrishikesh.d@samsung.com, pjsin865@coasia.com,
	pankaj.dubey@samsung.com, linux-samsung-soc@vger.kernel.org,
	kenkim@coasia.com, linus.walleij@linaro.org, soc@lists.linux.dev,
	dj76.yang@samsung.com, linux-arm-kernel@lists.infradead.org,
	cw00.choi@samsung.com, smn1196@coasia.com, jesper.nilsson@axis.com,
	shradha.t@samsung.com, catalin.marinas@arm.com, arnd@arndb.de,
	mingyoungbo@coasia.com, gwk1013@coasia.com, tomasz.figa@gmail.com,
	s.nawrocki@samsung.com, will@kernel.org, linux-clk@vger.kernel.org,
	mturquette@baylibre.com, hgkim05@coasia.com, ksk4725@coasia.com,
	devicetree@vger.kernel.org, inbaraj.e@samsung.com, sboyd@kernel.org,
	alim.akhtar@samsung.com
Subject: Re: [PATCH v2 01/10] dt-bindings: clock: Add ARTPEC-8 clock
 controller
Message-ID: <175589159077.191700.15798343255656756009.robh@kernel.org>
References: <20250710002047.1573841-1-ksk4725@coasia.com>
 <20250821123310.94089-1-ravi.patel@samsung.com>
 <CGME20250821124019epcas5p42ac6e6abe1d3c8c9d69331596e51ad48@epcas5p4.samsung.com>
 <20250821123310.94089-2-ravi.patel@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821123310.94089-2-ravi.patel@samsung.com>


On Thu, 21 Aug 2025 18:02:45 +0530, Ravi Patel wrote:
> From: Hakyeong Kim <hgkim05@coasia.com>
> 
> Add dt-schema for Axis ARTPEC-8 SoC clock controller.
> 
> The Clock Management Unit (CMU) has a top-level block CMU_CMU
> which generates clocks for other blocks.
> 
> Add device-tree binding definitions for following CMU blocks:
> - CMU_CMU
> - CMU_BUS
> - CMU_CORE
> - CMU_CPUCL
> - CMU_FSYS
> - CMU_IMEM
> - CMU_PERI
> 
> Signed-off-by: Hakyeong Kim <hgkim05@coasia.com>
> Signed-off-by: SeonGu Kang <ksk4725@coasia.com>
> Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
> ---
>  .../bindings/clock/axis,artpec8-clock.yaml    | 213 ++++++++++++++++++
>  include/dt-bindings/clock/axis,artpec8-clk.h  | 169 ++++++++++++++
>  2 files changed, 382 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/axis,artpec8-clock.yaml
>  create mode 100644 include/dt-bindings/clock/axis,artpec8-clk.h
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


