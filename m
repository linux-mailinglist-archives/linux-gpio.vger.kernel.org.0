Return-Path: <linux-gpio+bounces-25462-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4839CB419C9
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 11:19:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE750189771B
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 09:20:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 437052877C2;
	Wed,  3 Sep 2025 09:19:50 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [52.237.72.81])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDCD12AE66;
	Wed,  3 Sep 2025 09:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.237.72.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756891190; cv=none; b=Yo1uqjGEFsTzw9H99bQWslSJqq0kFwusspYnEm654hfdhpQXXII3zD4xsv4miT/5GDw7fl5xh2Fvu5bPAxJnGsvMj+nntFh82Asl7kwgCFGIqocHNI/ORB9sa6AbRvxXShxFvStMxfDKRhtRP+4WV2hy/x4WfuJ9lg/fypjzVyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756891190; c=relaxed/simple;
	bh=HEdeRtV5Q1OZXNw9HdTPR1mlzpEiS6bDQlDTVG298EU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nE6JdeqwTzPqvMD0F2qBZWS27IlTbyg3cri24XfGBPNw/LOVjurzQzz3Jpqj7R+ADTi8PsDAEhayeVuzk8sXmGipHA3ReXyLtipx5DnUaluLFAYehMtL2dbe8SkWrr/tnZG8pRfhTPco4aVrNG3E0roPnFM1Y+PPjcjrYvubER0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=52.237.72.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from E0006800LT.eswin.cn (unknown [10.12.96.77])
	by app1 (Coremail) with SMTP id TAJkCgDX7Q4WCLhoPozHAA--.31055S2;
	Wed, 03 Sep 2025 17:19:20 +0800 (CST)
From: Yulin Lu <luyulin@eswincomputing.com>
To: linus.walleij@linaro.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: ningyu@eswincomputing.com,
	zhengyu@eswincomputing.com,
	linmin@eswincomputing.com,
	huangyifeng@eswincomputing.com,
	fenglin@eswincomputing.com,
	lianghujun@eswincomputing.com,
	Yulin Lu <luyulin@eswincomputing.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH v2] pinctrl: eswin: Fix regulator error check and Kconfig dependency
Date: Wed,  3 Sep 2025 17:19:15 +0800
Message-Id: <20250903091915.2026-1-luyulin@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:TAJkCgDX7Q4WCLhoPozHAA--.31055S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tF4fCry3Jr1fZw47WF4kJFb_yoW5JF4UpF
	Z3GFy3Ar15tF4xJryUJa4I9Fy3Wan7GrW7Cw18K39xZFs8AFykA3s09FW5AFWqkr4kJw1Y
	y345tFyUuF9rZFDanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE
	6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72
	CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7
	M4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxkIecxEwVCm-wCF04
	k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
	MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr4
	1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l
	IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUBVbkUUUUU=
X-CM-SenderInfo: pox13z1lq6v25zlqu0xpsx3x1qjou0bp/

Smatch reported the following warning in eic7700_pinctrl_probe():

  drivers/pinctrl/pinctrl-eic7700.c:638 eic7700_pinctrl_probe()
  warn: passing zero to 'PTR_ERR'

The root cause is that devm_regulator_get() may return NULL when
CONFIG_REGULATOR is disabled. In such case, IS_ERR_OR_NULL() triggers
PTR_ERR(NULL) which evaluates to 0, leading to passing a success code
as an error.

However, this driver cannot work without a regulator. To fix this:

 - Change the check from IS_ERR_OR_NULL() to IS_ERR()
 - Update Kconfig to explicitly select REGULATOR and
   REGULATOR_FIXED_VOLTAGE, ensuring that the regulator framework is
   always available.

This resolves the Smatch warning and enforces the correct dependency.

Suggested-by: Dan Carpenter <dan.carpenter@linaro.org>
Fixes: 5b797bcc00ef ("pinctrl: eswin: Add EIC7700 pinctrl driver")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/linux-gpio/aKRGiZ-fai0bv0tG@stanley.mountain/
Signed-off-by: Yulin Lu <luyulin@eswincomputing.com>
---
Changes in v2:
 - Add Reported-by with Closes in the commit message.
 - Link to v1:
   https://lore.kernel.org/linux-gpio/20250902094508.288-1-luyulin@eswincomputing.com/
---
 drivers/pinctrl/Kconfig           | 2 ++
 drivers/pinctrl/pinctrl-eic7700.c | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index be1ca8e85754..0402626c4b98 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -211,6 +211,8 @@ config PINCTRL_EIC7700
 	depends on ARCH_ESWIN || COMPILE_TEST
 	select PINMUX
 	select GENERIC_PINCONF
+	select REGULATOR
+	select REGULATOR_FIXED_VOLTAGE
 	help
 	  This driver support for the pin controller in ESWIN's EIC7700 SoC,
 	  which supports pin multiplexing, pin configuration,and rgmii voltage
diff --git a/drivers/pinctrl/pinctrl-eic7700.c b/drivers/pinctrl/pinctrl-eic7700.c
index 4874b5532343..ffcd0ec5c2dc 100644
--- a/drivers/pinctrl/pinctrl-eic7700.c
+++ b/drivers/pinctrl/pinctrl-eic7700.c
@@ -634,7 +634,7 @@ static int eic7700_pinctrl_probe(struct platform_device *pdev)
 		return PTR_ERR(pc->base);
 
 	regulator = devm_regulator_get(dev, "vrgmii");
-	if (IS_ERR_OR_NULL(regulator)) {
+	if (IS_ERR(regulator)) {
 		return dev_err_probe(dev, PTR_ERR(regulator),
 					 "failed to get vrgmii regulator\n");
 	}
-- 
2.25.1


