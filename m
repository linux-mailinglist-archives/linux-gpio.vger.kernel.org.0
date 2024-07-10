Return-Path: <linux-gpio+bounces-8161-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D6692CD01
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jul 2024 10:29:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F381CB24246
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jul 2024 08:29:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8906512A14C;
	Wed, 10 Jul 2024 08:28:56 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E332512C549;
	Wed, 10 Jul 2024 08:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720600136; cv=none; b=jA3SD+yLhC/eiX7OCATbIYS4yVcISmjV/C8i8LV7L6IzcxDE9z1fDB+6Ai/ehjrWeztM/gEDro0xbCbBwtR7Qz/OHQLhjlEsPi6t9ZbcVIpehjqhghOSE+2++l8CihIYQg5tTScyHiEWupC04E7pefZRlPkmYZN61Lb3wgcFBCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720600136; c=relaxed/simple;
	bh=Fzz5H2IBbo9sOJO1IirQSVT8MWh8tE0AqIx/b5n/IUs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RmCTM6xIPpV8moDXXLNSs/QfznPx7ZZJWaAMw8Yl00EHNd7PgBLYSxxXepkA4cxhFciisVyJXAirF+AYaT54BkIwK2CnmxHA9yCeDXDi9ImdtNbnzgAf8ZPF4+sRt6hSz0ZOdoWzkzwwuu/ulwHSqvNoBQ/fws7D4VPCmfKIYAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-03 (Coremail) with SMTP id rQCowADHzpo9Ro5mSR0CFQ--.49246S2;
	Wed, 10 Jul 2024 16:28:45 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	grant.likely@secretlab.ca
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH v2] gpio: mc33880: Convert comma to semicolon
Date: Wed, 10 Jul 2024 16:28:13 +0800
Message-Id: <20240710082813.2287329-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowADHzpo9Ro5mSR0CFQ--.49246S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Jw4UZF17GFy5tr45Jw1DWrg_yoW3XrX_Cw
	nYqF43Wr1UKr4qvrnxAayav34S9ryvgrs5uFZ2qFZ8AryDZF18ur17Zr1xXry8XF1DGry3
	J3Z3Wry5XFZxCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbckFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26F4j6r4UJwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8
	ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r
	1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij
	64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr
	0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF
	0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUgqXQUUUUU=
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

Replace a comma between expression statements by a semicolon.

Fixes: c103de240439 ("gpio: reorganize drivers")
Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
Changelog:

v1 -> v2:

1. Add Fixes tag.
---
 drivers/gpio/gpio-mc33880.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mc33880.c b/drivers/gpio/gpio-mc33880.c
index 94f6fefc011b..5fb357d7b78a 100644
--- a/drivers/gpio/gpio-mc33880.c
+++ b/drivers/gpio/gpio-mc33880.c
@@ -99,7 +99,7 @@ static int mc33880_probe(struct spi_device *spi)
 
 	mc->spi = spi;
 
-	mc->chip.label = DRIVER_NAME,
+	mc->chip.label = DRIVER_NAME;
 	mc->chip.set = mc33880_set;
 	mc->chip.base = pdata->base;
 	mc->chip.ngpio = PIN_NUMBER;
-- 
2.25.1


