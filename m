Return-Path: <linux-gpio+bounces-16562-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 15837A441F5
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 15:10:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EAEF316F1EE
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 14:08:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D2F426AAA7;
	Tue, 25 Feb 2025 14:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="lshnKFxr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195B426157A;
	Tue, 25 Feb 2025 14:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740492472; cv=none; b=YHNp98akJFTXFJf9ITiVI8ZbpdzSbnUe/iv3Z5oKq0fZ/0Du7THexi9BPv9vAXOXf6/5zbU4exgHCsnrRFRc4T1jqMKQxn4tFFMVQInwKx16w8vSeuA9BH9avxUCI7+X6kped1GGsthBkI11/dmFrJhvohapGW/gWP95AN24MHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740492472; c=relaxed/simple;
	bh=pLINc7sGYsNf6o0xLYyTEPx1QbSFQ+m5ajNum3oEKzA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Gt9+zCFNO6Vs+1dl5Ns9M3kNMTtgai0ZT2nidHqNz2VquRCkRPFrnrhsrqDUAIKfbJUVrp2Yq+qcvl2i4FxW5pI2WkBpo4/zSdU8n/1yXXtZl5bhDkHKNc5b+psOVFeS2VAzt1ZhLkFC6YYO1xe5XooiuNv5SjPQ8e2b6xwO/VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=lshnKFxr; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: de660e96f38111ef8eb9c36241bbb6fb-20250225
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=p9bPP8SA0wg3WU33l4tSgklIjkOTJBKb71wpMn8Q+TI=;
	b=lshnKFxrS9inMaNZw8VDU+C06nH+EPAbcqyWk3ds+wOsYFxBhBnLf1rVmCqJ/rJAnbIYeHjYJRWPakbyIsTZtUshxOMiq+/o8e1n2Xp7bRu0Yj2+lYk7dnYM5dONzORCougco6zydaxIGOcZWy8cpPgx4xQCd/Oko/RbPCHYfkA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:305e7522-63f0-497e-baa9-2fc5005558cf,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:a21ae8d9-654e-41f2-8a8e-a96c1e834c64,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: de660e96f38111ef8eb9c36241bbb6fb-20250225
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <ot_chhao.chang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 407840700; Tue, 25 Feb 2025 22:07:37 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 25 Feb 2025 22:07:36 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Tue, 25 Feb 2025 22:07:35 +0800
From: Hao Chang <ot_chhao.chang@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij
	<linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Wenbin Mei <wenbin.mei@mediatek.com>, Axe Yang <axe.yang@mediatek.com>,
	Qingliang Li <qingliang.li@mediatek.com>, Hanks Chen
	<hanks.chen@mediatek.com>, Chunhui Li <chunhui.li@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, Hao
 Chang <ot_chhao.chang@mediatek.com>
Subject: [PATCH v4 0/3] Add EINT support for multiple addresses
Date: Tue, 25 Feb 2025 22:07:21 +0800
Message-ID: <20250225140732.21557-1-ot_chhao.chang@mediatek.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

v4 changes:
1)Add err statement for exception handling
2)Add check for invalid pins
3)Use defined eint pins

v3 changes:
1)Add error judgment

v2 changes:
1)Remove instance structure
2)Modify the way to obtain eint address

---
This patch depends on
[v3,2/2] pinctrl: mediatek: add mt8196 driver
[v3,1/2] dt-bindings: pinctrl: mediatek: add support for mt8196

Please also accept this patch together with [1]
to avoid build and dt binding check error.
[1]https://patchwork.kernel.org/project/linux-mediatek/list/?series=&submitter=215008&state=&q=v3&archive=&delegate=
---
Hao Chang (3):
  pinctrl: mediatek: add eint pins
  inctrl: mediatek: modify the method of obtaining eint address
  pinctrl: mediatek: adapt to EINT multi-segment addresses

 drivers/pinctrl/mediatek/mtk-eint.c           | 246 ++++++++++-----
 drivers/pinctrl/mediatek/mtk-eint.h           |  21 +-
 drivers/pinctrl/mediatek/pinctrl-mt8196.c     |   1 +
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  |  49 ++-
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.h  |   1 +
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8196.h | 296 ++++++++++++++++++
 drivers/pinctrl/mediatek/pinctrl-paris.h      |   7 +
 7 files changed, 518 insertions(+), 103 deletions(-)

-- 
2.46.0


