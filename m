Return-Path: <linux-gpio+bounces-24083-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D111AB1EB90
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Aug 2025 17:21:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 046011894889
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Aug 2025 15:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD90D283C82;
	Fri,  8 Aug 2025 15:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B4vEHyt7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DAF283141;
	Fri,  8 Aug 2025 15:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754666410; cv=none; b=KeBXQXs0OaMgN1p2R8uzCwJbGGARu+y2C2lxVsjqlvF8Uv3za8T963uJ/KfS9SSR5yarajbHhS4QYhE12+0AJscJ2o04cauNj4RmfQTpu9NmQgx7jlWXipmuiIV5N58ZoZ0ajWeURrBmQZlYju7G0roULX5kUsFHyNqHyYASPZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754666410; c=relaxed/simple;
	bh=75ld2ewRILgYi943fpVictpUlkWQ9Vf7v7jfrpBO0yM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nd274kYolAVH9HAy/QRoSCquYiSE6O/WhNDW5+pNf2L7ceLGf0gepZhccgwTft5W4uWAkpJNkInY1RiP4ahxXiTrtlQq6rkQPt36vmDPKqf8Jg5WO5y3njtW7L7MviiE5oH998NwYBcH9ZLHgPdWQRBq/m+JwoPKBghDAQ+7X9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B4vEHyt7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C02DC4CEED;
	Fri,  8 Aug 2025 15:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754666410;
	bh=75ld2ewRILgYi943fpVictpUlkWQ9Vf7v7jfrpBO0yM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B4vEHyt7o58FJApQEXnLFlvpHynRZE+9UHEGodhKsxWL6CQxpEf39Y/jwvS2vqXm/
	 fvjGnMMpz0xIGaL9xQFUR/GVBYqYpeJzleKOqj7ObIE/Q6LRh2qyoBinsptmrdMk6Q
	 B+8m478ojXCmAVtY/OGnNFVU1dvduSNvz6bSu7qz6zkwB22nnYMntwnnmBmQ3XBmAM
	 xaF8GWN3KXSrRtX3wV0xzmqgx/iUQqIPlvLIX+CdXyt7OzlxPxwBUSTKUTzfuVHP6M
	 1Io1Y2/qghst3i7zFGL7Ldyv+ldAAV0k4m0mPXXlANxkb2wi2YtCiAdyv1atKc9jsJ
	 XRNnuMlGWb/vw==
From: Arnd Bergmann <arnd@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Steven Rostedt <rostedt@goodmis.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Dave Vasilevsky <dave@vasilevsky.ca>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/21] sh: select legacy gpiolib interface
Date: Fri,  8 Aug 2025 17:17:48 +0200
Message-Id: <20250808151822.536879-5-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250808151822.536879-1-arnd@kernel.org>
References: <20250808151822.536879-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Many board files on sh reference the legacy gpiolib interfaces that
are becoming optional. To ensure the boards can keep building, select
CONFIG_GPIOLIB_LEGACY on each of the boards that have one of the
hardcoded calls.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/sh/Kconfig                        | 1 +
 arch/sh/boards/Kconfig                 | 8 ++++++++
 arch/sh/boards/mach-highlander/Kconfig | 1 +
 arch/sh/boards/mach-rsk/Kconfig        | 3 +++
 4 files changed, 13 insertions(+)

diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
index d5795067befa..d60f1d5a94c0 100644
--- a/arch/sh/Kconfig
+++ b/arch/sh/Kconfig
@@ -462,6 +462,7 @@ config CPU_SUBTYPE_SHX3
 	select CPU_SHX3
 	select GENERIC_CLOCKEVENTS_BROADCAST if SMP
 	select GPIOLIB
+	select GPIOLIB_LEGACY
 	select PINCTRL
 
 # SH4AL-DSP Processor Support
diff --git a/arch/sh/boards/Kconfig b/arch/sh/boards/Kconfig
index 1af93be61b1f..d89b74177233 100644
--- a/arch/sh/boards/Kconfig
+++ b/arch/sh/boards/Kconfig
@@ -80,6 +80,7 @@ config SH_7724_SOLUTION_ENGINE
 	select SOLUTION_ENGINE
 	depends on CPU_SUBTYPE_SH7724
 	select GPIOLIB
+	select GPIOLIB_LEGACY
 	select REGULATOR_FIXED_VOLTAGE if REGULATOR
 	imply SND_SOC_AK4642 if SND_SIMPLE_CARD
 	help
@@ -199,6 +200,7 @@ config SH_SH7757LCR
 	bool "SH7757LCR"
 	depends on CPU_SUBTYPE_SH7757
 	select GPIOLIB
+	select GPIOLIB_LEGACY
 	select REGULATOR_FIXED_VOLTAGE if REGULATOR
 
 config SH_SH7785LCR
@@ -226,6 +228,7 @@ config SH_URQUELL
 	bool "Urquell"
 	depends on CPU_SUBTYPE_SH7786
 	select GPIOLIB
+	select GPIOLIB_LEGACY
 	select HAVE_PCI
 	select NO_IOPORT_MAP if !PCI
 
@@ -233,6 +236,7 @@ config SH_MIGOR
 	bool "Migo-R"
 	depends on CPU_SUBTYPE_SH7722
 	select GPIOLIB
+	select GPIOLIB_LEGACY
 	select REGULATOR_FIXED_VOLTAGE if REGULATOR
 	help
 	  Select Migo-R if configuring for the SH7722 Migo-R platform
@@ -242,6 +246,7 @@ config SH_AP325RXA
 	bool "AP-325RXA"
 	depends on CPU_SUBTYPE_SH7723
 	select GPIOLIB
+	select GPIOLIB_LEGACY
 	select REGULATOR_FIXED_VOLTAGE if REGULATOR
 	help
 	  Renesas "AP-325RXA" support.
@@ -251,6 +256,7 @@ config SH_KFR2R09
 	bool "KFR2R09"
 	depends on CPU_SUBTYPE_SH7724
 	select GPIOLIB
+	select GPIOLIB_LEGACY
 	select REGULATOR_FIXED_VOLTAGE if REGULATOR
 	help
 	  "Kit For R2R for 2009" support.
@@ -259,6 +265,7 @@ config SH_ECOVEC
 	bool "EcoVec"
 	depends on CPU_SUBTYPE_SH7724
 	select GPIOLIB
+	select GPIOLIB_LEGACY
 	select REGULATOR_FIXED_VOLTAGE if REGULATOR
 	imply SND_SOC_DA7210 if SND_SIMPLE_CARD
 	help
@@ -329,6 +336,7 @@ config SH_MAGIC_PANEL_R2
 	bool "Magic Panel R2"
 	depends on CPU_SUBTYPE_SH7720
 	select GPIOLIB
+	select GPIOLIB_LEGACY
 	select REGULATOR_FIXED_VOLTAGE if REGULATOR
 	help
 	  Select Magic Panel R2 if configuring for Magic Panel R2.
diff --git a/arch/sh/boards/mach-highlander/Kconfig b/arch/sh/boards/mach-highlander/Kconfig
index b0abd03cac4e..cd3a553ce30c 100644
--- a/arch/sh/boards/mach-highlander/Kconfig
+++ b/arch/sh/boards/mach-highlander/Kconfig
@@ -20,6 +20,7 @@ config SH_R7785RP
 	bool "R7785RP board support"
 	depends on CPU_SUBTYPE_SH7785
 	select GPIOLIB
+	select GPIOLIB_LEGACY
 
 endchoice
 
diff --git a/arch/sh/boards/mach-rsk/Kconfig b/arch/sh/boards/mach-rsk/Kconfig
index f0299bc4416f..3810937aa5d4 100644
--- a/arch/sh/boards/mach-rsk/Kconfig
+++ b/arch/sh/boards/mach-rsk/Kconfig
@@ -12,16 +12,19 @@ config SH_RSK7201
 config SH_RSK7203
 	bool "RSK7203"
 	select GPIOLIB
+	select GPIOLIB_LEGACY
 	depends on CPU_SUBTYPE_SH7203
 
 config SH_RSK7264
 	bool "RSK2+SH7264"
 	select GPIOLIB
+	select GPIOLIB_LEGACY
 	depends on CPU_SUBTYPE_SH7264
 
 config SH_RSK7269
 	bool "RSK2+SH7269"
 	select GPIOLIB
+	select GPIOLIB_LEGACY
 	depends on CPU_SUBTYPE_SH7269
 
 endchoice
-- 
2.39.5


