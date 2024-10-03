Return-Path: <linux-gpio+bounces-10763-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6FB98E837
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 04:08:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 551341C22EC2
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 02:07:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0F8614012;
	Thu,  3 Oct 2024 02:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mhdmihML"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E66B3FEC
	for <linux-gpio@vger.kernel.org>; Thu,  3 Oct 2024 02:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727921275; cv=none; b=d8XzNFlTWYr9Z/DK+ABb0OY55k+8hbP5IydJl/AGQKigPFcx0mGXvDji5VptYU0MZ9mY1MMX9oNEgquSQ48COH8Ew7yOhYEGU4RhM277LN38j74waQ7+rcGCEmJdwZXg4MAcW/Hi2QRrEpOHq+H791SQMWEBnMIIfYWN3CRHsF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727921275; c=relaxed/simple;
	bh=vZj7PNA8iC5KaD7c8SG4x0g+OW28eW4sWRrRKaxCffI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=O80bHjOgRFvnefisTodvxhYko9Eg0A74uKVT/0vzWbSl3Her3tkK29HmibulPv6JfMWxNJntwC/pOoPCouMqHf6lrgGR1dBZSZKNykAaosw4meNGelKDPUim1Mqcsr3hT8u9hW1+oc5bZzYatRMWNKELKn1v/6E26CL+WSeEys0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mhdmihML; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2e07d91f78aso352054a91.1
        for <linux-gpio@vger.kernel.org>; Wed, 02 Oct 2024 19:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727921273; x=1728526073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uUEk8GH+Hswo4vdvbm1OCXAjgfFsOyUqS9vxbxymxj4=;
        b=mhdmihMLmIhgc3NzTd0UTqtTyHYGKEiwh2gmPRGR6pD7RMcVv2WAJBgQziYsghc2m2
         ZpJ0gzJfJewWhkzOCyXcyLK+KilK8hF7cdWxxtoMLOhPpDPBckNoRcWddhHEucr3XE1q
         lqozVqahZlW6L0q2LHFoDqTMjeSLnwdyhCKIKdmQvE72nmk8luoGYdkLmcyJ8yU/4GUH
         xaDB26GNRkOjUzbrqU9qCsbFyAfAsK5hr2BW/L4uqS8jVUX1t7guT1jC1E6ny1eiTg3M
         3Hg75hADxWxtRP1KwFfke4C2qIDNRpOe6M5Itr4Qj7WHMqC6kOrOq/BKNhwNVwCyfP+b
         9O0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727921273; x=1728526073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uUEk8GH+Hswo4vdvbm1OCXAjgfFsOyUqS9vxbxymxj4=;
        b=RWPjuFd4oEHgewfP7vi9Wkm3Si9HtzaY1AtiMGQ1/xgYCaRP3/8sbZ8RXn/iw7xJJ6
         ILR1TiGVvL3vZyHn90JBfhCMiq5h3617KuxRzIUC73pznJ083FveIkB4D9DAT36H+vqo
         +5Sf3P8ic1Y2LCoKu+oZrP2ebTX+XTx/2RY/fPfYe3SHHlU+eE6Z4qaRz3J13Ri0IGHI
         Ja2es5mvZ4i0UJl4VyW49F+EOsAZc032qmdThz725X2sLc9sAglhuXju8CYJK55cwItE
         qjmeBJ1V/IuTCU17GYAwYaGJVUPxF+iOAmpTh5M3CfgcvA4L1u1EAOknJp5DPZr7zM9r
         BIxA==
X-Gm-Message-State: AOJu0Yw7uwFggGEoEQMka1Dl0zXCmywmSqL6+cIJPGibRvCwYgLbxO+b
	pdxgn6raFHqijCptxnucTT+hq2K9j6uxpDKY8bdj0raFBZJNygBI4hmyzj06
X-Google-Smtp-Source: AGHT+IFmv/QPXNtZbuiuWYOfJMs2dvQjO1oxtqqda9mRvPsGnFrK9f/HJU5P0VdNHiGmMzxsmJV1Vw==
X-Received: by 2002:a17:90b:1051:b0:2e0:cace:4ccb with SMTP id 98e67ed59e1d1-2e1848fa270mr6076007a91.26.1727921273316;
        Wed, 02 Oct 2024 19:07:53 -0700 (PDT)
Received: from rigel.home.arpa (14-202-6-222.static.tpgi.com.au. [14.202.6.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e18fa05057sm2378562a91.41.2024.10.02.19.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 19:07:52 -0700 (PDT)
From: Kent Gibson <warthog618@gmail.com>
To: linux-gpio@vger.kernel.org,
	brgl@bgdev.pl
Cc: Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH] tools: line wrap period help
Date: Thu,  3 Oct 2024 10:07:43 +0800
Message-Id: <20241003020743.27194-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The help for periods is overly long so wrap it to make it more
consistent with other help lines.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
I've been meaning to send this one in for a while, not seeing a release
coming quite so soon.

Cheers,
Kent.

 tools/tools-common.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/tools-common.c b/tools/tools-common.c
index 4340bce..a684fcb 100644
--- a/tools/tools-common.c
+++ b/tools/tools-common.c
@@ -215,7 +215,8 @@ void print_period_help(void)
 {
 	printf("\nPeriods:\n");
 	printf("    Periods are taken as milliseconds unless units are specified. e.g. 10us.\n");
-	printf("    Supported units are 'm', 's', 'ms', and 'us' for minutes, seconds, milliseconds and microseconds respectively.\n");
+	printf("    Supported units are 'm', 's', 'ms', and 'us' for minutes, seconds, milliseconds and\n");
+	printf("    microseconds respectively.\n");
 }
 
 #define TIME_BUFFER_SIZE 20
-- 
2.39.5


