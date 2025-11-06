Return-Path: <linux-gpio+bounces-28157-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBCEC39BD0
	for <lists+linux-gpio@lfdr.de>; Thu, 06 Nov 2025 10:06:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 28B523503DB
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Nov 2025 09:06:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 251B3309F0C;
	Thu,  6 Nov 2025 09:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Z/7D3Ge/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204AD309F09;
	Thu,  6 Nov 2025 09:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762419960; cv=none; b=GgiXgoU218RWsgQoElrwYvHDMoUvyo4FcMGShzPqlhAPVdDteEuoMN35U+Wma1dS41RCFal/Hik3u/E1/Bh32RdJYcUdHif3R1Bu9x3jXBre6c31ioksk4z9TRYJ3XsuBA1fgrKubvp8r/y4IRi+iEx/8kCTTWeFDGBYq5g8ReM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762419960; c=relaxed/simple;
	bh=eD0rL65tW8KTbO/83c/0IXmvaTMOrDt+ULFQsqK82B0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fAQZCJeVPk+HH89ybCT+pZ2aVZQiW0DBzSW5GQkYEqHzSUfKhmR+XkvzA8PVOpWc+IRC/9b8q6+iq73qY5ez4KlHLFQlx2GvNs8WJeZGtYRqPdkXQ4ZDWSH2NtM+tmEwH7V/ez35IFde88q2EbyCL1oKz01/L2uj6Q6fDow45NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Z/7D3Ge/; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1762419957;
	bh=eD0rL65tW8KTbO/83c/0IXmvaTMOrDt+ULFQsqK82B0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Z/7D3Ge/ggB5syz3wmbUdcRsuAECjEbwHTdaGWylKj2ZdK23tZU2DB6vIiqSZqcAQ
	 UsjphWouQUYKqrAjPmMCywqjWQkxSINNBgXd1dafQ9Mr7eLhIwulM0AVQkXUl8ZCUf
	 6wkTsaVhy+BqsG+RtQRIXsCwoVCfGCzk1l6CfwBdq807RfSsODFjYh9p6Yq15lJeov
	 W2ZW1JmI9Hr22qzLb9Qc+KMAY9HWq3m1/BYg8VEv6AfhbiAOtLoa3dWgKWjCGh65Ew
	 iHWJ77co8exGRwGYfLc7t1IUot4WHv+uhayC8uKMYBqlamMU5QKlPYd3P/zKVeVGi7
	 Tu/rEkrz8OSCQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C2EB617E1396;
	Thu,  6 Nov 2025 10:05:56 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Frank Wunderlich <linux@fw-web.de>
Cc: Frank Wunderlich <frank-w@public-files.de>, 
 Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20251105195007.199229-1-linux@fw-web.de>
References: <20251105195007.199229-1-linux@fw-web.de>
Subject: Re: (subset) [PATCH v2 0/5] Add Bananapi R4 Pro support
Message-Id: <176241995673.33143.16010766516310474191.b4-ty@collabora.com>
Date: Thu, 06 Nov 2025 10:05:56 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3

On Wed, 05 Nov 2025 20:50:00 +0100, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> BananaPi R4 Pro is a MT7988A based board which exists in 2 different
> hardware versions:
> 
> - 4E: 4 GB RAM and using internal 2.5G Phy for WAN-Combo
> - 8X: 8 GB RAM and 2x Aeonsemi AS21010P 10G phys
> 
> [...]

Applied to v6.18-next/dts64, thanks!

[2/5] arm64: dts: mediatek: mt7988: Disable 2.5G phy and enable at board layer
      commit: 0e5d9e529383688deccce632c713692e53b31cf6
[3/5] arm64: dts: mediatek: mt7988: Add devicetree for BananaPi R4 Pro
      commit: f397471a6a8c2b621e1fd06430fc528ab3925422
[4/5] arm64: dts: mediatek: mt7988a-bpi-r4-pro: Add PCIe overlays
      commit: dec929e61a42ed5d6717d3ec2b6a7734c2ab825b
[5/5] arm64: dts: mediatek: mt7988a-bpi-r4pro: Add mmc overlays
      commit: a58c368067417f3d89b92ccc18fa0bb610b34349

Cheers,
Angelo



