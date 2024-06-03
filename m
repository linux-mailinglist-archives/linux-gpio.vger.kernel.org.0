Return-Path: <linux-gpio+bounces-7063-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B3E8D81B5
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 13:56:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 74B7F1C225AB
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 11:56:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EB2986AFB;
	Mon,  3 Jun 2024 11:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ABBNTUKN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFB784A49
	for <linux-gpio@vger.kernel.org>; Mon,  3 Jun 2024 11:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717415806; cv=none; b=cADsJ7pOd7+9hhLTbBXQquBqdpM0cvekzSz+Led5eLnZu329QowldniSkopUgirFzTQNVqj/PipCHDvsXb4VVcGkx8kiTY/TlGbcg0PhZVlYJ3R4h0oyQsL4WVtVTFCMghysQdf/bXBxQEwRFQcmmbZlJBOs9hZx8C9xoFNvqoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717415806; c=relaxed/simple;
	bh=3WYBdk2baKz1XRGL0yVVK1NnWlbRI2SdG5ITwHWW+KM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HEl8VSSFl/jPsiVgjffRS9D5z3h1fBhpvOafq/Y4AnyNbi2Vjrjbnj3YQXw3XBaB6pYS3r4g6D+56y3DV5DzPWggkfZJwQa6AX/5sH60sVNTaB5VRnI1wz0xag9Tc+apAEk932MvYs/h3uSFY4ZumU7mUf9FlA3YTxHpZfHT3DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ABBNTUKN; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-702447766fdso3169880b3a.1
        for <linux-gpio@vger.kernel.org>; Mon, 03 Jun 2024 04:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717415804; x=1718020604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hmrZ5+TOtPxgncYs8I9YkHuXRTTzK57JkkNUbeKvp/Y=;
        b=ABBNTUKNTE8Y6hXMQMpQXqJd7M11GoU35P7T/iNvaNXGBhGVjzrCaZqZLvMYHK4EVi
         VD4H1h04+emJUlNXaNi4wE2hSmhWRg23RKcTG8lkj3zKRtYO+VLrnS/DuwB4+i/mip7a
         sB3s9myVQrKv2bdU0B2wAAuR0QevqarrZgBAub05wFMPDyxtLsHd0FUOAmzAAMjCm28R
         YSWLZZ8Txrd+bLu6wVqY3ZrMmW4ffqRgeYiu7UZls2WRHWy6PoPpOcVbYmOew600E5w0
         LGYuWIsyh95z4iy8NHjmfjFjCfI+RI0XjIhEz1+nYAvesYwVmLC2RpY9KDQKBqq9Z9Bk
         lKWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717415804; x=1718020604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hmrZ5+TOtPxgncYs8I9YkHuXRTTzK57JkkNUbeKvp/Y=;
        b=UBNk5sE5DFb+qDehCHpmAIiP3fB9DSp6Fc2jbxs+iZrcrMRUS5aMwTgGCcv33VEHLT
         22h5trqtT8kK88gCKYP8WS1+jULBVUSzUKI8qaa0ozsLScy1Lq2LdSB4LEg5woAE6IRj
         9rBbJdviVBofDNhQHjp2KCQ8tTF8yOtOaDQXC3zytQwUlX7Y5ct6GeWFymoYi7NLX7xW
         oZdPTR7YWRtm3Mo6dTMTZAwOmtYEjSSalCBcKoeoRoNNQRYcoYAFdJwCuXmG0Cw8ulH1
         mTjMUEXqELDYLLCRHiA18ZtaSEUUNH7P+ht69Vw3ky9Iu7jpjCD3Eo+DOfKwcZ3SKLzD
         L46Q==
X-Gm-Message-State: AOJu0YwkBP7YgiwtHpEhw4ToU3zsDkvbgHY7fdd4ENZGoC9lxa/cag6T
	MHPfDBDUfbb2ba7vvU2z5Q4oTg19Vaqw9Rf22ccu4f8OUswom3tf/w5l8Q==
X-Google-Smtp-Source: AGHT+IFHKWROrqqzIUyPYLONZFy/S97YLPI/GZ74lIwR+8PPSHmWazHUTzVvFDo7ZoqQhUPfGVyMiA==
X-Received: by 2002:a05:6a21:32a1:b0:1af:ad46:cd4a with SMTP id adf61e73a8af0-1b26f16ea65mr11073862637.12.1717415803964;
        Mon, 03 Jun 2024 04:56:43 -0700 (PDT)
Received: from rigel.home.arpa (14-203-42-154.tpgi.com.au. [14.203.42.154])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-702425e1a71sm5328492b3a.88.2024.06.03.04.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 04:56:43 -0700 (PDT)
From: Kent Gibson <warthog618@gmail.com>
To: linux-gpio@vger.kernel.org,
	brgl@bgdev.pl
Cc: Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH v2 1/8] tools: tests: don't mix string and array
Date: Mon,  3 Jun 2024 19:56:21 +0800
Message-Id: <20240603115628.102616-2-warthog618@gmail.com>
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

Fix shellcheck SC2145[1] - argument mixes string and array.

Separate the command from the array of arguments to avoid mixing.

[1] https://www.shellcheck.net/wiki/SC2145

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 tools/gpio-tools-test.bash | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/tools/gpio-tools-test.bash b/tools/gpio-tools-test.bash
index 521556c..34ea744 100755
--- a/tools/gpio-tools-test.bash
+++ b/tools/gpio-tools-test.bash
@@ -174,18 +174,24 @@ gpiosim_cleanup() {
 run_tool() {
 	# Executables to test are expected to be in the same directory as the
 	# testing script.
-	output=$(timeout 10s $SOURCE_DIR/"$@" 2>&1)
+	cmd=$1
+	shift
+	output=$(timeout 10s "$SOURCE_DIR/$cmd" "$@" 2>&1)
 	status=$?
 }
 
 dut_run() {
-	coproc timeout 10s $SOURCE_DIR/"$@" 2>&1
+	cmd=$1
+	shift
+	coproc timeout 10s "$SOURCE_DIR/$cmd" "$@" 2>&1
 	DUT_PID=$COPROC_PID
 	read -t1 -n1 -u ${COPROC[0]} DUT_FIRST_CHAR
 }
 
 dut_run_redirect() {
-	coproc timeout 10s $SOURCE_DIR/"$@" > $SHUNIT_TMPDIR/$DUT_OUTPUT 2>&1
+	cmd=$1
+	shift
+	coproc timeout 10s "$SOURCE_DIR/$cmd" "$@" > "$SHUNIT_TMPDIR/$DUT_OUTPUT" 2>&1
 	DUT_PID=$COPROC_PID
 	# give the process time to spin up
 	# FIXME - find a better solution
-- 
2.39.2


