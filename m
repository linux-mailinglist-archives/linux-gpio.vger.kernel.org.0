Return-Path: <linux-gpio+bounces-7604-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCC191204A
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Jun 2024 11:17:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C25B1C208FA
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Jun 2024 09:17:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A302F16DEC1;
	Fri, 21 Jun 2024 09:17:02 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB05116C698;
	Fri, 21 Jun 2024 09:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718961422; cv=none; b=YDjLVQUeDWMZdpaWXhui3nUE4enzp+HXpYJgCFHTsWD9CfRn6uYHTsQMZVqKAiFNrVSquqicHCWmuFjRNjRCspfnJs3MQcHxvXvZa1PVGnmuiIIpqOfZB6XhSJLdm5qsMrWw81ezJrqqHNNbQvckOm1Rv6c1m64zEGwXljevgY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718961422; c=relaxed/simple;
	bh=61p25ATK1e0R9fBYFveQbbb+jL+lpz6dGVy/tPsjI6s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IZO+pH4OKrSL0UxG/kIBPRI3pWYDRXFAy1uauBZnzmR9JSOSbW2RM/qitOOPMBmsA7h1P67ik/5uy1Bv65YRQIeZQY1aDUEvn39A+4VO7ZbKEXKrHSqxoNhbaJw7CuL4nz3K+Rto+p2zzMncD4sjAsKn89AR/TSPMhTFsv85kk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-01 (Coremail) with SMTP id qwCowADHzhICRXVmgfDqCw--.8650S2;
	Fri, 21 Jun 2024 17:16:50 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] pinctrl: mlxbf3: Fix return value check for devm_platform_ioremap_resource
Date: Fri, 21 Jun 2024 17:16:37 +0800
Message-Id: <20240621091637.2299310-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowADHzhICRXVmgfDqCw--.8650S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uryUGr1UJFy5JF1kZr1fZwb_yoW8GF18p3
	93ZF4fJr98JFWDtryxtw13XFy3Ca1xKa15Ka4UX3s3Z3ZxAry5Gw1FgrW5tFZxKrZ0vF45
	t3y3AFW5uF40vFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkq14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK6r4f
	MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
	0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0E
	wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJV
	W8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAI
	cVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUj_WrJUUUUU==
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

Fix return value check for devm_platform_ioremap_resource() in
mlxbf3_pinctrl_probe().

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/pinctrl/pinctrl-mlxbf3.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-mlxbf3.c b/drivers/pinctrl/pinctrl-mlxbf3.c
index 7d1713824a89..ffb5dda364dc 100644
--- a/drivers/pinctrl/pinctrl-mlxbf3.c
+++ b/drivers/pinctrl/pinctrl-mlxbf3.c
@@ -259,16 +259,16 @@ static int mlxbf3_pinctrl_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->fw_ctrl_set0);
 
 	priv->fw_ctrl_clr0 = devm_platform_ioremap_resource(pdev, 1);
-	if (IS_ERR(priv->fw_ctrl_set0))
-		return PTR_ERR(priv->fw_ctrl_set0);
+	if (IS_ERR(priv->fw_ctrl_clr0))
+		return PTR_ERR(priv->fw_ctrl_clr0);
 
 	priv->fw_ctrl_set1 = devm_platform_ioremap_resource(pdev, 2);
-	if (IS_ERR(priv->fw_ctrl_set0))
-		return PTR_ERR(priv->fw_ctrl_set0);
+	if (IS_ERR(priv->fw_ctrl_set1))
+		return PTR_ERR(priv->fw_ctrl_set1);
 
 	priv->fw_ctrl_clr1 = devm_platform_ioremap_resource(pdev, 3);
-	if (IS_ERR(priv->fw_ctrl_set0))
-		return PTR_ERR(priv->fw_ctrl_set0);
+	if (IS_ERR(priv->fw_ctrl_clr1))
+		return PTR_ERR(priv->fw_ctrl_clr1);
 
 	ret = devm_pinctrl_register_and_init(dev,
 					     &mlxbf3_pin_desc,
-- 
2.25.1


