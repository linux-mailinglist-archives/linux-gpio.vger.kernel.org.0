Return-Path: <linux-gpio+bounces-6121-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AF88BC7BC
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 08:43:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72323281409
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 06:43:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE20747F45;
	Mon,  6 May 2024 06:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KSZfBus7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473F53BBE8;
	Mon,  6 May 2024 06:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714977811; cv=none; b=ow2AZfyxBSYPAsufgxAgrymeLU1ASH4uGauRNxxbg314zxh4zkcgGHWmRIfMQdHv40Oh+U8bVKpLHVY++vRKkEYBMQh5ILPkoR8dse1ieAt3SQFarK0ZGkZjS6CV3WmmeAAlyfKO5f3EwvLNmDGuKhDggwkkL0VGGiUt1lgAVSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714977811; c=relaxed/simple;
	bh=cHcYODpyX5cPBwr6W7tusxLoH0Z9u7FCNY5rMLy27es=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UBY17/+y9qEGlaPdpqDRTG2kI3SyevHMtW3DjopWHK6V08h4oKR/op21BA0cvpnORXgicbKrZr/pm2g8GZA2LBUqKj7DoJkSXQjZdwdsiJMKgEOn1zW6KGa0C3Anz/73IpQIvesooYcBkIL4hicISt3ov5h9S0F0wnlwCyI4EEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KSZfBus7; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-5f415fd71f8so1226495a12.3;
        Sun, 05 May 2024 23:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714977809; x=1715582609; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=alx1vGLK4Nn7gqqZZSreCoEN1bAw1gLW3wJCKjtuMCQ=;
        b=KSZfBus7XPksTXXx9knZfHIbU/lEmRdbShJ2hs4swFqNv2VNmRKmZ1PYSADfQH7VBI
         IzzE0Fw67ZDtD3IDw5qpWV5YTXA9L7DlY+lrS0G6NYAvexJKf81H8DOujHBx7NkNRHk3
         B03q/NakBrTaLbu2WBPdqNLfyeVoDr/KPyeO/SJBQqBcuC3XlhRpWvcd15/cq4SR99wc
         hbb/8ILOV+Gtj9tsL7p4LRwakcmz7uYkwf9JobxAlawlbnhqXLcjfWhxT2x8DdZqqrho
         3qNNvDg50rCIH6KeyXbSdGPmGln2nY0fllBpcvwIXzUZllldXrM0YPBgUYRuU29S3UDP
         HhKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714977809; x=1715582609;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=alx1vGLK4Nn7gqqZZSreCoEN1bAw1gLW3wJCKjtuMCQ=;
        b=YPcw31KJNOVl5jcIbVIUDAFPTOezYsmJJU7ba6f3dGBVYrgAmwq1Ebwdeq6Xr6/Qk6
         x0ro18l05ilNHlX1trrBNKGdRbXg1lehISlm8DrUS5W1Uwk77SjpuNLjEL8r/3Dr+5gU
         AyLYJ0fLGPshw7kLngy2gJri7PQKue/irTFzihriXz0fj7rUDf3wTDWRbVCX4s5jm76P
         mMLI8rEdzBPeuLhDhNAagsWEA9MdC4NWfqf1byT7C42iXDXm1ZICJ87MTOZYa0nv1wwJ
         SjaDp40XBsXkuDcrNEO+Dma+/L2quCPuOL6ZZnrLU3YNzUiYuey0OgdkVyouqenURGQf
         O4hg==
X-Forwarded-Encrypted: i=1; AJvYcCV09ALB/G55SGsxmte+4NAuhrER7TEqMpARZYFFAmiWEn0VffeU+M5NFL//uUuRkOLJ60RsEXmG0yakcyTIluek9iRXu9NgP4tcjDW6
X-Gm-Message-State: AOJu0YyJnmotzsmF6vGaCiL8wWw8VkgDBlfPkQI5gViIEBJeiZepkmBt
	lcx6VVWwNK+p1rfToq6ET2pW0Gmh8u4+9y2W3mtaaOV0bgggVPuH
X-Google-Smtp-Source: AGHT+IEc8dvXLKGNap462wqPULim0DUj6ARd6c5SuDImQ68+8z/pTRGVjzDTTZW7X9a2rUwA2mQebQ==
X-Received: by 2002:a17:90a:c697:b0:2b2:d086:6f84 with SMTP id n23-20020a17090ac69700b002b2d0866f84mr7584028pjt.7.1714977809393;
        Sun, 05 May 2024 23:43:29 -0700 (PDT)
Received: from localhost.localdomain ([180.217.157.40])
        by smtp.gmail.com with ESMTPSA id r8-20020a17090a2e8800b002a2a3aebb38sm7322415pjd.48.2024.05.05.23.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 May 2024 23:43:28 -0700 (PDT)
From: Jim Liu <jim.t90615@gmail.com>
X-Google-Original-From: Jim Liu <JJLIU0@nuvoton.com>
To: JJLIU0@nuvoton.com,
	KWLIU@nuvoton.com,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	dan.carpenter@linaro.org,
	jim.t90615@gmail.com,
	elfring@users.sourceforge.net
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH v4] gpio: nuvoton: Fix sgpio irq handle error
Date: Mon,  6 May 2024 14:42:44 +0800
Message-Id: <20240506064244.1645922-1-JJLIU0@nuvoton.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The generic_handle_domain_irq() function calls irq_resolve_mapping().
Thus delete a duplicative irq_find_mapping() call
so that a stack trace and an RCU stall will be avoided.


Fixes: c4f8457d17ce ("gpio: nuvoton: Add Nuvoton NPCM sgpio driver")
Signed-off-by: Jim Liu <JJLIU0@nuvoton.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
---
Changes for v4:
   - modify commit description
Changes for v3:
   - remove unused variable
Changes for v2:
   - add more description
---
 drivers/gpio/gpio-npcm-sgpio.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-npcm-sgpio.c b/drivers/gpio/gpio-npcm-sgpio.c
index d31788b43abc..260570614543 100644
--- a/drivers/gpio/gpio-npcm-sgpio.c
+++ b/drivers/gpio/gpio-npcm-sgpio.c
@@ -434,7 +434,7 @@ static void npcm_sgpio_irq_handler(struct irq_desc *desc)
 	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
 	struct irq_chip *ic = irq_desc_get_chip(desc);
 	struct npcm_sgpio *gpio = gpiochip_get_data(gc);
-	unsigned int i, j, girq;
+	unsigned int i, j;
 	unsigned long reg;
 
 	chained_irq_enter(ic, desc);
@@ -443,11 +443,9 @@ static void npcm_sgpio_irq_handler(struct irq_desc *desc)
 		const struct npcm_sgpio_bank *bank = &npcm_sgpio_banks[i];
 
 		reg = ioread8(bank_reg(gpio, bank, EVENT_STS));
-		for_each_set_bit(j, &reg, 8) {
-			girq = irq_find_mapping(gc->irq.domain,
-						i * 8 + gpio->nout_sgpio + j);
-			generic_handle_domain_irq(gc->irq.domain, girq);
-		}
+		for_each_set_bit(j, &reg, 8)
+			generic_handle_domain_irq(gc->irq.domain,
+						  i * 8 + gpio->nout_sgpio + j);
 	}
 
 	chained_irq_exit(ic, desc);
-- 
2.34.1


