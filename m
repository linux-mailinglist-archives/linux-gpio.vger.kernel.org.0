Return-Path: <linux-gpio+bounces-3550-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 97ED485D690
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Feb 2024 12:14:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D5331F21E6E
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Feb 2024 11:14:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 545033F8E4;
	Wed, 21 Feb 2024 11:14:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969D33D0AD
	for <linux-gpio@vger.kernel.org>; Wed, 21 Feb 2024 11:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708514047; cv=none; b=VX+M/05ZN8DI1s6+l3x1HlOQF1C6SiB4eTFMYfDrfa+wbGcwejHqRGc0Mhw0TvBOgQ2gvYLc1ryHNzlTs9hKGUMt8dhe42kVfzcoEJkPLRp9Iv/EsQnJ1pyingQZXRKPmYGGAWucemLpc8Jr0M0aXlC5+ZeiGiL+CKpJOq2AGdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708514047; c=relaxed/simple;
	bh=YUnl1mkBfjxZmXre7Pa2U9gjwjHs/Z4R0+N7NlwnAKA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JdbNXx6ZdCVfEwO/tSQED5518RTM4Jem7rNanW1+kWggL/1AtSIfCgnFKt0p+n+bdZZ6eypuxkmq3honcwrMzfdfiUN69bNurSE+lw+QJ1l/bOaUCd8bh+5QKVeWpTkeVQUzlp0LfiS640Yo4Gl8MJQbXKfLFZaHh38IUd5AG9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:5450:2f24:6e58:231d])
	by xavier.telenet-ops.be with bizsmtp
	id pnE12B00C59vpg201nE1im; Wed, 21 Feb 2024 12:14:02 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rckXw-001FUp-Sv;
	Wed, 21 Feb 2024 12:14:01 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rckY5-00BmHN-67;
	Wed, 21 Feb 2024 12:14:01 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: renesas: Allow the compiler to optimize away sh_pfc_pm
Date: Wed, 21 Feb 2024 12:13:59 +0100
Message-Id: <6238a78e32fa21f0c795406b6cba7bce7af92577.1708513940.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The conversion to DEFINE_NOIRQ_DEV_PM_OPS() lost the ability of the
compiler to optimize away the struct dev_pm_ops object when it is not
needed.

Fix this by replacing the use of pm_sleep_ptr() by a custom wrapper.

Fixes: 727eb02eb753375e ("pinctrl: renesas: Switch to use DEFINE_NOIRQ_DEV_PM_OPS() helper")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-pinctrl for v6.9.

Alternatively, one could add a unified definition:

    #define pm_psci_sleep_ptr(_ptr)        PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP) && \
					  IS_ENABLED(CONFIG_ARM_PSCI_FW), (_ptr))

Since there are already separate sections for CONFIG_ARM_PSCI_FW enabled
vs. disabled, I split in two and simplified the definition.
---
 drivers/pinctrl/renesas/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/core.c b/drivers/pinctrl/renesas/core.c
index 78331d7f7cca9d8c..96d6040a8871419b 100644
--- a/drivers/pinctrl/renesas/core.c
+++ b/drivers/pinctrl/renesas/core.c
@@ -737,10 +737,12 @@ static int sh_pfc_resume_noirq(struct device *dev)
 		sh_pfc_walk_regs(pfc, sh_pfc_restore_reg);
 	return 0;
 }
+#define pm_psci_sleep_ptr(_ptr)	pm_sleep_ptr(_ptr)
 #else
 static int sh_pfc_suspend_init(struct sh_pfc *pfc) { return 0; }
 static int sh_pfc_suspend_noirq(struct device *dev) { return 0; }
 static int sh_pfc_resume_noirq(struct device *dev) { return 0; }
+#define pm_psci_sleep_ptr(_ptr)	PTR_IF(false, (_ptr))
 #endif	/* CONFIG_ARM_PSCI_FW */
 
 static DEFINE_NOIRQ_DEV_PM_OPS(sh_pfc_pm, sh_pfc_suspend_noirq, sh_pfc_resume_noirq);
@@ -1423,7 +1425,7 @@ static struct platform_driver sh_pfc_driver = {
 	.driver		= {
 		.name	= DRV_NAME,
 		.of_match_table = of_match_ptr(sh_pfc_of_table),
-		.pm	= pm_sleep_ptr(&sh_pfc_pm),
+		.pm	= pm_psci_sleep_ptr(&sh_pfc_pm),
 	},
 };
 
-- 
2.34.1


