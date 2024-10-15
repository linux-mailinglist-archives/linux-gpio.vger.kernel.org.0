Return-Path: <linux-gpio+bounces-11377-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0B099F83B
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 22:40:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E5F90B227FF
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 20:40:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D5961F81B4;
	Tue, 15 Oct 2024 20:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iZ1pbpPD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CCA1F819D;
	Tue, 15 Oct 2024 20:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729024832; cv=none; b=UQ+jksWOIrpnaDZEnOBn9LrQOx5Ikkr78ci8QmwcAM7ZnuWMIY+8Pneq/ZMZTy2MNDGkD5KYY1z/DCBgoyEuCeJW4j85RbF0PrnNa+DXyy0faGXyWpAEvKx3oc0/T4qWZ9Mn0CYWI6H+DGO87ciKhGTP8JA/nqJWpM9EARHVEtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729024832; c=relaxed/simple;
	bh=HGOA7WlOwsWM/ZIrqK/ymoVJqcQ0J0msd+r5LRPaQL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i8q14IxbjEDov8euStkGn/kSuv/WGFy0yJvqnF6wqkq2iaHinTN6wGvGW6g1RN9h8hxn5heccO/oilrv+ufN6buzab+oXutrRfRVte27vHUGTiu/Yetirb3F1xKkNv1Of9Wal4Lcm2F0mshkj4/n25TjRPHLH/Co1npQkppH4J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iZ1pbpPD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECA04C4CEC6;
	Tue, 15 Oct 2024 20:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729024831;
	bh=HGOA7WlOwsWM/ZIrqK/ymoVJqcQ0J0msd+r5LRPaQL0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iZ1pbpPDpYS35NbY0xwEOJMVk9glk93TR5tDcjGbY1MrgdPTBsdDS1WgyS5EPp704
	 KHplykiwMWVgcx2KwXMZ8r6JTr5RRjUkfqSSuTLaaU97J/m7onxh2++4lm6HdWbuD1
	 Ix9MUNJLSonHIX13/u/JD2yR/bmyRpkxau5avC/JTsYl16/lAocPg0dYz8kM0skFzj
	 1iBtpgY+0O6Rm6SnbJV704SKa0jVnUtY2F4UOu6yVGOS++EhU0dBHPOy7/1X02+ftK
	 0iIwFl1fbfiu+TlbJW3AG9LDD2InbKzLL2iTd5zG5JocA8B4a0N0T9oQOI4VGA6jYr
	 ZPGwjLNBaV2mA==
Date: Tue, 15 Oct 2024 15:40:29 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Jaewon Kim <jaewon02.kim@samsung.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	Igor Belwon <igor.belwon@mentallysanemainliners.org>,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: pinctrl: samsung: Add missing
 constraint for Exynos8895 interrupts
Message-ID: <172902482869.1924248.13765121843479257360.robh@kernel.org>
References: <20241015065848.29429-1-krzysztof.kozlowski@linaro.org>
 <20241015065848.29429-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015065848.29429-2-krzysztof.kozlowski@linaro.org>


On Tue, 15 Oct 2024 08:58:48 +0200, Krzysztof Kozlowski wrote:
> Expect only one interrupt on Exynos8895 wake-up pin controller.
> 
> Fixes: e2d58d1e1c61 ("dt-bindings: pinctrl: samsung: add exynos8895-wakeup-eint compatible")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Cc: Igor Belwon <igor.belwon@mentallysanemainliners.org>
> ---
>  .../bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml       | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


