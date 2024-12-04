Return-Path: <linux-gpio+bounces-13501-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B115C9E4430
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 20:10:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 39961B85FA7
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 17:22:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F28821773F;
	Wed,  4 Dec 2024 17:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dxg17y1y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1C7217738;
	Wed,  4 Dec 2024 17:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733331746; cv=none; b=L50wU7IW7V51F68i/mh/Z6enrGceZ0rqWDlhjI1jHhWhhh7aVcsn8ZQyCfZu4ASt2oCbdGlazazE3mDlwdEI9NA5Eoc9O7QStW+xMye69HgrLxDdobqBBlOmnkvvilDeKUxR3ctCF2aWJ3QOKLU6J0wOwlFsueDlpJfQR1kSc+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733331746; c=relaxed/simple;
	bh=uJ8xeLxvMqeuFlk8XlRgpRa1Nai86MbCWmlWaytvUtc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HJuSsLNXAFowEtB+2oeNARvzkTgHwgV+27vVqZh13XYApjx5COu7BaEc5bAOJllFv4IxBQugK43gYSVJ/iwkVcXdRSwJhoh5GJhRPFBo9LJ2vaapuQRxG2QlSqn9Bm4wYrukieKxTx03kbsPr7Uj1zb82phxleEXf60ONMoLN14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dxg17y1y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A6CDC4CECD;
	Wed,  4 Dec 2024 17:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733331745;
	bh=uJ8xeLxvMqeuFlk8XlRgpRa1Nai86MbCWmlWaytvUtc=;
	h=From:To:Cc:Subject:Date:From;
	b=Dxg17y1yVN4Cgq5ABreg/BSjNdflOzgPlptZfbat/QFR3Js1XjkizB31nF+PcshHl
	 u1qsSfEIJH3aAX/10zP3JABD8+0zA3TBIkCx+aIwpk1LJlEZ3KD5Kr+P410sUXUQ8N
	 otcy7YocspPV9GMtLpbKCSIXZCXyva+hjW3QklBPVtcJJolyFSSSEXy0hUFTcZP5o9
	 2ojKnFAqwg5CPG3K7VbvHxZPw6S7GdPA8H0FCFErGnsqqHLKvk5aF8LuEEVqxgaSw6
	 jG6Gnbec4oTvmJyu03iLzph27MwfkNq3aD3QHIsMb582FgNW5py8sOuBnroqBR0Hfj
	 UwTl4zcGDRmaA==
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
Subject: [PATCH AUTOSEL 6.1 01/15] pinctrl: freescale: fix COMPILE_TEST error with PINCTRL_IMX_SCU
Date: Wed,  4 Dec 2024 10:50:40 -0500
Message-ID: <20241204155105.2214350-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.119
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
index 7a32f77792d9a..86110fc3c1465 100644
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


