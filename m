Return-Path: <linux-gpio+bounces-12905-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B31FD9C69AD
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 08:12:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40ADE1F25675
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 07:12:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4516717E00E;
	Wed, 13 Nov 2024 07:12:12 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from cmccmta2.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ACC67081F;
	Wed, 13 Nov 2024 07:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.22.67.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731481932; cv=none; b=gCCzmiHgH5qgk1zNDjTIpMvXLcb0o6YFYB9AYufGLbblUVHSw1fSKO7WTP+dTe8oY/qcIRZnFoS9EViimAA8kD1d6DdC6vF5bM9kjBz554Qz9lJe/AaYoPkyY5pBqUednQO42nxF0SV7PAHSZ6nN1HCv6s6jR/PPz1ATVTlWMqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731481932; c=relaxed/simple;
	bh=VW0RcWE6ESzxZakFAxwmSvtgoIN3Y/ZhwPy7PdJOFcY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dnZvrCPNXi3Ma5SWmMV041NJ+SzbWC+HdMHEVMPmJbg1xTbjwMYZM9SE9tfyK4tnZUxbs/vWBOAobiTMjVtnl3OelV7QEcf3HPsW9aUeXlJbpa4U9CgQbQ26DWatbYLImHkgUI/nTJLBS1HBbiWA86gU/xd8WmyzkuAxwFYVR8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass smtp.mailfrom=cmss.chinamobile.com; arc=none smtp.client-ip=111.22.67.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app05-12005 (RichMail) with SMTP id 2ee5673451443eb-16400;
	Wed, 13 Nov 2024 15:12:04 +0800 (CST)
X-RM-TRANSID:2ee5673451443eb-16400
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from localhost.localdomain (unknown[223.108.79.101])
	by rmsmtp-syy-appsvr05-12005 (RichMail) with SMTP id 2ee567345143e77-7f007;
	Wed, 13 Nov 2024 15:12:04 +0800 (CST)
X-RM-TRANSID:2ee567345143e77-7f007
From: zhangjiao2 <zhangjiao2@cmss.chinamobile.com>
To: dlemoal@kernel.org
Cc: linus.walleij@linaro.org,
	linux-riscv@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhang jiao <zhangjiao2@cmss.chinamobile.com>
Subject: [PATCH v4] pinctrl: k210: Undef K210_PC_DEFAULT
Date: Wed, 13 Nov 2024 15:12:01 +0800
Message-Id: <20241113071201.5440-1-zhangjiao2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: zhang jiao <zhangjiao2@cmss.chinamobile.com>

When the temporary macro K210_PC_DEFAULT is not needed anymore,
use its name in the #undef statement instead of
the incorrect "DEFAULT" name.

Fixes: d4c34d09ab03 ("pinctrl: Add RISC-V Canaan Kendryte K210 FPIOA driver")
Signed-off-by: zhang jiao <zhangjiao2@cmss.chinamobile.com>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
---
v3->v4:
	Modify commit info and add review tag.

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




