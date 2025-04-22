Return-Path: <linux-gpio+bounces-19120-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BE4A95FFB
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Apr 2025 09:52:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 629C63B7DA2
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Apr 2025 07:52:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA8F51EBA07;
	Tue, 22 Apr 2025 07:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ls4HyZyH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685F919ABD1;
	Tue, 22 Apr 2025 07:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745308347; cv=none; b=XH351omISjbGSiPXiNnzpikz64HYIfbZKI+wCfJjz5MujVpng/O3Thj5AWdmzCsOvLJD4xjb4I6U73QhUQyzMzx6T3TCoYk5QosX41oTYdQSMD7WtWj9NOoWbUazFs7ny3QxgL94L724uAk27dr1PSinN9VR1F1BRAvOMN9bBnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745308347; c=relaxed/simple;
	bh=73QEDgjQtDaOMfPuvNXQ13bS9xl5lQF9NMQ9ptIhDUs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aiWr8Py6PhWoW6SasbL4nPe5RyhTjN3iRjV2v9SUJelp1s3qSQJ3YosPEUl356+RqHJzMBA9vkWd5+SLzz5PS9L+yxNWBiYp/8Odf03nVrx5Z2tsayltVPQfoZltLxBZ7cayt2y5k1Cfdxj/Iod44xY6blSjrUWHqiJavrIv3Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=ls4HyZyH; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: b7f5dbbc1f4e11f0980a8d1746092496-20250422
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=8F/fzi5o4xXOQuFtsasXHqy2c/Cy60RBpX6xtlod2Ho=;
	b=ls4HyZyHu+xEsdJRW14hBoAVAUyuZbq8mpp6ulO+VKe6C68w9mmQVNLdCKZvCDqrwrtV6Ec7q9Y9dFtuCxZK7l9zQeV1HnJRp1w2cl/f/ZTaOn00PwKHs/sA2ygC6wHr4R4BpC+TAZyENAIOH++P5g6pAdnG72+/9pyq80eOCGc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:8150a6bb-65af-4492-997a-4d45ff9e7cb2,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:7c0e5da6-c619-47e3-a41b-90eedbf5b947,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b7f5dbbc1f4e11f0980a8d1746092496-20250422
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <ot_chhao.chang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1039915896; Tue, 22 Apr 2025 15:52:20 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 22 Apr 2025 15:52:19 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 22 Apr 2025 15:52:18 +0800
From: Hao Chang <ot_chhao.chang@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij
	<linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Wenbin Mei <wenbin.mei@mediatek.com>, Axe Yang <axe.yang@mediatek.com>,
	Qingliang Li <qingliang.li@mediatek.com>, Hanks Chen
	<hanks.chen@mediatek.com>, Chunhui Li <chunhui.li@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, "Hao
 Chang" <ot_chhao.chang@mediatek.com>
Subject: [PATCH] pinctrl: mediatek: Fix new design debounce issue
Date: Tue, 22 Apr 2025 15:52:05 +0800
Message-ID: <20250422075216.14073-1-ot_chhao.chang@mediatek.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Calculate the true offset of eint according to index.

Fixes: 3ef9f710efcb ("pinctrl: mediatek: Add EINT support for multiple addresses")
Signed-off-by: Hao Chang <ot_chhao.chang@mediatek.com>
Signed-off-by: Qingliang Li <qingliang.li@mediatek.com>
---
 drivers/pinctrl/mediatek/mtk-eint.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediatek/mtk-eint.c
index 557dec75fa03..be12ef1fd6b0 100644
--- a/drivers/pinctrl/mediatek/mtk-eint.c
+++ b/drivers/pinctrl/mediatek/mtk-eint.c
@@ -449,7 +449,7 @@ int mtk_eint_set_debounce(struct mtk_eint *eint, unsigned long eint_num,
 		return -EOPNOTSUPP;
 
 	virq = irq_find_mapping(eint->domain, eint_num);
-	eint_offset = (eint_num % 4) * 8;
+	eint_offset = (idx % 4) * 8;
 	d = irq_get_irq_data(virq);
 
 	set_offset = (idx / 4) * 4 + eint->regs->dbnc_set;
-- 
2.46.0


