Return-Path: <linux-gpio+bounces-16252-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB9BA3D3B9
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 09:52:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 456583AF258
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 08:51:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40BA71EB1A6;
	Thu, 20 Feb 2025 08:51:42 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731FA1EA7EA;
	Thu, 20 Feb 2025 08:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740041502; cv=none; b=qkoe/0UlOzQn80BbbtXkoK2QejjAAQyNeNlJdkjcswyY76sj+uQkPNY1bhKWx4vW182Bb+/tlWlkRuhL75h0SKHAWogXFZui7TTDTIbP6w5+++4Megh1Vtw+KRGaCiwxGMoujQ4QyMJLiWXevNLKKIwwkvLRFdZQyJGlcrbgUy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740041502; c=relaxed/simple;
	bh=+Y+eQINDzvdLx3S7bjLwx/UdnSeiOX8MBl5UvZosmt0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Px0WgJcCfAH17GghzvQ1FMvvYW6e1KnRaWkPRxZaaRdrjt9NUvFLEa0/RxT6SdAw/VIa24RHoj/1hDRnh+8qxDRpXmgbVkJP76AqvCR8zH5MLMU6p7Lw1mUjs9V2P29M0IMb83RLp1F2lqbxWJQhis3Vf3IS2sg2RLnl+ASjDPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [124.16.141.245])
	by APP-05 (Coremail) with SMTP id zQCowABnbaEK7bZndtGXDg--.55533S2;
	Thu, 20 Feb 2025 16:51:24 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: linus.walleij@linaro.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] pinctrl: nomadik: Add error handling for find_nmk_gpio_from_pin
Date: Thu, 20 Feb 2025 16:50:01 +0800
Message-ID: <20250220085001.860-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.42.0.windows.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowABnbaEK7bZndtGXDg--.55533S2
X-Coremail-Antispam: 1UD129KBjvJXoW7AryrZryfWF47XF1rCryxGrg_yoW8AryDpF
	43Wrn0vry3JFW8t3WDJayjvFyfKan7Jr17Wa9Fk3srW3WYyFykKa15KFW7Zr4qkrWrGw43
	Ar4rJFy7uwn5AFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvm14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1lc2xSY4AK67AK6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
	UI43ZEXa7VUUKhF3UUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgoTA2e2onjwjgAAsp

When find_nmk_gpio_from_pin fails to find a valid GPIO chip
for the given pin, the bit variable remains uninitialized. This
uninitialized value is then passed to __nmk_gpio_set_mode,
leading to undefined behavior and undesired address access.

To fix this, add error handling to check the return value of
find_nmk_gpio_from_pin. Log an error message indicating an
invalid pin offset and return -EINVAL immediately  If the function
fails.

Fixes: 75d270fda64d ("gpio: nomadik: request dynamic ID allocation")
Cc: stable@vger.kernel.org # 6.9+
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/pinctrl/nomadik/pinctrl-nomadik.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik.c b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
index f4f10c60c1d2..4155137b0674 100644
--- a/drivers/pinctrl/nomadik/pinctrl-nomadik.c
+++ b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
@@ -985,7 +985,7 @@ static int nmk_gpio_request_enable(struct pinctrl_dev *pctldev,
 				   unsigned int pin)
 {
 	struct nmk_pinctrl *npct = pinctrl_dev_get_drvdata(pctldev);
-	struct nmk_gpio_chip *nmk_chip;
+	struct nmk_gpio_chip *nmk_chip, *r;
 	struct gpio_chip *chip;
 	unsigned int bit;
 
@@ -1002,7 +1002,12 @@ static int nmk_gpio_request_enable(struct pinctrl_dev *pctldev,
 
 	dev_dbg(npct->dev, "enable pin %u as GPIO\n", pin);
 
-	find_nmk_gpio_from_pin(pin, &bit);
+	r = find_nmk_gpio_from_pin(pin, &bit);
+	if (!r) {
+		dev_err(npct->dev,
+			"invalid pin offset %d\n", pin);
+		return -EINVAL;
+	}
 
 	clk_enable(nmk_chip->clk);
 	/* There is no glitch when converting any pin to GPIO */
-- 
2.42.0.windows.2


