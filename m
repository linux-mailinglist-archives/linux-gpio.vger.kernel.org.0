Return-Path: <linux-gpio+bounces-14525-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51073A02003
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jan 2025 08:41:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2AA93163655
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jan 2025 07:41:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2DBB194A54;
	Mon,  6 Jan 2025 07:41:15 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C891E511;
	Mon,  6 Jan 2025 07:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736149275; cv=none; b=PqS6VPVjnAo3BtAUuPq5rB4QBpZzmUn++CICpzo1E8dpKJvoNmunr1g0h8phC2/rRlHrsmAjUfJKsvhKZvPFbrLvCZbYpr/mT0ziP1MVIiGX7ebn/kLMqYnqxbN+p8bqeXeZzAL3ntL8RDE7h7RRSJLdk00D04jx7Z57fHMoLjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736149275; c=relaxed/simple;
	bh=Bc0Af2iaSeEWl74r0shKj+7+Gy9ECNaYA6mveKyD7WI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MB4cBkXno725RiMfd/t3LB3hsmf+ZqaUEKXj2NSK9f8n/TOOm4UsJYMLU813sV/mDA6Ryoh2jffUq40HSWp4G33tJK4qGMX9rGwNd0tETLIw7lNPWIIIoiMdTcu4hkAe2DKr7ViN6XTqLpVxnYcPHWHCUFLdRTcJaZoAU2LjgxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from icess-ProLiant-DL380-Gen10.. (unknown [183.174.60.14])
	by APP-05 (Coremail) with SMTP id zQCowACnrSkHiXtnhbibBQ--.6936S2;
	Mon, 06 Jan 2025 15:41:01 +0800 (CST)
From: Ma Ke <make24@iscas.ac.cn>
To: kumaravel.thiagarajan@microchip.com,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ma Ke <make24@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] misc: microchip: pci1xxxx: Fix possible double free in error handling path
Date: Mon,  6 Jan 2025 15:40:53 +0800
Message-Id: <20250106074053.312243-1-make24@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowACnrSkHiXtnhbibBQ--.6936S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kr48ZryUGry8tF4xWF15Jwb_yoW8Wry8pa
	9xX3W7Zry8twsxKr48Za4UtF1fAw40ka45WrZFkw1a93ZxJF9IyFWv9r9F9w1DWrWUt3Wf
	tF1UKrWUGa1DZaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvK14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I
	648v4I1lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
	v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
	1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
	AIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI
	42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxh
	VjvjDU0xZFpf9x0JUvg4fUUUUU=
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
 drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c
index 32af2b14ff34..fbd712938bdc 100644
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
-- 
2.25.1


