Return-Path: <linux-gpio+bounces-17957-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8AFA6ED28
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 11:00:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C32A716B290
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 10:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C2C01A23AA;
	Tue, 25 Mar 2025 10:00:42 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B14149DE8;
	Tue, 25 Mar 2025 10:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742896842; cv=none; b=CvJpPqmIVLCzQKfGztk7ffik8YW/eOUVILEN3S264jJvVSa/cAtl2X5Pf4klU7DPGCYI5ELAzMdMzYmz9ZK9lPlj7fdenHBhBCkws5cU1f9vzlmE9gVe1iBenYS59kkS+vo7b5fWlODJ3MbD6+z1zhEg704bvEo0Mks0AGx7aRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742896842; c=relaxed/simple;
	bh=zItez3DvRy994cvN0r+zRcG3vFAhLR7Yt/BqQ4GVF38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QVL5IYDvmcxSw0n20eqogkMNlPWO2TLHd/vIJjMmXB3Tgeq0tZfuMuwOK2ybx2zNuRBdkW0TrotzUKfApJ9iIHeCUG4UmDlKJQ5CzYENZsobwa2No3/9ktno0wse4q0VyUiwLKZ7R1xb6rnm7HfJ/7MmpuJ8QvEDqzM1B9ZRzLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.48.233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 0A6BD34332A;
	Tue, 25 Mar 2025 10:00:39 +0000 (UTC)
Date: Tue, 25 Mar 2025 10:00:35 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Alex Elder <elder@riscstar.com>, Yangyu Chen <cyy@cyyself.name>,
	Jisheng Zhang <jszhang@kernel.org>,
	Jesse Taube <mr.bossman075@gmail.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v7 2/4] gpio: spacemit: add support for K1 SoC
Message-ID: <20250325100035-GYA22564@gentoo>
References: <20250226-03-k1-gpio-v7-0-be489c4a609b@gentoo.org>
 <20250226-03-k1-gpio-v7-2-be489c4a609b@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226-03-k1-gpio-v7-2-be489c4a609b@gentoo.org>

Hi All:

The gpio controller request clocks to work, I will address this
in next version

also will 
On 08:41 Wed 26 Feb     , Yixun Lan wrote:
> Implement GPIO functionality which capable of setting pin as
> input, output. Also, each pin can be used as interrupt which
> support rising, falling, or both edge type trigger.
> 
> Reviewed-by: Alex Elder <elder@riscstar.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  drivers/gpio/Kconfig            |   8 ++
>  drivers/gpio/Makefile           |   1 +
>  drivers/gpio/gpio-spacemit-k1.c | 277 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 286 insertions(+)
> +
...
> +static int spacemit_gpio_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct spacemit_gpio *sg;
> +	struct resource *res;
> +	void __iomem *regs;
> +	int i, irq, ret;
> +
> +	sg = devm_kzalloc(dev, sizeof(*sg), GFP_KERNEL);
> +	if (!sg)
> +		return -ENOMEM;
> +
> +	regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
will update to devm_platform_ioremap_resource() to get rid of &res parameter


-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

