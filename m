Return-Path: <linux-gpio+bounces-12901-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9EA9C6916
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 07:10:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5AEBC282633
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 06:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB9AF17085A;
	Wed, 13 Nov 2024 06:10:00 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from cmccmta3.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4108C10F1;
	Wed, 13 Nov 2024 06:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.22.67.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731478200; cv=none; b=PPtc6IGNW14oPKAKenJeVvFLyqsUApEEY2ZM+OoIq2zr5WM6QgcEZ94bRqNZFGyym8SFsf3Cx3HOB+DS+KRQpnOfZUg1jrfvhtWcFk0inP2SEv1Tc4Qu+iQB5EtM/kKwusqILygkmO/+Fs7XKKT7iM9AFTYDiBzBDVXawDJ41oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731478200; c=relaxed/simple;
	bh=Wmb/uKPUBVqo8NmwVc4sTg+m0ITnAPHpxMp6IYNl1Uw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lQA7veMiTvbP0gU+rfClT3HvK4c/ZE/pKYCdWv3O4XSSW3t9142BF2itPNeNg3eeInGfah4GzYi/4e0VKgELpC5NoaDNrRzD+Y+u5CIwwjNf5M/tDSHdbbpvhfnAVIPDqbvhrbAysKlzWbNrA2djNOrYxG+Nkrjin6klfO6PEqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass smtp.mailfrom=cmss.chinamobile.com; arc=none smtp.client-ip=111.22.67.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee9673442affa7-1bfbc;
	Wed, 13 Nov 2024 14:09:53 +0800 (CST)
X-RM-TRANSID:2ee9673442affa7-1bfbc
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from localhost.localdomain (unknown[223.108.79.101])
	by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee6673442b0a41-8554f;
	Wed, 13 Nov 2024 14:09:52 +0800 (CST)
X-RM-TRANSID:2ee6673442b0a41-8554f
From: zhangjiao2 <zhangjiao2@cmss.chinamobile.com>
To: dlemoal@kernel.org
Cc: linus.walleij@linaro.org,
	linux-riscv@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhang jiao <zhangjiao2@cmss.chinamobile.com>
Subject: [PATCH v2] pinctrl: k210: Undef K210_PC_DEFAULT
Date: Wed, 13 Nov 2024 14:09:50 +0800
Message-Id: <20241113060950.5247-1-zhangjiao2@cmss.chinamobile.com>
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
better use its name in the #undef statement instead of
the incorrect "DEFAULT" name.

Fixes: d4c34d09ab03 ("pinctrl: Add RISC-V Canaan Kendryte K210 FPIOA driver")
Signed-off-by: zhang jiao <zhangjiao2@cmss.chinamobile.com>
---
v1->v2:
	Modify commit info and add a Fixes tag.

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




