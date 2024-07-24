Return-Path: <linux-gpio+bounces-8369-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBCD93AB63
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jul 2024 04:49:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA1B11F23A0C
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jul 2024 02:49:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 888BB17C95;
	Wed, 24 Jul 2024 02:49:54 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from cmccmta1.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A164B1757E;
	Wed, 24 Jul 2024 02:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.22.67.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721789394; cv=none; b=NSPXNkSwkFDC2pkrtez0K5EQw6MfLNvEWybYLexsSH+PXXkwH+45/Fwhhb2ugy7/KuzlvHC9Yd2JAlbWBIlPl2xW77pi+68gQFE0t7+MCFFG2nGbMI+iFBkTmBao4MeY0vRz3kFBsH+2j3kxNArypiTHGtcNyyoKlc7nB5gXl18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721789394; c=relaxed/simple;
	bh=IMBrAnnv2WFhe41hcBTQ5zryPuhXKpIW8agh6cQc13g=;
	h=From:To:Cc:Subject:Date:Message-Id; b=DoFktJWD6Ws96ecNdX5+r+jrkAFzGqVHz1ieC5Uo+ARdmVVRO9NLpwgzE/J9clZOYOMD/0BGueWsfvW2KS7a/eC7Qe45Vxl5n6vTi3Ndm1FrjoFNZStBcrlg04F953sgP40OOXbGbh9BruXuyjKTuzYLgzKmL5k+x3jKH50KTaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass smtp.mailfrom=cmss.chinamobile.com; arc=none smtp.client-ip=111.22.67.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee466a06b0d5c0-65eaf;
	Wed, 24 Jul 2024 10:46:38 +0800 (CST)
X-RM-TRANSID:2ee466a06b0d5c0-65eaf
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from ubuntu.localdomain (unknown[223.108.79.100])
	by rmsmtp-syy-appsvr02-12002 (RichMail) with SMTP id 2ee266a06b0d17a-93f15;
	Wed, 24 Jul 2024 10:46:38 +0800 (CST)
X-RM-TRANSID:2ee266a06b0d17a-93f15
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: brgl@bgdev.pl
Cc: warthog618@gmail.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhujun2@cmss.chinamobile.com
Subject: [PATCH] tools/gpio:Fix the wrong format specifier
Date: Tue, 23 Jul 2024 19:46:36 -0700
Message-Id: <20240724024636.3634-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The unsigned int should use "%u" instead of "%d".

Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 tools/gpio/gpio-hammer.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/gpio/gpio-hammer.c b/tools/gpio/gpio-hammer.c
index 54fdf59dd320..ba0866eb3581 100644
--- a/tools/gpio/gpio-hammer.c
+++ b/tools/gpio/gpio-hammer.c
@@ -54,7 +54,7 @@ int hammer_device(const char *device_name, unsigned int *lines, int num_lines,
 
 	fprintf(stdout, "Hammer lines [");
 	for (i = 0; i < num_lines; i++) {
-		fprintf(stdout, "%d", lines[i]);
+		fprintf(stdout, "%u", lines[i]);
 		if (i != (num_lines - 1))
 			fprintf(stdout, ", ");
 	}
@@ -89,7 +89,7 @@ int hammer_device(const char *device_name, unsigned int *lines, int num_lines,
 
 		fprintf(stdout, "[");
 		for (i = 0; i < num_lines; i++) {
-			fprintf(stdout, "%d: %d", lines[i],
+			fprintf(stdout, "%u: %d", lines[i],
 				gpiotools_test_bit(values.bits, i));
 			if (i != (num_lines - 1))
 				fprintf(stdout, ", ");
-- 
2.17.1




