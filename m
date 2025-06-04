Return-Path: <linux-gpio+bounces-20995-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02551ACE140
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Jun 2025 17:26:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 509463A889D
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Jun 2025 15:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBCA91C862E;
	Wed,  4 Jun 2025 15:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rs12x5s5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA8D19CC3D
	for <linux-gpio@vger.kernel.org>; Wed,  4 Jun 2025 15:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749050753; cv=none; b=mRWLFrJ29axdfQu7z0+zATDuZUTObdzMDzr/o4jszE8YLvuIInZon70MA0tXLISEO3JCxOWztEWBvB3YOhDes5dIGOZ8XWjCrIIQb+pZGG/lcGsoGKmxiVV+bYHoT8TqHPdNc7SUQWVa6UMbTh01ag6452cE2ujI0BvDaK9hVZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749050753; c=relaxed/simple;
	bh=Gj+OkGgY96XAKccd1qEAmfoB1fWuf6GgMzaQtMdSNXA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LhgmJvhhbZR0So/3pqM6I03HaQUvIFgTue28onKeeY00KEO9D6v7vq3b6/1q+o7mPSB+UBF712KOzdwqOvKaEfXeXaypiqorfP5zqzK+mv72mc0xrPscxHUWbbHuGODCSYDc5xNW8HTJyksSlQZ5h/MbIrd+CirQ5s61QO9oQlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rs12x5s5; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6071ac9dc3eso360227a12.1
        for <linux-gpio@vger.kernel.org>; Wed, 04 Jun 2025 08:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749050749; x=1749655549; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GivaCqfw+oHHkwskzA0HrsGk/OrrGEk7Uk/oqYQ1tlk=;
        b=Rs12x5s5l6bap5cohSEG0hwzOkM2u4ZFJIn1/fqrDhrh2yJhCN78E9YRt9Gqhyjfup
         WaijkXC040eioUZrbQigqq6c03xz0vtgISmGXcmiS65ZVIxjnny3HN45CE3049u9tOJC
         p3A60+hCOVoV7SUOnhJwsyYdYaIGco5oHqs3tqtJ563s5h0o+I5kAboV9Yz3okA9q1MB
         fx9i3T0SQqd33L8P1qcWcxmqOvg4xV5R5v4o6fYRBE/WItVrIy0DX945bHlP3Gab0JhP
         qobqEY3e5ND2S4wTUtJ8E0FFZVKnNpcepTbGcDkgIz1qcsRQKT+oINW6GlDhHOrdIZhT
         jnjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749050749; x=1749655549;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GivaCqfw+oHHkwskzA0HrsGk/OrrGEk7Uk/oqYQ1tlk=;
        b=SHKcD7c160rtyfUGz79UUR2BvRR1MSVsLiWDzWT11EKHaas7sQKN+GPxNad74sbEzc
         mbSXj8K5AO7IdTX7yZzuW0/9n2TkZ/yke6Mzd+TR/GLHSNR/A9Mjbwuxp69wp8cuV0Og
         mwiDwJcdCQRV376VWyerZ4Evn+daHTifJlNQz7LMtFMjk6MzddoJ5DzR378AY+B4KTNy
         Y+bHGtDZIi+0y6NdnXgg4c4J5rrH3TqPuo3VPXSP84O/NLAdEHfQwWPfoNn4ssoYgl1Q
         RPnfW3S4tch3Jxav+uDz9gDmoX1BmHSTwE/e3GNs475M++rfKaduJ+egKKYmRjTA/Ood
         I7gQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvnJD2vwPJf378KNy63RhK4kdcHRJ72LOgXB2U0Vs1Xrjz+D7e7/XQBPHeUUBiqwJryprme/Fi/GwQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxzN5swzuDbhjI+cbirOlMbx32XqPVbmE8aMQ+S1w2vY9KnnUxz
	alpVA4rgC7gtZKltH0Ud0ixToGwoLTega6YxdxcqE9GhXsUSiVEjMh7JTPNBvIXTB+s=
X-Gm-Gg: ASbGncsj6gP8Bf47y6jbHwgvUfcKgkJWkdMTdkKZdYGGfDjuNnQMW11M3YDHefKj0LK
	OrdNp1CqSxkP8c2xiWaFSjA7Mi1E5lJSf3rOyMJvoEL3UCTIk5WHB/Wk61gq/BXByQGZP3k9LSE
	sduKg2XpjVof9Oly2IAZUz7FAzfDRro6Xv/EYLBgkXbV3ko5iS2/leirSxi4Rgb1aTSi82e3DRq
	5hO5tLqOcI90u6aTCmXgmsDHMLk+k97NM5Z40F+2ab6E6zTqacDfodMcQPLLufzvAQDKcmR+VLF
	Qn23dWIorHBhVWb5Q7OH94LOcl1iYxsiNL54wahPvkuXYcaLZImokUDIDyY7jyxE6DwB4BktJg4
	D5PBKF7/NdfgCPSBCUdRxVaB462v6tb0M4pk=
X-Google-Smtp-Source: AGHT+IGV8hMofF63zCcJFZH5e/p1yvyUoeRTRE3SZ/3LkqyGQ9VGgvqlN/UR+F68PovdxN0Atb8y8w==
X-Received: by 2002:a05:6402:1ecf:b0:606:4d43:e647 with SMTP id 4fb4d7f45d1cf-606ea16e715mr3425583a12.24.1749050748992;
        Wed, 04 Jun 2025 08:25:48 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-606ed984f63sm1051640a12.58.2025.06.04.08.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 08:25:48 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 04 Jun 2025 16:25:46 +0100
Subject: [PATCH 07/17] mfd: sec-common: Instantiate s2mpg10 bucks and ldos
 separately
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250604-s2mpg1x-regulators-v1-7-6038740f49ae@linaro.org>
References: <20250604-s2mpg1x-regulators-v1-0-6038740f49ae@linaro.org>
In-Reply-To: <20250604-s2mpg1x-regulators-v1-0-6038740f49ae@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Bucks can conceivably be used as supplies for LDOs, which means we need
to instantiate them separately from each other so that the supply-
consumer links can be resolved successfully at probe time.

By doing so, the kernel will defer and retry instantiating the LDOs
once BUCKs have been created while without this change, it can be
impossible to mark BUCKs as LDO supplies. This becomes particularly
an issue with the upcoming support for the S2MPG11 PMIC, where
typically certain S2MP10/11 buck rails supply certain S2MP11/10 LDO
rails.

The platform_device's ::id field is used to inform the regulator driver
which type of regulators (buck or ldo) to instantiate.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c            | 4 +++-
 include/linux/mfd/samsung/s2mpg10.h | 5 +++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index 42d55e70e34c8d7cd68cddaecc88017e259365b4..8a1694c6ed8708397a51ebd4a49c22387d7e3495 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -14,6 +14,7 @@
 #include <linux/mfd/core.h>
 #include <linux/mfd/samsung/core.h>
 #include <linux/mfd/samsung/irq.h>
+#include <linux/mfd/samsung/s2mpg10.h>
 #include <linux/mfd/samsung/s2mps11.h>
 #include <linux/mfd/samsung/s2mps13.h>
 #include <linux/module.h>
@@ -35,7 +36,8 @@ static const struct mfd_cell s2dos05_devs[] = {
 
 static const struct mfd_cell s2mpg10_devs[] = {
 	MFD_CELL_NAME("s2mpg10-meter"),
-	MFD_CELL_NAME("s2mpg10-regulator"),
+	MFD_CELL_BASIC("s2mpg10-regulator", NULL, NULL, 0, S2MPG10_REGULATOR_CELL_ID_BUCKS),
+	MFD_CELL_BASIC("s2mpg10-regulator", NULL, NULL, 0, S2MPG10_REGULATOR_CELL_ID_LDOS),
 	MFD_CELL_NAME("s2mpg10-rtc"),
 	MFD_CELL_OF("s2mpg10-clk", NULL, NULL, 0, 0, "samsung,s2mpg10-clk"),
 	MFD_CELL_OF("s2mpg10-gpio", NULL, NULL, 0, 0, "samsung,s2mpg10-gpio"),
diff --git a/include/linux/mfd/samsung/s2mpg10.h b/include/linux/mfd/samsung/s2mpg10.h
index 9f5919b89a3c286bf1cd6b3ef0e74bc993bff01a..3e8bc65078472518c5e77f8bd199ee403eda18ea 100644
--- a/include/linux/mfd/samsung/s2mpg10.h
+++ b/include/linux/mfd/samsung/s2mpg10.h
@@ -8,6 +8,11 @@
 #ifndef __LINUX_MFD_S2MPG10_H
 #define __LINUX_MFD_S2MPG10_H
 
+enum s2mpg10_regulator_mfd_cell_id {
+	S2MPG10_REGULATOR_CELL_ID_BUCKS = 1,
+	S2MPG10_REGULATOR_CELL_ID_LDOS = 2,
+};
+
 /* Common registers (type 0x000) */
 enum s2mpg10_common_reg {
 	S2MPG10_COMMON_CHIPID,

-- 
2.49.0.1204.g71687c7c1d-goog


