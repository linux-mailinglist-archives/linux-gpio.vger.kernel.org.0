Return-Path: <linux-gpio+bounces-17922-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D757CA6DF57
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Mar 2025 17:11:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3BBA01892A5D
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Mar 2025 16:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89D332620F2;
	Mon, 24 Mar 2025 16:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="T51an9kg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A0226158E;
	Mon, 24 Mar 2025 16:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742832650; cv=none; b=IrymhD5Y4BYtOkQSktsMpnvv2fZozuTmyDpgUuub8KPCKXibiL/W2NWMN+tiTSoM4ruA0mbvBmg8QCqZ7msuuTk26o+HkZvgxSixG9iF3DnkLm7UDIvF3XauAcsC1yJV/5oWH3MpXVs12AnAb6CpradwZHAxL0X0kRf/C83Pe3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742832650; c=relaxed/simple;
	bh=Yt3UrsjkedkYE/1CYuEeJN8oJ93eMzK1Z86WS4MGAaw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TOULiL8/FSOl9oJu62niBcyx3Zn8WjFAYMxI7GURXAF1Hu1VzrD7Szx0Em7RjFFs3QG+M5pdFK+3jO+leLnC4uAGL9prX0XysBfOcOZ/2ZA8Ot8qM1roPkQzNnVWUhMFm5L1AU8kGCeauJZDyO7nIcW+1qAYfttqp7E4LckF25c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=T51an9kg; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742832646;
	bh=Yt3UrsjkedkYE/1CYuEeJN8oJ93eMzK1Z86WS4MGAaw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=T51an9kgoMO6xmet3WCYCP90WzglJReKQMheqUVoZqg8TNXEMJ2jFJpSmTIYXpkM2
	 X2jhcU2liEBJg/VIBV09cNURdA7RtvOd28g0J4cO99sPAddfQRyRVbtXMLte07EROQ
	 bb1LFjHLuTiEuGPgaHdKcim+NIgVvDoPPzrvaZBBRHpA+IHBHLQsleOfpX4F1Y5q6d
	 rRJqK3440KK9fKG0z3t6a6INUKR+QxdrNpXz01Y58uDNBntrXuQT+WVvq0jIDXK3kl
	 YPy0NVBF+Nu65/E9awClszeYx2QF5s41CDOU0tbxwctRBvapbTAscchGorGM4dwWPp
	 Ex5BDM3J6GGzQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DB64417E0A62;
	Mon, 24 Mar 2025 17:10:44 +0100 (CET)
Message-ID: <334d0492-1707-4299-99c0-feacb5954de1@collabora.com>
Date: Mon, 24 Mar 2025 17:10:42 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] arm64: dts: mediatek: mt8196: Add pinmux macro
 header file
To: Cathy Xu <ot_cathy.xu@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>
Cc: Lei Xue <lei.xue@mediatek.com>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 yong.mao@mediatek.com, Axe.Yang@mediatek.com, Jimin.Wang@mediatek.com,
 Wenbin.Mei@mediatek.com, Guodong Liu <guodong.liu@mediatek.com>
References: <20250321084142.18563-1-ot_cathy.xu@mediatek.com>
 <20250321084142.18563-3-ot_cathy.xu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250321084142.18563-3-ot_cathy.xu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 21/03/25 09:39, Cathy Xu ha scritto:
> Add the pinctrl header file on MediaTek mt8196.
> 
> Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>
> Signed-off-by: Cathy Xu <ot_cathy.xu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



