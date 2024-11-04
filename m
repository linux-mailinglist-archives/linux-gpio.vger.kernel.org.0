Return-Path: <linux-gpio+bounces-12529-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A83049BB961
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 16:49:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5288B1F22464
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 15:49:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2C9F1C07D3;
	Mon,  4 Nov 2024 15:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UKg3m8Un"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2941BE86A;
	Mon,  4 Nov 2024 15:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730735319; cv=none; b=NLma8QT0qNyRrrJol22TzX/FGiCr5dbs4EpsWK1moY26eLIDa00sq7LqcVvoioRneQnyBAdfpWSIfmfBbsXD4M2j//eFHpnnpogrTORkcb3KKE+wZwdPXmrLyIUB3Ky20a4cBUUzvzHynuqmLp4x6jbC/kyZsXE6bsBrLAS2QrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730735319; c=relaxed/simple;
	bh=+CLj4REK/2pJFb9NB+GnwBNAZKVlmJS3ssjuEfZNmCQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tNe5Mhd7keWpZ/4+EnFE0ikEHXFOUCRj2nwh9DdHKUK7NWfkdchA9BLFOWbuyA0GNeNTWqR2BcZeKjpwIwmgOoMlipo5mf0M6a32DwJ2AxPxQHAEyo08Jbtud6nBYCo9ihAb1a4CXANYQzuWo+HOoKgbQqUAm0ZorZ/FiPd1QVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UKg3m8Un; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2e91403950dso3109695a91.3;
        Mon, 04 Nov 2024 07:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730735317; x=1731340117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qnn2wZ3PqqpfYJKrOXZXpVSNhpxKk7sQk2hEfSzjQQU=;
        b=UKg3m8Unpyt+fOpaeAyI9+S9vefcogswhvrUpb0sFtbBUdvuXi9oOCrlzwHqSkrFm8
         neTD8pc0vqDlArwDxqoLPr6FrCrsYVroxmGpp/YWQavYkuDh6L9PDb7ZymFKp7JrAKh/
         JMdkFBnodIsjSRA3s8KeiixZPqwZEOCYPARaT+DXVzHdk9H9UMkm3r2SyyVjICJsAyUr
         7G6BW7/fXOjvtUCyH0gUuSr+njADcKl4eB/hs0hDb5F/DX6cGlkP9LVDiCjAsv06aP8Y
         FwxgbOzjMSZ6XrKGzlYlw8vynqMQXII6nRiwUNjtqyAMWWfpmfal9hNEarYtwQxi5qTn
         74Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730735317; x=1731340117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qnn2wZ3PqqpfYJKrOXZXpVSNhpxKk7sQk2hEfSzjQQU=;
        b=M+FrELaSWo/+MIDcVoy6H/YDCpd5Aqw2v0Gkdvi8HnTXb5/ODqGZ7nDM2q3ToUkIG4
         oKWhwooWak0UTBSSECHyOnAcgtFO07G10BA2W9ELQCu5DDIjfpDD/rzc5FRae7d6d6e9
         8nmBqFZ3fvOXggvABPf94jaPxtitcY0fpkXpUe972ySIQ688p8YRwyLkdb3T0gsge8Ay
         s4m4BuzTG9gnhbYWN+AM6DD6meDolvQM93M1wjgdGrpuVdTBijI8e8LzBk1Yjyy7reMW
         FmFMXl/jPZPmbD5tK/+vmbxLYLN7seFZwLF4QB5xyrjbVZTmETEMoMcmNw8CKCDPxQIk
         cVcA==
X-Forwarded-Encrypted: i=1; AJvYcCWxEYmRl6PXqFTpiQ/LJEd+CAta9ij7cxSnFmKNzn7Sx7aYfhH4rlJNpyGWSkqa7bsPS2VoqctmRDqc@vger.kernel.org
X-Gm-Message-State: AOJu0YzjhyRJlkc299O8FqVGMWAnpmcsexdCeKljBK11j8SWu77rlFLj
	2y7uAs8KQpSKPiukWVQcP3kscFCBoMw9DkvANtSq5FhLkSAgtkfdSaP/Ugyy
X-Google-Smtp-Source: AGHT+IHUIwcwC/Sxv5Wc14GY9ehGIATt5oBN3CeKkhfkqijCzlXQ9U12QO0X+G7Nt4so70t3WyIEYA==
X-Received: by 2002:a17:90b:4d01:b0:2e2:c98e:c33f with SMTP id 98e67ed59e1d1-2e8f1058039mr40398887a91.1.1730735317275;
        Mon, 04 Nov 2024 07:48:37 -0800 (PST)
Received: from optiplex-5070.. ([182.66.67.80])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057086e5sm61937625ad.75.2024.11.04.07.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 07:48:36 -0800 (PST)
From: Sai Kumar Cholleti <skmr537@gmail.com>
To: andriy.shevchenko@linux.intel.com,
	bgolaszewski@baylibre.com,
	linux-gpio@vger.kernel.org,
	mmcclain@noprivs.com,
	skmr537@gmail.com
Cc: stable@vger.kernel.org
Subject: [PATCH v2] gpio: exar: set value when external pull-up or pull-down is present
Date: Mon,  4 Nov 2024 21:17:57 +0530
Message-Id: <20241104154757.2306076-1-skmr537@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ZyjLSmtwyPiD9-r5@black.fi.intel.com>
References: <ZyjLSmtwyPiD9-r5@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Setting GPIO direction = high, sometimes results in GPIO value = 0.

If a GPIO is pulled high, the following construction results in the
value being 0 when the desired value is 1:

$ echo "high" > /sys/class/gpio/gpio336/direction
$ cat /sys/class/gpio/gpio336/value
0

Before the GPIO direction is changed from an input to an output,
exar_set_value() is called with value = 1, but since the GPIO is an
input when exar_set_value() is called, _regmap_update_bits() reads a 1
due to an external pull-up.  regmap_set_bits() sets force_write =
false, so the value (1) is not written.  When the direction is then
changed, the GPIO becomes an output with the value of 0 (the hardware
default).

regmap_write_bits() sets force_write = true, so the value is always
written by exar_set_value() and an external pull-up doesn't affect the
outcome of setting direction = high.


The same can happen when a GPIO is pulled low, but the scenario is a
little more complicated.

$ echo high > /sys/class/gpio/gpio351/direction 
$ cat /sys/class/gpio/gpio351/value
1

$ echo in > /sys/class/gpio/gpio351/direction 
$ cat /sys/class/gpio/gpio351/value
0

$ echo low > /sys/class/gpio/gpio351/direction 
$ cat /sys/class/gpio/gpio351/value
1

Fixes: 36fb7218e878 ("gpio: exar: switch to using regmap") 
Signed-off-by: Sai Kumar Cholleti <skmr537@gmail.com>
Signed-off-by: Matthew McClain <mmcclain@noprivs.com>
Cc: <stable@vger.kernel.org>
---
 drivers/gpio/gpio-exar.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-exar.c b/drivers/gpio/gpio-exar.c
index 5170fe7599cd..dfc7a9ca3e62 100644
--- a/drivers/gpio/gpio-exar.c
+++ b/drivers/gpio/gpio-exar.c
@@ -99,11 +99,13 @@ static void exar_set_value(struct gpio_chip *chip, unsigned int offset,
 	struct exar_gpio_chip *exar_gpio = gpiochip_get_data(chip);
 	unsigned int addr = exar_offset_to_lvl_addr(exar_gpio, offset);
 	unsigned int bit = exar_offset_to_bit(exar_gpio, offset);
+	unsigned int bit_value = value ? BIT(bit) : 0;
 
-	if (value)
-		regmap_set_bits(exar_gpio->regmap, addr, BIT(bit));
-	else
-		regmap_clear_bits(exar_gpio->regmap, addr, BIT(bit));
+	/*
+	 * regmap_write_bits forces value to be written when an external
+	 * pull up/down might otherwise indicate value was already set
+	 */
+	regmap_write_bits(exar_gpio->regmap, addr, BIT(bit), bit_value);
 }
 
 static int exar_direction_output(struct gpio_chip *chip, unsigned int offset,
-- 
2.34.1


