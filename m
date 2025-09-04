Return-Path: <linux-gpio+bounces-25592-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E67B43D7D
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 15:43:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D23F71753AA
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 13:43:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EA21305043;
	Thu,  4 Sep 2025 13:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qyE8UVOj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C4330499B;
	Thu,  4 Sep 2025 13:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756993404; cv=none; b=NwmpKZaVDFbMaSRS8GURA40TXPNPOmBPL/vaazv5pMCRkMGVErIcVPRPNbMloeyPGSPBO8DMbRf9UyKhXeHqLZVlRpwaufNrZQLLA5aVJhaS7NE6ky6zBY6PDaPRMw5fL4LcbsjMJZYEZXuAARhG9sKJgDFVgA0cjn5qOObkYPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756993404; c=relaxed/simple;
	bh=/9OWqx5QESRGHRCL0BQyhOtgreyfaYTGqx7ChEu5PaA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hbRTk9TxC4omg7txy02+ArzUBZwaEDCIF7Mx5MDK8XLg6cZR8ZBELSbu5+HJ/PguGgIqiNzwtfth3KxBiNP0UUZtnJRQt6zaD968J2TNVE8v4jrBAXAof7LvQzSfMmIFqBeQPNoBxbOfzPMifZJOLOTM/pIbucqExhvNQKsGsAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qyE8UVOj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0280AC4CEF0;
	Thu,  4 Sep 2025 13:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756993403;
	bh=/9OWqx5QESRGHRCL0BQyhOtgreyfaYTGqx7ChEu5PaA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qyE8UVOjEPIjeyF7QEHLaeb3XpXfyUCJJCnebujOv1YfryOeGm+JF5KogZrQCD/YH
	 iCHkpF38GXpRQdshJl2JwIgOxWUecuwQPFmJ35OBBIv3eGob4TFOxG5gY0IgtLnqPe
	 Ng6Xnh+qgof4RcgEBn4SDMeWIMpjURrIPo1jXjvmlEHMepDhogWb24A9LjFeX3sQPW
	 UY2iYzf/hGeivJAqKBVWsscsvK3ooH3k3EJVAFEeVXXnNDsuk+oF61czum4PKf5uWu
	 9eutPfy46F0aYNSMJy9LnbkJjpaBU2QuPfVqAPkcbTdi9mWq0CeGR7XKIhinCDRqgw
	 y/oB8JbHR+xbQ==
Message-ID: <5543f849-2be7-459f-8600-d236625cc8f8@kernel.org>
Date: Thu, 4 Sep 2025 15:43:14 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] arm64: dts: exynos: axis: Add initial ARTPEC-8 SoC
 support
To: Ravi Patel <ravi.patel@samsung.com>, jesper.nilsson@axis.com,
 mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, s.nawrocki@samsung.com,
 cw00.choi@samsung.com, alim.akhtar@samsung.com, linus.walleij@linaro.org,
 tomasz.figa@gmail.com, catalin.marinas@arm.com, will@kernel.org,
 arnd@arndb.de
Cc: ksk4725@coasia.com, kenkim@coasia.com, pjsin865@coasia.com,
 gwk1013@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com,
 smn1196@coasia.com, shradha.t@samsung.com, inbaraj.e@samsung.com,
 swathi.ks@samsung.com, hrishikesh.d@samsung.com, dj76.yang@samsung.com,
 hypmean.kim@samsung.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@axis.com, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <20250901051926.59970-1-ravi.patel@samsung.com>
 <CGME20250901054254epcas5p24db87bd64fc57a25b17c51e608f15e7b@epcas5p2.samsung.com>
 <20250901051926.59970-5-ravi.patel@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250901051926.59970-5-ravi.patel@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/09/2025 07:19, Ravi Patel wrote:
> From: SungMin Park <smn1196@coasia.com>
> 
> Add initial device tree support for Axis ARTPEC-8 SoC.
> 
> This SoC contains 4 Cortex-A53 CPUs and several other peripheral IPs.
> 
> Signed-off-by: SungMin Park <smn1196@coasia.com>
> Signed-off-by: SeonGu Kang <ksk4725@coasia.com>
> Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
> ---
>  MAINTAINERS                                   |  12 +
>  arch/arm64/Kconfig.platforms                  |   7 +
>  arch/arm64/boot/dts/exynos/Makefile           |   1 +
>  .../boot/dts/exynos/axis/artpec-pinctrl.h     |  36 +++
>  .../boot/dts/exynos/axis/artpec8-pinctrl.dtsi | 120 +++++++++
>  arch/arm64/boot/dts/exynos/axis/artpec8.dtsi  | 244 ++++++++++++++++++
>  6 files changed, 420 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/exynos/axis/artpec-pinctrl.h
>  create mode 100644 arch/arm64/boot/dts/exynos/axis/artpec8-pinctrl.dtsi
>  create mode 100644 arch/arm64/boot/dts/exynos/axis/artpec8.dtsi
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fe168477caa4..4d0c1f10ffd4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4102,6 +4102,18 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/sound/axentia,*
>  F:	sound/soc/atmel/tse850-pcm5142.c
> 
> +AXIS ARTPEC ARM64 SoC SUPPORT
> +M:	Jesper Nilsson <jesper.nilsson@axis.com>
> +M:	Lars Persson <lars.persson@axis.com>
> +L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> +L:	linux-samsung-soc@vger.kernel.org
> +L:	linux-arm-kernel@axis.com
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/clock/axis,artpec*-clock.yaml
> +F:	arch/arm64/boot/dts/exynos/axis/
> +F:	drivers/clk/samsung/clk-artpec*.c
> +F:	include/dt-bindings/clock/axis,artpec*-clk.h

Some official ack would be nice for this, but I also remember we earlier
emails, so I will take it as is.

Best regards,
Krzysztof

