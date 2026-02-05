Return-Path: <linux-gpio+bounces-31459-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNmtOlJVhGkx2gMAu9opvQ
	(envelope-from <linux-gpio+bounces-31459-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Feb 2026 09:31:14 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC1AEFE8F
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Feb 2026 09:31:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 550303011C47
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Feb 2026 08:31:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A2413624D7;
	Thu,  5 Feb 2026 08:31:03 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6722BE657;
	Thu,  5 Feb 2026 08:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770280263; cv=none; b=fxgHwq+A6SpjFiI5EEdK59wDEe5sWQR5Nr6Qv0BYjuUG5UNQuquBVwFoLPAxaLolboPT294+Q8iYdvjxdVjzZWAyAq6hbeVcd6ngGkG8chGiiLmP8sxAY7FQ+cp/Kq5RsUpmTchQVQxZiAS32jOkw/6nnpKyfRBZPiEn1qyA1VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770280263; c=relaxed/simple;
	bh=yyxQ4xPUTLpRqssRMNluN7wt8FgekanvnEKoaVZvP9c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=M7kZys6AhFPJvAJgLPvcDcscR8V47tVlMkg+ZgCevCu+i/PL9lBnI2zaxaAp8jQCLMLvHPqCqZ/xdYYaMo2YIHFz5zPWc/Bn7nvBxzUsmxjzSEBYi5MzyfUSJtNp2avkGn0WVd+JI7AcTbdNhP06hr6KQywfp4nZCkf7mEwv52g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-03 (Coremail) with SMTP id rQCowAAnC+I6VYRplwO7Bw--.17422S2;
	Thu, 05 Feb 2026 16:30:50 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: zhuyinbo@loongson.cn,
	linusw@kernel.org,
	brgl@kernel.org,
	ziyao@disroot.org,
	chenhuacai@kernel.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] gpio: loongson-64bit: Fix NULL check after devm_kcalloc() in loongson_gpio_init_irqchip()
Date: Thu,  5 Feb 2026 15:26:49 +0800
Message-Id: <20260205072649.3271158-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAAnC+I6VYRplwO7Bw--.17422S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Gr4xWrykZFyrZr1fJr18Zrb_yoWDJrgE9F
	yIyrWkGF4DKFnF9a47Z3yfArW2v34DZF1FvF4qyFW5Xas8G3s5Zry7ur1agFnrWr98Zas8
	WFZYgrWxAwnxCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbs8FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s
	1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0
	cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8Jw
	ACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_JF0_
	Jw1lc2xSY4AK67AK6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI
	8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
	xVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI
	8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280
	aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43
	ZEXa7VUjvD73UUUUU==
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31459-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[nichen@iscas.ac.cn,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.935];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 7EC1AEFE8F
X-Rspamd-Action: no action

Fix incorrect NULL check in loongson_gpio_init_irqchip().
The function checks chip->parent instead of chip->irq.parents.

Fixes: 03c146cb6cd1 ("gpio: loongson-64bit: Add support for Loongson-2K0300 SoC")
Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/gpio/gpio-loongson-64bit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-loongson-64bit.c b/drivers/gpio/gpio-loongson-64bit.c
index 77d07e31366f..0fdf15faa344 100644
--- a/drivers/gpio/gpio-loongson-64bit.c
+++ b/drivers/gpio/gpio-loongson-64bit.c
@@ -263,7 +263,7 @@ static int loongson_gpio_init_irqchip(struct platform_device *pdev,
 	chip->irq.num_parents = data->intr_num;
 	chip->irq.parents = devm_kcalloc(&pdev->dev, data->intr_num,
 					 sizeof(*chip->irq.parents), GFP_KERNEL);
-	if (!chip->parent)
+	if (!chip->irq.parents)
 		return -ENOMEM;
 
 	for (i = 0; i < data->intr_num; i++) {
-- 
2.25.1


