Return-Path: <linux-gpio+bounces-12903-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC149C695D
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 07:36:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 315AB2819A9
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 06:36:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC853176AB6;
	Wed, 13 Nov 2024 06:36:19 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from cmccmta3.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72A2E2594;
	Wed, 13 Nov 2024 06:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.22.67.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731479779; cv=none; b=FALoixbqsQitpW3qET42CsmQcP7zlQ+OfgV5OaXMkuxBgz+m/krBc/bxDq3rPHwGS48IJY1UtaNFSlyFodf/JRYCthyZFXEP5XY5SMSY6XQQ0LSPtC2hHmIGhuLanBQK1jg0F5Bk3WoeY0Xz0pfuGKJ3XMNvmB/wMymbHrP7d6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731479779; c=relaxed/simple;
	bh=l7Sto6FSLKFmoQNz9o3Di+PfkX0xOVmQJjwYXL97NHU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TuUYftAWRnyYYDWsWhVkcj5m8m5IGebYny+ePCjo8tuetVXm3OFWja0xltUVtLVcl4QiRH1E2zScX0RPYLYPwJoafxdhffEzPZBKWCOX1j9We3AYXH3PZwWFj2TzpOBDW6B9QEZJEkMKc70vvYla2fbJ6STG8jShMwRCwRGLQ20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass smtp.mailfrom=cmss.chinamobile.com; arc=none smtp.client-ip=111.22.67.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee9673448dd41f-1c434;
	Wed, 13 Nov 2024 14:36:13 +0800 (CST)
X-RM-TRANSID:2ee9673448dd41f-1c434
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from localhost.localdomain (unknown[223.108.79.101])
	by rmsmtp-syy-appsvr04-12004 (RichMail) with SMTP id 2ee4673448dc8e3-63f8e;
	Wed, 13 Nov 2024 14:36:13 +0800 (CST)
X-RM-TRANSID:2ee4673448dc8e3-63f8e
From: zhangjiao2 <zhangjiao2@cmss.chinamobile.com>
To: dlemoal@kernel.org
Cc: linus.walleij@linaro.org,
	linux-riscv@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhang jiao <zhangjiao2@cmss.chinamobile.com>
Subject: [PATCH v3] pinctrl: k210: Undef K210_PC_DEFAULT
Date: Wed, 13 Nov 2024 14:36:11 +0800
Message-Id: <20241113063611.5330-1-zhangjiao2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: zhang jiao <zhangjiao2@cmss.chinamobile.com>

When the temporary macro K210_PC_DEFAULT is no need anymore,
use its name in the #undef statement instead of
the incorrect "DEFAULT" name.

Fixes: d4c34d09ab03 ("pinctrl: Add RISC-V Canaan Kendryte K210 FPIOA driver")
Signed-off-by: zhang jiao <zhangjiao2@cmss.chinamobile.com>
---
v2->v3:
	Modify commit info.

 drivers/pinctrl/pinctrl-k210.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-k210.c b/drivers/pinctrl/pinctrl-k210.c
index caf20215aaba..eddb01796a83 100644
--- a/drivers/pinctrl/pinctrl-k210.c
+++ b/drivers/pinctrl/pinctrl-k210.c
@@ -181,7 +181,7 @@ static const u32 k210_pinconf_mode_id_to_mode[] = {
 	[K210_PC_DEFAULT_INT13] = K210_PC_MODE_IN | K210_PC_PU,
 };
 
-#undef DEFAULT
+#undef K210_PC_DEFAULT
 
 /*
  * Pin functions configuration information.
-- 
2.33.0




