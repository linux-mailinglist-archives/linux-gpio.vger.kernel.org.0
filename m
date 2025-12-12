Return-Path: <linux-gpio+bounces-29467-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A27CB7A2D
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Dec 2025 03:10:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 911093018BAE
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Dec 2025 02:09:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE82928B3E2;
	Fri, 12 Dec 2025 02:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DSLDxOED"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DFA27B50F;
	Fri, 12 Dec 2025 02:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765505378; cv=none; b=uMZIMy9yuUyLPB2JGNTUYqz438lPGBQWDKfE21TL8SKDMHFvPD0wzWh1WEAKO7VmKDo16P0bD6LRP6zhuSm/x7bJ7yla8y8/XHAcFE9vLHIfNRNNNwzUM42CdDnPzXCTXCuPG0rLX9zsR8GcvU+Ogd8ZtrVZx+6qEstkzVQN3Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765505378; c=relaxed/simple;
	bh=OeIFLbPr26TCY0Miefr9NAxlFzaHXjCzZBffk55dFdQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JFkmzBr5jJ+DM7mpyau9xedfLcxKZkuV4Uk1/COflPluAATwHSWRjmGsZdDBz5YevmxXh2NvdVMezYuHjJd/kSaw2PbI6xCgzdUzesCV89/oqVJC93+F68kGfs7ZRAEmzEAYb4kw/jQxxE3xrXBmVTJMX4HnWT5BOG5mSeddCPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DSLDxOED; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24268C4CEF7;
	Fri, 12 Dec 2025 02:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765505378;
	bh=OeIFLbPr26TCY0Miefr9NAxlFzaHXjCzZBffk55dFdQ=;
	h=From:To:Cc:Subject:Date:From;
	b=DSLDxOEDvnFFbRkqebm7fTujD/L70CJntxHZfW7u+6a2skw+S9u3fiAincArayCcK
	 ENRA0BervzPTJERi8H592EbCOjxK9GFaR2Jh+82ieVqheeOdoUS1SFBGqMjTMWpaus
	 lIj6gnbzjszbcf8v9FGyCGajZ9MetmzNTk5v9qpw+HIZtrIWI7yrWFFXTTRcNFMQJ0
	 aydIEOmccfnkmVUZttGegRA/K1qRaKldSNB2TcX6884pO8w5m2XN+UrJwbPzKhCP4r
	 Tg5HsjLQ9stLPbHGoCuNZsaI3vKsHheyROhXdmDkWP5zC+CrmazjV9WvO4q7ASW2EX
	 1mW5C8McaJkyg==
Received: from johan by theta with local (Exim 4.99)
	(envelope-from <johan@kernel.org>)
	id 1vTsdl-000000007W1-48c3;
	Fri, 12 Dec 2025 11:12:18 +0900
From: Johan Hovold <johan@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2] pinctrl: fix compile test defaults
Date: Fri, 12 Dec 2025 11:10:01 +0900
Message-ID: <20251212021001.28586-1-johan@kernel.org>
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

Default to n instead of ARCH_MICROCHIP as these drivers are not needed
in every Microchip build either.

Fixes: 38cf9d641314 ("pinctrl: add pic64gx "gpio2" pinmux driver")
Fixes: 46397274da22 ("pinctrl: add polarfire soc iomux0 pinmux driver")
Cc: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
---

Changes in v2
 - default to n instead of ARCH_MICROCHIP as suggested by Conor


 drivers/pinctrl/Kconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index bc7f37afc48b..0ea117581bde 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -491,7 +491,6 @@ config PINCTRL_PIC64GX
 	depends on ARCH_MICROCHIP || COMPILE_TEST
 	depends on OF
 	select GENERIC_PINCONF
-	default y
 	help
 	  This selects the pinctrl driver for gpio2 on pic64gx.
 
@@ -511,7 +510,6 @@ config PINCTRL_POLARFIRE_SOC
 	depends on ARCH_MICROCHIP || COMPILE_TEST
 	depends on OF
 	select GENERIC_PINCONF
-	default y
 	help
 	  This selects the pinctrl driver for Microchip Polarfire SoC.
 
-- 
2.52.0


