Return-Path: <linux-gpio+bounces-25350-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7B9B3FAF5
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Sep 2025 11:45:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32D4A3BD2FC
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Sep 2025 09:45:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 796432EC544;
	Tue,  2 Sep 2025 09:45:32 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.76.142.27])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0670A2E8DEF;
	Tue,  2 Sep 2025 09:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.76.142.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756806332; cv=none; b=d74LTBOWjEF7V8WW2qsM1SMknPntlQm4WsFNpYwfsjwvQiT8JDnT6ncLUtWc0NhzrU0icpTDgRPOA32VUrs7U+2e/4YB63fM/pG3yhgoT+WwVfyyODbn6h2+LP2V2ofJT54nKSVqzd1jjRbmM9+2YPyIcllyIt2PmH04/4GD2MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756806332; c=relaxed/simple;
	bh=ql+elIt0KJIijNej8diArkCswhobJITiTSz7FP9wt0A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=j05sLALiLEwcNmDQWOh+o85oCNa9rpshAB9FO/CHuRMBxZE/UkiQgGKOlMFLUFAHFL0uaANB0wY/lgPWRnH5qKI1SAJa06NRvgsr+OdQJJK2vEa9DO1dU/YmEh9Ur9fIvgQzpprJi9YnimOHIFP6pmqP+SWIHrVLTNbQoe2r2yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=13.76.142.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from E0006800LT.eswin.cn (unknown [10.12.96.77])
	by app2 (Coremail) with SMTP id TQJkCgB3FpWpvLZoXuPGAA--.49929S2;
	Tue, 02 Sep 2025 17:45:17 +0800 (CST)
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
Subject: [PATCH] pinctrl: eswin: Fix regulator error check and Kconfig dependency
Date: Tue,  2 Sep 2025 17:45:08 +0800
Message-Id: <20250902094508.288-1-luyulin@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:TQJkCgB3FpWpvLZoXuPGAA--.49929S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tF4fCry3Jr1fZw47WF4kJFb_yoW8uFW5pF
	Z3GFyfAr1UJF4xJryUJ34I9Fy3Gan7GrW7Cw48K39xXFs8AFyDA3s0qFW5AFWvkr4kJr1Y
	y345tFyUWF17ZFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9G14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMx
	C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
	wI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
	vE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v2
	0xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxV
	W8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbGQ6JUUUUU==
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
Signed-off-by: Yulin Lu <luyulin@eswincomputing.com>
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


