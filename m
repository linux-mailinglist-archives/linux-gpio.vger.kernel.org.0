Return-Path: <linux-gpio+bounces-25779-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B0308B4A45C
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 09:58:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D6FFD189939D
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 07:58:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BFBC23E359;
	Tue,  9 Sep 2025 07:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Z8Sau7pd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7AE23D7EC;
	Tue,  9 Sep 2025 07:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757404684; cv=none; b=WE2Fb7Yyf6Kzylw4Im3lBOGlq1xX8/HfMH27+CL2sV6GO5OJFm+XfruBJHoRZnB9uI0UXgtHYPXpFh3IN4xLidOLbbOJCodct7XwoU2l/WbKRXIB2fRsoa/Dh0opfpsMNMYokvlesHs1iKZYPkh1Qv2y1FTcMipMvu/L7fdZb0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757404684; c=relaxed/simple;
	bh=WfhVUdTdqrhQTMxkXedHVqfe26PZFY7f2SaOORN+FwM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WXUIFVXYhF5zY66qQiJ9CJRSWr8UR4wssEjsAn05sPTb8s6nDxRjJX6it7fpDQtsa9Kh2Gz11tND3WXCicxNxiWl34FRJnpzkmkhjado4tBj3veomGELyDE9Ft2qtQgWQhqTA+J2g3LbdeWKSjloz1h61+PvmqoNig8Ci8OiCjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Z8Sau7pd; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757404675;
	bh=WfhVUdTdqrhQTMxkXedHVqfe26PZFY7f2SaOORN+FwM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Z8Sau7pdiFyrn5ibuoTSKtq0nezhdLxN2tk/mizBYLiNWQQnzfZEOyxuaQovbBwMo
	 K3wp+6avbUyzj8BtFCaH2R5ZSOQ0aXTIbVNqamO4dCAAEXf4o8xMzrD46maJb6Q87p
	 MGarU/7byzuNX4V/be1OPSeN4R4HNCEbQs9omDj/Rr7/DGBRFkdrixgYcjOi2fDrAT
	 UisPxWjsb0Bdg54c108LjDQcE5kwJFbwWIshKJnZc8bSVDQ/EGXcgGU3CY54B9ckNH
	 FrA9J6EIRuQUDFLpSc5jBd5868Rl+J4qXQDpwsJWKjY1vJgVnbG92JHfg0gS9KKagE
	 YAB1LsG9RQpAA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 89A3117E04D6;
	Tue,  9 Sep 2025 09:57:54 +0200 (CEST)
Message-ID: <80a7339c-4742-45c1-b474-347a916b2db6@collabora.com>
Date: Tue, 9 Sep 2025 09:57:53 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] pinctrl: mediatek: Add support for eh bit
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250908-mt6878-pinctrl-support-v1-0-3fb78c8ab4e8@mentallysanemainliners.org>
 <20250908-mt6878-pinctrl-support-v1-2-3fb78c8ab4e8@mentallysanemainliners.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250908-mt6878-pinctrl-support-v1-2-3fb78c8ab4e8@mentallysanemainliners.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 08/09/25 21:17, Igor Belwon ha scritto:
> The eh bit is used for setting drive mode for i2c pins on recent SoCs.
> Add support for it.
> 
> Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>

Noupe, this commit is not needed at all.

I get that this may be tricky to understand... but summarizing, what the
downstream calls "EH" in upstream is "DRV_ADV" :-)

Check the comments on patch [4/4] about how to change EH to DRV_ADV.

Cheers,
Angelo

