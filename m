Return-Path: <linux-gpio+bounces-17839-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 564C9A6B678
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Mar 2025 09:59:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6823D7A65CD
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Mar 2025 08:58:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B6F91F03EC;
	Fri, 21 Mar 2025 08:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="sX2HDHvt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8596E1EFFB3;
	Fri, 21 Mar 2025 08:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742547545; cv=none; b=AidUcjnYAI5KQBwuMmyaLF5KKYlEFg12YQwPLDAhifXXs0UiBld2eWLeIJ8+Ey5SRxx+hk6i6y/xDK/tYLdo0u1L2lojTTjLxAlGKU+KaPUmMIpD95G7Xb0LglFbsg2oNM0IRmsMBhlZEJpeQ/VIl80QH7lPTjAqE0wDhdfN3Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742547545; c=relaxed/simple;
	bh=gdi5aoLZ4LlIjRWE5zaNEy5Y+dIXtOuTxRg/Y3iOsxE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gVefxuKxLftmTgSfYjW/qnGO2fEcKiabh4eywd947v3kuvIrY073TCO8LGp7Lm7k+Bx61/QxEdBPrSsS410QcjDlVb/6j2/bFSDbRNLf7V5tGioO4IC+fBoJq1kYuGXFHKxP0jempSdZ3jDIVt+Bdu65h7M/pJC4dFba/gZX+m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=sX2HDHvt; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: ba1c0b76063211f0aae1fd9735fae912-20250321
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=wgu8/qtKwrUevgUkDOpe6U4a4UoSX2UrXzvWZYVmHiw=;
	b=sX2HDHvtsC7SGyT2KLFnZ1q9NlQqyb0euZ3clRmZixl0qCuRGJYpSqy1Otts8+VQAyWfjDqGtURYhhZGmBXCl5Y5WR51hDeldMFq2F9VPnOSLwsDi6mBwmnsnY5hOISPr29DK3Ix7K2kh40T/Ve/qpia+krCBKkMEdgdzJm6VXY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:cffac599-598c-4068-85d5-fc3c635902d6,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:5ba8654a-a527-43d8-8af6-bc8b32d9f5e9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ba1c0b76063211f0aae1fd9735fae912-20250321
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <ot_cathy.xu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1289026274; Fri, 21 Mar 2025 16:58:58 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 21 Mar 2025 16:58:57 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 21 Mar 2025 16:58:56 +0800
From: Cathy Xu <ot_cathy.xu@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>
CC: Lei Xue <lei.xue@mediatek.com>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<yong.mao@mediatek.com>, <Axe.Yang@mediatek.com>, <Jimin.Wang@mediatek.com>,
	<Wenbin.Mei@mediatek.com>, Cathy Xu <ot_cathy.xu@mediatek.com>
Subject: [PATCH v5 0/3] pinctrl: mediatek: Add pinctrl driver on mt8196
Date: Fri, 21 Mar 2025 16:39:11 +0800
Message-ID: <20250321084142.18563-1-ot_cathy.xu@mediatek.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Changes in v5:
- Remove header file to fix dt-binding check error.
- Add /* sentinel */ in pinctrl-mt8196.c.

Changes in v4:
- Add rsel-resistence-in-si-unit and remove RSEL macro magic
  number in mediatek,mt8196-pinctrl.yaml.
- Add values in SI units option to |struct mtk_pin_soc| in
  pinctrl-mt8196.c.
- Move pinmux macro header file to arch/arm64/boot/dts/mediatek.

Changes in v3:
- Remove drive-strength-microamp & rsel-resistence-in-si-unit
  related description in mediatek,mt8196-pinctrl.yaml.
- Use pm_sleep_ptr() in pinctrl-mt8196.c to fix build error.

Changes in v2:
- Fix driver file's coding style.
- Add pinctrl binding document.

Cathy Xu (3):
  dt-bindings: pinctrl: mediatek: Add support for mt8196
  arm64: dts: mediatek: mt8196: Add pinmux macro header file
  pinctrl: mediatek: Add pinctrl driver on mt8196

 .../pinctrl/mediatek,mt8196-pinctrl.yaml      |  223 ++
 arch/arm64/boot/dts/mediatek/mt8196-pinfunc.h | 1574 ++++++++++
 drivers/pinctrl/mediatek/Kconfig              |   12 +
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt8196.c     | 1859 +++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8196.h | 2789 +++++++++++++++++
 6 files changed, 6458 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt8196-pinctrl.yaml
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8196-pinfunc.h
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8196.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt8196.h

-- 
2.45.2


