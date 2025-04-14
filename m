Return-Path: <linux-gpio+bounces-18771-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F1FA87B62
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Apr 2025 11:04:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EAAB3AC62B
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Apr 2025 09:03:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2E0B25EF87;
	Mon, 14 Apr 2025 09:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="HlFUZ5Rf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A43A25C71C;
	Mon, 14 Apr 2025 09:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744621434; cv=none; b=rPJgYe1FnDhAY6QxPYlzLIXl72icottYlG04B+vcsg7WLdQTOSt5WDS9CryrfrQtmKr5/alGxNiZSMg7mchrUKM3ze2mR/l18ArxQD0g9PzrTCuQPw0QUfA8Gu3LKswTuqg9OVyde6KDsqtEPcryb/jVPRfG8SpFEXyhjkWn570=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744621434; c=relaxed/simple;
	bh=LAT0BgQbCPYYeUrFypMShtj2rc1C0XoL44C8QAlySGM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gSgiJ3m30LcwtEu7J67nq78znJCzs9nmajR55cC/wuZ2kgXbIipyXIUVTVGzKGgaUR6Fti/RfHyPB//zThYZ31/D/Rf1QQxvzvSn+TEB9N6yyCTp7TQMVsIWTdFV8QZQgar0g9+A/XJgYFphPuY3eQ2UIJQ4d5UcIzvItlPF7F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=HlFUZ5Rf; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 5e60492e190f11f08eb9c36241bbb6fb-20250414
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=KYJWpcm80GWs45Q4a62R/BJuN0ukztFixJ7xVAURG3g=;
	b=HlFUZ5Rf/i/mB1+LrYVUp2HoT0caQYChwGeIqF20wlQOJ9MI1hfjn9tiGz3g1y9e5CxKWpIaPm8oaxRAf9u4s8Z+9fnSa+jfA2W9Oi/uY+93fH24KvC5lQa6Z85UoGrTepcU6lFPPkeS6RzGeyNdsy0r8Ls6NS9QdwfhkkUKIgg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:195732db-4071-45db-8101-732f586e69b6,IP:0,UR
	L:0,TC:0,Content:0,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-30
X-CID-META: VersionHash:0ef645f,CLOUDID:96d8388b-0afe-4897-949e-8174746b1932,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:2,IP:nil
	,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:
	1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 5e60492e190f11f08eb9c36241bbb6fb-20250414
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <ot_cathy.xu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1244373102; Mon, 14 Apr 2025 17:03:44 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 14 Apr 2025 17:03:43 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 14 Apr 2025 17:03:42 +0800
From: Cathy Xu <ot_cathy.xu@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>,
	Lei Xue <lei.xue@mediatek.com>
CC: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <yong.mao@mediatek.com>,
	<Axe.Yang@mediatek.com>, <Andy-ld.Lu@mediatek.com>,
	<Wenbin.Mei@mediatek.com>, <Jimin.Wang@mediatek.com>, Cathy Xu
	<ot_cathy.xu@mediatek.com>
Subject: [PATCH v7 0/3] pinctrl: mediatek: Add pinctrl driver on mt8196
Date: Mon, 14 Apr 2025 16:59:25 +0800
Message-ID: <20250414090215.16091-1-ot_cathy.xu@mediatek.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Changes in v7:
- Add eint registers in dt-binding.

Changes in v6:
- Simplify the register description and adjust the order of properties
  in dt-binding.

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

 .../pinctrl/mediatek,mt8196-pinctrl.yaml      |  236 ++
 arch/arm64/boot/dts/mediatek/mt8196-pinfunc.h | 1574 ++++++++++
 drivers/pinctrl/mediatek/Kconfig              |   12 +
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt8196.c     | 1859 +++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8196.h | 2789 +++++++++++++++++
 6 files changed, 6471 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt8196-pinctrl.yaml
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8196-pinfunc.h
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8196.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt8196.h

-- 
2.45.2


