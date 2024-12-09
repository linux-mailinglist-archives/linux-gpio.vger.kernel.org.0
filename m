Return-Path: <linux-gpio+bounces-13642-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0AB9E92C1
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 12:50:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8327C280D57
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 11:50:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B73F221D80;
	Mon,  9 Dec 2024 11:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="SpuuzMHM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8AA218591;
	Mon,  9 Dec 2024 11:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733745044; cv=none; b=hvzJ7fXKcsMWdCvsCrmfSVA67WV1VXRogm6NnuZIhFdx9juC0t5yYQQMg7sBRIngvvJK5csEUBLVhh1F1tl2q75reiC5AfOn5TeGvwBeyCaKS+r2Ka8Z1V2EH5JRSG8DGildsNRnaZW8PHyVq8DY/S76aAumh6RduvVBSeVqweY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733745044; c=relaxed/simple;
	bh=2EW9RYFxrgic2qsmTCiUTRhYL8QZ0qEfNDT6mPIAkC8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a2FWVDTx0FQeRUfmG2ERPiATo8bwmV5ym03flBVC4pd/XjNMffoYgAkKsLyeFroIboK1IL65jBNM6nnpMUzsoqUQotiyVKeBgPhrWs43XdAOcLdbVpNPW5MWrDvb2ypejUkFUW9pcIiFQSZTPVIdhwh/0x6XFI4TaCx8ZSjuRSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=SpuuzMHM; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733745040;
	bh=2EW9RYFxrgic2qsmTCiUTRhYL8QZ0qEfNDT6mPIAkC8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SpuuzMHMJbY+uR7VXF8LnTPfkiiQgDmnu5T9ijGD3Ty1KgTJjda7PmxHt5gTlcJKm
	 q7C+KVbvEcnv9lumpkr2QZxaFjFlzJIEsYiaVaQd+vpX4He/fYQwBQ9wllCjXUb7ug
	 p7NdPDKzMgJ/3RxTx7ure5zY9f9/ylmBeurEQ+7ayMvF5LGcc7ry4pbI2xaw6darxz
	 YWZTMwqZBHsNbi9thB4kexH2SdWYIyhcCIV/bWDcuyRBT3EkvmgF3/1WzhheFdG5Pw
	 WFj1mm0EKyg4l31HW+c2VWLtk5Chnh8/ppyNmoHiy3EyTyUI/3DHceE97Nt9bs2vwq
	 a55EBc94b/p1w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A80E617E36AF;
	Mon,  9 Dec 2024 12:50:39 +0100 (CET)
Message-ID: <402d1717-f4f4-4ba6-b13c-5dd6e6c44490@collabora.com>
Date: Mon, 9 Dec 2024 12:50:38 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] dt-bindings: pinctrl: add binding for MT7988 SoC
To: Frank Wunderlich <linux@fw-web.de>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>
Cc: Frank Wunderlich <frank-w@public-files.de>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20241202110045.22084-1-linux@fw-web.de>
 <20241202110045.22084-4-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241202110045.22084-4-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 02/12/24 12:00, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> This adds bindings for MT7988 pinctrl driver.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

After you fix the issues pointed out in Rob's review,

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

