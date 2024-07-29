Return-Path: <linux-gpio+bounces-8417-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7513493EEDA
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2024 09:46:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A574E1C21BB7
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2024 07:46:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AD3612C491;
	Mon, 29 Jul 2024 07:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="PZkJq/eB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37656F30E;
	Mon, 29 Jul 2024 07:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722239207; cv=none; b=uaR9CscRC1m2q/1+uZZ7qP0pDZrysimYwKjJBO6wMjuj+Cf7G7i8oshdQ06DiUlnmtNlET1h4QE6L67tskwHJrb2wIxJPrWUw4CSBMYLnK/lfDWydENqaR1TqRDgOxRCqIibv8NvL6/25Qirb4js4gteIEZvti5OsqZpQEAF9CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722239207; c=relaxed/simple;
	bh=OIF5E7D7uDH2UugAidNpKFODIsp2ZY00VQ0wHKRRsD4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ChrQMhuSBmL+rqZjLoNssIQpx61urq0ghbdH1gUn4kp7zFhn1etGbRvJZ7l7Xy4FjH4arcV/mXxJYx5u8chwuqmVxHdm3SScWuUa7wN8KYfjKoA3mNyBsTWrYzqi/bUCtfJUTbbTlmXCc8eb7kQvoxNyxAgCVJjvWh77isuTFhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=PZkJq/eB; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722239203;
	bh=OIF5E7D7uDH2UugAidNpKFODIsp2ZY00VQ0wHKRRsD4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PZkJq/eBERYtYY90vFW0bOwn3qwqrQuScw7QeFpwiZsv9ASvHNRalE+cYJguuJDWE
	 HPLRxR8986pyiYG84OY82zCPnIYRMBkRaHonxhHaNBMfLktsrLgf5FKv/RNUG6w7FY
	 z2VUlCsQQHClLX7SP2Ny0E+Z08b4EG9n9ymPC4bVZO/Gi6/QzR8rfjSLtG4+C/fqNe
	 GRqdQXI/Apl337FuA93Yz2LrCumdY2EfqqCDvWNzgMCGl9Uf4LYJLW2QT909/XnxDk
	 DZaayWUd46eWGGMcH+QOCZeqHYN9p0sj/FvqCae7TpwKclK9Gys0JjiUUsblrSo23W
	 McJ9gGWGT1IyQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5615A378148F;
	Mon, 29 Jul 2024 07:46:42 +0000 (UTC)
Message-ID: <9f3e5fa4-0973-45de-98aa-806af8981414@collabora.com>
Date: Mon, 29 Jul 2024 09:46:41 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] clk: mediatek: mt6765: Add missing PMIC clock
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
 <20240729073428.28983-3-me@adomerle.xyz>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240729073428.28983-3-me@adomerle.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 29/07/24 09:34, Arseniy Velikanov ha scritto:
> Add PWRAP gate
> 
> Fixes: 1aca9939bf72 ("clk: mediatek: Add MT6765 clock support")
> Signed-off-by: Arseniy Velikanov <me@adomerle.xyz>

Agreed, but please remove the fixes tag and add a better commit description.
Something like...

Add the missing PWRAP gate clock, used for communicating with the PMIC through
the PMIC Wrapper hardware.

Cheers,
Angelo

> ---
>   drivers/clk/mediatek/clk-mt6765.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/mediatek/clk-mt6765.c b/drivers/clk/mediatek/clk-mt6765.c
> index d53731e7933f..4f03a0df4ff0 100644
> --- a/drivers/clk/mediatek/clk-mt6765.c
> +++ b/drivers/clk/mediatek/clk-mt6765.c
> @@ -559,6 +559,7 @@ static const struct mtk_gate ifr_clks[] = {
>   	/* INFRA_TOPAXI */
>   	/* INFRA PERI */
>   	/* INFRA mode 0 */
> +	GATE_IFR2(CLK_IFR_PMIC_AP, "ifr_pmic_ap", "axi_ck", 1),
>   	GATE_IFR2(CLK_IFR_ICUSB, "ifr_icusb", "axi_ck", 8),
>   	GATE_IFR2(CLK_IFR_GCE, "ifr_gce", "axi_ck", 9),
>   	GATE_IFR2(CLK_IFR_THERM, "ifr_therm", "axi_ck", 10),




