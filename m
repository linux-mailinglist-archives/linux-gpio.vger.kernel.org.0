Return-Path: <linux-gpio+bounces-6823-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBFE8D33A6
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 11:50:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0E76284D02
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 09:50:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8956417799F;
	Wed, 29 May 2024 09:49:58 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD66316EBF2
	for <linux-gpio@vger.kernel.org>; Wed, 29 May 2024 09:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716976198; cv=none; b=IvrIJjnTF1TuD6xRNe7F+AJ2xB8gWdB6Ya0k6K/eQPROGzkugrraJxOKgbQyn3cgI5VJpfevkBYvWXcnO5YPmFn4yFtCM8SmEEx+QRADQDshkSuKkLtkwExGn9nVsXiKYSEaejOXMSbkbRRG/5O6vMtwRV+EqS203Kq5AOHn/NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716976198; c=relaxed/simple;
	bh=3xeT2DhUhqJQwOqvnLicYhAeyGJj28gG9xrLyTarXVA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hXwVC6CdDe5X4Ky5DrSzQe6j6A61jzJqhmOZcP0u0BMOYW7GIH69WFZYh/A87QleZwT6xR84HQ8JE7B+SlRZmWAqfo81R1zzeS3cWIjSmVI8FapXVBA9ONhRxq2pLCntykkpZlQg2VK68tSSayGxFEkI9LgH3EYq7CV/9T+zZYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:1b01:1838:131c:4de4])
	by laurent.telenet-ops.be with bizsmtp
	id Uxps2C00A3VPV9V01xpsY1; Wed, 29 May 2024 11:49:53 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sCFvR-00GJsN-PV;
	Wed, 29 May 2024 11:49:52 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sCFwO-008wnD-50;
	Wed, 29 May 2024 11:49:52 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Cc: devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] regulator: gpio: Correct default GPIO state to LOW
Date: Wed, 29 May 2024 11:49:51 +0200
Message-Id: <b80d65600641e6dcf00da53ae797f4a40a80e2d0.1716976062.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to the GPIO regulator DT bindings[1], the default GPIO state
is LOW.  However, the driver defaults to HIGH.

Before the conversion to descriptors in commit d6cd33ad71029a3f
("regulator: gpio: Convert to use descriptors"), the default state used
by the driver was rather ill-defined, too:
  - If the "gpio-states" property was missing or empty, the default was
    low, matching the bindings.
  - If the "gpio-states" property was present, the default for missing
    entries was the value of the last present entry.

Fix this by making the driver adhere to the DT bindings, i.e. default to
LOW.

[1] Documentation/devicetree/bindings/regulator/gpio-regulator.yaml

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
I have no idea if this has any impact.
I guess most/all DTS files have proper gpios-states properties?

v2:
  - Add Acked-by.
---
 drivers/regulator/gpio-regulator.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/gpio-regulator.c b/drivers/regulator/gpio-regulator.c
index 65927fa2ef161cda..5dfed8bae0c4cfdc 100644
--- a/drivers/regulator/gpio-regulator.c
+++ b/drivers/regulator/gpio-regulator.c
@@ -176,9 +176,9 @@ of_get_gpio_regulator_config(struct device *dev, struct device_node *np,
 			ret = of_property_read_u32_index(np, "gpios-states", i,
 							 &val);
 
-			/* Default to high per specification */
+			/* Default to low per specification */
 			if (ret)
-				config->gflags[i] = GPIOD_OUT_HIGH;
+				config->gflags[i] = GPIOD_OUT_LOW;
 			else
 				config->gflags[i] =
 					val ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW;
-- 
2.34.1


