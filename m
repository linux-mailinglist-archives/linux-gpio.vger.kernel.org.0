Return-Path: <linux-gpio+bounces-14628-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C75B0A08E5B
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jan 2025 11:47:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E84FB3A2D38
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jan 2025 10:47:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7BFD205516;
	Fri, 10 Jan 2025 10:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ctDyInVu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8847314D6F9;
	Fri, 10 Jan 2025 10:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736506046; cv=none; b=u2Dik7tEmyKYGhMHRrMu8xOOL40v2CexdqAYjKXGZ6Im0arU3oP2nUIW4fxTdvBnSnhO8BzrUA1rR13qZzAExGRsbNMu+A37py4KrAoITmNWtWOyK2rB479Sb2pNWs8+wna1O2+JYNf1t6EMflowYM0Aut6OZ+5X2evPqrafaS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736506046; c=relaxed/simple;
	bh=gkj6A+sPvv0suEZuBjpiMB78rEGAzdi+Z+cmRzsuclQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jSBcqQ8EHF1QuTlcUJ2WyfR4vBMpXE18xTZdrUwcJhH9fw7Fh8kflDfSBPNSl16dcoYZ5ZJTH59/GiBpw7x++vQn1jOldZ1u4tOc6xZyXYg7KyRSJ8CQS3ATmSm/CfNqVSGIKvMU7nrF+/UVTZR2/jP+Bdm9N+xgGQizKkQPvT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=ctDyInVu; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 4247c582cf4011efbd192953cf12861f-20250110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=C9hARpZb1un6HXEmRsJ7j249RR5J20aGvP0n2v1qFcA=;
	b=ctDyInVuzr5Y5coZwNpd/0sM5WdKge7UxVoCVVgiGwEgHe8qtkAYL8isZktJi6XAeg0gggG3Yx5pxfi988nP6tuHV4GTd5D/84eLmWuhpEH6FlUAzU1+jfSEPVeuxAt6kF0Gyc3wB+rl/2KIIxAcbppuqLtXA4vGvo6C/qeeURE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:b41c65dc-ad95-4768-ad5c-fdac965d9431,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:3a7f4d13-8831-4185-8e40-f83b1917e828,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 4247c582cf4011efbd192953cf12861f-20250110
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <ot_cathy.xu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1912609671; Fri, 10 Jan 2025 18:47:16 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 10 Jan 2025 18:47:15 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 10 Jan 2025 18:47:14 +0800
From: Cathy Xu <ot_cathy.xu@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>,
	Lei Xue <lei.xue@mediatek.com>, <wenbin.mei@mediatek.com>
CC: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Cathy Xu <ot_cathy.xu@mediatek.com>
Subject: [PATCH v2 0/2] MediaTek pinctrl patch on mt8196
Date: Fri, 10 Jan 2025 18:42:27 +0800
Message-ID: <20250110104703.13625-1-ot_cathy.xu@mediatek.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Changes in v2:
- fix driver file's coding style.
- add pinctrl binding document.

Changes in v1:
- add mt8196 pinctrl driver.
- add pinmux definition file.

Cathy Xu (2):
  dt-bindings: pinctrl: mediatek: add support for mt8196
  pinctrl: mediatek: add mt8196 driver

 .../pinctrl/mediatek,mt8196-pinctrl.yaml      |  266 ++
 drivers/pinctrl/mediatek/Kconfig              |   12 +
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt8196.c     | 1764 +++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8196.h | 2789 +++++++++++++++++
 include/dt-bindings/pinctrl/mt8196-pinfunc.h  | 1572 ++++++++++
 6 files changed, 6404 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt8196-pinctrl.yaml
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8196.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt8196.h
 create mode 100644 include/dt-bindings/pinctrl/mt8196-pinfunc.h

-- 
2.34.1


