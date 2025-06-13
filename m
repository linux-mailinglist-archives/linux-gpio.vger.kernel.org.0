Return-Path: <linux-gpio+bounces-21503-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4ECAD8806
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 11:35:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 52AE3188658B
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 09:35:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D30C2D3A85;
	Fri, 13 Jun 2025 09:33:41 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917022C3262;
	Fri, 13 Jun 2025 09:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749807221; cv=none; b=av1W0Hp5wi6SJvtSowUf21Hcp/hXF1gq/am+cFcIkELm/3qyEic3YK5+cvBORoqaOk0Ncw1RnoHrS8B/KYTUQ87QgPgk05ts92434zy+m1S1DpD3Zj6LvCDyfSTWApoHRs1T7UVmOHZGKH2H64euQbB9rvhuyVgnfBNJofa3dxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749807221; c=relaxed/simple;
	bh=fDgtgb5GEdz7WxNqfO/RgAmZUe+TYXa1200aBCMzWPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FgGPAnQKj03rLG2CbNuDWlVbIlGBFqFRq6z8P1eMcIzCmqOy4cvg2F5wxLQ4XAxPhgakjnxab3x3hOTXkBXEhms8aXqb1bLjU9l/Qm9H+5J1mxrYOTGitQEhifTyygYfwD7eoKQZCqYWbBZyflIZifBwCZrL77LLIbydDFnPf6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.48.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 6409A342371;
	Fri, 13 Jun 2025 09:33:37 +0000 (UTC)
Date: Fri, 13 Jun 2025 09:33:33 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Alex Elder <elder@riscstar.com>, Vivian Wang <uwu@dram.page>,
	linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: spacemit: Add missing MODULE_DEVICE_TABLE
Message-ID: <20250613093333-GYA135173@gentoo>
References: <20250613-k1-gpio-of-table-v1-1-9015da8fdfdb@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613-k1-gpio-of-table-v1-1-9015da8fdfdb@iscas.ac.cn>

Hi Vivian,

On 17:25 Fri 13 Jun     , Vivian Wang wrote:
> The gpio-spacemit-k1 driver can be compiled as a module. Add missing
> MODULE_DEVICE_TABLE so it can be matched by modalias and automatically
> loaded by udev.
> 
> Fixes: d00553240ef8 ("gpio: spacemit: add support for K1 SoC")
> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
LGTM

Reviewed-by: Yixun Lan <dlan@gentoo.org>

> ---
> This patch is available at:
> 
> https://github.com/dramforever/linux/tree/k1/gpio-of-table/v1
> ---
>  drivers/gpio/gpio-spacemit-k1.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpio/gpio-spacemit-k1.c b/drivers/gpio/gpio-spacemit-k1.c
> index f027066365ff8741f99da076d1e7b6339a6c1a22..3cc75c701ec40194e602b80d3f96f23204ce3b4d 100644
> --- a/drivers/gpio/gpio-spacemit-k1.c
> +++ b/drivers/gpio/gpio-spacemit-k1.c
> @@ -278,6 +278,7 @@ static const struct of_device_id spacemit_gpio_dt_ids[] = {
>  	{ .compatible = "spacemit,k1-gpio" },
>  	{ /* sentinel */ }
>  };
> +MODULE_DEVICE_TABLE(of, spacemit_gpio_dt_ids);
>  
>  static struct platform_driver spacemit_gpio_driver = {
>  	.probe		= spacemit_gpio_probe,
> 
> ---
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> change-id: 20250613-k1-gpio-of-table-222b4b76b453
> 
> Best regards,
> -- 
> Vivian "dramforever" Wang
> 

-- 
Yixun Lan (dlan)

