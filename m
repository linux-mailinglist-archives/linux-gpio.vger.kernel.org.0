Return-Path: <linux-gpio+bounces-8419-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E208F93EEE1
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2024 09:47:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1CE421C21B9F
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2024 07:47:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59F59130A53;
	Mon, 29 Jul 2024 07:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="suYjNphf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1D812F5B7;
	Mon, 29 Jul 2024 07:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722239213; cv=none; b=bRFJbPqh35UKKpZwkMot1F08pQejipMGVrPcN67qDzGipVUNSGn/ebiYrkiSvOpyK1hwoMuj8DS21Ei4FcqBBLdIvHfDvL0Bd+kPf4nctD3+HoAQx23yAgyWJ2vWUnh3cXisLYy5u28McKjJLFPXiYnijv8QQLWQzjMO0NxsJEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722239213; c=relaxed/simple;
	bh=1LXsqzTga9W4w/wmKFvBRr8sGHy+KiZMbzrm21w6exw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l5dDiWrnCNuLr45fS1KUYt0lc5GDDCBYbOo/bnVAj4fIBXoRlB1C4zaPbt7oZ1kuWWFoWyrjm/vNjU7DvD9fAcgnLiRDFOeYUmiX59w1TiWKeZQxx/RXBSl/U7teWBJ48D5rHDSinlu4F3Z0h2fca7yJQaGaxP8L56TUtwPq63U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=suYjNphf; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722239209;
	bh=1LXsqzTga9W4w/wmKFvBRr8sGHy+KiZMbzrm21w6exw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=suYjNphfEbh4Zjwe0z6pP+/hXPD6caKMxdfxvy/aj6m0HkSMQ62ugyPdZEIYhT3Dm
	 p19WV44EKgQN84hWg2Tucbr3YcdpmwYgHKj7E7+mXudXsQt6e5xL/eE6gAvx5iCvMe
	 QQcRJFDYJoE8kDrKTelgiES2gSw0uqPV9uz9F3Cu8VSpdPB+yUZ9AjE2urVtHGb5EW
	 vUzZjvom2JVWEccYCUGLDWDFLJzFYiub1PVf/q6MWIZdy9SCMCIXvB7dHWrJcfzgh+
	 vcZg39qPsK9+nzd4KCxpMEKBaDhaKLU4+ecb+TY5Ep2KycAc4pIGb5Nr2/w0d2GCKf
	 jh7Bpe/nxZEfw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 6C2E4378205C;
	Mon, 29 Jul 2024 07:46:48 +0000 (UTC)
Message-ID: <2f23eb6c-150c-4ad3-9518-fc66c9383d83@collabora.com>
Date: Mon, 29 Jul 2024 09:46:48 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: clock: mt6765: Add missing PMIC clock
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
 <20240729073428.28983-2-me@adomerle.xyz>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240729073428.28983-2-me@adomerle.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 29/07/24 09:34, Arseniy Velikanov ha scritto:
> Add PWRAP clock binding and shift the following ones
> 
> Fixes: eb7beb65ac30 ("clk: mediatek: add mt6765 clock IDs")
> Signed-off-by: Arseniy Velikanov <me@adomerle.xyz>

Hello,

sorry, this breaks ABI. Please put the new clock at the end of the list
instead of putting it at the beginning.

Also, since mt6765 has no devicetrees upstream, technically this SoC was never
used by anything... so you can (please) avoid putting Fixes tag for this one.

Thanks,
Angelo

> ---
>   include/dt-bindings/clock/mt6765-clk.h | 131 +++++++++++++------------
>   1 file changed, 66 insertions(+), 65 deletions(-)
> 


