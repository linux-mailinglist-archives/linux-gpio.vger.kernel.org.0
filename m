Return-Path: <linux-gpio+bounces-23465-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 464ECB0A57F
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 15:45:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F0041888A5C
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 13:46:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABD9E15E5C2;
	Fri, 18 Jul 2025 13:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kiIpGf7e"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA5AEEBB;
	Fri, 18 Jul 2025 13:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752846333; cv=none; b=l8Cjb8VXqn7KMxBLj8pA88WehkLrljI8xqjMpHzDo+vLy8S4P1pgEimhhzOMYcU+6TS9kK5xCbZdjLa1fcMObKsXwgYyriXel3q6wCXdWib6R1pbpadcm729LLB6Yp5c1mI7JgpQcPRGvWZVyYHVSFXEulRzwlceutci7sownus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752846333; c=relaxed/simple;
	bh=n53OG7Ktt1g6FtX1MG3MOkDKBdetprJNhoqQRlyEq00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TzH4Yx5o4Q6jsLwDbHxfOzq24FWwNim/FvZ4GuAtbrsnEtFAvovdPq9JN5YXB9d4MecGau+9USoZaVVs1imPDRxRxjg2wX4AK4vrDjfF8Pb2+H2uY/AwqqB3mJxIdoACzYW1AHPzntJFU4+WJPic3Rdo7DqnUnRiYXR9pBmxgiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kiIpGf7e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DC37C4CEEB;
	Fri, 18 Jul 2025 13:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752846332;
	bh=n53OG7Ktt1g6FtX1MG3MOkDKBdetprJNhoqQRlyEq00=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kiIpGf7eO8qSGKjqhnpQWH0KB+dmUKfuAtfZ1XRs8sugvil357dTvIwkUhm+bcZRM
	 CJgXKkv3TIi6txF0OftB23Tm3TjSSCW7n+a+68XUm/+9Drfj16P9D65Uz2Q3Cmo0fN
	 h7EpWeWbCbCga9ay9xPdhr8WThYVhFfEwK5gTlCLVp9W249W+96z6l7oCYzHgYOUXr
	 cn0cGFyGqfEm8al/eWjNvZPHqDte6tQmTVvT5FvErE/E/qRsdNVIj8p6f3iy9yh5+A
	 /0y4fr//iyvu7felQhd27m5IR8655iF5epjf/EERhnywHx+B0F1SkYojoAQhcuEZme
	 s5lkDUPCGC2Eg==
Date: Fri, 18 Jul 2025 14:45:25 +0100
From: Lee Jones <lee@kernel.org>
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, chester62515@gmail.com,
	mbrugger@suse.com, Ghennadi.Procopciuc@nxp.com,
	larisa.grigore@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
	festevam@gmail.com, aisheng.dong@nxp.com, ping.bai@nxp.com,
	gregkh@linuxfoundation.org, rafael@kernel.org, srini@kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	s32@nxp.com, clizzi@redhat.com, aruizrui@redhat.com,
	eballetb@redhat.com, echanude@redhat.com, kernel@pengutronix.de,
	imx@lists.linux.dev, vincent.guittot@linaro.org
Subject: Re: [PATCH v7 10/12] nvmem: s32g2_siul2: add NVMEM driver for SoC
 information
Message-ID: <20250718134525.GG11056@google.com>
References: <20250710142038.1986052-1-andrei.stefanescu@oss.nxp.com>
 <20250710142038.1986052-11-andrei.stefanescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250710142038.1986052-11-andrei.stefanescu@oss.nxp.com>

On Thu, 10 Jul 2025, Andrei Stefanescu wrote:

> The SIUL2 hardware module has registers which expose information about
> the given SoC (version, SRAM size, presence of some hw modules).
> 
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> ---
>  drivers/mfd/nxp-siul2.c           |   6 +-

When you re-submit - this needs to be in its own commit.

>  drivers/nvmem/Kconfig             |  10 ++
>  drivers/nvmem/Makefile            |   2 +
>  drivers/nvmem/s32g2_siul2_nvmem.c | 232 ++++++++++++++++++++++++++++++
>  4 files changed, 249 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/nvmem/s32g2_siul2_nvmem.c

-- 
Lee Jones [李琼斯]

