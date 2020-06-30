Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33B1F20F5B7
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2020 15:34:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388167AbgF3Ndz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jun 2020 09:33:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388151AbgF3Ndw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jun 2020 09:33:52 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F05BFC03E97E
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2020 06:33:51 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id j18so18841039wmi.3
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2020 06:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0KDVLpzHsMQDeKu96sh9LYIj12RVnAxA/ichztsrMZQ=;
        b=x/GhyMw3/PifnbCbFgYc7YsXMeDkSg5tTzV3oQIeQg6caOEYi+xswGvOI4ODzVR/8n
         iYpm0sI3ldVEWE09KVrxRclwDY+yPK6PRD4DJgs9uGscSp38D6ptpQ1FCdluuhPOl+3a
         fjUpiqUFSOdZEY8qRBCBH2z1Xp7eeoe0+lVECx17sZjtUMuLT84RMxJ1egmxJL5M4AyA
         FyjcF0JSFT6aIyLB57aBRZk7L9szqdI9Oh3iXaf7HgtrY7jWAvB45lA39yduqcbnBQ/4
         YDdIIUEW1DQrsDmASh/wUS7qq16C1l2mnsG2iKBst8FVZG1WDGPO9hfscMSITQxIUidG
         53Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0KDVLpzHsMQDeKu96sh9LYIj12RVnAxA/ichztsrMZQ=;
        b=bhZH+ALV4RLyY90KB+8eAxsSUoN0l5pasxcLz2TGS5ciLygdKZj4Kke89c29N0WPTQ
         dj3fnrEeUCrA5K6YiVlBvTuc1yvW5MyrqVZ5BWm40HBcSEqn4UDcKLEXcfZMbZcUvX1A
         81/86d06OWf7vQagcvtj2qNf8XVTfaHe/wISwitmrOebA34aCND0sDvLK1a3vN0EzNdh
         Q/iirkYBIXfA1KVpUciXi+d4oZPRZgxPMlgswhKy/k7+m7APXcmxn1H/upzN3+QK/DcR
         4B1smsnpp31BL08Q7kkVB04bLDw88RkaUeBXv5mjJQQGWZsT7llEHzumhfyIPG1R+mEv
         tJnQ==
X-Gm-Message-State: AOAM531qiZL77pNTpv56Wou+07flONQMFSgkc1tjnXbkDtb914i2+CeO
        i2AjrsIu5gyQFvxy+OCHIVrrGA==
X-Google-Smtp-Source: ABdhPJyW4GtmRxifF3bHq9VjFlQY+qelF9g4jJYBP6hKH+QoodWUb+3zaFky4HbgEYJPkrGSE/VpMw==
X-Received: by 2002:a1c:80d3:: with SMTP id b202mr22156497wmd.111.1593524030718;
        Tue, 30 Jun 2020 06:33:50 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id z16sm3682464wrr.35.2020.06.30.06.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 06:33:50 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Joyce Ooi <joyce.ooi@intel.com>,
        Tien Hock Loh <thloh@altera.com>
Subject: [PATCH 02/10] gpio: gpio-altera: Add missing kerneldoc entry and demote comment
Date:   Tue, 30 Jun 2020 14:33:37 +0100
Message-Id: <20200630133345.2232932-3-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200630133345.2232932-1-lee.jones@linaro.org>
References: <20200630133345.2232932-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

'struct altera_gpio_chip's 'irq_chip' property is undocumented.  So
add property description to the struct's kerneldoc header.  Also
demote comment block which is clearly not in kerneldoc format.

Fixes the following W=1 warnings:

 drivers/gpio/gpio-altera.c:34: warning: Function parameter or member 'irq_chip' not described in 'altera_gpio_chip'
 drivers/gpio/gpio-altera.c:78: warning: Function parameter or member 'd' not described in 'altera_gpio_irq_set_type'
 drivers/gpio/gpio-altera.c:78: warning: Function parameter or member 'type' not described in 'altera_gpio_irq_set_type'

Cc: Joyce Ooi <joyce.ooi@intel.com>
Cc: Tien Hock Loh <thloh@altera.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpio/gpio-altera.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-altera.c b/drivers/gpio/gpio-altera.c
index cc4ba71e4fe3c..b7932ecc3b613 100644
--- a/drivers/gpio/gpio-altera.c
+++ b/drivers/gpio/gpio-altera.c
@@ -24,6 +24,7 @@
 * @interrupt_trigger	: specifies the hardware configured IRQ trigger type
 *			  (rising, falling, both, high)
 * @mapped_irq		: kernel mapped irq number.
+* @irq_chip		: IRQ chip configuration
 */
 struct altera_gpio_chip {
 	struct of_mm_gpio_chip mmchip;
@@ -69,7 +70,7 @@ static void altera_gpio_irq_mask(struct irq_data *d)
 	raw_spin_unlock_irqrestore(&altera_gc->gpio_lock, flags);
 }
 
-/**
+/*
  * This controller's IRQ type is synthesized in hardware, so this function
  * just checks if the requested set_type matches the synthesized IRQ type
  */
-- 
2.25.1

