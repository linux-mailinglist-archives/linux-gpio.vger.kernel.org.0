Return-Path: <linux-gpio+bounces-15675-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 54624A2FD53
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 23:39:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 38A52188AAFB
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 22:39:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8A2D25A354;
	Mon, 10 Feb 2025 22:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="TLOvJjDN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBDB25A2C5
	for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2025 22:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739227067; cv=none; b=YUstyFqaYqZ0yMXZSctMqdsWXCeYzq23pfHjCp930p+8bzhXvYemLO3vXg8rYGzQQ0S/n+v/foiemAtgh3pYOWsPBKcrvUPwKaY+FruQhNXt8UG7ppaACkMAFXujt+/BnX0A7emaIuxD1ydy2hT4pSYGUFIlmKN/7babsizxItM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739227067; c=relaxed/simple;
	bh=h4/JkT/aieYSqhfnM9UnuUTJJW8FA5AwmbHA2f2Z3qI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lJgUWiDmvpkA7LG0P2gz5kTHIo1ORnFFlzo5nw9uL7zeTJ1Q7EL5ndgv7iY0tjOI/MeEhpoXAcmN6q7W1nUPGMerNx2LbGp2zLl/Y1d+3V7Zs3Av5a9M89fxGYKw+E2WtYxBFtIf1sD43WHyvzddTi8hIK7srCn6Qp7JfMheVa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=TLOvJjDN; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3f3b6d7045fso801067b6e.1
        for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2025 14:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739227065; x=1739831865; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aXB+byZeKAp4YicbFdNdAOrg4x68Xt2NQ79nnhRrJVU=;
        b=TLOvJjDNBxarUBELg7go/ZxX0zU+xs39riDy84aC4j2XbIyhm1pT74p/AGm39IqyRZ
         bknIVVrQU2LwEzznw9FCg4/I6+7S/onqBEXzcpR65VT172DkSyNa4b6zuoHcZwRcLORR
         yooOMj/CxF7agVXCqEErNuJBbNcNcreGO1y0qaCMTXz0qQzT3w7uMQD+kc2Q5ty9Dzm/
         3zF3qLHrKWV/Srh+kAZopRBiRZo7Nk9kUIIJ8dS4T6VUnaNj25a1ZNm3dcZ2WGQw+O5a
         qAtRg4iru5kNYEqyRzgAT3OoX/SGWZ5VwNlTo6iGuKGRzWMV5R4ptInabd4QfOB9yJqD
         zbng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739227065; x=1739831865;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aXB+byZeKAp4YicbFdNdAOrg4x68Xt2NQ79nnhRrJVU=;
        b=Zc8zI8/F0NmN9I/A1P4GJXJ67w+/BOoFYUD/2VCYtkk0pA+bk1QEtE8ZI/IwfK8FtJ
         YorQJo5Y7IO52DJabxSLeqqz/tOngLtv4fLXYxEFJ4BWTzQ9koU4OUm8KMWLMPRDW6YZ
         +XDevtTk4n3FGfd4vNb2aBfxM3N7mUeM7T9e41tBt2m5GV2eZqCWaJrfAEOiDOxBIcDw
         JxE49HHLlFAl350Hzg64fNnGiZMPMMXmxMEqp5jNJuEsOFtLRlsE/vpyMccbGOxE3rsu
         tqNZ/bzZSi0CecMZYrQa6XXxGqJss0Zerv0Mr2F1IlopsvxequtC5e3/QTAcKyL4bu+8
         b7nQ==
X-Gm-Message-State: AOJu0YwUuJezKmiG7k/pgq7VumzYJ5XKZsNdN89AMzVG5i5mT0555doS
	KPIaS/x8ZqKk0kBwni44j+c3GK1RN4S95fzGcgr5UAFI9UKzx9JPhjYcfKpcZDo=
X-Gm-Gg: ASbGncvU0fqxUZo8CmX9s8R7hmO4elHgh5VnQzoQLwaEZ2Qo4sDFOo/TBVzKfdOH+k+
	upxfjchez8ORbQMr3Lhivw9IkXQMYLAX0CmTNBfnp5Y2yhUIPw0a7MZOh4Mu3SaPhuGZgnav9UM
	fx6T3Ip1hoxeeskxWH/qIfL1x7MY+XX4rUQ4gighewlTuRFmWn790EbLQUyzLYPGDtmCpWh9b6C
	Nx0E7wmokUUjc/ua5RdQFSAgBEFm5TQ1g4FlD4DwddqsCKt7++fzJhYouoiYEoioyOO0rooTcsS
	EQaZlUkiGhMGyiQ5/DBevcQjt+T5/rFoKMZBdU4Hg8N05uQ=
X-Google-Smtp-Source: AGHT+IHioMIxu9VGnzXizdV46F3qMiFjs48WUo2oHZz5JGkXBH5C7gXq210bMR9McIstDGpa5KGthg==
X-Received: by 2002:a05:6808:319a:b0:3f3:c1e0:c466 with SMTP id 5614622812f47-3f3c1e0c4edmr1094523b6e.5.1739227064928;
        Mon, 10 Feb 2025 14:37:44 -0800 (PST)
Received: from [127.0.1.1] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f389ed1ca2sm2521820b6e.11.2025.02.10.14.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 14:37:43 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 10 Feb 2025 16:33:31 -0600
Subject: [PATCH v3 05/15] bus: ts-nbus: use bitmap_get_value8()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-gpio-set-array-helper-v3-5-d6a673674da8@baylibre.com>
References: <20250210-gpio-set-array-helper-v3-0-d6a673674da8@baylibre.com>
In-Reply-To: <20250210-gpio-set-array-helper-v3-0-d6a673674da8@baylibre.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Peter Rosin <peda@axentia.se>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-iio@vger.kernel.org, linux-mmc@vger.kernel.org, 
 netdev@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-sound@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2

Use bitmap_get_value8() instead of accessing the bitmap directly.

Accessing the bitmap directly is not considered good practice. We now
have a helper function that can be used instead, so let's use it.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/bus/ts-nbus.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/ts-nbus.c b/drivers/bus/ts-nbus.c
index b4c9308caf0647a3261071d9527fffce77784af2..beac67f3b820377f8bb1fc4f4ee77e15ee240834 100644
--- a/drivers/bus/ts-nbus.c
+++ b/drivers/bus/ts-nbus.c
@@ -10,6 +10,7 @@
  * TS-4600 SoM.
  */
 
+#include <linux/bitmap.h>
 #include <linux/bitops.h>
 #include <linux/gpio/consumer.h>
 #include <linux/kernel.h>
@@ -107,7 +108,7 @@ static void ts_nbus_reset_bus(struct ts_nbus *ts_nbus)
 {
 	DECLARE_BITMAP(values, 8);
 
-	values[0] = 0;
+	bitmap_set_value8(values, byte, 0);
 
 	gpiod_multi_set_value_cansleep(ts_nbus->data, values);
 	gpiod_set_value_cansleep(ts_nbus->csn, 0);
@@ -151,7 +152,7 @@ static void ts_nbus_write_byte(struct ts_nbus *ts_nbus, u8 byte)
 {
 	DECLARE_BITMAP(values, 8);
 
-	values[0] = byte;
+	bitmap_set_value8(values, byte, 8);
 
 	gpiod_multi_set_value_cansleep(ts_nbus->data, values);
 }

-- 
2.43.0


