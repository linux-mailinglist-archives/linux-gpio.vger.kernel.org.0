Return-Path: <linux-gpio+bounces-28532-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D95DC602F2
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Nov 2025 11:00:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFE133BA389
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Nov 2025 10:00:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55313285404;
	Sat, 15 Nov 2025 10:00:19 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301282857EF;
	Sat, 15 Nov 2025 10:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763200819; cv=none; b=uQlvDUBkZDP3Ing2AofDxD6w+ohmOdH5yxmnHwkuoO9HBhexlX1f2Q6SSGbOD9weZwghcDoqNQyTWcetJxKTTsiEqLq3x1bdL+ygz0DkR2t85HFxNgT5ozu7fJxLGBvWBtsTKJd3AHozvGWPsvq3kE/AiDZxw2V2D24fQu8qCuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763200819; c=relaxed/simple;
	bh=doZ2ibS99XlvaHKVXdjr9mWz+zpahIGC/JRyUdXFkMs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QgAL54fQRS6Td0/EvnhGlen1Y+soLqRBsZKyTseBedQZ6fCq4v8HLdFkTq9o8pKyB7uBvDexcHT1py2ZiytgBMK51YdJNfQRCKTFx+I6UCGW2v6I1omHg6s4FaViH0O4R8XsP754zkzcoODrI9rF64mvjAvHFLjcPomsp0WQzpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from localhost.localdomain (unknown [116.25.95.231])
	by smtp.qiye.163.com (Hmail) with ESMTP id 29af02016;
	Sat, 15 Nov 2025 18:00:06 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	angelogioacchino.delregno@collabora.com,
	Christian Marangi <ansuelsmth@gmail.com>,
	Sean Wang <sean.wang@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH 1/1] pinctrl: airoha: fix pinctrl function mismatch issue
Date: Sat, 15 Nov 2025 18:00:00 +0800
Message-Id: <20251115100000.177791-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a86f52ec703a2kunm89bce897230e75
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDS0tLVh5LQ0lKQx1IHkNCHlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk5VSUhKWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxOVUpLS1VKQk
	tLWQY+

The blamed commit made the following changes:

-#define PINCTRL_FUNC_DESC(id)...
-		.desc = PINCTRL_PINFUNCTION(#id, ...
+#define PINCTRL_FUNC_DESC(id, table)...
+		.desc = PINCTRL_PINFUNCTION(#id, ...

-	PINCTRL_FUNC_DESC(pon)...
+	PINCTRL_FUNC_DESC("pon", pon)...

It's clear that the id of funcs doesn't match the definition.
Remove redundant #string from the definition to fix this issue:
pinctrl-airoha ...: invalid function mdio in map table

Fixes: 4043b0c45f85 ("pinctrl: airoha: generalize pins/group/function/confs handling")
Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index bfcedc7f920b..18c952e44229 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -35,7 +35,7 @@
 
 #define PINCTRL_FUNC_DESC(id, table)					\
 	{								\
-		.desc = PINCTRL_PINFUNCTION(#id, table##_groups,	\
+		.desc = PINCTRL_PINFUNCTION(id, table##_groups,	\
 					    ARRAY_SIZE(table##_groups)),\
 		.groups = table##_func_group,				\
 		.group_size = ARRAY_SIZE(table##_func_group),		\
-- 
2.25.1


