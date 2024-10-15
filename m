Return-Path: <linux-gpio+bounces-11352-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D774099E360
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 12:06:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 810211F23F5B
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 10:06:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B93C71E2619;
	Tue, 15 Oct 2024 10:06:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from gauss.telenet-ops.be (gauss.telenet-ops.be [195.130.132.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FAA3166F34
	for <linux-gpio@vger.kernel.org>; Tue, 15 Oct 2024 10:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728986767; cv=none; b=jzEByyOop94KTgt8hgEesr23A+J3/aFzSRsxY3eUUcUcDs5Jj7Obu+icyp/hjTrlz/26ct4Qe89ILHxyeL4swP2BvZlwLfDMjzIz734iOhSLJpIuQuPCVYtjaokjsqDVz/eRkAKAUFfRlKqLzS5Sem5BNlZi+JjV7TdQXbvAF+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728986767; c=relaxed/simple;
	bh=dM+TqgAfWeoaj3qfwLnbR5ULqXUPhLr5ZfK49e6VOvU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=piGjHXJxuAy9cObF5fgMneOxY1qztZ+GhRRHXiEDk7EWV3dhzpKtfXAZQUiudwjUtHd9XVl2/AIz6ugKy5QTBfR1o/MSXjDPQx0Pob5lJADIDg3dojYR03byNxC6geHbhO4ZXYOVM7/MaT5MHOZdWj/9HIbFir8OOW4+gS6Wlzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
	by gauss.telenet-ops.be (Postfix) with ESMTPS id 4XSTy02wNLz4wxKQ
	for <linux-gpio@vger.kernel.org>; Tue, 15 Oct 2024 11:56:08 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:2f01:8211:4b4e:86e2])
	by andre.telenet-ops.be with cmsmtp
	id QZw12D0014yGcJj01Zw1Wl; Tue, 15 Oct 2024 11:56:01 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1t0eHL-003nbK-NS;
	Tue, 15 Oct 2024 11:56:00 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1t0eHY-003eLd-RP;
	Tue, 15 Oct 2024 11:56:00 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>,
	Ze Huang <18771902331@163.com>,
	Conor Dooley <conor@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-riscv@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: PINCTRL_K230 should depend on ARCH_CANAAN
Date: Tue, 15 Oct 2024 11:55:58 +0200
Message-Id: <d70279ba02a67250203744b38314f4475b3c5671.1728986052.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Canaan Kendryte K230 pin controller is only present on Canaan
Kendryte K230 SoCs.  Hence add a dependency on ARCH_CANAAN, to prevent
asking the user about this driver when configuring a kernel without
Canaan Kendryte series SoC platform support.

Fixes: 545887eab6f6776a ("pinctrl: canaan: Add support for k230 SoC")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 216662189e8d8cda..10533438398bc14e 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -271,6 +271,7 @@ config PINCTRL_K210
 config PINCTRL_K230
 	bool "Pinctrl driver for the Canaan Kendryte K230 SoC"
 	depends on OF
+	depends on ARCH_CANAAN || COMPILE_TEST
 	select GENERIC_PINCTRL_GROUPS
 	select GENERIC_PINMUX_FUNCTIONS
 	select GENERIC_PINCONF
-- 
2.34.1


