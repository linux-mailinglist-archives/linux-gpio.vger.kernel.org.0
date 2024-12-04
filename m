Return-Path: <linux-gpio+bounces-13497-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F25579E4103
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 18:16:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6476161597
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 17:16:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5C142144A9;
	Wed,  4 Dec 2024 17:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oQve1Pqm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7BE2139C1;
	Wed,  4 Dec 2024 17:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733331684; cv=none; b=rons7AEiaO8HFgI4h/4MuirLKHSmu59gASMWvx743rsyocLWX29fQxtfkm1xA5eXNdUGriVgGRJVGlVXCI138UAAM7xbm6GGy+YRAUHyENZlWmTGTMKo3wKK0VHAoLAfAsEWuR2EZXxNQ/F1s3NTu6PQgy2yxIiQiZfdWFjwfNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733331684; c=relaxed/simple;
	bh=giYmB+q+QQG0xK14sNEHKrn+BGBLw6e32G6/nRMgp4c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ccLoeD7otTq91f+P6ErBs0BbhwMNAX/BD3llh/P3+U9Rilcj453bfMhdlVxwI2gZN243uKuv+ZXxOlrPfa6mwB08MWN6zOXoIE66rDRzqcWVX+hRdiyGQLhkqgPixudzeJeTkuWsgKHo4bj9HI3MaP2lg4vSiI8+b9PIOXsk3BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oQve1Pqm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCCF5C4CECD;
	Wed,  4 Dec 2024 17:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733331684;
	bh=giYmB+q+QQG0xK14sNEHKrn+BGBLw6e32G6/nRMgp4c=;
	h=From:To:Cc:Subject:Date:From;
	b=oQve1PqmRrlvCtIb1D7ScS2SWygBAdcuIbO62KfHtXLCijev8G+qaF4bOr3pO9pUk
	 GQUxBSQ9aIhpIRreeIxRYg1L57kNZRD2EJX0cuXsfdnEy9XIyfPpxiYVSruv2y/7GG
	 Uo5OJSwgoGc+4C+XwU28P6r9fb7Rk0ybFOpLn/pzqmdQItAatD1kLs4f6w62+P50zJ
	 P6P77iyVLFCEpaM53TM4ZjgBIGOjGrR9AEXRku3mPyLNS8N0GUBTryZMLwIuS8ctnY
	 cvmrMxI5ucRK1C+PMX7M+5TdzqOsCOANPPC7WbV2gQBPzhi0yc54gqCOnr/Yl/ruvm
	 l1/s50w3gtSvA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Esben Haabendal <esben@geanix.com>,
	kernel test robot <lkp@intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	aisheng.dong@nxp.com,
	festevam@gmail.com,
	shawnguo@kernel.org,
	ping.bai@nxp.com,
	linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 01/24] pinctrl: freescale: fix COMPILE_TEST error with PINCTRL_IMX_SCU
Date: Wed,  4 Dec 2024 10:49:21 -0500
Message-ID: <20241204155003.2213733-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.63
Content-Transfer-Encoding: 8bit

From: Esben Haabendal <esben@geanix.com>

[ Upstream commit 58414a31c5713afb5449fd74a26a843d34cc62e8 ]

When PINCTRL_IMX_SCU was selected by PINCTRL_IMX8DXL or PINCTRL_IMX8QM
combined with COMPILE_TEST on a non-arm platforms, the IMX_SCU
dependency could not be enabled.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202410031439.GyTSa0kX-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202410030852.q0Hukplf-lkp@intel.com/
Signed-off-by: Esben Haabendal <esben@geanix.com>
Link: https://lore.kernel.org/20241003-imx-pinctrl-compile-test-fix-v1-1-145ca1948cc3@geanix.com
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pinctrl/freescale/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/freescale/Kconfig b/drivers/pinctrl/freescale/Kconfig
index 27bdc548f3a7d..a36dae526de12 100644
--- a/drivers/pinctrl/freescale/Kconfig
+++ b/drivers/pinctrl/freescale/Kconfig
@@ -9,7 +9,7 @@ config PINCTRL_IMX
 
 config PINCTRL_IMX_SCU
 	tristate
-	depends on IMX_SCU
+	depends on IMX_SCU || COMPILE_TEST
 	select PINCTRL_IMX
 
 config PINCTRL_IMX1_CORE
-- 
2.43.0


