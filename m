Return-Path: <linux-gpio+bounces-25506-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 19199B4205F
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 15:07:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 531B26837D9
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 13:06:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B272302745;
	Wed,  3 Sep 2025 13:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Py7HkhtK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C978301485
	for <linux-gpio@vger.kernel.org>; Wed,  3 Sep 2025 13:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756904533; cv=none; b=VLFbbsUXOzLQk+oetdCYq9HIDuYQeUPGnSgLGfFLyG+kTAKFjWuc0KIc29vx1bmzlZvzWVqs9c8JjHQ7ivLZ/bXOsFLCx5RUdLUTHs/Gz6kVhc8RX0X6omr8FsQ1k7luMJH6M80Q+Je9SJzd+KnWOhOqg3KbKUk2ycxWlCnCj3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756904533; c=relaxed/simple;
	bh=o2uep3RpsImtqgPShZ6yoOqIkgUh2ECJV82qwniwsCU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qaG8Co2Zw6Q89xcRLBD0tIw0H2paTJn3Dr7MF+tqac7K0brE6BwxGWkWgJaTxMy7MUVk2NGaAEiKgXYbDBWzKaAc5U3CTxtJg2cLUJPaf0TtSHEpTJFoyYm8fXCehSEGbksTVC1fwTa2XEN5YRDRKXWj8gVzKOyL0HlCe9eB04w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Py7HkhtK; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45cb5492350so5695465e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 03 Sep 2025 06:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756904530; x=1757509330; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5tuckE/14sXRWflo6atJ97K1rrdRCXW3yfJI12hwRDI=;
        b=Py7HkhtK9Qc/JFwxZXhUKVkUf30LbC+99xpVjam3wCf/VmMfbZ3zwE45SBXn7NNF11
         uAokvfIqJMQZk9SSoRKez+BWWYeXPuBDaWyNeIIe7z8/1JrP9GAVGit5fGd1xXeSobyd
         0aqQYJvkBZmBZcrgOSKwpFC8qUmrs9cyDPZ9qtbDXbiHsuX0FMfj0ZCtz5OYWMqFY74W
         3ItHE2EqKFO5Ad9EuOjEtsUnBgYJzJgi45zj3hGkj0uCDYd45fJnJXlK/ltj4pTG7V+/
         TTjImY15W97IorOJauBn40mGbgXS6e+iG2Mi3knyUVutsQCEnroTpYwAccHoFbMv1MKA
         eMtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756904530; x=1757509330;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5tuckE/14sXRWflo6atJ97K1rrdRCXW3yfJI12hwRDI=;
        b=PbBiidKs5xHhXnP1Bg5Sd30vNuwy7mxcxZ+JgwyuFY4x8eXzYEtDyuTSShp3UR8ZZt
         qG1DsbsS0rvV2WLcWoKeOW0DGqo3duYvJtSAKQCLl954H2bQ46HoEFv/W2vnd1QfDso+
         8g6SHgT0T0WvKgMVmG38qPr/z5aDwUQ4fiew+YuWwQg9Ccr27BuFY0d6yH2htiM1m25x
         WaNnn3KlPa2iD7ZhyQGDz7BYeQcF5C1hUCYzpTM3MFazp5N18ZJCDLrHQWILmvH9+Ow4
         1Sf5/bmSxRvlVl2JU/nbX+HlS0c66Nm8XRfwMIC99PMRtmOSyNqhjHTp3qEzmiIeBet6
         sm3w==
X-Gm-Message-State: AOJu0YwqNnBaDNZ9p9l9IWuORTq8HvzuaPdFFRmBrv0l+na28p6XFydy
	H28tkvnbMh8OXY9TLnC7SP0YjCb/a5b5JGIgqQDVS9m6Fy6FtvSpqUoeKW0o7/l0SSM=
X-Gm-Gg: ASbGnctRcgImWDTcMaJlgT+eawU7589rlNEJ1DaqhH3aA2EFBHDFObd/BhIbuKbStSs
	bGfkAjuKptTCCekRYW31OO7CVnnuo0Ut+wpM7yoJLFDpLbzR22X4/22W9051Mz6JbD5+JU1Sbz0
	Y6avLPLzIXTqYirGR5e3FE3L6PKm+mM8F+s3Sne5HZURhc4Qwh0BvyDnfHl+M/9je12IjlmtELg
	XsPr46D0yfKlWtP4uvNbfms7KeZQ8oAmDWL1OLyeNxoE9BAxqwxFGsI8kNUdHLz4h2DVQW4ry1u
	XY3QFRQSArrTNf4qrZ1c41MrNzF/tLxkE9NPc8PYPXA+x823mCpOFSKCwBOy+qaMcUbC9PHe8L3
	NH8+xHfkzJkP9On2saUWKRxyCsI8=
X-Google-Smtp-Source: AGHT+IEddSj9lG4YL75RST3lKuMU097gmRCfnUmXMEWyjTxTp+Zf6pwMWMQtMyRQJ+OLlx9COc6C6g==
X-Received: by 2002:a05:600c:4744:b0:45b:7b54:881 with SMTP id 5b1f17b1804b1-45b8553f1f3mr121336845e9.1.1756904529588;
        Wed, 03 Sep 2025 06:02:09 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2f8b:4799:6bd6:35df])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d6cf485eb7sm13280178f8f.3.2025.09.03.06.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 06:02:08 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 03 Sep 2025 15:02:02 +0200
Subject: [PATCH libgpiod 4/7] tests: update library API version string
 tests
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-api-version-detach-v1-4-027ca5928518@linaro.org>
References: <20250903-api-version-detach-v1-0-027ca5928518@linaro.org>
In-Reply-To: <20250903-api-version-detach-v1-0-027ca5928518@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Kent Gibson <warthog618@gmail.com>, Vincent Fazio <vfazio@xes-inc.com>, 
 Erik Wierich <erik@riscstar.com>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2841;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=lFTbnM+Xk38/RC0bp3FrT1F5trdIUR8NtuHf+PfpRBg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBouDxLS1qQm18UYzcx+Cx3yNh51fwnohmAbtnCs
 AhVWo5EyMuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLg8SwAKCRARpy6gFHHX
 chYYD/4tZw/rtAOFY9+mdpDnHAcGvnXKRiG+Fdoj2ZHjcy9rWQLLyEucQWqbOpzFBZEziOfV9S5
 pULNCyiq4WgiNq3OIxDzcp1GW96b5VpnbNVvxpj3KdMpPHpUD1FWXfiG0R2awzqzqYLXZwKCyWe
 qTPZunzTYrBF5M4UCt7E00dli/CCWSLiAs6njH0luRohN6CwaypSgp8PiKLzHvxJoBeZUqSv053
 W92RR6I4mYUNh036TE39sO+smy/y/+QIQaQuQFyT/Y+ui2Yhnitx2NMIf4hVtxBaOPq5u2pFgMl
 /F+K3gkJBR5FEB7xinaY4nQeW0zxJZ6Oeig/AfcL0QUYidFZ8kp3ZnJMl0EfJ1cJ92ll+VwjOd0
 yG+FlwM/42WNNbjfjmysZeNxDvmjixP6T1vwehITSuWSvmU3titO6mQLyRPfXUlVHY7mwwANvCn
 MlHmmqohmt/H+mU1oAFiR48U1BzVT6PBgD0yncjrWScHKMATymQEOjIcqsVtb1dU5RdUipzLYYx
 1NF0kcxKUGPJwogdE8GVL1/Cv9sgWC/zun8sWodfCDclaIUvg77VfbQL29E5HjDv5JKrfUJbosl
 idHf1VBKDwE2d9HAziVYPzOrFewqfHpB24QgpIZf8AnTp54pWzlH/ptGkxH3QHNEaIWAZJQfZsS
 dwXAPX+/zK6PNcg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The version string returned by gpiod_api_version() is now stricter and
will always be of the form: x.y.z where x, y and z are unsigned integer
numbers. We no longer have to parse various suffixes so update the test
cases tree-wide.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/cxx/tests/tests-misc.cpp     | 2 +-
 bindings/glib/tests/tests-misc.c      | 2 +-
 bindings/python/tests/tests_module.py | 2 +-
 tests/tests-misc.c                    | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/bindings/cxx/tests/tests-misc.cpp b/bindings/cxx/tests/tests-misc.cpp
index 33fc3faf029d7969f547f5c528abee6bd9f02020..8fef2e18f9dd494cdd0818bd3d2225111a869871 100644
--- a/bindings/cxx/tests/tests-misc.cpp
+++ b/bindings/cxx/tests/tests-misc.cpp
@@ -71,7 +71,7 @@ TEST_CASE("api_version() returns a valid API version", "[misc]")
 	SECTION("check api_version() format")
 	{
 		REQUIRE_THAT(::gpiod::api_version(),
-			     regex_matcher("^\\d+\\.\\d+(\\.\\d+|\\-devel|\\-rc\\d+)?$"));
+			     regex_matcher("^\\d+\\.\\d+\\.\\d+"));
 	}
 }
 
diff --git a/bindings/glib/tests/tests-misc.c b/bindings/glib/tests/tests-misc.c
index 356e408ec4c2240bb2211d2a064f85794da625fa..37f9d6849f9f8dc7155cc22d51dd5bda8bc5e4c2 100644
--- a/bindings/glib/tests/tests-misc.c
+++ b/bindings/glib/tests/tests-misc.c
@@ -56,7 +56,7 @@ GPIOD_TEST_CASE(is_gpiochip_link_good)
 
 GPIOD_TEST_CASE(version_string)
 {
-	static const gchar *const pattern = "^\\d+\\.\\d+(\\.\\d+|\\-devel|\\-rc\\d+)?$";
+	static const gchar *const pattern = "^\\d+\\.\\d+\\.\\d+";
 
 	g_autoptr(GError) err = NULL;
 	g_autoptr(GRegex) regex = NULL;
diff --git a/bindings/python/tests/tests_module.py b/bindings/python/tests/tests_module.py
index 7120c6346ba4666adb250d0880d5777dbb7666ea..406bfe7c4c486bce34848246e2e58ce028cfde4a 100644
--- a/bindings/python/tests/tests_module.py
+++ b/bindings/python/tests/tests_module.py
@@ -50,7 +50,7 @@ class IsGPIOChip(TestCase):
 
 
 class VersionString(TestCase):
-    VERSION_PATTERN = "^\\d+\\.\\d+(\\.\\d+|\\-devel|\\-rc\\d+)?$"
+    VERSION_PATTERN = "^\\d+\\.\\d+\\.\\d+$"
 
     def test_api_version_string(self) -> None:
         self.assertRegex(gpiod.api_version, VersionString.VERSION_PATTERN)
diff --git a/tests/tests-misc.c b/tests/tests-misc.c
index 9d4f3dedbae6f0e415d85be52d7b47dad01cce43..00f3272d2ebc199801792209b428503912b97309 100644
--- a/tests/tests-misc.c
+++ b/tests/tests-misc.c
@@ -68,7 +68,7 @@ GPIOD_TEST_CASE(is_gpiochip_null_path)
 
 GPIOD_TEST_CASE(version_string)
 {
-	static const gchar *const pattern = "^\\d+\\.\\d+(\\.\\d+|\\-devel|\\-rc\\d+)?$";
+	static const gchar *const pattern = "^\\d+\\.\\d+\\.\\d+";
 
 	g_autoptr(GError) err = NULL;
 	g_autoptr(GRegex) regex = NULL;

-- 
2.48.1


