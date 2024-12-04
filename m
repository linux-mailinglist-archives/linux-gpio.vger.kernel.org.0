Return-Path: <linux-gpio+bounces-13489-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 296109E4036
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 17:58:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D84EB28381D
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 16:58:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19A0420D50D;
	Wed,  4 Dec 2024 16:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n3+eiIVS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C403E20CCE4;
	Wed,  4 Dec 2024 16:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733331466; cv=none; b=DzDDUx5UONPdKlJdte+lfGHo15IN9h3x7eu9aqTVAeIeJmQRjFEPH000df0hSQLs+FTghFSoML6GqYf8py7Kt+GpXEXrDVR9UYwxQl8Z1iIEqbCWbOfoRruc+CL1Vf+X6m56SOMziv7AHq/BepQu28TSBz3FV2w47KGVMv4h7KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733331466; c=relaxed/simple;
	bh=18037VPHjrQfoRCjqpA241S3N+eGlrVCeqY4BrrgXXU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=swYZr/7HqJICkho2q/GpQvIj2TguS+QNymqvjHFzTuXcIADgr+ETOf8Qd8OWsd3wx6QDsaUHqII/035PenziadEL32uisl0OnYutNxlPuWRGeFKs0LOyeDyUYhORLbrqEENB5VL/OHWITPN6Jmt742u8izQq0DVLZJ3hzrkiEdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n3+eiIVS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33AF8C4CECD;
	Wed,  4 Dec 2024 16:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733331466;
	bh=18037VPHjrQfoRCjqpA241S3N+eGlrVCeqY4BrrgXXU=;
	h=From:To:Cc:Subject:Date:From;
	b=n3+eiIVSbMLCPZmXs4WkLzQMgES64BKbkHMx39tUj8rAMQVm3ORwDHNm102sOUtA6
	 ZD2i2XqLrWD7+3Mt6OZBalmPuoAU1tCYySagTcfSt0XGUfGMt50bc++58spL/Zvk0Z
	 kKDtJza9fa11Q1gAwIumAIA0IqzxJ6AVklgPOzzFD1oimBdKWO4GYwj5NDjDN3w1Ap
	 Fr4cQXL4WTFTdVDJNMHKFerwBJJJDnC6Q7I+eh1DW4M8HzlJTrh/USXbdbwWkBjFwC
	 bo1AOg7msKPIKibSv/MVJ3FFnUcMOlCi1M11sJvHgYHiOhL8Sxy1stHeJVmzgEPa9j
	 ZKRd6GelIQCFw==
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
Subject: [PATCH AUTOSEL 6.12 01/36] pinctrl: freescale: fix COMPILE_TEST error with PINCTRL_IMX_SCU
Date: Wed,  4 Dec 2024 10:45:17 -0500
Message-ID: <20241204154626.2211476-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.1
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
index 3b59d71890045..139bc0fb8a9db 100644
--- a/drivers/pinctrl/freescale/Kconfig
+++ b/drivers/pinctrl/freescale/Kconfig
@@ -20,7 +20,7 @@ config PINCTRL_IMX_SCMI
 
 config PINCTRL_IMX_SCU
 	tristate
-	depends on IMX_SCU
+	depends on IMX_SCU || COMPILE_TEST
 	select PINCTRL_IMX
 
 config PINCTRL_IMX1_CORE
-- 
2.43.0


