Return-Path: <linux-gpio+bounces-18687-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB33A856DB
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Apr 2025 10:43:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 130561BA10B9
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Apr 2025 08:43:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 671A7296152;
	Fri, 11 Apr 2025 08:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="IKw1GhFa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175612980AD;
	Fri, 11 Apr 2025 08:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744360976; cv=none; b=K+1iCFGUhO8NsVirZv0SgI571MG4fdtyOywWcwSwPsfb92mAvI3V1tlX6V2JBIS1br+P/XnTonHHtPdF8HPHKMtCYPAPs3B0A96OL0YD+WRW/NS26NfwaOWILg87sUV3xPzhYq/Z2L2nieZnmITlhgyVlpQejy7+CMbnJ99n/ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744360976; c=relaxed/simple;
	bh=Vj0qIzeLJWrYwtxXjL9ExLoP3bNvAB+s2qZNaTJVzE4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=P36H8bB5K95KM5y0DVx+oLY+l9mnXcws7KLlfWS8GEBjezOr7VaFQzWzLJZVe19PWRkNott9QmW+w4qX/FA2gIEGdT9iq6Mz/TZ4ohEFwUFbLymw7KxmnPKtVePXSJxzZZAvkrv6NiWgmadB5scK0yR5S1bxPqVO0rk48TTdPEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=IKw1GhFa; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: d87ab51616b011f0aae1fd9735fae912-20250411
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=opGgYOxHkmo46xSWQ2t820m/8IndJ3ND/kGiEZemXDA=;
	b=IKw1GhFa9DXoFWGWj3mweRA9f1G9joHOSOHwWeuyY+ICjLxfolw2p6uf+ddf/sgAS8PoCpZKJV1W4HnhYxsTx87L7V7FYHV/k0vuJdTvI1HV2cH6xk6QaoQFnqaeWTlWZ7RJrp0V9hp9NLlwcJqHqG4yi+oBMI8Hxr2RAJ0GJFw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:230101bb-c5d4-4862-a5a4-20bbd99a9bd5,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:698a7d8d-f5b8-47d5-8cf3-b68fe7530c9a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: d87ab51616b011f0aae1fd9735fae912-20250411
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <ot_chhao.chang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1275438594; Fri, 11 Apr 2025 16:42:05 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 11 Apr 2025 16:42:03 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 11 Apr 2025 16:42:03 +0800
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
Subject: [PATCH] pinctrl: mediatek: pinctrl: mediatek: add mt8196 eint pin
Date: Fri, 11 Apr 2025 16:41:57 +0800
Message-ID: <20250411084159.3307-1-ot_chhao.chang@mediatek.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add eint pin support for MediaTek mt8196 SoC.

---
This patch depends on
[v3,2/2] pinctrl: mediatek: add mt8196 driver
[v3,1/2] dt-bindings: pinctrl: mediatek: add support for mt8196

Please also accept this patch together with [1]
to avoid build and dt binding check error.
[1]https://patchwork.kernel.org/project/linux-mediatek/list/?series=&submitter=215008&state=&q=v3&archive=&delegate=
---

Signed-off-by: Hao Chang <ot_chhao.chang@mediatek.com>
Signed-off-by: Qingliang Li <qingliang.li@mediatek.com>
---
 drivers/pinctrl/mediatek/pinctrl-mt8196.c     |   1 +
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8196.h | 296 ++++++++++++++++++
 2 files changed, 297 insertions(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8196.c b/drivers/pinctrl/mediatek/pinctrl-mt8196.c
index 822ceb8dc268..89be051e6c91 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8196.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8196.c
@@ -1728,6 +1728,7 @@ static const struct mtk_pin_soc mt8196_data = {
 	.npins = ARRAY_SIZE(mtk_pins_mt8196),
 	.ngrps = ARRAY_SIZE(mtk_pins_mt8196),
 	.eint_hw = &mt8196_eint_hw,
+	.eint_pin = eint_pins_mt8196,
 	.nfuncs = 8,
 	.gpio_m = 0,
 	.base_names = mt8196_pinctrl_register_base_names,
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-mt8196.h b/drivers/pinctrl/mediatek/pinctrl-mtk-mt8196.h
index d342d091672c..1d26242d392b 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-mt8196.h
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-mt8196.h
@@ -8,6 +8,7 @@
 #define __PINCTRL_MTK_MT8196_H
 
 #include "pinctrl-paris.h"
+#define EINT_INVALID_BASE 0xff
 
 static const struct mtk_pin_desc mtk_pins_mt8196[] = {
 	MTK_PIN(
@@ -2786,4 +2787,299 @@ static const struct mtk_pin_desc mtk_pins_mt8196[] = {
 	)
 };
 
+static struct mtk_eint_pin eint_pins_mt8196[] = {
+	MTK_EINT_PIN(0, 2, 0, 1),
+	MTK_EINT_PIN(1, 2, 1, 1),
+	MTK_EINT_PIN(2, 2, 16, 0),
+	MTK_EINT_PIN(3, 2, 17, 0),
+	MTK_EINT_PIN(4, 2, 2, 1),
+	MTK_EINT_PIN(5, 2, 3, 1),
+	MTK_EINT_PIN(6, 2, 4, 1),
+	MTK_EINT_PIN(7, 2, 5, 1),
+	MTK_EINT_PIN(8, 2, 6, 1),
+	MTK_EINT_PIN(9, 2, 18, 0),
+	MTK_EINT_PIN(10, 2, 7, 1),
+	MTK_EINT_PIN(11, 2, 8, 1),
+	MTK_EINT_PIN(12, 2, 9, 1),
+	MTK_EINT_PIN(13, 1, 4, 0),
+	MTK_EINT_PIN(14, 0, 0, 1),
+	MTK_EINT_PIN(15, 1, 5, 0),
+	MTK_EINT_PIN(16, 1, 6, 0),
+	MTK_EINT_PIN(17, 1, 7, 0),
+	MTK_EINT_PIN(18, 1, 8, 0),
+	MTK_EINT_PIN(19, 1, 9, 0),
+	MTK_EINT_PIN(20, 0, 1, 1),
+	MTK_EINT_PIN(21, 0, 10, 0),
+	MTK_EINT_PIN(22, 0, 11, 0),
+	MTK_EINT_PIN(23, 0, 12, 0),
+	MTK_EINT_PIN(24, 0, 13, 0),
+	MTK_EINT_PIN(25, 0, 14, 0),
+	MTK_EINT_PIN(26, 0, 15, 0),
+	MTK_EINT_PIN(27, 0, 2, 1),
+	MTK_EINT_PIN(28, 0, 16, 0),
+	MTK_EINT_PIN(29, 0, 17, 0),
+	MTK_EINT_PIN(30, 0, 18, 0),
+	MTK_EINT_PIN(31, 0, 3, 1),
+	MTK_EINT_PIN(32, 0, 19, 0),
+	MTK_EINT_PIN(33, 0, 20, 0),
+	MTK_EINT_PIN(34, 0, 21, 0),
+	MTK_EINT_PIN(35, 0, 22, 0),
+	MTK_EINT_PIN(36, 0, 23, 0),
+	MTK_EINT_PIN(37, 0, 24, 0),
+	MTK_EINT_PIN(38, 0, 25, 0),
+	MTK_EINT_PIN(39, 2, 10, 1),
+	MTK_EINT_PIN(40, 2, 11, 1),
+	MTK_EINT_PIN(41, 2, 12, 1),
+	MTK_EINT_PIN(42, 2, 13, 1),
+	MTK_EINT_PIN(43, 2, 14, 1),
+	MTK_EINT_PIN(44, 2, 19, 0),
+	MTK_EINT_PIN(45, 2, 20, 0),
+	MTK_EINT_PIN(46, 2, 21, 0),
+	MTK_EINT_PIN(47, 2, 22, 0),
+	MTK_EINT_PIN(48, 2, 23, 0),
+	MTK_EINT_PIN(49, 2, 24, 0),
+	MTK_EINT_PIN(50, 2, 25, 0),
+	MTK_EINT_PIN(51, 2, 26, 0),
+	MTK_EINT_PIN(52, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(53, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(54, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(55, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(56, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(57, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(58, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(59, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(60, 2, 27, 0),
+	MTK_EINT_PIN(61, 2, 28, 0),
+	MTK_EINT_PIN(62, 2, 29, 0),
+	MTK_EINT_PIN(63, 2, 30, 0),
+	MTK_EINT_PIN(64, 2, 31, 0),
+	MTK_EINT_PIN(65, 2, 32, 0),
+	MTK_EINT_PIN(66, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(67, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(68, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(69, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(70, 2, 33, 0),
+	MTK_EINT_PIN(71, 2, 34, 0),
+	MTK_EINT_PIN(72, 2, 35, 0),
+	MTK_EINT_PIN(73, 2, 36, 0),
+	MTK_EINT_PIN(74, 2, 37, 0),
+	MTK_EINT_PIN(75, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(76, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(77, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(78, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(79, 2, 38, 0),
+	MTK_EINT_PIN(80, 2, 39, 0),
+	MTK_EINT_PIN(81, 2, 40, 0),
+	MTK_EINT_PIN(82, 2, 41, 0),
+	MTK_EINT_PIN(83, 2, 42, 0),
+	MTK_EINT_PIN(84, 2, 43, 0),
+	MTK_EINT_PIN(85, 2, 44, 0),
+	MTK_EINT_PIN(86, 2, 45, 0),
+	MTK_EINT_PIN(87, 2, 46, 0),
+	MTK_EINT_PIN(88, 2, 47, 0),
+	MTK_EINT_PIN(89, 2, 48, 0),
+	MTK_EINT_PIN(90, 2, 49, 0),
+	MTK_EINT_PIN(91, 2, 50, 0),
+	MTK_EINT_PIN(92, 2, 15, 1),
+	MTK_EINT_PIN(93, 2, 51, 0),
+	MTK_EINT_PIN(94, 2, 52, 0),
+	MTK_EINT_PIN(95, 2, 53, 0),
+	MTK_EINT_PIN(96, 2, 54, 0),
+	MTK_EINT_PIN(97, 2, 55, 0),
+	MTK_EINT_PIN(98, 2, 56, 0),
+	MTK_EINT_PIN(99, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(100, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(101, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(102, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(103, 2, 57, 0),
+	MTK_EINT_PIN(104, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(105, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(106, 1, 10, 0),
+	MTK_EINT_PIN(107, 1, 11, 0),
+	MTK_EINT_PIN(108, 1, 12, 0),
+	MTK_EINT_PIN(109, 1, 13, 0),
+	MTK_EINT_PIN(110, 1, 0, 1),
+	MTK_EINT_PIN(111, 1, 1, 1),
+	MTK_EINT_PIN(112, 1, 2, 1),
+	MTK_EINT_PIN(113, 1, 3, 1),
+	MTK_EINT_PIN(114, 1, 14, 0),
+	MTK_EINT_PIN(115, 1, 15, 0),
+	MTK_EINT_PIN(116, 1, 16, 0),
+	MTK_EINT_PIN(117, 1, 17, 0),
+	MTK_EINT_PIN(118, 1, 18, 0),
+	MTK_EINT_PIN(119, 1, 19, 0),
+	MTK_EINT_PIN(120, 1, 20, 0),
+	MTK_EINT_PIN(121, 1, 21, 0),
+	MTK_EINT_PIN(122, 1, 22, 0),
+	MTK_EINT_PIN(123, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(124, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(125, 1, 23, 0),
+	MTK_EINT_PIN(126, 1, 24, 0),
+	MTK_EINT_PIN(127, 1, 25, 0),
+	MTK_EINT_PIN(128, 1, 26, 0),
+	MTK_EINT_PIN(129, 1, 27, 0),
+	MTK_EINT_PIN(130, 1, 28, 0),
+	MTK_EINT_PIN(131, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(132, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(133, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(134, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(135, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(136, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(137, 0, 26, 0),
+	MTK_EINT_PIN(138, 0, 27, 0),
+	MTK_EINT_PIN(139, 0, 28, 0),
+	MTK_EINT_PIN(140, 0, 29, 0),
+	MTK_EINT_PIN(141, 0, 30, 0),
+	MTK_EINT_PIN(142, 0, 31, 0),
+	MTK_EINT_PIN(143, 0, 32, 0),
+	MTK_EINT_PIN(144, 0, 33, 0),
+	MTK_EINT_PIN(145, 0, 34, 0),
+	MTK_EINT_PIN(146, 0, 35, 0),
+	MTK_EINT_PIN(147, 0, 36, 0),
+	MTK_EINT_PIN(148, 0, 4, 1),
+	MTK_EINT_PIN(149, 0, 37, 0),
+	MTK_EINT_PIN(150, 0, 5, 1),
+	MTK_EINT_PIN(151, 0, 38, 0),
+	MTK_EINT_PIN(152, 0, 39, 0),
+	MTK_EINT_PIN(153, 0, 40, 0),
+	MTK_EINT_PIN(154, 0, 41, 0),
+	MTK_EINT_PIN(155, 0, 42, 0),
+	MTK_EINT_PIN(156, 0, 43, 0),
+	MTK_EINT_PIN(157, 0, 44, 0),
+	MTK_EINT_PIN(158, 0, 45, 0),
+	MTK_EINT_PIN(159, 0, 46, 0),
+	MTK_EINT_PIN(160, 0, 47, 0),
+	MTK_EINT_PIN(161, 0, 48, 0),
+	MTK_EINT_PIN(162, 0, 49, 0),
+	MTK_EINT_PIN(163, 0, 50, 0),
+	MTK_EINT_PIN(164, 0, 51, 0),
+	MTK_EINT_PIN(165, 0, 52, 0),
+	MTK_EINT_PIN(166, 0, 53, 0),
+	MTK_EINT_PIN(167, 0, 54, 0),
+	MTK_EINT_PIN(168, 0, 55, 0),
+	MTK_EINT_PIN(169, 0, 56, 0),
+	MTK_EINT_PIN(170, 0, 57, 0),
+	MTK_EINT_PIN(171, 0, 58, 0),
+	MTK_EINT_PIN(172, 0, 6, 1),
+	MTK_EINT_PIN(173, 0, 7, 1),
+	MTK_EINT_PIN(174, 0, 8, 1),
+	MTK_EINT_PIN(175, 0, 9, 1),
+	MTK_EINT_PIN(176, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(177, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(178, 0, 59, 0),
+	MTK_EINT_PIN(179, 0, 60, 0),
+	MTK_EINT_PIN(180, 0, 61, 0),
+	MTK_EINT_PIN(181, 0, 62, 0),
+	MTK_EINT_PIN(182, 0, 63, 0),
+	MTK_EINT_PIN(183, 0, 64, 0),
+	MTK_EINT_PIN(184, 0, 65, 0),
+	MTK_EINT_PIN(185, 0, 66, 0),
+	MTK_EINT_PIN(186, 3, 6, 0),
+	MTK_EINT_PIN(187, 3, 7, 0),
+	MTK_EINT_PIN(188, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(189, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(190, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(191, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(192, 3, 8, 0),
+	MTK_EINT_PIN(193, 3, 9, 0),
+	MTK_EINT_PIN(194, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(195, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(196, 3, 10, 0),
+	MTK_EINT_PIN(197, 3, 11, 0),
+	MTK_EINT_PIN(198, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(199, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(200, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(201, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(202, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(203, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(204, 3, 12, 0),
+	MTK_EINT_PIN(205, 3, 13, 0),
+	MTK_EINT_PIN(206, 3, 14, 0),
+	MTK_EINT_PIN(207, 3, 0, 1),
+	MTK_EINT_PIN(208, 3, 1, 1),
+	MTK_EINT_PIN(209, 3, 2, 1),
+	MTK_EINT_PIN(210, 3, 15, 0),
+	MTK_EINT_PIN(211, 3, 3, 1),
+	MTK_EINT_PIN(212, 3, 4, 1),
+	MTK_EINT_PIN(213, 3, 5, 1),
+	MTK_EINT_PIN(214, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(215, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(216, 3, 16, 0),
+	MTK_EINT_PIN(217, 3, 17, 0),
+	MTK_EINT_PIN(218, 3, 18, 0),
+	MTK_EINT_PIN(219, 3, 19, 0),
+	MTK_EINT_PIN(220, 3, 20, 0),
+	MTK_EINT_PIN(221, 3, 21, 0),
+	MTK_EINT_PIN(222, 3, 22, 0),
+	MTK_EINT_PIN(223, 3, 23, 0),
+	MTK_EINT_PIN(224, 3, 24, 0),
+	MTK_EINT_PIN(225, 3, 25, 0),
+	MTK_EINT_PIN(226, 3, 26, 0),
+	MTK_EINT_PIN(227, 3, 27, 0),
+	MTK_EINT_PIN(228, 3, 28, 0),
+	MTK_EINT_PIN(229, 3, 29, 0),
+	MTK_EINT_PIN(230, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(231, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(232, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(233, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(234, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(235, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(236, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(237, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(238, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(239, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(240, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(241, 3, 30, 0),
+	MTK_EINT_PIN(242, 3, 31, 0),
+	MTK_EINT_PIN(243, 3, 32, 0),
+	MTK_EINT_PIN(244, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(245, 3, 45, 0),
+	MTK_EINT_PIN(246, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(247, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(248, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(249, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(250, EINT_INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(251, 0, 67, 0),
+	MTK_EINT_PIN(252, 0, 68, 0),
+	MTK_EINT_PIN(253, 0, 69, 0),
+	MTK_EINT_PIN(254, 0, 70, 0),
+	MTK_EINT_PIN(255, 0, 71, 0),
+	MTK_EINT_PIN(256, 0, 72, 0),
+	MTK_EINT_PIN(257, 0, 73, 0),
+	MTK_EINT_PIN(258, 0, 74, 0),
+	MTK_EINT_PIN(259, 3, 33, 0),
+	MTK_EINT_PIN(260, 3, 34, 0),
+	MTK_EINT_PIN(261, 3, 35, 0),
+	MTK_EINT_PIN(262, 3, 36, 0),
+	MTK_EINT_PIN(263, 3, 37, 0),
+	MTK_EINT_PIN(264, 3, 38, 0),
+	MTK_EINT_PIN(265, 3, 39, 0),
+	MTK_EINT_PIN(266, 3, 40, 0),
+	MTK_EINT_PIN(267, 3, 41, 0),
+	MTK_EINT_PIN(268, 3, 42, 0),
+	MTK_EINT_PIN(269, 3, 43, 0),
+	MTK_EINT_PIN(270, 3, 44, 0),
+	MTK_EINT_PIN(271, 4, 0, 0),
+	MTK_EINT_PIN(272, 4, 1, 0),
+	MTK_EINT_PIN(273, 4, 2, 0),
+	MTK_EINT_PIN(274, 4, 3, 0),
+	MTK_EINT_PIN(275, 4, 4, 0),
+	MTK_EINT_PIN(276, 4, 5, 0),
+	MTK_EINT_PIN(277, 4, 6, 0),
+	MTK_EINT_PIN(278, 4, 7, 0),
+	MTK_EINT_PIN(279, 4, 8, 0),
+	MTK_EINT_PIN(280, 4, 9, 0),
+	MTK_EINT_PIN(281, 4, 10, 0),
+	MTK_EINT_PIN(282, 4, 11, 0),
+	MTK_EINT_PIN(283, 4, 12, 0),
+	MTK_EINT_PIN(284, 4, 13, 0),
+	MTK_EINT_PIN(285, 4, 14, 0),
+	MTK_EINT_PIN(286, 4, 15, 0),
+	MTK_EINT_PIN(287, 4, 16, 0),
+	MTK_EINT_PIN(288, 4, 17, 0),
+	MTK_EINT_PIN(289, 4, 18, 0),
+	MTK_EINT_PIN(290, 4, 19, 0),
+	MTK_EINT_PIN(291, 4, 20, 0),
+	MTK_EINT_PIN(292, 4, 21, 0),
+};
 #endif /* __PINCTRL_MTK_MT8196_H */
-- 
2.46.0


