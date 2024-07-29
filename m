Return-Path: <linux-gpio+bounces-8420-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6F493EEE6
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2024 09:47:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04D651F224DF
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2024 07:47:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2256013774B;
	Mon, 29 Jul 2024 07:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="F00f5056"
X-Original-To: linux-gpio@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B4613212E;
	Mon, 29 Jul 2024 07:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722239215; cv=none; b=qsoj4axRTvVrZoy8vdD/VHxyHFRCdOkubksw7qYKmoOAX/hDuTfY8U92dK54X1VEl2P1TCANt0iI/NcwizJhtYH0dw8exKS0dAsOQ+4ekSfNxUHOCIWIW8Jta/kRKHfgtDGMtOzeNXKz+ItumQE2z8RGRu5TUOtSyd1+97Y2Kq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722239215; c=relaxed/simple;
	bh=wefewgg8MA83GDqwLCK368+HHUQtMnN6KGd6v5VYzsQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h20+k0HaY7X01wswDlYmiEZu3rZJ1JchOLxJSwagXozZttwo0EUjTRFz37MtKB8XSx2gwEhUb6PCLPb5g0JeVmTgWDv+asOaZRFylXVyS0WehSh2kRydaYuwROMIECDYlpOv+5eloPbTv5qiFRgl1Hd/ReuHulNaT/KXI77AAbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=F00f5056; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722239212;
	bh=wefewgg8MA83GDqwLCK368+HHUQtMnN6KGd6v5VYzsQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=F00f5056aU2ltqDAaa41IgpodeL3kXhXjsYSvhz/FHygaJQhxdfRHiI7RtixmH1k7
	 EfSG9lA7CKQrfGymC5JGYoxCHtXUIyeZ2WOS1NlTGE2MG8sE1L/+ZCEhYOz7GSUjkX
	 2jfCZkJcI4XOxQcy4kR9iyKwnsDlmnTtemDJdRXDfNuvPhxreFfGxlriJ4LqzrqSrN
	 e4Sl08bBSB8unFDVi0jugtOObW6FGYGYuMXWyeFgtp6VDSapDgusNvJhSpzxyxO5JP
	 LeQx8KKS78ei5J8KZcY6YYkQ08MSI/APccaK88Hht4eDxiSHJfeYTz3SSZUxj4ydy8
	 uoC30p3iMmIiw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 606A7378215C;
	Mon, 29 Jul 2024 07:46:51 +0000 (UTC)
Message-ID: <a17a8a7d-3c58-4e9a-bdee-b5424e3ddf2b@collabora.com>
Date: Mon, 29 Jul 2024 09:46:51 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] dt-bindings: pinctrl: mediatek: Add bindings for
 MT6765 pin controller
To: Arseniy Velikanov <me@adomerle.xyz>, mturquette@baylibre.com,
 sboyd@kernel.org, matthias.bgg@gmail.com, sean.wang@kernel.org,
 linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, frank.li@vivo.com, jiasheng@iscas.ac.cn,
 mars.cheng@mediatek.com, owen.chen@mediatek.com, macpaul.lin@mediatek.com,
 zh.chen@mediatek.com, argus.lin@mediatek.com
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
References: <20240729073428.28983-1-me@adomerle.xyz>
 <20240729073428.28983-5-me@adomerle.xyz>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240729073428.28983-5-me@adomerle.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 29/07/24 09:34, Arseniy Velikanov ha scritto:
> Add DT bindings for the MT6765 pin controller, which consist of macros
> to be used as values for the pinmux property. Each macro corresponds
> to a unique possible pin-function combinations.
> 
> Signed-off-by: Arseniy Velikanov <me@adomerle.xyz>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



