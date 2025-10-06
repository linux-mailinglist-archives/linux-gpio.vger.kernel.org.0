Return-Path: <linux-gpio+bounces-26817-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9561FBBDDD0
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Oct 2025 13:28:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5129A18876EC
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Oct 2025 11:28:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6B5426CE1E;
	Mon,  6 Oct 2025 11:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="tfFT1V9R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C86A26CE28
	for <linux-gpio@vger.kernel.org>; Mon,  6 Oct 2025 11:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759750090; cv=none; b=IxQDo4sX5WW5B+DjfD2qBJIVDlIOrb3xEDmKzS2lY7OBaS8lmzAeYcBuS0pHyCUYtj4nBSgaHKHlqEUqiKKs7n7aFFk3xElMV8VCkx9fDzkbLBGGiRy20RQoS+1B3+bH08c7h4dhNJY1Ehcuwt0r8cGO42cR44wNQMOpGmbc2JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759750090; c=relaxed/simple;
	bh=bcyIicO66kaHXk5MqXfHU8FRekZSMgQZfSOtRzTTr6A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XqUII2iJMCNiZ0sL71npgTSbBNYfy6mD2aHLcHeSqd0LdcQTJk7pBxA70oDLd8CpzxbuPtJvJKO7Y0/4rXsROqUDzMCQ8J3bh4HD4Ib2bXrYOwPQEwbs96SeKC8M7LxBtwufxW3vwTMrnea4Hv3NXj0C99tRrEHldqCbbgeEqfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=tfFT1V9R; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-46b303f755aso36680485e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 06 Oct 2025 04:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759750087; x=1760354887; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W2hHYXWYyISd7tEXWZdZ0IkbyVbt2lZvavf6F4hUq2U=;
        b=tfFT1V9Rab5mlvRIx8z3/RPcTGcZcnH2hWR8S8m4lyYR5dGFXFZduDd1LjwpqXAFDV
         P4BiCpfrpRfqOHqPbwp6zYkzBBEk6kCyny3elmBavu7RVOgTmAe6EQI2/a8QO2dqN8Vj
         dRKolcbbWWRT2RdbXe08Zd/8Zto5Ye+ycGtw90F/z02Jo4zhuCJdGjs0wRveXfyW+JWc
         0+FwQMICey/xRhM5apOzag8iDt+/Rzw+IXDavKuP83aedqCeyCWTkmyG5oT166GoStZi
         88+pWQdfwwXFb+WsSbAlL001+AQ+49mCSn8uZcr5SDflnzY2dJssE5/OMrmefRtiryNc
         /kUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759750087; x=1760354887;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W2hHYXWYyISd7tEXWZdZ0IkbyVbt2lZvavf6F4hUq2U=;
        b=gMrfCFCzTWFOZY8jyPXzh1/0g1/MceR7056OlzTH0Z6o0uQVv/8js9Mnv2m6nxvUr+
         zpevP+gWf3ZDho9EDRtxPdDeAazd4/YD8nrIwmvrSdqCqRO5DkpqgJyw/6GM/786Y03u
         oONtF5HMCaKccLj0gSuHC0RYVaosi92blgu37fM05Qe96dT1dIgqy8qbw01IaOvI39lB
         xYk/yqfRyV8XNCcuSwx6K07S2Hl7RDnJW4JIV2oxjZB1HqR8iUSS7Mfd/McmWhz+Jdo8
         lcn8ZeeoVd0rOPknkdhnoMfJIOg0JF4iouS+4vck3TcXAJJIckiw4I7QfVJSaat3wVDL
         ijxQ==
X-Gm-Message-State: AOJu0YwUXlk/Ndo2+NuIPyo71cn4Rerix+V0hn0ojfWplz1w1zvJ9M64
	7AgcSqz7rQNRwD9bQ755Tx0DTYF0if2H6kH/tH+PSL5NoNRhjqHH9Jv+apwd7fVJ9DeGN11eFwp
	WkoEcD5M=
X-Gm-Gg: ASbGncs/5bJtx+xWkRpt0olR0QWFJ3sTzo6fMFSjuU8rNYGq3LBiEdIcy3/kwlw73/d
	sYiQE2GMG7IctLd5fgpC66j+2G+Bl4qdFjjLR++XBG4Tu/fD0fNT/EUN60tHOWli0LULWsvVjb7
	IHt/m0fjZT3ZXfglCfhV86X66QDgc4MtmnCCYyR1DrRsosJzIRy875iml7PpKu8I6xG4ZsaVpRq
	V3dKmCQLGogL0oC9lq5dCejZ9Iz8vPJ9boE/PdIAWEY5LMIyspUkPxL/u4F9cYB5wGMCYnO1Qr+
	MBA2KJt5bE67r9yzjUgvAp9kH4yPTNTMUGANWCaEyr4g1JrxK3ebCnSdp0qSNnsEG+InufcHNw+
	hYhcQb+MDbg6IpFvQ1+AdJEHue6kOiIAI7UFDPqad0A==
X-Google-Smtp-Source: AGHT+IGWTc+Gr1UmWdRFJP6uq8aBlGYUmECoFfJHn5MYhAywTzaokyo/VAg/0GlouRAwPkUar0YbPQ==
X-Received: by 2002:a05:600c:1f8d:b0:46e:1fb7:a1b3 with SMTP id 5b1f17b1804b1-46e711457f8mr84530495e9.23.1759750086770;
        Mon, 06 Oct 2025 04:28:06 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:ed2b:276f:1a72:aac0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8f017esm21078167f8f.47.2025.10.06.04.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 04:28:06 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 06 Oct 2025 13:27:50 +0200
Subject: [PATCH libgpiod 5/7] tests: gpiosim: provide
 gpiosim_bank_set_line_valid()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251006-gpiosim-valid-lines-v1-5-b399373e90a9@linaro.org>
References: <20251006-gpiosim-valid-lines-v1-0-b399373e90a9@linaro.org>
In-Reply-To: <20251006-gpiosim-valid-lines-v1-0-b399373e90a9@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3172;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=shW9jdxlnKDm8Sxp/Yxb5e1qOxq8fJZ4x2kda5TP5qM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo46e+biD1frVTfX5UMMasuvzlVqUwSSz/LK6c4
 lVw3T/iysOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaOOnvgAKCRARpy6gFHHX
 ctaWD/9WS/L+w0Y1xZWbZ8gr43P/HlsvDEzjtMCXB6A4vcDeLveZkYamgXitmjBZERoXq4n7Bif
 DMXQzt2hLqQWrvxA6XAQ0z7emaiUQ56OugIUTFClIPhzZFB7bYw3EmgJidHPj1QV+WyjNaBsuTJ
 ns0keOskUf0PYp0dsrs0/nASP9ctgmiQ2FP1lKj9VsRRNMt1jqcCUgSnH6pRIu9kISye1/StC+g
 6HsbNtgKGC2mjvxshU5HhW0bM07VcSlGeo4SpkGC1E2JfuFfLJ2zJKG+EjeYIEfui+CygOtZjDd
 +zJyztFmfY7a2RT8mxfZBpXmnwMyUL2cDDnn1ef5AQbZtUSFB2UYZytLYkAIyLJPH4KRsWbBoRs
 d6FRZ2Ponb432/iJ4ghD2fxir7zruTnZGgUfXeyprOtASokT2eMb5IOVgAxKgU5RPirxO1mHpji
 tEpacFZp1647I/7mYRrgvu7sGO2IAOFXdW6WcVM9utGIgeCCAQR6+h1fhwnhKeMlV+PjF7btscT
 AMQyz1QpSrjkVisZkSiQ4ba7Uno5N/YMzvvjauaxCH7Oo6r2hd7OuyDfG6yem8Yzua5XEWGlJSN
 VGcqIWNW4UZNBR4PPB/z8O0fY9i/a3M9mHWlu2SkvdYhRewLleuc29HCq9Gc2ZmREHAjBm4u17M
 bd6rklGHYiBxCwQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Provide a function allowing to mark a GPIO at given offset as valid or
invalid (all lines are valid by default). This will make it impossible
for any user to request it once the simulator is up.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 tests/gpiosim/gpiosim-selftest.c |  5 +++++
 tests/gpiosim/gpiosim.c          | 20 +++++++++++++++++++-
 tests/gpiosim/gpiosim.h          |  2 ++
 3 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/tests/gpiosim/gpiosim-selftest.c b/tests/gpiosim/gpiosim-selftest.c
index 6ce63b4cceaa08f7b61741de310a8de5c26ebe47..7b005f7666e14899d058dbc04b8de7ef6df91d1a 100644
--- a/tests/gpiosim/gpiosim-selftest.c
+++ b/tests/gpiosim/gpiosim-selftest.c
@@ -130,6 +130,11 @@ int main(int argc UNUSED, char **argv UNUSED)
 	ret = gpiosim_bank_clear_hog(bank1, 3);
 	expect_or_die(ret == 0, "Error while clearing the hog");
 
+	printf("Mark one line as invalid\n");
+
+	ret = gpiosim_bank_set_line_valid(bank0, 1, false);
+	expect_or_die(ret == 0, "Unable to mark line as invalid");
+
 	printf("Re-enabling the GPIO device\n");
 
 	ret = gpiosim_dev_enable(dev);
diff --git a/tests/gpiosim/gpiosim.c b/tests/gpiosim/gpiosim.c
index d48257534b887c8e9694afce80894a895379e1f1..0d7859f1e02bd716580b34a9d514120c8c849f26 100644
--- a/tests/gpiosim/gpiosim.c
+++ b/tests/gpiosim/gpiosim.c
@@ -24,7 +24,7 @@
 
 #define GPIOSIM_API		__attribute__((visibility("default")))
 #define UNUSED			__attribute__((unused))
-#define MIN_KERNEL_VERSION	KERNEL_VERSION(5, 17, 4)
+#define MIN_KERNEL_VERSION	KERNEL_VERSION(6, 17, 0)
 
 static pthread_mutex_t id_lock = PTHREAD_MUTEX_INITIALIZER;
 static pthread_once_t id_init_once = PTHREAD_ONCE_INIT;
@@ -1125,6 +1125,24 @@ GPIOSIM_API int gpiosim_bank_clear_hog(struct gpiosim_bank *bank,
 	return unlinkat(bank->cfs_dir_fd, buf, AT_REMOVEDIR);
 }
 
+GPIOSIM_API int gpiosim_bank_set_line_valid(struct gpiosim_bank *bank,
+					    unsigned int offset, bool valid)
+{
+	char buf[32];
+	int ret;
+
+	if (!dev_check_pending(bank->dev))
+		return -1;
+
+	ret = bank_make_line_dir(bank, offset);
+	if (ret)
+		return -1;
+
+	snprintf(buf, sizeof(buf), "line%u/valid", offset);
+
+	return open_write_close(bank->cfs_dir_fd, buf, valid ? "1" : "0");
+}
+
 static int sysfs_read_bank_attr(struct gpiosim_bank *bank, unsigned int offset,
 				const char *attr, char *buf, size_t bufsize)
 {
diff --git a/tests/gpiosim/gpiosim.h b/tests/gpiosim/gpiosim.h
index 7d75852ada1a6affa907e9a99b66621ebfb24b50..6b7ac8e0afbfae75f57f95d8b6f09b668bd88f1b 100644
--- a/tests/gpiosim/gpiosim.h
+++ b/tests/gpiosim/gpiosim.h
@@ -61,6 +61,8 @@ int gpiosim_bank_set_line_name(struct gpiosim_bank *bank,
 int gpiosim_bank_hog_line(struct gpiosim_bank *bank, unsigned int offset,
 			  const char *name, enum gpiosim_direction direction);
 int gpiosim_bank_clear_hog(struct gpiosim_bank *bank, unsigned int offset);
+int gpiosim_bank_set_line_valid(struct gpiosim_bank *bank, unsigned int offset,
+				bool valid);
 
 enum gpiosim_value
 gpiosim_bank_get_value(struct gpiosim_bank *bank, unsigned int offset);

-- 
2.48.1


