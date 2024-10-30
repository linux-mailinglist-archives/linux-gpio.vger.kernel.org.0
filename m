Return-Path: <linux-gpio+bounces-12302-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF859B5FAD
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2024 11:03:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 416C41C21868
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2024 10:03:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F3101E04BC;
	Wed, 30 Oct 2024 10:03:54 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CE01E22F0
	for <linux-gpio@vger.kernel.org>; Wed, 30 Oct 2024 10:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730282634; cv=none; b=FqE4IWQrMksPukUi/RrG7mzMVox/qP7qb7OoBcjlXkl2pyorUd8P29oI6WYtarccTUPrSqSkS8btC0kYJTbPb+hZgWT8MbSfmuTuKgb/KwK5TuLYsyqou/ESio8fsxe9BOtQMW0z+t2llaXJQX0vSvbSQbsVk8XcETDUhlJjXoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730282634; c=relaxed/simple;
	bh=2cCEL9RNEPA/wSwV1FpgaIWUGyOAFLvkcTMhuuH2In0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lwOcvBvn1aMFCnzvwMlUlSZWvP5eYJTTPrxlMQ6LZP3xOALKKbyoHkT3fTgDBcGww2RyJQ2CjASwjK8eJxH7NMAuMQ5LSwYGVyRPZCaf9BsfjC5X2Bt7u0R9zeKSkHZtaAOjTwj83/ghAk45y2/BqlKIjviQPTU6MOqHiQOB4dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:ceb8:3fda:3601:820f])
	by andre.telenet-ops.be with cmsmtp
	id Wa3o2D0064BbGPD01a3olR; Wed, 30 Oct 2024 11:03:48 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1t65Y1-005zPF-Jg;
	Wed, 30 Oct 2024 11:03:48 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1t65YJ-006QV3-UG;
	Wed, 30 Oct 2024 11:03:47 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andreas Larsson <andreas@gaisler.com>
Cc: linux-gpio@vger.kernel.org,
	sparclinux@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] gpio: GPIO_GRGPIO should depend on OF_GPIO
Date: Wed, 30 Oct 2024 11:03:46 +0100
Message-Id: <140b0f7522ff2f86a7fad0be88c19111fa6cb5b1.1730282507.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While the Aeroflex Gaisler GRGPIO driver has no build-time dependency on
gpiolib-of, it supports only DT-based configuration, and is used only on
DT systems.  Hence re-add the dependency on OF_GPIO, to prevent asking
the user about this driver when configuring a kernel without DT support.

Fixes: bc40668def384256 ("gpio: grgpio: drop Kconfig dependency on OF_GPIO")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpio/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 158ec0d7e52e2e51..a7b27a8541f572d5 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -341,6 +341,7 @@ config GPIO_GRANITERAPIDS
 
 config GPIO_GRGPIO
 	tristate "Aeroflex Gaisler GRGPIO support"
+	depends on OF_GPIO || COMPILE_TEST
 	select GPIO_GENERIC
 	select IRQ_DOMAIN
 	help
-- 
2.34.1


