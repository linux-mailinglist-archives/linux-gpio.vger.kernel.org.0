Return-Path: <linux-gpio+bounces-28771-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D46C5C6F9A7
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 16:17:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D6A9A3A329F
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 15:01:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34F97288C3F;
	Wed, 19 Nov 2025 15:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="icaJvE12"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFFDE28727E;
	Wed, 19 Nov 2025 15:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763564483; cv=none; b=BuR4EKb9SIaB7DMww/MTZg6cZ4Mjtu5ZXTKNhLYlmhvRXCTBc6Ay5k9MB2CrDK8c9c+C3bKjKgk90VjwodO3JSUxmec1Ki4I9ynnmOEb43P8m1wfsBfRL+sX1JbqVP5MoVG2sqkbTKAq3E+38VxOYIruYC/WSF9UdzFfoTyRjH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763564483; c=relaxed/simple;
	bh=I25En5LD+Rgn1la9GosNeUD7eVzXVOvwTMaO+VOfWt0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eOv/7zrviwpGgvR0+t5RMZnLE/nOYGsU9GS2k7mrtGtHKagjjFc2IJPAMTUOxBIgPMGOrZpM6p5ld0lcDNUU27PHaDEvtTKGc5qt3zeM6nQiq+h3OEAnZQ5M9q0n6AvaQeQxp9Ulrvr1RQwl18Q7tJW1kd1RZTgEGXV9zVtmMl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=icaJvE12; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17C06C2BCB0;
	Wed, 19 Nov 2025 15:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763564483;
	bh=I25En5LD+Rgn1la9GosNeUD7eVzXVOvwTMaO+VOfWt0=;
	h=From:To:Cc:Subject:Date:From;
	b=icaJvE12VlQBkp2vo9qf/g4pQgLCAW3i44Lh+QiZTzKgc+y2eScqAaZ+r6qpJ6Oli
	 bBeniY+RmYnAV4p2v+BT22ll55kJCTZWydGbnZPjsKiRpGWm25KBJn/RJnYHZga9jN
	 rbBe5CTwdlLBYcgjnlKOY6gtrppkovbWTgPTUMsLr0SJ8z81kDk1apLTpm1pL19MMZ
	 bN4fGnWNf3o904ulUzgBGHPi7+i2xdw4OA41lB5nfTEI3F+5q+NsyiOmkCRbNjwf4Z
	 mckPWQaGCQH/e+9wiq8wS8C2NsqFxqRsz+PSHUxxZOKzu5xVhs7vwNMmuaiHm07qoH
	 7fa4lv1PU183Q==
From: Jisheng Zhang <jszhang@kernel.org>
To: Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Andy Shevchenko <andy@kernel.org>,
	Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Kevin Hilman <khilman@kernel.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>
Cc: linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: [PATCH v3 00/15] gpio: Use modern PM macros
Date: Wed, 19 Nov 2025 22:43:12 +0800
Message-ID: <20251119144327.13345-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the modern PM macros for the suspend and resume functions to be
automatically dropped by the compiler when CONFIG_PM or
CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards or
__maybe_unused.

This has the advantage of always compiling these functions in,
independently of any Kconfig option. Thanks to that, bugs and other
regressions are subsequently easier to catch.

Almost all drivers are converted, only gpio-tegra and gpio-mlxbf are
left as is, because the memory for saving HW context is not trivial,
if we convert them, then the two drivers' users may complain for
!CONFIG_PM && !CONFIG_PM_SLEEP case. So I didn't touch them.

patch to gpio-dwapb.c is tested on real HW, others are compile-tested only.

since v2:
  - collect Acked-by, Reviewed-by tags.
  - move the embeddng the structure for pm in gpio-dwapb out, will send
    it as a separate patch.

since v1:
  - rebase on the latest gpio/for-next branch.
  - collect Acked-by, Reviewed-by tags.
  - clarify the trival memory wasted numbers with CONFIG_PM=n in the
    dwapb's patch commit message as suggested by Andy.
  - drop patch to bt8xxx since the clean up is acchieved when switching
    to generic PCI pm framework.

Jisheng Zhang (15):
  gpio: dwapb: Use modern PM macros
  gpio: brcmstb: Use modern PM macros
  gpio: htc-egpio: Use modern PM macros
  gpio: pl061: Use modern PM macros
  gpio: pxa: Use modern PM macros
  gpio: ml-ioh: Use modern PM macros
  gpio: mlxbf2: Use modern PM macros
  gpio: msc313: Use modern PM macros
  gpio: omap: Use modern PM macros
  gpio: pch: Use modern PM macros
  gpio: tqmx86: Use modern PM macros
  gpio: uniphier: Use modern PM macros
  gpio: xgene: Use modern PM macros
  gpio: xilinx: Use modern PM macros
  gpio: zynq: Use modern PM macros

 drivers/gpio/gpio-brcmstb.c   | 12 +++---------
 drivers/gpio/gpio-dwapb.c     | 18 ++++--------------
 drivers/gpio/gpio-htc-egpio.c | 21 ++++++++-------------
 drivers/gpio/gpio-ml-ioh.c    | 12 ++++++------
 drivers/gpio/gpio-mlxbf2.c    |  8 ++++----
 drivers/gpio/gpio-msc313.c    |  8 ++++----
 drivers/gpio/gpio-omap.c      | 15 +++++++--------
 drivers/gpio/gpio-pch.c       | 12 ++++++------
 drivers/gpio/gpio-pl061.c     | 17 ++---------------
 drivers/gpio/gpio-pxa.c       | 12 ++----------
 drivers/gpio/gpio-tqmx86.c    |  9 ++++-----
 drivers/gpio/gpio-uniphier.c  |  9 ++++-----
 drivers/gpio/gpio-xgene.c     |  8 ++++----
 drivers/gpio/gpio-xilinx.c    | 15 +++++++--------
 drivers/gpio/gpio-zynq.c      | 15 +++++++--------
 15 files changed, 72 insertions(+), 119 deletions(-)

-- 
2.51.0


