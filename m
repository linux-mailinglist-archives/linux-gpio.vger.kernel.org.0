Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D38E72A6798
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Nov 2020 16:25:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730395AbgKDPZT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Nov 2020 10:25:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730349AbgKDPZS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Nov 2020 10:25:18 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09375C0613D3;
        Wed,  4 Nov 2020 07:25:18 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id x7so22497047wrl.3;
        Wed, 04 Nov 2020 07:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BF7gpkzHkPFc34hVY9E9ZbHX268ds3rIV7llWF9u/o8=;
        b=EAl3Ny7V5PvlOEbuMhVwjCjkp0PPEGY5PrBWvoidTsSINFel4Tv0uA+jQNg4pwqIlK
         ojuDwKG7LWDA51y2Fg8l0QxXkjHp2qQ0j/+5b6SQqlLSKlVwtyoAI2IizZ+wZRfH+uds
         hqmYdc1UtM17xtESd/D2qAcoEqyqfL0GuoR0hw9MrJhLkHk8uPHQHcHMesXyV+9EHqLd
         cZ++Sy+Om5GpPCktZfPATQ+XbRIYM2ro83c3HkJImlyp0kWbbXqyCfNO3xc9zCDBVObd
         lEdPGfNtYIWgUUthiwLYAtsNLhguGSY0dQxo+BL4oNmg2vl4zY6LunypjH16AaolfLZ5
         D1gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BF7gpkzHkPFc34hVY9E9ZbHX268ds3rIV7llWF9u/o8=;
        b=N3Cpph2j5qXhcofcbUv32ZUEmAu1dcwJ2+F1jcSrmANNlddOO9vZw33uYJYygXfbnr
         WjrqSqCYlBoeFxyfhH4JdRa5oUiBQ7GeBhxG54CM1AunBNjus7zbPLL+PFwrwVH6Hfzo
         G8p7uVlJaZjwzuqT9GDXjNCZfctsCoI+ZGYKkR/j94rLtbE3v0cWuS5NmVW9ePU2UWs3
         Ybr52aBrkSW27dxvvTNNXKXNIR3C/0MODOslaz12dqLUaakfDlyV9PS9UgG+UzFhdYkL
         QqsgJ+T0K1gUlNmKm8rTuaSD1savgUxAiHauux6WXjuQraeS0ltu0Ce4dp6cTc+asBgO
         uk+A==
X-Gm-Message-State: AOAM532LUfyVTj36esEoJRMjurb5ltzvXdunmSif6VB2/X9Ms1OE6GqV
        UqylmcgL11iM+6MukmgsNtgdMrga3pA=
X-Google-Smtp-Source: ABdhPJwVgTXQO4aUB14NJoYkDr4bwwLx8LUKunKbtyH7Os1A/enmGBc5CVn7/wkjlJgZrwf+esPbGw==
X-Received: by 2002:adf:c143:: with SMTP id w3mr32643252wre.62.1604503516797;
        Wed, 04 Nov 2020 07:25:16 -0800 (PST)
Received: from srv-dev.mgt.openheadend.tv (aob-ovh-4.easytools.tv. [51.210.1.153])
        by smtp.gmail.com with ESMTPSA id t2sm3050077wrw.95.2020.11.04.07.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 07:25:16 -0800 (PST)
From:   Arnaud de Turckheim <quarium@gmail.com>
To:     linus.walleij@linaro.org
Cc:     bgolaszewski@baylibre.com, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, vilhelm.gray@gmail.com,
        Arnaud de Turckheim <quarium@gmail.com>
Subject: [PATCH 1/3] gpio: pcie-idio-24: Fix irq mask when masking
Date:   Wed,  4 Nov 2020 16:24:53 +0100
Message-Id: <20201104152455.40627-2-quarium@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201104152455.40627-1-quarium@gmail.com>
References: <20201104152455.40627-1-quarium@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fix the bitwise operation to remove only the corresponding bit from the
mask.

Fixes: 585562046628 ("gpio: Add GPIO support for the ACCES PCIe-IDIO-24 family")
Signed-off-by: Arnaud de Turckheim <quarium@gmail.com>
---
 drivers/gpio/gpio-pcie-idio-24.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pcie-idio-24.c b/drivers/gpio/gpio-pcie-idio-24.c
index a68941d19ac6..5ea517416366 100644
--- a/drivers/gpio/gpio-pcie-idio-24.c
+++ b/drivers/gpio/gpio-pcie-idio-24.c
@@ -339,7 +339,7 @@ static void idio_24_irq_mask(struct irq_data *data)
 
 	raw_spin_lock_irqsave(&idio24gpio->lock, flags);
 
-	idio24gpio->irq_mask &= BIT(bit_offset);
+	idio24gpio->irq_mask &= ~BIT(bit_offset);
 	new_irq_mask = idio24gpio->irq_mask >> bank_offset;
 
 	if (!new_irq_mask) {
-- 
2.25.1

