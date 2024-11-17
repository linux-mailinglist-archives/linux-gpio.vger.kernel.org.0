Return-Path: <linux-gpio+bounces-13058-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 261CD9D034F
	for <lists+linux-gpio@lfdr.de>; Sun, 17 Nov 2024 12:45:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 983581F23032
	for <lists+linux-gpio@lfdr.de>; Sun, 17 Nov 2024 11:45:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 346C214900E;
	Sun, 17 Nov 2024 11:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eGUEgnSV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10F66AA7;
	Sun, 17 Nov 2024 11:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731843944; cv=none; b=QM/TDwgUpr74Ze5ec73jsYOTHW77ViH7RSZd6EyxLrPvJnlp62g4bRKbMnPpnh8EyISdJ11tU1ppeUya/Or1boN3inSE8BycFgxYZlBLX8NDqsH/stRwcHOxQ2bW7UYbm0WOAEsR+Jgzn7TDBHBXk3OEByf37cTbMegO/H9SucU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731843944; c=relaxed/simple;
	bh=WaUpZJgl59YzipJ0kAPa5ZUnQ2h5lltdWBavhDkQf0M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=X7PTx2F7twbA98UFplVTW177hFeyhd0OAmdO/ikowHSdB0evVrkjIwLDpmbkfJvTlSppi8sJrdj5Xvcr3WgBU4WggF9l1hmD3H80ZDzzX3Pkb+1h8IN3Eny1XyFnAxx6ChVeXEcNFFcS8kSQFcci9BdGr1mMyVdzstWccdZ4TDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eGUEgnSV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FD8FC4CED8;
	Sun, 17 Nov 2024 11:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731843943;
	bh=WaUpZJgl59YzipJ0kAPa5ZUnQ2h5lltdWBavhDkQf0M=;
	h=From:To:Cc:Subject:Date:From;
	b=eGUEgnSVL17XsKDEl+xI+13lYs6hsEHSWhiTNo9PwYvPuuuII/oTVCsODqD2h82Vy
	 stqkD9tA+NibANaR0xiIO40MYVJJntPO9nJycF2HhgVzjp2qFhCf66bQ11h3I6CDIE
	 4mT4PIQ8/aR74+2/pP4xiR674pcGWEoVnx1RyKyucAVDZ0NPCo/u2q9nESfOVPnStv
	 KA3KIyEAc908v4q1nWIYnhjTGG6//y1gEuzjXJJPk+NI+eeI44gyoVuGN9ElNv/IXc
	 hCOFH4CsnVKRhg441fDQyWLn4wcQtcU6gtLmWMna7NKGii/1MSixpqS/fQash9tRAB
	 afPTnVMN371wg==
From: Kees Cook <kees@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] pinctrl: airoha: Use unsigned long for bit search
Date: Sun, 17 Nov 2024 03:45:38 -0800
Message-Id: <20241117114534.work.292-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2769; i=kees@kernel.org; h=from:subject:message-id; bh=WaUpZJgl59YzipJ0kAPa5ZUnQ2h5lltdWBavhDkQf0M=; b=owGbwMvMwCVmps19z/KJym7G02pJDOmW15OY+ArTEmyFrWfl7Re2OJn69UpMy3EDQ1cXuRt13 1MnzHrWUcrCIMbFICumyBJk5x7n4vG2Pdx9riLMHFYmkCEMXJwCMBHpI4wM3yJmvOF8+Y0h59rR 30xq5pGlQnqPBbZ8Leuqvnynb4FyGsM/mwsHM21iXz3xTfm8uUg6+Feka63IqT1HHFTnzA5c6b+ UGQA=
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Instead of risking alignment problems and causing (false positive) array
bound warnings when casting a u32 to (64-bit) unsigned long, just use a
native unsigned long for doing bit searches. Avoids warning with GCC 15's
-Warray-bounds -fdiagnostics-details:

In file included from ../include/linux/bitmap.h:11,
                 from ../include/linux/cpumask.h:12,
                 from ../arch/x86/include/asm/paravirt.h:21,
                 from ../arch/x86/include/asm/irqflags.h:80,
                 from ../include/linux/irqflags.h:18,
                 from ../include/linux/spinlock.h:59,
                 from ../include/linux/irq.h:14,
                 from ../include/linux/irqchip/chained_irq.h:10,
                 from ../include/linux/gpio/driver.h:8,
                 from ../drivers/pinctrl/mediatek/pinctrl-airoha.c:11:
In function 'find_next_bit',
    inlined from 'airoha_irq_handler' at ../drivers/pinctrl/mediatek/pinctrl-airoha.c:2394:3:
../include/linux/find.h:65:23: error: array subscript 'long unsigned int[0]' is partly outside array bounds of 'u32[1]' {aka 'unsigned int[1]'} [-Werror=array-bounds=]
   65 |                 val = *addr & GENMASK(size - 1, offset);
      |                       ^~~~~
../drivers/pinctrl/mediatek/pinctrl-airoha.c: In function 'airoha_irq_handler':
../drivers/pinctrl/mediatek/pinctrl-airoha.c:2387:21: note: object 'status' of size 4
 2387 |                 u32 status;
      |                     ^~~~~~

Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Sean Wang <sean.wang@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-mediatek@lists.infradead.org
Cc: linux-gpio@vger.kernel.org
---
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index 7692e6d9b871..547a798b71c8 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -2384,15 +2384,16 @@ static irqreturn_t airoha_irq_handler(int irq, void *data)
 
 	for (i = 0; i < ARRAY_SIZE(irq_status_regs); i++) {
 		struct gpio_irq_chip *girq = &pinctrl->gpiochip.chip.irq;
-		u32 status;
+		u32 regmap;
+		unsigned long status;
 		int irq;
 
 		if (regmap_read(pinctrl->regmap, pinctrl->gpiochip.status[i],
-				&status))
+				&regmap))
 			continue;
 
-		for_each_set_bit(irq, (unsigned long *)&status,
-				 AIROHA_PIN_BANK_SIZE) {
+		status = regmap;
+		for_each_set_bit(irq, &status, AIROHA_PIN_BANK_SIZE) {
 			u32 offset = irq + i * AIROHA_PIN_BANK_SIZE;
 
 			generic_handle_irq(irq_find_mapping(girq->domain,
-- 
2.34.1


