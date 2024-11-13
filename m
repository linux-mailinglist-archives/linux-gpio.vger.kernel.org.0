Return-Path: <linux-gpio+bounces-12898-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEAA9C6725
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 03:16:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DB90DB26A3A
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 02:15:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 465FA12DD8A;
	Wed, 13 Nov 2024 02:15:10 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from cmccmta2.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 947087EEFD;
	Wed, 13 Nov 2024 02:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.22.67.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731464110; cv=none; b=G1UhOemiye7zcl5CIoW6tVQv2Udlp9xQqk9ukVAkh7PJO3F+t14adrXLOMPySDZF6hUifxSLG1sNXVXQZcg8mvcLbPvEBTUvm6v6gCye5Yk9qTJMOL0RVrZ2ptrlFYsykKw4lXRPR4QQ/jJRSdAJb4gy71PcTGmlCMa6B0Nahl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731464110; c=relaxed/simple;
	bh=Uw0xzwicmh9cDaZnhDJzslV/a+6MZhi1LSWdbaTIbME=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gZ6KROeGjuygKqpPrLOHJlgTmjOZwObl4tIZkgUAvzKHyW2ceUxl/bbV2PZ+Nm3O2iepQw61ik5liiSU8FxtVidZxrK97FTz1YxCumXfPpr64t9DQOJ7ShFzmtlRHyXxiWZYg9nkvYe6t2Fe93OaOgp7Wq2EOshbxf5RS3AiD/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass smtp.mailfrom=cmss.chinamobile.com; arc=none smtp.client-ip=111.22.67.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app05-12005 (RichMail) with SMTP id 2ee567340ba64d1-134e6;
	Wed, 13 Nov 2024 10:15:03 +0800 (CST)
X-RM-TRANSID:2ee567340ba64d1-134e6
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from localhost.localdomain (unknown[223.108.79.103])
	by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee667340ba735f-7cdfe;
	Wed, 13 Nov 2024 10:15:03 +0800 (CST)
X-RM-TRANSID:2ee667340ba735f-7cdfe
From: Luo Yifan <luoyifan@cmss.chinamobile.com>
To: brgl@bgdev.pl,
	warthog618@gmail.com
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Luo Yifan <luoyifan@cmss.chinamobile.com>
Subject: [PATCH] tools: gpio: Fix several incorrect format specifiers
Date: Wed, 13 Nov 2024 10:14:58 +0800
Message-Id: <20241113021458.291252-1-luoyifan@cmss.chinamobile.com>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make a minor change to eliminate static checker warnings. The variable
lines[] is unsigned, so the correct format specifier should be %u
instead of %d.

Signed-off-by: Luo Yifan <luoyifan@cmss.chinamobile.com>
---
 tools/gpio/gpio-event-mon.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/gpio/gpio-event-mon.c b/tools/gpio/gpio-event-mon.c
index 5dee2b98a..b70813b0b 100644
--- a/tools/gpio/gpio-event-mon.c
+++ b/tools/gpio/gpio-event-mon.c
@@ -69,14 +69,14 @@ int monitor_device(const char *device_name,
 	}
 
 	if (num_lines == 1) {
-		fprintf(stdout, "Monitoring line %d on %s\n", lines[0], device_name);
+		fprintf(stdout, "Monitoring line %u on %s\n", lines[0], device_name);
 		fprintf(stdout, "Initial line value: %d\n",
 			gpiotools_test_bit(values.bits, 0));
 	} else {
-		fprintf(stdout, "Monitoring lines %d", lines[0]);
+		fprintf(stdout, "Monitoring lines %u", lines[0]);
 		for (i = 1; i < num_lines - 1; i++)
-			fprintf(stdout, ", %d", lines[i]);
-		fprintf(stdout, " and %d on %s\n", lines[i], device_name);
+			fprintf(stdout, ", %u", lines[i]);
+		fprintf(stdout, " and %u on %s\n", lines[i], device_name);
 		fprintf(stdout, "Initial line values: %d",
 			gpiotools_test_bit(values.bits, 0));
 		for (i = 1; i < num_lines - 1; i++)
-- 
2.27.0




