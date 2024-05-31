Return-Path: <linux-gpio+bounces-7010-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 692438D6360
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2024 15:46:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 941841C26F6C
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2024 13:46:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ADBE15CD63;
	Fri, 31 May 2024 13:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cPwnP8Kz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5975158D94
	for <linux-gpio@vger.kernel.org>; Fri, 31 May 2024 13:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717163188; cv=none; b=XlRbPAAbICFHhJ3SfHSv1pv0p7FCpTvQm646Q1LDO2LAw4Hqih35kGrhE7zmX1FLVG9itsOnpd94oVeeUkFcYJeHuC6VD/B6hZRrsgFByT21lDEVTDCrnkBoroZAvX4aMSIyCqEzvb7oK50tKdkAtHnBAyYlGZf8aQPF1Yv4Q/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717163188; c=relaxed/simple;
	bh=iQI12VGrrQ7bidskxCr3tmWla+bQCId1T7T84nkrhPI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PrPosuheE0qTMdDKi9G64YNLwHlkOsvatLYIm0aNTSAuLx7pVo+qAvhFXSweUmwozOYJcPsAUWTay3F9UNKyloufgmyv/pfvPJXYdHh6RODXLt6VRpLaAf4tVUr5cJ+ycgrqMR2FPFpqJrCg404JSDrq39PB42dSX3UnrJVzFds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cPwnP8Kz; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7024ac84ae4so490408b3a.2
        for <linux-gpio@vger.kernel.org>; Fri, 31 May 2024 06:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717163185; x=1717767985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hWcjVYMFQW3YUmLSfWMWMDe71MWRA7Shwzl5K0jFh0Y=;
        b=cPwnP8KzYxi1XqMsv+fZLX6sOas/b4xerLkrWfMHEQBZNacASEzHscOtnch33nbD9e
         aOpLUNlx07yw7GKMQBJxCt09wNREkyEXQRSSgn04AaMb9CzjJXgohA468/oVwpTVLqIv
         lenfM2Wm3+c+KKkHSlfEZZoVdv0ma0w6TtMqV2v3nUGIPzLF+IxoYTx3aCkAGjON7B6p
         JwNas6T8y9jhp8y3Xgiahxrkep1jgjExDaqFrEKJDAeJ4fDIDKg3XLn1sZZMKAszbp99
         UPjp/lQD2QncPcFp62FmQvYQPdxF/TE/41KnRNWchMCtdaCgoc5tRZ/5ma97KMBGCrLh
         hZSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717163185; x=1717767985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hWcjVYMFQW3YUmLSfWMWMDe71MWRA7Shwzl5K0jFh0Y=;
        b=XPCSQ11/Tw4mp89gnwGPA65S9/NW86clom5pyAnZqpMoJSsa8uTM5f5Zg8xGZnrMIs
         BFEikgdYUhu7uUttx9mWsb1E9owcM2ftsbkJ0Pgkrk49U+8tlPqEL5t40Oawkwd/BiVD
         9F/upSselchFf6GZLMXZSQgbJFBHydYMH2bqQTqjoF/knXVrMYtO9sG2u2St6kEcaFb6
         Uqc34JKJJILpi4R3Hh9l8PD2TrNWobTKq5wKdrk2f5IolJa2Aj86P59T4mopbYQsIwXc
         O6Zp+JgmiUuBfXFUHZgmCXDRWU39mbiJjLFEA4TGhBRm8yRiTst1Xhp7qlbpmyPd18I1
         s+yQ==
X-Gm-Message-State: AOJu0Ywc+zpTdfUxCwhfI/lI+1AWbveGqt+67Z6ZdHUhK3/Z0QpAAaIW
	3a6eUB5eigc48duG8409wnWAOwr+qj3od4Cv0kKWr+MIkH6ZFLr6oZDZqw==
X-Google-Smtp-Source: AGHT+IGBMXekJ5DNCiOZv4vevo+tEeOmbwFQgRYCfMNC1v6li1UMu2yzjcu4NOd48dLr2sii0v7VRw==
X-Received: by 2002:a05:6a20:7495:b0:1b2:565a:4b2d with SMTP id adf61e73a8af0-1b26f25de26mr2307553637.38.1717163185022;
        Fri, 31 May 2024 06:46:25 -0700 (PDT)
Received: from rigel.home.arpa (110-175-132-92.tpgi.com.au. [110.175.132.92])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-702423c7bf0sm1389825b3a.42.2024.05.31.06.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 06:46:24 -0700 (PDT)
From: Kent Gibson <warthog618@gmail.com>
To: linux-gpio@vger.kernel.org,
	brgl@bgdev.pl
Cc: Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH 5/8] tools: tests: don't use variables in printf format string
Date: Fri, 31 May 2024 21:45:09 +0800
Message-Id: <20240531134512.443850-6-warthog618@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240531134512.443850-1-warthog618@gmail.com>
References: <20240531134512.443850-1-warthog618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix shellcheck SC2059[1] - don't use variables in the printf format
string.

Signed-off-by: Kent Gibson <warthog618@gmail.com>

[1] https://www.shellcheck.net/wiki/SC2059
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


