Return-Path: <linux-gpio+bounces-17235-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 530E2A56817
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Mar 2025 13:49:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 403E23B63F8
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Mar 2025 12:48:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0D8D219A6B;
	Fri,  7 Mar 2025 12:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="i84q0r2M"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C64184E;
	Fri,  7 Mar 2025 12:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741351735; cv=none; b=OtpcONT2ehl6MkmExhHcl10bY+tebp/hzacPWcvJ2Xv7Q5BhzLBQa0RvH5pcc9ixrdDRKANc+Sj12ZEnS17PKm80Xf2swKQrLVZ+ZJVTZ0WyPFHCAkkFcQZR82U1z9S5RPWtpvnf3jASYvmfzwQMptIMClLyCGnToSi0Q+ROVaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741351735; c=relaxed/simple;
	bh=Qx0eR6ifW003J6H6uGcA4Q0ERrSnpHS3FBSvx5nlccU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=l28pFjQcY0a7xNnNsm75hWRP+sN2aUB3MwEHrJiD9x97OqhP/Fv8PGz5w1fiBSvRPL6pzRVPFvUAO8Roe/w8lnIyfrEA14OTDarNXSV+sSomYKZAarhOwNrhqLP8oV8R/bH0HXVMwO1KUwa4QT8slI1t0vgqcr2k7effxtspwxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=i84q0r2M; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 823ec170fb5211ef8eb9c36241bbb6fb-20250307
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=T9Q64H7eOqwbabEl9fMLo/Azsox+IgNpX2vvtqqW2qw=;
	b=i84q0r2MXPRG68MkBg/YXfM/45iplZe6eYKHIcISNB/VEuz8tFdMJcUQLKTnOgfg3KOMc/gCf6F6XRB+8pLFJX2HuqX1IfqJdz6RljVnOWSSLYBDb7+B6zwHcEJtRawCmjh4S2iypqPPsyk6qGJxXtbGrctlc6Q4lPx0hgVnbgo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:79c727e7-328c-49b3-8d58-4077f467e8d7,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:2413d249-a527-43d8-8af6-bc8b32d9f5e9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|102,TC:nil,Content:0|50,EDM:-3,IP
	:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 823ec170fb5211ef8eb9c36241bbb6fb-20250307
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <darren.ye@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1057125565; Fri, 07 Mar 2025 20:48:46 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 7 Mar 2025 20:48:45 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 7 Mar 2025 20:48:44 +0800
From: Darren.Ye <darren.ye@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Linus
 Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
CC: <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>, Darren Ye
	<darren.ye@mediatek.com>
Subject: [PATCH 00/14] ASoC: mediatek: Add support for MT8196 SoC
Date: Fri, 7 Mar 2025 20:47:26 +0800
Message-ID: <20250307124841.23777-1-darren.ye@mediatek.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

From: Darren Ye <darren.ye@mediatek.com>

This series of patches adds support for Mediatek AFE of MT8196 SoC.
Patches are based on broonie tree "for-next" branch.

---
This series patches dependent on:
[1]
https://lore.kernel.org/all/20250307032942.10447-1-guangjie.song@mediatek.com/

Darren Ye (14):
  ASoC: mediatek: common: modify mtk afe common driver for mt8196
  ASoC: mediatek: common: modify mtk afe platform driver for mt8196
  ASoC: mediatek: mt8196: add common header
  ASoC: mediatek: mt8196: add common interface for mt8196 DAI driver
  ASoC: mediatek: mt8196: support audio clock control
  ASoC: mediatek: mt8196: support audio GPIO control
  ASoC: mediatek: mt8196: support ADDA in platform driver
  ASoC: mediatek: mt8196: support I2S in platform driver
  ASoC: mediatek: mt8196: support TDM in platform driver
  ASoC: mediatek: mt8196: support CM in platform driver
  ASoC: mediatek: mt8196: add platform driver
  dt-bindings: mediatek: mt8196: add audio AFE document
  ASoC: mediatek: mt8196: add machine driver with mt6681
  dt-bindings: mediatek: mt8196: add mt8196-mt6681 document

 .../bindings/sound/mediatek,mt8196-afe.yaml   |   259 +
 .../sound/mediatek,mt8196-mt6681.yaml         |   122 +
 sound/soc/mediatek/Kconfig                    |    30 +
 sound/soc/mediatek/Makefile                   |     1 +
 sound/soc/mediatek/common/mtk-afe-fe-dai.c    |    30 +-
 sound/soc/mediatek/common/mtk-afe-fe-dai.h    |     6 +
 .../mediatek/common/mtk-afe-platform-driver.c |    63 +-
 .../mediatek/common/mtk-afe-platform-driver.h |     5 +
 sound/soc/mediatek/common/mtk-base-afe.h      |    13 +
 sound/soc/mediatek/mt8196/Makefile            |    19 +
 sound/soc/mediatek/mt8196/mt8196-afe-clk.c    |   698 +
 sound/soc/mediatek/mt8196/mt8196-afe-clk.h    |   313 +
 sound/soc/mediatek/mt8196/mt8196-afe-cm.c     |    94 +
 sound/soc/mediatek/mt8196/mt8196-afe-cm.h     |    23 +
 sound/soc/mediatek/mt8196/mt8196-afe-common.h |   290 +
 .../soc/mediatek/mt8196/mt8196-afe-control.c  |   109 +
 sound/soc/mediatek/mt8196/mt8196-afe-gpio.c   |   239 +
 sound/soc/mediatek/mt8196/mt8196-afe-gpio.h   |    58 +
 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c    |  5134 +++++++
 sound/soc/mediatek/mt8196/mt8196-dai-adda.c   |  2207 +++
 sound/soc/mediatek/mt8196/mt8196-dai-i2s.c    |  4399 ++++++
 sound/soc/mediatek/mt8196/mt8196-dai-tdm.c    |   837 ++
 .../mediatek/mt8196/mt8196-interconnection.h  |   121 +
 sound/soc/mediatek/mt8196/mt8196-mt6681.c     |   879 ++
 sound/soc/mediatek/mt8196/mt8196-reg.h        | 12133 ++++++++++++++++
 25 files changed, 28055 insertions(+), 27 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8196-afe.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8196-mt6681.yaml
 create mode 100644 sound/soc/mediatek/mt8196/Makefile
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-afe-clk.c
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-afe-clk.h
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-afe-cm.c
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-afe-cm.h
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-afe-common.h
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-afe-control.c
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-afe-gpio.c
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-afe-gpio.h
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-dai-adda.c
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-dai-i2s.c
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-dai-tdm.c
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-interconnection.h
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-mt6681.c
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-reg.h

-- 
2.45.2


