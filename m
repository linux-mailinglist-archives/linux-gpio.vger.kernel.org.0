Return-Path: <linux-gpio+bounces-30413-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 562A8D0FCDD
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Jan 2026 21:29:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 69A0D3024D6F
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Jan 2026 20:29:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25E61250C06;
	Sun, 11 Jan 2026 20:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gq0uiQN1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE715221F15;
	Sun, 11 Jan 2026 20:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768163366; cv=none; b=WGM3YC9+xgYWMz/tUy3f6axu7t7M27KcmfzGKcSS86qvuBqbnphuNYHNfvwef15lFuC1WN14aW3DRbUBSR85oIqQEVZiY5+qlTKU1XohrPpYMskAzrmXFOacvVbLMm+C/70ofVwSwmjDlbMXfGgoKIRherVJS5Sjf4F62xwGozw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768163366; c=relaxed/simple;
	bh=DyoRTFzN7q43JaCq11Qs8BMWjMCdgppXa/JN1s/8Jz8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RREHoE6azsHKr73URrb+r1piLln1DNk+2UxYen6KueqIG5c6wbzXDTssjCAGHGTstztqJ7FDJ2M4B1be1RmwFbeibjPP2xalJZTi5OdtxvcA1ysXFbzX9wjPBaw9zETP2v9lmknPLS+OVlTi23bleW9vrLyniWakagh4KZqr6hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gq0uiQN1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13127C116C6;
	Sun, 11 Jan 2026 20:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768163366;
	bh=DyoRTFzN7q43JaCq11Qs8BMWjMCdgppXa/JN1s/8Jz8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Gq0uiQN1uJpebhWEflc7Jp8qiSVNiSxtyO48lVlRyRFj8hsV77Xr44gAmqpwFnRMK
	 Q6jbciUqtiTHUen9V34UHOFs4qf3c6ecLVgagnpkfNJ4YX/yu6b6KnzPqb5Gceai34
	 zooyi0NO4JSr3P99sqdUkaW9KpD20sr865qkJE4S/se2JZOV9iaXtK89zvkGT9fWas
	 /FXid2DyckmWmIAFtC5s2clyBVxBZn+5s36vsG4JLL97QJnAlqL8JD3gTD/UprLnfR
	 m7fmRAhRZ5+0ipU6FSt0cxKqcRJ9AYtdxl/5Ml5XcM7iBLBKIP2b1Yq3eSCp9cPGwL
	 GkOBkK4SvMYew==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 11 Jan 2026 21:29:21 +0100
Subject: [PATCH 1/2] pinctrl: apple: Use unsigned int instead of unsigned
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260111-apple-req-gpio-func-v1-1-6deb1b695371@kernel.org>
References: <20260111-apple-req-gpio-func-v1-0-6deb1b695371@kernel.org>
In-Reply-To: <20260111-apple-req-gpio-func-v1-0-6deb1b695371@kernel.org>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Bartosz Golaszewski <brgl@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

It is discouraged to use the ambiguous "unsigned" type, use
explicit unsigned int in the driver.

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


