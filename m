Return-Path: <linux-gpio+bounces-5578-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1CC8A770E
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Apr 2024 23:52:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C279A1F21CB6
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Apr 2024 21:52:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E3186E60F;
	Tue, 16 Apr 2024 21:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="dq+jCISf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BDA69946
	for <linux-gpio@vger.kernel.org>; Tue, 16 Apr 2024 21:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713304353; cv=none; b=kDLf0cYvZDv5vtfXIlTQpUr/pTLoT2Z8k4YIL87bAWRckl76Qs9qvTTwurtRqeD8AxM/Q+i2AQcrF78Htinsm6LFEhKFhAd0iM5KzyvlT1mC4Kc19qJSCY7fXLR1Hv4itEs6aE+G0nFQesCFGl0irTlsxRpVLpAg+yJK3s4CnhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713304353; c=relaxed/simple;
	bh=q6/gLtyhQSyX7zsxFDwS1nDlm6kwyGd7DE1AAnd5Ks8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qwumieYJn88bcLhhk4KseiLKX5s/tVnfwVAQDpNIexk4rSHWjqPRm5nv52c42yFP8C92RYEoM09l4ohei4icLO2zJdHLpLFrAuPK+zM68T/46P9P8q7iU/1w7Qwgbv6RmZ81dCR+TBLTcI1/2oIch3AUrQyLkfOISuBFnc0gD9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=dq+jCISf; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6ed5109d924so4188665b3a.0
        for <linux-gpio@vger.kernel.org>; Tue, 16 Apr 2024 14:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1713304351; x=1713909151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TXiJdzRTAuB1UlX3lfsMbcreITp5HZxliXA/4a98Y64=;
        b=dq+jCISfnv29r/ddgXbGEF5TlyZL3tAtFSDg389/LE7B4UN60m8BUK7w6pKlaGiNh0
         w67HmrWVcAat2iXZtXhs3v3ECblTQh1C5m0uFaspcCM9mLANKQKzCZSlJlnwoA0H0jml
         4VKCh7JbdGHC/9F+GzKsNbmR9hNfeqY2MoHRACKucLH1jtrLUaMZsaHxmayoId7cCZ1Z
         UV9RlA6J9el2a0Qj31Zx7VGszBn7Q+QO2MSSajwZvXKEcqI8haXkhupnDOPkZNeNMhVH
         9J29//xpm+VzgOdcKWIBQI1S2GIoBcooWdzcjCa1d/M0PCNuuznZg5JbYpcXNnIrYhd8
         wlCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713304351; x=1713909151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TXiJdzRTAuB1UlX3lfsMbcreITp5HZxliXA/4a98Y64=;
        b=jlNUa0pBVGNX3KwZT27HfmIPVu48Fcsb37JeQuyHaaE+v6saxzpwEbb/SGcSLQ1QCt
         Jq3f3GVOJXoUR1VyV7eZEQLbsxH0uem4bBbSJQju1IZ2lmRdUwirOndvbh3+IoZuT6/4
         jEpek7uLuwir392kRTvPjqsDHWz4x1wh7hml0sba812pVmYJiiLwSmWFfaTXpuCEgyXo
         NC1GU3S0+KQFtxJrhirQSogBW5zGWe+59+6x6TTYBskmfUnpQ5NRVL4nklLnWM3Nzimv
         AfgidsD8UOcThRNJ89Ty24ri2LaY7wGenpi/EbobxMaojfOm1DGmrcxSD8w4eklarmwl
         Lukg==
X-Gm-Message-State: AOJu0Yyb9EouDXZuxsaSRamtmmFqHR1xHzYAjxnkrPes6PMTLPxEiBGe
	/CuJTa4e1gfWUMJxEJ0PEV7GzFIuTPP2NJEbBfEz/gHwlvVWs1G0kOQiBZw5UyHPLbybZq6awC3
	cyAw=
X-Google-Smtp-Source: AGHT+IGAixADyk/tsrCZSC2YS7wzRIrpN+S1hZwAxxKZOgoLJcJBlwxtj5tmxfZm0fYIiUdmxF9OvQ==
X-Received: by 2002:a05:6a21:3d84:b0:1a7:aba5:7ce9 with SMTP id bj4-20020a056a213d8400b001a7aba57ce9mr12798568pzc.34.1713304351505;
        Tue, 16 Apr 2024 14:52:31 -0700 (PDT)
Received: from brgl-uxlite.. ([24.75.208.145])
        by smtp.gmail.com with ESMTPSA id o8-20020a656148000000b005f07f34eb59sm8005217pgv.27.2024.04.16.14.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 14:52:30 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	=?UTF-8?q?Gunnar=20Th=C3=B6rnqvist?= <gunnar@igl.se>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH v2 4/4] tools: add minutes as a new supported time unit
Date: Tue, 16 Apr 2024 23:52:22 +0200
Message-Id: <20240416215222.175166-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240416215222.175166-1-brgl@bgdev.pl>
References: <20240416215222.175166-1-brgl@bgdev.pl>
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


