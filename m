Return-Path: <linux-gpio+bounces-7081-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C32B8D8674
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 17:50:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC8A81C20953
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 15:50:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0A51131E2D;
	Mon,  3 Jun 2024 15:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="QEERog17"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DDB6F2F2;
	Mon,  3 Jun 2024 15:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717429821; cv=none; b=nBxbg26kHQyQquQRWDXuFOYF7/aWe+zKfiXmDZwPqzngfE/JGsjbsx14WRkKygu/qNJA6VzrCXFRnNmgwtl1tBHt8I2x2Z/uQ+/CM01cfDqI+lEuageRXWzKnC+ACx2bQAkGyeFuxUuBTJoToI0ga3uUokd9McjJfFU0gGAjTOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717429821; c=relaxed/simple;
	bh=Rx5a8gcjyJ7ZSiIv7XBAZ+Rj0nWbBdD3FbeUn6UvyrM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sH3Ai1zPAvkvxeh7vKvnl6OC+Xty+cAD6rmwJ7jvlf3ZDq8PcZ/TBCZucDBv9u4P+uZFv+DZl6vQzpSW3QdJaTsSNLGYydQKxUJPe5HomqxSd+M6LNY9hIJUGZVtIk1v+hWsI2p/gh2SpR/HlCTJy+0xleqf7nLPcE/bmPZGxTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=QEERog17; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7E50EE0007;
	Mon,  3 Jun 2024 15:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1717429817;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GwTcq4IedeHLQXBXk1rloGqIPerrvErDu7RrUmu96H8=;
	b=QEERog173eXk5OmgCX0zfGMBQMH3arOVasSjUWavLnk15brrZBeEFC8Oz8XDZQjNCkHsjR
	sehVeAFHi50SOMGY1ea9upKz1box4M7r2hc5W/y6lx0PVzZiaBem4vgk8nLXlR3PjYKVvO
	amy7jNuAtd8FPrH9koat0csVnxFiYiEEWXTMv/Sihxm/3y188V+Ntp+IkrBkWnbIcZkjGr
	SUmsSY1MzbRPp5V1W09OKcHTsKdriPH2aOdFUw/Z0NB5dZgr+BTLncObHzBoZf6N7iATxp
	BmN0CbyEQtYfnKT1LU4Mo1pS+rJF+sCWSNsRX5ZjNu3p605utwp2CfqYcqQJ5A==
Date: Mon, 3 Jun 2024 17:50:14 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Dmitry Yashin <dmt.yashin@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Heiko Stuebner
 <heiko@sntech.de>, Jianqun Xu <jay.xu@rock-chips.com>, Jonas Karlman
 <jonas@kwiboo.se>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] pinctrl: rockchip: add rk3308b SoC support
Message-ID: <20240603175014.6a41d3d8@booty>
In-Reply-To: <20240529143534.32402-3-dmt.yashin@gmail.com>
References: <20240529143534.32402-1-dmt.yashin@gmail.com>
	<20240529143534.32402-3-dmt.yashin@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com

Hello Dmitry,

On Wed, 29 May 2024 19:35:34 +0500
Dmitry Yashin <dmt.yashin@gmail.com> wrote:

> Add pinctrl support for rk3308b. This pin controller much the same as
> rk3308's, but with additional iomux routes and 3bit iomuxes selected
> via gpio##_sel_src_ctrl registers. Set them up in the function
> rk3308b_soc_sel_src_init to use new 3bit iomuxes over some 2bit old
> ones and update iomux_recalced and iomux_routes for the new SoC's.
> 
> Fixes: 1f3e25a06883 ("pinctrl: rockchip: fix RK3308 pinmux bits")
> Signed-off-by: Dmitry Yashin <dmt.yashin@gmail.com>

Thank you for adding runtime chip ID detection!

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

