Return-Path: <linux-gpio+bounces-6609-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B791C8CE954
	for <lists+linux-gpio@lfdr.de>; Fri, 24 May 2024 20:04:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D487D1C20C27
	for <lists+linux-gpio@lfdr.de>; Fri, 24 May 2024 18:04:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 069DA3B2A2;
	Fri, 24 May 2024 18:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="vQ6LwtAy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF243B1A3
	for <linux-gpio@vger.kernel.org>; Fri, 24 May 2024 18:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716573848; cv=none; b=UGtyO2qMs8mqrPmVkpyuV6cXdWkFjk4Z8q248ZUPc5y7zUVbhI1IkVY8lfC8bfHyqBKRJrZSJS4NgOATk7ePHm8FBcE9uPDEGFSva/47WlGA3malW38rWZCaZt2DYs0EQTnaCr6U4FH1cjVpbgK/0wBoRTYKIB3fMjguLs1Sb3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716573848; c=relaxed/simple;
	bh=1GyvaNvfpUaEvNsFHnNWVs/AwwJFUlI35Md9Z/n30BQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TyDXzzZtMMUwgRUcZcFF/HmkiQFNFQxf9Lo0fbEDHYfaLh3xC24YxJim8BRA9uGAddrKzw5TpObcyi22YAtcaHfktPMrETZvc/5Fw68lkEo/6tfwzIYT4HhnNRtou6ZtXR7q92tMPjkZDVx7Uv1jh7Y2YL9yulfILzDBs4Z8pdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=vQ6LwtAy; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42108856c33so6088315e9.1
        for <linux-gpio@vger.kernel.org>; Fri, 24 May 2024 11:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716573845; x=1717178645; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uKl7FLzd4c1z0RWK+9MURhj1M0dXFZqZSbP25u6zhN0=;
        b=vQ6LwtAyC2i0MufBuFEBsggoacoGht1TvRBzgSsknIkLXfHXJsCWBtx0hM7c9MLVKW
         /q5ImPfRRJdu/B89txRpJIKVQ2JGyPB1XbWsCKaZPf6x1FDtIy7mPLC0Hm2l0UW+xdcp
         yIviVVvfO0q/+ZySTpIlnTWZBRHItNx/BPRtVQZ2IjpySOkoe05LDUVthUP/PpN4FkVY
         JmbD50HziG8AA7KV7+VqJqXCwP5+4BQU23jHCV2mogD83MhLy572yJPy0gDOzKjqTj6l
         yKJqcLwrE2CC4BIUEVM0pxSrH2LWWyIkU1KSIWlx+86Aklhs5hQok+lNTn0hrGF/68xa
         E8Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716573845; x=1717178645;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uKl7FLzd4c1z0RWK+9MURhj1M0dXFZqZSbP25u6zhN0=;
        b=S09w1xC2z7NU1h4lFp6SUo/oMFDKMJ6xBJnRAtnKIUUGSwmW+6kp2V9FIluXxIj2lz
         6IfYouVzLPwU0n1/4Zfj/SL0oqLxrMDr52A42YS9Dhr9Fmo7V3NQ47q8F7Ac+ET2fO8/
         KdTDflozq4OfVXvU231LviWpJ3wqEEKlOXmaH1P+2u2qKgBGd+Mx7hWzSqkb1iNQG40m
         4uFWKW8ednstmC4twYx1+z9d6Ftik4Ek1JHwQ5GSBNi3Kds96e0vvTQxXxgS8uBKQdYC
         yhOmOWxDjeFkHE40rsO0PsOdpu2W5sM1eGa7kMECw0G6jOmKLnEdOM4EkZ99FtC7Jjxu
         1+vA==
X-Forwarded-Encrypted: i=1; AJvYcCVxWi5G99spo2VpDFv4Hfs526ubQTiM1xpxICLRxb+pUQ/USuo/d4I2IVE38UXXW5rCtXov/nyZZtFOE14gLfaJ6RBRh9QL2TFkyw==
X-Gm-Message-State: AOJu0YxdopbJQXG7fHxlzNqccwvy3qF0XUycNf7iZJjMNvrb6ZsnuaI0
	a1PLwlqX94tt3h/WFQEG2f90LVJhEsAKQrBXyjOZbfvXTCKCtj2ersh/knrbi1dAb7l17R0OGgH
	j
X-Google-Smtp-Source: AGHT+IHgoysIdSN82jvr5jwCUN7LuOwHFR0YGsldPiOBI1nqdujdDDuvlzNF2Uud2vAk8QaIqvuxWQ==
X-Received: by 2002:a5d:69c2:0:b0:354:d382:dcb9 with SMTP id ffacd0b85a97d-354f7521700mr5919593f8f.15.1716573845094;
        Fri, 24 May 2024 11:04:05 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:75a:e000:986a:afa7:d450:11a9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-420fc82cc41sm58338675e9.0.2024.05.24.11.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 11:04:04 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 24 May 2024 20:03:27 +0200
Subject: [PATCH libgpiod 1/4] tools: tests: use tabs for indentation
 consistently
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240524-fix-bash-tests-v1-1-1397c73073a6@linaro.org>
References: <20240524-fix-bash-tests-v1-0-1397c73073a6@linaro.org>
In-Reply-To: <20240524-fix-bash-tests-v1-0-1397c73073a6@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1105;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=PHUzz9u14ti8fJ8sk3Q5oiYwXdrwukZ94ljgxiqUlwk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmUNaTNuHCsojnVAhkV6McFRulp4Vi5Nj8ksALi
 masWnsLrgOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZlDWkwAKCRARpy6gFHHX
 coKHD/0e/65597zh0LdTVYSGyxtDEMvddYwIBQvIYMpzxOio90iuF9B1ZPne/nnuExmf4Uyf9xU
 Du8Bn0cP00JgX3QkomjzqTbpFm3Pg/dPmwdxSaEh/kPNwTz53xynkZIIclOcjEsCB7MAf/CzPUO
 qfKS18mTGs40watHYC+GDWlfA0V6buJp1vjjGo1KMv/UNjje2n4TXuf0Yr9AOsspZh+JG16tel3
 msN+XbvDDQA/GzUcLyHqEqgbBGztdyd+DVXCYEKzb5/oWD7pnMbroLjTxvEsVwjajcGogrb2LdS
 EpGIzU5mj/VTbHbN2slYkAaVsg19wZmVdU2cnWbioZJzPZd/S2NXNLFmGpGGDxfEa8ob6w8NWLi
 XHAEMm1Rw5ShJT9mgV7ijaQof8HdVEcKW7YQjndx7IrjAufo++QXCAAJgJfe/yOFGVU+VfUvLKA
 7DXeq6za5eSNdMX9kFSgWTmGW/J6vohf1LlW3ZHEAqIULt+9rGYdu59Rx29xiC/E7nZtrimxp6A
 DF4SBT+fgKpSmlfBdntr3Iemh/QaPB71aATfe19bs88fw++lr3Ud35PaDofZXzTs1Jy8FcwHTEC
 1z+8LrUyxfpFjxuO27X54vO0gUaxvfSj0brD30CHMFxbXQ+3st2rXxQ+PJ5n/H8i6haApdh60ej
 Vlqzzeom54O7LJg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Replace all spaces used for indentation with tabs.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 tools/gpio-tools-test.bash | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tools/gpio-tools-test.bash b/tools/gpio-tools-test.bash
index b55c5eb..abb2f5d 100755
--- a/tools/gpio-tools-test.bash
+++ b/tools/gpio-tools-test.bash
@@ -203,9 +203,9 @@ dut_run_redirect() {
 
 dut_read_redirect() {
 	output=$(<$SHUNIT_TMPDIR/$DUT_OUTPUT)
-        local ORIG_IFS="$IFS"
-        IFS=$'\n' lines=($output)
-        IFS="$ORIG_IFS"
+	local ORIG_IFS="$IFS"
+	IFS=$'\n' lines=($output)
+	IFS="$ORIG_IFS"
 }
 
 dut_read() {
@@ -269,12 +269,12 @@ dut_wait() {
 }
 
 dut_cleanup() {
-        if [ -n "$DUT_PID" ]
-        then
+	if [ -n "$DUT_PID" ]
+	then
 		kill -SIGTERM $DUT_PID 2> /dev/null
 		wait $DUT_PID || false
-        fi
-        rm -f $SHUNIT_TMPDIR/$DUT_OUTPUT
+	fi
+	rm -f $SHUNIT_TMPDIR/$DUT_OUTPUT
 }
 
 tearDown() {

-- 
2.43.0


