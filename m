Return-Path: <linux-gpio+bounces-15449-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B714A2A85F
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 13:22:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B2851888F54
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 12:22:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1245D22D4FA;
	Thu,  6 Feb 2025 12:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="gjqZnT6B"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DCD22D4E1
	for <linux-gpio@vger.kernel.org>; Thu,  6 Feb 2025 12:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738844543; cv=none; b=U/OKE6RG0S2Y30kESUkbhy+ichewhc9aD0AvVXsK2WYELKUr0Vk9oZz5G4ullM04fzPsMF+FT6OVxLRq14x40RL5vWsKd4xVmkb7i6dumSsTuQmSy1RK1smJWszhbvHxU32mDx7Wr9rT5SoF28NU0uaWqZvYIS03dB4FJSS+kC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738844543; c=relaxed/simple;
	bh=CAkwPFpseBA3z7f71zA6/63ooE7+6yUcVDOhZIH/1P4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pkQ4xW8z1Re2ZqU2R6SFWmI1UkTkVH/d8934YZFklkFyuIaMpiqaCQ/5n0/S9K4tphYlPLwj6GI6nvunQauYE7tjo4+o4utIsQzZneNvj8g0FAR2xP58AdWG1KxhT4s5Q4R3zr8c8hRnsDI56wzvCmy4D78r05tGTn28voOVGWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=gjqZnT6B; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-436281c8a38so5539925e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 06 Feb 2025 04:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738844540; x=1739449340; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7R9YlqSLEOyBIptzx/BK0WNp0zHju9zqil6azG9zE4I=;
        b=gjqZnT6B6hSzhPTH7Q4uQ6ioxtbmlTlWvPnuCRw1TBicqwsW6utrsNol4aAibBP15Z
         vH8m3d7l+y31uu+5JUGEnWFazLXPBcbaXLYXmPKmLAXdf77qSZUXwRPFxQASEtnvNBf8
         f6yybgawRmiqzd4SUUchNTnTtz2/phbkJ2UAxfCJlf9QjBghf4DKPWCryDWPz5Qo8YO8
         vZFvmDXk4qs50fV2tBPue74R7G1mOHHMsjdzfGHW7+XVDG413Q7CAT6yE7KQQ25NbfBu
         42gHCE3mBMNwn78fb910KPWRMziND2nr7KahT89MJjbTEQI3mDTuNV44iocaqAf66F8a
         dhqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738844540; x=1739449340;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7R9YlqSLEOyBIptzx/BK0WNp0zHju9zqil6azG9zE4I=;
        b=MtdIiQaogqAgqmEti7LNkybdDflbS6qDh0NhZeLml7jOUN6OY8bPVjCDgQFnuywIgH
         AN1RHg6N2NzWfWQZexa40YkRy3Te0VGG0bOce+srxL3pr7XYXdsq9oGp/C07vj0gJ7Ph
         nxM8KKGWKpof7iXUxj/FUoS1kqCBK7UL4qzrRM8uqDRRe73WFvr28HdHNVJ/v+8AtiaT
         +qxj72V8lNVfmr1atZfkGqByJr455KAYce+tpnXVMkadcH8zBjUGrLbaw5h9glVVtvr6
         A553KG1mOeWfJ1x6f0UnWfOZfKZP9JA+YiQMJKd2CjrzGzTu0moM71/cMt2gjXCwJvYu
         AfTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGuZqYod+ebQx+xoGfGiMxDRHNeRjBHT3Fl9JsMlC6jH5IioRVHufLBJX8ulWqENy6/6ME5TntmVVy@vger.kernel.org
X-Gm-Message-State: AOJu0YzjEfdjq3mo3hY7eoA+AI/8jpUET/rVKgTw02PjHfLBxVPT7Lsr
	rq5tMWPXzAgtVBh/z0CTEIcbvZqxY6nt1lNPAxSaMflY+wydTbr6Z9+2a6UuliM=
X-Gm-Gg: ASbGncuSly/zf1SuBEDMUelTC7/AqOSSpki+f/soYbMuIORIQXefZs5JAySEHUGgTw0
	DHZzN8Co+58r5BEeg0vsDdShP+Tzva9WsiH314bDO+ljtjYk6nKD/qe9CUdw4Wy23jFJ5mL4ZoA
	XXX+Be8/lV3N09A9f2YhpgWaSbh9M+1q2zNNeW72/+3NHpGAYtbGLK7RZvyrrPsUKc7Ek6MUeVS
	OfgRqaQMTZ8+kwb/rnJicAMEUFnZPsENRKN4nauZ8kL6un3iyTNRgnS09EfdVg+YzBE17pFxY+A
	yH6tTQ==
X-Google-Smtp-Source: AGHT+IFt2sXTId+sDdmqiODOQ4lfYFAcZV/J+RIsBBKuHGrOww3a1NncB9GOIJyLmgNjM90nVWVk3g==
X-Received: by 2002:a05:600c:1e02:b0:434:faa9:5266 with SMTP id 5b1f17b1804b1-4390d43d1bfmr53802535e9.13.1738844540561;
        Thu, 06 Feb 2025 04:22:20 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c726:a8e:825:b823])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dfd7d7asm17366775e9.36.2025.02.06.04.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 04:22:20 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 06 Feb 2025 13:22:03 +0100
Subject: [PATCH libgpiod v3 06/16] bindings: glib: add the configuration
 file for gi-docgen
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-improve-docs-v3-6-2065191fff6f@linaro.org>
References: <20250206-improve-docs-v3-0-2065191fff6f@linaro.org>
In-Reply-To: <20250206-improve-docs-v3-0-2065191fff6f@linaro.org>
To: Vincent Fazio <vfazio@xes-inc.com>, Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Phil Howard <phil@gadgetoid.com>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2092;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=K/5KnBgwiq3Wbij50B7/aTbCG36deEQw4ZueYnmYsmA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnpKlyWaJylLuwUtSpKyBddEkCH3auBBrpxWxXa
 eS89Cbn/WmJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ6SpcgAKCRARpy6gFHHX
 cgopEACcm6vorKRY0025340FihqZQ1XCsnV+IDYeXPwpaCfovCkBISnnPSG36f8yEH1/Mrx07Uo
 PJIj31eSCqP1l9HimyMf4NQOVRetb9YKUWWvq9hQk8lYJ5N60YIJZUqDTm9dPyD77td3cHaW4ub
 MMc6qCNHQTzeNfra7StyLPgjkkq5IzYqBQn/U/ve/+Icczoe7+0xWDvAv6NtCL/kryLNvybHoCm
 2J8gwusBd/L3sExlG64kUs0KoGBlilgel7EW8bGQVxA1hJ6Ft4ciRjQO0iY73GoVP74b0SGsR+G
 rHnw/rcQs6/bPIVIE6gk+LSNAd59EDT1MgP5LNiqUkFHaMVtzayTjD/4r5qYxkU5yRx5xwHTDOC
 vfeROzqKvqMCF0SVA5qNOeAFjlcK0v6y+I1RKOhLF4F5NqjK1DHl51bAVvZPTiWoNY8ZUV7vSfx
 /616c67hlZCkJXzNyLNvpc1lTaDU6xjSWhscKFVbwuaV5mQcQxrmm9Ubw5P3b84AaeYLGHjV1iK
 gxkwvlj3uvCBXZpdP+0YDDhTlSibMcsMcnFcO3SBKi3/apiLG70L5OztKYFbEOPT2LUBwYOlgzz
 hOAbUqkZNw4lPz/e9Ou55HAMgZ5+Bd4KGD/z4y3Qww0E62L0l7fezE/9arezAD71/F33S/UeT3e
 t8gN3GUvQzpJ1HQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Without the gi-docgen configuration file, the GObject docs don't
contain information such as library version, author, license, etc. Add a
simple .toml to add missing bits and update the command in Makefile.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/glib/.gitignore        | 1 +
 bindings/glib/Makefile.am       | 6 ++++--
 bindings/glib/gi-docgen.toml.in | 9 +++++++++
 configure.ac                    | 1 +
 4 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/bindings/glib/.gitignore b/bindings/glib/.gitignore
index aa399b8..5d6fe20 100644
--- a/bindings/glib/.gitignore
+++ b/bindings/glib/.gitignore
@@ -4,3 +4,4 @@
 *.gir
 *.typelib
 Gpiodglib-1.0
+gi-docgen.toml
diff --git a/bindings/glib/Makefile.am b/bindings/glib/Makefile.am
index 6ecef94..f0241e8 100644
--- a/bindings/glib/Makefile.am
+++ b/bindings/glib/Makefile.am
@@ -124,8 +124,10 @@ endif
 
 if HAS_GI_DOCGEN
 
-doc: Gpiodglib-1.0.gir
-	$(AM_V_GEN)gi-docgen generate Gpiodglib-1.0.gir
+doc: Gpiodglib-1.0.gir gi-docgen.toml
+	$(AM_V_GEN)gi-docgen generate --config gi-docgen.toml Gpiodglib-1.0.gir
 .PHONY: doc
 
+EXTRA_DIST += gi-docgen.toml
+
 endif
diff --git a/bindings/glib/gi-docgen.toml.in b/bindings/glib/gi-docgen.toml.in
new file mode 100644
index 0000000..5550a31
--- /dev/null
+++ b/bindings/glib/gi-docgen.toml.in
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: CC0-1.0
+# SPDX-FileCopyrightText: 2025 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+[library]
+description = "GObject bindings to libgpiod"
+version = "@PACKAGE_VERSION@"
+authors = "Bartosz Golaszewski"
+license = "LGPL-2.1-or-later"
+website_url = "@PACKAGE_URL@"
diff --git a/configure.ac b/configure.ac
index 34de870..5a7e01c 100644
--- a/configure.ac
+++ b/configure.ac
@@ -307,6 +307,7 @@ then
 	fi
 fi
 AM_CONDITIONAL([HAS_GI_DOCGEN], [test "x$has_gi_docgen" = xtrue])
+AM_COND_IF([HAS_GI_DOCGEN], [AC_CONFIG_FILES([bindings/glib/gi-docgen.toml])])
 
 # GObject-introspection
 found_introspection=no

-- 
2.45.2


