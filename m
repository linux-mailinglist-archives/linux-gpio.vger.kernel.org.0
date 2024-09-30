Return-Path: <linux-gpio+bounces-10545-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 021419899CE
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 06:42:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9155282AD1
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 04:42:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 510437DA6D;
	Mon, 30 Sep 2024 04:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="j6/8F3el"
X-Original-To: linux-gpio@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D092F29;
	Mon, 30 Sep 2024 04:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727671335; cv=none; b=jvIZCQ4Q864nnnauscFeMkCnnReySPzr0g9G/kKEKUC39hJ5QFY86rf+oZKsqcWGnufNyCiZ9heln/3nz0Zx6kyHNTcF6PIYeoZJqMd0Gtp0Sz6mwnrUw6mrZRIt3PPJzo/cuTaMFQq1YIxNIgN1GSA6AyHecUbFLMQ1jzI3XB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727671335; c=relaxed/simple;
	bh=joHW7jrOhmrAROOCAZBufariLP1pqxOlWm9X0knNZss=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=I+CYPig7xRgdgo5ERIGU3M/DvOBBPZAO2cK7IUZ8OFSK39AqEgIuI1mGR8rve7LPOU71FgdT2DV6zJ6nntrX9oLP+gGZZOfRZHZwzXlHuARB9/pMdhECN930xIC7J6y91IpjBufgv5eko0lzYR7NmNu9jAJQZQ3TTOx6YLnrN1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=j6/8F3el; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1727671331;
	bh=joHW7jrOhmrAROOCAZBufariLP1pqxOlWm9X0knNZss=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=j6/8F3elrorW0Rsh6GSADnXcfAcn/PrJnerLVa7YgrLFMw3AHRkh15Ut87bjSSOqG
	 C/CpDp7c1+jTIpuGtR2V4TD2WIdefE9XYbRd8tg+2CxIzCngaVVhRajntB3mTOFjfg
	 gZhQ/jErMDOvbgUo8HhdE7qDn+FanapxT/BAy4dmUGfq8xXIldj08IK2CvKt/UP6e8
	 pcL/XzUsm8UHuf870ow9BGkg2nX3pOpBXuNScNGNT0rgnCJhSLAIPdTFS6AvH3FZxP
	 +yFxaZCXqoT4d9qHfp8cNMD+r3j9VM2gztOxyv4A4bw3EPlINi3py87ASdyvzMUuaY
	 5gT7EikL7LaHA==
Received: from [192.168.68.112] (ppp118-210-73-17.adl-adc-lon-bras32.tpg.internode.on.net [118.210.73.17])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 5E0456511E;
	Mon, 30 Sep 2024 12:42:10 +0800 (AWST)
Message-ID: <3a484923ec6fce4a3562b4bedaf846b2ae2ffee7.camel@codeconstruct.com.au>
Subject: Re: [PATCH v6 7/7] gpio: aspeed: Use devm_clk api to manage clock
 source
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Billy Tsai <billy_tsai@aspeedtech.com>, linus.walleij@linaro.org, 
 brgl@bgdev.pl, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 joel@jms.id.au, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com,
 Peter.Yin@quantatw.com,  Jay_Zhang@wiwynn.com
Date: Mon, 30 Sep 2024 14:12:09 +0930
In-Reply-To: <20240927111744.3511373-8-billy_tsai@aspeedtech.com>
References: <20240927111744.3511373-1-billy_tsai@aspeedtech.com>
	 <20240927111744.3511373-8-billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2024-09-27 at 19:17 +0800, Billy Tsai wrote:
> Replace of_clk_get with devm_clk_get_enabled to manage the clock source.
>=20
> Fixes: 5ae4cb94b313 ("gpio: aspeed: Add debounce support")
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

Though as noted in patch 3/7, 7/7 (this patch) and 5/7 should probably
be ordered before 3/7.

