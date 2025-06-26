Return-Path: <linux-gpio+bounces-22265-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36835AE9F62
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Jun 2025 15:51:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6F293BB06B
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Jun 2025 13:50:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAA3E2E765F;
	Thu, 26 Jun 2025 13:50:43 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3932E764B;
	Thu, 26 Jun 2025 13:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750945843; cv=none; b=UrCvTudg9nvNXrJ8ww3HZgKJAk2ggyUOEbTJ+jhOcAVhdlqRpoYQGcDBvhOb14Qaqok7bV4uMc80netLA9n1UhhCtjUKc38EjH7/xPhoIuHF0XvH4cFVJGpjK5DpayDv8fdC8FH4yOXa9yH0ee7E83ArgaEU/b2w3RsVZm1RAkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750945843; c=relaxed/simple;
	bh=2pm7+UaQeiFKBALBenUwi2QOVjDVLmCXKtN4Q63Dj0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bD/fhojnFATt2g5aLdr0TT+tntEtx9AEn4BKluGxvN/jAWlxDp6hopPc6uYJiIa+pbVPKfDMT3W3EwqrQs+rmBFnl/o9hccLfIjhgvohefsb8/UGPviIAnmyiAsDmSqAW9qz6Dx69wsN+pmjwBs3g1emImnSjBq1JhaALDOgG/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA7A4C4CEF3;
	Thu, 26 Jun 2025 13:50:41 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: renesas: Simplify PINCTRL_RZV2M logic
Date: Thu, 26 Jun 2025 15:50:39 +0200
Message-ID: <d74843e06f73cd4c6e822d65f606e6042a50a0b7.1750945516.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PINCTRL_RZV2M is selected by ARCH_R9A09G011, hence there is no need to
depend on the latter.  Move the dependency on COMPILE_TEST to the symbol
prompt, like is done for all other auto-selected pin control symbols.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-pinctrol for v6.17.

 drivers/pinctrl/renesas/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pinctrl/renesas/Kconfig b/drivers/pinctrl/renesas/Kconfig
index 5d7e6d5dbfa90e3e..bbcbb9f33f71d6a6 100644
--- a/drivers/pinctrl/renesas/Kconfig
+++ b/drivers/pinctrl/renesas/Kconfig
@@ -250,9 +250,8 @@ config PINCTRL_RZN1
 	  This selects pinctrl driver for Renesas RZ/N1 devices.
 
 config PINCTRL_RZV2M
-	bool "pin control support for RZ/V2M"
+	bool "pin control support for RZ/V2M" if COMPILE_TEST
 	depends on OF
-	depends on ARCH_R9A09G011 || COMPILE_TEST
 	select GPIOLIB
 	select GENERIC_PINCTRL_GROUPS
 	select GENERIC_PINMUX_FUNCTIONS
-- 
2.43.0


