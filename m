Return-Path: <linux-gpio+bounces-29000-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B62CC7EC6F
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Nov 2025 02:51:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1593A4E19BD
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Nov 2025 01:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9408B239E9A;
	Mon, 24 Nov 2025 01:51:44 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2206476026;
	Mon, 24 Nov 2025 01:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763949104; cv=none; b=ZMre4emuAG8BKZ66NudoTyRA2Z4NySySG7ABaEg8c7I3mFLaJD0HafSwFj+cfmMm8ahRhrIzJ7SgaHVFxjSBZWrF7fSsBsBNx5JqJWkY6Y1zVuXbbwrB+C+ppvSNpQcFAEds2aRUeXjoO0nYyI6LFbxd9GwoyI3PhDHTffmWC54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763949104; c=relaxed/simple;
	bh=ozX+o5Y/xXEXDQewU0louCfRuETGOQ7exgclSKsqL5c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IyamXs6ENH7tvgvxjnn3GzGLoN1oEIJurVXfHoF8pw9pZlpSayUKlaJqS49++jDGxTPTLIQrC4bK8wK9iS4qm5i5rI016/fumZLheM48MHrCegQE1LIso5zj2X6faxmcP2GNCY26+RfUr4rvZ/WsEMB5tYgax3qPoHF/NEnOlN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from DESKTOP-L0HPE2S (unknown [124.16.141.245])
	by APP-05 (Coremail) with SMTP id zQCowACnb3AbuiNpnqXRAQ--.18350S2;
	Mon, 24 Nov 2025 09:51:24 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: ckeepax@opensource.cirrus.com,
	rf@opensource.cirrus.com,
	david.rhodes@cirrus.com,
	linus.walleij@linaro.org
Cc: linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH] pinctrl: cirrus: cs42l43: Handle devm_pm_runtime_enable() errors
Date: Mon, 24 Nov 2025 09:49:33 +0800
Message-ID: <20251124014933.898-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1.windows.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowACnb3AbuiNpnqXRAQ--.18350S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GF45Cr4fKw4kCFWkAF1UZFb_yoWkAwb_CF
	WrurW7XryYgr18Cw1qqry3ZryIkFs5Xr4Fqrnag3W3CFW7uw1qvrWqva98uws7W3s7Aryv
	yr13Z3WFyryUAjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb4kFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUonmRUU
	UUU
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgwQA2kjIhL8xAAAsb

devm_pm_runtime_enable() can fail due to memory allocation. The current
code ignores its return value, potentially causing pm_runtime_idle() to
operate on uninitialized runtime PM state.

Check the return value of devm_pm_runtime_enable() and return on failure.

Fixes: d5282a539297 ("pinctrl: cs42l43: Add support for the cs42l43")
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/pinctrl/cirrus/pinctrl-cs42l43.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/cirrus/pinctrl-cs42l43.c b/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
index 68abb6d6cecd..fdf7e95b17ea 100644
--- a/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
+++ b/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
@@ -573,7 +573,9 @@ static int cs42l43_pin_probe(struct platform_device *pdev)
 
 	device_set_node(priv->dev, fwnode);
 
-	devm_pm_runtime_enable(priv->dev);
+	ret = devm_pm_runtime_enable(priv->dev);
+	if (ret)
+		return ret;
 	pm_runtime_idle(priv->dev);
 
 	pctldev = devm_pinctrl_register(priv->dev, &cs42l43_pin_desc, priv);
-- 
2.50.1.windows.1


