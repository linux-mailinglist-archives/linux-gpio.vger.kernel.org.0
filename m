Return-Path: <linux-gpio+bounces-7065-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DC28D81BA
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 13:57:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DB64EB22C98
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 11:57:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F42D86ADC;
	Mon,  3 Jun 2024 11:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JiKES6kR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA1F86AFA
	for <linux-gpio@vger.kernel.org>; Mon,  3 Jun 2024 11:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717415827; cv=none; b=gwkocO899NwBueqAA+eIKY5x2vEKowza/mMsenjBiwKzHdOPLYLdDmbv0oez8zzQS5wAiods87Wuj2OX39hazN94lo8a7nhBZHUl5BAsjwZwho7w22FTNMDYF+OFNGblIm5KSBx9wXp4ViC4z3PdGfpMfxzLj2Ltmdl4NRMl7w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717415827; c=relaxed/simple;
	bh=3+/BMRdE3pbkMT5Amci5hcdy/w8bEkVwk8nLghsKvJQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cUHkEoQvrozueCjNewWqCG5CdoldKZ2MMGu7l+oWr2rOkO77fPJ6NUdUoy8xkwf3mu4Ew3etJRTai34hVbOOAK0QmVKVn1CPk/FlZLo/3Iskhv2kYyiXFkyeje1dNR0yztQYbmgCWm0d2/g7/+E8DDJCjBoglFCnIHJmdtA61vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JiKES6kR; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7025ca8bebcso1135593b3a.3
        for <linux-gpio@vger.kernel.org>; Mon, 03 Jun 2024 04:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717415825; x=1718020625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aL/U1CcHePWTigOhrq/cysCXLH6V4Rzoc6hb31xlH+Y=;
        b=JiKES6kRaSKRfzbEpsN7IResMqj2JyoIiV7VhNHuKBBYzRHCyEahIzlIB7NuPy0UH4
         b6leyCAlrT5yMx/Sk0NzBk1gTWXz2d/LfVzZGLYDK+x8gtkMmf9V/zMoOIB4hl2T30Ac
         B/1tQtVcDvLxQVFTfq7XjwLCH8w5vnADZig0j8TVd2eZdMNIg56e9SfEaMxY3PDc9yQg
         G2VBmq37AaeddKAGtASNYX/LQYL4lCRLnpwyzUcG4pdgD34xs+lyjAH/Ragk9Du0SG5g
         uzUI7KWW23nJraB0sJotFydEpkj2avOmvYKYIzS4IX3nSfJpAxKWY0lOYnmN1LJcJLR8
         jdjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717415825; x=1718020625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aL/U1CcHePWTigOhrq/cysCXLH6V4Rzoc6hb31xlH+Y=;
        b=pMOQBxX8XYmL6Y4EncE11QnFL7RhsijqddhXokwTV1LgLIf5ca05r4g/v0/CE85Oc2
         JwhAWJfZ4zHowqjY41RilnyNIqCbgAdNFHsTCLtBUl3Wv2l53IdhQ0BkysghzTgyrCVz
         NvkfmbpNlExcTawFMDNcdWfBdnPE4KpvTFG6pw7KGbk+NbGJUxLM3s27+g511rSNz5cj
         viKhTJQTYtlqZ4fmiiRkTpKKdgLUH3FIKL8mtjcW4NhPYIOL+0RNiTzs8t8PQ8xKIGTl
         F3o1ebW3xEhtC0cD3xfIs6Ue5in/C/k8LaU1M49M/dEv9jlvTPjzy5G2qlnoNvgrSQVU
         BBrQ==
X-Gm-Message-State: AOJu0Yx3VTaVS1utdN6G083AyJdmnRq3YBdmA5eaUasfS9+br4R7kN3V
	1CjfVFpxUgrgMUaOGefnwvyaJHoPdntzr8GFlCQtccRV+QNrH2W8sIdTuA==
X-Google-Smtp-Source: AGHT+IH55wCN/GywV6fJXdX/34pPtMTxEOgdS0s1s5tD9ZZFGsCGUM4UwSKc9WpZ2ImNF8LMDnYJnw==
X-Received: by 2002:a05:6a21:32a8:b0:1ad:3d93:b71e with SMTP id adf61e73a8af0-1b26f30dc84mr9038400637.59.1717415825117;
        Mon, 03 Jun 2024 04:57:05 -0700 (PDT)
Received: from rigel.home.arpa (14-203-42-154.tpgi.com.au. [14.203.42.154])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-702425e1a71sm5328492b3a.88.2024.06.03.04.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 04:57:04 -0700 (PDT)
From: Kent Gibson <warthog618@gmail.com>
To: linux-gpio@vger.kernel.org,
	brgl@bgdev.pl
Cc: Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH v2 3/8] tools: tests: fix unused variables
Date: Mon,  3 Jun 2024 19:56:23 +0800
Message-Id: <20240603115628.102616-4-warthog618@gmail.com>
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

Fix shellckeck SC2034[1] - foo appears unused.

Prefix intentionally unused variables with "_" and remove variables
not actually used.

[1] https://www.shellcheck.net/wiki/SC2034

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 tools/gpio-tools-test.bash | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/tools/gpio-tools-test.bash b/tools/gpio-tools-test.bash
index 6bbb06c..b065296 100755
--- a/tools/gpio-tools-test.bash
+++ b/tools/gpio-tools-test.bash
@@ -146,7 +146,7 @@ gpiosim_wait_value() {
 	local CHIPNAME=${GPIOSIM_CHIP_NAME[$1]}
 	local PORT=$GPIOSIM_SYSFS/$DEVNAME/$CHIPNAME/sim_gpio$OFFSET/value
 
-	for i in {1..30}; do
+	for _i in {1..30}; do
 		[ "$(<$PORT)" = "$EXPECTED" ] && return
 		sleep 0.01
 	done
@@ -159,7 +159,6 @@ gpiosim_cleanup() {
 		local NAME=${GPIOSIM_APP_NAME}-$$-$CHIP
 
 		local DEVPATH=$GPIOSIM_CONFIGFS/$NAME
-		local BANKPATH=$DEVPATH/bank0
 
 		echo 0 > $DEVPATH/live
 		find "$DEVPATH" -type d -name hog -exec rmdir '{}' '+'
@@ -229,13 +228,13 @@ dut_readable() {
 }
 
 dut_flush() {
-	local JUNK
+	local _JUNK
 	lines=()
 	output=
 	unset DUT_FIRST_CHAR
-	while read -t 0 -u ${COPROC[0]} JUNK
+	while read -t 0 -u "${COPROC[0]}" _JUNK
 	do
-		read -t 0.1 -u ${COPROC[0]} JUNK || true
+		read -t 0.1 -u "${COPROC[0]}" _JUNK || true
 	done
 }
 
-- 
2.39.2


