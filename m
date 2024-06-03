Return-Path: <linux-gpio+bounces-7067-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F35D38D81BD
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 13:57:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6ED20B20325
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 11:57:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A529126F1A;
	Mon,  3 Jun 2024 11:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bTuZk+F7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791C386ADC
	for <linux-gpio@vger.kernel.org>; Mon,  3 Jun 2024 11:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717415846; cv=none; b=fWpB99qJTZMBWnSAGqqZI9N+uB/rRNWGDHoTj51IxKvOmXbIOVrE82t6gB/KNYWFEG1LZ8rBHOOCJnTvS8N9k6pnil26U8FeltCFSgLtyjeE91IQ3xWgYwk0kKPFxfxkF92MPiHToHazAY/l/QYQ1ctCBkfyS7RskGUQkL8rGJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717415846; c=relaxed/simple;
	bh=UQ47/oEz5snaGZ6x117kHx/W6Z22WUlr4PGmojz5kCs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uIr7T7McrLmEAe/TyzR86EIxmqy8MCF003kQsXlhEyjOkJCf1dXmcZ9le9NeSJOQASiCRS9G+BLEbeGm5WmznfMF0CDLFU63wBCpNe7VpelKP9GKP0Mr3iXHzQcaLFMe/+fzEGn3xNJNHWx5AKAC+b6HRUAUsDySuvxEZmDnVA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bTuZk+F7; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-24cbb884377so2515417fac.0
        for <linux-gpio@vger.kernel.org>; Mon, 03 Jun 2024 04:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717415844; x=1718020644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=luVhp1IpvGh4EPP60T8G9tjq8Hsom5vq9Pa/aRjrEPg=;
        b=bTuZk+F7xZkUYjGSlP4xMddyeli+yBo/7lEvP6G8Z17v/cmgb1BW+IdN8tsQBsGtBI
         PKwWtgU34psgmbCcluMKKF0bJsc0HqoVR4KumYM6djLN3P9qpPP53i6VfyD7hRNu1Pdi
         +caiLxwasm2B309365UuVBDuRI25iRR0sOROp3753eQvjfOrgpgTmMyfgf3sqCrPfVuT
         ZUFYIepN6ubh+ycZvCHqEO5rOo9sjg/WcP0wEl2kLfqN/BWE4Mq5PoHdqURSPnGgrb7o
         PcYrGUw77mmyAYcdWV4G2X6rjBingh4YK3KaGidtTX+MDeXdGPSAjF31y+jyePXFfW2S
         lNGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717415844; x=1718020644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=luVhp1IpvGh4EPP60T8G9tjq8Hsom5vq9Pa/aRjrEPg=;
        b=rGAu0JrtuQdTEtNTj8cwLotb4KCPAaNk+AdtrEvKhBeWmYUiZuwPsXupmNcXaXOSu0
         wE5lVM65vG5X1h2kfQDznf4ysq5SQOBOOFgOXLoKHPGHCRUqGOPMgYOOHfHhyoDvhsbJ
         DtIHsmiK4h4fJz0RDVTS3ChEiAcTGAA2W2lyWtkMD8U7YAIyxJVDeyms7q4jENkbp3xg
         Vv/jDNzG0vR9mNayo5pY7tXUB/lCyBGzvgbiiH9k8Ycyd0lC9R9544AwHH0VFlIJ1k2Z
         CeX4mYY6Hh4QpmXn0eL8kJVesJbZlJy/yjc/d0Azpwl7HgGjfetrvFraYqY2yLgcDeuh
         ZSzA==
X-Gm-Message-State: AOJu0YxUjneSP+I2y5trowPcQyC37z4xYAIve656m9QCAyLMrI7NeDYl
	2zhM05SdGur5LMMBv45iIeAEZbXdJRr7wNs/0yt9lANsvETaAxJqpc6pEw==
X-Google-Smtp-Source: AGHT+IE1/vgB/GISCHIlY8FpDY2pkgw8FvkjzLa15UvrtSSVRD6HnGKRP5XTvyXGBdmRl9+ntRxB9w==
X-Received: by 2002:a05:6871:e010:b0:24c:b4da:725d with SMTP id 586e51a60fabf-2508bf2f97dmr9103809fac.33.1717415844247;
        Mon, 03 Jun 2024 04:57:24 -0700 (PDT)
Received: from rigel.home.arpa (14-203-42-154.tpgi.com.au. [14.203.42.154])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-702425e1a71sm5328492b3a.88.2024.06.03.04.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 04:57:24 -0700 (PDT)
From: Kent Gibson <warthog618@gmail.com>
To: linux-gpio@vger.kernel.org,
	brgl@bgdev.pl
Cc: Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH v2 5/8] tools: tests: don't use variables in printf format string
Date: Mon,  3 Jun 2024 19:56:25 +0800
Message-Id: <20240603115628.102616-6-warthog618@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240603115628.102616-1-warthog618@gmail.com>
References: <20240603115628.102616-1-warthog618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix shellcheck SC2059[1] - don't use variables in the printf format
string.

[1] https://www.shellcheck.net/wiki/SC2059

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 tools/gpio-tools-test.bash | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/gpio-tools-test.bash b/tools/gpio-tools-test.bash
index efe558b..d9930f1 100755
--- a/tools/gpio-tools-test.bash
+++ b/tools/gpio-tools-test.bash
@@ -3048,7 +3048,7 @@ die() {
 oneTimeSetUp() {
 	test "$SHUNIT_VERSION" = "$MIN_SHUNIT_VERSION" && return 0
 	local FIRST
-	FIRST=$(printf "$SHUNIT_VERSION\n$MIN_SHUNIT_VERSION\n" | sort -Vr | head -1)
+	FIRST=$(printf "%s\n%s\n" "$SHUNIT_VERSION" "$MIN_SHUNIT_VERSION" | sort -Vr | head -1)
 	test "$FIRST" = "$MIN_SHUNIT_VERSION" && \
 		die "minimum shunit version required is $MIN_SHUNIT_VERSION (current version is $SHUNIT_VERSION"
 }
@@ -3058,7 +3058,7 @@ check_kernel() {
 	local CURRENT
 	CURRENT=$(uname -r)
 
-	SORTED=$(printf "$REQUIRED\n$CURRENT" | sort -V | head -n 1)
+	SORTED=$(printf "%s\n%s" "$REQUIRED" "$CURRENT" | sort -V | head -n 1)
 
 	if [ "$SORTED" != "$REQUIRED" ]
 	then
-- 
2.39.2


