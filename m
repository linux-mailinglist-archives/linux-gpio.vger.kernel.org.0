Return-Path: <linux-gpio+bounces-17667-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6DAA644B1
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Mar 2025 09:07:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 865737A32FC
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Mar 2025 08:05:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2641C21B1B9;
	Mon, 17 Mar 2025 08:06:56 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4143721A452
	for <linux-gpio@vger.kernel.org>; Mon, 17 Mar 2025 08:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742198816; cv=none; b=OD5vgSLGYMMTKVdUeCTHmiWSbql5CXHEJI6BDib+beunIV6+nnsgrwQ6uPNXZsZzWnaKgnycwaDlVpfZpNkHLb2Eq34muArxnZEfBkSFBUiuHQF4SpcQVKyzOYCQrPcf6t4uGbgKH/Bx0P8FNPJh7vKPIZmZe0cOEpyYPAQL38c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742198816; c=relaxed/simple;
	bh=IwS/MRO3FOIdYPaX4ZMyYe07/Je/6V4zjZnn/FeR5C8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l5pQ73RCvTOphEwsrOvnZMa8k2nLNy+qYdLpUUlrpgxH2abwt/fLLvJKiMATdFOfJoR6sV0RWSwtMttwK5I1heFUgWMY4rBXEnRPPbI/uqFVpKD30gHSBeCguW7GmOt6Jpg2ylkW9SE008sF1/R0pTU3VZYBszEMGgEMFj4pJLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:2568:e3d1:1e11:17f3])
	by baptiste.telenet-ops.be with cmsmtp
	id Rk6k2E00D1Mz0fJ01k6kYv; Mon, 17 Mar 2025 09:06:45 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tu5UI-0000000EHrW-1BDw;
	Mon, 17 Mar 2025 09:06:44 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tu5Ui-00000001oK6-1IBv;
	Mon, 17 Mar 2025 09:06:44 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>,
	Yixun Lan <dlan@gentoo.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Javier Martinez Canillas <javierm@redhat.com>
Cc: linux-gpio@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: spacemit: PINCTRL_SPACEMIT_K1 should not default to y unconditionally
Date: Mon, 17 Mar 2025 09:06:42 +0100
Message-ID: <6881b8d1ad74ac780af8a974e604b5ef3f5d4aad.1742198691.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Merely enabling compile-testing should not enable additional
functionality.

Fixes: 7ff4faba63571c51 ("pinctrl: spacemit: enable config option")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/spacemit/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/spacemit/Kconfig b/drivers/pinctrl/spacemit/Kconfig
index a2f98b3f8a75580d..d6f6017fd097d326 100644
--- a/drivers/pinctrl/spacemit/Kconfig
+++ b/drivers/pinctrl/spacemit/Kconfig
@@ -7,7 +7,7 @@ config PINCTRL_SPACEMIT_K1
 	bool "SpacemiT K1 SoC Pinctrl driver"
 	depends on ARCH_SPACEMIT || COMPILE_TEST
 	depends on OF
-	default y
+	default ARCH_SPACEMIT
 	select GENERIC_PINCTRL_GROUPS
 	select GENERIC_PINMUX_FUNCTIONS
 	select GENERIC_PINCONF
-- 
2.43.0


