Return-Path: <linux-gpio+bounces-9930-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72083972AED
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Sep 2024 09:37:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1FD4628615C
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Sep 2024 07:37:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEA8917F397;
	Tue, 10 Sep 2024 07:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BHtY7DKd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634DC17E010;
	Tue, 10 Sep 2024 07:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725953826; cv=none; b=MIY7wcb8vz17VVkcK6UdDbT+MTGEYpdQF3CKCsp7MzH2FtxBOpaKjMkHBTvOfXrbAlRTS3j+AG9LlrOb+qrOfsDWOMGTfO+4Pl+5ZwFy5h22TiE5hWk1HqFlDXJcZwJTb5gRjfYsY3JEAGEMreanVvuhOeAo1e+WfUSg8WUe1/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725953826; c=relaxed/simple;
	bh=l23NYfXeykSrpfi1JGToBjVhZyQnctbe5iVzH/S067U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OIiqfClCnQQPkW5YUEC+95upaI4cguGtBZ4NCzdWwIbJeP7KkF/yaModfdgeU3x5rIpnUEQsnlG63lvyeVWIkvFpUnCTsWTmI67lCOiXT/VZm06hfFrYLxFhuQk+W+iOVi5eQWOD3qovfxmDqiY4P7j7BzzSgsOrkEwP3FmxO2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BHtY7DKd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2623FC4CEC8;
	Tue, 10 Sep 2024 07:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725953826;
	bh=l23NYfXeykSrpfi1JGToBjVhZyQnctbe5iVzH/S067U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BHtY7DKdzrRxb+w+efU8gdL1Ohwx3mHCczD9LdA3i75lpD6MctmpQq0QZfHQ4aIJq
	 LP8s88YI0tLNbFT1/AUxiLz+TWhVHP7+ysui4PcD4B2SArEZiB0PQFM9UCrgBIis9s
	 uuFU3Ipz5UI1j0oXmrBFg8xWOs3kUnnytyf7hLVlozStMLb4Quj+kUAD/b87JPUeRJ
	 xPJhX+JmiKMWDz2Mml3HThBlG2JH3pqI9XVDo1JalOLXRAv8FzJMjYQOygwdTO+XAV
	 QWy3nkUjhziK3kOzNl2ci/VTPEZ/WeYJTKzAb624zKHu4IZMZQ4Ybxukt4WQiDl259
	 PfHkOnkrnapIw==
Date: Tue, 10 Sep 2024 09:37:02 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 00/10] Add minimal Exynos8895 SoC and SM-G950F support
Message-ID: <4rtzyvspsrtqhxx6er3pr2tmidfhyvipckrxmszx5zltp3ahbk@q66bxawsmtqm>
References: <20240909110017.419960-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240909110017.419960-1-ivo.ivanov.ivanov1@gmail.com>

On Mon, Sep 09, 2024 at 02:00:07PM +0300, Ivaylo Ivanov wrote:
> Hi folks,
> 
> This series adds initial SoC support for the Exynos 8895 SoC and also
> initial board support for Samsung Galaxy S8 phone (SM-G950F), codenamed
> dreamlte.
> 
> The Exynos 8895 SoC is also used in S8 Plus (dream2lte), Note 8 (greatlte)
> and Meizu 15 Plus (m1891). Currently DT is added for the Exynos 8895 SoC
> and dreamlte, but it should be really easy to adapt for the other devices
> with the same SoC. It has been tested with dtbs_check W=1 and results
> in no warnings.
> 
> The support added in this series consists of:
> * cpus
> * pinctrl
> * gpio
> * simple-framebuffer
> * pstore
> 
> This is enough to reach a minimal initramfs shell using an upstream kernel.
> More platform support will be added in the future.
> 
> The preferred way to boot this device is by using a small shim bl called
> uniLoader [1], which packages the mainline kernel and DT and jumps to
> the kernel. This is done in order to work around some issues caused by
> the stock, and non-replacable Samsung S-Boot bootloader. For example,
> S-Boot leaves the decon trigger control unset, which causes the framebuffer
> to not refresh. 
> 
> [1] https://github.com/ivoszbg/uniLoader
> 

FYI,
It is too late in the cycle for me to pick up any of these patches.
Also due to some travel and events, I might be slower in review, but I
will review them before next merge window opens.

Best regards,
Krzysztof


