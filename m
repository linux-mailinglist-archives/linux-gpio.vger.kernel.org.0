Return-Path: <linux-gpio+bounces-23432-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 007E4B09BA3
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 08:45:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4224916B170
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 06:45:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E01C20485B;
	Fri, 18 Jul 2025 06:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ijSkO/Pq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95FF01F3B97;
	Fri, 18 Jul 2025 06:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752821106; cv=none; b=fA5lY7GHw4734yMVXH82ANwYDWEYPyIwOAh9GWiB8l+iXMCjLRfK4d4j6691i1NEhAOX8bfS+1xwkVuWr/SeYr2rzX0TKQ4lqp/jna1BrQG3mUaCzCRU26E2uo3eN563n5x4I++78bUYb+eQLYzqBKsez+yh9TkmWi5geeHN0ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752821106; c=relaxed/simple;
	bh=rY4Qy9sf+xg1IIqd/YNXIMBrQbKyfG5E8mpuyIxuqao=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=keY8eX2ebJOjz/ZUEB6v/DqIjH2XwYuFuVJNaHFC7JGfY1a8QG4OQdVFIeo/PhicvaMKULfLy3M+gw7Zb9dYpkvtu4DwVumTIkl/Kf8fXLNccCTKY5VIKW+8msy3MjZkzCGPoCH5Ba+ZL+JaUVYGVhWRkjvfH1tAnAx1kuHOkTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ijSkO/Pq; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1752821102;
	bh=rY4Qy9sf+xg1IIqd/YNXIMBrQbKyfG5E8mpuyIxuqao=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ijSkO/PqPs62ftE0q1ebPwWbfqsWPZjemGSWGWLynSyAc0ydZ2dxvH+DvO2qf1Cg0
	 qXdy8rEkQ6Etklld+YxiCyb5aSq+HXfchkPWRF3/yJzxQ1UIAXTtVTWY65p8wOtfRH
	 f0MJCB+g4e3Xkv9ibFQofbVNGBNDZVyAPSLCg68FFiLvEg4tYai0AYGIrIzw+Bftum
	 fve5X/yUBu+mCe1unbNSGkfl1pu6HwssPfppXGZ3vSozMQZ78niIzaGBjS5QG+KifY
	 GGaBFBGKfX9R64+k5/8t9/XA+IthMNsKXkGZM6w0FFsXrVi3EM7LTOcud8iBOgFVNk
	 6VYAHXbUNsa9A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CCE2817E1541;
	Fri, 18 Jul 2025 08:45:01 +0200 (CEST)
Message-ID: <709a6ca5-cba8-42b0-bbfb-0da278a17e01@collabora.com>
Date: Fri, 18 Jul 2025 08:45:01 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] pinctrl: mediatek: Add pinctrl driver on mt8189
To: Cathy Xu <ot_cathy.xu@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>
Cc: Lei Xue <lei.xue@mediatek.com>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Yong Mao <yong.mao@mediatek.com>, Wenbin Mei <Wenbin.Mei@mediatek.com>,
 Axe Yang <Axe.Yang@mediatek.com>
References: <20250711094513.17073-1-ot_cathy.xu@mediatek.com>
 <20250711094513.17073-4-ot_cathy.xu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250711094513.17073-4-ot_cathy.xu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 11/07/25 11:44, Cathy Xu ha scritto:
> Add pinctrl driver support for MediaTek Soc mt8189.
> 
> Signed-off-by: Cathy Xu <ot_cathy.xu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



