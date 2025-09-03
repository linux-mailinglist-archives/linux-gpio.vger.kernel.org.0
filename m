Return-Path: <linux-gpio+bounces-25508-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE56DB4205B
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 15:06:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 029691BA8047
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 13:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FB9A302759;
	Wed,  3 Sep 2025 13:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="VITZzmvp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F93302750
	for <linux-gpio@vger.kernel.org>; Wed,  3 Sep 2025 13:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756904536; cv=none; b=eB3hy/8HDKZ1NWQYA9F6qCW6BFI6A22+F4A8NXBlJi34vYHrnRQ3+AwxcMjk4usKuu+9MQEo6lRqCa0EGVUQSeX19STm3xsbV4kA8HJiCSIyTeu716GRfBTclAluUuX4YqxY1w07ZjDDeqCQh8pIBRWeiwyP6W5A/IY5V9rb1zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756904536; c=relaxed/simple;
	bh=ganKbk1Ucu7R1KDmnDBxbzqCBbvu9PvxXzU6Smr584o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XJyPUuGFjsLo55lAxoSIhFdvqVDQlVFCT42acoOLIu24y10xiUeaG7s8iV9HuUmLCLiwlKpPpE8GXWVUqSdlmHuoOV7Ge1sbS6BKn2Ndpau3GBwnsd0WWcPc9f4di7vwc8S0qexLnF1WfNpwm4KZTv9HdSXej883C6UfMbODzJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=VITZzmvp; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45b86157e18so23829915e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 03 Sep 2025 06:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756904532; x=1757509332; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rYtTEFkfzT5wJ5MIddoVs7kCetsttbenrnjRAQnW2XI=;
        b=VITZzmvpWN1jL5BBYFcjmGiQKvzXT2NmuCZLxTbqRFIY5t7HIXszMVHvjbuHbnqbzb
         claGZemXoDlmLX37xp50YySaPS8f1OdzI1Z2XR3x1I1qXN/njT9Qn5/kLub4Xn5he/ZF
         7XI4SnulYuHayVXOABE1gLI5NenzXpNLc9DTIe5d2b5r+YCZ7Ki3LtvxvEW6PDvOXla8
         sXGKuN6XfEmt6emmhNdb0rg8ykFKd/TlwvVBEJ97x3RBPxD3+5ODb1w0beY6KE9GX5Zp
         MLJmRIzxtVqJ3REt7E0QereTxZI86fBOVsF2FgpYTQbHYy6nvNUQxV8y7mDE+GQd538i
         Rhmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756904532; x=1757509332;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rYtTEFkfzT5wJ5MIddoVs7kCetsttbenrnjRAQnW2XI=;
        b=HMbNCA0BbKiJLf2mFU9HrHCQYNMVtiF39rlQKyF/wFVFivzttii6a4T/z1U7k+AwbV
         WF0snf+XFTyATgTmDJJ/oZzO4iG0Libzb9n4ouIP3kx4fK4ZKsqnrk9fRhFomWLoj1U9
         ql8qBI1si5QLXfThlQNZCAHggoKwZdDJf13H5W58kqw9Ay6qR7/od5/E0sWdlPNVRWVW
         KjRo6SbQNnN6UB21a8s2OjzXHM8C74ArxDl16z7pE1yP1huI1XaPckgyZk5SyuydfHLV
         B4XO9kyf3fuXVLu4Ie43nd1xJqPJrOtNSJAQV0J2Er6deBMUGxoMsbqoj1tfRXmslsYo
         lhWA==
X-Gm-Message-State: AOJu0Yzae9X9De+3jKGitSvSBxbcz2iYdNItDp4CXVzp0M+b0b/ceuWy
	vgDKrK98efzqAJcQiEngV7su2tjoRLp5n9h01Y7GLLXPw2sjbmyZOtqpbN57dXqOqUE=
X-Gm-Gg: ASbGnctPouayD52qSl4s4M2jBwhN7mz4wB7P/7vdYx05ZTi/ppLbWb9CbBtvSHVJ2aI
	F0O4konwWowOiTCXqav0VSW4PyFCrMZvGdduswndDXrqNVDhYafE4b25JT/cCG11+9DvvaAcQFi
	bC2brBsU0mK9aBGWo7VlriYk40rRubBVvmIduEaoF8Fn4Knw4DhICHz+wxRByWPvXai41rVPAGn
	bRAx/tTTvqETjKeSseHKHm0mDPNp09nTq+q8JoCVerdZzxfNOeqt3jaPKT64FNY9gsTR2N65wGa
	hRh3GdRNEKukEkmqEmKY1BLazL8zCRciGedyl60wd8naFBETCBIdG5TGKBShqlfzvGP4b7ZA208
	3/oHccQGssnzDXaGT
X-Google-Smtp-Source: AGHT+IE/jT5+1sDd9vCryN/o5xZH2KdnZSOBShlSltPuxubnvdyJEHgJpLxX5aADB9F7bPgVxEaW5w==
X-Received: by 2002:a05:600c:4705:b0:45b:74fc:d6ec with SMTP id 5b1f17b1804b1-45b8553f1e8mr137521785e9.8.1756904531598;
        Wed, 03 Sep 2025 06:02:11 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2f8b:4799:6bd6:35df])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d6cf485eb7sm13280178f8f.3.2025.09.03.06.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 06:02:11 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 03 Sep 2025 15:02:04 +0200
Subject: [PATCH libgpiod 6/7] dbus: manager: display C API *and* libgpiod
 package version for '-v'
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-api-version-detach-v1-6-027ca5928518@linaro.org>
References: <20250903-api-version-detach-v1-0-027ca5928518@linaro.org>
In-Reply-To: <20250903-api-version-detach-v1-0-027ca5928518@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Kent Gibson <warthog618@gmail.com>, Vincent Fazio <vfazio@xes-inc.com>, 
 Erik Wierich <erik@riscstar.com>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1053;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=yvd9dfv3QXQ/Hnu8GnRaxVhhcY7aF2Q/TtTqFQQUG/8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBouDxMGQ1zLQiGwjrfM71i3433UZA+hHl2JTI6x
 gheUyN7speJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLg8TAAKCRARpy6gFHHX
 cp71D/wLn2bKU+xfm+5ZG1J48cAqOukmDXkcmKt57YT7+xa2m5fcziu8LnqtOvU//d87LVeFT1p
 rxSMf4dlnvAHuF1hlkWalXsOmXxVJtlBSq/w9eNhFRiX/2itvl1aR+MVXCJBe+A2h7S91m7oqQB
 paLdN0btFzi1HcEle1tX5I18mMT7Ut1+RyjjYJCcTY0Kb8Bi7e+uN1gChuH0uG68tso2j4/ydof
 R7EoYSMPIW5iPxntthZph294W9903MdtG6wzD9qao5TxkusHPveC6NDWZrLCMEls90VS43wxhkO
 JKqIKJUlKlHMbKQU7NYVgRnAfBmJkYJKJcmYpAlvUAhsZfzFhXPumdprulo+Gdqc7jnGh5N9962
 lfgo7L7m31hmWUKKiXs2JylFCG3mDA987Mwkpb0qHa5U2/4oZt0gDgvpwfqQTfzPtfu0f4FLH+N
 5DfI35u/FJUgJI8chegyVMRa89jmjbvcyNeLIADZxezCYOAZyVCp8iE7EsXqdEkz/+Q5IqgFvmP
 1Ose2qn4ZhrcRro+BGJneAV8JtbnKX0vdkLF3mPkfuQ/A65Q5JAtlqV3Zy5nUCvEjWEmK6DFcNn
 fzK8rUt3KXOw2EHfwK65agCUdSVFnT+pNIMmyoJneMdZz/TzOkbTsjjddNV9kLq8j+Xu2b+Kp7j
 U34a/ctWt0R/Syw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

With the recent changes to the versioning scheme and the disassociation
of the core C API from the libgpiod package version, it now makes sense
to display both in the output of 'gpio-manager --version'.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 dbus/manager/gpio-manager.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/dbus/manager/gpio-manager.c b/dbus/manager/gpio-manager.c
index 03ca7ab828e4f7ca57ca992f244a0c0afeb5b6a9..3aaf1c9f5480645382d35a11e790faa806de66b5 100644
--- a/dbus/manager/gpio-manager.c
+++ b/dbus/manager/gpio-manager.c
@@ -77,8 +77,9 @@ static void on_name_lost(GDBusConnection *con,
 
 static void print_version_and_exit(void)
 {
-	g_print("%s (libgpiod) v%s\nD-Bus API version: %d\n",
-		g_get_prgname(), gpiodglib_api_version(), GPIODBUS_API_VERSION);
+	g_print("%s v%s (libgpiod v%s)\nD-Bus API version: %d\n",
+		g_get_prgname(), GPIOD_VERSION_STR,
+		gpiodglib_api_version(), GPIODBUS_API_VERSION);
 
 	exit(EXIT_SUCCESS);
 }

-- 
2.48.1


