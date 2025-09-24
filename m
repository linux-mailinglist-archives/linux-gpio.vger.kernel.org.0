Return-Path: <linux-gpio+bounces-26541-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C56ECB99F64
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Sep 2025 15:02:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 345BD1B25647
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Sep 2025 13:02:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 858322FCC0F;
	Wed, 24 Sep 2025 13:02:31 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561F0139579;
	Wed, 24 Sep 2025 13:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758718951; cv=none; b=pOJkJ/N5qSMPyqKcdTAVJ4QMB1dP/1eZam8XYTRjbHzCOBxvP91b2BerZJ0hvcHhQL+RB8RXYasDC5s4G/us5SLTRra8IOKs3qsbBCz82LEo1kSwHiuGMFakr5PRh8RR039HksIq3iI2tjzlYDecQo1LWbWt9zA1L5Md3N9IrKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758718951; c=relaxed/simple;
	bh=xMq3AUxobbF3UqePYHoPl4poiHEHjtjH3amZN3psfes=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QtU6DpiKc9+mS/FoxM2GsrlPbgqcuoyD+s1hwM3ztk7W0fus6hUX/J/LhO/g7LYk4ML/FmwgRe+yl8iWgYNPnRSXxIZ0BrB3rDe6j6WU7QsyxxZTQuGYa7BkyRtWXzW0JitZ9tgvxV1UAcW/Dfa92qGSC19yFighAWlgQ0NwtCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3CD4C4CEE7;
	Wed, 24 Sep 2025 13:02:29 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: cpg-lib: Remove unneeded semicolon
Date: Wed, 24 Sep 2025 15:02:25 +0200
Message-ID: <deb1537b5f96d991332db5c8088bae705f7e17e3.1758718886.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Semicolons after end of function braces are not needed, remove them.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-clk for v6.19.

 drivers/clk/renesas/rcar-cpg-lib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/rcar-cpg-lib.c b/drivers/clk/renesas/rcar-cpg-lib.c
index a45f8e7e9ab676f5..7b271de7037a13d9 100644
--- a/drivers/clk/renesas/rcar-cpg-lib.c
+++ b/drivers/clk/renesas/rcar-cpg-lib.c
@@ -35,7 +35,7 @@ void cpg_reg_modify(void __iomem *reg, u32 clear, u32 set)
 	val |= set;
 	writel(val, reg);
 	spin_unlock_irqrestore(&cpg_lock, flags);
-};
+}
 
 static int cpg_simple_notifier_call(struct notifier_block *nb,
 				    unsigned long action, void *data)
-- 
2.43.0


