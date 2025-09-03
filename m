Return-Path: <linux-gpio+bounces-25428-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1504BB4154F
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 08:39:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D53DF16C20C
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 06:39:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E80A2D8368;
	Wed,  3 Sep 2025 06:39:43 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from cmccmta1.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A0242D6619;
	Wed,  3 Sep 2025 06:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.22.67.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756881583; cv=none; b=Nu99+Y7Zv77ibqlYLcjRirfnLPwXrzPi7EQVkdz7QtlSOzETJtnXgzc8/X8BW/KsmcCmnXNH/L/xcWUmf4tnfvrHGDHtRRyb6m8vbywEGucucqAC+Mn4QmvRjn50aKqcvb/JQ693xHduMyQ4Yu0m2olfarCTlUlyhB5q9/5Hljo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756881583; c=relaxed/simple;
	bh=9RWu3UshWGIC85qBdM8N/9DADs0HeLBFX163XScBHew=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mooHvEkUxJv0R1tigwjtoq06hRULOsAgzOAG2fLgbr7FxI6nK4iwS6pHNOb7RsYyjf6gvuJd2iCW2aS8UvNmjOW02Jvjgt+VGIc0LUoML/pZFM07sNL7FR3wJj6p54P3+p9RIaxF2AO6e/pEY5paFAR5iMDO+A5WSTHyFofU0qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass smtp.mailfrom=cmss.chinamobile.com; arc=none smtp.client-ip=111.22.67.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee168b7e1ed3c5-52da3;
	Wed, 03 Sep 2025 14:36:29 +0800 (CST)
X-RM-TRANSID:2ee168b7e1ed3c5-52da3
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from Z04181454368174 (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr04-12004 (RichMail) with SMTP id 2ee468b7e1e9133-61f83;
	Wed, 03 Sep 2025 14:36:29 +0800 (CST)
X-RM-TRANSID:2ee468b7e1e9133-61f83
From: zhangjiao2 <zhangjiao2@cmss.chinamobile.com>
To: brgl@bgdev.pl
Cc: warthog618@gmail.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhang jiao <zhangjiao2@cmss.chinamobile.com>
Subject: [PATCH] tools: gpio: rm include dir when make clean
Date: Wed,  3 Sep 2025 14:36:20 +0800
Message-ID: <20250903063621.2424-1-zhangjiao2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: zhang jiao <zhangjiao2@cmss.chinamobile.com>

rm include dir when make clean

Signed-off-by: zhang jiao <zhangjiao2@cmss.chinamobile.com>
---
 tools/gpio/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/gpio/Makefile b/tools/gpio/Makefile
index ed565eb52275..342e056c8c66 100644
--- a/tools/gpio/Makefile
+++ b/tools/gpio/Makefile
@@ -77,7 +77,7 @@ $(OUTPUT)gpio-watch: $(GPIO_WATCH_IN)
 
 clean:
 	rm -f $(ALL_PROGRAMS)
-	rm -f $(OUTPUT)include/linux/gpio.h
+	rm -rf $(OUTPUT)include
 	find $(or $(OUTPUT),.) -name '*.o' -delete -o -name '\.*.d' -delete -o -name '\.*.cmd' -delete
 
 install: $(ALL_PROGRAMS)
-- 
2.33.0




