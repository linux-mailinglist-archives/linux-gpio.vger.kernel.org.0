Return-Path: <linux-gpio+bounces-29281-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8A7CA6F24
	for <lists+linux-gpio@lfdr.de>; Fri, 05 Dec 2025 10:37:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC3DB31A1F9C
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Dec 2025 09:34:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7501C30EF63;
	Fri,  5 Dec 2025 09:34:19 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7E73195E8;
	Fri,  5 Dec 2025 09:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764927257; cv=none; b=ZB8PqLuhHJpeiFG23pjw9AiEeP8MhOtOgPiaabd3Ztn061S+pLR2uAQzWVO20L55rEphoUPxE7oqPqWY2dXhpnMHN2pb7/YRqf/IU8zxGavmJHmKJSg6Mc9cmpGgnX06kvRQdN7LmqDbA/3njOEvhEwYJWuNGJp3ErWfWROpOOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764927257; c=relaxed/simple;
	bh=En4Krioo55MIn1hYHIlsxwzPIBV+uaxKRPU4S+Y7SzU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AUb2aMKDRKUR1mVsohLFENHchKZx8wTlFIsE4rFATE53OpcE6V9Y9T4+MVdnTwfuqMOETU2z+WiyE9wXWgjFgjY6vdX581KtF6fiVaakMgukYH2Sn/WKxIGbEM4t2OVzl2LSbu97hzGTUBil0ZhGx+XBZr0TEtMkFDBcw9A1pao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from DESKTOP-L0HPE2S (unknown [124.16.141.245])
	by APP-01 (Coremail) with SMTP id qwCowAD3j8_upjJpbgUnAw--.1109S2;
	Fri, 05 Dec 2025 17:33:36 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: linus.walleij@linaro.org
Cc: aisheng.dong@nxp.com,
	festevam@gmail.com,
	shawnguo@kernel.org,
	ping.bai@nxp.com,
	kernel@pengutronix.de,
	s32@nxp.com,
	s.hauer@pengutronix.de,
	linux-gpio@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH] pinctrl: imx: handle radix_tree_insert() errors in imx_pinctrl_parse_functions()
Date: Fri,  5 Dec 2025 17:33:08 +0800
Message-ID: <20251205093308.1498-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1.windows.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAD3j8_upjJpbgUnAw--.1109S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZrW7urWkKw4kWrWUKFW7urg_yoW8Gr43pF
	sxGFyYyr15Gr48GrW5Zw4DuF93Ga1Skr48Ga4kK3yavr43Zrn7twn0kF1Ygr1q9FZ3Aw45
	tF45Aa45u3WUAFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x0JUqeHgUUUUU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAUHA2kybajZRgAAsM

imx_pinctrl_parse_functions() doesn't check the result of
radix_tree_insert() which may return a negative error code
if the insertion fails.

Check the return value of radix_tree_insert() and return upon failure.

Fixes: a51c158bf0f7 ("pinctrl: imx: use radix trees for groups and functions")
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/pinctrl/freescale/pinctrl-imx.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 731c58ad43ee..c20bba7ea306 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -624,8 +624,14 @@ static int imx_pinctrl_parse_functions(struct device_node *np,
 		 * FIXME: This should use pinctrl_generic_add_group() and not
 		 * access the private radix tree directly.
 		 */
-		radix_tree_insert(&pctl->pin_group_tree,
-				  ipctl->group_index++, grp);
+		ret = radix_tree_insert(&pctl->pin_group_tree,
+				  ipctl->group_index, grp);
+		if (ret) {
+			mutex_unlock(&ipctl->mutex);
+			dev_err(ipctl->dev, "radix_tree_insert failed\n");
+			return ret;
+		}
+		ipctl->group_index++;
 		mutex_unlock(&ipctl->mutex);
 
 		imx_pinctrl_parse_groups(child, grp, ipctl, i++);
-- 
2.25.1


