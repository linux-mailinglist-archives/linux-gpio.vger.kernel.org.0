Return-Path: <linux-gpio+bounces-29954-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55726CE4A4D
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Dec 2025 09:50:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 61140300D144
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Dec 2025 08:50:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 355BF2BD01B;
	Sun, 28 Dec 2025 08:50:33 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FA029D291;
	Sun, 28 Dec 2025 08:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766911833; cv=none; b=BhvAuW9PIizXaYVZbFN5YcEMbVOccXuv0yqhM2OcLRHLWzmutU60SAL5P8fir8Cu4xLOlDlRC0+u1/S+aGLGohFAahD8DTo/MOFjVsDxPUkFw97Sx5e4A+scETRtr4O6PLX2zxvIbj8qbtQ2XAbjO9AbcTd/Zceu9dC56TOR/Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766911833; c=relaxed/simple;
	bh=OAoUOEcCoUKhMRe59+mV6WGvEEXyncU1vhw8T47Fb6g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KBzpZX60sGCT/Wc17hjG1/dRYys0agudhGJASUBV+NUVUGDe+KOVgSWC1+Iqt4cTO1fSfLOwJeEj818YkBeXzGoapy3LQVeB04zatAJXQzGaZcPRTctldcdbXZaEBfzM/wPwXroVobhH3UTVcUPQFxrRr/2GxGwWcEySTM1Bfp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass smtp.mailfrom=isrc.iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isrc.iscas.ac.cn
Received: from duge-virtual-machine.localdomain (unknown [183.192.221.253])
	by APP-03 (Coremail) with SMTP id rQCowABHS8JC71BpFy9OAg--.14364S2;
	Sun, 28 Dec 2025 16:50:10 +0800 (CST)
From: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
To: linusw@kernel.org
Cc: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux-gpio@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	gaohan@iscas.ac.cn,
	me@ziyao.cc,
	Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
Subject: [PATCH 1/1] pinctrl: canaan: k230: Fix NULL pointer dereference in device tree parsing
Date: Sun, 28 Dec 2025 16:50:05 +0800
Message-ID: <20251228085005.155760-1-jiayu.riscv@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowABHS8JC71BpFy9OAg--.14364S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zry8XrWUGFWruF4ruF1xKrg_yoW8Zw1rpF
	43Ga98Kr47JF4kWw1rAayDZFya9as7A34fCw13t34Fgwn8tryDX3W5WFWUZws8CFZxCF15
	tr4YyFyj9w1UJr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWUuVWrJwAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x0JUd-B_UUUUU=
X-CM-SenderInfo: 5mld534oul2uny6l223fol2u1dvotugofq/

When probing the k230 pinctrl driver, the kernel triggers a NULL pointer
dereference. The crash trace showed:
[    0.732084] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000068
[    0.740737] ...
[    0.776296] epc : k230_pinctrl_probe+0x1be/0x4fc

In k230_pinctrl_parse_functions(), we attempt to retrieve
the device pointer via info->pctl_dev->dev, but info->pctl_dev is only
initialized after k230_pinctrl_parse_dt() completes.
At the time of DT parsing, info->pctl_dev is still NULL, leading to the invalid
dereference of info->pctl_dev->dev.

Use the already available device pointer from platform_device
instead of accessing through uninitialized pctl_dev.

Signed-off-by: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
---
 drivers/pinctrl/pinctrl-k230.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-k230.c b/drivers/pinctrl/pinctrl-k230.c
index d716f23d83..20f7c0f70e 100644
--- a/drivers/pinctrl/pinctrl-k230.c
+++ b/drivers/pinctrl/pinctrl-k230.c
@@ -65,6 +65,7 @@ struct k230_pmx_func {
 };
 
 struct k230_pinctrl {
+	struct device		*dev;
 	struct pinctrl_desc	pctl;
 	struct pinctrl_dev	*pctl_dev;
 	struct regmap		*regmap_base;
@@ -470,7 +471,7 @@ static int k230_pinctrl_parse_groups(struct device_node *np,
 				     struct k230_pinctrl *info,
 				     unsigned int index)
 {
-	struct device *dev = info->pctl_dev->dev;
+	struct device *dev = info->dev;
 	const __be32 *list;
 	int size, i, ret;
 
@@ -511,7 +512,7 @@ static int k230_pinctrl_parse_functions(struct device_node *np,
 					struct k230_pinctrl *info,
 					unsigned int index)
 {
-	struct device *dev = info->pctl_dev->dev;
+	struct device *dev = info->dev;
 	struct k230_pmx_func *func;
 	struct k230_pin_group *grp;
 	static unsigned int idx, i;
@@ -596,6 +597,8 @@ static int k230_pinctrl_probe(struct platform_device *pdev)
 	if (!info)
 		return -ENOMEM;
 
+	info->dev = dev;
+
 	pctl = &info->pctl;
 
 	pctl->name	= "k230-pinctrl";
-- 
2.52.0


