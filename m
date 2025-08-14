Return-Path: <linux-gpio+bounces-24373-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0E2B259C1
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Aug 2025 05:16:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28CAE683511
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Aug 2025 03:16:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E1AA1DE2A5;
	Thu, 14 Aug 2025 03:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="BYb8Pipl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC0B156CA;
	Thu, 14 Aug 2025 03:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755141372; cv=none; b=WcDzZGNWYUsLndAxBHMSlNZql9ipLvrzF9JkqhAo5Talif5VaZwQTVgsRA2wyVVGNk0eOx0g/JQdXIGmHA4FYo65KusmuUwbhaN7BLr3VV28fZXkU0bdWdmjJvK/HUFuNjKuYKUPGT8HTCfsJGkrF/K6d/45Ye0yn8pqFGUPlYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755141372; c=relaxed/simple;
	bh=+gwX6XfqciK40bLgmrE2RKSD1uSrAVArunK4uRxe5ys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Np/Fi5CtxGOokgS35vLVzIkToZZTr4o8gzJanuOA5MI+v0bzac7uS+bZRWGvJ2dQeO/AaVrC5Yt44T0lNN3FVCrmQVsbDiSVG5e4s9obW4AtUyMxQu6tf0XcXPR3cT6te6B+Rf3CI/uZhbR97Upc55L0WLPI1I9/7ntEBjV3WUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=BYb8Pipl; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id AD43220D9F;
	Thu, 14 Aug 2025 05:16:09 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sV2kU1G9oo8O; Thu, 14 Aug 2025 05:16:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1755141368; bh=+gwX6XfqciK40bLgmrE2RKSD1uSrAVArunK4uRxe5ys=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BYb8Piplu8vS0NzxOjEloKUnqa+ivjFhNEJ84q8JoSv+woxhSNH1bCqk6Dh0r56n5
	 Ufa5ZfGkZP/c7s6h4Wkd3inOMr8/yn6PE7AB9q7Vo41Tf7GvehBQlfHvbBuYh8kNOw
	 gUncBkS/HzC9PbiYgCW5DLD6wcEUT1DkHU00wqvkudXnDxNNyzAXCqbEGMOu4GC2Ii
	 E5zka9dLuMyvDhoTYuJFoq8QIKD0fF0Q5pHUKFpjB7oH8S+QmM1mtGHjZ+5UOZFJuw
	 wJtBlHAjKsnCOpy+JMhNM4y5+e5/5Ss37rczyHp2Ch0mBLvKxGHLfDdlPx0SQEGK6g
	 xDkmRgrveO5uQ==
Date: Thu, 14 Aug 2025 03:15:45 +0000
From: Yao Zi <ziyao@disroot.org>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
	Mingcong Bai <jeffbai@aosc.io>, Kexy Biscuit <kexybiscuit@aosc.io>
Subject: Re: [PATCH 2/3] pinctrl: ls2k0300: Support Loongson 2K0300 SoC
Message-ID: <aJ1U4RdkyCy4bxyd@pie>
References: <20250811163749.47028-2-ziyao@disroot.org>
 <20250811163749.47028-4-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811163749.47028-4-ziyao@disroot.org>

On Mon, Aug 11, 2025 at 04:37:49PM +0000, Yao Zi wrote:
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
> ---
>  MAINTAINERS                        |   1 +
>  drivers/pinctrl/Kconfig            |  14 +
>  drivers/pinctrl/Makefile           |   1 +
>  drivers/pinctrl/pinctrl-ls2k0300.c | 515 +++++++++++++++++++++++++++++
>  4 files changed, 531 insertions(+)
>  create mode 100644 drivers/pinctrl/pinctrl-ls2k0300.c

...

> diff --git a/drivers/pinctrl/pinctrl-ls2k0300.c b/drivers/pinctrl/pinctrl-ls2k0300.c
> new file mode 100644
> index 000000000000..11d448ba333d
> --- /dev/null
> +++ b/drivers/pinctrl/pinctrl-ls2k0300.c

...

> +static const struct pinmux_ops ls2k0300_pmux_ops = {
> +	.get_functions_count	= ls2k0300_pinmux_get_functions_count,
> +	.get_function_name	= ls2k0300_pinmux_get_function_name,
> +	.get_function_groups	= ls2k0300_pinmux_get_function_groups,
> +	.set_mux		= ls2k0300_pinmux_set_mux,
> +};

I forgot to enable strict mode for the pinmux operations. Will correct
this in v2. I'll wait a few days for more comments before sending it,
thanks for your time.

Best regards,
Yao Zi

