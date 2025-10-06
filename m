Return-Path: <linux-gpio+bounces-26815-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 749E6BBDDC9
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Oct 2025 13:28:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2CB021884AA1
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Oct 2025 11:28:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C84E826C3B0;
	Mon,  6 Oct 2025 11:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="fcuuqbOc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C289826B96A
	for <linux-gpio@vger.kernel.org>; Mon,  6 Oct 2025 11:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759750087; cv=none; b=ezuhhomZaBrJh+WdhPL7Hg+cSNQoSTwWKvG9GjUPEOPwKu7NfWwEPrDVFW3iCjkkR2wivS2l1abVPjRH7WaKa1gNHI4AGjMZwEuu+wjdGChPLUOgAG0e551BmpD8NLIbYSJEmdXx++oKfCJKq+v90JQHGsu/nYxs31FN0Tcz3ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759750087; c=relaxed/simple;
	bh=QHF2yECTx+14f0+wycw104Dat/J556ngFHy70sVevcE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gEd3ySB8FccjQFjGCnL+XKeXhTpPdUI3x4jmkdMnOvWCDBe/pBVX2Pl0EcqchwlxSDoYwdRNLn8T3A3jMtyKgR+hl3ag6ljR7MGv9iwFUNsdusO2V8H7DWJ++iLF1wHYQihNl6Iy3KVNOcH7vRkmlE3+Ob4ZVSp6AC9n/pI/2y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=fcuuqbOc; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3fc36b99e92so4083355f8f.0
        for <linux-gpio@vger.kernel.org>; Mon, 06 Oct 2025 04:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759750084; x=1760354884; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CTgA63gPXp7Uoi5c3II+BP/dXMI5ITwHGF7SBtFOZkQ=;
        b=fcuuqbOcqt7o5VFvY0EKf8igPkYYaW5H5ksox9hlyYX0ksK+uLMSvxSZGjtOc0hG+Y
         +n0mDue+44pANVeTJ7O0UyGSRGVrp7+gyef+OWAw9DOd1qi79GWJnbDfi8mCKx3cAPMu
         Sw1uQWfR5bAjAQjnQEatS01vUY6KTltOZj5+jb2L9qq46NEUMxjKSGSap1ddzSOLrPT1
         C0A2Y57J6uS5rbmvNJrTa07Lx3TA4dlwxAe6tFAd0ikrDR4Ucp+ytX1aGz5kkyJIl42U
         wg2cLLiVNQHZ/es+5d1ZUpo3OO4bbMnGNT7czKWI5X4A1kvgPWQ2IVWpqTNGTJVed6go
         Ma4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759750084; x=1760354884;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CTgA63gPXp7Uoi5c3II+BP/dXMI5ITwHGF7SBtFOZkQ=;
        b=AVKu7IknHFYFr0MULfRbeN62hrXQ/ipKNiFAI55Yrfn4N2SM4JobFOGabMAccJ5pUa
         M+0XoiQVXfHhOjW1hYZ+pjmlqfZKUSubczzquJCLZD8rOmks6cNe1LTdZm/nfoaZ17L+
         uwz7Yh56O8bMN/QaNFpT+Mjcj4Toev03BO5bhTbsg0AKXKnTBFLOCOUmBwvgaga07gRj
         lDOzYqpJ+9ZzQviw1AGHTnzCxdgOWdq0BvCYCcAdbM69Tf7lStMK03erMBF+X1fMFEoc
         1f//IFcdfM6hRPOvzhuzWStPT8Ce5dcOB3dGsQ2xFUoBerK3uMUNOunu09TeafCCqpj8
         Hz9g==
X-Gm-Message-State: AOJu0YxcxqS6kJNw0fu2CTkE2hzJQUNDZAK+5XQxS5gBXtlvjMTGP7ZX
	EBQUAWo9TPHK1tI01oSkgJyizm/A/+LOse0A2WLfmcWIyGBbU7YAKU8bOxroeTEJowc=
X-Gm-Gg: ASbGncsRW9I/auIrP9H7iPjZsgihIgQU6Pxk6Dd9u8O2WQtB8EyRluKzqwOOwLF0Sie
	RIwG8NZc/3tdvFrbp9O2nlR9R/R71nyqI1uHZImTdcNzDUx4v1dBveBb3lmKPhksWTGLgqXBdEo
	8XjBUg3coALQhzfMnnG9JIKZN9dRjQV8LCIuKphWaWexmlVouK3687Iz8XfRv3xNC6S+kohv17f
	gnc3CdQyeHMHwcX3LJJtVkJHWfq4EZNNfhten1loulHJjJVNs9YmwZ+/VwEWjGoaeAnuTvjiT1H
	CAdREGfR9jQyhGFSz93V2tZIYZV+RUnN/RVRKUqTp/xrD2Q3CpSpS4OpTrBXcllC+dn3CeODfIN
	50T9u9KK4oim9ZeFb97oc/Ys8l28p1rdUGtKWbktv1g==
X-Google-Smtp-Source: AGHT+IFEumsnrAI1gLbB55Cmfo1ewXqINPzZdyhmg0JPsPocpwombj7TKB9HBg5CNavvnhPtqNHpEA==
X-Received: by 2002:a05:6000:605:b0:3dc:1473:17fb with SMTP id ffacd0b85a97d-4255d2ca79fmr9459351f8f.20.1759750084007;
        Mon, 06 Oct 2025 04:28:04 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:ed2b:276f:1a72:aac0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8f017esm21078167f8f.47.2025.10.06.04.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 04:28:03 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 06 Oct 2025 13:27:48 +0200
Subject: [PATCH libgpiod 3/7] tests: gpiosim: selftests: shrink the
 self-test code
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251006-gpiosim-valid-lines-v1-3-b399373e90a9@linaro.org>
References: <20251006-gpiosim-valid-lines-v1-0-b399373e90a9@linaro.org>
In-Reply-To: <20251006-gpiosim-valid-lines-v1-0-b399373e90a9@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6396;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=pxNGN2JAAzSHxbecxGrkPwuuMt88Jfm9lAAXRLrzNns=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo46e+3jWkCSu4NPF+tQmA1I4tGgW9GgSKghL4O
 NifEbPWFe6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaOOnvgAKCRARpy6gFHHX
 cuFzD/90c6vhOceNn32hug2wOOwJiu4NSVeLxfJHhCts4sCqvDUct0v4tGxz1fvxsqoiuvK4ryA
 gQ5mlpXSLuRaG8nZ+WYPLYvfCUvSAMXVZ46Sah4X4hn1vXjmq8mG7+dqz+oFf7wuSUS4uJzTRAn
 y6Fugo4qoG7QQ7X+mirdghbClMx1OAeUKLGjWHJ0NTmR/HnUQtgVBhS/Sys6K+xnJu/G9OhDCa1
 CDofYedjh8aw3PqD4D97EctkZJKBz6QzxnBjo13lIjwX75BIW3RJKBj1O9SdFms2dW+5WA6OomN
 8alyp9l3eiZL23v4hCvwEpQssaotEfJ9Ba0MG1riccZw941Y/zoFGU9rz+iufNZRIW0OQ85UGu9
 BqHl0/Kzr2y0ZfXiesXSpzZs6grWUCpXWY4AdGUSjqcRkpTQr3rYLnJQDMR+mLJ+PM5bAd3Jc7t
 DElVfRWaujt8VAOU9FvgRC3Qm9RymAbGVGhFISmfS832qhFwxoLPXvH9d80GIEOsKcVbDIPfQR7
 qac/uNyxEJ0b1AvFT1dwuhkOx17cJAOqmIV2ydIVH1MJgSmU20FATeTzyqSYwXGEX6a3T74P6GX
 CHqbO428+5hcEkEoLf7z/VWYEiBF5AhfKyXD5JwB/J0MIONipX4EOynMCL36hNG3znSRgr3Evaj
 gI8dRG8yD5a5vmw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Most tests failures end with a perror() print and an exit(1) so wrap it
in a helper function and a macro and shrink the code.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 tests/gpiosim/gpiosim-selftest.c | 112 ++++++++++++++-------------------------
 1 file changed, 39 insertions(+), 73 deletions(-)

diff --git a/tests/gpiosim/gpiosim-selftest.c b/tests/gpiosim/gpiosim-selftest.c
index a8c460dd6abdd98e7558ef81a5a6828d02d1a410..749974b974a5b24205477bacee29e1b5df64668e 100644
--- a/tests/gpiosim/gpiosim-selftest.c
+++ b/tests/gpiosim/gpiosim-selftest.c
@@ -6,7 +6,8 @@
 
 #include "gpiosim.h"
 
-#define UNUSED __attribute__((unused))
+#define UNUSED		__attribute__((unused))
+#define NORETURN	__attribute__((noreturn))
 
 static const char *const line_names[] = {
 	"foo",
@@ -16,111 +17,89 @@ static const char *const line_names[] = {
 	"barfoo",
 };
 
+static NORETURN void die(const char *msg)
+{
+	perror(msg);
+	exit(EXIT_FAILURE);
+}
+
+#define expect_or_die(_cond, _msg) \
+	do { \
+		if (!(_cond)) \
+			die(_msg); \
+	} while (0)
+
 int main(int argc UNUSED, char **argv UNUSED)
 {
 	struct gpiosim_bank *bank0, *bank1;
 	struct gpiosim_dev *dev;
 	struct gpiosim_ctx *ctx;
+	enum gpiosim_pull pull;
+	enum gpiosim_value val;
 	int ret, i;
 
 	printf("Creating gpiosim context\n");
 
 	ctx = gpiosim_ctx_new();
-	if (!ctx) {
-		perror("unable to create the gpios-sim context");
-		return EXIT_FAILURE;
-	}
+	expect_or_die(ctx, "unable to create the gpios-sim context");
 
 	printf("Creating a chip\n");
 
 	dev = gpiosim_dev_new(ctx);
-	if (!dev) {
-		perror("Unable to create a chip");
-		return EXIT_FAILURE;
-	}
+	expect_or_die(dev, "Unable to create a chip");
 
 	printf("Creating a bank\n");
 
 	bank0 = gpiosim_bank_new(dev);
-	if (!bank0) {
-		perror("Unable to create a bank");
-		return EXIT_FAILURE;
-	}
+	expect_or_die(bank0, "Unable to create a bank");
 
 	printf("Creating a second bank\n");
 
 	bank1 = gpiosim_bank_new(dev);
-	if (!bank1) {
-		perror("Unable to create a bank");
-		return EXIT_FAILURE;
-	}
+	expect_or_die(bank1, "Unable to create a bank");
 
 	printf("Setting the label of bank #2 to foobar\n");
 
 	ret = gpiosim_bank_set_label(bank1, "foobar");
-	if (ret) {
-		perror("Unable to set the label of bank #2");
-		return EXIT_FAILURE;
-	}
+	expect_or_die(ret == 0, "Unable to set the label of bank #2");
 
 	printf("Setting the number of lines in bank #1 to 16\n");
 
 	ret = gpiosim_bank_set_num_lines(bank0, 16);
-	if (ret) {
-		perror("Unable to set the number of lines");
-		return EXIT_FAILURE;
-	}
+	expect_or_die(ret == 0, "Unable to set the number of lines");
 
 	printf("Setting the number of lines in bank #2 to 8\n");
 
 	ret = gpiosim_bank_set_num_lines(bank1, 8);
-	if (ret) {
-		perror("Unable to set the number of lines");
-		return EXIT_FAILURE;
-	}
+	expect_or_die(ret == 0, "Unable to set the number of lines");
 
 	printf("Setting names for some lines in bank #1\n");
 
 	for (i = 0; i < 5; i++) {
 		ret = gpiosim_bank_set_line_name(bank0, i, line_names[i]);
-		if (ret) {
-			perror("Unable to set line names");
-			return EXIT_FAILURE;
-		}
+		expect_or_die(ret == 0, "Unable to set line names");
 	}
 
 	printf("Hog a line on bank #2\n");
 
 	ret = gpiosim_bank_hog_line(bank1, 3, "xyz",
 				    GPIOSIM_DIRECTION_OUTPUT_HIGH);
-	if (ret) {
-		perror("Unable to hog a line");
-		return EXIT_FAILURE;
-	}
+	expect_or_die(ret == 0, "Unable to hog a line");
 
 	printf("Enabling the GPIO device\n");
 
 	ret = gpiosim_dev_enable(dev);
-	if (ret) {
-		perror("Unable to enable the device");
-		return EXIT_FAILURE;
-	}
+	expect_or_die(ret == 0, "Unable to enable the device");
 
 	printf("Setting the pull of a single line to pull-up\n");
 
 	ret = gpiosim_bank_set_pull(bank0, 6, GPIOSIM_PULL_UP);
-	if (ret) {
-		perror("Unable to set the pull");
-		return EXIT_FAILURE;
-	}
+	expect_or_die(ret == 0, "Unable to set the pull");
 
 	printf("Reading the pull back\n");
 
 	ret = gpiosim_bank_get_pull(bank0, 6);
-	if (ret < 0) {
-		perror("Unable to read the pull");
-		return EXIT_FAILURE;
-	}
+	expect_or_die(ret >= 0, "Unable to read the pull");
 
 	if (ret != GPIOSIM_PULL_UP) {
 		fprintf(stderr, "Invalid pull value read\n");
@@ -129,13 +108,10 @@ int main(int argc UNUSED, char **argv UNUSED)
 
 	printf("Reading the value\n");
 
-	ret = gpiosim_bank_get_value(bank0, 6);
-	if (ret < 0) {
-		perror("Unable to read the value");
-		return EXIT_FAILURE;
-	}
+	val = gpiosim_bank_get_value(bank0, 6);
+	expect_or_die(val != GPIOSIM_VALUE_ERROR, "Unable to read the value");
 
-	if (ret != GPIOSIM_VALUE_ACTIVE) {
+	if (val != GPIOSIM_VALUE_ACTIVE) {
 		fprintf(stderr, "Invalid value read\n");
 		return EXIT_FAILURE;
 	}
@@ -143,28 +119,19 @@ int main(int argc UNUSED, char **argv UNUSED)
 	printf("Disabling the GPIO device\n");
 
 	ret = gpiosim_dev_disable(dev);
-	if (ret) {
-		perror("Error while disabling the device");
-		return EXIT_FAILURE;
-	}
+	expect_or_die(ret == 0, "Error while disabling the device");
 
 	printf("Re-enabling the GPIO device\n");
 
 	ret = gpiosim_dev_enable(dev);
-	if (ret) {
-		perror("Unable to re-enable the device");
-		return EXIT_FAILURE;
-	}
+	expect_or_die(ret == 0, "Unable to re-enable the device");
 
 	printf("Checking the pull has been reset\n");
 
-	ret = gpiosim_bank_get_pull(bank0, 6);
-	if (ret < 0) {
-		perror("Unable to read the pull");
-		return EXIT_FAILURE;
-	}
+	pull = gpiosim_bank_get_pull(bank0, 6);
+	expect_or_die(pull != GPIOSIM_PULL_ERROR, "Unable to read the pull");
 
-	if (ret != GPIOSIM_PULL_DOWN) {
+	if (pull != GPIOSIM_PULL_DOWN) {
 		fprintf(stderr, "Invalid pull value read\n");
 		return EXIT_FAILURE;
 	}
@@ -172,15 +139,14 @@ int main(int argc UNUSED, char **argv UNUSED)
 	printf("Re-disabling the device\n");
 
 	ret = gpiosim_dev_disable(dev);
-	if (ret) {
-		perror("Error while re-disabling the device");
-		return EXIT_FAILURE;
-	}
+	expect_or_die(ret == 0, "Error while re-disabling the device");
 
 	gpiosim_bank_unref(bank1);
 	gpiosim_bank_unref(bank0);
 	gpiosim_dev_unref(dev);
 	gpiosim_ctx_unref(ctx);
 
+	printf("ALL TESTS OK\n");
+
 	return EXIT_SUCCESS;
 }

-- 
2.48.1


