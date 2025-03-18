Return-Path: <linux-gpio+bounces-17714-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CE3A666B6
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Mar 2025 04:08:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D894719A0F3B
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Mar 2025 03:08:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E55151991A9;
	Tue, 18 Mar 2025 03:08:08 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B10187332;
	Tue, 18 Mar 2025 03:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742267288; cv=none; b=RWSave215EdGFPPgcGKTaG//1A1epPuPv2XgFQZp7xe8zBf2/uNp8r+IqHbqBTjTTmIDOR0jiDu8uAG+6zyVwfxQ4qqibsB87Ad+w3AETgeVjSK9h6bp+iwLfKAQceNzWZQ1yWMeHAWofcuW7vB32256vGBMSq4AjfHLcRC5qlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742267288; c=relaxed/simple;
	bh=oxHbshbWQklPIplVOc/43p07WNv4BFL+N2LmaHuyIvU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WhIJB5oB3xORzgvdZs0eSeFb9yJpY+bKR8SfLIyv2AeLQqkrIqbW4hlCYXx95dBGnahvM9xeZjgPqOBRs5Qc17RV2sDj65b+ubjdwvr6O9uTF1CfMb+ejjSToIwJfbr+AKUKITGF8NxiadLkiaqZ985KVq30KTkhF74wwpsq57Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [124.16.141.245])
	by APP-03 (Coremail) with SMTP id rQCowACHjlp449hniT8tFg--.15841S2;
	Tue, 18 Mar 2025 11:07:41 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: ludovic.desroches@microchip.com,
	linus.walleij@linaro.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com
Cc: claudiu.beznea@tuxon.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>
Subject: [PATCH] pinctrl: at91: Add error handling for pinctrl_utils_add_map_mux()
Date: Tue, 18 Mar 2025 11:07:17 +0800
Message-ID: <20250318030717.781-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.42.0.windows.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowACHjlp449hniT8tFg--.15841S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKF4fWrW8uw4xury5tF4kCrg_yoWkArg_Ga
	yjyF97XrWI9ry2vr12qw1avFW0kFW8WryIqr1vqF1aka47X3WxKr95uF1UCw1kCry8Gry5
	J39rZrySqr1xCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbckFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s
	1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0
	cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8Jw
	ACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_Jw0_
	GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
	WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI
	7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
	1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI
	42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUd-B_UUUUU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCQ4EA2fYYxtqtgABsa

In atmel_pctl_dt_subnode_to_map(), the return value of
pinctrl_utils_add_map_mux() needs to be checked, for the function
will fail to associate group when the group map is full. Add error
handling for pinctrl_utils_add_map_mux() to return immediately and
propagate the error code to caller function when the function fails.

Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/pinctrl/pinctrl-at91-pio4.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-at91-pio4.c b/drivers/pinctrl/pinctrl-at91-pio4.c
index 8b01d312305a..4dcaebc20d99 100644
--- a/drivers/pinctrl/pinctrl-at91-pio4.c
+++ b/drivers/pinctrl/pinctrl-at91-pio4.c
@@ -609,8 +609,10 @@ static int atmel_pctl_dt_subnode_to_map(struct pinctrl_dev *pctldev,
 		if (ret)
 			goto exit;
 
-		pinctrl_utils_add_map_mux(pctldev, map, reserved_maps, num_maps,
+		ret = pinctrl_utils_add_map_mux(pctldev, map, reserved_maps, num_maps,
 					  group, func);
+		if (ret)
+			goto exit;
 
 		if (num_configs) {
 			ret = pinctrl_utils_add_map_configs(pctldev, map,
-- 
2.42.0.windows.2


