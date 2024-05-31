Return-Path: <linux-gpio+bounces-7006-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A4A8D6354
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2024 15:46:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 32A421C21AD6
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2024 13:46:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D99915B106;
	Fri, 31 May 2024 13:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IBBg9ybt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1739A158D94
	for <linux-gpio@vger.kernel.org>; Fri, 31 May 2024 13:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717163147; cv=none; b=pGj0yyhBu3OgWs7rjhTAyRJLLjFwVri8tMMvZ+GmF1KMr9tJr6BW1Oo2bp0ce/PX/LVksR40DM/OTZB/jqrfsPlcjYJ8h262zOYDfD/SSn3sgrXGU/X4Gxkb3XDbybG0Sxj21UNhQRnJSAZQTlGHmYgpdRrDzpZ6CFRa4TefUHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717163147; c=relaxed/simple;
	bh=T3mqbJsEL2DHaXLq5FgSvXP7ajoZr3K0KqddgUtsdoo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gaVvK51kemRSboZfZYXGXtTmmnhcvx3yAR7ukj5BNRDedGHxRWizfgCijiihnYGXHMds9A8mgRBwIIre8jEDnzAQKXBeoP3tfrX4A9lVLGA/ZG6iMVR+kPxXRQbo4prcSCf7NsbwQmQHE3K69F1uc442N/crJo2boRb2cCabbks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IBBg9ybt; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-702342c60dfso1165844b3a.2
        for <linux-gpio@vger.kernel.org>; Fri, 31 May 2024 06:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717163145; x=1717767945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jJuZo+l1lk09vQCMGRvmseDxU4hqCIXkMglT3iTZgcE=;
        b=IBBg9ybtI6ofiOF8PLL3cgwZSauSS3hQpsMBkdyM551fFg60JICH1mqpkvAtVK4O3q
         y709gxf9lEecFZaQKrwDFDab8Df3Pzpt6JiCl49HqzuoHPbUpc77oAg3gsd7scCocILQ
         j16cY4suKTbMD1uk/z/bLcvunHFs1rpcXoDZwENyh1UweqPI0UkfAsrYYerZybAbrs7E
         UoJ5Ou+8YakGeAAFf54/AATGARrors4xEERHi15n/Dx3Ac3EVaZlo9AxKlXTbhab85Fa
         UfDgRvoDfP26LqAvKnnkc37bmCUUuewXkTAEqezlYWAzOEkO/j/ydwuRIxzvF22sD1f0
         Rskw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717163145; x=1717767945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jJuZo+l1lk09vQCMGRvmseDxU4hqCIXkMglT3iTZgcE=;
        b=DReiRvEI+zHZNckFcqwO0R26lk4e26n2HKahy0kV8Um89YbY0v2//175A1eWlo1uh/
         Up9YG2J++SYndc+cFkmayXgyNSF7afAy8IqJuc4A9VeEmO4yq8DuaGsXdkqRCefDwrki
         +hwVfOegcDuTMUrgbYnyb74fuiTBpsbrSlVsE5y6LR9XJKKyGJmxDYEfrOEPdUF6z499
         i/+UZCdhm0+35f9R/sz4+Pvo5q9/EvRICinwHisZl/pod7XurIchATE/l7yrW5TsMhdt
         iKBbvOlOlnf4f6LfG0uNO0/Ufvx4G8DDG4XahbOKypU4F56wZlriHt/GQuv1Yt47H1Tc
         Kb4Q==
X-Gm-Message-State: AOJu0YzzrfD0gjuDHptc1/PFl+Z8NxojiHw/U3mIDJnCyx6t6TeuNn2I
	xQ+TB0mW6nr5WGUQ3kgC96XAX5HQ4qXWCEcxCtLQzZwbab/UOEIzrD+zmw==
X-Google-Smtp-Source: AGHT+IGXx5BXNWh6SjDbp6FIvQlsKUjFjuxv/mmGSxrBvTjinsofnV6CBg13ydMLTMlpz1TmYAFU3A==
X-Received: by 2002:a05:6a00:1c94:b0:6f3:854c:dee0 with SMTP id d2e1a72fcca58-7024788e9c1mr1765307b3a.21.1717163145247;
        Fri, 31 May 2024 06:45:45 -0700 (PDT)
Received: from rigel.home.arpa (110-175-132-92.tpgi.com.au. [110.175.132.92])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-702423c7bf0sm1389825b3a.42.2024.05.31.06.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 06:45:44 -0700 (PDT)
From: Kent Gibson <warthog618@gmail.com>
To: linux-gpio@vger.kernel.org,
	brgl@bgdev.pl
Cc: Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH 1/8] tools: tests: don't mix string and array
Date: Fri, 31 May 2024 21:45:05 +0800
Message-Id: <20240531134512.443850-2-warthog618@gmail.com>
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

Fix shellcheck SC2145[1] - argument mixes string and array.

Separate the command from the array of arguments to avoid mixing.

Signed-off-by: Kent Gibson <warthog618@gmail.com>

[1] https://www.shellcheck.net/wiki/SC2145
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


