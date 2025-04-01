Return-Path: <linux-gpio+bounces-18144-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF539A7789C
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Apr 2025 12:15:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D7AF16BAAA
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Apr 2025 10:15:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 383AD1F12EA;
	Tue,  1 Apr 2025 10:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="StTymTb2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426021F098E;
	Tue,  1 Apr 2025 10:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743502525; cv=none; b=l+thComx74jWr98/iqvSJiU3uhTG+WOrf9gC2isLwQiQ2TvYTuyuRQiBOcSVq0n9ZfImux9wL8uAQc9UlpIRnSUZZhF2MRiAWv3w3yvBhK9znBmJjdl+XseLrEc+0oIavURioFzhn03VNW0xASdvxwEiw06jtpiALVTSANQ1umQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743502525; c=relaxed/simple;
	bh=YXUmerGyYWvqMduAyNy9qqhBz9oGELjAjgHksXK1h2Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZEm/aA8D24ODogiyJTImECyXX6O9aaSe3UM68Ns5N0C/r8nO73O+deZpBqlkwry0czI3L9VoPvfdOnCbGyMYfE5Pc/NSuns539a/Xd9gilzmUsMUuapN+I9D5zgpwhQoCjz9m3p2xSd2v1bP1/jythX1MhSH+OxRdNXiC/zPjNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=StTymTb2; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743502520;
	bh=YXUmerGyYWvqMduAyNy9qqhBz9oGELjAjgHksXK1h2Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=StTymTb2hZ8pzt13grHON4yU0oEsiPeZlDpfL3OwUUyEQ8Cbol+DIpfV6EdotEdPh
	 4Md79l92/BI9wDBaQgIPji7FCnuJmVxTznVDcX6liZ+iZwEmtqFsGxKciqIdXPRh3D
	 w0RF8ffMLiI/VQpkDeLY1afNY+OxjZLXRKHj6c39fDbclYom5JIpoOuiX3H86i94jE
	 ZOarsPKvGLtITZdpKPS30ACmRYq1XOckf9ktk8+WDfGXyy6OGoexwGD8lEfSnAPW1t
	 MQ+d9p6XWh5cZ29H/dyd4AqGpQnIiey68IPJ0Z6XnT0HD3ROmFLTVa4cEyN2OcB1he
	 q2qrptrEsZKhA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8995417E0FC3;
	Tue,  1 Apr 2025 12:15:19 +0200 (CEST)
Message-ID: <92a25c22-f5da-4a02-9372-91bd905d76eb@collabora.com>
Date: Tue, 1 Apr 2025 12:15:19 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] arm64: dts: mediatek: mt8196: Add pinmux macro
 header file
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
 <20250401054837.1551-3-ot_cathy.xu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250401054837.1551-3-ot_cathy.xu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 01/04/25 07:48, Cathy Xu ha scritto:
> Add the pinctrl header file on MediaTek mt8196.
> 
> Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>
> Signed-off-by: Cathy Xu <ot_cathy.xu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



