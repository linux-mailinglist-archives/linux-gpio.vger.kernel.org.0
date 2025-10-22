Return-Path: <linux-gpio+bounces-27463-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 507CFBFC3BD
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 15:44:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CA1413580F9
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 13:44:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D665234C9BF;
	Wed, 22 Oct 2025 13:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="uZU6H8ar"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B3B34C99A
	for <linux-gpio@vger.kernel.org>; Wed, 22 Oct 2025 13:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761140485; cv=none; b=uJfWsE6y2PC6sc4eZy7w+uibo/l+rK4Xh5IVLoXBAiPh3nBJQpFRDkd3zXfyk8QPTgFAaB/aQ+/mgGnQKSl1IY/RzvqCuJu6QddEhF/XHtiraIpCZ/T+6KZy0ZG07IyvJsTpV+nXNoP4eNLbGnxY261iZ/5+iH53NPIgLOcQX5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761140485; c=relaxed/simple;
	bh=LiKNRN4b6Rog3bOF2ZYrAAug90U1uNL0NBVGRtkRLdU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eIL9ewR18JrN+LLYvXHdcy2Wc+OeSaZ/VnLtciueXpxEuUYWMB96e6jKn1ZII6QFinb2dI7sE1Md6C8FqB4+EWYzJby1AOvS/obaTNDcZOGJY/WctBXE4uzKlD/EAHXJaEzG1Ib5vQZ+7xbAcZSmK2NFKGbLCKYcuvM+lO0xjU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=uZU6H8ar; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47117e75258so35186475e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 22 Oct 2025 06:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761140481; x=1761745281; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2UJiGuxpdr2uQskb5nJaM3QuQzryJ9Mudo5s0IYG1NI=;
        b=uZU6H8ar69kL6hcDZTSxOk/aSP/k6V45U696XCd0RT7r81P/9OwS2h3GFbUPiFTEdE
         wUj+MBa/ecrS8anixKaPK3cTkcWh5byWDRt4vgmNxpGDgZlfPuy85TEzjhyP7XYgt5+4
         s14IE3zlUDEy8gZUwT9aatOCeFRe3db0jiret3eonlAWsJ9XR5xzuSpXNLXUV4twDNej
         mWQgwPpYQirCr+eFOsi5o5h4EXjvaBBR+1PPyjy4uxqbIAk5Z9REBQ76+QVuWGpt0vXv
         pgdRmbpBDUBBGQVyAWMTdBokNfS8HotmkneFuJnwh5Zib1MD1aujYatMTAZTMd73xSdL
         N2NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761140481; x=1761745281;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2UJiGuxpdr2uQskb5nJaM3QuQzryJ9Mudo5s0IYG1NI=;
        b=QeDE5G2gS9AXx1Ejfzalm5zHQcuQhB67uOytV5x88DP1U7giykZ+y5STD1uS/7W3A8
         YxPq2TnDz/mcvXVljfRRBjpMY9JFnjET6Nj+UCHRR198oHCis3gRoWNeDK2D5spDwFNG
         ctrGRDWnNDDB3gkNmI6n4rYr7fAZHpDpVj5hZG5H99IhAvOVQO+6Sjuduy5RWNn+JWhw
         wRPTLKEgP+Je2F5xi2FBmYqKB88yi2oFtQrEXrhFLPTfpzVSPLo9t6SGLNBAO9Vmj7eY
         8ObBYHlBxsply5jSEm6fzat9Vh3gTyXlOna5KCRUD9zuD5RgIcSVbmOxI48oTcBkPZlt
         DFeA==
X-Gm-Message-State: AOJu0YwfSw9O+9wv1bz30FnApaepyEJwykP4qoCuTXXm7MalnZLWOB7N
	UNwd5fXyU5qYqaMFuaSMxJ2ie1BLrlmqsZawS2uJwOkq/vDeJbysSAMNQXG+G/HS7aA=
X-Gm-Gg: ASbGncv/WzNBNT6cYwoExinpEHQZVgyEjeByrWJpuPdpV9DDDul73IErmtFGyOUjnVi
	YwB6qqQ3WYiZ1IRB5V5b+xpzh/erPmyUbkpiTJVGwJpCuwQCXTrlfpfNEEEYSJIiI/BvtDvse30
	1O014ccxI6Gq5D0DQjEzPHDWjbJNkyxevyh2YN5yneyCaHBDk+Sq8Abkzdha+bfu/kFFn5WaBEe
	PmXy2WU3igK1mz9IHk6LMyeBluY0QEVkkPKiytKDw3htGqdEuU3BfKj1uVl1C3zxy9Gayqf55HS
	YVRy9XkuyYwsTvydhm0cFYxdw4P1TGwJ9gntu6RFHg9qJw4+yckBmo9uvPjVrE4eGO5VVr5z78K
	Vo2EZbcIPWTsAXs/D37Fdwuc4o7I3LXN8JHh1XjFT8wRlpPgtNpxogvDAQCCEGW8pGb34kMg=
X-Google-Smtp-Source: AGHT+IHjMRgBOQgbuIn/UpGEYlh2Hej1FZDXf1SxMg7Iy5jMo6Pqu5T4kyyalcCuqxuYJVl6o2GVZA==
X-Received: by 2002:a05:6000:41c4:b0:428:5659:81d6 with SMTP id ffacd0b85a97d-428565a6ce5mr1176626f8f.37.1761140481360;
        Wed, 22 Oct 2025 06:41:21 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:69df:73af:f16a:eada])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f00b97f8sm24863066f8f.36.2025.10.22.06.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 06:41:18 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 22 Oct 2025 15:41:04 +0200
Subject: [PATCH v2 5/9] gpio: swnode: update the property definitions
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251022-reset-gpios-swnodes-v2-5-69088530291b@linaro.org>
References: <20251022-reset-gpios-swnodes-v2-0-69088530291b@linaro.org>
In-Reply-To: <20251022-reset-gpios-swnodes-v2-0-69088530291b@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Daniel Scally <djrscally@gmail.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-acpi@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=992;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=2oDrBv8aDfvA250bRkDwWtWP1E31zoeQQskPCFFlV80=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo+N7zFojMX/BJEyWXQEVvBwAs+QrpxzbRZ4sCS
 S6vT+Y3XUmJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaPje8wAKCRARpy6gFHHX
 chnbD/9x7bQ8Smn8kXxfRUM+Av0UqOltSsg5IHmwdwaFhelxZoEKxAW4y7xOeqnJuV+eeCClxKb
 16JfuXEeIEndR6YIqL64BAZYIVIflSMcE7xQrvMGnxVW2MS77PxNSWHiRF0SeV2n3rkJICh4x4J
 qAOUCwavkRU1hkUv1gfoU5b2r3CbNx54Xta0tsdRzIFaCvYKjtWxawJ7RcZG5dACKQkuavLnYAc
 nNhswWH79fLH9WjflU41HROZIfilLXJvUVjUyDR8hXc3Ak1h9ncCmf4FnrKT8rWAReOtphdzBiJ
 qZyA8eehsBO/O5YgXCdfXsAYcdrLG2x43SRFZs571L9lg1OvtD9E5Nk2TDuZb58bJ5g2qYEjvmS
 KkfT4D9WtRo2qAU8bAJFoSf9zraP7hSU9tzpdDzOgMnwdDSZmsHnn4t1+rHYZVmu6Y0tixGjWZA
 RChXWF7OlEFwYwEcl4ngYsjMpK2GszKm86MVW/u0tux7xVM9q5muEnAhLQzVLFAqoLsv2jjXCfS
 DKPC8DXRLPGLqtqBso+edgydbFLfXn5yvaU0pfd0sTjfvwA7DSE3c96gHnT1bO/OfTcUQX7HHSJ
 LMwE2YxMUL5h6hCSEQO3G7TqOcAWT7BMNFfy+55MDdHrl4Q/YVh9RlHy3xa9n5Po1PSGTn7CEN9
 zuWBn1MMVQV6hIQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Use the recommended macros for creating references to software and
firmware nodes attached to GPIO providers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 include/linux/gpio/property.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/linux/gpio/property.h b/include/linux/gpio/property.h
index 0d220930800276a21b5ba96a68371ce66fc4ae3e..6b1c2ed9c57594bf3ead5edc82439f9fb7f514fd 100644
--- a/include/linux/gpio/property.h
+++ b/include/linux/gpio/property.h
@@ -7,7 +7,10 @@
 struct software_node;
 
 #define PROPERTY_ENTRY_GPIO(_name_, _chip_node_, _idx_, _flags_) \
-	PROPERTY_ENTRY_REF(_name_, _chip_node_, _idx_, _flags_)
+	PROPERTY_ENTRY_REF_SWNODE(_name_, _chip_node_, _idx_, _flags_)
+
+#define PROPERTY_ENTRY_GPIO_FWNODE(_name_, _chip_node_, _idx_, _flags_) \
+	PROPERTY_ENTRY_REF_FWNODE(_name_, _chip_node_, _idx_, _flags_)
 
 extern const struct software_node swnode_gpio_undefined;
 

-- 
2.48.1


