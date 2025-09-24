Return-Path: <linux-gpio+bounces-26545-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F3EB9A67D
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Sep 2025 16:57:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F30C324944
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Sep 2025 14:56:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6A0430DEB9;
	Wed, 24 Sep 2025 14:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="GVOA3tqW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A27330C609
	for <linux-gpio@vger.kernel.org>; Wed, 24 Sep 2025 14:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758725520; cv=none; b=rVNMWlYTEHNSJKWEdjPMPITN7Ej/4I22Ealr9MCMUFEyFK47/YeJEXxbnSoDLG49EpircqkId1/z/4GqcL+pGraXfKPFvFA2MiNzLL4QEo+UFTO/6O7CEBddkXSs+lzGZPKal0f9r0OWp0S7pxn8q2y43x0EnB708n2LsuoUdB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758725520; c=relaxed/simple;
	bh=BLrlpEi+Tf0y57g8++fj5PBGfPPtXYf9LwcXnw/5/Xc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dvk4e86opM6t9bdh7JG63FPmGnLi9tKCls+4HYbgJ+Q7S9tDkVoNaVoBID7otA1Pi/fXgPL5oPxCtwXAS9Hcf69rCfm8CcMLc3BOY9K9HtzgVC/Lp8q+MQ+j/av8GA8b8orW4l0+5Z5sop/8TNuC5pYm50UMkAc974FeFWtI4x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=GVOA3tqW; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45cb5e5e71eso43528235e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 24 Sep 2025 07:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758725517; x=1759330317; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kUL6O2x/NPPlAHvfQ/3YG+cqGSjBZP8VuHP9QkP07I8=;
        b=GVOA3tqWY7GUvsrYvoO/WF+EwqzHCKZ8GpRQVlhd3g+C2hxDZx+MCZL29I1tCueiC3
         0g1B8k39bNCpj3lTsn/MJLfUSsoW9EoqhxEQzUJfz97RMoGIuKpiRoS1LEb5ITJH61c4
         XBBjZIUVWJdXqOkhBUtr6MISSrv4Iag+I4TA6nphxdJCBFrnjoqmqCLbxkEGlTOryOcO
         8VjLIC4jMZObp2+pmgpoNIk2bkLmXeprQVnz7vcsh+KJ+heFPWDQoWQoM/O8JBnuX8tB
         nc5lTf8v7za587BTv+XzG5m2J+sA+4phiArsUR0ZlRT6pw/XJkULoWEYVqEyzfYXhcO8
         oH9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758725517; x=1759330317;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kUL6O2x/NPPlAHvfQ/3YG+cqGSjBZP8VuHP9QkP07I8=;
        b=Llr5RBm4FrsKWKlULYPdEqbTeEE18jGAnS+WYW+X/dxzFlQBB1vkZjJqBZ1v1puJ8d
         SlWpMhaODPcWqfVFvd7S6iuDe5CM95X9PVceKCufQhWgtk4r2ielMcQ6DGzs+lAR1Xo2
         SvznGZgZefQkDmuqoMhpNWfHuhNjDLIWCyzFhC1XCKVXE+gqHFSYDbYG1veCkzF+o2uK
         /QrLiHC8I2YouTmNcv1u/J0n3vlgMJLaBsD5T5PZCyhZnguQ7CN+foXReq96dVzNeOZA
         NDT+oeI41Cakt7hLLbqtGAJ1/bJCzf28S4GbqfIoKIAn55njdNW+vADVMzSOKo1DXuoF
         63Pw==
X-Forwarded-Encrypted: i=1; AJvYcCUiN5TwY1rkGnNkhSOVIuPaAxeHl8jYS+Iy+U1jcbvRq70ONsL+vUHUPW4Vm19wzPWCfUG3moudwPxY@vger.kernel.org
X-Gm-Message-State: AOJu0YzIzyWjwuRaVUJvfGEivU1yCKC6xBNio9v/26hQL6Qy2PwkGWik
	FLCv168dRhXbkHC5UI5dK7HCXRYAQV9XFevF4naCISEhwO4jnfdj96JGeeGnZQpsS2s=
X-Gm-Gg: ASbGncu17JTBy/FXUpuIWXV229sj/Sazxzt460PAvlZ0O+/ka37XZ1+FMRh0Xx2STZ5
	8yKbK4jWy2HWlxvM19+sEjcNrOdwZ0LlP3phddRTQ167es77hHOWzQQJBAk5iR1Y7W/2iwSMM5w
	BUC/rWl6PIe3AJEGH+AaKgOajq76ux9ZEVSzdZOGjUSxHotUsftwzvBe+vMBUUH+Ualj8IK0J/g
	JMt/zBKPjuhErgw96L72BUWY1y2jrJqaxdW1ShEhwBo8OUkEu/kF9m8zp+9zWmmWlVNJrNBlqeN
	dz4kJqSCrciWTm+kmmtTnlZJe7PAWht9yJ0KZQFkTmNk2H5whAeIdfLSTGTnkSKWmRQGSB3RE2A
	UO8Cuwpbj0+NEG6e7h1OQTgtaQEMp
X-Google-Smtp-Source: AGHT+IF/b8KtJGrO2c7FsOGp+7VILetZJbVWastKmh5680LJka6DmS8H0qiOcUh0QohfrhRcm7VWjg==
X-Received: by 2002:a05:600c:4f49:b0:468:7a5a:725 with SMTP id 5b1f17b1804b1-46e329d499fmr1394735e9.1.1758725516760;
        Wed, 24 Sep 2025 07:51:56 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:1729:c9b6:7a46:b4a3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee0fbc7188sm29514750f8f.37.2025.09.24.07.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 07:51:55 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 24 Sep 2025 16:51:30 +0200
Subject: [PATCH RFC 2/9] string: provide strends()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-gpio-shared-v1-2-775e7efeb1a3@linaro.org>
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
In-Reply-To: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
To: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2913;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=rk7LOdXp57F1p1eS/LT1Bp//+s+MccpAywVrjh9Sj2I=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo1AWFLLNKrVdT/LzU5mrMjyhofZl1pTrhJ6Uky
 MqoP34eGneJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaNQFhQAKCRARpy6gFHHX
 co6cD/4yaODnssjJFuoZ7p50b03D1KfIY95TO6+G69PuffncMCFpi+DH7pJfgY0IB08sl6Myb3j
 ZyO9FoV9P0DjRbv1mk0U41wjF7nRRWsNgqzGOjAFZXXccX2vo5WbZEz9M1qXGRqXffnCrqSIIgB
 JFuRGgJMxfYQDShBtPP5Anv6At1X1TgqNB4yBo+FlntLyczF0e2A2L2Y1YSqog7Nuj/kIHoSNgW
 kKLAEgabncRXTqPkEKF7FfPG1r6nnJsHc3/7ROcEJW1jtHg8vZgMCpt14W7TgVTGEwCc1hE+c7k
 qdTREcqK6mmS/7tNP7HMqmL6HEFADuvffkJPhGj2CBo/iOB5A6yAdzKjHm5jgLyMKqk0k/0IRw0
 jrA1gVycBI4KQJQPJXWkekgV3no1O4Nq1Jb2ALEbBFlNqvI67bKYydRFtW3zejLuYB1WgLOc4Z1
 P+bq+sc/9359/e6oxB3p+J1zH/0WaOYmv3OihFKCRnBAO6ANXR+ZVkVEYr7i0/lZTTA3QzQqGVw
 V/GC1cKCIT/ECMMVD8yW5TQVkudGOCmQ1lYz+RPzPrMuOSocBKUHIm8VuaaE4R7PFD5puC3Pty7
 MSJJdskZZuaW/JrZeAnTfE2txMMqOWLEobceB/r28/vdQrre5Kd2bxCCHv3+aSB+shgxI6/6ht6
 AvtofBUF192zP+Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Implement a function for checking if a string ends with a different
string and add its kunit test cases.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 include/linux/string.h   |  2 ++
 lib/string.c             | 19 +++++++++++++++++++
 lib/tests/string_kunit.c | 13 +++++++++++++
 3 files changed, 34 insertions(+)

diff --git a/include/linux/string.h b/include/linux/string.h
index fdd3442c6bcbd786e177b6e87358e1065a0ffafc..16149404fc3aed535c094b9550f7bd7c9b44a0c9 100644
--- a/include/linux/string.h
+++ b/include/linux/string.h
@@ -562,4 +562,6 @@ static inline bool strstarts(const char *str, const char *prefix)
 	return strncmp(str, prefix, strlen(prefix)) == 0;
 }
 
+bool strends(const char *str, const char *suffix);
+
 #endif /* _LINUX_STRING_H_ */
diff --git a/lib/string.c b/lib/string.c
index b632c71df1a5061256f556c40a30587cf45dce18..ac18313d9c52b38132f0bfdd952cdec6b1354d76 100644
--- a/lib/string.c
+++ b/lib/string.c
@@ -880,3 +880,22 @@ void *memchr_inv(const void *start, int c, size_t bytes)
 	return check_bytes8(start, value, bytes % 8);
 }
 EXPORT_SYMBOL(memchr_inv);
+
+/**
+ * strends - Check if a string ends with another string.
+ * @str - NULL-terminated string to check against @suffix
+ * @suffix - NULL-terminated string defining the suffix to look for in @str
+ *
+ * Returns:
+ * True if @str ends with @suffix. False in all other cases.
+ */
+bool strends(const char *str, const char *suffix)
+{
+	unsigned int str_len = strlen(str), suffix_len = strlen(suffix);
+
+	if (str_len < suffix_len)
+		return false;
+
+	return !(strcmp(str + str_len - suffix_len, suffix));
+}
+EXPORT_SYMBOL(strends);
diff --git a/lib/tests/string_kunit.c b/lib/tests/string_kunit.c
index 0ed7448a26d3aa0fe9e2a6a894d4c49c2c0b86e0..f9a8e557ba7734c9848d58ff986407d8000f52ee 100644
--- a/lib/tests/string_kunit.c
+++ b/lib/tests/string_kunit.c
@@ -602,6 +602,18 @@ static void string_test_memtostr(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, dest[7], '\0');
 }
 
+static void string_test_strends(struct kunit *test)
+{
+	KUNIT_EXPECT_TRUE(test, strends("foo-bar", "bar"));
+	KUNIT_EXPECT_TRUE(test, strends("foo-bar", "-bar"));
+	KUNIT_EXPECT_TRUE(test, strends("foobar", "foobar"));
+	KUNIT_EXPECT_TRUE(test, strends("foobar", ""));
+	KUNIT_EXPECT_FALSE(test, strends("bar", "foobar"));
+	KUNIT_EXPECT_FALSE(test, strends("", "foo"));
+	KUNIT_EXPECT_FALSE(test, strends("foobar", "ba"));
+	KUNIT_EXPECT_TRUE(test, strends("", ""));
+}
+
 static struct kunit_case string_test_cases[] = {
 	KUNIT_CASE(string_test_memset16),
 	KUNIT_CASE(string_test_memset32),
@@ -623,6 +635,7 @@ static struct kunit_case string_test_cases[] = {
 	KUNIT_CASE(string_test_strlcat),
 	KUNIT_CASE(string_test_strtomem),
 	KUNIT_CASE(string_test_memtostr),
+	KUNIT_CASE(string_test_strends),
 	{}
 };
 

-- 
2.48.1


