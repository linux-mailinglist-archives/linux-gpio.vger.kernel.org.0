Return-Path: <linux-gpio+bounces-13984-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C0AAB9F6808
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Dec 2024 15:12:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 108A6167A0C
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Dec 2024 14:12:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD7921B4228;
	Wed, 18 Dec 2024 14:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Lc4RB1dN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B18156879;
	Wed, 18 Dec 2024 14:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734531157; cv=none; b=sglzYFNLmu8mryLhQ4FqtbwmsaWX7Wl5//xHoAjnOPqzzLqYQw+77W/HdSQy20inew+z5Z7KNgiugcI9wF+l0/LjyoKetHrPIKoWwSdUpHjR663Bb+YrU/hnpdgLfu9+59L/qk+QQt3P8gbShYEzVKxOOmogHWxHnsXDcOP8hGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734531157; c=relaxed/simple;
	bh=2pMdp5vfl6grQPYfJtfZtmDs7fBVN1MuzePWFk8sH2Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gK1gLb4662wcTLWRF0GgDdmxd2fhcTtKDUp9eR3vdLqAtzKBPyOawVcMtljicbL1iFFa66LKAkJ8CXlQNSeEqda1K+gZflEZQngHb0bYy+mJNXRl6rc/fWwTWGHPI/TFQeSzyZhHNm7E5wSkOw8ml7ftgNRmUCa8NnG2igwKdi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Lc4RB1dN; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734531153;
	bh=2pMdp5vfl6grQPYfJtfZtmDs7fBVN1MuzePWFk8sH2Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Lc4RB1dNylhjmtAckKIHPhIklnjaJ27hejlFd4sF0YodB3ZtDuQFKrM4QwgGg8PQs
	 ZC/1kvCr0Lj3dvWROhrqsJUMcnpTbWi3wwuDlU+rmALa4P1P1QXkiM5WFfbowoJ4XM
	 VYrMMEb9d1Wqra6pRneAaZObwa72hmlwpfANA33eUcy15Buh3Et1EkTNlzDrp4lMNS
	 3qLrOelKpsf8CMl1fmV8IxHBPRkBAbyzZUjFUzOHJtOy0RHK35ToLDRRuwwINy3qvt
	 7f/sGbTuMtw7NKaf9QRP5EDplFs+XOBNSYkoiKm2qF+68s4ad9qD2DMzN/nTrvsXuk
	 jWFQlUIrvJb5g==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DC1FB17E3770;
	Wed, 18 Dec 2024 15:12:32 +0100 (CET)
Message-ID: <e1b8084d-cfc2-4541-8264-91be777a8783@collabora.com>
Date: Wed, 18 Dec 2024 15:12:32 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/5] Add pinctrl support for mt7988
To: Frank Wunderlich <linux@fw-web.de>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>
Cc: Frank Wunderlich <frank-w@public-files.de>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20241217085435.9586-1-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241217085435.9586-1-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 17/12/24 09:54, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> This series adds pinctrl driver, dt-bindings and dts node for pinctrl
> on mediatek mt7988 SoC.
> 
> changes in v7:
> - add const for pins and mtk_pin_soc as suggested by Christophe JAILLET in v5
> - left angelos RB because of minor change (hope this is right)

It's fine, I re-reviewed it and it's good (actually, better!) :-)

Cheers,
Angelo

> 
> changes in v6:
> - some fixes to binding
> - changed title and fixed typo in bpi-r4 patch
> - added RB's
> 
> changes in v5:
> - rebased to 6.13-rc1
> - moved dt nodes with mutliple options to BPI-R4 board
> - changes suggested by angelo in v4
> - changed example in binding and dt node to not using const MTK_DRIVE_8mA
> 
> changes in v4:
> - fixed fixed string binding error
> 
> changes in v3:
> - rebase on rafals dts patches
> - update binding to have mux subnode as fixed string and conf with optional suffix
> 
> changes in v2:
>    binding:
>    - drop gpio-cells description
>    - move ref in mux subnode up
>    - order uart-functions alphanumeric and fix typo
>    dts:
>    - fix indentation of reg-values
> 
> Daniel Golle (2):
>    pinctrl: mediatek: add support for MTK_PULL_PD_TYPE
>    pinctrl: mediatek: add MT7988 pinctrl driver
> 
> Frank Wunderlich (3):
>    dt-bindings: pinctrl: add binding for MT7988 SoC
>    arm64: dts: mediatek: mt7988: Add pinctrl support
>    arm64: dts: mediatek: mt7988a-bpi-r4: Add pinctrl subnodes for bpi-r4
> 
>   .../pinctrl/mediatek,mt7988-pinctrl.yaml      |  575 ++++++
>   .../dts/mediatek/mt7988a-bananapi-bpi-r4.dts  |  189 ++
>   arch/arm64/boot/dts/mediatek/mt7988a.dtsi     |   54 +
>   drivers/pinctrl/mediatek/Kconfig              |    7 +
>   drivers/pinctrl/mediatek/Makefile             |    1 +
>   drivers/pinctrl/mediatek/pinctrl-mt7988.c     | 1556 +++++++++++++++++
>   .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  |   73 +-
>   .../pinctrl/mediatek/pinctrl-mtk-common-v2.h  |    1 +
>   8 files changed, 2445 insertions(+), 11 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt7988-pinctrl.yaml
>   create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt7988.c
> 



