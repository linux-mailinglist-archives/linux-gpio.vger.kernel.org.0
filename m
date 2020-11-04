Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7990A2A6795
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Nov 2020 16:25:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730646AbgKDPZ0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Nov 2020 10:25:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730490AbgKDPZU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Nov 2020 10:25:20 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24225C0613D3;
        Wed,  4 Nov 2020 07:25:20 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id 33so11674966wrl.7;
        Wed, 04 Nov 2020 07:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=10jlcCfU4L1eJ86OGF+6rgKnU1smgRqy0z0oCy+8t88=;
        b=H6uRIaV9ASsEqAl3oNKt5dW9WojRPD49hjl4ylqT5MomjW4XJo9O6QXBQYgUXO9VbK
         h6Kig5ikQATyxsuJUVPnDZG2meZO7LzmFiUTW3b0Plup1TdEUK2THtbVtB1Az9y5Ou3x
         W3fcJazdygmQvoPfEhb+DgMpQtXISwnRnNPRsCOnG9lDHEol+ju6TevyYTGi2vidcDZ8
         fsQW2gsEo0rvFFVzwXkFSVekf7JF574uKXu4uLokHjvP384I5AhGfglEVGZNm0xC1NrD
         xDoJ/kJ3heozb0oDrdyoZuG8FnWb7aFyJe4bbxpHT0/LysV1ND9ne12rGPIqqt23mvrq
         px2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=10jlcCfU4L1eJ86OGF+6rgKnU1smgRqy0z0oCy+8t88=;
        b=opSMmR2QKCD7Xq8t90m1vbB2fU/Cn8hp5rhINXPPhOusmoWxSJcxzyYyfW66P2MOzq
         z90TbbfDFE5+YEDuIFvfMfuGVT7EtskfzNwOnCugxG+TgXsXiq6WqFyIXJkUCl6GpgGF
         0S9q7zKzyHgrWwPFBUld4MpN9TubCqw4raKXIrMlLH2NfhMZfmEybH6giJAue05QNZwT
         OMkWPPB1UgE/3aUAITQ/6xx/rmI+OHXloIEflB9wW52gnymZyfdiOwZa8u6eyHRvayLH
         HdqOa8kp1T8VpwLH6GD2qR6WTvEIzIxo9WJas21FMe8jZ0Mlt2tPbEyJRtx+3pgHodNF
         R67g==
X-Gm-Message-State: AOAM531zXy3cOiLpXJZfU4wYBQix3EureevERwtcsjAP/WyGmxLIF5nW
        pkHHLp1Q7sHG+P07hyYvyjtSv4hd7sY=
X-Google-Smtp-Source: ABdhPJzBSRI84GB8ev44Z5ZbDjqTjjAIWCHXCXSLv1UJP6FIkp0kJXQC1MuuB/veY/X1yCKVW3sBVg==
X-Received: by 2002:a5d:4249:: with SMTP id s9mr369921wrr.226.1604503518901;
        Wed, 04 Nov 2020 07:25:18 -0800 (PST)
Received: from srv-dev.mgt.openheadend.tv (aob-ovh-4.easytools.tv. [51.210.1.153])
        by smtp.gmail.com with ESMTPSA id t2sm3050077wrw.95.2020.11.04.07.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 07:25:17 -0800 (PST)
From:   Arnaud de Turckheim <quarium@gmail.com>
To:     linus.walleij@linaro.org
Cc:     bgolaszewski@baylibre.com, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, vilhelm.gray@gmail.com,
        Arnaud de Turckheim <quarium@gmail.com>
Subject: [PATCH 2/3] gpio: pcie-idio-24: Fix IRQ Enable Register value
Date:   Wed,  4 Nov 2020 16:24:54 +0100
Message-Id: <20201104152455.40627-3-quarium@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201104152455.40627-1-quarium@gmail.com>
References: <20201104152455.40627-1-quarium@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This fixes the COS Enable Register value for enabling/disabling the
corresponding IRQs bank.

Fixes: 585562046628 ("gpio: Add GPIO support for the ACCES PCIe-IDIO-24 family")
Signed-off-by: Arnaud de Turckheim <quarium@gmail.com>
---
 drivers/gpio/gpio-pcie-idio-24.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-pcie-idio-24.c b/drivers/gpio/gpio-pcie-idio-24.c
index 5ea517416366..a61de14d09b6 100644
--- a/drivers/gpio/gpio-pcie-idio-24.c
+++ b/drivers/gpio/gpio-pcie-idio-24.c
@@ -334,13 +334,13 @@ static void idio_24_irq_mask(struct irq_data *data)
 	unsigned long flags;
 	const unsigned long bit_offset = irqd_to_hwirq(data) - 24;
 	unsigned char new_irq_mask;
-	const unsigned long bank_offset = bit_offset/8 * 8;
+	const unsigned long bank_offset = bit_offset / 8;
 	unsigned char cos_enable_state;
 
 	raw_spin_lock_irqsave(&idio24gpio->lock, flags);
 
 	idio24gpio->irq_mask &= ~BIT(bit_offset);
-	new_irq_mask = idio24gpio->irq_mask >> bank_offset;
+	new_irq_mask = idio24gpio->irq_mask >> bank_offset * 8;
 
 	if (!new_irq_mask) {
 		cos_enable_state = ioread8(&idio24gpio->reg->cos_enable);
@@ -363,12 +363,12 @@ static void idio_24_irq_unmask(struct irq_data *data)
 	unsigned long flags;
 	unsigned char prev_irq_mask;
 	const unsigned long bit_offset = irqd_to_hwirq(data) - 24;
-	const unsigned long bank_offset = bit_offset/8 * 8;
+	const unsigned long bank_offset = bit_offset / 8;
 	unsigned char cos_enable_state;
 
 	raw_spin_lock_irqsave(&idio24gpio->lock, flags);
 
-	prev_irq_mask = idio24gpio->irq_mask >> bank_offset;
+	prev_irq_mask = idio24gpio->irq_mask >> bank_offset * 8;
 	idio24gpio->irq_mask |= BIT(bit_offset);
 
 	if (!prev_irq_mask) {
-- 
2.25.1

