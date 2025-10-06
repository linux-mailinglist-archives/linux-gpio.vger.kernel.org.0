Return-Path: <linux-gpio+bounces-26816-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 67726BBDDCF
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Oct 2025 13:28:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F4113B3BAC
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Oct 2025 11:28:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6CB326D4E3;
	Mon,  6 Oct 2025 11:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0ruj8UZU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D9926C3AE
	for <linux-gpio@vger.kernel.org>; Mon,  6 Oct 2025 11:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759750089; cv=none; b=ONwsGXOOQSLpNGpLJbf8+m8E3A4YWjvYG28gLajnVE4/tuwyJ9qG8UV3NvmeeUcbfzB+/zYz2QZsJD2X4OL0MRhP4w8j7WhF6Arc0+lsk/AWZEd4scL3x7e0TX2ZNc7dEsL33Us6AAf81I4qboOrmi6CFbsD9czKtRYmgJq85Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759750089; c=relaxed/simple;
	bh=uosXj7kNkf90829UAbRJghjCdvWu8VpsfOECOrBDCgs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kv+19s1nScWujAITREaTTEWTuUikYdwzQJqVcawOKwqPxo6KaEScHiQH7CMKEInD7RgeKaMy4TZgNn8dLF10+OgJSyPG8ucGH7MWfNoXBvJxWM19xQk3P16Y49XLZxSx1eGdb8Ytf9Z9g0Y5nZTMCAMW007+iQF56N3kwicvJAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0ruj8UZU; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-46e542196c7so32497935e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 06 Oct 2025 04:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759750086; x=1760354886; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jWLHjItFZ1l60ZUWfWFNeem7SsR2dxypLAuXyy8BlSM=;
        b=0ruj8UZUWBLhWbDShRw56z2jSp09r7FP44+hCvt6UL6Gycvnd9Qy8aRkfLW/dFN7sg
         FH6d9lna4bXaa5JepG6Ep8a+IEaL+5VJw34Dnyem9Wgm2ZQGYu/KCsPAjfsezuw9xFW1
         t+DNYELYCbsri/H9t9Pp7s17I4MI+6ncj7kOpe1yigQwVXo3QzfXUF1UbJ28EbfoI8Qw
         FoXpYE22H6kJk4JFB0jlsfTG+qO81GqPuz6OODUqVKcQ4hVn2UfcR54+KQQOHeRcYjJL
         7dZyCRa5x78cX0JJQQS97bzVIYk4g2hGyjqncJ/xGuNV8IzOIv0gcRK3vy9qPNrA+mc4
         CD/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759750086; x=1760354886;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jWLHjItFZ1l60ZUWfWFNeem7SsR2dxypLAuXyy8BlSM=;
        b=bF/t1Ugi0sOJHzt158DorPpQIfIrTy9cwpLEJrCVJx9EWNf74VfxEcDOosLeIi1+9G
         P2DFnjMF55pr3khX1frc2/RRdgDz2nbpupRlSNhX7PZylXyszmmIRo05+TLTnzRdxN+6
         oPVkNFpdP229uetTLDZvfhEjCGAPw/WVAx6EoVpMYeQFDbvkHE8rbNjrs8EJDfzxjsT7
         zUdW1ckcj038AlN9+7jCkHoOeVdxjvQlfKpzK0juFBiJXDXg61AADuuZ7NqO+SY5/L2S
         nZGDl4zlBdOvJrilX2PZll/pvg9GTWcyAhqn4nZ9RWaggEbJ+nMaqjps4p9ttFkDCTz1
         WHaw==
X-Gm-Message-State: AOJu0Yx7YaK04IB0pmDC/qDv0SouGMyz7VT1O/yio6/FMzzLuVNTkIgJ
	zER+J3fnSRPOOYSIS1xEee2PDfLevq76HcSp1Lc2ACk8fXQdWphcrS0UhYPtXmIs0Rg=
X-Gm-Gg: ASbGncuIZS73bFuE44XbswhCW+KzdkuwXi+QHQ4qwyFiYxZ+OJetlO0alt7NfQwSW3+
	iGXnf2x1qS+vxjTbaQkXApTlfW3AFldHyGbkPRl1NwjIj18PW2OR/aCFiwdjbufAjQww1YpOBa9
	H/jIywEnvje7l0Hzv+iQ7h8g+EAHygbn9Zs313qvvQdlJiQz4IVt9sUJ6LBY3WjKYdNiakEe0RM
	6z5eqiibJzhDDliuvu1vNMPA1lNGzQjNBQmLaI8EQuTVZ8raHSNjFzFmnVpT8PQkStn2cW9+3XM
	qmiuz6x5U/tGkeNSV6h7/BUuSrucKoU97PyFh1e7AKDg5MwqTSPtYfgUNMEcwltt5jOJkDBn0DP
	aapqh2qS0yoVKNOjqz6IMcZsy9RtQ+SE0poCfxWva3/5iZS12ryxA+QW0pUcRiWg=
X-Google-Smtp-Source: AGHT+IFOMIKNbCNZolz43XOe/oxMlzhDx6Fh+1KnFQe+jisDCLR3d8kvaSiFcQGbm2yWSPybXF09gQ==
X-Received: by 2002:a05:600c:8b16:b0:45d:98be:eea6 with SMTP id 5b1f17b1804b1-46e70c4969emr86186345e9.3.1759750085837;
        Mon, 06 Oct 2025 04:28:05 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:ed2b:276f:1a72:aac0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8f017esm21078167f8f.47.2025.10.06.04.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 04:28:04 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 06 Oct 2025 13:27:49 +0200
Subject: [PATCH libgpiod 4/7] tests: gpiosim: selftests: add more test
 cases
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251006-gpiosim-valid-lines-v1-4-b399373e90a9@linaro.org>
References: <20251006-gpiosim-valid-lines-v1-0-b399373e90a9@linaro.org>
In-Reply-To: <20251006-gpiosim-valid-lines-v1-0-b399373e90a9@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1411;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=07iA8t/bClyjE92XkBXcODSoy1MzG5GZO+d8y5o7QAw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo46e+3yAdCve9et7C1ENUxAIOxtNIaEP0enXDV
 /lH+IZaEIyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaOOnvgAKCRARpy6gFHHX
 cvUzD/9QVWwyt6dsEhObU9KaVBDoEyOZ/fLih4w0c3/hJvpm0VFn9b5rbLkjjAlJQRxCtaMBSGD
 G+RgmqQvTMazqE3e8pNMVTN2NbKpgqmhC4kpT0UrRUGXFdflQjISd2YVK/mAqYiXbqpbPTpB3OK
 NePldDl5zyBpuY00efacCr1YIvQVFkStRSVQyLBb8h0roHYxDMgGuOFnG/g7I/QQ1cjiBcO1MGz
 LynYUdlpAtqMsKqcJzz8TrToNJxrqwTQ8LaShfZ9NDilnbRVLgBZmZ5Wi3zMqd0dmGfPk+4AeFP
 0XHkOtG9OKpkR3kyd7woQteUydjEf/3OaVdqbv08u9perR6Jr1S/TUFwVThIWgLW96dPdvB0aua
 YNYk7QNqtxa3E5ANc4iq+CZ767VGczbFebovzTk9edB7VsdOtc54rTNkFpJModXDubh/FlMrT2G
 x5Tr4mwCgaHPtHwBS3fd/mj4GwSZahIU3PDP6PYqFcUzIdzdkMcbQ28et6Er5qhMvAMT6tMtqqO
 d2deDPe+wBoThY0i2U9W/WPtledJYUaJ1jEbifKi34MJrmynxBXhIHRsjw3cu5cw8p648Mj2Oz9
 7BpVhQtCii9ZMODAr8cjFIO8jozLjsmKJKUvaZxBlJA5RoIe/5cA6BljfWlai3cq7gfVIcxIgNL
 Ik1uvFxa/qzUSZQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add simple self tests for libgpiosim functions that were not tested
before.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 tests/gpiosim/gpiosim-selftest.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tests/gpiosim/gpiosim-selftest.c b/tests/gpiosim/gpiosim-selftest.c
index 749974b974a5b24205477bacee29e1b5df64668e..6ce63b4cceaa08f7b61741de310a8de5c26ebe47 100644
--- a/tests/gpiosim/gpiosim-selftest.c
+++ b/tests/gpiosim/gpiosim-selftest.c
@@ -91,6 +91,8 @@ int main(int argc UNUSED, char **argv UNUSED)
 	ret = gpiosim_dev_enable(dev);
 	expect_or_die(ret == 0, "Unable to enable the device");
 
+	expect_or_die(gpiosim_dev_is_live(dev), "Failed to enable the device");
+
 	printf("Setting the pull of a single line to pull-up\n");
 
 	ret = gpiosim_bank_set_pull(bank0, 6, GPIOSIM_PULL_UP);
@@ -118,9 +120,16 @@ int main(int argc UNUSED, char **argv UNUSED)
 
 	printf("Disabling the GPIO device\n");
 
+	expect_or_die(gpiosim_dev_is_live(dev), "Failed to disable the device");
+
 	ret = gpiosim_dev_disable(dev);
 	expect_or_die(ret == 0, "Error while disabling the device");
 
+	printf("Clearing the GPIO hog on bank #2\n");
+
+	ret = gpiosim_bank_clear_hog(bank1, 3);
+	expect_or_die(ret == 0, "Error while clearing the hog");
+
 	printf("Re-enabling the GPIO device\n");
 
 	ret = gpiosim_dev_enable(dev);

-- 
2.48.1


