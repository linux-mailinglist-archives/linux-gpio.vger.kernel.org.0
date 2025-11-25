Return-Path: <linux-gpio+bounces-29054-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CFAC831BD
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Nov 2025 03:37:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 952723A3BD3
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Nov 2025 02:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B92221D63F0;
	Tue, 25 Nov 2025 02:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Z9UQb0QE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CCB827713;
	Tue, 25 Nov 2025 02:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764038214; cv=none; b=BOFVU0iwlpqAxwCDc8ij6pfYkKBCVqLI0EIszafH8oA/DMEo2Pr979BMIGw0ZFTeLi1HUFq7EgNVgsF8UlsCQVS5IEiQh6Xm/aLoL5N1tkCXfxLg7yW3JW5pjDoeSzHa7TAmjJV25TFzqahz9iEEuGhNbkk9+tUuMyB7uNcS0qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764038214; c=relaxed/simple;
	bh=mB6X4ImBkE4Wmff4IrQBZt19x63IkNzIYFfb5APhB00=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=baDaUU2KZ3JAkVIC9BvzAY6fkXwnN+aOsuhYQHfNkE82P6qu0ATySzFgDNj12XU9TcM+aPGAsqvVzrkpndIC1bU0090K45Km/9LSGR07mb+iwNvYVdSiemIe10uasoTF0JOaY+DH3a6gt/QP05RXBOigIdI2ncpuVfcif00qXwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Z9UQb0QE; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 961595c4c9a711f0b33aeb1e7f16c2b6-20251125
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=2x2SEVd0YgaWH8lFeglrw5bdnyBVJSWuckkkNTF4UXA=;
	b=Z9UQb0QEPpCZtpuIHMvrqo4bkoSuubyiytfAsSWWfVAosUKl1Gmzcqi3r8fcIoktt/JKjFZUUgMyiwUJvILhYiCooa3pGyX0jsh8iSnCJT0oWswMMQtj2QBTWzUGj1pMF4jFudmIobWtAZdkpLIqCY9f+IB/R3llFO9bDWChCAM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:f2f04e53-adee-44ca-a90f-44f58571487b,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:003b846b-ffd0-409b-bec6-a38e02803690,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 961595c4c9a711f0b33aeb1e7f16c2b6-20251125
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <lei.xue@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1074906603; Tue, 25 Nov 2025 10:36:46 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 25 Nov 2025 10:36:42 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Tue, 25 Nov 2025 10:36:41 +0800
From: Lei Xue <lei.xue@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij
	<linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<yong.mao@mediatek.com>, <lei.xue@mediatek.com>, <qingliang.li@mediatek.com>,
	<Fred-WY.Chen@mediatek.com>, <ot_cathy.xu@mediatek.com>,
	<ot_shunxi.zhang@mediatek.com>, <ot_yaoy.wang@mediatek.com>,
	<ot_ye.wang@mediatek.com>
Subject: [PATCH 0/3] Add pinctrl and GPIO support for MediaTek MT8901
Date: Tue, 25 Nov 2025 10:36:33 +0800
Message-ID: <20251125023639.2416546-1-lei.xue@mediatek.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Dear maintainers,

This patch series contains three patches aimed at improving the
Linux kernel support for MediaTek platforms, specifically for
the MT8901 SoC. The details are as follows:

Add GPIO range record in MediaTek pinctrl driver
 - This patch introduces GPIO range recording in the MediaTek
   pinctrl driver, providing a foundation for proper GPIO
   identification and management.

Add ACPI support in MediaTek pinctrl driver
 - This patch adds ACPI support to the MediaTek pinctrl driver,
   enabling the driver to function correctly in ACPI environments
   and enhancing platform compatibility.

Add pinctrl driver for MediaTek MT8901
 - This patch adds a new pinctrl driver for the MT8901 SoC,
   defining the GPIO functions, register mappings, and multiplexing
   relationships to improve pin control capabilities for MT8901.

These patches will help enhance the mainline kernel support for MediaTek MT8901.
Your review and feedback are highly appreciated.

Thank you!


Lei Xue (3):
  pinctrl: mediatek: Add gpio-range record in pinctrl driver
  pinctrl: mediatek: Add acpi support
  pinctrl: mediatek: mt8901: Add pinctrl driver for MT8901

 drivers/pinctrl/mediatek/Kconfig              |   12 +
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/mtk-eint.c           |    4 +
 drivers/pinctrl/mediatek/mtk-eint.h           |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt8901.c     | 1460 +++++++++++
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  |   24 +-
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.h  |    1 +
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8901.h | 2130 +++++++++++++++++
 drivers/pinctrl/mediatek/pinctrl-paris.c      |   21 +-
 9 files changed, 3647 insertions(+), 7 deletions(-)
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8901.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt8901.h

-- 
2.45.2


