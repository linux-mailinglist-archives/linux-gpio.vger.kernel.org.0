Return-Path: <linux-gpio+bounces-30445-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF98D11CD5
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jan 2026 11:20:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E39BD30055B0
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jan 2026 10:20:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B3F52773FE;
	Mon, 12 Jan 2026 10:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p6avkOZ2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21582C0F9E;
	Mon, 12 Jan 2026 10:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768213238; cv=none; b=uJBEpPoY2/MNuLqlr+w9jlRfXJxAdGQEeKStheFn/O12snvKS5hLrmsRggBFAEUa99vZka87Q+en2nz7XgdNr1hHYy7lD2vF6nFrb6fWACbRjsz2dHVjZbHqq6XvmVEfIgd4uPiUbRExAhPAevFSxubZ8INW0JE8YpwAWsuBxAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768213238; c=relaxed/simple;
	bh=WWnghgC0Jz0OiXbwN46EbbbgdFAgu7nudgNQGDSyg2M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M7xulllhPZ8rEWA2KfMzDIZANCZCSCh4ksF1SZiGNsY4oED3mby28vb6Hh9srS/kKTc1LwQ7ypiIjHlYmqdUSLAppmXqkLedYn/OpAf76mMH1zEdeSdbd+zPP0/w+KRXl2lfYHthIdVza0QnYejMnvaiAC90eFIVWB8NGmYfCkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p6avkOZ2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7033C19422;
	Mon, 12 Jan 2026 10:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768213237;
	bh=WWnghgC0Jz0OiXbwN46EbbbgdFAgu7nudgNQGDSyg2M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=p6avkOZ2I6hEdqO+JR71SqQYzwv9B8Nxy5CNrsJ/YEU9Ox+o00ghswhpZydPTMJW8
	 /hDgX8L719HlmNfPwlQZdmTuLYVJ1j/dyKaatqgSQQJSXHrUFajGrsdQG1fam9djQx
	 mNhwldSgMUrKTPWhv93V+OfYAOwVeNdSAIrjyl8c30cL4dV8bg1yRLUQGYY2aGNYdi
	 fjf2G/sK7Fj8Lz1sH52YERjCd+SXirxXaINrwwkq2k8wq9QbC15TU9CBScj8GsV1Pa
	 JBjOSaWohIoHkEnFtzhvgtH3PTWCCNm6S6wcPA1BdrZ28k8KcbGmnazjYaEj8F+WsG
	 QRgH9WTlgWKDg==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 12 Jan 2026 11:20:31 +0100
Subject: [PATCH v2 1/2] pinctrl: apple: Use unsigned int instead of
 unsigned
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-apple-req-gpio-func-v2-1-fbb91114e630@kernel.org>
References: <20260112-apple-req-gpio-func-v2-0-fbb91114e630@kernel.org>
In-Reply-To: <20260112-apple-req-gpio-func-v2-0-fbb91114e630@kernel.org>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Bartosz Golaszewski <brgl@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.3

It is discouraged to use the ambiguous "unsigned" type, use
explicit unsigned int in the driver.

Reviewed-by: Sven Peter <sven@kernel.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/pinctrl/pinctrl-apple-gpio.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-apple-gpio.c b/drivers/pinctrl/pinctrl-apple-gpio.c
index e1a7bc8cf765..a4161d59ab9f 100644
--- a/drivers/pinctrl/pinctrl-apple-gpio.c
+++ b/drivers/pinctrl/pinctrl-apple-gpio.c
@@ -102,9 +102,9 @@ static u32 apple_gpio_get_reg(struct apple_gpio_pinctrl *pctl,
 static int apple_gpio_dt_node_to_map(struct pinctrl_dev *pctldev,
 				     struct device_node *node,
 				     struct pinctrl_map **map,
-				     unsigned *num_maps)
+				     unsigned int *num_maps)
 {
-	unsigned reserved_maps;
+	unsigned int reserved_maps;
 	struct apple_gpio_pinctrl *pctl;
 	u32 pinfunc, pin, func;
 	int num_pins, i, ret;
@@ -170,8 +170,8 @@ static const struct pinctrl_ops apple_gpio_pinctrl_ops = {
 
 /* Pin multiplexer functions */
 
-static int apple_gpio_pinmux_set(struct pinctrl_dev *pctldev, unsigned func,
-				 unsigned group)
+static int apple_gpio_pinmux_set(struct pinctrl_dev *pctldev, unsigned int func,
+				 unsigned int group)
 {
 	struct apple_gpio_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
 
@@ -202,7 +202,7 @@ static int apple_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 	return GPIO_LINE_DIRECTION_IN;
 }
 
-static int apple_gpio_get(struct gpio_chip *chip, unsigned offset)
+static int apple_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct apple_gpio_pinctrl *pctl = gpiochip_get_data(chip);
 	unsigned int reg = apple_gpio_get_reg(pctl, offset);

-- 
2.52.0


