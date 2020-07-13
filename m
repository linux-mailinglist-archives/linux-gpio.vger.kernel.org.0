Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E7EA21D909
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2020 16:50:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730216AbgGMOu2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Jul 2020 10:50:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730205AbgGMOt5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jul 2020 10:49:57 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4214FC061794
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2020 07:49:57 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id a6so16866602wrm.4
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2020 07:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MGVkPRp/+I1joXVdv6caEP06X1PF0rNG8kbo7/M1JBk=;
        b=QiHDfDTGlAj/YS7C4u7kOc9JwEFDw3G0oGclidDhkGG3zqi1U3reU5/sFhI47sYphg
         HeiZUEn/8P25l8ozcJNgk5z6bsdiI5c07DjWLBg3+bY/4kLVz2Q32r9LNafPsNTobcQS
         qkH5Tm1h8TN6RDaCWLJT4g0EX6g+c1CeY4vDz8SsfIPEXVAwMrje1zKdA1KWa5H882OL
         SZ1FPlR19YfURzt9hxk5H7HI8ywDaJ31gFsUOPmNz7070R9N6rjz0rom3oYN//QTvb+l
         YmXn4Dpd0zghrInn3FZCpnIZl93yJoeIcYXPsxF9WdG+1WSYAZxAXJm+ILAFRi3bECqk
         v7Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MGVkPRp/+I1joXVdv6caEP06X1PF0rNG8kbo7/M1JBk=;
        b=KD9FakPrxGTl86x2SUa4z53nr1cSv7ka2GM20T8LjnYeGUyHGNhuFUHcn9Wg8lgpLy
         U1tB+3k/rwRyPt99oE1+x4gPRYnzzz6PxtdudRfHcvBboAPn7SpkZwqr/wsNLI7dUt+E
         HCSytM4Ybj9bMfb7vsoILUH1okSsUmjW4/kM1CqyRWFPuKj/g3WkD+umNqQYbKPbmV9y
         CH33EV1K6SuDfxRLdVmgHLPFpSZgjcAJFvoXUWmeY5I8Amg/BExdSKMmS1wUp+5mTbbq
         6eNRFP49u64/UxtyLdi8WqISb8NzsoNcNUiGLgHZ8nWCIKtC0m/9wewaT9O22f6Ja0lW
         gteg==
X-Gm-Message-State: AOAM532YIktgJJvgS3yZhSIIjeqyoaso3732HHCG6uilV6UgZEa4vSV5
        2N86eT4jfIF0/i0mF95kPpu2JA==
X-Google-Smtp-Source: ABdhPJx9Drg7tITXelXrTGkjdiA4cztDP4a+w06kMhyQ79IF54jdT4nucp1hYkuJYWkR3yVfSNeQhA==
X-Received: by 2002:a5d:6a90:: with SMTP id s16mr78126603wru.8.1594651796017;
        Mon, 13 Jul 2020 07:49:56 -0700 (PDT)
Received: from localhost.localdomain ([2.31.163.6])
        by smtp.gmail.com with ESMTPSA id o29sm26207756wra.5.2020.07.13.07.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 07:49:55 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     linus.walleij@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        linux-omap@vger.kernel.org
Subject: [PATCH 21/25] pinctrl: pinctrl-single: Fix struct/function documentation blocks
Date:   Mon, 13 Jul 2020 15:49:26 +0100
Message-Id: <20200713144930.1034632-22-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200713144930.1034632-1-lee.jones@linaro.org>
References: <20200713144930.1034632-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add some missing attributes/parameter descriptions, remove other
superfluous ones, add struct header titles and fix misspellings.

Fixes the following W=1 kernel build warning(s):

 drivers/pinctrl/pinctrl-single.c:50: warning: Function parameter or member 'mask' not described in 'pcs_func_vals'
 drivers/pinctrl/pinctrl-single.c:97: warning: Function parameter or member 'conf' not described in 'pcs_function'
 drivers/pinctrl/pinctrl-single.c:97: warning: Function parameter or member 'nconfs' not described in 'pcs_function'
 drivers/pinctrl/pinctrl-single.c:659: warning: Function parameter or member 'pin_pos' not described in 'pcs_add_pin'
 drivers/pinctrl/pinctrl-single.c:985: warning: Excess function parameter 'pctldev' description in 'pcs_parse_one_pinctrl_entry'
 drivers/pinctrl/pinctrl-single.c:1357: warning: Cannot understand  * @reg:        virtual address of interrupt register
 drivers/pinctrl/pinctrl-single.c:1377: warning: Function parameter or member 'pcs_soc' not described in 'pcs_irq_set'
 drivers/pinctrl/pinctrl-single.c:1377: warning: Function parameter or member 'irq' not described in 'pcs_irq_set'
 drivers/pinctrl/pinctrl-single.c:1377: warning: Function parameter or member 'enable' not described in 'pcs_irq_set'
 drivers/pinctrl/pinctrl-single.c:1458: warning: Function parameter or member 'pcs_soc' not described in 'pcs_irq_handle'
 drivers/pinctrl/pinctrl-single.c:1458: warning: Excess function parameter 'pcs_irq' description in 'pcs_irq_handle'
 drivers/pinctrl/pinctrl-single.c:1506: warning: Excess function parameter 'irq' description in 'pcs_irq_chain_handler'

Cc: Tony Lindgren <tony@atomide.com>
Cc: Haojian Zhuang <haojian.zhuang@linaro.org>
Cc: linux-omap@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/pinctrl/pinctrl-single.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index e6d1cf25782ce..542578d0bda2d 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -42,6 +42,7 @@
  * struct pcs_func_vals - mux function register offset and value pair
  * @reg:	register virtual address
  * @val:	register value
+ * @mask:	mask
  */
 struct pcs_func_vals {
 	void __iomem *reg;
@@ -83,6 +84,8 @@ struct pcs_conf_type {
  * @nvals:	number of entries in vals array
  * @pgnames:	array of pingroup names the function uses
  * @npgnames:	number of pingroup names the function uses
+ * @conf:	array of pin configurations
+ * @nconfs:	number of pin configurations available
  * @node:	list node
  */
 struct pcs_function {
@@ -653,6 +656,7 @@ static const struct pinconf_ops pcs_pinconf_ops = {
  * pcs_add_pin() - add a pin to the static per controller pin array
  * @pcs: pcs driver instance
  * @offset: register offset from base
+ * @pin_pos: unused
  */
 static int pcs_add_pin(struct pcs_device *pcs, unsigned offset,
 		unsigned pin_pos)
@@ -959,7 +963,6 @@ static int pcs_parse_pinconf(struct pcs_device *pcs, struct device_node *np,
 
 /**
  * pcs_parse_one_pinctrl_entry() - parses a device tree mux entry
- * @pctldev: pin controller device
  * @pcs: pinctrl driver instance
  * @np: device node of the mux entry
  * @map: map entry
@@ -1353,7 +1356,9 @@ static int pcs_add_gpio_func(struct device_node *node, struct pcs_device *pcs)
 	}
 	return ret;
 }
+
 /**
+ * struct pcs_interrupt
  * @reg:	virtual address of interrupt register
  * @hwirq:	hardware irq number
  * @irq:	virtual irq number
@@ -1368,6 +1373,9 @@ struct pcs_interrupt {
 
 /**
  * pcs_irq_set() - enables or disables an interrupt
+ * @pcs_soc: SoC specific settings
+ * @irq: interrupt
+ * @enable: enable or disable the interrupt
  *
  * Note that this currently assumes one interrupt per pinctrl
  * register that is typically used for wake-up events.
@@ -1448,7 +1456,7 @@ static int pcs_irq_set_wake(struct irq_data *d, unsigned int state)
 
 /**
  * pcs_irq_handle() - common interrupt handler
- * @pcs_irq: interrupt data
+ * @pcs_soc: SoC specific settings
  *
  * Note that this currently assumes we have one interrupt bit per
  * mux register. This interrupt is typically used for wake-up events.
@@ -1496,7 +1504,6 @@ static irqreturn_t pcs_irq_handler(int irq, void *d)
 
 /**
  * pcs_irq_handle() - handler for the dedicated chained interrupt case
- * @irq: interrupt
  * @desc: interrupt descriptor
  *
  * Use this if you have a separate interrupt for each
-- 
2.25.1

