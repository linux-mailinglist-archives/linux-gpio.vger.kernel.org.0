Return-Path: <linux-gpio+bounces-29759-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA31CCFE55
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Dec 2025 13:52:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7C883302E2F3
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Dec 2025 12:51:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A40B6328B4E;
	Fri, 19 Dec 2025 11:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b="Zr1MlGi3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from polaris.svanheule.net (polaris.svanheule.net [84.16.241.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA97328B45
	for <linux-gpio@vger.kernel.org>; Fri, 19 Dec 2025 11:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.241.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766145408; cv=none; b=QQ6+e+6rOBjcHm0suKB1c7LbJhT4gOmSVfu7AJSSGPf5xXu/38ofJ0S5N7jT1kJjlvp4uLkorcPaAb6Wdm7rA9FD1XrjOGQ2vmbDZ/bA8uHZNEt4oGjFMxQU4lF5yVHOsURDYdaa1OoOXLAEEJfD3f1rWXpjcYtfVsOnZdYXJGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766145408; c=relaxed/simple;
	bh=nSeicr1nhOFxNfJWg/RHC9f0outvIh/JekZJJq7LyJU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dtkKuvB36N/o3qI3jKrohhA896OX2xsvZIHZw4lQ8/TQFjBAyJX0Zlb7aPAawLBoVMN56e3SYbxnzjXQvm/0KieDNEhhzx1/YbdmkreD0Tz0IbpAVctTHuA3cS1gLFyaJ6uqkuZlWmR8t86YByQxwvrskmLRZLKasYgSko8YRI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net; spf=pass smtp.mailfrom=svanheule.net; dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b=Zr1MlGi3; arc=none smtp.client-ip=84.16.241.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svanheule.net
Received: from terra.vega.svanheule.net (2a02-1812-162c-8f00-1e2d-b404-3319-eba8.ip6.access.telenet.be [IPv6:2a02:1812:162c:8f00:1e2d:b404:3319:eba8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id 4A6006B4397;
	Fri, 19 Dec 2025 12:56:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1766145398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RIfu0ZympVcNV+nXFwa5ZefqgVepr0u/QnmxlvvoIM4=;
	b=Zr1MlGi3XiBWlJHaGmVru8nh7Gb1iPCrRnwHP8S9bDZVTImo+NUH40sC6MsJRUtT3rVEvX
	NE4CKuyShfmXwkHn/OYv0yEc5c89lswOQZvM5FlIOKmvY0vtYwgiM0rN3iG62HJiIydFFi
	h3B6wTDqunCOD/G8fWGQv9kacHosR1rkR5f9IK/xiIT/77D0TlaaWEXOW981vPEAAD7QaM
	9hkquK1rUP9MzSdAKnrTNtjMS3t6JEQ3A5RvtWluEjl9iDNT0a6zpXNum884jRTmSPLgbH
	Ul4+zci60BnTU+zQZI6I/3q/htlYiqY8tlui5FRUN6lwCR6zBqtijZoU6BvMxQ==
From: Sander Vanheule <sander@svanheule.net>
To: Linus Walleij <linusw@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sander Vanheule <sander@svanheule.net>
Subject: [PATCH] pinctrl: pic64gx-gpio2: Add REGMAP_MMIO dependency
Date: Fri, 19 Dec 2025 12:56:31 +0100
Message-ID: <20251219115631.218609-1-sander@svanheule.net>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In line with other drivers depending on REGMAP_*, select the required
symbol to prevent a linker error when building with COMPILE_TEST=y:

ld: drivers/pinctrl/pinctrl-pic64gx-gpio2.o: in function `pic64gx_gpio2_probe':
pinctrl-pic64gx-gpio2.c:315:(.text+0x198): undefined reference to `__devm_regmap_init_mmio_clk'

Fixes: 38cf9d641314 ("pinctrl: add pic64gx "gpio2" pinmux driver")
Signed-off-by: Sander Vanheule <sander@svanheule.net>
---
 drivers/pinctrl/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index bc7f37afc48b..7b9f792acb0e 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -491,6 +491,7 @@ config PINCTRL_PIC64GX
 	depends on ARCH_MICROCHIP || COMPILE_TEST
 	depends on OF
 	select GENERIC_PINCONF
+	select REGMAP_MMIO
 	default y
 	help
 	  This selects the pinctrl driver for gpio2 on pic64gx.
-- 
2.52.0


