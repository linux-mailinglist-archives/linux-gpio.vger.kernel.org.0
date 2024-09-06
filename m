Return-Path: <linux-gpio+bounces-9883-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C4F96F0D7
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Sep 2024 12:04:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66225285992
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Sep 2024 10:04:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B3411C9DD6;
	Fri,  6 Sep 2024 10:03:56 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917B21C9EBB;
	Fri,  6 Sep 2024 10:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725617036; cv=none; b=bdRN5VXCwcaZ9ulLDzd8xBNhw3YjsKm2QgxNX45/MiR1MH06SCvSCItar41cXO736hlhYxy3lw9cJAf8nCtEcy1srzBYa3R2bmQO9aTBwwlFaTb2DiOpBDdi2vY/SHtORSosaXOb2rtee2dyr4ccvEZ0mn4pYzQPB6mC7FVId3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725617036; c=relaxed/simple;
	bh=syRACtjclTgQZCcaMg1Q4dQJy4CvzW1V9k40ZtdMB50=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=M53a53XN7THmxlurw8onzgBrLznWcK+I1Hfk61ph2sNelP9Gwe8lfxZb6WwPkXOJK4a4sVXwPal+RYnv/NXnzqVlLUPHyXHFONVYhNA87nHbGlm5I7HWSa6AlVni2E36k1TFeebbMtHskLwbdQspMN8T8BTAG3bTbmu+ADMpJYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from icess-ProLiant-DL380-Gen10.. (unknown [183.174.60.14])
	by APP-01 (Coremail) with SMTP id qwCowADHzqJw09pmqc2NAQ--.6864S2;
	Fri, 06 Sep 2024 18:03:33 +0800 (CST)
From: Ma Ke <make24@iscas.ac.cn>
To: linus.walleij@linaro.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	bartosz.golaszewski@linaro.org,
	patrice.chotard@foss.st.com,
	antonio.borneo@foss.st.com,
	s.shtylyov@omp.ru,
	valentin.caron@foss.st.com,
	peng.fan@nxp.com,
	make24@iscas.ac.cn,
	akpm@linux-foundation.org
Cc: linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v3] pinctrl: stm32: check devm_kasprintf() returned value
Date: Fri,  6 Sep 2024 18:03:26 +0800
Message-Id: <20240906100326.624445-1-make24@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowADHzqJw09pmqc2NAQ--.6864S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cr1kWF4xZrW8Ww13GFWUtwb_yoW8GF1rpF
	s3Gr1YkrsrJ39xCF4DJryYgF9agayktFyDGa1Ik34xZF4Yvayjqr45Kr1UZr4kKFWrXwn8
	ZF47Jay5Zr1rCFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUB214x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I
	648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUOmhFUUUUU
X-CM-SenderInfo: ppdnvj2u6l2u1dvotugofq/

devm_kasprintf() can return a NULL pointer on failure but this returned
value is not checked. Fix this lack and check the returned value.

Found by code review.

Cc: stable@vger.kernel.org
Fixes: 32c170ff15b0 ("pinctrl: stm32: set default gpio line names using pin names")
Signed-off-by: Ma Ke <make24@iscas.ac.cn>
---
Changes in v3:
- modified the code style according to suggestions.
Changes in v2:
- modified the patch according to suggestions, added braces;
- modified the typo.
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index a8673739871d..5b7fa77c1184 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -1374,10 +1374,15 @@ static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl, struct fwnode
 
 	for (i = 0; i < npins; i++) {
 		stm32_pin = stm32_pctrl_get_desc_pin_from_gpio(pctl, bank, i);
-		if (stm32_pin && stm32_pin->pin.name)
+		if (stm32_pin && stm32_pin->pin.name) {
 			names[i] = devm_kasprintf(dev, GFP_KERNEL, "%s", stm32_pin->pin.name);
-		else
+			if (!names[i]) {
+				err = -ENOMEM;
+				goto err_clk;
+			}
+		} else {
 			names[i] = NULL;
+		}
 	}
 
 	bank->gpio_chip.names = (const char * const *)names;
-- 
2.25.1


