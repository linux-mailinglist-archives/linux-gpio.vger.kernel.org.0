Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EE442A70F5
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Nov 2020 00:07:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731629AbgKDXHq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Nov 2020 18:07:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730651AbgKDXHp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Nov 2020 18:07:45 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2AACC0613CF;
        Wed,  4 Nov 2020 15:07:43 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id 72so11898442pfv.7;
        Wed, 04 Nov 2020 15:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u5W3K+h3KxRMxrwYxfI391oiDCMPvR7aqL0wTjkgTp4=;
        b=gYcrz0JbG5s1bIPoH1eV5aWXlcNs56sOF9T5Emg0FpPHJTfjCYO16EBvI6DtHKqHmO
         TVhnjXx6G1+td7bWYUYmeNdpBM6QUsdEseC+HWekTiVnaqDDpa/i7hJiDu97TPxpc+wY
         iYvogtmho5LzD236ZhK/SLSU1jSyOmtg5Vh8+oWDXUXinnGgvDNot6+vK0mtMtN+3zbl
         u1q/6s/x0BM13jU8GXVi2530GoaifvyUgu+6abk8959SeOGuDkIX9a4XGoNt8OTJOHbR
         Ml/lTwsrBIMKF8j8VmI8uMMKIN0TuKzaDmmrV7Fol5PQPx2mYvyQtHvx/tU4me1wCSO9
         D64Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u5W3K+h3KxRMxrwYxfI391oiDCMPvR7aqL0wTjkgTp4=;
        b=I9nhr+eYjZVynp+1lKTWxSEIUWLQs5Or5ARE3ZnuHHJ0PQF+J3Ego63byJ3RQbh5GX
         h8cSdHEEyujfO/xDCnmNXRiRlT0lNwxbBd4Fq+usLDdQ9m6xU94Do9NlZNS/9+FNpTO3
         DK5Sn9qt6AhkrblGpi+lEeeZJoMXQLXzpZQDdfMsicNHpc7Oh2aRY/RJ7+K8j+W5uigC
         vcxTMffxJGIAimAmLHMCTxN4866LozRVMFSvZhOr/u6jLQLLH570oljPgYb3B2Y/xorT
         Q3T7CO21wdBgafBjSsy45MgDdybTWoPwDGrW5cp/9KkwByxC4kDZl26CX/GO5MZoRTsL
         iGWg==
X-Gm-Message-State: AOAM532ljpjNADBA8JAqfNiFD8N/3lcqgkzRz6oDVm+brEPYAF6pewvo
        OLBYV145esWpLlAXrUwsxRs=
X-Google-Smtp-Source: ABdhPJyj9bkfYkl0HwhtAOZi7C6XnRWf2WVa8guY/L0Rm9FsMyVjFaNDl8D56tuZgY5jNaQRzfPv+Q==
X-Received: by 2002:aa7:9290:0:b029:18b:3686:6e48 with SMTP id j16-20020aa792900000b029018b36866e48mr258718pfa.47.1604531263538;
        Wed, 04 Nov 2020 15:07:43 -0800 (PST)
Received: from localhost ([2001:e42:102:1532:160:16:113:140])
        by smtp.gmail.com with ESMTPSA id d10sm3295457pgk.74.2020.11.04.15.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 15:07:43 -0800 (PST)
From:   Coiby Xu <coiby.xu@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-gpio@vger.kernel.org (open list:PIN CONTROL SUBSYSTEM),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 4/4] pinctrl: amd: remove debounce filter setting in irq type setting
Date:   Thu,  5 Nov 2020 07:07:03 +0800
Message-Id: <20201104230703.21466-5-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201104230703.21466-1-coiby.xu@gmail.com>
References: <20201104230703.21466-1-coiby.xu@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Debounce filter setting should be independent from irq type setting
because according to the ACPI specs, there are separate arguments for
specifying debounce timeout and irq type in GpioIo and GpioInt.

This will fix broken touchpads for Lenovo Legion-5 AMD gaming laptops
including 15ARH05 (R7000) and R7000P whose BIOS set the debounce timeout
to 124.8ms which led to the kernel receiving only ~7 HID reports per
second.

Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
BugLink: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1887190
Link: https://lore.kernel.org/linux-gpio/CAHp75VcwiGREBUJ0A06EEw-SyabqYsp%2Bdqs2DpSrhaY-2GVdAA%40mail.gmail.com/
Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 drivers/pinctrl/pinctrl-amd.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index e9b761c2b77a..2d4acf21117c 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -468,7 +468,6 @@ static int amd_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 		pin_reg &= ~BIT(LEVEL_TRIG_OFF);
 		pin_reg &= ~(ACTIVE_LEVEL_MASK << ACTIVE_LEVEL_OFF);
 		pin_reg |= ACTIVE_HIGH << ACTIVE_LEVEL_OFF;
-		pin_reg |= DB_TYPE_REMOVE_GLITCH << DB_CNTRL_OFF;
 		irq_set_handler_locked(d, handle_edge_irq);
 		break;
 
@@ -476,7 +475,6 @@ static int amd_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 		pin_reg &= ~BIT(LEVEL_TRIG_OFF);
 		pin_reg &= ~(ACTIVE_LEVEL_MASK << ACTIVE_LEVEL_OFF);
 		pin_reg |= ACTIVE_LOW << ACTIVE_LEVEL_OFF;
-		pin_reg |= DB_TYPE_REMOVE_GLITCH << DB_CNTRL_OFF;
 		irq_set_handler_locked(d, handle_edge_irq);
 		break;
 
@@ -484,7 +482,6 @@ static int amd_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 		pin_reg &= ~BIT(LEVEL_TRIG_OFF);
 		pin_reg &= ~(ACTIVE_LEVEL_MASK << ACTIVE_LEVEL_OFF);
 		pin_reg |= BOTH_EADGE << ACTIVE_LEVEL_OFF;
-		pin_reg |= DB_TYPE_REMOVE_GLITCH << DB_CNTRL_OFF;
 		irq_set_handler_locked(d, handle_edge_irq);
 		break;
 
@@ -492,8 +489,6 @@ static int amd_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 		pin_reg |= LEVEL_TRIGGER << LEVEL_TRIG_OFF;
 		pin_reg &= ~(ACTIVE_LEVEL_MASK << ACTIVE_LEVEL_OFF);
 		pin_reg |= ACTIVE_HIGH << ACTIVE_LEVEL_OFF;
-		pin_reg &= ~(DB_CNTRl_MASK << DB_CNTRL_OFF);
-		pin_reg |= DB_TYPE_PRESERVE_LOW_GLITCH << DB_CNTRL_OFF;
 		irq_set_handler_locked(d, handle_level_irq);
 		break;
 
@@ -501,8 +496,6 @@ static int amd_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 		pin_reg |= LEVEL_TRIGGER << LEVEL_TRIG_OFF;
 		pin_reg &= ~(ACTIVE_LEVEL_MASK << ACTIVE_LEVEL_OFF);
 		pin_reg |= ACTIVE_LOW << ACTIVE_LEVEL_OFF;
-		pin_reg &= ~(DB_CNTRl_MASK << DB_CNTRL_OFF);
-		pin_reg |= DB_TYPE_PRESERVE_HIGH_GLITCH << DB_CNTRL_OFF;
 		irq_set_handler_locked(d, handle_level_irq);
 		break;
 
-- 
2.28.0

