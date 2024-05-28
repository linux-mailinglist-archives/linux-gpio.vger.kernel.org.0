Return-Path: <linux-gpio+bounces-6714-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDD98D1630
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 10:26:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C284F1C227E1
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 08:26:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 500F613C3D7;
	Tue, 28 May 2024 08:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="25ZyqnVo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8958F13B5B9
	for <linux-gpio@vger.kernel.org>; Tue, 28 May 2024 08:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716884763; cv=none; b=dHlsP82XIvtXfbBBDHlLphLm03XysRFoJ4xo/eG6n3xivynY6G8gf+laSKUSdFQpaVM/nIMif/VRIW/KwY3uyd91q8aevauJHCOR9oZpTBpVIPWDeRezjmLGrizBE28LBWmqu+E0E56FQ0+cjynFEhLHO2xCKIjUTlyxGLaycnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716884763; c=relaxed/simple;
	bh=klHfus8SVMvCGgrlbX/CZqqjTV5MdkCxknBc/bECvKM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z6sFbzorZ1znb4Kxl2LvrfUOZmF9yg58mtwTNma/1lMli8PRii7qPozB/Hai3v05MEy1BO/Ta7w6NR7uih2r0BnboLR1JUh7wymSi/rAGrZ2UMCQ6iXYL0rOvHbBjfnMxAeV8bSYMOCcLtb4+3wbMk4XUMDHK8tRISyFlscLxis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=25ZyqnVo; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4211b3c21d6so4164105e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 28 May 2024 01:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716884760; x=1717489560; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o3YHRV+Kq7u1W68iAfPZ68X/iHDeFHYB7fdytNZ0EHA=;
        b=25ZyqnVoGkXuDs3Wm0tfMVU44HeGyymesOhBIypEUZwkQaPBa7zkzAOXH9+Nm9hpV0
         D2o/44PydS7F/mqWs4mK8u//ucwHsfSONg3Tp3oldg9qkwahZ0WcXShDHXvWy6jUdVsJ
         jYzR7aXhEEVijQ5KpdwhFhJ/Rd1w5C59dAOyMPy/IWVdKMxNiqqlL21e4TfsT9JHVPl6
         t2dGsXaN6hU0o1iq4zu8tDjWMyEt1uv0mNtK4WgcRTQ9ydyl5TIpsTqb4YiIrsJys/xo
         cqFKDE7qRg1QyY8uN6LRvFLD5D+tWCPgHrvNb725CRGwuox/0Ae13owWZ3UjNEnsab/O
         rFgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716884760; x=1717489560;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o3YHRV+Kq7u1W68iAfPZ68X/iHDeFHYB7fdytNZ0EHA=;
        b=CcJeft4sUZNlg7qqInkfcbtF6u9alIwe441GrStufT5OnNGHkye2Hm3hoLV+QYJqsb
         VuG/e+fxbSIaW88lZaYLWVgXjF5IGWLf41Pzoh4dfiREMfZp9tjmmqCYDgFg/SiEqfu+
         suBjzRwwSZyjWAhKEcvLBI5sAofD1DJv9DZGn0W9K79h37o+AN08BVgvxCaaMGYv94f/
         iYiiREEuhftpb6MQNQ9GocskRMYWGDOXUZqLxIEn9p20fIBv+ot1ORGM/GD17rJ76Ej7
         ZpukCePCOlQFgEi4HDNlPlR556CMX+c7EjLEcLL8AI6Feu+Y5EOpB+uw9eK05vxqFyWs
         1MMw==
X-Forwarded-Encrypted: i=1; AJvYcCVT9cPxfa5012+HrEDA2pwez061TZIO34Covse9HFotuKMzdKVeYmwAoA9dPdg5DSlUWErrg0V8MvwT46YcFd0dCqO/wfqUKY1MRA==
X-Gm-Message-State: AOJu0YxnQMoGLpZhV3D75lg1DW5bXV5rwO5DT4rwqQLW4Aq7a42JiIbx
	/uKRKUbMpmP3WFUmiK9cqlYzulJcDuDfDG7oNSbFmStQoGFUKmOEXnysOZBAm+w=
X-Google-Smtp-Source: AGHT+IGZF9WGcZNvR2mZSyngYiTphUxcxAzZrUGnBPA2rVuErU1V68h/eGLm/1eKryX22fVvCqIIIQ==
X-Received: by 2002:a05:600c:1c04:b0:41c:2313:da92 with SMTP id 5b1f17b1804b1-421089ebd32mr84498055e9.4.1716884759990;
        Tue, 28 May 2024 01:25:59 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:75a:e000:93eb:927a:e851:8a2f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-420fd37d5c0sm96207545e9.1.2024.05.28.01.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 01:25:59 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 28 May 2024 10:25:49 +0200
Subject: [PATCH libgpiod v3 2/4] tools: tests: use "$@" instead of $*
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240528-fix-bash-tests-v3-2-e9b5be2ba8bf@linaro.org>
References: <20240528-fix-bash-tests-v3-0-e9b5be2ba8bf@linaro.org>
In-Reply-To: <20240528-fix-bash-tests-v3-0-e9b5be2ba8bf@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1485;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=whhnBTsGyl3h/1vkxXUTFzm/k6+sEscjnXCBeRQUyw8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmVZUVeOE2ub6KQKh9dKTXGKIs8lAxdzD8zR1xF
 EF3EcbGQj+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZlWVFQAKCRARpy6gFHHX
 cqFuD/4gM1HsY8MOog4/CJbSzuHb9Es92pfJPgDPFxDOKdjmFSB+APO393uRNMJi0EmvWZCE7CB
 8KKcT8EM5kuyuPFz/Sa7jYleTJIrxXZhRDEpMV5knXcNFHYz7RtMyaxEmGgmSqenlP77AjtBUcY
 PlTIhg05SClvvsehdECK/nVVbX9Ts2JxR/t0vJvb4usE9ntcQE+sdITAJeKku1jyfKRiljc8D6X
 nRMUkOMPGPnBIR5+ndJedzjbiYM9aWTICYyeJ6XaVCHCZsSG3t/RABnO647NR/79hPv8KCOmmqg
 eeMRqksU/IZvVA0AKRHcXCthFaizNJI+uRA57y8SPeCoQJL4vqm+x02pSb3B+Etr2Kq34RX2wRs
 oQbB6cHudt9ydfzXIuBqBoMSh4oDsZmz03xsd+5QY7k4CIjRp8RJ3eraASBdcTpV47IlNfXBWkb
 OEnB7g5Qg02O37/tvp2NXyDvkLYL74/DGCidbgMA7eVknfx/+pHkRc+ARy11JhpXHfxh5wLPC7p
 J1TE95s0poh1xBh5/ZoTrNdv/+36eDCou3151rLbF9BDbfb71U8goyoNWZKt6sRHYPa8Cgd/3nn
 N/ZiyS2T5KA9zu2HiF5UQZo4GcCQNbBodJC6bA0QqxRu9FfOH8idZtABVMcdHccdR0cSSVev/0h
 e14+bSNqPBTznhA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

$@ does not break up quoted arguments which is what we want in all cases
in the bash test-suite. Use it instead of $*. While at it: prevent
globbing with double quotes but allow variable expansion.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 tools/gpio-tools-test.bash | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/gpio-tools-test.bash b/tools/gpio-tools-test.bash
index abb2f5d..1bd7d89 100755
--- a/tools/gpio-tools-test.bash
+++ b/tools/gpio-tools-test.bash
@@ -27,9 +27,9 @@ GPIOSIM_APP_NAME="gpio-tools-test"
 MIN_KERNEL_VERSION="5.17.4"
 MIN_SHUNIT_VERSION="2.1.8"
 
-# Run the command in $* and fail the test if the command succeeds.
+# Run the command in $@ and fail the test if the command succeeds.
 assert_fail() {
-	$* || return 0
+	"$@" || return 0
 	fail " '$*': command did not fail as expected"
 }
 
@@ -71,7 +71,7 @@ gpiosim_chip() {
 
 	mkdir -p $BANKPATH
 
-	for ARG in $*
+	for ARG in "$@"
 	do
 		local KEY=$(echo $ARG | cut -d"=" -f1)
 		local VAL=$(echo $ARG | cut -d"=" -f2)
@@ -253,7 +253,7 @@ dut_regex_match() {
 }
 
 dut_write() {
-	echo $* >&${COPROC[1]}
+	echo "$@" >&${COPROC[1]}
 }
 
 dut_kill() {
@@ -283,7 +283,7 @@ tearDown() {
 }
 
 request_release_line() {
-	$SOURCE_DIR/gpioget -c $* >/dev/null
+	$SOURCE_DIR/gpioget -c "$@" >/dev/null
 }
 
 #

-- 
2.43.0


