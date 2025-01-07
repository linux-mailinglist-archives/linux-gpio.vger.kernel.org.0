Return-Path: <linux-gpio+bounces-14552-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 80915A03480
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2025 02:26:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0EC051885954
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2025 01:26:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D319126AF3;
	Tue,  7 Jan 2025 01:26:32 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE2218641;
	Tue,  7 Jan 2025 01:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736213192; cv=none; b=d/0ihyDmoHpWtNBe2TduB1OOMWnIbWaejziVS5YWKOZ51prCgixbKQ8DVykLh/J2jO7JsJebGejj2uISrWJDKRrQoay6i1ubv6fo3anqAu7yhIwP9kDfwyWNahU6CnmbDowVRvnVg7CYWaDvtfXsWCJEqLPqAe1AILbtDj1z33I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736213192; c=relaxed/simple;
	bh=O5GuwLNuBmNK+ii9vKvjPOmc8Fqv8knVgE1r1JSl750=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=I6iWRw/vvTQJfc2tNqXB90wW0LAYJQpTGaMcsfnBEe6HtAJ17R3FlE6xInGKmJzyxF1gLxHqyrUfPIbTEJsSG7mI3QiInjKSF+ODFqKLesgJo5EgxuK81RJh4PegnHGWO1SvaiyaYSUZ5jgCIjVfgNPwQ+hzfSEiXOV53Q7pM0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from icess-ProLiant-DL380-Gen10.. (unknown [183.174.60.14])
	by APP-01 (Coremail) with SMTP id qwCowAD3_la1gnxnyq3eBQ--.45780S2;
	Tue, 07 Jan 2025 09:26:21 +0800 (CST)
From: Ma Ke <make24@iscas.ac.cn>
To: kumaravel.thiagarajan@microchip.com,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ma Ke <make24@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH v2] misc: microchip: pci1xxxx: Fix possible double free in error handling path
Date: Tue,  7 Jan 2025 09:26:11 +0800
Message-Id: <20250107012611.645565-1-make24@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAD3_la1gnxnyq3eBQ--.45780S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kr48ZryUGry8tF4xWF15Jwb_yoW8Cryfpa
	9xta47XrW8t39xKr48Za4jyF1Skw40ka45WrW2kw1a9asxAFyayFW09r9F9w1DWrWUt3WS
	yF17KrWUGa1DZaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9j14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr
	0_Cr1UM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
	Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJV
	W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI2
	0VAGYxC7MxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
	C2KfnxnUUI43ZEXa7VUbE1v3UUUUU==
X-CM-SenderInfo: ppdnvj2u6l2u1dvotugofq/

When auxiliary_device_add() returns error and then calls
auxiliary_device_uninit(), the callback function
gp_auxiliary_device_release() calls kfree() to free memory. Do not
call kfree() again in the error handling path.

Fix this by skipping the redundant kfree().

Found by code review.

Cc: stable@vger.kernel.org
Fixes: 393fc2f5948f ("misc: microchip: pci1xxxx: load auxiliary bus driver for the PIO function in the multi-function endpoint of pci1xxxx device.")
Signed-off-by: Ma Ke <make24@iscas.ac.cn>
---
Changes in v2:
- modified the patch omitted.
---
 drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c
index 32af2b14ff34..de75d89ef53e 100644
--- a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c
+++ b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c
@@ -111,6 +111,7 @@ static int gp_aux_bus_probe(struct pci_dev *pdev, const struct pci_device_id *id
 
 err_aux_dev_add_1:
 	auxiliary_device_uninit(&aux_bus->aux_device_wrapper[1]->aux_dev);
+	goto err_aux_dev_add_0;
 
 err_aux_dev_init_1:
 	ida_free(&gp_client_ida, aux_bus->aux_device_wrapper[1]->aux_dev.id);
@@ -120,6 +121,7 @@ static int gp_aux_bus_probe(struct pci_dev *pdev, const struct pci_device_id *id
 
 err_aux_dev_add_0:
 	auxiliary_device_uninit(&aux_bus->aux_device_wrapper[0]->aux_dev);
+	goto err_ret;
 
 err_aux_dev_init_0:
 	ida_free(&gp_client_ida, aux_bus->aux_device_wrapper[0]->aux_dev.id);
@@ -127,6 +129,7 @@ static int gp_aux_bus_probe(struct pci_dev *pdev, const struct pci_device_id *id
 err_ida_alloc_0:
 	kfree(aux_bus->aux_device_wrapper[0]);
 
+err_ret:
 	return retval;
 }
 
-- 
2.25.1


