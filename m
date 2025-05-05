Return-Path: <linux-gpio+bounces-19618-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A05FAAA4F8
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 01:39:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E75D0188D72C
	for <lists+linux-gpio@lfdr.de>; Mon,  5 May 2025 23:37:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26BD830723C;
	Mon,  5 May 2025 22:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vPk8q8Fi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0B3307232;
	Mon,  5 May 2025 22:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746484086; cv=none; b=Kk6IPSijFaW4uJ69m6hwEObKjQ+2Fzg3PPGU4JzZNPT1JfAd/9Epp8RXRThG9J4wO9Q+wfpTs5VkHT+4djeEUq20PCCDkrMdqdpyh/sQuGyRbPP5oDySlP/7MvHeOiWFeRj3j9WaeM2N1tu3e4EqZdw3XpgqkXOl6MGLH8+N0I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746484086; c=relaxed/simple;
	bh=WB2dY6oh6xjhaw0B01zKCSI5qkhaRNJBNP0Lgmr7EbI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WkBMUkIxToyb0MhXMkDvE9//Ld1jOp/NwKNoOELm2tPgB4icO2698LHFRtsmHp5Ni59KAk00g0mGoMWOHHkkHWTLX5LjbyQMIEt0ZErYeYI0znsTEm+p+wrNrbjaw7VKnZARXWEgXza13+BtAeNedwVaWG7IA1BwjKoyMOVLXq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vPk8q8Fi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80773C4CEED;
	Mon,  5 May 2025 22:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746484086;
	bh=WB2dY6oh6xjhaw0B01zKCSI5qkhaRNJBNP0Lgmr7EbI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vPk8q8FiMlfqcXMbMTV00CqqSV+G9vHJJ9j8OBh5lon5DMhtAJl+JaXzTlmvk1Z6F
	 JsYLMOoMlVz8pZrIFhcmGfz+H5ce4aqMNDp8Ym29464YZeGuM3e9C7IiU0kijyoZbQ
	 eweTP9rrQgveWcolZtXSSzMsv6F3wSWRJZq+IazfMQT+CB/nba1xT/T6+PKPw0N+CC
	 oTrwf9IN9ZJdthLQQqAAjQBAE0C3quh5nxz7RvgDsk0X4BlkA0Hu1564CL6hpuLVk6
	 DUzdhBUsQiZAo6XcWQ7jCS1jBIHmO2YE0Fw2Gp0nc2bsTplbuW+fTJIVXy6Bz9D9Qf
	 358cOTqTwVw3A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	brgl@bgdev.pl,
	linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 6.14 343/642] gpiolib: sanitize the return value of gpio_chip::set_config()
Date: Mon,  5 May 2025 18:09:19 -0400
Message-Id: <20250505221419.2672473-343-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

[ Upstream commit dcf8f3bffa2de2c7f3b5771b63605194ccd2286f ]

The return value of the set_config() callback may be propagated to
user-space. If a bad driver returns a positive number, it may confuse
user programs. Tighten the API contract and check for positive numbers
returned by GPIO controllers.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Link: https://lore.kernel.org/r/20250210-gpio-sanitize-retvals-v1-3-12ea88506cb2@linaro.org
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpio/gpiolib.c      | 3 +++
 include/linux/gpio/driver.h | 3 ++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 0c00ed2ab4315..960ca0ad45fc8 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2577,6 +2577,9 @@ int gpio_do_set_config(struct gpio_desc *desc, unsigned long config)
 		return -ENOTSUPP;
 
 	ret = guard.gc->set_config(guard.gc, gpio_chip_hwgpio(desc), config);
+	if (ret > 0)
+		ret = -EBADE;
+
 #ifdef CONFIG_GPIO_CDEV
 	/*
 	 * Special case - if we're setting debounce period, we need to store
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 2dd7cb9cc270a..5ce6b2167f808 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -347,7 +347,8 @@ struct gpio_irq_chip {
  * @set: assigns output value for signal "offset"
  * @set_multiple: assigns output values for multiple signals defined by "mask"
  * @set_config: optional hook for all kinds of settings. Uses the same
- *	packed config format as generic pinconf.
+ *	packed config format as generic pinconf. Must return 0 on success and
+ *	a negative error number on failure.
  * @to_irq: optional hook supporting non-static gpiod_to_irq() mappings;
  *	implementation may not sleep
  * @dbg_show: optional routine to show contents in debugfs; default code
-- 
2.39.5


