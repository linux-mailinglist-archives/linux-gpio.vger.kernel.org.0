Return-Path: <linux-gpio+bounces-21937-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C713AE1B7D
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jun 2025 15:09:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC419188C76D
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jun 2025 13:09:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ED6128C2AC;
	Fri, 20 Jun 2025 13:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fUV8omc7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8A728AB0B;
	Fri, 20 Jun 2025 13:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750424900; cv=none; b=UtvcRw1lytwDiI5CTK9C4L+H1dcnZGKsW8eVp3UKLjF+DpOC3vGFNes2c8iR/COUR+E7t9936JtBwln54b2HbbFNThztZ1iA6MUwVwYEeFdhUWS3JOK1VP9UrmCZWXfa/lg4uxxE3B1mFsljXkjFmk13P1nwQcen5SUcXy5blN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750424900; c=relaxed/simple;
	bh=P2ugLm9rc6lTQsi2OLAFF1xh4IzvsAbzyIfGrgm71Gg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aWkWcCn9WflRSo3dqhq3JVPH+vHolDsY7BBGSGR6Z6+Nn8wsCS33lL83ovvXNgEcXi0qLDceGypMsJEj0O2ohJWFcTsyl1qhRzB/GUq/+H9UdTG0xHr4fiHCed2axjkdxHljhFywhG7NXe3KmCI6FPHOBZD6/SIgeFQkShVOjZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fUV8omc7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 305C9C4CEE3;
	Fri, 20 Jun 2025 13:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750424900;
	bh=P2ugLm9rc6lTQsi2OLAFF1xh4IzvsAbzyIfGrgm71Gg=;
	h=From:To:Cc:Subject:Date:From;
	b=fUV8omc7aETkqNFd8t8y1InzVR+eyNsj4KbQBrBptggkUw02GLvD+fUEgO47ttWi+
	 LRDsXdIF6dM8/5glULpw/mKiByJHdNQJ8rCJrpSZxKBT1srVWxhqMZTZXQQg1dDPTv
	 YfO1lCWV19x62L7GK7s0fsjO+n+stzJVMCGvWPBa0cPpm6Jlz1fl5iswYD1aHvNEKg
	 IQj4osDUed0GxgE5TvaROG8JdqDhaQ3UyPiXIO5zQPOGC4luWPZwkREZumVD9NfEnD
	 4aZtuvT6eWd1GCZlRS4cPW0OMadXZ+qLArOsgo3z38IhPf3cAaIeqCcXS8UjddYc02
	 VxpPBEja3O5Mg==
From: Arnd Bergmann <arnd@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Pratap Nirujogi <pratap.nirujogi@amd.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: zynq: add CONFIG_OF dependency
Date: Fri, 20 Jun 2025 15:07:55 +0200
Message-Id: <20250620130814.2580678-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The zynq driver can be enabled for compile-testing on builds without
CONFIG_OF, leading to a link error:

ld.lld-21: error: undefined symbol: pinconf_generic_dt_node_to_map
 referenced by pinconf-generic.h:231 (/home/arnd/arm-soc/include/linux/pinctrl/pinconf-generic.h:231)
          drivers/pinctrl/pinctrl-zynq.o:(pinconf_generic_dt_node_to_map_all) in archive vmlinux.a

Prevent this with the proper compile time dependency.

Fixes: 1982621decaf ("pinctrl: Allow compile testing for K210, TB10X and ZYNQ")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/pinctrl/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 753692e9ecf5..ddd11668457c 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -603,6 +603,7 @@ config PINCTRL_TH1520
 config PINCTRL_ZYNQ
 	bool "Pinctrl driver for Xilinx Zynq"
 	depends on ARCH_ZYNQ || COMPILE_TEST
+	depends on OF
 	select PINMUX
 	select GENERIC_PINCONF
 	help
-- 
2.39.5


