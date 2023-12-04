Return-Path: <linux-gpio+bounces-999-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 198BF803FD9
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 21:36:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 94A05B20C09
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 20:36:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87D0735F0E;
	Mon,  4 Dec 2023 20:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hefring-com.20230601.gappssmtp.com header.i=@hefring-com.20230601.gappssmtp.com header.b="puPA9UAs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D021D1B3
	for <linux-gpio@vger.kernel.org>; Mon,  4 Dec 2023 12:35:37 -0800 (PST)
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-58dd3528497so3325158eaf.3
        for <linux-gpio@vger.kernel.org>; Mon, 04 Dec 2023 12:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hefring-com.20230601.gappssmtp.com; s=20230601; t=1701722137; x=1702326937; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oMsMKq+fG5BsTJ38ktkUAvKvU/juEXAO2vxB2M78m9A=;
        b=puPA9UAsbsiGjJK4bD5uzqiISC5Auxb/XPKl1W3DkM+OI2MEPNYPbYb6zYzUgicyHa
         fYIz0J+O0rl1J5qJmJCGa3H5bZAvcGJl8H2AJV7RKvoEKaaU02LFgn0oAwhDe8y7ny6C
         j0tDqK30HXoVNVZF/lbgHrz4Gv4X6hUAG5msxB5qymDLxOtZaYCwIMYltH9lzss6m4le
         w1J047+L3fsRt8fuLnwmoQpjcu3oq9Pw44dQXZu64JrF/KqZhbZeRvoK/pbshm1qaU0B
         gjKBrv9RN83aC8jPuNWH+buofCIhbegY0E1vH9uYgWX2hgYz7HW/SUNcTlv/IEExHGbc
         MyVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701722137; x=1702326937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oMsMKq+fG5BsTJ38ktkUAvKvU/juEXAO2vxB2M78m9A=;
        b=Wynr1UXVKyV3xZGUpW3GGFOL0EfIKfF4il/YkhpdrEysdNbasJa7lHF8u7Vi/ekWGl
         dk2kEI/GCTsKWAh3pBzPZVaOwaZiptrjGr877E9Su5TYaYumyvhHnU1P7ryknNKoUA/C
         NGulpplu3oIIICM4GWfNrBgrvLJBlCFNdpT+nK8M9cLfBD2l4EiCjgOutIQ4h1fwpVM9
         n4eNT/JXi7pJ0bXpEdG0jc6UchHDlKYS82B4ubaQR3/fXmDLMDjn6oao0qBGbkG91s78
         vynQgqauNKo/cmHUxKVtt6859mulLBvvB+1V9cbwwo42hC3CxEXk3yHB1FJo1kZzBh17
         X9aA==
X-Gm-Message-State: AOJu0YwmKtJzlDvb80M/A2SGZpYFsZBrbmI+4nlWqyNRYwMCHsSGScPg
	rWTF3UmBaM6dZypr5JPyqchxiw==
X-Google-Smtp-Source: AGHT+IF2Gj+iJqDa8aGY27lxy9gezYaVc/7geGOoCzfX8J7QXvpmy9rY5js/M1Vlkz5tRc2LBUEwAg==
X-Received: by 2002:a05:6871:281:b0:1fa:f230:4c58 with SMTP id i1-20020a056871028100b001faf2304c58mr5820598oae.59.1701722136896;
        Mon, 04 Dec 2023 12:35:36 -0800 (PST)
Received: from localhost.localdomain ([50.212.55.89])
        by smtp.gmail.com with ESMTPSA id jo23-20020a056214501700b0067ac930d17asm1123469qvb.141.2023.12.04.12.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 12:35:35 -0800 (PST)
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
To: linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Ben Wolsieffer <ben.wolsieffer@hefring.com>
Subject: [PATCH 1/2] irqchip/stm32-exti: support retriggering on STM32 MCUs
Date: Mon,  4 Dec 2023 15:33:56 -0500
Message-ID: <20231204203357.2897008-2-ben.wolsieffer@hefring.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231204203357.2897008-1-ben.wolsieffer@hefring.com>
References: <20231204203357.2897008-1-ben.wolsieffer@hefring.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

EXTI retriggering support was missing on STM32 MCUs. Retriggering is
required to emulate GPIO level interrupts using edge interrupts in the
STM32 pinctrl driver.

Signed-off-by: Ben Wolsieffer <ben.wolsieffer@hefring.com>
---
 drivers/irqchip/irq-stm32-exti.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/irqchip/irq-stm32-exti.c b/drivers/irqchip/irq-stm32-exti.c
index 971240e2e31b..6b3f54457812 100644
--- a/drivers/irqchip/irq-stm32-exti.c
+++ b/drivers/irqchip/irq-stm32-exti.c
@@ -328,6 +328,18 @@ static void stm32_irq_handler(struct irq_desc *desc)
 	chained_irq_exit(chip, desc);
 }
 
+static int stm32_irq_retrigger(struct irq_data *d)
+{
+	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
+	struct stm32_exti_chip_data *chip_data = gc->private;
+	const struct stm32_exti_bank *stm32_bank = chip_data->reg_bank;
+	u32 mask = BIT(d->hwirq % IRQS_PER_BANK);
+
+	irq_reg_writel(gc, mask, stm32_bank->swier_ofst);
+
+	return 0;
+}
+
 static int stm32_exti_set_type(struct irq_data *d,
 			       unsigned int type, u32 *rtsr, u32 *ftsr)
 {
@@ -856,6 +868,7 @@ static int __init stm32_exti_init(const struct stm32_exti_drv_data *drv_data,
 		gc->chip_types->chip.irq_ack = stm32_irq_ack;
 		gc->chip_types->chip.irq_mask = irq_gc_mask_clr_bit;
 		gc->chip_types->chip.irq_unmask = irq_gc_mask_set_bit;
+		gc->chip_types->chip.irq_retrigger = stm32_irq_retrigger;
 		gc->chip_types->chip.irq_set_type = stm32_irq_set_type;
 		gc->chip_types->chip.irq_set_wake = irq_gc_set_wake;
 		gc->suspend = stm32_irq_suspend;
-- 
2.42.1


