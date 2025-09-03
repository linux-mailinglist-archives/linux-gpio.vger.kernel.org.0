Return-Path: <linux-gpio+bounces-25504-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 87884B4205A
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 15:06:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E757018968DD
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 13:07:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6E1930274B;
	Wed,  3 Sep 2025 13:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="rkUrGw+c"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A709530BF54
	for <linux-gpio@vger.kernel.org>; Wed,  3 Sep 2025 13:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756904531; cv=none; b=JtvxuDaWrML8iktZKnQaGe9TESMIhlGtAbl9Ut7ih0F5aAmAAeCAiM+RvJx7dwEbkBa0JWd9unVePH1g5k4sJGGFLanq1WnV1i8SteORyFLmME2WlWkmSyUDE+JxTYeUxea5UGbOVude6INteXtoIQQvy+ljB8OcqJ2t4X98wc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756904531; c=relaxed/simple;
	bh=Sx4V5EDb1oNmjKlLaZ5yADXO7lJhBdC03qug4rW6YCI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fvdJwaPsqpXUKDO/aAlBwl0RUdNGYW5O2K7IvbsVjtU2MqLibdHz5IEJjhMs+bMvNHYCohBHZmb6lHOSvgHzNy+tykqND0Z8VNIPBV+iv6Yb/PZ1yYlzhyAvuLV4Q9+i9FHBEFcRDSW783AVFXm5z3oyhh7GlDUmBYsAUURTW6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=rkUrGw+c; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45cb6d8f42cso3936325e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 03 Sep 2025 06:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756904528; x=1757509328; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=umqr2w90FQrFg9KtDsVcfq/NxP6zMk+HYGGlgGQqrrU=;
        b=rkUrGw+cCgY1BTP4oXJ9U69MGAQXcfYEnoHFQA3scy3E8T6cAKHu/FNY0MUSAJbMgI
         uQ6f+S1A0N8WVx1/efhgeeMUgHksHk1oxZthd6YAJ1S3JnCLAH+laMYEy1QiGoG21CNu
         5OslJuYcnKfw9d0CVqPaAGXjehSRrY7eq2H55QFU36w+WzusJ8fsgklz6Jw8oZsGHvn3
         JiMuIjICIpL+ExxkBEKuyIWxwXVbrR54W244zvvEystXeJ+XOsjdP+C0pxUx8pgp0k2S
         c0uClsBiX2x0U9exVGMn5cKk61ax4K+0gMAfCCzyjtLf4OhpnIQMfz4/SOjAATMiu1ng
         TtKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756904528; x=1757509328;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=umqr2w90FQrFg9KtDsVcfq/NxP6zMk+HYGGlgGQqrrU=;
        b=Aes4ZWUyJ6/zJC/VSQ1GVdL7jIbUxVDnpOyXo2eF2nOeaKdfrLleYtlvxEqzkpgvbe
         01/+ZrmQR+z7BfqT8DXsBshIoddD9/+OdEYIhKl60fWQadwJlEabVwBTzW2y88V46rZ9
         3f4Cb67i3k6mXwBiAaMAz/5becQ+jLtUmzJqSDV0Mtb+vHNJYi6CGi/U+JlvIwjf9g+p
         6/VIFXIfmRKWG2a+3f041ICwA7tjyMYzzt2PBUdDGu1sw0OXol9o9F0sKklVcYw/vQe4
         A1oQ5ZtiGGZ0T3H/D5TPUBQ0SlHI05PJd5uyKi297IThQzjHlENxxATXOgIjyKbqV304
         ILkQ==
X-Gm-Message-State: AOJu0YyfQS/rge+IH57cI/9tgHJl2+S05/eZacAhwjmrlbpTo7S6Y7yR
	RYyWjnnSLO2ky5asX+cAad2E+2JKIcxPb/l7nyv2xqU0BG6ZVX6gU6jB0y8Cz26EObM=
X-Gm-Gg: ASbGncuddTyECCyNQ7lcymob+Ky6RcHbqa90Ea3Wf998mENf6Z1NQrFcTuix1lQIe53
	flXC+ePu+frNOJY6DU8eWQGh2vYTpaaOZXjQgHvefb/QvQUWRjadcL4AlTkwE2OZJtRRuRPPO+a
	hRl4rSwKEEBdksTeTZgQ9ZLjom8klwTHe5ZGJRoR4BjDi0S2KEkFOxoblqpB95iytZgS0hoUtd+
	meQ72ShnYuucNhs6MRXKH0mzhk7ZX0qpHMXIJmClG1ozhcimwSKQ628bmuOG2S7hTY+x/RH5X9W
	mYxpbLZ79vuqUigTecCeMJZ8jYq0BQMrmKnEnOg0yYlvoLLBW4szclL+g3mvS9of/h+2oo1s385
	emUHCQMT465UHSp0XzH8D3TpElkM=
X-Google-Smtp-Source: AGHT+IG+2MVZfNKVag/5Whu2ew2RatT+77VwXYR7uPfEv32tc2gHgEc42ewUDM7o2+Y9DgnAsxHelw==
X-Received: by 2002:a05:600c:3ba2:b0:45c:b5ff:8252 with SMTP id 5b1f17b1804b1-45cb5ff838bmr17001855e9.25.1756904527720;
        Wed, 03 Sep 2025 06:02:07 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2f8b:4799:6bd6:35df])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d6cf485eb7sm13280178f8f.3.2025.09.03.06.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 06:02:06 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 03 Sep 2025 15:02:00 +0200
Subject: [PATCH libgpiod 2/7] build: define a separate API version for the
 core C library
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-api-version-detach-v1-2-027ca5928518@linaro.org>
References: <20250903-api-version-detach-v1-0-027ca5928518@linaro.org>
In-Reply-To: <20250903-api-version-detach-v1-0-027ca5928518@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Kent Gibson <warthog618@gmail.com>, Vincent Fazio <vfazio@xes-inc.com>, 
 Erik Wierich <erik@riscstar.com>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1381;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=VoW8hLdR5ii07NSIecwfiJtW4yfCWQQtIJOlBhQee7Q=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBouDxLS2bz9kcqD+J3QxMGQq+6l5UAGy2y3yAOV
 LwZ1aMua9+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLg8SwAKCRARpy6gFHHX
 cj7iD/9OcZmRiVBvE9f4dHLVGNyFupL5UPFZLuRyx69Qa/MUQyGQyYVe3rCdzJTU56zLhoGIm3N
 nfbRgxa4laPtQdejIju+NduJwVOWBSJmeuARRJ1DJG50WwdTeAMZLOT/LH5uolEKYshR4pdqV6C
 s6kz3G6nYaVx+CPmz5NMNCON/WkZflh7rKdmJ3a155ZVRpj5fjekENdiEYNkt4coQKpmse6PuDW
 aYkCTKkkz02Zk23VKl2sZDLg8PtVuLWGAXa5VreHHmzuKCZBdC0yVnVLiu7A44P1ZFEZrFUUnKA
 xw8IyKU0otwZV96h8LRRfhnxD4PyHJN/eTQvkN135afqdhO7QfL/rg1fa2heIdEL1Tb1CH677xb
 ZzJ0SfmJFX4DyhGLf6dhOXoXGShajWMduoLmr1mpLaalOecGbCnCDc7A0pkxSRtFMrGC5eaYqyP
 lmkXEIPNJY6vKvWOUkHT7t+vyieWF4YQHHemZGauV4/UzSTN2D2+s8EiAFWFpZ+N5bJavSjvMVH
 hLbpw9RjWAeDTLsobauwNoOiCJ6Tom5zFfbeNBRhIP3QxP0j/4s/1z8LMP7dccQnTH2GeU/6SlN
 RdmLmoH4qAIo/N+U7g/JqUilZDEEwQwe1d/XPrmUeivm+rCnhH8sA1P3HCB8QJaMeJGyUWDqVeA
 HuuMfjLpPZUVXXA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The core C API of libgpiod has become quite stable and unlikely to
change soon. We will still be adding some new features to the included
programs and some of the bindings (notably: Python and Rust) but it
doesn't make sense to bump the C API which hasn't changed, just becuase
we're doing a minor release of the larger package.

Define a separate libgpiod C API version in configure.ac. This will
affect the C, C++ and GLib APIs as the latter two track the C API
closely. Rust and Python bindings already have their own API versions.

Set the API version to v2.2.0 as it hasn't changed in the libgpiod v2.3
release cycle yet.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 configure.ac | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/configure.ac b/configure.ac
index fe9673904c5ffcda2c7aa6783b28a93793a01c0c..4d4996053dafcbf95c60ba1396910fec4826ad7e 100644
--- a/configure.ac
+++ b/configure.ac
@@ -35,6 +35,10 @@ AC_SUBST(ABI_GPIOSIM_VERSION, [1.1.0])
 # ... and another one for GLib bindings:
 AC_SUBST(ABI_GLIB_VERSION, [1.0.0])
 
+# Core libgpiod API version.
+AC_SUBST(API_VERSION, [2.2.0])
+AC_DEFINE_UNQUOTED([GPIOD_API_VERSION_STR], ["$API_VERSION"], [Library API version string.])
+
 AC_CONFIG_AUX_DIR([autostuff])
 AC_CONFIG_MACRO_DIRS([m4])
 AM_INIT_AUTOMAKE([foreign subdir-objects])

-- 
2.48.1


