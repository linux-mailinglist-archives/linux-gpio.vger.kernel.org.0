Return-Path: <linux-gpio+bounces-27498-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E01E9BFF718
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 09:02:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9AA3218C6036
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 07:03:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5E6A27A448;
	Thu, 23 Oct 2025 07:02:52 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19748258CE8;
	Thu, 23 Oct 2025 07:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761202972; cv=none; b=PdmuxVyZMepN8Ov9quOyAABzoJWId0zioN65hGWwBnYbFDb9HjiRoRf2s/W72LjlMG3+L4pKvVYSdOl5C5lDXSTjaX4YR9CpjVbpWguvIJI2VpbmLFxxT1P11S8zHcpQBWRWD52X2q9k40rSPEq+wjsVKVwa9gQAOxh84yP2X0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761202972; c=relaxed/simple;
	bh=L05PgG1YtW0D3VlVaZy9qzh4o6GW8Dmm6/IgBRAjU24=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D9ugDewYlxhqwfva6VLmeE4dPnk1+H9sDVDUcVIny/vWs7xq+JyRvlHeiNba2quXWLX631XibXxh380dJIGFurSD7K8pJr5qxNWxfKCpQpM4fDxx9SX9yQx8GD+bm9sX2wWoq6O34Km+9efC2ok6qQ6kAu3sc0wpF/FfPTDkQ7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from DESKTOP-L0HPE2S (unknown [124.16.141.245])
	by APP-05 (Coremail) with SMTP id zQCowABX+RIM0_lolK3EFA--.30184S2;
	Thu, 23 Oct 2025 15:02:38 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: Lixu Zhang <lixu.zhang@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH] gpio: ljca: Fix duplicated IRQ mapping
Date: Thu, 23 Oct 2025 15:02:30 +0800
Message-ID: <20251023070231.1305-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1.windows.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowABX+RIM0_lolK3EFA--.30184S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Krykuw1UKr1UJr1DJw4ktFb_yoW8Gr45pa
	yagryFkw43tF12y34DC3WDZayY9ay7ta4jkw4jg3s3Zw15JF90yF4YqF909F45tas8Zr4j
	yF9rJF4UuF1qvrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8
	JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUBVbkUUU
	UU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAYEA2j5vRIAfQABsP

The generic_handle_domain_irq() function resolves the hardware IRQ
internally. The driver performed a duplicative mapping by calling
irq_find_mapping() first, which could lead to an RCU stall.

Delete the redundant irq_find_mapping() call and pass the hardware IRQ
directly to generic_handle_domain_irq().

Fixes: c5a4b6fd31e8 ("gpio: Add support for Intel LJCA USB GPIO driver")
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/gpio/gpio-ljca.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-ljca.c b/drivers/gpio/gpio-ljca.c
index 3b4f8830c741..cc67f3db7ecd 100644
--- a/drivers/gpio/gpio-ljca.c
+++ b/drivers/gpio/gpio-ljca.c
@@ -292,16 +292,8 @@ static void ljca_gpio_event_cb(void *context, u8 cmd, const void *evt_data,
 		return;
 
 	for (i = 0; i < packet->num; i++) {
-		irq = irq_find_mapping(ljca_gpio->gc.irq.domain,
-				       packet->item[i].index);
-		if (!irq) {
-			dev_err(ljca_gpio->gc.parent,
-				"gpio_id %u does not mapped to IRQ yet\n",
-				packet->item[i].index);
-			return;
-		}
-
-		generic_handle_domain_irq(ljca_gpio->gc.irq.domain, irq);
+		generic_handle_domain_irq(ljca_gpio->gc.irq.domain,
+					packet->item[i].index);
 		set_bit(packet->item[i].index, ljca_gpio->reenable_irqs);
 	}
 
-- 
2.25.1


