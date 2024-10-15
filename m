Return-Path: <linux-gpio+bounces-11366-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C9C99F0B9
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 17:11:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CA97EB21A07
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 15:11:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0DDB1CBA07;
	Tue, 15 Oct 2024 15:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rRgnyUKG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8FD1CB9E4;
	Tue, 15 Oct 2024 15:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729005091; cv=none; b=ho1ZkkV0xPsMA/v+lNfXXBJBGIiy//uy/OapKxh39YDzPe7sRiPMpbG/WbcmiKEA0mCCntTZFaoRrO6ajqu0bK2Qdeyqs35p8ekKJD5p4pE+sLgEplIBD64dthDYMYkJWKgdTVXt0AhKv4u4Zf4LPA+SQpbAjcE7E6poenDEwzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729005091; c=relaxed/simple;
	bh=fsxR0wZfFAGioVuM2Gx0ckn1ZEOQwHuShQJgQkJClpU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IqW+SGQ0GUglr3vhu6zrWMEsXXoFF2sTpVXo9bGQrV+l4uVmbL4/S59i8CrMXVr339HCxBYqMlN7ADaM0QXVLsyX2w4w5r4F8qO9gpGFRHXAZxw+x2jW0F43S64mK+GxY9mS3uPD4/1JGsnw2ZsK2QjwzUA87nnVB/zA/k0wbkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rRgnyUKG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E54AC4CEC6;
	Tue, 15 Oct 2024 15:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729005091;
	bh=fsxR0wZfFAGioVuM2Gx0ckn1ZEOQwHuShQJgQkJClpU=;
	h=From:To:Cc:Subject:Date:From;
	b=rRgnyUKGpznZ3mZKSAIdTlfytNRmMr+q/eVRLLyJsTdzjRSInIh9vBIr7tnSkPbq8
	 fDna4PXqXdBdjIxE8NykoIqOxPbQOoPjlZDysAhi+KxkJv4y5E+LZl6o5zgY0Yf/EM
	 e2vFR8oeDLYsO7rSG72KA5W/+YvGSFeyw/uaNr6BjFSN2Vs6QXx3cxyxpd3uN6ZBg+
	 u6BUnxk9beEu5t5t3WMzr9y7uq0tBtC+tJQLVQFXjqMIyz5yzXEgupuOmAMprcE+sq
	 Z328bjddJm4nP5l4wrdo374vwKf4n8QstXA1Vw/6Zgm9y2jDo9NLS/Ah0ANI2zRtFA
	 fBhJD4w/YhM5w==
From: Arnd Bergmann <arnd@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Drew Fustini <dfustini@tenstorrent.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: th1520:  add a CONFIG_OF dependency
Date: Tue, 15 Oct 2024 15:11:13 +0000
Message-Id: <20241015151126.2401855-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

When compile-testing without CONfIG_OF:

drivers/pinctrl/pinctrl-th1520.c: In function 'th1520_pinctrl_dt_node_to_map':
drivers/pinctrl/pinctrl-th1520.c:455:23: error: implicit declaration of function 'pinconf_generic_parse_dt_config'; did you mean 'pinconf_generic_dump_config'? [-Wimplicit-function-declaration]
  455 |                 ret = pinconf_generic_parse_dt_config(child, pctldev, &configs, &nconfigs);
      |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                       pinconf_generic_dump_config

Enforce this using Kconig dependencies.

Fixes: bed5cd6f8a98 ("pinctrl: Add driver for the T-Head TH1520 SoC")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/pinctrl/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index a6acc27c9a83..3fab5ebeb2e0 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -564,6 +564,7 @@ config PINCTRL_TPS6594
 config PINCTRL_TH1520
 	tristate "Pinctrl driver for the T-Head TH1520 SoC"
 	depends on ARCH_THEAD || COMPILE_TEST
+	depends on OF
 	select GENERIC_PINMUX_FUNCTIONS
 	select GENERIC_PINCONF
 	select PINMUX
-- 
2.39.5


