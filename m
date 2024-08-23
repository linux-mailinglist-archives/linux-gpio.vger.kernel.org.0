Return-Path: <linux-gpio+bounces-9036-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFE695C934
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 11:28:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 283D4283856
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 09:28:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30C3F14B966;
	Fri, 23 Aug 2024 09:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="aYW2EMSP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD882139D00;
	Fri, 23 Aug 2024 09:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724405297; cv=none; b=R3pT+3KJcoP9TGNAvngKbfoHwv+1489u67dZr2BLtzancnLEPn/etQS0jheSwBUhwqqHJwpvFQPGkOVuE7YifHPDglAfkQoUwzU87fGxl8TE+Vg/2eLp+TUfdYJFSmP+opBKd9R/MWpcm2EMfE800OAK/gXXK3CQI0arSVBFMI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724405297; c=relaxed/simple;
	bh=2xwaPorpSb8MUdi65ck1/iiNBlJySvlqtJ8966nDHG0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SCAzTerqj8iHf5e9Kk8VrK3ToGBleVMg1av+kq9qeH5z3y4Magu+OzyS9ypyfDksn2E5ZZlpwiagcySJCR9kc81WabolWBWPc73/tBejlTKlOO6qkyuR4x1SK3P8+Rjxuy8hLddc/vSUeGsSSKEJVIjaBsw/JUv5QAQgO9MNf6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=aYW2EMSP; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=n0iG4z0x1+eAPWBBF6r0sGy0XLMNeiSfA3ky7GwBfBo=; b=aYW2EMSPM1ZarsCG15qwtzWItJ
	zWYYkm/AbZEOpqFXWbqJ0cwz7YGonkbqKZfdl54cvI7U/h4ts+3pxqHJwhR+LOmLav4zhnvVwP7zl
	vZZ1Iyt/D1QmWT7ODmKS8gYY6kQBOnlkrZ7OdFzSqgnlOAhwBRX/V9wm9k9FekMZk5kGTIPTT+0xB
	nJIvOMWmKDKCyonqAQWZ58sF8Kfxy2zywIpVrWDcCdQGE1a48yd/Ncem+clZdEJNRi683p3XeROVu
	Za/RYzB/bM/scQtoUojdVBURd10+rYgo4tdcKvhr8WLhenFJDeb1e5JQgk3zFDoksg9Pulp2GmXf8
	FcYH6aYg==;
Received: from i5e861933.versanet.de ([94.134.25.51] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1shQaZ-0003nt-M1; Fri, 23 Aug 2024 11:28:11 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linus.walleij@linaro.org, brgl@bgdev.pl, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Ye Zhang <ye.zhang@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 mika.westerberg@linux.intel.com, andriy.shevchenko@linux.intel.com,
 tao.huang@rock-chips.com, finley.xiao@rock-chips.com,
 tim.chen@rock-chips.com, elaine.zhang@rock-chips.com,
 Ye Zhang <ye.zhang@rock-chips.com>
Subject: Re: [PATCH v2] gpio: rockchip: release reference to device node
Date: Fri, 23 Aug 2024 11:28:52 +0200
Message-ID: <4031563.ZaRXLXkqSa@diego>
In-Reply-To: <20240823034314.62305-3-ye.zhang@rock-chips.com>
References:
 <20240823034314.62305-1-ye.zhang@rock-chips.com>
 <20240823034314.62305-3-ye.zhang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Freitag, 23. August 2024, 05:43:05 CEST schrieb Ye Zhang:
> Added a call to of_node_put(pctlnp) in rockchip_gpio_probe to properly
> release the reference to the device node, improving memory management
> and preventing potential leaks.
> 
> Fixes: 936ee2675eee ("gpio/rockchip: add driver for rockchip gpio")
> Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>



