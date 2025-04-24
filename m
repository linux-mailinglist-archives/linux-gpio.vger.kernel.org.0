Return-Path: <linux-gpio+bounces-19268-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB5EA9ACD6
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Apr 2025 14:06:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CDEAF189C6BB
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Apr 2025 12:06:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A101A22A1FA;
	Thu, 24 Apr 2025 12:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="m/ePTMo0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6181FAC46
	for <linux-gpio@vger.kernel.org>; Thu, 24 Apr 2025 12:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745496391; cv=none; b=tTpK94Gcojc58AfagV1t+oWZqzRpT5k8/hwHcwjIDprtDQHuBk4Re6vNgMT0d+z6bAML8wUZS2tjlLwCxSCA3wL0VqIXW/+kD0obeIKYyrC2V0Ei3ZPPKdKky51pmmVP6tSQZMMAWa2fT3k78RrJMcpYLNXAUqZkW1F5mX9UB/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745496391; c=relaxed/simple;
	bh=j1/gJV+CBsOZjN77l5Wn8E6RhQ40DwbX4KvrbSvVL+w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=O4FbI88at6OQI3b8TgZzBAIhP0Y7OJuEIcqeKb+6tsh52FsDrpKQVNsaBblv4wb3CWYLmvp+jGxi3IBoBHwM4AzVnHk3AS55hP0RWVdWtlapljsF9otp8wJLUBq8ACvJzMDY/A0SawsZmWcPMn7Aj3Nvq+Sd3MGqzBkIvSi6D98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=m/ePTMo0; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso9289415e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 24 Apr 2025 05:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745496388; x=1746101188; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/xeO5WSujBrP/CjXJA6XdhCK3OequhvKrWs0D2phSRc=;
        b=m/ePTMo0TPML+D0iwkLnqtxEV6czsH7XSAXJh9fS896oZc6WK0cP0BRiTOQ9uHJC/V
         UO3Ng4d27XXeczMkD1fl88fudhMC8pB+/6UPL8Co5hd8A5iYOGOQ6+Habt+u6lD9vTNY
         +3kLg4E1mvCVv+2EyG+r7eTQ2F7Yl1mQpzcfyA357heFJXPbbQuKsi9hkDrxqN0EH71C
         yXN8zcFwiqfeq7Qilw9PFTwxj/XWHXuWO50M3mVzittE33sazaLwCTWC9eiAobrbzEll
         5S4mWi11zHIIK+qhkYuRPdV9rsAfqEVbULbwcligolq6ow+Bh7KtARw0UcDaK15oce1d
         xNdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745496388; x=1746101188;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/xeO5WSujBrP/CjXJA6XdhCK3OequhvKrWs0D2phSRc=;
        b=eZcrMzmCe8TJM/zOn70BwMIFgdL+ESXL0JOAB52mHvL6bMS1nb+xDopkPbHdH2B4Td
         VZXG8qIHMCf87jp6sKH0i0mHxK9wwSecdkfGz9/KlI3FeDvGC05wBLr1+MhRUsHRMcRq
         /ome1h41RjQ76scd3gjaKmDtpxoBK7QJF0v9ZDn6AbNelpa0NRl12ThSXWN9Wm9uPfP3
         ODl2CZAurvoLjoUFnapbTHE9Obj7p+oGTy8ipypWE0+vWF31yTsBYAiFw5rrPAu/29qD
         qt10Jh5IocPvNfRxfNiWfSA27Tt43MsLYMy/XfFf5GJOHqa0F0YuWl/Dq/p53WQXuN3J
         2Yyg==
X-Gm-Message-State: AOJu0YypBGgom6q7jgIvZzAykHSDk2LaKOH5nTTDy1176Xxjg12EIB53
	9O6PPVKHx2RWKrGFCLaBWPw/jguyxnZq2vY9KSawNJUGhgfwCh5CR+lFjp/iOeA=
X-Gm-Gg: ASbGncvflcIE4AM9O3QlmsMQLxZGN9/qFbFEV2JYjFnU7nN544sm91GDVOFfJjqnjeg
	wjra0sis0EqhSpK1Q7PNZq5KjU8ICxcgMifxy6avPdmMrmuLY1LJ2IxMXOHQAmQBH2jtVdd9Q8F
	9X6BgGoDznRqFH1Ohux0nKUjVIO20rU6YeZVgOPKXeqbp0zov1BjjBz0NGp2KjfUYWC1LGucFPW
	efC43oEYR7BDGmqrGUn9KSB/6qfMarTSjMca9GSFtBA8Q4IxJEV0C3FwLm+DVi5l9IBKc4HeTSL
	ilMEmIK2WMJMFpvQ+sfsLQRMDnYZfVO7dg==
X-Google-Smtp-Source: AGHT+IHpZOosgtYY/8rmhMywTG9TJwVXG51myQtA/8f3+BLfg+BlPsQwET3rwyg531GkVO5RciZi3A==
X-Received: by 2002:a05:6000:2901:b0:39c:dfa:d347 with SMTP id ffacd0b85a97d-3a06cf4ba5amr1967733f8f.2.1745496387570;
        Thu, 24 Apr 2025 05:06:27 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6266:7750:57ce:7cb4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4c108esm1881793f8f.40.2025.04.24.05.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 05:06:27 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH libgpiod 0/2] line-config: don't allow memory usage to
 increase indefinitely
Date: Thu, 24 Apr 2025 14:06:15 +0200
Message-Id: <20250424-line_config_mem_use-v1-0-fa0abdcf0cdf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADcpCmgC/x3MQQqDMBRF0a3IHxuIv7aUbkUk2PhMH2giCS0Fc
 e8NHZ7BvYcUZKLIozkk48PCFCu6thH/mmKA4VwtavVqe1WzMsL5FBcGt2Fz7wJz6aHq7XS/AVL
 LPWPh938dZOUz7EyzjOf5AzhCgEFvAAAA
To: Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=939;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=j1/gJV+CBsOZjN77l5Wn8E6RhQ40DwbX4KvrbSvVL+w=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCik+8Yvg1NkJiWndOLS2b44K0SOSFmD+8/veB
 8qBd0ykeoeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAopPgAKCRARpy6gFHHX
 cj+bD/4g0LUD8VRoDW457hf5tL+BbpL1c94eUgYzWPGcGGPi+X2jLWtEbvI96OmbalaZnblQiux
 ptWvb1Za2V+lkR+M0gkV0qsOrEWUBvlzzyzNfm+yQOitrBItnapN8ubLF0UiG2npNc/OzTQw6Ad
 tTPLxroeb1FbvuKq396WYkS1A/QF8A1VydT8XjTNwy45ouow6VxatPzUo8LHbL70fTUubF65QxT
 vW5iwzO70N60cV2rAprJI3hfvB1K6kDd0dd579GfXLGrppiQE/sH0YO8lNps0KbRHaiR76fA0K0
 CpVz+ObkjbGx7Bw9r01d2Cd4Qvk+5vzp+Ls3twS0I75TJQc+fxdmdz9SgdoUnkKy70UzBMUb6ey
 boOI6zzHRddgnYe/Gqe2rvZZq3aetnBoSImB8eAY8VcXFXRe0yufWIGrKkR0dV9f4NPJPs6ldU5
 uxU7SsAoFJciP1K48vWQXeOrrrYYV60axhFUNGuudLoJqtbYBeLhA/8hicgJVwQK8TtFKBD3jus
 SjC02Ynt4bUU0jzeuZuFYlLIy+OTVbF2KrrLoiN8P8gjlX/JZiIHT+UgQI0bhgbk6b0E4mcy/qB
 pNqz+iZerAJtukn//jGziLR6yacaTkysy3EqrrDw0r4ffKrstSxkmIJJzKblvMHnyZNqqw8AQxf
 9fW1Z5N5RQKSMtw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

I've received an issue report on github pointing out that repeated calls
to gpiod_test_line_config_add_line_settings_or_fail() inflate the memory
usage of the calling process indefinitely until it's killed by the OOM
killer. This series proposes to address the issue and adds a relevant
test-case.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (2):
      core: keep memory usage of struct line_config in check
      tests: add a test-case checking line-config memory usage

 configure.ac              |  1 +
 lib/line-config.c         | 19 ++++++++++++++++++-
 tests/tests-line-config.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 62 insertions(+), 1 deletion(-)
---
base-commit: 41231df28c9aecacaaae9e6493d31161023733d6
change-id: 20250422-line_config_mem_use-34e22c0a86ee

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


