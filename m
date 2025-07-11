Return-Path: <linux-gpio+bounces-23146-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA656B01892
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 11:45:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F5558E033D
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 09:45:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEA8827E052;
	Fri, 11 Jul 2025 09:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="jYYsPlUT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D0820F07C;
	Fri, 11 Jul 2025 09:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752227131; cv=none; b=lEMx/CBkXUcpndi2iRYOWPGOS6QZ1m1coI6KT0G9iiqitV4Tg3L2wDy+HTS3m8uwsjk1cJuJ/nM2wRYmcv7+D3MLseYltiPFmNo+Zw88Xk5zR9/4uKVSPetvlG1Z3dZ20yZm90657Dvna/p5XekVGGpeFvHEcwmiXJ9c1HxQWAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752227131; c=relaxed/simple;
	bh=9pQfytPzzOeBUo37Fje/p+jXJ9D8dzhqa3GSTAPdyoQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=b2Ll6UJoc9hMQjTMBMkWhebQMmCOTU0F0GhuOFreBzXHYzgV0oHTXBa5FtLjLi+ZRCekypg343aDSDefwi4ZNqeZD5w7d0uGgldDkuw6TIaNXHtSamMe1qpN49xj57NDVLYl+yCAyQgZ3BX4STwguxwKEajUrXR81qmr2yrVm1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=jYYsPlUT; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: c2fbbd345e3b11f0b1510d84776b8c0b-20250711
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=ugswZi9v4nFVpgCGJexfIal8N3se7IPyZh1DkN9RTwQ=;
	b=jYYsPlUTyb6XCBAqkoNIkgpHV5ouToWYT814RsExmOFyTbLHq3K/qJKiDwTplqZm1a6FPMPkzuN1eFHgnn8o0zjwV52osIUAwOr+oW8IDTYbWCDavHPCz9ws055+VdqbWIhSrPM1iIvycdEqmMQZstviyJrJqqy1BhTudSCDrQg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:3c0adb97-35a3-4bd0-b5bd-dc004385f7a9,IP:0,UR
	L:0,TC:0,Content:0,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-30
X-CID-META: VersionHash:9eb4ff7,CLOUDID:2aee19d8-b768-4ffb-8a44-cd8427608ba6,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:2,IP:nil
	,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:
	1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c2fbbd345e3b11f0b1510d84776b8c0b-20250711
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <ot_cathy.xu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1608721168; Fri, 11 Jul 2025 17:45:21 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 11 Jul 2025 17:45:19 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 11 Jul 2025 17:45:18 +0800
From: Cathy Xu <ot_cathy.xu@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>
CC: Lei Xue <lei.xue@mediatek.com>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Yong Mao <yong.mao@mediatek.com>, Wenbin Mei <Wenbin.Mei@mediatek.com>, Axe
 Yang <Axe.Yang@mediatek.com>, Cathy Xu <ot_cathy.xu@mediatek.com>
Subject: [PATCH v2 0/3] pinctrl: mediatek: Add pinctrl driver on mt8189
Date: Fri, 11 Jul 2025 17:44:56 +0800
Message-ID: <20250711094513.17073-1-ot_cathy.xu@mediatek.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This patch series introduces support for the MT8189 pinctrl driver,
include the driver implementation, new binding document and pinctrl header file.

Changes in v2:
- Modify the coding style of dt-binding.

Cathy Xu (3):
  dt-bindings: pinctrl: mediatek: Add support for mt8189
  arm64: dts: mediatek: mt8189: Add pinmux macro header file
  pinctrl: mediatek: Add pinctrl driver on mt8189

 .../pinctrl/mediatek,mt8189-pinctrl.yaml      |  213 ++
 arch/arm64/boot/dts/mediatek/mt8189-pinfunc.h | 1125 ++++++++
 drivers/pinctrl/mediatek/Kconfig              |   12 +
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt8189.c     | 1700 ++++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8189.h | 2452 +++++++++++++++++
 6 files changed, 5503 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt8189-pinctrl.yaml
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8189-pinfunc.h
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8189.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt8189.h

-- 
2.45.2


