Return-Path: <linux-gpio+bounces-3530-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC6085CC01
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Feb 2024 00:24:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC9782818FF
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Feb 2024 23:24:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 439A6154C05;
	Tue, 20 Feb 2024 23:24:45 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw22-7.mail.saunalahti.fi (fgw22-7.mail.saunalahti.fi [62.142.5.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7916D135416
	for <linux-gpio@vger.kernel.org>; Tue, 20 Feb 2024 23:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708471485; cv=none; b=YRxOS0lMTtJz60FNmaE1qm5bjl7AH84GeZhhptD5OeKeAmCSBvEqTKocdJyELBkzcg9CX48HcAHIvWLE5ajb3sMo2sd3i6nXKUi++fk3rFhE99sarzwcAsL4shTaVZSQuX2G/uicZmX3RDVbFhdofXudyIkPU0EjdLym9kycylg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708471485; c=relaxed/simple;
	bh=YzA2k/AdymtzIhBonHaiNWOg2C4Dk+kM9Xbi3ONFdlw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TEJdn4bqWT4ig6I7mLoFJv3QVzyaoV+nBlI7VHu5Rl6u6ZWRdZi7/AoUzAKMQOi0rBonqBb2Uva3LJr/fsLKDCdjzfYjsYkMdiGoseGmS8dD2dR+D4FYub6D+GEbKDOuiWBxKpNbuHYCpu45sMzM4Gv742JrwnpCIMPjFb46wHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-217.elisa-laajakaista.fi [88.113.26.217])
	by fgw22.mail.saunalahti.fi (Halon) with ESMTP
	id 1007d64b-d047-11ee-a9de-005056bdf889;
	Wed, 21 Feb 2024 01:23:32 +0200 (EET)
From: andy.shevchenko@gmail.com
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v1 1/1] gpio: mmio: Support 64-bit BE access
Date: Wed, 21 Feb 2024 01:23:28 +0200
Message-ID: <20240220232328.1881707-1-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.43.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use ioread64be()/iowrite64be() for 64-bit BE access.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/gpio/gpio-mmio.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index 71e1af7c2184..cd5ef9233152 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -92,12 +92,12 @@ static unsigned long bgpio_read32(void __iomem *reg)
 #if BITS_PER_LONG >= 64
 static void bgpio_write64(void __iomem *reg, unsigned long data)
 {
-	writeq(data, reg);
+	iowrite64(data, reg);
 }
 
 static unsigned long bgpio_read64(void __iomem *reg)
 {
-	return readq(reg);
+	return ioread64(reg);
 }
 #endif /* BITS_PER_LONG >= 64 */
 
@@ -121,6 +121,18 @@ static unsigned long bgpio_read32be(void __iomem *reg)
 	return ioread32be(reg);
 }
 
+#if BITS_PER_LONG >= 64
+static void bgpio_write64be(void __iomem *reg, unsigned long data)
+{
+	iowrite64be(data, reg);
+}
+
+static unsigned long bgpio_read64be(void __iomem *reg)
+{
+	return ioread64be(reg);
+}
+#endif /* BITS_PER_LONG >= 64 */
+
 static unsigned long bgpio_line2mask(struct gpio_chip *gc, unsigned int line)
 {
 	if (gc->be_bits)
@@ -445,9 +457,8 @@ static int bgpio_setup_accessors(struct device *dev,
 #if BITS_PER_LONG >= 64
 	case 64:
 		if (byte_be) {
-			dev_err(dev,
-				"64 bit big endian byte order unsupported\n");
-			return -EINVAL;
+			gc->read_reg	= bgpio_read64be;
+			gc->write_reg	= bgpio_write64be;
 		} else {
 			gc->read_reg	= bgpio_read64;
 			gc->write_reg	= bgpio_write64;
-- 
2.43.2


