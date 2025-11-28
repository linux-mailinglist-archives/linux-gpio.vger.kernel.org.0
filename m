Return-Path: <linux-gpio+bounces-29168-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAEAC90F1E
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Nov 2025 07:28:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B5353A9474
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Nov 2025 06:27:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D58052D238A;
	Fri, 28 Nov 2025 06:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="J1NkaL/9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFDA2D0C82;
	Fri, 28 Nov 2025 06:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764311263; cv=none; b=pXFrj7mu9FA0dojzNSYg49Fp8++P43DIqKRNS3OnABS/f5Hc+9qxY5tWFDg8QMZs9h7PF8lw0yLgHeV3PNlm3r/4PiYNMB1npJ+yJMKYrwHuSWfIATTJdfuMGpQil95PLPg/UXTgrOl7flK8R4+pzNyIlkA4mad3/jevmTlnpVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764311263; c=relaxed/simple;
	bh=MAEpRaFgGZKv7w0XjETG/+rH8y2huVq742GiJbrnhHU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=swi8mMj8+2xA4ZwNatkJ8FmB3GZDvikw83wymc+I8hd78ogLxl3DfzjbGHAknriWI29GmM9/4NoYKTfKQ7NDbhrumshA1AG7VeLy5iOPq7yt6t7gki0gwQYj3I0UEqDXAua/DZ8342U/Eqi/Kx0ZfoMwtcXdEDIq9w0kS4ZEqXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=J1NkaL/9; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=qz7Ztv2NoSb3KNqI7o7ihhfHMJaqYz+2LI1CJf3fcPI=; b=J1NkaL/9VUo0AjbFELLgALCrdP
	jRwAmG5Hd3Vbvbbt5RRfAgymlli7WHCusEpgY02m8xFHR49o0iK68lpjT7LuSsjb1XGwd0utlegrw
	W/K0pSSRTRMvYB0YubEs/nkCzwbaBEw6TarV9BYbsqkXJszTkph5YiEo/xGkux33+LxNWDOQdOSSf
	1MNGyZwv+tphYv6SSBlDIY9O0yd6ltokupAdkJBN3GRc3t7cdObueSQv6740lEIp7oFCBJiBMe4uS
	Ag9lVPPndCXZu4HQ5/weatHlct32xlhBWP4y/E/rTPGUqFQP7fSsAqNuac3vZTDTDw9LRNhEMfcmT
	aq8GYZnQ==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOrxD-000000002JO-2vzz;
	Fri, 28 Nov 2025 06:27:39 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Michael Walle <mwalle@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-gpio@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Lee Jones <lee@kernel.org>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH] gpio: regmap: fix kernel-doc notation
Date: Thu, 27 Nov 2025 22:27:39 -0800
Message-ID: <20251128062739.845403-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a ':' to the end of struct member names to prevent kernel-doc
warnings:

Warning: include/linux/gpio/regmap.h:108 struct member 'regmap_irq_line'
 not described in 'gpio_regmap_config'
Warning: include/linux/gpio/regmap.h:108 struct member 'regmap_irq_flags'
 not described in 'gpio_regmap_config'

Fixes: 553b75d4bfe9 ("gpio: regmap: Allow to allocate regmap-irq device")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Michael Walle <mwalle@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: Lee Jones <lee@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
---
 include/linux/gpio/regmap.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-next-20251127.orig/include/linux/gpio/regmap.h
+++ linux-next-20251127/include/linux/gpio/regmap.h
@@ -50,8 +50,8 @@ struct regmap;
  * @regmap_irq_chip:	(Optional) Pointer on an regmap_irq_chip structure. If
  *			set, a regmap-irq device will be created and the IRQ
  *			domain will be set accordingly.
- * @regmap_irq_line	(Optional) The IRQ the device uses to signal interrupts.
- * @regmap_irq_flags	(Optional) The IRQF_ flags to use for the interrupt.
+ * @regmap_irq_line:	(Optional) The IRQ the device uses to signal interrupts.
+ * @regmap_irq_flags:	(Optional) The IRQF_ flags to use for the interrupt.
  *
  * The ->reg_mask_xlate translates a given base address and GPIO offset to
  * register and mask pair. The base address is one of the given register

