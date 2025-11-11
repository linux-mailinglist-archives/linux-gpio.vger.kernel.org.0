Return-Path: <linux-gpio+bounces-28341-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C11EFC4BB4B
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Nov 2025 07:41:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 607C13B8C23
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Nov 2025 06:40:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 980D5313268;
	Tue, 11 Nov 2025 06:40:50 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5BD314A9F;
	Tue, 11 Nov 2025 06:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762843246; cv=none; b=KzLQIiJJzBmwNwaF4S9D0JhMXyLYQ9bjjWFcKgoyZrmKwM0u6Rvt71TPzr9sdRz0oDrcjRk4BiVpA476+Pu79XFwdtqCSkCWIS58CvZK7tSdo3g2a3dCaJ9e8JHq3J84M2ASlIjTKvn7LtLy+o5zPCEmwqedGxOrFGSu5owt2/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762843246; c=relaxed/simple;
	bh=0e/LpS+UQIDInEBLu3LvJz83cLD0QUZ9H/1qHnlJo1w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=J7WQC7XHm/xW0KXngro9uvOA+Hjx80jtfw/Ct6gOS0erHIH68yZUSmiAYbLimepCLIjHdsE2f7k55AB11Ki3i3Cf0J7UShbez/0iZeSDanBy2YINlqdcC0xb3g1qMowrJnYFs18q1mZUlOnpYEc73H8u7/lkxyojbXTdUePLov4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-05 (Coremail) with SMTP id zQCowAD3_G1M2hJppG1TAA--.18085S2;
	Tue, 11 Nov 2025 14:40:12 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: lorenzo@kernel.org,
	sean.wang@kernel.org,
	linus.walleij@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] pinctrl: airoha: convert comma to semicolon
Date: Tue, 11 Nov 2025 14:29:44 +0800
Message-Id: <20251111062944.3820079-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAD3_G1M2hJppG1TAA--.18085S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KF17ur4DKrWUZF4ktF1xGrg_yoW8XF1xp3
	y3Cr4Y9F1UJFZxZa4Sya18XayfGa93J3WUK34jg348XF1fCrWDJan0ga45trWDuF4qvF45
	tF4UJ34agFW8ArUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBj14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
	xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
	8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxkIecxEwVAFwVW8AwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JU-6pPUUUUU=
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

Replace comma between expressions with semicolons.

Using a ',' in place of a ';' can have unintended side effects.
Although that is not the case here, it is seems best to use ';'
unless ',' is intended.

Found by inspection.
No functional change intended.
Compile tested only.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index bfcedc7f920b..983d96fd399a 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -2892,12 +2892,12 @@ static int airoha_pinctrl_probe(struct platform_device *pdev)
 
 	/* Init pinctrl desc struct */
 	pinctrl->desc.name = KBUILD_MODNAME;
-	pinctrl->desc.owner = THIS_MODULE,
-	pinctrl->desc.pctlops = &airoha_pctlops,
-	pinctrl->desc.pmxops = &airoha_pmxops,
-	pinctrl->desc.confops = &airoha_confops,
-	pinctrl->desc.pins = data->pins,
-	pinctrl->desc.npins = data->num_pins,
+	pinctrl->desc.owner = THIS_MODULE;
+	pinctrl->desc.pctlops = &airoha_pctlops;
+	pinctrl->desc.pmxops = &airoha_pmxops;
+	pinctrl->desc.confops = &airoha_confops;
+	pinctrl->desc.pins = data->pins;
+	pinctrl->desc.npins = data->num_pins;
 
 	err = devm_pinctrl_register_and_init(dev, &pinctrl->desc,
 					     pinctrl, &pinctrl->ctrl);
-- 
2.25.1


