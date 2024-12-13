Return-Path: <linux-gpio+bounces-13874-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EC99F13B8
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2024 18:33:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7CE2283C49
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2024 17:33:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 592F01E8823;
	Fri, 13 Dec 2024 17:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l/Kmh0nG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D6E1E5707;
	Fri, 13 Dec 2024 17:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734111177; cv=none; b=pOOGo65F8YlsTLSJjBTXkmevv22GaZrbN+/EZCq82Xi82FV6IN/mwjOah2WjKPnTcA41h5ZwZsUPcs09HHs6HzTl/q+BAyzlpMvz3CDMKqimEDywbhrPpossf4no1DdMhAb0YdpXqp3JJfU4ANq1IHBw7Hss9YXQk+wWsfPSRW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734111177; c=relaxed/simple;
	bh=fJs5ET6WZd3uPZwfZH9/P+D/e79LFnzmJweuO6zjB6E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g1cAEo69jB7zvb4VJ5a7yoHNbI+RPxFJcI7MTTTgmJMxMW7aRFrsBvBmAq/QQfC1TY+HHp+RyN3xRz9UpKcqhD5CnttSNBJLjWQUza9+Y9icwHNZblU6KLDarBFKNJ8jHEaQz9+L//3XaxNy78S5AV7+8CM0BQAgogEHjG0p1iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l/Kmh0nG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 80C07C4CEDF;
	Fri, 13 Dec 2024 17:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734111176;
	bh=fJs5ET6WZd3uPZwfZH9/P+D/e79LFnzmJweuO6zjB6E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=l/Kmh0nGBSFuSOURzoaRI57YbTVHkmrITfV6Fcyp3Tc2oFW95Neto53Rf5ejJlPph
	 SsgqcXdSfSq63Q5C91dyHelbqvSZ/vh7vhAbRv7S3XbVY74lDATIbD5QyLPaTLKtuG
	 xjeLoRhVGDxYkjSIYsth2UV9OMHcyW1MoGnwqYENBu6dAcepOrBFhHBTMJ6ySnstJC
	 4/ngHCE4Av8UT3uebL+plf6ivQmM/MAYDEKAUjlwKJuWzdm31TqRqAM0Jsu/WKF62D
	 xddAhDHxb387ftyhfDdcl46SHLHDYHLjx2EkmSBsH5xR6yx2XTmj43j98zrBTNLHBp
	 3PGDO2TSo12rw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77076E7717F;
	Fri, 13 Dec 2024 17:32:56 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Fri, 13 Dec 2024 18:32:50 +0100
Subject: [PATCH 4/4] gpio: 74x164: Add latch GPIO support
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241213-gpio74-v1-4-fa2c089caf41@posteo.net>
References: <20241213-gpio74-v1-0-fa2c089caf41@posteo.net>
In-Reply-To: <20241213-gpio74-v1-0-fa2c089caf41@posteo.net>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734111175; l=2116;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=NHTF1nhuNdR0eYjJx9o0IFR59AC3RI+5HuDVC8y4CZg=;
 b=UuX6oJtAJB0Vb331MtDfTa02d4W2XlOU+gzFGpyU8X4UfOI/j+NEDiNv4n7jPD5WalTaT4APJ
 1tu5bE8X/psDcivPrJl434Q8ssJRtCRRer2H3Yrtj5S63pqPIMGgjyb
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net

From: "J. Neuschäfer" <j.ne@posteo.net>

The Fairchild MM74HC595 and other compatible parts have a latch clock
input (also known as storage register clock input), which must be
clocked once in order to apply any value that was serially shifted in.

This patch adds driver support for using a GPIO that connects to the
latch clock.

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
 drivers/gpio/gpio-74x164.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-74x164.c b/drivers/gpio/gpio-74x164.c
index 187032efa5b5cd1aa7aea7b2d55f6c06df4ccac4..8e87eeb7a1c7a8c71079c8d837dc5c426db8b65b 100644
--- a/drivers/gpio/gpio-74x164.c
+++ b/drivers/gpio/gpio-74x164.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/bitops.h>
+#include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
@@ -21,6 +22,7 @@ struct gen_74x164_chip {
 	struct gpio_chip	gpio_chip;
 	struct mutex		lock;
 	struct gpio_desc	*gpiod_oe;
+	struct gpio_desc	*gpiod_latch;
 	u32			registers;
 	/*
 	 * Since the registers are chained, every byte sent will make
@@ -34,8 +36,20 @@ struct gen_74x164_chip {
 
 static int __gen_74x164_write_config(struct gen_74x164_chip *chip)
 {
-	return spi_write(to_spi_device(chip->gpio_chip.parent), chip->buffer,
+	int ret;
+
+	ret = spi_write(to_spi_device(chip->gpio_chip.parent), chip->buffer,
 			 chip->registers);
+	if (ret)
+		return ret;
+
+	if (chip->gpiod_latch) {
+		gpiod_set_value_cansleep(chip->gpiod_latch, 1);
+		udelay(1);
+		gpiod_set_value_cansleep(chip->gpiod_latch, 0);
+	}
+
+	return 0;
 }
 
 static int gen_74x164_get_value(struct gpio_chip *gc, unsigned offset)
@@ -127,6 +141,11 @@ static int gen_74x164_probe(struct spi_device *spi)
 	if (IS_ERR(chip->gpiod_oe))
 		return PTR_ERR(chip->gpiod_oe);
 
+	chip->gpiod_latch = devm_gpiod_get_optional(&spi->dev, "latch",
+						    GPIOD_OUT_LOW);
+	if (IS_ERR(chip->gpiod_latch))
+		return PTR_ERR(chip->gpiod_latch);
+
 	spi_set_drvdata(spi, chip);
 
 	chip->gpio_chip.label = spi->modalias;

-- 
2.45.2



