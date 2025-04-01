Return-Path: <linux-gpio+bounces-18133-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C509EA77417
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Apr 2025 07:49:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E61603AC6A8
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Apr 2025 05:48:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C84981DE2BD;
	Tue,  1 Apr 2025 05:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="aUS77l+6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD8235966;
	Tue,  1 Apr 2025 05:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743486546; cv=none; b=JFxjLXGCh2JdgtB9PYrf+M0cuqzDrK+LnKobJh9HxiDiSwgemWkKUxg+6v7ChacWUQSsTdoaL1mJJMp+OZrc4OasfJ36BgL8YsZA8iU/J/a3QSyN2EG0Nob731554zra9a5H6uPKjwBysEB03bTTHxm6oVHHEJwekPMh5+lYEVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743486546; c=relaxed/simple;
	bh=4ck3CYGW3Vg+HHDmnKzNFjxEDklhvy/u2mK3FYu2Rrs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=odgYQWe2h2QMG8KLo2r9RUy6H5jwanzNGa80+LuSIM21cq4G2+if+xjN72NQCnk51wUdgpH1O+TRpFGLW8XZyaVQNBWWpBgSHwbahKQbp05Iv5wdUZWpJM8bjGJnoj/VgV/KmkX79gUBcKgw/EHsNJRuxVm3PnR2caND6lF3REA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=aUS77l+6; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: ffed9f6a0ebc11f08eb9c36241bbb6fb-20250401
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=oLzSObFZ8GWkeA06gsbil9g+nG95as4Jy0XV74XNVOs=;
	b=aUS77l+67qTKhG9GL93v3Hy3MSGOpMdhYeOiO077pRuC3h0AFHyo+qBvQolnngilnZOp9QA8fLmnyIvvaF8DyHGpZelq8Kamk6GzeiSh/ZJTh0zX5DVv+5g5Oh6atiUEvClZYJGHLN2bo6aYkUd1OyO6Z8iBGCMv2R9zkw1ExwA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:a8dac336-6607-4da1-8401-9dab92325dca,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:70c50ac7-16da-468a-87f7-8ca8d6b3b9f7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ffed9f6a0ebc11f08eb9c36241bbb6fb-20250401
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <ot_cathy.xu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 630762457; Tue, 01 Apr 2025 13:48:55 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 1 Apr 2025 13:48:54 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 1 Apr 2025 13:48:53 +0800
From: Cathy Xu <ot_cathy.xu@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>,
	Lei Xue <lei.xue@mediatek.com>
CC: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <yong.mao@mediatek.com>,
	<Axe.Yang@mediatek.com>, <Jimin.Wang@mediatek.com>,
	<Wenbin.Mei@mediatek.com>, <Andy-ld.Lu@mediatek.com>, Cathy Xu
	<ot_cathy.xu@mediatek.com>
Subject: [PATCH v6 0/3] pinctrl: mediatek: Add pinctrl driver on mt8196
Date: Tue, 1 Apr 2025 13:48:09 +0800
Message-ID: <20250401054837.1551-1-ot_cathy.xu@mediatek.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

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

 .../pinctrl/mediatek,mt8196-pinctrl.yaml      |  220 ++
 arch/arm64/boot/dts/mediatek/mt8196-pinfunc.h | 1574 ++++++++++
 drivers/pinctrl/mediatek/Kconfig              |   12 +
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt8196.c     | 1859 +++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8196.h | 2789 +++++++++++++++++
 6 files changed, 6455 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt8196-pinctrl.yaml
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8196-pinfunc.h
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8196.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt8196.h

-- 
2.45.2


