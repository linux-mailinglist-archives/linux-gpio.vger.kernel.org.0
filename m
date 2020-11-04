Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 740BD2A70F3
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Nov 2020 00:07:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732357AbgKDXHj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Nov 2020 18:07:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730651AbgKDXHj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Nov 2020 18:07:39 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A89DC0613CF;
        Wed,  4 Nov 2020 15:07:39 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id z3so3174279pfb.10;
        Wed, 04 Nov 2020 15:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qbryIOi0pB0nVeRJiEy5T5/Ulf4X8dW8rYH6oysQTR0=;
        b=VB/bCHaSpQMWB/n0mjfeI3xqN3+H2NyIJ8iaas5Mg/pVzIvzLBqwMef+Hp5OTSofeZ
         AXBTuTT+Z/SerBnaoSMouVExl6Oul93hBnX+3+Y2AaXDne+9MrdpxrMfpfDrAFrDEq/I
         2MJRom66pT3ByxZ7XCmrWDCH78REOqNAdPtSsfdd+YJkdVq2RrkKZOMYSbbU4yTzjE0A
         e3AippCQyTqBnpYgV5l73o8l5SLDfKZqGl0B8WBgqmUBSWZErnhkkVhT4G+rWJ1vRoqs
         +hIaJUChvV5YHCMB/oHHBYicQ3n5VHi40h8tJNYKUzjHcWr3BioI4ZVNJsDC5uCur9D3
         V54g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qbryIOi0pB0nVeRJiEy5T5/Ulf4X8dW8rYH6oysQTR0=;
        b=kc/31yH0f3mS7Y5Xcth9Jn6DSuWOhfr85VDH+BFtA/eaC8W547rFtSvk4f2pwzHW1u
         lWY1YvtGGbOhYvmt3GmX/jJxSkN6p1Q6aZ8PG3QjNmGPc7qUiC7hGBUfl2mdsRzwwAQ1
         ybW2S1vT8ZH0r55rulcg17dNECe9KJ/uI6PnuDVSqKxdUovUoHCDR3Rghpucs/IXaRkc
         NtIgH7nlnkAhCx/JbYlmLqbe7qjnK6yT1hQ6Ja3nAZYUPqrwteRpZEE+gu0w4JbNRQft
         i3i/N6yQ7W/Z+0Ai8GPB1kb/PqgYj4z/yQi92zsncayWwqwDCZ3XHRVGtxDa1WPsAIGj
         VvJw==
X-Gm-Message-State: AOAM5300D09sa5Yl9f6M2jpUsMIbmKT4BClDKYQXTO+1AA0o0K8IvQXr
        y3wancoxNdatokn5iioJjqLRezOmxt7hfw==
X-Google-Smtp-Source: ABdhPJwiVQVeJ2KHmkD9l9M6zO/xRmM0xpDWVMj80qxASsqkNDRgYArukgmxyqLvLrzf382JW7b68A==
X-Received: by 2002:a17:90b:a05:: with SMTP id gg5mr201012pjb.214.1604531258725;
        Wed, 04 Nov 2020 15:07:38 -0800 (PST)
Received: from localhost ([2001:e42:102:1532:160:16:113:140])
        by smtp.gmail.com with ESMTPSA id nv7sm3000894pjb.27.2020.11.04.15.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 15:07:38 -0800 (PST)
From:   Coiby Xu <coiby.xu@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org (open list:PIN CONTROL SUBSYSTEM),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 3/4] pinctrl: amd: print debounce filter info in debugfs
Date:   Thu,  5 Nov 2020 07:07:02 +0800
Message-Id: <20201104230703.21466-4-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201104230703.21466-1-coiby.xu@gmail.com>
References: <20201104230703.21466-1-coiby.xu@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Print the status of debounce filter as follows,
$ cat /sys/kernel/debug/gpio
pin129          interrupt is disabled| interrupt is masked| disable wakeup in S0i3 state| disable wakeup in S3 state|
 disable wakeup in S4/S5 state| input is high|   pull-up is disabled| Pull-down is disabled|   output is disabled| debouncing filter disabled|   0x50000
                                                                                                                   ^^^^^^^^^^^^^^^^^^^^^^^^^^
pin130          interrupt is disabled| interrupt is masked| disable wakeup in S0i3 state| disable wakeup in S3 state|
 disable wakeup in S4/S5 state| input is high|   pull-up is disabled| Pull-down is disabled|   output is disabled| debouncing filter (high) enabled| debouncing timeout is 124800 (us)| 0x503c8
                                                                                                                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 drivers/pinctrl/pinctrl-amd.c | 43 +++++++++++++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 4aea3e05e8c6..e9b761c2b77a 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -197,10 +197,16 @@ static int amd_gpio_set_config(struct gpio_chip *gc, unsigned offset,
 static void amd_gpio_dbg_show(struct seq_file *s, struct gpio_chip *gc)
 {
 	u32 pin_reg;
+	u32 db_cntrl;
 	unsigned long flags;
 	unsigned int bank, i, pin_num;
 	struct amd_gpio *gpio_dev = gpiochip_get_data(gc);

+	bool tmr_out_unit;
+	unsigned int time;
+	unsigned int unit;
+	bool tmr_large;
+
 	char *level_trig;
 	char *active_level;
 	char *interrupt_enable;
@@ -214,6 +220,8 @@ static void amd_gpio_dbg_show(struct seq_file *s, struct gpio_chip *gc)
 	char *pull_down_enable;
 	char *output_value;
 	char *output_enable;
+	char debounce_value[40];
+	char *debounce_enable;

 	for (bank = 0; bank < gpio_dev->hwbank_num; bank++) {
 		seq_printf(s, "GPIO bank%d\t", bank);
@@ -327,13 +335,44 @@ static void amd_gpio_dbg_show(struct seq_file *s, struct gpio_chip *gc)
 					pin_sts = "input is low|";
 			}

+			db_cntrl = (DB_CNTRl_MASK << DB_CNTRL_OFF) & pin_reg;
+			if (db_cntrl) {
+				tmr_out_unit = pin_reg & BIT(DB_TMR_OUT_UNIT_OFF);
+				tmr_large = pin_reg & BIT(DB_TMR_LARGE_OFF);
+				time = pin_reg & DB_TMR_OUT_MASK;
+				if (tmr_large) {
+					if (tmr_out_unit)
+						unit = 62500;
+					else
+						unit = 15625;
+				} else {
+					if (tmr_out_unit)
+						unit = 244;
+					else
+						unit = 61;
+				}
+				if ((DB_TYPE_REMOVE_GLITCH << DB_CNTRL_OFF) == db_cntrl)
+					debounce_enable = "debouncing filter (high and low) enabled|";
+				else if ((DB_TYPE_PRESERVE_LOW_GLITCH << DB_CNTRL_OFF) == db_cntrl)
+					debounce_enable = "debouncing filter (low) enabled|";
+				else
+					debounce_enable = "debouncing filter (high) enabled|";
+
+				snprintf(debounce_value, sizeof(debounce_value),
+					 "debouncing timeout is %u (us)|", time * unit);
+			} else {
+				debounce_enable = "debouncing filter disabled|";
+				snprintf(debounce_value, sizeof(debounce_value), " ");
+			}
+
 			seq_printf(s, "%s %s %s %s %s %s\n"
-				" %s %s %s %s %s %s %s 0x%x\n",
+				" %s %s %s %s %s %s %s %s %s 0x%x\n",
 				level_trig, active_level, interrupt_enable,
 				interrupt_mask, wake_cntrl0, wake_cntrl1,
 				wake_cntrl2, pin_sts, pull_up_sel,
 				pull_up_enable, pull_down_enable,
-				output_value, output_enable, pin_reg);
+				output_value, output_enable,
+				debounce_enable, debounce_value, pin_reg);
 		}
 	}
 }
--
2.28.0

