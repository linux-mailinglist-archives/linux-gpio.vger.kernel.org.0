Return-Path: <linux-gpio+bounces-13506-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F26789E4182
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 18:28:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6F6016201E
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 17:28:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FF7521883F;
	Wed,  4 Dec 2024 17:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ovvfcHCQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF0C21882B;
	Wed,  4 Dec 2024 17:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733331798; cv=none; b=pBM+4CQlUWfNHsm4gzGNRCNU28iCAyhLHRwF5cdDpgW+np8Dwqlvpi16aOTjBTAp+PuUmpFOhWdcsD9QP4lnF28SpRmquiuLLtwQBn1aKrHZCpqE/AyuVFDYUjFEhNOgpFYx/MssL7Q66m8k+qwqfGBOPaB27qOuGsXRdvjAg7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733331798; c=relaxed/simple;
	bh=HFVaICDYaO/0Uns/OG8PNR4hh96KYd14nDjfG/6JMog=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nJ21nvfost1b9hM5aNbaQSVVToNuQ/sd2CcB1UMqcSfrlNsbUxcQvutM4a/WqE0m6pZupeyrEkZug0VYofwFUMFsHmcq9VLuTv6iN0T+TBv1mgqh1M2YqN+42uujP4hHCHNlZ1dqV4gB39Qd+DPVOy062xXzM4LKTjfUvIrQORI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ovvfcHCQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83822C4CECD;
	Wed,  4 Dec 2024 17:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733331797;
	bh=HFVaICDYaO/0Uns/OG8PNR4hh96KYd14nDjfG/6JMog=;
	h=From:To:Cc:Subject:Date:From;
	b=ovvfcHCQhYl4DXWP47iDdQvRKqFQ/fs2TiyqcaXNxAW+EaHmlsU7JStbjS1fiCFx4
	 0+rBEjcDa9OZ9et/GMOTYg1hm07HQb8OEQdGP3r52mDG2ZXzB+JFntoXiJOVZc5DqE
	 IADLeoHOm1IBIorIhGlwBunpRCs7xWM7Ftpx9v0GbNhUtbHxdizhOoU9sI9VQna/jT
	 YtzgBcf0FO6UY8CnGcRkilthfJpOf7hn3uerlZClnxbJXtMx/L8AFhNJ/Kk4wiz27a
	 b3H9HlaJiMsJwqX2Ma7y39gGlol59tfTvQtfkjpwarYZEkK1hq1SxBGTVR8AWdIlQD
	 OPupDFNIPgtxA==
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
Subject: [PATCH AUTOSEL 5.10 1/9] pinctrl: freescale: fix COMPILE_TEST error with PINCTRL_IMX_SCU
Date: Wed,  4 Dec 2024 10:51:47 -0500
Message-ID: <20241204155157.2214959-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.230
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
index a1fbb3b9ae346..eefc786d08b45 100644
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


