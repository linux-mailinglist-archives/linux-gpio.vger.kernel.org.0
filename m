Return-Path: <linux-gpio+bounces-9042-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B5895C98B
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 11:49:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 354DC1C21542
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 09:49:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C04D14D710;
	Fri, 23 Aug 2024 09:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="aFalVEeg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C672D3BBC2;
	Fri, 23 Aug 2024 09:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724406535; cv=none; b=bNwB37awEY3/dxKaUaN/gydapM6FXAk5MnxD0mDCCDtkKe7D2kuZQqB3dIA+Q9osL8bf5dz/Zl4o73umVS4vG0FAlsL4iEV3lqXKB/1NLbFdTqH98yzApnGpV99X/bxFscauCy4MqV5+L/8Ht9rDvROYeoKomg3EMfc4hZPfR+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724406535; c=relaxed/simple;
	bh=h1xWXPHzrXPLCdrB79AAp1D1069JKR0kkedffJdQ448=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SlAJ8GBYsHN2Knxmrx68qdo0iGKGV25IsVnb0D2Rnf6LixE5OLpECsF0kSNweIqxRpN4tbdi2p4ZwngavsDImIo5UbguftwnJKb8PtiNxeqCs2fdRc9TUWVyL8ojaxSgivd8tJBs6s3Ag1OBIL1UHbcMJGAV6lb/WnMpWvetAWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=aFalVEeg; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=nYMPr8WyjPeQWRWVZs2WMwxKYUMtLVmh6JMdsc9vbyA=; b=aFalVEegxwCLNqld3X5vkG1HsK
	EYWFqDLp26dS1grO0wAxG8dhG1/2CnBU/TD7SbwVEnWo0YBtSekR8q0BtuY2CIFEF8VM5BIjYPmEh
	D8o2fEQZI2GxD8OY1/1x//Wc2N9qNyLD+OPfGNviL6EEbd8INkuZ4k+Q/6x3albeZftISnBNUbWSU
	PsGBBFB85gnwLEmYsDDHHODWsZ5s0miwSTLNp8xfq5Tz0kIV6/vEyGgM/M965Yy5d+0sCcSt1lSPL
	62r38r6OSWSK6MEhWlRoYO99nfspsiUH7w5S+oRDiChQHzfDBGwx29f0kheWFrP1CfBEseqVkf+Qo
	LOYdfaMQ==;
Received: from i5e861933.versanet.de ([94.134.25.51] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1shQuX-0003xF-Hz; Fri, 23 Aug 2024 11:48:49 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-kernel@vger.kernel.org,
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Shresth Prasad <shresthprasad7@gmail.com>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v4 3/4] dt-bindings: pinctrl: Add rk3576 pinctrl support
Date: Fri, 23 Aug 2024 11:49:30 +0200
Message-ID: <22692139.hxa6pUQ8Du@diego>
In-Reply-To: <20240822195706.920567-4-detlev.casanova@collabora.com>
References:
 <20240822195706.920567-1-detlev.casanova@collabora.com>
 <20240822195706.920567-4-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Donnerstag, 22. August 2024, 21:53:38 CEST schrieb Detlev Casanova:
> Add the compatible string for the rk3576 SoC.
> 
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
> index 20e806dce1ec..6a23d845f1f2 100644
> --- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
> @@ -45,6 +45,7 @@ properties:
>        - rockchip,rk3368-pinctrl
>        - rockchip,rk3399-pinctrl
>        - rockchip,rk3568-pinctrl
> +      - rockchip,rk3576-pinctrl
>        - rockchip,rk3588-pinctrl
>        - rockchip,rv1108-pinctrl
>        - rockchip,rv1126-pinctrl
> 





