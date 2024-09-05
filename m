Return-Path: <linux-gpio+bounces-9817-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1133A96CCC2
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2024 04:43:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 86205B22AA9
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2024 02:43:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F12261386C6;
	Thu,  5 Sep 2024 02:43:04 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C248F66;
	Thu,  5 Sep 2024 02:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725504184; cv=none; b=fHF25xCPJCpQ6YiXlaVIsUU34+aMjJCmuuy4MVA8m9NCZNmFRX6bqN13KWO87Ou4BHI5YomE3rmd2P8g7nxnVs4dou33UTR+i6U8zXt3XM6OcLcartzDfbzSqhU8sBQ1UJh4G6l07LkRwkAWE6POQ8PZl3GKFaCLIQ/0GKNibqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725504184; c=relaxed/simple;
	bh=fLj3DEZohV1JHVgxuXpLJwf/f+qjBf0gOFqcKdsFcq0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aWoK15IRlwnvcdUsGpzdnk//UFdVmt4n4vH4TD6CGb4/smnWfLHoGqDwn/bLQRGKbFYtyAg83GFNebHebhXiidLrVs/Fl7fbM9R/PBkv7zT2VAEbdUJOdbSKqEGVkj/MqIL7YidQJesMk6M8rauo8RJ3NwoGBSNcmPckqx2BbBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-05 (Coremail) with SMTP id zQCowADnzSCvGtlmsXpaAQ--.10133S2;
	Thu, 05 Sep 2024 10:42:55 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: ludovic.desroches@microchip.com,
	linus.walleij@linaro.org,
	brgl@bgdev.pl
Cc: linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] gpio: sama5d2-piobu: convert comma to semicolon
Date: Thu,  5 Sep 2024 10:42:45 +0800
Message-Id: <20240905024245.1642989-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowADnzSCvGtlmsXpaAQ--.10133S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KF17ur4DKrWUZF4ktF1xGrg_yoW8Aw1rpr
	WYkry3Kr45uw48t34avF48Zwnay3yUtr45K340kry0934UKr1ktayUKr1rAry3CryxG3Z0
	qFWkX34j9FW3ZFJanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
	WxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
	Yx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r4UJVWxJr1lOx8S6xCaFVCjc4
	AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kK
	e7AKxVWUAVWUtwCY02Avz4vE14v_Gr1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
	v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
	1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
	AIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI
	42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWI
	evJa73UjIFyTuYvjfUOL05UUUUU
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
 drivers/gpio/gpio-sama5d2-piobu.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-sama5d2-piobu.c b/drivers/gpio/gpio-sama5d2-piobu.c
index d89da7300ddd..d770a6f3d846 100644
--- a/drivers/gpio/gpio-sama5d2-piobu.c
+++ b/drivers/gpio/gpio-sama5d2-piobu.c
@@ -191,15 +191,15 @@ static int sama5d2_piobu_probe(struct platform_device *pdev)
 
 	piobu->chip.label = pdev->name;
 	piobu->chip.parent = &pdev->dev;
-	piobu->chip.owner = THIS_MODULE,
-	piobu->chip.get_direction = sama5d2_piobu_get_direction,
-	piobu->chip.direction_input = sama5d2_piobu_direction_input,
-	piobu->chip.direction_output = sama5d2_piobu_direction_output,
-	piobu->chip.get = sama5d2_piobu_get,
-	piobu->chip.set = sama5d2_piobu_set,
-	piobu->chip.base = -1,
-	piobu->chip.ngpio = PIOBU_NUM,
-	piobu->chip.can_sleep = 0,
+	piobu->chip.owner = THIS_MODULE;
+	piobu->chip.get_direction = sama5d2_piobu_get_direction;
+	piobu->chip.direction_input = sama5d2_piobu_direction_input;
+	piobu->chip.direction_output = sama5d2_piobu_direction_output;
+	piobu->chip.get = sama5d2_piobu_get;
+	piobu->chip.set = sama5d2_piobu_set;
+	piobu->chip.base = -1;
+	piobu->chip.ngpio = PIOBU_NUM;
+	piobu->chip.can_sleep = 0;
 
 	piobu->regmap = syscon_node_to_regmap(pdev->dev.of_node);
 	if (IS_ERR(piobu->regmap)) {
-- 
2.25.1


