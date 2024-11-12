Return-Path: <linux-gpio+bounces-12895-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99EB99C6515
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 00:23:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 845DBB36E74
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2024 20:17:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0877219CA4;
	Tue, 12 Nov 2024 20:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H2xc+vaE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DB1217472;
	Tue, 12 Nov 2024 20:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731442650; cv=none; b=E5g7tek/m0HqrWG2K0wDKVyvh51rMCRWNW+lnIzz77IhlXo3JyWtEyYpJbfvrf7Rhvxxbqva7LZkbpff7JkAs3poL84uy0oCHX1Ss0kCyFHjhVs1BRNblwCP7q/WWUWDMKUFDrisRB9X9+F8eSs+3IhriXxXAmukypqxnoxrROM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731442650; c=relaxed/simple;
	bh=ro9XVelZ3atKDO/u4sqphYozEmJwXP0Y25GX8YrxCNE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ibFwZbM2LsqOA6KKJ1qRamdmbY4KxhhaAiZFuDCHMFK8lLd4u63qD+4HPqT7rLiWJz3vus8Nt/xUR7Qt65X1tQ9FZWd7Gw/ZArPiCJ+SJg/RquqpY+YtgkTDrANietKg0UXKmVrxG2LVbpfdzNCxJmcwpRL8SbZOiRSplJoO7io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H2xc+vaE; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2e31af47681so4949487a91.2;
        Tue, 12 Nov 2024 12:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731442648; x=1732047448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PAV4PtAR/JvIHDDtRPtqXDMU9krT20z0Uly9xUY2Osg=;
        b=H2xc+vaEcGXICICqn6AH2j2NUHQr4M8UK8Mo5V5PmWYwK/2nTWH33rbNUpiGey+rk5
         HlE1iQ+ZIEeIqj4ScOvnUe6QrTto3carUdvx7nA6IX+YHvdgSRbrQF/PxMboCcNLcVjm
         TrVMPQ573GG4h4wT0efc6qmzaEby08PWoPWPwvL4D5H/1pfophLdNaBVurOFI47tk+9T
         ms8O5a5Xg2z0EIvq3nwkr/3e2ankUpsFEtx9ZfuPccRgGHcM42lhQRiW50NekTUMEDvZ
         Hb7/PJ64DYIqWzqZUmT0MH7pVvGzsDRnWqtaiIEf3t70VdAobFl/+2R0ITkRQK5oXs0/
         E34A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731442648; x=1732047448;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PAV4PtAR/JvIHDDtRPtqXDMU9krT20z0Uly9xUY2Osg=;
        b=NeMM0tr+sAgso4Fkb7YuIyEnI2IduBHU7i9SuoTtUJH7IHZHCBrTvQrhYGGZXoZvZn
         Qgseqefmk6YjzmEDriGwXOs2fsGSo3Y6+ggLAtsk8jqgV+zphOXY+j8BOYRmwFUjb6QQ
         vQlmyOfO3SFIxY5TtvVUSzfXOfeONlNdKZgjOFOxWQECvnp9F7MlSA3gufB8qSP+S0kn
         WI0US7IIYWIzVpe7Mqz/yZdFRbBtL8BHo/7ZT50xCUCy6d0BzOWaaleMbIzmaUWeg6PK
         S0QrPtKTQgLgaZe/JJrq+JUKlLxrlXdrVTJ8Y8tMCUsaMBRv9hTj/D8pyxyOHVK0lqFV
         7rIw==
X-Forwarded-Encrypted: i=1; AJvYcCXhYlbGrJnyIFDJ0uT8ThPm9xJsfj1usSGBGsCib7bjn0ESJJif/NNnPX3pUc66pGPT4OjYEoof77zOQ+w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8nI9aB4ijD6osjPRKvIEE3g8TyslduNChlEmSbSyu4ZnTx9be
	3t5nU63Fquh75PJD5qD4MWc1aklhqafohmLhCVKOGJWT8DIC1JApfe04JA==
X-Google-Smtp-Source: AGHT+IG4pSArWmfi9/g0Lb01DMUNRFD8V+J8yE0IVXQgs1FDijI2suaAlk8iweiDkD/IfXiuQhl8bw==
X-Received: by 2002:a17:90b:2dc4:b0:2e2:ca4d:9164 with SMTP id 98e67ed59e1d1-2e9f2c77136mr399395a91.12.1731442648032;
        Tue, 12 Nov 2024 12:17:28 -0800 (PST)
Received: from purva-IdeaPad-Gaming-3-15IHU6.lan ([2409:40c0:23d:98b3:efff:2469:dece:37c7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e9b26b9bd8sm9062075a91.5.2024.11.12.12.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 12:17:27 -0800 (PST)
From: Suraj Sonawane <surajsonawane0215@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Suraj Sonawane <surajsonawane0215@gmail.com>
Subject: [PATCH] gpio: gpio-exar: replace division condition with direct comparison
Date: Wed, 13 Nov 2024 01:46:59 +0530
Message-Id: <20241112201659.16785-1-surajsonawane0215@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix an issue detected by the Smatch tool:

drivers/gpio/gpio-exar.c:52 exar_offset_to_sel_addr() warn:
replace divide condition 'pin / 8' with 'pin >= 8'
drivers/gpio/gpio-exar.c:62 exar_offset_to_lvl_addr() warn:
replace divide condition 'pin / 8' with 'pin >= 8'

The division 'pin / 8' was used to check if the pin number is 8 or greater,
which can be confusing and less readable. Replacing it with 'pin >= 8'
makes the code clearer by directly comparing the pin number. This also
removes reliance on integer division, which can be harder to understand
and may introduce subtle bugs in the future.

Signed-off-by: Suraj Sonawane <surajsonawane0215@gmail.com>
---
 drivers/gpio/gpio-exar.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-exar.c b/drivers/gpio/gpio-exar.c
index 5170fe759..400cc3a0b 100644
--- a/drivers/gpio/gpio-exar.c
+++ b/drivers/gpio/gpio-exar.c
@@ -49,7 +49,7 @@ exar_offset_to_sel_addr(struct exar_gpio_chip *exar_gpio, unsigned int offset)
 {
 	unsigned int pin = exar_gpio->first_pin + (offset % 16);
 	unsigned int cascaded = offset / 16;
-	unsigned int addr = pin / 8 ? EXAR_OFFSET_MPIOSEL_HI : EXAR_OFFSET_MPIOSEL_LO;
+	unsigned int addr = pin >= 8 ? EXAR_OFFSET_MPIOSEL_HI : EXAR_OFFSET_MPIOSEL_LO;
 
 	return addr + (cascaded ? exar_gpio->cascaded_offset : 0);
 }
@@ -59,7 +59,7 @@ exar_offset_to_lvl_addr(struct exar_gpio_chip *exar_gpio, unsigned int offset)
 {
 	unsigned int pin = exar_gpio->first_pin + (offset % 16);
 	unsigned int cascaded = offset / 16;
-	unsigned int addr = pin / 8 ? EXAR_OFFSET_MPIOLVL_HI : EXAR_OFFSET_MPIOLVL_LO;
+	unsigned int addr = pin >= 8 ? EXAR_OFFSET_MPIOLVL_HI : EXAR_OFFSET_MPIOLVL_LO;
 
 	return addr + (cascaded ? exar_gpio->cascaded_offset : 0);
 }
-- 
2.34.1


