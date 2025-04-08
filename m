Return-Path: <linux-gpio+bounces-18421-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EBFA7F5D8
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 09:19:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 497F1189B747
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 07:19:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BF7226156D;
	Tue,  8 Apr 2025 07:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="lmUj2Ewh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8279263C90
	for <linux-gpio@vger.kernel.org>; Tue,  8 Apr 2025 07:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744096690; cv=none; b=YVNs4DShpE9s7vP9gbhCnzfZuf3UN7t6qgboT1VAjxUKg1CiN7BTp/LdqwIb0NvIkpflnN5DtVqGs6/vP0pZfmkS9ns5Sv8FUUIgvTpmyTqJagKqgdJBUZm4opeXqNwGfs3D+oPbe7zVujALvQ0JPrGS7FDG4aFUokaqov9WCqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744096690; c=relaxed/simple;
	bh=S1eRm9ruT/z8xa6PV2GYxT3sAM1tH/Z37d9OcC4qqFo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tqkOKloo9XaOvORrrqJyjdwS7MWSPIFdR8Z4R0Q64r1OreQ1RV/NSafBY1EY6nwFrC7uZMF3RL0fHBYY7xOT/6W77aSsv8/nWVs9oScuAYrG5fgNAx8Tj3HBj2/IADnjQoQw4aZ5BMvndSGUdk6uDrVcd7gd4eSI76/ScSi7vFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=lmUj2Ewh; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so56734455e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 08 Apr 2025 00:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744096686; x=1744701486; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lsLjcRrGKuzDX9mvNJ2l1Pj3maW/MPJjpEEItwHgjBM=;
        b=lmUj2Ewhzr4TtxbBgCyouo8GVt1gku318lTNsVJjCswA8TJKI4s/kXDj/GKUiAj7IQ
         MIecDrh0N0XsujNBxfhy9FV3pfe+rgJccIKUXaZB7E4Xd4akWBaXmXY6IwFswEGCgSxh
         I88fGg10AvFZr2zphUP7meE3F5eFx+mEd4gVzFuXQC7DuLOtUBMxfdP7xj77lh2lf36o
         fLFCFk0i5pI50js3SEzAqEtgXUTP8aA1TzkIAkvbZRwVu8S0m3DsOHT/lVAUg5HaN8RF
         KgLPHpA94P2YiyTIWO5qx/NFWkH7i+9eEsoe0sKn6RX1WSTiEOEhHm7rc8tZZPzzm8tK
         RO9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744096686; x=1744701486;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lsLjcRrGKuzDX9mvNJ2l1Pj3maW/MPJjpEEItwHgjBM=;
        b=hnQjrTbR94NgJeLq3tpQ8iPtyOHRRglZZ3SX0YtwXauYhSox4J2GyC6fJCzhJBUayI
         d+vMadidFmq4D/nqt1uiWnJQ1is1byuygVqxPyzi/jOE4uRTeEa84Z03Oa8IP591z7IP
         s8KK1W2zVTikTCSwGHIKS9tR8M79QXW1aUaNrCMEEq5bMmU7ykLIjgTyfCOBszobKkRa
         WjX2bAKdHm5tcxzrvOFD1DsIktpxVJ4ouk6QPzSAPpixJM5my1a4ly8s9s3Cfo20aELw
         0eKRAl3aAtFvYxSykNmr2IyEVzwPhVVw05gvF5dmEzy1grz8X+xvNidFDY0U58WQRShU
         2cJA==
X-Forwarded-Encrypted: i=1; AJvYcCUtzSuWi5ADq2+RkqiSqpkkefZZDMbRqteERgYPGByXMZMSl629iwh/yWytByhfGZFdA6sOPXv4iVin@vger.kernel.org
X-Gm-Message-State: AOJu0YxH1FpTOMaQrYNRk/DMXz6lyRsc53sKvJMZIHjaH6rhtkCqw3nE
	DhPkowxJHoq5vI2+pMsqoaaJOO3v08/qRfGCR+e7W3VIsB0ywa0fLzH11R8Ed44=
X-Gm-Gg: ASbGncuFJdxOwlEakpCOhYE5hRuLV/uEmyFyhZ7/p25wKnt4K4ZcS1xmjIlAZU6pgMk
	eJuK1vWougTkoBEsMsf++IR9au3sdfGo1S1hxhTlYlBf2u8O0BJWG1fGigb9R9MJqKkkJyuqBW0
	pFqyxEr5If0NvyMBrDEwK0XyNBmMpizzd4wWt1glXHHzO/Sc93cZR7/9ueIj6DF8pFhDGQgXU5T
	KJ4UZtPU1xC9rDUDr2W2q5nQ0dHHAbBsa70kTOmWgiDmhIz/5zNS89SV1yF9k6bBqKvxvCWs68I
	gRgRzdsxVigJ22jRMTGTm7yX+m3NJ87/U0x2Pw==
X-Google-Smtp-Source: AGHT+IFVLY1WNvAayiNBB006bFO4nSra7Yx4DcKw1yaLoj6yk4wJfEbc8yNlS2Lbk6qsNo9ohgkRog==
X-Received: by 2002:a05:6000:40cc:b0:39c:142a:ed6c with SMTP id ffacd0b85a97d-39d0de66a15mr12602862f8f.40.1744096686025;
        Tue, 08 Apr 2025 00:18:06 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d5d1sm14257694f8f.77.2025.04.08.00.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:18:05 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:17:47 +0200
Subject: [PATCH 10/10] pinctrl: cy8c95x0: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpiochip-set-rv-pinctrl-part1-v1-10-c9d521d7c8c7@linaro.org>
References: <20250408-gpiochip-set-rv-pinctrl-part1-v1-0-c9d521d7c8c7@linaro.org>
In-Reply-To: <20250408-gpiochip-set-rv-pinctrl-part1-v1-0-c9d521d7c8c7@linaro.org>
To: Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Patrick Rudolph <patrick.rudolph@9elements.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2609;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=nFz0ZQu1wB25C83nAY0bNQ02w+UniTfC+j0g7wZb9Vw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9M2b7PYpEd1QYwzkZOLJp94uziWDLFCT9+cRZ
 6jtV1w9v+CJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TNmwAKCRARpy6gFHHX
 cphiEAC83D/t8tFMiLHRxWuKzVZS6TAwB9yfLq3bsdR9gOgBqJaavIsx28w0liHuZZIj8w3UHJ3
 te5PhEz/S5S7Osm2h1k+wsZovOT4+g7Tn/BqJ04NbpBDccfDwNlRHz9dp5oTqhX/I9BxlNdAM6j
 nw2qiHcJBTD+wKKdTworBCco10+UdxKyIVJZ1xIEUUha9S7j83VF0X/lo/D6JFLOPf7hVAxpMUg
 UAs4h9Zmbh+zfoE3OX3QPGFNlwtL/UHFHuKx8uHYrmKv0tOmFEJL2FpJ1Dpt21Ue0har4mN7d+z
 XYTh2aZ5lZBpTRONkVjKs17D58wvSoBeJSXBp60u0KOD5isuDZxUWicE89i2IY9+jkffOPFNBBj
 hwVA2QcAYCAUMMtWb4BzW4sg02wn+SwW/2TRCl5aUXcF7n+rRnYBTlfmliRX2kHJ3PA3532UUS4
 0qF0kn7hDbX9yY7oX/aD3N97/Eyh9HrOfWH13ZdvF5Hh+MT56nrovr0kjLQFazEgd8IYV8CEPDg
 ZoCCrIrePRmAOUTYwyZAb/qrH/mEh2qLVE5EAVKijNbE+LV0QR4DWDglwYmR6LbjrmcfnyoOS3U
 1/73A3TxYyCRipzULEk7VLJXFMw5u8ROVTWk+4s4XCehemi1NJRDj9ORfPUJMTW0b8refz8JnQW
 hv7fa/dGOTU4VTg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-cy8c95x0.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-cy8c95x0.c b/drivers/pinctrl/pinctrl-cy8c95x0.c
index 3cfbcaee9e65..8a2fd632bdd4 100644
--- a/drivers/pinctrl/pinctrl-cy8c95x0.c
+++ b/drivers/pinctrl/pinctrl-cy8c95x0.c
@@ -742,14 +742,15 @@ static int cy8c95x0_gpio_get_value(struct gpio_chip *gc, unsigned int off)
 	return reg_val ? 1 : 0;
 }
 
-static void cy8c95x0_gpio_set_value(struct gpio_chip *gc, unsigned int off,
-				    int val)
+static int cy8c95x0_gpio_set_value(struct gpio_chip *gc, unsigned int off,
+				   int val)
 {
 	struct cy8c95x0_pinctrl *chip = gpiochip_get_data(gc);
 	u8 port = cypress_get_port(chip, off);
 	u8 bit = cypress_get_pin_mask(chip, off);
 
-	cy8c95x0_regmap_write_bits(chip, CY8C95X0_OUTPUT, port, bit, val ? bit : 0);
+	return cy8c95x0_regmap_write_bits(chip, CY8C95X0_OUTPUT, port, bit,
+					  val ? bit : 0);
 }
 
 static int cy8c95x0_gpio_get_direction(struct gpio_chip *gc, unsigned int off)
@@ -908,12 +909,12 @@ static int cy8c95x0_gpio_get_multiple(struct gpio_chip *gc,
 	return cy8c95x0_read_regs_mask(chip, CY8C95X0_INPUT, bits, mask);
 }
 
-static void cy8c95x0_gpio_set_multiple(struct gpio_chip *gc,
-				       unsigned long *mask, unsigned long *bits)
+static int cy8c95x0_gpio_set_multiple(struct gpio_chip *gc,
+				      unsigned long *mask, unsigned long *bits)
 {
 	struct cy8c95x0_pinctrl *chip = gpiochip_get_data(gc);
 
-	cy8c95x0_write_regs_mask(chip, CY8C95X0_OUTPUT, bits, mask);
+	return cy8c95x0_write_regs_mask(chip, CY8C95X0_OUTPUT, bits, mask);
 }
 
 static int cy8c95x0_add_pin_ranges(struct gpio_chip *gc)
@@ -938,10 +939,10 @@ static int cy8c95x0_setup_gpiochip(struct cy8c95x0_pinctrl *chip)
 	gc->direction_input  = cy8c95x0_gpio_direction_input;
 	gc->direction_output = cy8c95x0_gpio_direction_output;
 	gc->get = cy8c95x0_gpio_get_value;
-	gc->set = cy8c95x0_gpio_set_value;
+	gc->set_rv = cy8c95x0_gpio_set_value;
 	gc->get_direction = cy8c95x0_gpio_get_direction;
 	gc->get_multiple = cy8c95x0_gpio_get_multiple;
-	gc->set_multiple = cy8c95x0_gpio_set_multiple;
+	gc->set_multiple_rv = cy8c95x0_gpio_set_multiple;
 	gc->set_config = gpiochip_generic_config;
 	gc->can_sleep = true;
 	gc->add_pin_ranges = cy8c95x0_add_pin_ranges;

-- 
2.45.2


