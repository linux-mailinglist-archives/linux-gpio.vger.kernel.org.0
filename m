Return-Path: <linux-gpio+bounces-17740-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D6FA675C4
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Mar 2025 15:01:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF82988205F
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Mar 2025 13:59:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 660C620DD65;
	Tue, 18 Mar 2025 13:58:52 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1210420DD7D
	for <linux-gpio@vger.kernel.org>; Tue, 18 Mar 2025 13:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742306332; cv=none; b=jaSRgFML5n6VhrczAJvp4P46X+LavwyN3/TcW6WsJilb4v9f+bkngdI9ZmDu1jEi5TTN5jr7PZxWLE8bSjK50ePdx11JCMZlgh9Kb6wCvI7qvpnpifyFtqVwlcTZI93TiHkgKC8ngyXG2HGZEpRGPQk8pdf2aFslVeCfAYQgRhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742306332; c=relaxed/simple;
	bh=2QToEdbpL6+FocBQLJ7TEfWyDI8PLPgnryVNeyWaCFk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K2K1QbP6thiRuEfE+zUMdzdTdooRv9D0HOnWYVn/3SMg+qxtPMrFlbx4C4qnP/YJzgBfln6QaCw3fu+nRVWFPaBQcBEOwPPBpdyJfZAbznDC5EcIsWeFFpsNut82C9sTJADZb835tnAMG4rdcqrCt61XjOkDCIY6/ayQuoSlIq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:2568:e3d1:1e11:17f3])
	by laurent.telenet-ops.be with cmsmtp
	id SDyj2E0091Mz0fJ01Dyj30; Tue, 18 Mar 2025 14:58:43 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tuXSS-0000000EecJ-1JM6;
	Tue, 18 Mar 2025 14:58:43 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tuXSt-0000000AJqr-1H6O;
	Tue, 18 Mar 2025 14:58:43 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>,
	Pratap Nirujogi <pratap.nirujogi@amd.com>,
	Benjamin Chan <benjamin.chan@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-gpio@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: PINCTRL_AMDISP should depend on DRM_AMD_ISP
Date: Tue, 18 Mar 2025 14:58:40 +0100
Message-ID: <3685561e8e3cd1d94bce220eeb6001d659da615c.1742306024.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AMD Image Signal Processor GPIO pin control functionality is only
present on AMD platforms with ISP support, and its platform device is
instantiated by the AMD ISP driver.  Hence add a dependency on
DRM_AMD_ISP, to prevent asking the user about this driver when
configuring a kernel that does not support the AMD ISP.

Fixes: e97435ab09f3ad7b ("pinctrl: amd: isp411: Add amdisp GPIO pinctrl")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index cbb81f65c6eb22f0..0b355a7e7eeec412 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -51,6 +51,7 @@ config PINCTRL_AMD
 
 config PINCTRL_AMDISP
 	tristate "AMDISP GPIO pin control"
+	depends on DRM_AMD_ISP || COMPILE_TEST
 	depends on HAS_IOMEM
 	select GPIOLIB
 	select PINCONF
-- 
2.43.0


