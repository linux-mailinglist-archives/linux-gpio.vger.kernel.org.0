Return-Path: <linux-gpio+bounces-27747-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3500EC12B8B
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Oct 2025 04:07:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFDB25E02C3
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Oct 2025 03:06:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 071FB2727FD;
	Tue, 28 Oct 2025 03:06:43 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F40F261B62;
	Tue, 28 Oct 2025 03:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761620802; cv=none; b=aOgaHlbClfW/6+ezD4gG7aXYqJ7k2+OcOFoCOqZUsuVICDMG6uIaPJEuJrp/khJSZQZeqyLtH5rknhuuWaWNXhAeEoanANvXbwBz8sweHn3gPWmGDVfjGmVWiryA/sO1+B/Wy/apFTD0CMp9e9Xbt4Wg/JLJavyP2J0eEtAsKkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761620802; c=relaxed/simple;
	bh=xi+ep9AqfcitjP965lSyZpmqI/csG2eRmyCGJx4QXNc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j87yH9qOTZ7Ha8SPo8yCoZq/X3T3HNElvb9VPlStgV3JwvJSqyqSYRAx38GLV9WlIYXf5X5TAzsmAfFA9M3EAZ4/YUK/K2Ugs1SZN+JXuqgtzlf1Pii/z/VblswJ+R4nuuqe76XfwYsgDM9BOVa2cymo+FdS7Ss9aGJLrAcyP1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from DESKTOP-L0HPE2S (unknown [124.16.141.245])
	by APP-03 (Coremail) with SMTP id rQCowAB3_GAtMwBpwRTYAw--.17941S2;
	Tue, 28 Oct 2025 11:06:23 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH v2] pinctrl: cirrus: Fix fwnode leak in cs42l43_pin_probe()
Date: Tue, 28 Oct 2025 11:05:09 +0800
Message-ID: <20251028030509.835-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <20250929031031.2230-1-vulab@iscas.ac.cn>
References: <20250929031031.2230-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAB3_GAtMwBpwRTYAw--.17941S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJrW3Kw4rCrW3WFW7KrykKrg_yoW8Zw1rpr
	W3WrWayr4DJr47Gas8t3y5ZFW3C3WIqFWxGayIka47urZ8tF9rJr1UK3ZIqFZ8GrZ5CF45
	tF45ta4kWF4DAw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkK14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
	4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AK
	xVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
	0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFyl
	IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
	AFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j
	6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUbGQ6J
	UUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgsJA2kAKDQxDQAAsO

The driver calls fwnode_get_named_child_node() which takes a reference
on the child node, but never releases it, which causes a reference leak.

Fix by using devm_add_action_or_reset() to automatically release the
reference when the device is removed.

Fixes: d5282a539297 ("pinctrl: cs42l43: Add support for the cs42l43")
Suggested-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
Changes in v2:
  - Use devm_add_action_or_reset() instead of manual put in success path
    to properly manage fwnode lifetime throughout device lifecycle
    (suggested by Charles Keepax)
---
 drivers/pinctrl/cirrus/pinctrl-cs42l43.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/cirrus/pinctrl-cs42l43.c b/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
index 68abb6d6cecd..a8f82104a384 100644
--- a/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
+++ b/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
@@ -532,6 +532,11 @@ static int cs42l43_gpio_add_pin_ranges(struct gpio_chip *chip)
 	return ret;
 }
 
+static void cs42l43_fwnode_put(void *data)
+{
+	fwnode_handle_put(data);
+}
+
 static int cs42l43_pin_probe(struct platform_device *pdev)
 {
 	struct cs42l43 *cs42l43 = dev_get_drvdata(pdev->dev.parent);
@@ -563,10 +568,20 @@ static int cs42l43_pin_probe(struct platform_device *pdev)
 	priv->gpio_chip.ngpio = CS42L43_NUM_GPIOS;
 
 	if (is_of_node(fwnode)) {
-		fwnode = fwnode_get_named_child_node(fwnode, "pinctrl");
-
-		if (fwnode && !fwnode->dev)
-			fwnode->dev = priv->dev;
+		struct fwnode_handle *child;
+
+		child = fwnode_get_named_child_node(fwnode, "pinctrl");
+		if (child) {
+			ret = devm_add_action_or_reset(&pdev->dev,
+				cs42l43_fwnode_put, child);
+			if (ret) {
+				fwnode_handle_put(child);
+				return ret;
+			}
+			if (!child->dev)
+				child->dev = priv->dev;
+			fwnode = child;
+		}
 	}
 
 	priv->gpio_chip.fwnode = fwnode;
-- 
2.50.1.windows.1


