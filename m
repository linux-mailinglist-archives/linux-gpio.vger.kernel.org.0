Return-Path: <linux-gpio+bounces-5732-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDB98AE1BC
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Apr 2024 12:05:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BE831C21EE2
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Apr 2024 10:05:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D9EC5FBAA;
	Tue, 23 Apr 2024 10:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ucNaEisi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0AA921345
	for <linux-gpio@vger.kernel.org>; Tue, 23 Apr 2024 10:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713866705; cv=none; b=e/eS8CcLn/iuNPK83fUlEr4W3vWbD8NjpUl1leMutCi9l8FuBf7m78S0B34lgJEwREnxoyKYSXhMm2QyzbkrJopjG6QtYk+hKsgpfUmdXHy/sV0AcePkeq0mne8zwD43+SDCRjWHLnFuOGe7gEvr9qEVd5HmBUyVqwFP8J+ZYtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713866705; c=relaxed/simple;
	bh=q6/gLtyhQSyX7zsxFDwS1nDlm6kwyGd7DE1AAnd5Ks8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BW1yErKAU4owDCFdH4e2OaWKv7CVQNd48rX21RGaQUtpzaEohvoBLA0rDygFTxlu1oxC2PzVljZucOjk1Di/xo28afFuVRwopZTCE7P/loGsUw5xCD0Szz6j5tTCb9Fb3agKVKmidBwzQaX9/Sn2WpWKDpG6xmtwaGt9oen6XQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ucNaEisi; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2d8b194341eso53817791fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 23 Apr 2024 03:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1713866702; x=1714471502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TXiJdzRTAuB1UlX3lfsMbcreITp5HZxliXA/4a98Y64=;
        b=ucNaEisiPqlvbf8emdSHSU12BWefAS1bw/QwD5ghfzCOOFTMgRWZv+ANSDBVLwLykN
         fVErygmzNe3Vk6lfkVGgRSn/I6aHw+Ji3eSs/G29feasWcvRSFq9bQ3m7o3fUbavZt3P
         WkOmvjMkcWNHK4lnqAgo9CeUMB74r+lzhUHYAf1PriteUGEvzTMB5o7I9t0HJflrCpwF
         yi9iSC7P4NFrqJSxFNLVvmNyA9zzz/bNsNmmi/w/1akNRH6wL0uQ2gER3a8mSzojSgbz
         gxtgwk7saewJybd9ycBwP3aNi22wJ9lNf8LfbkL26ApxrWqKFqF52lon/PYM859AnQm1
         RcVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713866702; x=1714471502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TXiJdzRTAuB1UlX3lfsMbcreITp5HZxliXA/4a98Y64=;
        b=Nf1bQSpWUGcXTuMURSAgLgYV0rTEauOOI5G/bjJFyF3oRxlbKTzPIrtDImy2TtUWEe
         uUrTQurPxW2u7KvDH8QGHSTEPHg1N1k59QZ3RcJrKwus1tnRKEGAzSC7fu7EKZnI/7na
         4Qg/dmaIREoCAk3L9Wt4WHaBzLIlBVMghPnCH2Kg0E2ZPlw778r6vQ2kkrbWbnfN34Xq
         +hVbyM+a9lNL95Ii6NSFyWqrihDL65POZsaXJzjZ5vWHm1fDiQJkl5ApmCj+LN/cYo6m
         PbNfuhb7xlanDaK5JFzPS4c4TK2q/a0W1ZT7zyJU13lZbLkyrBmd9JR8r4swJRWkoCap
         o30Q==
X-Gm-Message-State: AOJu0Yw46x/L1FS/zRZ9/2H3SyWGdRicpbX16snNiWv/0NVyhOi+tlXT
	PaExBunme1koiYrDX8rZS7qpDLEVfB4iW+E7oBsC+0FKpMTMER/ylJ2MOUP9xZk=
X-Google-Smtp-Source: AGHT+IEMk/nlK0yHXdIlUO1bicYSjiCzxRWJUh71FcJFI49qRjYdM+JAemTsiPrTcQ/uTGA+cgycww==
X-Received: by 2002:a2e:2a86:0:b0:2dd:cc48:7f91 with SMTP id q128-20020a2e2a86000000b002ddcc487f91mr2479735ljq.25.1713866701957;
        Tue, 23 Apr 2024 03:05:01 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:a046:fbef:467d:18f7])
        by smtp.gmail.com with ESMTPSA id ay13-20020a05600c1e0d00b0041a7581f8b6sm5223200wmb.23.2024.04.23.03.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 03:05:00 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	=?UTF-8?q?Gunnar=20Th=C3=B6rnqvist?= <gunnar@igl.se>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH v3 4/4] tools: add minutes as a new supported time unit
Date: Tue, 23 Apr 2024 12:04:52 +0200
Message-Id: <20240423100452.32958-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240423100452.32958-1-brgl@bgdev.pl>
References: <20240423100452.32958-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Make it more convenient to specify longer time periods in gpio-tools by
introducing minutes as the new time unit.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 tools/tools-common.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/tools/tools-common.c b/tools/tools-common.c
index 500e9a2..4340bce 100644
--- a/tools/tools-common.c
+++ b/tools/tools-common.c
@@ -138,10 +138,12 @@ long long parse_period(const char *option)
 	}
 
 	if (m) {
-		if (*end != 's')
+		if (*end == '\0')
+			m = 60000000;
+		else if (*end == 's')
+			end++;
+		else
 			return -1;
-
-		end++;
 	} else {
 		m = 1000;
 	}
@@ -213,7 +215,7 @@ void print_period_help(void)
 {
 	printf("\nPeriods:\n");
 	printf("    Periods are taken as milliseconds unless units are specified. e.g. 10us.\n");
-	printf("    Supported units are 's', 'ms', and 'us'.\n");
+	printf("    Supported units are 'm', 's', 'ms', and 'us' for minutes, seconds, milliseconds and microseconds respectively.\n");
 }
 
 #define TIME_BUFFER_SIZE 20
-- 
2.40.1


