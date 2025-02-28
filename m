Return-Path: <linux-gpio+bounces-16767-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C818A4927D
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 08:53:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E388C7A5CE1
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 07:52:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ABC41C8636;
	Fri, 28 Feb 2025 07:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="M36+h/1W"
X-Original-To: linux-gpio@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340B5276D12;
	Fri, 28 Feb 2025 07:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740729217; cv=none; b=VfYMswSpdZRxInkrQGJ/MoGxhrd+LEVKHE8SwIMes9dptx7OkWIMwXPES/HJKLXtdQgZISJBHcJ11lzWh2as0bV/d3msjH1bt/Z+IADEhorTfI4KgX5ykiV1xv40iiIhcnc7c9TNCcew5W6SQ9RTbjV5+Gq3qWuN5rKgbIlJfiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740729217; c=relaxed/simple;
	bh=zzS8CQISV+5yhlCP3batqFzbj2l/A2CILvpJfZUPa1I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h3c1Y1GpQPnLwzzN0PHE8oFNEZ5sERJci0FE963ll1kQR5FFswgcMVkdOBM1QSueGDD0g2LNMjKTomfD3pzsaDH2y4x7YNALvT+M/46sKGDCL3QDphHOw62OKuu7QiD/dbWJ+tTS+QaOixbrXlOnehA06CdJet+xgpuXpXgr378=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=M36+h/1W; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=F+JzjQxRNFL6yDNf9+7cJLcCGEom5mmTMhziYT1IXJM=; b=M36+h/1W2S0DYGTc6rbsLXw8jq
	EcXI1tKGOGxAGW/eebzYTorjwGwTrVzsOwSQQNsB+MJAnd7xsE0MDjzel/cbK3ppft++P2TZJnk6O
	xy56vOwsKsAWvTL4+fc9nNidH2IZw7Lmy7dv/U1Akb6mSfd9yS4O7i/p+GvXe6CaiPB9wPYMtd8h3
	et4xXv5E88NOCku21rX1X8T1HBxLFcwud4y26eqbvpRFYCOqSEN6nAtd5H7hEgM5X47IcsyuLcXp8
	28S3ByUVbsOWLtZPjqiitBwZifc1sOrQn2AYTn4X5HXphmjgpBLnjOclGxts8TACa8FIsYnHTX5d1
	8DPgpYLw==;
Received: from i53875b47.versanet.de ([83.135.91.71] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tnvBV-0007Zk-Qn; Fri, 28 Feb 2025 08:53:25 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>
Cc: Yao Zi <ziyao@disroot.org>, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>
Subject: Re: [PATCH 2/7] dt-bindings: pinctrl: Add pinctrl support for RK3528
Date: Fri, 28 Feb 2025 08:53:24 +0100
Message-ID: <13293325.ZYm5mLc6kN@diego>
In-Reply-To: <20250228064024.3200000-3-jonas@kwiboo.se>
References:
 <20250228064024.3200000-1-jonas@kwiboo.se>
 <20250228064024.3200000-3-jonas@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Am Freitag, 28. Februar 2025, 07:40:08 MEZ schrieb Jonas Karlman:
> Add compatible string for RK3528 pin controller.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
> index 80a2b1934849..960758dc417f 100644
> --- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
> @@ -44,6 +44,7 @@ properties:
>        - rockchip,rk3328-pinctrl
>        - rockchip,rk3368-pinctrl
>        - rockchip,rk3399-pinctrl
> +      - rockchip,rk3528-pinctrl
>        - rockchip,rk3562-pinctrl
>        - rockchip,rk3568-pinctrl
>        - rockchip,rk3576-pinctrl
> 





