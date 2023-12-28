Return-Path: <linux-gpio+bounces-1885-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C05BE81F8A6
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Dec 2023 14:09:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 60A71B22C4D
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Dec 2023 13:09:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD38379C6;
	Thu, 28 Dec 2023 13:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OMaicCvo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69AEB79D7
	for <linux-gpio@vger.kernel.org>; Thu, 28 Dec 2023 13:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6d9af1f12e8so1191113b3a.1
        for <linux-gpio@vger.kernel.org>; Thu, 28 Dec 2023 05:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703768940; x=1704373740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9//bAFoz6vEI5nCZG+2mrTfj4Z29wGMt2kFPQl4urQ0=;
        b=OMaicCvoGm4lQ1OFKpBDEcfSgIfMlk/wEKYmtXiyn5vzwnAp8Le1O7NlB4pzRjX8pD
         jd1Bvkbb4kg5/JZVOAWYr5qpO7gJcUI51ZDYsICTX6d3/1O9EPah0JaEXnxrOHi9ttkq
         apw4ia22GZdPybvM+iTpOPgNYX8Dt+iJ1JCZzd6WPvNhjCDBVXkxWj95ODGOXt5X797+
         MH0vjGL7Xat7FvYSCYVvcgbCsM6LhJ4uSa1RAB3nFySJS+O7m+9E8vRYBroGlcOUC/uG
         0IpAS4mJnf0QHuGM8eWjN3OsNQdhdQUfX9nuA+ezcU4gEo9lHNfCcv/TXQh64XDPNKsd
         Db5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703768940; x=1704373740;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9//bAFoz6vEI5nCZG+2mrTfj4Z29wGMt2kFPQl4urQ0=;
        b=qTN50mYWIaBM1T2cUHek3s1Oq6cM76oFnCVA/8dAxXYvRtvIb9wGwP+HobXsfNfgsC
         vjOjvcW5XALm2kg1uvv4eK5TLI0NqTI05AORE5O1aec5TakkV4PMsms84BoNqnzA8cux
         9R4XNsxL8HJdimg7WczDbzKIK9qxjOCaFSOmjS/HU9Do2H6sSQxTo/F5eCCrL0bbs2az
         vZKP2h8sFGrGmUDIMb020cPBfWobi9jWV9f1/ZYnoRPSVuVIDocPymBQJbggDPfjFp1z
         MgkPjKKv4B7HGrzMBe3nLYwcPkePGX0PLOvyt+Pl2d4NP/6KzXumQBNA6u4u5J+enT/+
         A1cg==
X-Gm-Message-State: AOJu0YyCTeRJoPMdoX5iYp4C6D0VrAtFch9BVHviiVo5MIJ/lO5ahbVI
	k1Si05BPUzQFNHNasdDSBjW5yDYmz0k=
X-Google-Smtp-Source: AGHT+IFTBcSPc97Z/e5HQ4VVufqUXVAMmVqnNCzKJc8RsK5EG1+FEb2jcXDDE8cKPcKqnX6B7tGgpQ==
X-Received: by 2002:a05:6a00:1d25:b0:6d9:906d:f4c7 with SMTP id a37-20020a056a001d2500b006d9906df4c7mr4111651pfx.17.1703768940342;
        Thu, 28 Dec 2023 05:09:00 -0800 (PST)
Received: from rigel.home.arpa (60-241-235-125.tpgi.com.au. [60.241.235.125])
        by smtp.gmail.com with ESMTPSA id b30-20020aa78ede000000b006d9bf501c52sm6818778pfr.144.2023.12.28.05.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Dec 2023 05:08:59 -0800 (PST)
From: Kent Gibson <warthog618@gmail.com>
To: linux-gpio@vger.kernel.org,
	brgl@bgdev.pl
Cc: Kent Gibson <warthog618@gmail.com>
Subject: [PATCH] gpioset: reword note on post-exit behaviour
Date: Thu, 28 Dec 2023 21:08:37 +0800
Message-Id: <20231228130837.102524-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The note regarding the state of a line after gpioset exits is
confusing and unhelpful to the average reader, if not outright
incorrect.
A common mis-interpretation is that this behaviour is arbitrarily
chosen by spiteful implementors. The note also specifies that the line
reverts to default, but that is not always the case, or is at least
out of the control of gpioset or libgpiod.

Reword the note to constrain the scope to that relevant to the
likely reader, and to emphasize that the behaviour is inherent
in the kernel GPIO interface, not in the gpioset implementation.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 tools/gpioset.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/tools/gpioset.c b/tools/gpioset.c
index 9dc5aeb..f2f9a15 100644
--- a/tools/gpioset.c
+++ b/tools/gpioset.c
@@ -76,11 +76,10 @@ static void print_help(void)
 	print_period_help();
 	printf("\n");
 	printf("*Note*\n");
-	printf("    The state of a GPIO line controlled over the character device reverts to default\n");
-	printf("    when the last process referencing the file descriptor representing the device file exits.\n");
-	printf("    This means that it's wrong to run gpioset, have it exit and expect the line to continue\n");
-	printf("    being driven high or low. It may happen if given pin is floating but it must be interpreted\n");
-	printf("    as undefined behavior.\n");
+	printf("    It should not be assumed that a line will retain its state after gpioset exits.\n");
+	printf("    When a process exits, any GPIO lines it has requested are automatically released.\n");
+	printf("    Once released, the state of a line may be modified by the kernel or another process.\n");
+	printf("    To guarantee the requested value, by default gpioset does not exit.\n");
 }
 
 static int parse_drive_or_die(const char *option)
-- 
2.39.2


