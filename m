Return-Path: <linux-gpio+bounces-7008-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D4A8D635B
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2024 15:46:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5F230B21F13
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2024 13:46:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78F0215B112;
	Fri, 31 May 2024 13:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TY5/DVqE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BB0158D94
	for <linux-gpio@vger.kernel.org>; Fri, 31 May 2024 13:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717163167; cv=none; b=JmDy77teK1wqdn+jJP4t6Voc0saqzAP8wLVGIAkYelplqEc22MQxkjnVorFB+//EkBtVibOaPvZGH1V3iNzSLrVZrzV1jbuvax7ijaUwszvV9KFyYWnZl/ECVBFk7Dzhj6RhII2PUrFIAQKiwIL8k66KwszxZ0bzn5yZC0lQTYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717163167; c=relaxed/simple;
	bh=WKoAOV3M7PYHhaqpaN+WB9VQGR+1EoeNAx1Xh8K0VNw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aZ+91S3W0qPD/M9RAXfJjS/lkIbOgQ2Lfn0krIF17na0G6Umx4q6oRHDNQi4UGCYVkX24SvEomrDKa+AP04yV/0GFjMZqPqb8Vra5N6pFAJrqNzKlvfKhxF9akj56T9vaRgOkVaDNlaXcFz2G6JatAwE5iJZhtAA6Is8oOPrtW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TY5/DVqE; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-6bce380ebc2so1751149a12.0
        for <linux-gpio@vger.kernel.org>; Fri, 31 May 2024 06:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717163165; x=1717767965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iUsW6gce8JKpIVixxeRmB2OvvfmVKzURUafhLHRlJp4=;
        b=TY5/DVqEr50xyD4sRm35lC8gOsr9IuBI/BQTZKRi91No10JSPipvQRErBQoU2/V09q
         mWlbghDzOLzxZ28inCQMtLhKBxO5YY2Q4fNBhRmDS8D7Sl8jZs/UVoqXwzmL6xaVR8JI
         tE/veXoWkyGO9OUGid7lTwY+uy5rQKeHEJ3y99ibGwXsl6+WHCy/rh6pnmCfkxttzjK8
         4v0JqnsW0JIgywv8UUSmchGAmgYf1K2B5mMkc+FIQa/aL7RiEitw1H+nC4gqZx87yu7s
         R5/aj3FHCHDxPNN6lVV5ryfgGkBErAFuwPwrpqG13WYO9jrtXTKeTrBqTy96YOVr906j
         4VLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717163165; x=1717767965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iUsW6gce8JKpIVixxeRmB2OvvfmVKzURUafhLHRlJp4=;
        b=h6HuhTs7OHuvcFNif5a7CVPBDQ9RCE1ZDFoOru+XZ9R9hun/oOlp7cQGz59CuwPJRM
         wS3GFJDqmYlddpBjG820VUscHt3DqCYW7dQMkCkaQiyy9gqJVajTGVgCkD5+JsOIWrih
         u3V4MO74+dVRTNTfjSc8RVUZ97KK2BBZGayEKqemcxOP7NboZovooBDtWHaDXEBMM8xB
         d4Yeb1IKeNXMybma2KZUfTNa8fD2ABFLjO5UehHZBgix7vQDFAH9N5bn46ekjlyv6lXr
         mvRhQop5GdIdWddG5tGj9ZYIxtRnwXtvZWfFK5wz9WfV90MU8/vZZ9eRe/51WRLGF1Yo
         w2Cg==
X-Gm-Message-State: AOJu0YynBX9hU+sGSvhmnDBJdp4xQu9X3ViuWwNNJvWKZ4RZr1SCN0ca
	RsmafQjJq6iH+x9MyhvyUKjiJL9FygdbmkWU6CwSljEWlwGgSVSUj2z3+w==
X-Google-Smtp-Source: AGHT+IG+Q6TfLaXUbL6AtHEwIndzTbEErJqs7aWjoeRBoVpe76jyp8vbK+b1zSEUbQsMFBNyRGvnAA==
X-Received: by 2002:a05:6a21:6da1:b0:1af:d0bc:d149 with SMTP id adf61e73a8af0-1b26f0e60d1mr2578018637.6.1717163165109;
        Fri, 31 May 2024 06:46:05 -0700 (PDT)
Received: from rigel.home.arpa (110-175-132-92.tpgi.com.au. [110.175.132.92])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-702423c7bf0sm1389825b3a.42.2024.05.31.06.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 06:46:04 -0700 (PDT)
From: Kent Gibson <warthog618@gmail.com>
To: linux-gpio@vger.kernel.org,
	brgl@bgdev.pl
Cc: Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH 3/8] tools: tests: fix unused variables
Date: Fri, 31 May 2024 21:45:07 +0800
Message-Id: <20240531134512.443850-4-warthog618@gmail.com>
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

Fix shellckeck SC2034[1] - foo appears unused.

Prefix intentionally unused variables with "_" and remove variables
not actually used.

Signed-off-by: Kent Gibson <warthog618@gmail.com>

[1] https://www.shellcheck.net/wiki/SC2034
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


