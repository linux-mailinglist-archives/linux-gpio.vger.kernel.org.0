Return-Path: <linux-gpio+bounces-13504-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A9E9E451E
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 20:54:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7CC8DBA0226
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 17:26:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 138E422578D;
	Wed,  4 Dec 2024 17:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hyDc9wRt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0219225771;
	Wed,  4 Dec 2024 17:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733331781; cv=none; b=th+HOkBTJNzybrkB/CJ6eA1ZYLr/g8htPYO0Mqwby/X+P1K+vmHUQb/Vnw9LGnG+myid3VHRJnX12WkyAuRIc13SRkaNrxSbqqW20FPOQxOhvpmYA+qTDCXTccGaNbOMG+ORDsszmHVai6Ef47Xv56+6Od5hlIFoHYy8ACsAK6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733331781; c=relaxed/simple;
	bh=YwO3Q2f4FsLS/5XpKdz3ZlRCiBwyZqJ3ML/XJ3gZePw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Sz4KHdEoXQYNW/Gzf/Pw3mAYiz5XgmTF9B7igiq4zQhX9F0FckJY/6QUdOF/l5/UlG+WQyVPcWBeYk61W9FDHz+MYnHaoMM7MpV16TRcHDogD9MHD4Y11kPiHmlMFu3R/fuGPNow6UTRFQU42o8kWFt/EuXk7XWsJoYr52IdaWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hyDc9wRt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20794C4CECD;
	Wed,  4 Dec 2024 17:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733331781;
	bh=YwO3Q2f4FsLS/5XpKdz3ZlRCiBwyZqJ3ML/XJ3gZePw=;
	h=From:To:Cc:Subject:Date:From;
	b=hyDc9wRt1Bqh0YoMGQXxFkETWYMiaQwDfEOQPVIHAmG31PyVlR5EEhEFlbFZeuZBd
	 p5G5fu9+YPZGFihDSY7wzfL05OIHE53MFnD1DObjHsv3+cqD0ly7J6JK7eQXw970jP
	 cc777a9O2MQxp8ld+pTZH88Lk2temSc5cE5FP51a2f6InpJb8bQ3TDsGBDvSEZlm0W
	 TvvVjUaiUJW0W0JaMh0yuqJ9RiTFKjDR5wSx0UoPEpAUjet4ATNST9FoovATWGUA2w
	 pKeO5Py8fY+MKNmwqVyopmRGKBhvA5KOIB+U5krcbUJoicwsHr1J60rLYEdT8OVRMx
	 lPIu4TpSCJudA==
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
Subject: [PATCH AUTOSEL 5.15 1/9] pinctrl: freescale: fix COMPILE_TEST error with PINCTRL_IMX_SCU
Date: Wed,  4 Dec 2024 10:51:31 -0500
Message-ID: <20241204155141.2214748-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.173
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
index 21fa21c6547b1..93b38d97a7263 100644
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


