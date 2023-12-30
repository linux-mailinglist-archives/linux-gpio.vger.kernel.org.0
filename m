Return-Path: <linux-gpio+bounces-1925-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE035820358
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Dec 2023 03:34:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 620D11F23057
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Dec 2023 02:34:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45AFDEDC;
	Sat, 30 Dec 2023 02:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d6iKlG42"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86AEEA8
	for <linux-gpio@vger.kernel.org>; Sat, 30 Dec 2023 02:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1d480c6342dso18981585ad.2
        for <linux-gpio@vger.kernel.org>; Fri, 29 Dec 2023 18:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703903661; x=1704508461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3vefdk8/iJzpaxGvZcTTrhppkSS/zpKidmPe0dEioaA=;
        b=d6iKlG42QwXOhwW8cfIuB6ReiSuCPjxd+gCdnF2b4K4+kNYJNetVo4y3/sCSYOer7W
         n6eHdshWu//EWuG5joT3NyHBCY80uhxm160uKG8ANq12eH+tu0H7VaD0+fuAgWNLKcE7
         lfup4YDOtuAeTuV5xKEuZmGKWH1lLnilH70a/z1rGWcfWJVFTZQBXq2QLOjT/oHChp83
         IUxoaOh+9Zl6mD4D8R0Mx3deWEpbpNppZKYSzY9SNBSqaxtnR3H7iXTxYqe7kLrujP4T
         XoI5vw5o3TXu/0rs9u8XJwuzMIyiKIK8kKmrbWj+70MuT2r/9h0W2vuACYsX620MvNTo
         sdmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703903661; x=1704508461;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3vefdk8/iJzpaxGvZcTTrhppkSS/zpKidmPe0dEioaA=;
        b=dcbKCdkAwlvqq64zx+KTA97g8mYsW5rPRiVGDsONHoKEjRJy2PnI15amm8O3gRSFAI
         nTHyOEVn2vynZiTeh7t2/Yt6JzafOoq2kAbfN1nOfQt3fN8mITOjqHvf+y/vzVYeruMk
         CdsfsLYCtCBxnskHWZXJEwqFOpmfBNXTpMOrx836AV8dRTduzfemz9/A0gnMIDqZqewZ
         EI430ZA7L5MR1+dXOYAsT4KFx55SoAKb6NMcBag5u9b0yxn2lO+UN9+lUOPwLtTy+M4o
         41XqLx2EAbh3sZ6RO2p/pf1n2mCp67w+YNZl9g8GkA3pgcjChKpdqNsox+I+h/iyh86E
         0bvw==
X-Gm-Message-State: AOJu0YzY76bg8S2mRXDYjmYDI2FhiFlQ12Q8B2zyen80ocjCp+Yk3Ddf
	mYYO4esULPn0DwWr/IbHFb3mhhJZ2VE=
X-Google-Smtp-Source: AGHT+IGXIJFK6T1viZwXUQLVEivmAICCtqiWmPtKWUMY90e9pcwLr+7tqcMJpx/TaoGSQ9EWMA8jsQ==
X-Received: by 2002:a17:902:f7d5:b0:1d4:208e:a8a0 with SMTP id h21-20020a170902f7d500b001d4208ea8a0mr12579539plw.71.1703903660858;
        Fri, 29 Dec 2023 18:34:20 -0800 (PST)
Received: from rigel.home.arpa (60-241-235-125.tpgi.com.au. [60.241.235.125])
        by smtp.gmail.com with ESMTPSA id b8-20020a170902b60800b001cf65844874sm16249254pls.45.2023.12.29.18.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 18:34:20 -0800 (PST)
From: Kent Gibson <warthog618@gmail.com>
To: linux-gpio@vger.kernel.org,
	brgl@bgdev.pl
Cc: Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH] README: fix typo
Date: Sat, 30 Dec 2023 10:34:13 +0800
Message-Id: <20231230023413.23473-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typo in --enable-gpioset-interactive in TOOLS section.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 README | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/README b/README
index 962dc06..69128dc 100644
--- a/README
+++ b/README
@@ -134,7 +134,7 @@ Examples:
     # Blink an LED on GPIO22 at 1Hz with a 20% duty cycle
     $ gpioset -t200ms,800ms GPIO22=1
 
-    # Set some lines interactively (requires --enable-gpioset-interative)
+    # Set some lines interactively (requires --enable-gpioset-interactive)
     $ gpioset --interactive --unquoted GPIO23=inactive GPIO24=active
     gpioset> get
     GPIO23=inactive GPIO24=active
-- 
2.39.2


