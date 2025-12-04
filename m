Return-Path: <linux-gpio+bounces-29245-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC264CA3211
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Dec 2025 11:01:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 72D01312FE09
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Dec 2025 09:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5920933859E;
	Thu,  4 Dec 2025 09:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BUyvxZ8h"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B889338593;
	Thu,  4 Dec 2025 09:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764841829; cv=none; b=MTIBGTiWqSovSs8/3f3pXoMDzp1BrGbopVx0r/8BBdjAEsOIm2iNzxQEJhP2Ppn3/0sWODyKbK7NePCxSPXH/+PlH08a6567d6dk0iFfiMD8UlGSZypsDVY2BDUk6KZV3vMX1Xx3PVtVyqOy+vS/6k0ZPtvNRP4v487FELGb4fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764841829; c=relaxed/simple;
	bh=3EE42L4o5KjaNZs+9o77LoS427HjjHYNaVkOdSwCJ2w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SOgDSltPZCEmTGNDuFviWENWFg1zXne5sC+p7UaMms+HqywRPA681xZXCKiapmIHbUZi/jO/JGXfmJCLUyFOBcSpbBKGsnH3bJzaCtYkWnUkRx0tPizlFb3yJdcRpK5pI72S1CswAWjYMzpPzgLY4GxReZ6raLqCEZ5z7azrkAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BUyvxZ8h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA0CEC19422;
	Thu,  4 Dec 2025 09:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764841828;
	bh=3EE42L4o5KjaNZs+9o77LoS427HjjHYNaVkOdSwCJ2w=;
	h=From:To:Cc:Subject:Date:From;
	b=BUyvxZ8hf7EfcpTAjNFN5MBM7qeeF5SUj0H+S4A89nsJyz5GF1YYVnNZH4O0UC5Hj
	 Jya8sDeZMX7MdWuWYwTbU3jHhRP0vGrakJFnE0nuwKT4TNyFwoAjeqAnxJ6kHkpbp8
	 ay5yY8G6DEAb8GQaZONDsCs3ogk0M7xv2qjw+TPk3uoaaYl619IvCSouoggbdMnFJG
	 8yaObYdUy24lwtPwRZqLOH8q971a+Bul5JCyCkrDpTUngIjo69NyVDJ0kCh/ZbP2bP
	 AzgIiBRVD/lEbSbWaNVQGmixHcIhmVAQRth3K6ovjEOO+pcEMG32/xHzAstVoEc59D
	 kD3yKGQXHIQHQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Linus Walleij <linusw@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Yulin Lu <luyulin@eswincomputing.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: add CONFIG_OF dependencies for microchip drivers
Date: Thu,  4 Dec 2025 10:50:14 +0100
Message-Id: <20251204095024.1031947-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The two newly added drivers fail to link on builds without
CONFIG_OF:

x86_64-linux-ld: drivers/pinctrl/pinctrl-pic64gx-gpio2.o: in function `pinconf_generic_dt_node_to_map_all':
pinctrl-pic64gx-gpio2.c:(.text+0xc9): undefined reference to `pinconf_generic_dt_node_to_map'
x86_64-linux-ld: drivers/pinctrl/pinctrl-mpfs-iomux0.o: in function `pinconf_generic_dt_node_to_map_all':
pinctrl-mpfs-iomux0.c:(.text+0xc9): undefined reference to `pinconf_generic_dt_node_to_map'

Add a Kconfig dependencies.

Fixes: 38cf9d641314 ("pinctrl: add pic64gx "gpio2" pinmux driver")
Fixes: 46397274da22 ("pinctrl: add polarfire soc iomux0 pinmux driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/pinctrl/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 2e590913fa44..bc7f37afc48b 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -489,6 +489,7 @@ config PINCTRL_PIC32MZDA
 config PINCTRL_PIC64GX
 	bool "pic64gx gpio2 pinctrl driver"
 	depends on ARCH_MICROCHIP || COMPILE_TEST
+	depends on OF
 	select GENERIC_PINCONF
 	default y
 	help
@@ -508,6 +509,7 @@ config PINCTRL_PISTACHIO
 config PINCTRL_POLARFIRE_SOC
 	bool "Polarfire SoC pinctrl driver"
 	depends on ARCH_MICROCHIP || COMPILE_TEST
+	depends on OF
 	select GENERIC_PINCONF
 	default y
 	help
-- 
2.39.5


