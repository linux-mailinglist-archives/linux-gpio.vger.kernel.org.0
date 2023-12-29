Return-Path: <linux-gpio+bounces-1914-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E71A681FEB6
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Dec 2023 10:33:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A7621F2309F
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Dec 2023 09:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E786D101F8;
	Fri, 29 Dec 2023 09:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A2HjGQ9W"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F2510A00
	for <linux-gpio@vger.kernel.org>; Fri, 29 Dec 2023 09:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-28c075ad8e7so4587309a91.2
        for <linux-gpio@vger.kernel.org>; Fri, 29 Dec 2023 01:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703842431; x=1704447231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9//bAFoz6vEI5nCZG+2mrTfj4Z29wGMt2kFPQl4urQ0=;
        b=A2HjGQ9WkO9TbrRDHfVys/Tzt3qESnijnb+3cYmCpMGqCGqnIZE88jnPtO2TmX22IV
         n4PaVcO6fZCqV+8tyhuCcEMSv6eFhMbO1MV8xxiOYJTsmdWxLnQd0QuiDbyFI/ftIFKl
         iYR6INU856AIEWo1cbUpu4wsFFkyDkmFuJ2CbJ4zj+o2PIQHilUvlDdD00BDrXiQy9eQ
         5BUBo3yOk7jJ3YQ5jue8Nq8tjKCcwJYFL8GxdIhU9y6/UjVNKr6W7/tZjYEOXzfV2f9t
         KgC4P1R3h4CPLfENy/2UarLvC5veEbPt7W6xqbwfLOBru1sAtYb8yjovbp44ZmgYb4eS
         WUYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703842431; x=1704447231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9//bAFoz6vEI5nCZG+2mrTfj4Z29wGMt2kFPQl4urQ0=;
        b=LPzJEPppA1DOr8T/nHmZqGiR8J6os8qJSS9Qmd8lepP1nnN7y+IKc1Gj9QOr2tjTKI
         ElQ1MrS9ehYzve0aqBCnbacAMZCVwwT7l9ndfDunc6jg8C0mtiAhUvLLbq5MO/jzXrL7
         9c54aGeQuEt6mIEaHvb3oci2EEJBsH+Mt0xAFdWJz52n3YsyExDzY8dEE2mdJCmPoDWi
         HDOmvReXXX7wMv1Tgi0rZ3UGi6Zk+/YSVROhsU9IEQe0X25zMNmTt6tVfVJsGXBSYJN8
         Vyp3Kp960Qq53NS/9hbFkAJcRtVwevDqsHtT0J3IJLNQscSJSm5GiF7aYdyr5gVHCPX8
         zi8w==
X-Gm-Message-State: AOJu0Yx1ouVnpe+mdgCcHuIi8W3qS8eWluh/BNkaDO6lMWcJlBczTtIQ
	RqhFlh/8RFm4g9kUG/yoQricBdKi8WQ=
X-Google-Smtp-Source: AGHT+IEJM/6MwoG/5mqW58tTMSO2QV7jSYY0WdXCxThQsMol1lElWSkhKsuDKzE5nXl9hAGvUH9StA==
X-Received: by 2002:a17:90a:9307:b0:28c:7a2c:c690 with SMTP id p7-20020a17090a930700b0028c7a2cc690mr3579139pjo.7.1703842431713;
        Fri, 29 Dec 2023 01:33:51 -0800 (PST)
Received: from rigel.home.arpa (60-241-235-125.tpgi.com.au. [60.241.235.125])
        by smtp.gmail.com with ESMTPSA id pi15-20020a17090b1e4f00b0028be1aec1b6sm15600907pjb.52.2023.12.29.01.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 01:33:51 -0800 (PST)
From: Kent Gibson <warthog618@gmail.com>
To: linux-gpio@vger.kernel.org,
	brgl@bgdev.pl
Cc: Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH v2 1/2] gpioset: reword note on post-exit behaviour
Date: Fri, 29 Dec 2023 17:33:27 +0800
Message-Id: <20231229093328.62366-2-warthog618@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231229093328.62366-1-warthog618@gmail.com>
References: <20231229093328.62366-1-warthog618@gmail.com>
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


