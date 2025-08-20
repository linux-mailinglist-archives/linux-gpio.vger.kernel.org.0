Return-Path: <linux-gpio+bounces-24637-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F00DAB2E1A9
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 18:01:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3489B683A24
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 15:58:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B97ED32276B;
	Wed, 20 Aug 2025 15:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ROJM/pzp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721D4242D72;
	Wed, 20 Aug 2025 15:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755705486; cv=none; b=MfzSaPyV4qv7F3y/iE75ULbfPJf1p4Fzfb2Z7pHvALn4IH6qWpvl/2PfuByxwYohJW0J99KOu5NzwrsBqWNLOAboQMhe2wDMhpR84xd5/y7c+s5LckHPjfxOPQ36KBDKozYoDkrXjDFCTL1we0i/Gc2y6hukqPa08KY0BOJAtL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755705486; c=relaxed/simple;
	bh=vMfJ9Va4IKsTzlQUghLpkBMK6vkLLgkukvvU2MzIBYY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BRfnZ0z14xemQlpgrIrbgH5RUYOlyNuWblKz1ExnG3dId15jp5FCtgrI/3MAXxI+TrtIPsNVmDbHcG5Tt1JnwVA8+q1MeWMctTsfMKmKIQ6GR9TjsYPua5DDyrFnDWtWaAmddbd9g1mvV92IKpkCgApSl+Yahx4OK3Ln6X0Ze3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ROJM/pzp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6A78C4CEE7;
	Wed, 20 Aug 2025 15:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755705485;
	bh=vMfJ9Va4IKsTzlQUghLpkBMK6vkLLgkukvvU2MzIBYY=;
	h=From:To:Cc:Subject:Date:From;
	b=ROJM/pzpJ4u7Pbb3L5KIWV6dXR3TeNJnRXx4CC90NWtGXnBGzh31Vaj911zYkJT+N
	 68FfMgr1Y429jUja//5sKClo7TtlGVNUd6VHIcmj826LfOycJpkJgEzUEnUDX3mbOl
	 KklMdBztLIY0eE8qFFlvAHTV7NwsmJA+lgWoXq/HeNYNwdxY4T1Ua3nz7QYwXXnUrc
	 AXNiUGD91rc/l1ekcZGwPor5WX68s2d/VUUsEoDLeBYVmWqUvJBh5MJX3lKBDIMsyN
	 QsGBca1ckbBwFXUUZ4i3R8aUrc56VZbM8d4gzD9T1QIA7AJ85zQljCkLlDYB1KnF1W
	 SPxoWy3DoyO3w==
From: Jisheng Zhang <jszhang@kernel.org>
To: Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Michael Buesch <m@bues.ch>,
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
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux@ew.tq-group.com
Subject: [PATCH 00/16] gpio: Use modern PM macros
Date: Wed, 20 Aug 2025 23:40:21 +0800
Message-ID: <20250820154037.22228-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.50.0
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

Jisheng Zhang (16):
  gpio: dwapb: Use modern PM macros
  gpio: brcmstb: Use modern PM macros
  gpio: bt8xx: Use modern PM macros
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
 drivers/gpio/gpio-bt8xx.c     | 11 ++---------
 drivers/gpio/gpio-dwapb.c     | 31 +++++++------------------------
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
 16 files changed, 77 insertions(+), 138 deletions(-)

-- 
2.50.1


