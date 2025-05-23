Return-Path: <linux-gpio+bounces-20518-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFDFAC1FEF
	for <lists+linux-gpio@lfdr.de>; Fri, 23 May 2025 11:43:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B13D1BC7553
	for <lists+linux-gpio@lfdr.de>; Fri, 23 May 2025 09:43:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC16222540B;
	Fri, 23 May 2025 09:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="n5ufv5+R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD51B2253AB;
	Fri, 23 May 2025 09:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747993416; cv=none; b=OiXlrE8IObqae7HnbcPOMoNXoxk6V4EBVYZo3L27k/qv6TmQ9tavePhr8WY79Ux7L4fIAVGe81xga4U2n15U25nMiAS7XCTESXfZzDLQql4+l8fsmeVTso+gNOueRdcuU26Cklv9mlMYrMM27kY8VuEG4Mey9zda03TbHVAGdts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747993416; c=relaxed/simple;
	bh=8O6CnSzPzolWxsU34liNKl4NFx4jJM+O5ROyYLtj+8w=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=adD44oLyT9SxCfsUZedrpYsfTiokWHixWLZdZDgW4KNp3B1RZ4q76/LDhjQwRahJtM5lMV9tToNoOr5ylQsTW2DvfloojW6DO3UoSPfDYNQuFLJUxkpjplUil55/WYaG4bs4cNIeNBDPuVoBDJYaSwdszwObck+xdZ0ycOEUAUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=n5ufv5+R; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 612d148837ba11f0813e4fe1310efc19-20250523
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=8JFy9P5cfXtLYBdVWIyXjRB3r7z+5ZYiGzT0NsfoK/M=;
	b=n5ufv5+RBkh3X+5bg5bGKKtBj4V64a8OafQdNsYeFVpDc1Y2wM8LTlwfJLjHnpFxUugrl9ioG1JV54oEhc0N6v9TAxBUbU5UGwRlusJ436NV+hxUxQoCO8aP3SVSynxOT/HQmly0hfQvtWiCjOC0Boi4xZpXMH8l2bONuf4/0NM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:38b7b516-f68c-4da6-85c4-2c10bae8b469,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:ee7e0959-eac4-4b21-88a4-d582445d304a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 612d148837ba11f0813e4fe1310efc19-20250523
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ot_cathy.xu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1439918142; Fri, 23 May 2025 17:43:28 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 23 May 2025 17:43:25 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 23 May 2025 17:43:24 +0800
From: Cathy Xu <ot_cathy.xu@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>,
	Lei Xue <lei.xue@mediatek.com>
CC: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Yong Mao <yong.mao@mediatek.com>,
	Wenbin Mei <Wenbin.Mei@mediatek.com>, Axe Yang <Axe.Yang@mediatek.com>, Cathy
 Xu <ot_cathy.xu@mediatek.com>
Subject: [PATCH 0/3] pinctrl: mediatek: Add pinctrl driver on mt8189
Date: Fri, 23 May 2025 17:42:45 +0800
Message-ID: <20250523094319.10377-1-ot_cathy.xu@mediatek.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This patch series introduces support for the MT8189 pinctrl driver, include
the driver implementation, new binding document and pinctrl header file.

Cathy Xu (3):
  dt-bindings: pinctrl: mediatek: Add support for mt8189
  arm64: dts: mediatek: mt8189: Add pinmux macro header file
  pinctrl: mediatek: Add pinctrl driver on mt8189

 .../pinctrl/mediatek,mt8189-pinctrl.yaml      |  217 ++
 arch/arm64/boot/dts/mediatek/mt8189-pinfunc.h | 1125 ++++++++
 drivers/pinctrl/mediatek/Kconfig              |   12 +
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt8189.c     | 1700 ++++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8189.h | 2452 +++++++++++++++++
 6 files changed, 5507 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt8189-pinctrl.yaml
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8189-pinfunc.h
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8189.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt8189.h

-- 
2.45.2


