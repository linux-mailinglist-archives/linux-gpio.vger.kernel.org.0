Return-Path: <linux-gpio+bounces-998-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A0F803FD6
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 21:36:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF7321F212E2
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 20:36:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 562FE35EF5;
	Mon,  4 Dec 2023 20:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hefring-com.20230601.gappssmtp.com header.i=@hefring-com.20230601.gappssmtp.com header.b="b+vDXRMz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 381DE127
	for <linux-gpio@vger.kernel.org>; Mon,  4 Dec 2023 12:35:39 -0800 (PST)
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-58d9a4e9464so2021185eaf.0
        for <linux-gpio@vger.kernel.org>; Mon, 04 Dec 2023 12:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hefring-com.20230601.gappssmtp.com; s=20230601; t=1701722138; x=1702326938; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FWagGRv/i1MW5G1zwpH94jc78fOBc/tv6/pgOnwcx6k=;
        b=b+vDXRMze/C1r4e24CUeK2VhFvtLtGE/yojAiTPjpqNP0zOjoF5EGSYgkfebMM87Ok
         41+lNvkLHVfg5wYqgC1KSv/uAwiPfJSyj4j7Wd1KK50zRp8lCKOJ1j47MMBI5scT3KD/
         WAQ+MtoH1Wjx5c0IqOD9lgVW3pCnmt35I8R4Rs4bsn7a2x0XWEBGWQ8tfy/5XhRoIA2h
         Hgw2AlUxovbI+3Wt1XQKjrH6EjX5lLQfObCXV0uUrlyzWLCZB4o7LlxBuhU/hwYBVx9f
         g7qKnCxGz68O4qb8h1t+Nz5dGEw3Bn8nkXAHX0vsYyFMLcVKhpQ7D+EgH3/bOuJMjNoC
         YdDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701722138; x=1702326938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FWagGRv/i1MW5G1zwpH94jc78fOBc/tv6/pgOnwcx6k=;
        b=kEi2pSCRqBB9ekQw9GqJJQ4ohFmfUfhfJjNQdNuYDPZN2o+p+M8TiAcpYTXhfvMs/j
         kV52Vl08ZO2EMFQSCuMK97PGFhGGVgkojbaYv/rWoCu2qJuXNgJLps6sl9cXDLK94pVF
         MHaoW0xfeWMuOgNah2Blu+KmQgBHHiMz576SJb2yOyRRzLx/1X76kp0HKL044ZeOD55e
         b52c5/9zEXBfedw7nD8Np/GfA1JJ5pn/oA+ZXcnKEPxv00Wt1z3qRqQpva4UwB1DMFCs
         2YD97qEK27FPlWWcz7rkixb42uJRVfit5/OOjA5L7nMZnzBWNECxdFD3FQ5C1TknVxp9
         qT/g==
X-Gm-Message-State: AOJu0YylclXSPXZ23AaXWDFo0TfN9bzIgzdzCTw8/Jswyvk+/IjyneKI
	eUizecit1fYO+E4jmvThkCOijQ==
X-Google-Smtp-Source: AGHT+IGpvpasx/jsnz18GATaaZSXxidSk27F4tka23is5+bIfanisW7osRFJz0pud48XSUhXK+w7lw==
X-Received: by 2002:a05:6358:640b:b0:16d:f932:b5f with SMTP id f11-20020a056358640b00b0016df9320b5fmr1254764rwh.30.1701722138274;
        Mon, 04 Dec 2023 12:35:38 -0800 (PST)
Received: from localhost.localdomain ([50.212.55.89])
        by smtp.gmail.com with ESMTPSA id jo23-20020a056214501700b0067ac930d17asm1123469qvb.141.2023.12.04.12.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 12:35:37 -0800 (PST)
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
Subject: [PATCH 2/2] pinctrl: stm32: fix GPIO level interrupts
Date: Mon,  4 Dec 2023 15:33:57 -0500
Message-ID: <20231204203357.2897008-3-ben.wolsieffer@hefring.com>
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

The STM32 doesn't support GPIO level interrupts in hardware, so the
driver tries to emulate them using edge interrupts, by retriggering the
interrupt if necessary based on the pin state after the handler
finishes.

Currently, this functionality does not work because the irqchip uses
handle_edge_irq(), which doesn't run the irq_eoi() or irq_unmask()
callbacks after handling the interrupt. This patch fixes this by using
handle_level_irq() for level interrupts, which causes irq_unmask() to be
called to retrigger the interrupt.

Signed-off-by: Ben Wolsieffer <ben.wolsieffer@hefring.com>
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 603f900e88c1..fb9532601cbb 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -348,12 +348,15 @@ static int stm32_gpio_set_type(struct irq_data *d, unsigned int type)
 	case IRQ_TYPE_EDGE_RISING:
 	case IRQ_TYPE_EDGE_FALLING:
 	case IRQ_TYPE_EDGE_BOTH:
+		irq_set_handler_locked(d, handle_edge_irq);
 		parent_type = type;
 		break;
 	case IRQ_TYPE_LEVEL_HIGH:
+		irq_set_handler_locked(d, handle_level_irq);
 		parent_type = IRQ_TYPE_EDGE_RISING;
 		break;
 	case IRQ_TYPE_LEVEL_LOW:
+		irq_set_handler_locked(d, handle_level_irq);
 		parent_type = IRQ_TYPE_EDGE_FALLING;
 		break;
 	default:
-- 
2.42.1


