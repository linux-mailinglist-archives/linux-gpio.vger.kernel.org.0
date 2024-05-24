Return-Path: <linux-gpio+bounces-6610-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8DD8CE957
	for <lists+linux-gpio@lfdr.de>; Fri, 24 May 2024 20:04:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 82770B216EA
	for <lists+linux-gpio@lfdr.de>; Fri, 24 May 2024 18:04:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1CF03BB27;
	Fri, 24 May 2024 18:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="1cndh7S6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE62E3B1AC
	for <linux-gpio@vger.kernel.org>; Fri, 24 May 2024 18:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716573849; cv=none; b=hgSn97iuE/Y+xYxbvTQTJrfd8uK4TfZ0pvR3VRp3frppO4LwWtWdBd0OsfNUsTIYhk46ucrkw9M1X/CIn5s1hxJmDmIeE0clOwdN0x9fFNTGxRbWOzHY3ScotE4EtW8xABNRohvPaSZEx3IO3AXWi1tYpdL0+xM+Jv9O6kVetx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716573849; c=relaxed/simple;
	bh=Qbl0wFycEDzMrTT5CU1N0Ueak8FzUvxplFalMn8aNhc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nYk0EEB/4u2Cxj0vgMVNQcl4/YRHbMQ+WYNla9EMRu1Nk6461hlnqphpLaGNm7aciLzMk8ZD27F7NEti38mZmqYH5MPV7UOf+Cpce9gRhA4Fvt2pNYhX8Op/pOdI5+Q/3ClWO5f/MKzxKhV9Esp5fyQZ1D0qBzU5Nh0Oe8dwV4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=1cndh7S6; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4202c1d19d5so64373455e9.2
        for <linux-gpio@vger.kernel.org>; Fri, 24 May 2024 11:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716573846; x=1717178646; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UBofyP0L45wNyQmF4Cl/rFhlc2AXCK++twiohfFn4ok=;
        b=1cndh7S6r94baxI+PQcFy3G4X8bgsD51xR9zErdeVqBpWPhnK8UCMlmuSI024QTjKZ
         NdIAtEuV/xrRGNGodr7V/emFcuY/y5HBDiN7ki8b/kty3QwBiUj/R8p1BtOQFUxz9biq
         +YTwZjM2ied/YBou9R6eNPnUCUIOeU7IgRzFf+T/OGtLuF3RcO0esJiekiwXVX5F5D4C
         dhuj7IMgkSs9KQ0rXfGx7LyyA4CPVn6cuz3izWqQ845puNkaXWH2MukFVrAZ/IrRDPLj
         XPKGPXJbD89p3/HVt99/oHjpRPTZQzJCNtlzvZ97Q8XOqdlbYxJd0UWSPNz5X4k06MZc
         muIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716573846; x=1717178646;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UBofyP0L45wNyQmF4Cl/rFhlc2AXCK++twiohfFn4ok=;
        b=jGhyUWibOpjSKe2ODSHO5mxDtKX83WR0pVDzDPJBxJFnloV8RXuThNTFE0nivo06PA
         eai8n1R5GylXqmaNqq2V2ZAHk7zuSVMd+Ft2MnS/1aP99Mux69GlnRwLoL43ynjDyV/O
         GHjcuoKuNHq7BZrEiRYVJlDjo86qAvmkTcpX1KXZ236UpZvFA07Luwk+0gRKumzRik+V
         a8mTVBhl+9MzbRjOfXW8Ns5vpdE8DJCMcVTCzz1Q+xuPPlkwlDUp81CJgUIlSuiubvHt
         4TPTs+G76hZsV4e3nykTmHsFJ/zb43VufWEslHcVpbjrbxAmJwuZvdMSi0l9FMVFjz1L
         YGtg==
X-Forwarded-Encrypted: i=1; AJvYcCWljibpFCVWANncF1ReD6Rc61LDo8FB+CLwIkDaxSYuLzhZhc8lzPIMdY9wM+Q35/m3qkEA88IXKCdrqcX+Oqccc4Anvlb+ALY3cg==
X-Gm-Message-State: AOJu0YxUP88OZm0BmzZkI+PiTzpYRmu2xzm5v9PieYWLcJ+m8chfJcEU
	5yF3JpW8i1Afe14uxS99uIvoB5lZysHXdpr0ASz4WDB1GAE7d9GuhtCiyADo5kUN30zHn41Y61V
	0
X-Google-Smtp-Source: AGHT+IFTLfGe41ciSPMo1/bDWDEEVLFstoTAdtO6itfbP24VgzWOsZrQAZIF83/03W0wppJGmWulwg==
X-Received: by 2002:a05:600c:21d1:b0:418:b9fa:43e9 with SMTP id 5b1f17b1804b1-421089f316emr25318215e9.29.1716573846041;
        Fri, 24 May 2024 11:04:06 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:75a:e000:986a:afa7:d450:11a9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-420fc82cc41sm58338675e9.0.2024.05.24.11.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 11:04:05 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 24 May 2024 20:03:28 +0200
Subject: [PATCH libgpiod 2/4] tools: tests: use $@ instead of $*
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240524-fix-bash-tests-v1-2-1397c73073a6@linaro.org>
References: <20240524-fix-bash-tests-v1-0-1397c73073a6@linaro.org>
In-Reply-To: <20240524-fix-bash-tests-v1-0-1397c73073a6@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1516;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=9WdA7ekccTVMGnQL93blEJQyMBbkAK5+koJN9uuCxLY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmUNaTOmb8vEsRDPVwVkTS93xP+zQTs7tGDkwfG
 HwMTHSMFUaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZlDWkwAKCRARpy6gFHHX
 crMwEACGxSJdtIg9B02kd506pZcR2XyJalRCDOTiHBOzySGh5Qo8pHMq68flai8wDCMb2TENY6I
 YKK2Tig81Q0/+KBwTITuVN4V3Y23r91qXL5xVxURA57F7YcRoh6cgt5OslUlZORm7dzO1AipiaJ
 7KCSmXqrJTMqMlU4ZfKlNsjsINiGc7MxbTxxj+x+mBMwIbNv6kvIBs3xEe6ar66+XHJBqZtl6D3
 0mPSgdvmpWrjvP8OynV7h/CZGw3o7ymMWqr38wGT6KHODXhkPhvlf6RA4K8ZrSuDgKsmUn11PO+
 hNkYkb/j4kk9MX/B8ef/B9nHXth+G6ZcLiXt7CtKOs0KTLXdUraIyIK9ZkRIoO2UAGkBBUaOP/b
 LxP1HanpwuTADVYyRmHnEC17pbQSsKFhi3ZH4qlX24n4s1ynkLjxH5XIUiyxahNyAwaLNjJBYMI
 71QweIxT4cLAn5Dp/itOcp3RGFTXWaa/pYRoG2UKD73Ak7W9uZZMH9FyxNrmQ1KT7piZ6NcTL0X
 pbJVPhhpv63ALpdhpjQZSYIJD4sqRRQueclrUqh6BrIPQVHwbf7i5gGDFLGmGTtg1cnSPAenPuj
 pWrPrju/4RmaH0HZhzKEBSHW+NeGFJHteL5eJ2yXEPyws+w27jUO6HluJi0D2LqwiriArADsnaI
 Zv6W5N4i9HqRh0A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

$@ does not break up quoted arguments which is what we want in all cases
in the bash test-suite. Use it instead of $*.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 tools/gpio-tools-test.bash | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/gpio-tools-test.bash b/tools/gpio-tools-test.bash
index abb2f5d..8b4f054 100755
--- a/tools/gpio-tools-test.bash
+++ b/tools/gpio-tools-test.bash
@@ -27,10 +27,10 @@ GPIOSIM_APP_NAME="gpio-tools-test"
 MIN_KERNEL_VERSION="5.17.4"
 MIN_SHUNIT_VERSION="2.1.8"
 
-# Run the command in $* and fail the test if the command succeeds.
+# Run the command in $@ and fail the test if the command succeeds.
 assert_fail() {
-	$* || return 0
-	fail " '$*': command did not fail as expected"
+	$@ || return 0
+	fail " '$@': command did not fail as expected"
 }
 
 # Check if the string in $2 matches against the pattern in $1.
@@ -71,7 +71,7 @@ gpiosim_chip() {
 
 	mkdir -p $BANKPATH
 
-	for ARG in $*
+	for ARG in $@
 	do
 		local KEY=$(echo $ARG | cut -d"=" -f1)
 		local VAL=$(echo $ARG | cut -d"=" -f2)
@@ -253,7 +253,7 @@ dut_regex_match() {
 }
 
 dut_write() {
-	echo $* >&${COPROC[1]}
+	echo $@ >&${COPROC[1]}
 }
 
 dut_kill() {
@@ -283,7 +283,7 @@ tearDown() {
 }
 
 request_release_line() {
-	$SOURCE_DIR/gpioget -c $* >/dev/null
+	$SOURCE_DIR/gpioget -c $@ >/dev/null
 }
 
 #

-- 
2.43.0


