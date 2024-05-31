Return-Path: <linux-gpio+bounces-7009-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 159438D635E
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2024 15:46:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8C4FBB254DE
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2024 13:46:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21E5B16936E;
	Fri, 31 May 2024 13:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WHuh8QA9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D0615B574
	for <linux-gpio@vger.kernel.org>; Fri, 31 May 2024 13:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717163176; cv=none; b=FHbP7X38GqPHtMqMxcJJOxDYXik3ywDT03l/CC5TGKK6bypjNVCTIfG6+LFeTTj9fMboy0HE2D1Y7elh8JFJyg/suHaH29CjC+R2Y/qMn4dI6q/8iKt8jgFVW+/H/3HedSR2vO+YyPz0LuYdbZYcR2K3Ay5QQmpV7bfScGck7Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717163176; c=relaxed/simple;
	bh=/+VKyMqIOrhJnMcMdOELthAXPJAImQVP4GZzuywDFXQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j/wCeTr8VTRxtQgsKpYWuttY9RLfhANdXfmon2H77rSi9hFIYo9J/PNfg1lIPXk1Ko4FkbrMPfdBnIFiXL/k2XjGDS2bK9o4Ex28ik+Q6BZJmkaNmk4ZkwScsKGU9jq7rtLlBvf5fm5Jjniv4+GuQ92EfzDmtiENR6sIXZW4um0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WHuh8QA9; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7024e7e55f7so333478b3a.2
        for <linux-gpio@vger.kernel.org>; Fri, 31 May 2024 06:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717163175; x=1717767975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5cDT+9KL6OTD9Q+Muf87UzyaX3xPLn/xrLDM03cnzMs=;
        b=WHuh8QA9rYOM/bkaXETQRrj1kHPnlPTxxQWzEQqxrH6NGn3DUhv+AQ7Gu+iOaIKSxX
         /7cb9blkrUwdEpoVBn0MjxmafInq4IxBiyI6lAmLRjQPuktCd+7YLY+JZzefow4tAmjo
         +R0TmrePbcYQMegzv+jP/oTmK/hYoUQ+fdtH0p6P/5URfibEz1o5+XUhXaATI3vpG3Wc
         RjKq+BQN/vV5jwYwQukc4TQcy5xfQAwcyBdXdRjV6JISj27vGetLwvIUCXNKv6kJkeMI
         hn7y83KNIllg7lVW3OPDDAmfguKv7AuNfkObqbgEX0BXPPpJS3Pc1WZgW6cb3BCndPnX
         tyCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717163175; x=1717767975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5cDT+9KL6OTD9Q+Muf87UzyaX3xPLn/xrLDM03cnzMs=;
        b=b39ZgDDb3PLXQjSdIi+hIHnAUIF9z316MTp6G6Ri7s9vgP7J2v9uIR1oaZj68eDZj4
         UquqbgiTkbToGJWWyNx05AOL24UosaC0GTTf4k4DTSfo8VH+CA8QJULPxrsrnD1PLhXy
         Ny/QxWe2Z2FtjxW1lD0UJQnuS4cjlgTh62iCON8urB65b5aNAtWlApZMgDLy4U6c/QsF
         5dJcJrSU4lcLVklWKjBtnKxAdei0n5Zfvg4di/FCoqk9MnO4za/uAEKw9sVxzRqvLwX6
         57ZidRGxudnQk0HwjfhMojgIC3WKZ11c6GYJQPOuvlkT1+hnJ/ZWnYClpthw8nnK+oEZ
         AljA==
X-Gm-Message-State: AOJu0Yz3QYaampa9/WVHvDqm3quWuur6kXiLqWLxxrWE+ka9g5oIe+/+
	4U/tKRBxLCRa0uSS0CtIxntZQOZotFUp/EkVDSZYzov9kZiAzOJqgXCmpA==
X-Google-Smtp-Source: AGHT+IEWCGWzMDXa0eTH6ZsfdKk6kPa4jHoowLc8365GGUe2hGgvkYQAOBfUB6L0ahUOnU/d+jJWyQ==
X-Received: by 2002:a05:6a20:d42f:b0:1af:adbf:2a16 with SMTP id adf61e73a8af0-1b26f2cc972mr1634801637.43.1717163174717;
        Fri, 31 May 2024 06:46:14 -0700 (PDT)
Received: from rigel.home.arpa (110-175-132-92.tpgi.com.au. [110.175.132.92])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-702423c7bf0sm1389825b3a.42.2024.05.31.06.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 06:46:14 -0700 (PDT)
From: Kent Gibson <warthog618@gmail.com>
To: linux-gpio@vger.kernel.org,
	brgl@bgdev.pl
Cc: Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH 4/8] tools: tests: use read -r to avoid mangling backslashes
Date: Fri, 31 May 2024 21:45:08 +0800
Message-Id: <20240531134512.443850-5-warthog618@gmail.com>
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

Fix shellcheck SC2162[1] - read without -r will mangle backslashes.

Signed-off-by: Kent Gibson <warthog618@gmail.com>

[1] https://www.shellcheck.net/wiki/SC2162
---
 tools/gpio-tools-test.bash | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/gpio-tools-test.bash b/tools/gpio-tools-test.bash
index b065296..efe558b 100755
--- a/tools/gpio-tools-test.bash
+++ b/tools/gpio-tools-test.bash
@@ -188,7 +188,7 @@ dut_run() {
 	shift
 	coproc timeout 10s "$SOURCE_DIR/$cmd" "$@" 2>&1
 	DUT_PID=$COPROC_PID
-	read -t1 -n1 -u ${COPROC[0]} DUT_FIRST_CHAR
+	read -r -t1 -n1 -u "${COPROC[0]}" DUT_FIRST_CHAR
 }
 
 dut_run_redirect() {
@@ -211,7 +211,7 @@ dut_read_redirect() {
 dut_read() {
 	local LINE
 	lines=()
-	while read -t 0.2 -u ${COPROC[0]} LINE
+	while read -r -t 0.2 -u "${COPROC[0]}" LINE
 	do
 		if [ -n "$DUT_FIRST_CHAR" ]
 		then
@@ -234,7 +234,7 @@ dut_flush() {
 	unset DUT_FIRST_CHAR
 	while read -t 0 -u "${COPROC[0]}" _JUNK
 	do
-		read -t 0.1 -u "${COPROC[0]}" _JUNK || true
+		read -r -t 0.1 -u "${COPROC[0]}" _JUNK || true
 	done
 }
 
@@ -242,7 +242,7 @@ dut_flush() {
 dut_regex_match() {
 	PATTERN=$1
 
-	read -t 0.2 -u ${COPROC[0]} LINE || (echo Timeout && false)
+	read -r -t 0.2 -u "${COPROC[0]}" LINE || (echo Timeout && false)
 	if [ -n "$DUT_FIRST_CHAR" ]
 	then
 		LINE=${DUT_FIRST_CHAR}${LINE}
-- 
2.39.2


