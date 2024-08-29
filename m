Return-Path: <linux-gpio+bounces-9356-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67968963E2C
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 10:15:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0FFB81F22300
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 08:15:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B452D18A6A4;
	Thu, 29 Aug 2024 08:15:50 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from cmccmta2.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45E8716C877;
	Thu, 29 Aug 2024 08:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.22.67.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724919350; cv=none; b=O54a7ci4BMMOCAO612+rI6frzJ3q+tMmcYL8w3s1eFGtkTg5JAOzPcUSapQqfR1HOWCaaCo/Vd7VV0Jt4RNDeLxtc+oyvU1jDp6F3WeWZCYnchiQSVd3avQPIwAdp8TUI0R+YcJ9Hmfq8Lhl6A9IbNN0a6FwWqlvVHFq3s/UbWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724919350; c=relaxed/simple;
	bh=96b3QaO/fvdFeIQiacO3g3kb4N3p4fSEb5/85+QqnD8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ju5MuUB3rpbHJa/x6mYrsaGCiAOPX8n8Te0NdTDdhGGs5rqc6D3ELRWTqSMgOxV9UoyyJNLhf/rYhbGChdgo0DnTArflMXclRvflAYEqh9hDuyUZnudjbBT3qHPlrc+CRRMzkpzcC43H7BNk8IT/AZ0AgEGGNAzlGv0ouQ3b9Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass smtp.mailfrom=cmss.chinamobile.com; arc=none smtp.client-ip=111.22.67.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee866d02e2ea6b-efa9f;
	Thu, 29 Aug 2024 16:15:43 +0800 (CST)
X-RM-TRANSID:2ee866d02e2ea6b-efa9f
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from localhost.localdomain (unknown[223.108.79.100])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea66d02e2ef14-98800;
	Thu, 29 Aug 2024 16:15:43 +0800 (CST)
X-RM-TRANSID:2eea66d02e2ef14-98800
From: zhangjiao2 <zhangjiao2@cmss.chinamobile.com>
To: brgl@bgdev.pl
Cc: warthog618@gmail.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhangjiao <zhangjiao2@cmss.chinamobile.com>
Subject: [PATCH] tools: gpio: rm .*.cmd when make clean
Date: Thu, 29 Aug 2024 14:29:42 +0800
Message-Id: <20240829062942.11487-1-zhangjiao2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: zhangjiao <zhangjiao2@cmss.chinamobile.com>

rm .*.cmd when make clean

Signed-off-by: zhangjiao <zhangjiao2@cmss.chinamobile.com>
---
 tools/gpio/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/gpio/Makefile b/tools/gpio/Makefile
index d29c9c49e251..ed565eb52275 100644
--- a/tools/gpio/Makefile
+++ b/tools/gpio/Makefile
@@ -78,7 +78,7 @@ $(OUTPUT)gpio-watch: $(GPIO_WATCH_IN)
 clean:
 	rm -f $(ALL_PROGRAMS)
 	rm -f $(OUTPUT)include/linux/gpio.h
-	find $(or $(OUTPUT),.) -name '*.o' -delete -o -name '\.*.d' -delete
+	find $(or $(OUTPUT),.) -name '*.o' -delete -o -name '\.*.d' -delete -o -name '\.*.cmd' -delete
 
 install: $(ALL_PROGRAMS)
 	install -d -m 755 $(DESTDIR)$(bindir);		\
-- 
2.33.0




