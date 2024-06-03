Return-Path: <linux-gpio+bounces-7066-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 092DA8D81BB
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 13:57:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8CD3A1F22EBE
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 11:57:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC8A9126F0A;
	Mon,  3 Jun 2024 11:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HrWpyjgc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49BC386AE9
	for <linux-gpio@vger.kernel.org>; Mon,  3 Jun 2024 11:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717415836; cv=none; b=kiJsctXRH528KaJSbyZw/zxgiJQ/MGD3OYxOloVH8RPrxZd2KcoQH09+QvP8JDP4OE/k0tlmPPm8TBe/umvPkFENMK3xYmnfe9TnB8FoCtbue1ObT+60l8t1ncQ1l2YS4xH4fm2GG6Ovk7z+9Mf623m/cEZdb/X7Asix+EiS8JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717415836; c=relaxed/simple;
	bh=SUVqWHOJqrEuaR+z+S97Oy0lsDMtfpNrLRPwncizSfU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uDawI4rzVTma88h28lXZI117bj5Q/uVEw7Rxagk1pxcgp0m97s0eAaCMZlJfTAMGODXDk8VRQI5MjnHiWpM9MVE78XLWudxZi6wqAUiqpLZmQQG1zNmBtmeY0TtAlxB6Rt2dGxYh6Mx/4ZN4Pym2m+lfBgktVJ3NKfPWlufhRbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HrWpyjgc; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-6bce380eb9bso2638770a12.0
        for <linux-gpio@vger.kernel.org>; Mon, 03 Jun 2024 04:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717415834; x=1718020634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pTQ5/ccHx7SVwnM9aooRlNY0TuvRMcHwyDigLDl8J9M=;
        b=HrWpyjgcHYV0WL1D6PmXCggSjWJFHJI2utZ2xGyHnYM31zt1gKWfGLZCSP68FJc5YT
         HCNdz2E9vTRxci3hHCdqXTYjvsZb9xAilX0uDaqqerRQ1YuTUraORLh0CPlJgvBzJ5CH
         Chftk57SHFfRFratxvF1O/+Qe0Zk5UdNNZeOYY7mBtOPCcexleVLuooI4rucfrDBovOt
         F2N7ZzygBwaub+gdvB7unaRuYSj3fDKgHC76chMx/B+hp2y7M9JkGDNXk+ihvSPZmS9a
         eakWqH8QpGjRqwhmmUfDMf5Zou8X7pr6K8CmpMoasrmiOJS0NjxBc0ncnraPrHyYCw4u
         bZLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717415834; x=1718020634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pTQ5/ccHx7SVwnM9aooRlNY0TuvRMcHwyDigLDl8J9M=;
        b=D0ABoj9QJi8HmAVRz2/P02FcrnMzVKCC0m2vOF+Qril5gEC0XNufppsTborQglYo88
         OsoGJkvufDQtyQtGeRtn9tfOhjanhtGCE8bRoa70bpg9peD7Y4EfxVNyXahqg1PDmaQH
         s7eu4HNuh72qbaAYRlbdzURPlFPhJ148z0ZYF2DVkPXv0mZsytDUfd4xhqLy4wGz4Y1Q
         H9A6zOFy1LZk7Tx6t/DfiRoJc4+olfH7h3akL+ETCUbIJenDOjh2s57JohAfwvSJDkEz
         DaOH94VaCEm1aRVnXU9e8zfAI7pD5Wree0ukfBr9mRZZF3n1agq7PgoVErlRJqpdlc4g
         dwLg==
X-Gm-Message-State: AOJu0YzvdLVynRpGgH0ehAaY/fUs1FZz4O5Oi0Nzn+Hfct2ia49ORHIV
	CHdUASFcDzQnbNV2DSL/qZX9/eWXsF11+GFouWm9ucqLgKrSLyE73pXdwA==
X-Google-Smtp-Source: AGHT+IGo2Az4NNkqVoGWGu7aGUELY6P+cOisOBWgvfjwssbVK6OpmQVtYBMvd12CjhFw+uJ6GiMBQg==
X-Received: by 2002:a05:6a20:8401:b0:1a9:d9bb:acdc with SMTP id adf61e73a8af0-1b26f16425cmr10102598637.28.1717415834408;
        Mon, 03 Jun 2024 04:57:14 -0700 (PDT)
Received: from rigel.home.arpa (14-203-42-154.tpgi.com.au. [14.203.42.154])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-702425e1a71sm5328492b3a.88.2024.06.03.04.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 04:57:14 -0700 (PDT)
From: Kent Gibson <warthog618@gmail.com>
To: linux-gpio@vger.kernel.org,
	brgl@bgdev.pl
Cc: Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH v2 4/8] tools: tests: use read -r to avoid mangling backslashes
Date: Mon,  3 Jun 2024 19:56:24 +0800
Message-Id: <20240603115628.102616-5-warthog618@gmail.com>
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

Fix shellcheck SC2162[1] - read without -r will mangle backslashes.

[1] https://www.shellcheck.net/wiki/SC2162

Signed-off-by: Kent Gibson <warthog618@gmail.com>
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


