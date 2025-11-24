Return-Path: <linux-gpio+bounces-28984-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 00392C7EAEA
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Nov 2025 01:39:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9AEB6344AB1
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Nov 2025 00:39:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 343C03E47B;
	Mon, 24 Nov 2025 00:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="poPtU+RQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D2A182D0;
	Mon, 24 Nov 2025 00:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763944740; cv=none; b=Clz7wdVmEY63gHGmegnLPdOabz0DuDMcg+G4CJW6zgWTdgrrINJ/Nv26ltRkCbPwEKxFdyTo7KcE6Os0wKv29nA/hkx6pnawE2eEdxx94QP8e1Wz6YjQ4nMc7cRi2mpYiMxCOuChR0KyAlw9qTyw2OH5zAvJhQDr+i7Glz5PiBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763944740; c=relaxed/simple;
	bh=ZhoNPDXJHC7TiqZOtG3ztIsi7d4KbS0+5ZUx4cRA0g4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aIZPGDmgUr3kDBDCO03gpUAy9W2EBfVSZ86wR7VX2ct2Sbwd145cVxQ3osy6picKE75gkeCGjgwDNsMR2vLwvh0acOizimEKV8/AjHw4LOiPbmfo+LHslHEi761zy7klDSPgwCvoKLxSaH5g2XO8MnoMFsjngqDdpwZCH6hDC8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=poPtU+RQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B998C113D0;
	Mon, 24 Nov 2025 00:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763944739;
	bh=ZhoNPDXJHC7TiqZOtG3ztIsi7d4KbS0+5ZUx4cRA0g4=;
	h=From:To:Cc:Subject:Date:From;
	b=poPtU+RQO8RjB8GAMlOW7WNtJYy88FQzbJTa8a406xYJnr+5Pg7+01FdDO75ny0Fc
	 pk/FW2DdD6RwWMEpB/c7Dpbw6CWOQ/EDJE5ByAmyxjN2CcejqDm/Bh13A387bqsdYT
	 vD7i9x8YVpE+sSge4pyEHfTi28cibFjDS0p6mP7pA3iCpOCaUoR9EkEHpG7OrHZVUj
	 U4hLU3bA1bPNLD0D9L/8xTU4nXzGnj8S7ckfiTeZoKmht7gwW3aCU0WJPxyw6PwabZ
	 77Hla0Evtr0vhITWuBYFzM4A9KKbTAketkHaryUAMXHpIFx4PfX3P3H64eXAlECS0O
	 UO2zJ5Mb4JfIw==
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
Subject: [PATCH v5 00/14] gpio: Use modern PM macros
Date: Mon, 24 Nov 2025 08:20:51 +0800
Message-ID: <20251124002105.25429-1-jszhang@kernel.org>
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

since v4:
  - collect Reviewed-by tags.
  - use pm_ptr() instead of pm_sleep_ptr() for gpio-tqmx86 
  - drop patch5 for gpio-pxa due to maintainer's conern with memory waste

since v3:
  - fix typos.
  - fix the stray change in gpio-pxa driver.

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


Jisheng Zhang (14):
  gpio: dwapb: Use modern PM macros
  gpio: brcmstb: Use modern PM macros
  gpio: htc-egpio: Use modern PM macros
  gpio: pl061: Use modern PM macros
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
 drivers/gpio/gpio-tqmx86.c    |  9 ++++-----
 drivers/gpio/gpio-uniphier.c  |  9 ++++-----
 drivers/gpio/gpio-xgene.c     |  8 ++++----
 drivers/gpio/gpio-xilinx.c    | 15 +++++++--------
 drivers/gpio/gpio-zynq.c      | 15 +++++++--------
 14 files changed, 70 insertions(+), 109 deletions(-)

-- 
2.51.0


