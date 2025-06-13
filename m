Return-Path: <linux-gpio+bounces-21502-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97461AD87BA
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 11:25:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5BA9117C1B0
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 09:25:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 876DC291C04;
	Fri, 13 Jun 2025 09:25:52 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACFE256C73;
	Fri, 13 Jun 2025 09:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749806752; cv=none; b=E8EiBFhlgwdkGslRNXw8nyWhpJx2Ox4fndfBBcjWggplYRfSA4PnyzAgbDazLnXTOfmkAcxUJdy4DhbftIu1gX78BahdbwT+r9OhbIh53NttujEs2JcxevGPiiccVmXn13GYxMG1BUatDJdCkh4G6klYgUVXM2M3UrzWnHhDqIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749806752; c=relaxed/simple;
	bh=4LsCH4BXnTTvUOxPK3fqPjjvv8ORrsKY7zJ0+so7tnI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=WtDdV50/61Yo9xYAtZbdovfXT0/cPtQ8r+PLSOVebNCPClK5lfOJZUaYae87nVgO/njbvfcXwbe8/eZyUgJeyJ0ULAubQCfXEkEOdtcoVp2uNTWKmL6z9KumRyPx9xceQfDRAAlRmoBeO2qQ3cMFsSB0GAkKDZDq0Buocf8jqtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [127.0.0.2] (unknown [210.73.43.2])
	by APP-01 (Coremail) with SMTP id qwCowAAn1tSP7ktoxvw7Bg--.2681S2;
	Fri, 13 Jun 2025 17:25:37 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Date: Fri, 13 Jun 2025 17:25:33 +0800
Subject: [PATCH] gpio: spacemit: Add missing MODULE_DEVICE_TABLE
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250613-k1-gpio-of-table-v1-1-9015da8fdfdb@iscas.ac.cn>
X-B4-Tracking: v=1; b=H4sIAI3uS2gC/x3MTQqAIBBA4avIrBvQ6Q+6SrTImmooVDQiiO6et
 PwW7z2QOAon6NQDkS9J4l2GKRRM2+hWRpmzgTTVujEl7gbXIB79gudoD0YispVtG1vVJeQsRF7
 k/pf98L4fKAWyM2IAAAA=
X-Change-ID: 20250613-k1-gpio-of-table-222b4b76b453
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>
Cc: Vivian Wang <uwu@dram.page>, linux-gpio@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Vivian Wang <wangruikang@iscas.ac.cn>
X-Mailer: b4 0.14.2
X-CM-TRANSID:qwCowAAn1tSP7ktoxvw7Bg--.2681S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Jr15ur4DCry5GF43JFWDJwb_yoW8Jr1xpF
	45Zr9ak3y5GF43tasFvan7ZF18ua1vgFyIgF12kw1xZ3WqkrnFgF4jyFZF934UXryrJrW7
	Xa1DGFyDWF18Ar7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9F14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWUuVWrJwAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
	0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
	zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
	4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
	CwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcS
	sGvfC2KfnxnUUI43ZEXa7VUb8hL5UUUUU==
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/

The gpio-spacemit-k1 driver can be compiled as a module. Add missing
MODULE_DEVICE_TABLE so it can be matched by modalias and automatically
loaded by udev.

Fixes: d00553240ef8 ("gpio: spacemit: add support for K1 SoC")
Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
---
This patch is available at:

https://github.com/dramforever/linux/tree/k1/gpio-of-table/v1
---
 drivers/gpio/gpio-spacemit-k1.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-spacemit-k1.c b/drivers/gpio/gpio-spacemit-k1.c
index f027066365ff8741f99da076d1e7b6339a6c1a22..3cc75c701ec40194e602b80d3f96f23204ce3b4d 100644
--- a/drivers/gpio/gpio-spacemit-k1.c
+++ b/drivers/gpio/gpio-spacemit-k1.c
@@ -278,6 +278,7 @@ static const struct of_device_id spacemit_gpio_dt_ids[] = {
 	{ .compatible = "spacemit,k1-gpio" },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, spacemit_gpio_dt_ids);
 
 static struct platform_driver spacemit_gpio_driver = {
 	.probe		= spacemit_gpio_probe,

---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250613-k1-gpio-of-table-222b4b76b453

Best regards,
-- 
Vivian "dramforever" Wang


