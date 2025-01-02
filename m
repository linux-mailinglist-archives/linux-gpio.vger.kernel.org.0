Return-Path: <linux-gpio+bounces-14433-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E32BF9FFE5D
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 19:33:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6ADE3A2287
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 18:33:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEFD51B85D6;
	Thu,  2 Jan 2025 18:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u9oZ6yRk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7769B1B6D11;
	Thu,  2 Jan 2025 18:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735842743; cv=none; b=VtwGOpG1b0V5rG5OFbUyP4TlJHlf79ZKukRdN7eC7q8ief9VzcIDBtqNlo7LxNRNgMgb8+Mfthrn03OP57sSyThMVohEOO96hT9Ca3IBvhtCMmHRK12peeyD69jJNRbUKFaCONuXGQaYpgl0fDaMXIY54SV1YEWxjzM6TQVKsUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735842743; c=relaxed/simple;
	bh=+ozPR72TGelRi1qjo+eMYUhMsBvV12qPvfKdkXm1MbU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ICjeyIAMa+eLYdfDZFeiO0qTcZkrOSa7CT/7eLepyaVqM8s6NzlNHFm2fREZ3uBK/y8p7XgH7d89Qx0ekr5TKzEroL61eZQoqoKT8W2poUMeUbzj2wYsUBUHyAI2PTiCd5kKQMq1ODXnE/t2rBUU4IOvNPM+mRPlKwDN/5bgkuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u9oZ6yRk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B3AB3C4AF66;
	Thu,  2 Jan 2025 18:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735842742;
	bh=+ozPR72TGelRi1qjo+eMYUhMsBvV12qPvfKdkXm1MbU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=u9oZ6yRkiN/HoOP1oRjfV/PSXDNkJZOcBs8A0kgjV9KSGN31tFE1Uds3sBLbkyTZe
	 qPlUgM73YMLb/icycEhaw6QiW7aFPEq8onNYjGAe+MwqcNb3lZyXdixSr/7ZNTdNPU
	 I764mdN4RHHnzZXoVK7bCD1H53uu1rTHr0tI3TAErz0D1fVINxYFzhcgdj/C9p6kaO
	 bRDE2ynFHTk8mMb4+ybNTBUNLB3PGFXFwLGrTuPy3VNpKKgYecqUugi7r68CtuIrO2
	 Sr0g1bpryw16t28IzNKE/UQluJSra1khl0qpa/OQWBXCAFxK37O3B4wkxbucT1IAeL
	 FXUtT0FnCQO6Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA4CDE77199;
	Thu,  2 Jan 2025 18:32:22 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Thu, 02 Jan 2025 19:31:58 +0100
Subject: [PATCH 17/19] powerpc: Regenerate mpc83xx_defconfig
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250102-mpc83xx-v1-17-86f78ba2a7af@posteo.net>
References: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
In-Reply-To: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Frank Li <Frank.Li@nxp.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735842735; l=2583;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=1rOiPx/IBiS+KFXwbtSf4liVE3lSlERERzYFgaFB5Pk=;
 b=EHF5ZT2XyhVoAK1/ZHS7HRAw+6QSTlpL1V5+eKAfHyxBFSrN3ZC3ueMcFRSU32p1zNVTF1N8r
 njn7Caw18RADtKpP5TBRZDaoRoT2+3hjH6qkxhOkbbUL4dNPcX8Cdu7
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net

From: "J. Neuschäfer" <j.ne@posteo.net>

Run `make mpc83xx_defconfig` and `make savedefconfig`. This reduces the
size of subsequent patches that enable/disable functionality.

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
 arch/powerpc/configs/mpc83xx_defconfig | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/configs/mpc83xx_defconfig b/arch/powerpc/configs/mpc83xx_defconfig
index 4af5e3e8c5a7f44f5e97b8fb4cdf691686f8967b..525a4f6ae1ff7b51e365668b430fa46ce4938f19 100644
--- a/arch/powerpc/configs/mpc83xx_defconfig
+++ b/arch/powerpc/configs/mpc83xx_defconfig
@@ -2,10 +2,6 @@ CONFIG_SYSVIPC=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-# CONFIG_BLK_DEV_BSG is not set
-CONFIG_PARTITION_ADVANCED=y
 # CONFIG_PPC_CHRP is not set
 # CONFIG_PPC_PMAC is not set
 CONFIG_PPC_83xx=y
@@ -17,7 +13,9 @@ CONFIG_MPC837x_RDB=y
 CONFIG_ASP834x=y
 CONFIG_QE_GPIO=y
 CONFIG_MATH_EMULATION=y
-CONFIG_PCI=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_PARTITION_ADVANCED=y
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
@@ -31,6 +29,7 @@ CONFIG_IP_PNP_BOOTP=y
 CONFIG_SYN_COOKIES=y
 CONFIG_INET_ESP=y
 # CONFIG_IPV6 is not set
+CONFIG_PCI=y
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 # CONFIG_FW_LOADER is not set
@@ -38,7 +37,6 @@ CONFIG_MTD=y
 CONFIG_MTD_BLOCK=y
 CONFIG_MTD_CFI=y
 CONFIG_MTD_CFI_AMDSTD=y
-CONFIG_MTD_PHYSMAP_OF=y
 CONFIG_MTD_RAW_NAND=y
 CONFIG_MTD_NAND_FSL_ELBC=y
 CONFIG_BLK_DEV_LOOP=y
@@ -46,6 +44,7 @@ CONFIG_BLK_DEV_RAM=y
 CONFIG_BLK_DEV_RAM_SIZE=32768
 CONFIG_BLK_DEV_SD=y
 CONFIG_CHR_DEV_SG=y
+# CONFIG_BLK_DEV_BSG is not set
 CONFIG_ATA=y
 CONFIG_SATA_FSL=y
 CONFIG_SATA_SIL=y
@@ -56,7 +55,6 @@ CONFIG_DAVICOM_PHY=y
 CONFIG_ICPLUS_PHY=y
 CONFIG_MARVELL_PHY=y
 CONFIG_VITESSE_PHY=y
-CONFIG_INPUT_FF_MEMLESS=m
 # CONFIG_INPUT_KEYBOARD is not set
 # CONFIG_INPUT_MOUSE is not set
 # CONFIG_SERIO is not set
@@ -68,14 +66,12 @@ CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_MPC=y
 CONFIG_WATCHDOG=y
 CONFIG_HID_A4TECH=y
-CONFIG_HID_APPLE=y
 CONFIG_HID_BELKIN=y
 CONFIG_HID_CHERRY=y
 CONFIG_HID_CHICONY=y
 CONFIG_HID_CYPRESS=y
 CONFIG_HID_EZKEY=y
 CONFIG_HID_GYRATION=y
-CONFIG_HID_LOGITECH=y
 CONFIG_HID_MICROSOFT=y
 CONFIG_HID_MONTEREY=y
 CONFIG_HID_PANTHERLORD=y
@@ -97,8 +93,6 @@ CONFIG_TMPFS=y
 CONFIG_NFS_FS=y
 CONFIG_NFS_V4=y
 CONFIG_ROOT_NFS=y
-CONFIG_CRC_T10DIF=y
-CONFIG_CRYPTO_ECB=m
 CONFIG_CRYPTO_PCBC=m
-CONFIG_CRYPTO_SHA512=y
 CONFIG_CRYPTO_DEV_TALITOS=y
+CONFIG_CRC_T10DIF=y

-- 
2.45.2



