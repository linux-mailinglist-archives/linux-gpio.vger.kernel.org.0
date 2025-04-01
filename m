Return-Path: <linux-gpio+bounces-18143-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 816F9A7789A
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Apr 2025 12:15:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 74FA83AC2E0
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Apr 2025 10:15:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8035A1F09B6;
	Tue,  1 Apr 2025 10:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="m/sa6pGM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142981DD0C7;
	Tue,  1 Apr 2025 10:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743502523; cv=none; b=mdugMisJj9J0LL31dkMPZr01lj/LXBjQhMj3BcPL4Eb3yQ3VwysuQ2RnnkNXal8HznrgdqBvpUduxVvbNimnNFuksaGuY+mWRCe7fYbmVCyPx5LOYhL/fejgKWWTeG4irT+eaWEwfuctepTKkjVymU5X4EHr/GpPChNyT0FnkP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743502523; c=relaxed/simple;
	bh=uSEEol9Q1BqptFXl0kpmi2WWWI6BRh3I2IU4ZiUjqYc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZC8HCBVrnNmTgIdQOjnyggI1gqW0Vr4R0sCklKHUH1ZSYx//A5jLLGOic8DEBOxhqXZQNZ9RIvxMzrplM8qOO3Jhmeuwr5Y0dY244Sh1Skq7A9QBg7IrVLEN/FA88EHM7MZts5mDX+oUqlAnfOzunsHLd5wJWvacL148OrYW3Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=m/sa6pGM; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743502519;
	bh=uSEEol9Q1BqptFXl0kpmi2WWWI6BRh3I2IU4ZiUjqYc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=m/sa6pGMfQJfCTngM6W+uqGsIc6c64XTaC9Vh2Zci9ls06SImtA9+ep2EKBbG1YAC
	 TCvbQZSwns2IoR6tVw/8bgK95nY3at3oA6/97K8p3s8MzVUSErEIDlz2hwzd5Z77tT
	 GnT9aIhNWsyWb2DyLgshyWPNIKDtEY2E76/Nbd5FsvXCnX6eU/0o7rBx98fmya8Fh5
	 AfhvBKLKyxG2vmetPaCLWpLqZb8qYdLCWIf+HQHlfYZciedbRbmGnJYmqOlyqzMan2
	 JevP6/ZbvTlEwCJoXAjkbzDYOttz+Xd9DJA6cvyk/Gw5PYD3CI3p9xr14vb4tT4OzF
	 MoIUK/xnIbDqw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6AE4C17E0FC1;
	Tue,  1 Apr 2025 12:15:18 +0200 (CEST)
Message-ID: <bc61a69f-7040-4063-91e6-132d6eea252f@collabora.com>
Date: Tue, 1 Apr 2025 12:15:17 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] pinctrl: mediatek: Add pinctrl driver on mt8196
To: Cathy Xu <ot_cathy.xu@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>, Lei Xue <lei.xue@mediatek.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, yong.mao@mediatek.com,
 Axe.Yang@mediatek.com, Jimin.Wang@mediatek.com, Wenbin.Mei@mediatek.com,
 Andy-ld.Lu@mediatek.com, Guodong Liu <guodong.liu@mediatek.com>
References: <20250401054837.1551-1-ot_cathy.xu@mediatek.com>
 <20250401054837.1551-4-ot_cathy.xu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250401054837.1551-4-ot_cathy.xu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 01/04/25 07:48, Cathy Xu ha scritto:
> From: Guodong Liu <guodong.liu@mediatek.com>
> 
> Add pinctrl driver support for MediaTek Soc mt8196.
> 
> Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>
> Signed-off-by: Cathy Xu <ot_cathy.xu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




