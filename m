Return-Path: <linux-gpio+bounces-29415-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7D7CB1CEA
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Dec 2025 04:40:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 25330302DB4E
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Dec 2025 03:39:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A731330E85C;
	Wed, 10 Dec 2025 03:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DC+dMPkF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA33E1EBFF7;
	Wed, 10 Dec 2025 03:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765337992; cv=none; b=CARe50+vxO1iUYzQPSq2Kzr22K83Dp+4xdsG+G7VVL8+NClAB6F4gJFgCV1L1ZxtM1lgmC9LZz4d1pJxq4m+zB3H8uif7QCkbqikU9cAhwqHKYmubwd9JRWz5pr+tY4oGbEruKW6qTwLJdqgF4LxDQj/yMP+0j0rwB/pfXNeXXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765337992; c=relaxed/simple;
	bh=X9sGjU9pNICzH6YHLZuFi9ipV1RlwTweZZ1thkNeZsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hI/Nvp0Y1FraOw1ubHGRBkoDUJlfjHut3NxkzK2YpE/aPHVSQtT0wGTKe4f30fglArkRl4WmZL0CoObguxY88pTS+UBRo8e2YOjsCLf9BUANnkNTVbbNKWK+4U8hLOfR0/MtSuN38OViJ5UQzF4Bd9AIcDL3PxYMRdMThJvumKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DC+dMPkF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CD49C4CEF1;
	Wed, 10 Dec 2025 03:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765337991;
	bh=X9sGjU9pNICzH6YHLZuFi9ipV1RlwTweZZ1thkNeZsQ=;
	h=From:To:Cc:Subject:Date:From;
	b=DC+dMPkF9cnQEb9CfukkXFJo2GZPuoYLMFoKekdY9Om/lT416JTy6WpmVpvJgOq5E
	 GRNjMFDdR79mgE9zJDwKPdyA/LabmURj/WO10Zirz37uc5JkOfdDyKo4YtQb0IVHI+
	 MH7nu2iT4PeJzV+sI+LIyYs+jTstd1UMKlxsTLQTYVj9pDR/i3bHfMPJfRyrH1usgJ
	 1Nv4RJI+Kfbr992B/SukgzyVm8YquMlpaO/0kbsTp+yZt56AF4GmbL6I4UXGSmrSYN
	 KBzK4tBH/QG6hA5UUUeETgHt12M/i20jInB/1TNPmeEx5S5ubtv4FK9Nu58DzbPCVO
	 diuAEur1PZzKw==
Received: from johan by theta with local (Exim 4.99)
	(envelope-from <johan@kernel.org>)
	id 1vTB5m-000000008yQ-3W4M;
	Wed, 10 Dec 2025 12:42:18 +0900
From: Johan Hovold <johan@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH] pinctrl: fix compile test defaults
Date: Wed, 10 Dec 2025 12:41:48 +0900
Message-ID: <20251210034148.34447-1-johan@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enabling compile testing should not enable every individual driver (we
have "allyesconfig" for that) but two new drivers got this wrong.

Fixes: 38cf9d641314 ("pinctrl: add pic64gx "gpio2" pinmux driver")
Fixes: 46397274da22 ("pinctrl: add polarfire soc iomux0 pinmux driver")
Cc: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/pinctrl/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index bc7f37afc48b..ce5685215b92 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -491,7 +491,7 @@ config PINCTRL_PIC64GX
 	depends on ARCH_MICROCHIP || COMPILE_TEST
 	depends on OF
 	select GENERIC_PINCONF
-	default y
+	default ARCH_MICROCHIP
 	help
 	  This selects the pinctrl driver for gpio2 on pic64gx.
 
@@ -511,7 +511,7 @@ config PINCTRL_POLARFIRE_SOC
 	depends on ARCH_MICROCHIP || COMPILE_TEST
 	depends on OF
 	select GENERIC_PINCONF
-	default y
+	default ARCH_MICROCHIP
 	help
 	  This selects the pinctrl driver for Microchip Polarfire SoC.
 
-- 
2.52.0


