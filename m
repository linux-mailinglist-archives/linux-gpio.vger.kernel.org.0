Return-Path: <linux-gpio+bounces-24402-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4171CB275B9
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Aug 2025 04:29:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1E0C17B183C
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Aug 2025 02:27:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 918B029B20C;
	Fri, 15 Aug 2025 02:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="biwp2D5m"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C995529ACF5;
	Fri, 15 Aug 2025 02:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755224845; cv=none; b=glfM30qPJlgCwhv9H0BvoFR1KalSD+y81bN78qXBhj0tmLQqGVRyXmxmekT1quplDnJvxUrtAMVuVQ8QfsaPf00vj4+aYcSqjoxMqKLaDQlrCO2t1EnwyWggdG/dHpKCz9IwORjlK3nnEtTLJxxXPZI2SH5NKG5df1C8mr93dCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755224845; c=relaxed/simple;
	bh=SPUlJAsxeVPh1fluBxtH3c61kgFUGjCAecrMFG14XYA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nuG8mzFQbSCD/1+m1gpy50nGyuTuhKP9126gyKmi3dMXZGIKmv9jI5c4cWrm2yG5aiBY9SwNvhlexOajGT3Hz1+ALTvWFQVBh4sYZuXB9qUJnf4hzG8wbFhMqwbqrsPK5uuoqpUMws3F045bLqmH3P0BmUSImcQwib/Ydc6vdLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=biwp2D5m; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=jAFtE/ePYGuWutoDVCGDOUO0gMQwmxqZYGhlQERZi2w=; b=biwp2D5m6oX9/fMc52nhqyh4sd
	n9NKvKXWSTA6WXhODo0AbrZ0pdfwG1Qkhm5e+DIJcWiLsMjZ1XpgNLA2/gcmwxANYvoHIhNH3Sg+c
	QmnOWQP2Sv5Sv3TF48nTAMIXyvgJcFRaX+5UEC8pXDaJT+IVWyeP2ewHWUedGun6GtgTKCoDrP5zR
	JCBux6Zf0o6CroQbXxbCMjYlqE45LXRC6Pfkcm0wMSNtMGo3KUyu249SEgUb4FKc2pCD4ma1M3iYw
	geqv6oJuUvOgROK7ifG8At5gs3Lw5DIEn46upftnghUM8fX0zbVSmppVwqYuucU+DwkPtRXyPRipE
	puk/qQ/A==;
Received: from [50.53.25.54] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umkA6-000000019Ra-18ui;
	Fri, 15 Aug 2025 02:27:22 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Amelie Delaunay <amelie.delaunay@st.com>,
	Lee Jones <lee.jones@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: [PATCH] pintctl: STMFX: add missing HAS_IOMEM dependency
Date: Thu, 14 Aug 2025 19:27:21 -0700
Message-ID: <20250815022721.1650885-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When building on ARCH=um (which does not set HAS_IOMEM), kconfig
reports an unmet dependency caused by PINCTRL_STMFX. It selects
MFD_STMFX, which depends on HAS_IOMEM. To stop this warning,
PINCTRL_STMFX should also depend on HAS_IOMEM.

kconfig warning:
WARNING: unmet direct dependencies detected for MFD_STMFX
  Depends on [n]: HAS_IOMEM [=n] && I2C [=y] && OF [=y]
  Selected by [y]:
  - PINCTRL_STMFX [=y] && PINCTRL [=y] && I2C [=y] && OF_GPIO [=y]

Fixes: 1490d9f841b1 ("pinctrl: Add STMFX GPIO expander Pinctrl/GPIO driver")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Amelie Delaunay <amelie.delaunay@st.com>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org

 drivers/pinctrl/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20250814.orig/drivers/pinctrl/Kconfig
+++ linux-next-20250814/drivers/pinctrl/Kconfig
@@ -539,6 +539,7 @@ config PINCTRL_STMFX
 	tristate "STMicroelectronics STMFX GPIO expander pinctrl driver"
 	depends on I2C
 	depends on OF_GPIO
+	depends on HAS_IOMEM
 	select GENERIC_PINCONF
 	select GPIOLIB_IRQCHIP
 	select MFD_STMFX

