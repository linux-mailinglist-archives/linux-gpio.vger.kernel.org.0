Return-Path: <linux-gpio+bounces-14814-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A464A11A1B
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2025 07:51:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27721168C18
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2025 06:51:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D97F922F837;
	Wed, 15 Jan 2025 06:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="seLoQJ07"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4809722F383;
	Wed, 15 Jan 2025 06:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736923890; cv=none; b=Z6hXmKX/y7UZQqlLI00+GjVO1ziiwNo4S9L2VFh08Q+xM/1D+ugIbJyIsWWxjp1l0croMiSBAFZnrTUTgBlRwNeWLQPHPCH8CjM7mw1SIPSwmnI+QkxnwnNdZL80zppShauiy2hyluc1vHItE13nzItMgk9kT4YrkatlyakCXWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736923890; c=relaxed/simple;
	bh=TcUZwIOVrGoREH3F7Up6fKhVv3bIooUGMeR72MbG1xw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DlxD/r4hOLdWWDO76pmvSyk4t40BAwlFALXqtLI0y3mgfP2j3XXxfoJyWUGf7LDDJgEfb/7PGECuZieA9KddyWTzqc8YPGyQ6TqNarV+WVWJqjx8mI2+95emwfJJqxQ7LLqUS6E48tSUTpZkNjELMS4uuiK6QVumpdSCojw5YAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=seLoQJ07; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 04697e26d30b11efbd192953cf12861f-20250115
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=RW+aY5XpsCKt8NyJHK435g5mg+Zd2fJskS2OpXAM0N0=;
	b=seLoQJ070EuhZlGxCORFR9OHHmdaigXnmWFcbVy94N5IZIpKaBHlDWfZiAZyy15NeeUs+ViIRhK1Ul65B/f21acTkKuV1ZusZJ97NGwqKYSXn5uFF85wATZiR/ndZuXzzktoF0aJsyYDAFe7pHDxqMG9SSuL26J1bbY7+Z18E6Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:bfa2c399-01ad-4eaf-a69b-ab1d72687871,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:7d700f85-0f10-4f52-bb41-91703793d3e4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 04697e26d30b11efbd192953cf12861f-20250115
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <ot_cathy.xu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1911246317; Wed, 15 Jan 2025 14:36:14 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Wed, 15 Jan 2025 14:36:13 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Wed, 15 Jan 2025 14:36:12 +0800
From: Cathy Xu <ot_cathy.xu@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>,
	Lei Xue <lei.xue@mediatek.com>, <wenbin.mei@mediatek.com>
CC: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Cathy Xu <ot_cathy.xu@mediatek.com>
Subject: [PATCH v3 0/2] MediaTek pinctrl patch on mt8196
Date: Wed, 15 Jan 2025 14:35:37 +0800
Message-ID: <20250115063555.32492-1-ot_cathy.xu@mediatek.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Changes in v3:
- remove drive-strength-microamp & rsel-resistence-in-si-unit
  related description in mediatek,mt8196-pinctrl.yaml.
- use pm_sleep_ptr() in pinctrl-mt8196.c to fix build error.

Changes in v2:
- fix driver file's coding style.
- add pinctrl binding document.

Changes in v1:
- add mt8196 pinctrl driver.
- add pinmux definition file.

Cathy Xu (2):
  dt-bindings: pinctrl: mediatek: add support for mt8196
  pinctrl: mediatek: add mt8196 driver

 .../pinctrl/mediatek,mt8196-pinctrl.yaml      |  244 ++
 drivers/pinctrl/mediatek/Kconfig              |   12 +
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt8196.c     | 1764 +++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8196.h | 2789 +++++++++++++++++
 include/dt-bindings/pinctrl/mt8196-pinfunc.h  | 1572 ++++++++++
 6 files changed, 6382 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt8196-pinctrl.yaml
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8196.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt8196.h
 create mode 100644 include/dt-bindings/pinctrl/mt8196-pinfunc.h

-- 
2.34.1


