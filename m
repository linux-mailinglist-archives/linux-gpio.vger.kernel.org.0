Return-Path: <linux-gpio+bounces-12896-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EB49C669B
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 02:22:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B57F11F23A99
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 01:22:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFF6422092;
	Wed, 13 Nov 2024 01:20:37 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from cmccmta2.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56BD13FC7;
	Wed, 13 Nov 2024 01:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.22.67.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731460837; cv=none; b=I6VMFduDxPPkk3KhDDQ1WZeuhOo0owqVDBC8GcUxhDcFGPASmfP/I36O+BqMV8RkfFZ3+ruyuijRjUNJOqdtBgkgRhWJJhPr6267v0exnd+EFs5UQNcd1U6AM4u/xFDXCQFcMOF734TTFvWNYhLp/Daon+SKrEPMhKE7vscZPUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731460837; c=relaxed/simple;
	bh=pry0G0uBjTa5BmnhwsGKHl5GBfoyMBtVfdPlEKw2WYk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HytdzWdMxx+Xdu9vSUoHnN6DV8gFkhuz3+quaxrgqqVU4+NDWvW5wBze6GFoQqCvlctzKl4CH+aRZMsQF5519HQ7+mV2dlQtS/911ULWZ4euarrLsIOgu7wLwMCuXdSS9uYWay6B/PliIDHm24oUa6c/6pAykS3F9f4k+UmxJcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass smtp.mailfrom=cmss.chinamobile.com; arc=none smtp.client-ip=111.22.67.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app05-12005 (RichMail) with SMTP id 2ee56733fede72a-1273f;
	Wed, 13 Nov 2024 09:20:31 +0800 (CST)
X-RM-TRANSID:2ee56733fede72a-1273f
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from localhost.localdomain (unknown[223.108.79.101])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6733fede07e-70045;
	Wed, 13 Nov 2024 09:20:31 +0800 (CST)
X-RM-TRANSID:2eea6733fede07e-70045
From: zhangjiao2 <zhangjiao2@cmss.chinamobile.com>
To: dlemoal@kernel.org
Cc: linus.walleij@linaro.org,
	linux-riscv@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhang jiao <zhangjiao2@cmss.chinamobile.com>
Subject: [PATCH] pinctrl: k210: Modify the wrong "#undef"
Date: Wed, 13 Nov 2024 09:20:29 +0800
Message-Id: <20241113012029.3204-1-zhangjiao2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: zhang jiao <zhangjiao2@cmss.chinamobile.com>

Here shuld be undef "K210_PC_DEFAULT", not "DEFAULT".

Signed-off-by: zhang jiao <zhangjiao2@cmss.chinamobile.com>
---
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




