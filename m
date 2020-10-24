Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A336297B06
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Oct 2020 08:16:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1759724AbgJXGQP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 24 Oct 2020 02:16:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759723AbgJXGQO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 24 Oct 2020 02:16:14 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9C0CC0613CE;
        Fri, 23 Oct 2020 23:16:14 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id m3so366718pjf.4;
        Fri, 23 Oct 2020 23:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rQKuIrhajdM/10a8OKzF5rjHtpu9cB2pRMPlCvPhSFw=;
        b=ACU3kq4icOxCnszUZfoJ/x6T/tOZiX+wa46HDkxA/079mcMNlq2Z8qorlwc/5Jj6OM
         9ebYyGZbF8Ax58LPTtdO89pO047G1S8rgoLI6H5wbhcNR4SMLKpg4q16Ym0RQNcQ+B/V
         LwKl2ncQ1PvEjteYBHZStfyTZg7tU33Pd6dk7UNqMSoNd/YSEDFjSDBHXia+45w9NR3l
         6+x7DmvEZqL5HLObhtnuhuc4TFbro0PBOSk4sjbLjPrLLXaCewD76XzqaZTRP69se8vc
         JLVODYxpgmRvLYqxaIL1uzbi21s1Ij4Kj701h07nTIaiEQ8O4cq+FJR8ntbwhZWWjhKo
         bHRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rQKuIrhajdM/10a8OKzF5rjHtpu9cB2pRMPlCvPhSFw=;
        b=d5L6A6SE4DowsKNXTfMmpPKw6oSURqkM8eoYbCkdgyvTpMJAwPBqlAcDByP1ccmr5R
         P8X3Exzm7uDf0LS9kXPIvzzqUOm+qxCozlHenZA9w0iKkXOxLERGfvFjx57jyh9+RZhJ
         Z5KEmTa+FQRHKIWekdG8X3zdzKlzzcpvvRn8o1mW7zlgnk920blP1Rd1jK1PqTCF4Js3
         7N705OPiKZaGuLlRsXz8l9tR16GdWy/MwjnvrkWQhMpyytjBkbgDxgxqU5mgR7fFOdyR
         W7tEq9cKqWHzXwONiAxjdp25R9xjPqAiVlf+Gfkk52HN3NECyIdH3KuiNayTHHeSmpWu
         ZkVA==
X-Gm-Message-State: AOAM5312Hts6Kc4/fwQKbA8bkzFXqvmxlouDLEJwWcPsv3knnNUPofat
        hNCCfmkxBYtJDS7OoINq7WQH7ppVWm9qtw==
X-Google-Smtp-Source: ABdhPJx7tY0DjozZAots/KanF8W7hTzrwx2mkEOTr51dH6WhgR7f4HMxPZRdeKUt9648mtmrtizLcg==
X-Received: by 2002:a17:902:9890:b029:d2:2f2a:584e with SMTP id s16-20020a1709029890b02900d22f2a584emr3044210plp.29.1603520173600;
        Fri, 23 Oct 2020 23:16:13 -0700 (PDT)
Received: from localhost ([2001:e42:102:1532:160:16:113:140])
        by smtp.gmail.com with ESMTPSA id nm11sm4927910pjb.24.2020.10.23.23.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 23:16:12 -0700 (PDT)
From:   Coiby Xu <coiby.xu@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] pinctrl: amd: print debounce filter info in debugfs
Date:   Sat, 24 Oct 2020 14:15:52 +0800
Message-Id: <20201024061552.4497-1-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Print out the status of debounce filter as follows,
$ cat /sys/kernel/debug/gpio|grep pin130
pin130          interrupt is disabled| interrupt is masked| disable wakeup in S0i3 state| disable wakeup in S3 state|
 disable wakeup in S4/S5 state| input is high|   pull-up is disabled| Pull-down is disabled|   output is disabled| debouncing filter (high) enabled| debouncing timeout is 124800 (us)| 0x503c8

Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 drivers/pinctrl/pinctrl-amd.c | 43 +++++++++++++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 9a760f5cd7ed..9897f86b1bec 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -197,10 +197,16 @@ static int amd_gpio_set_config(struct gpio_chip *gc, unsigned offset,
 static void amd_gpio_dbg_show(struct seq_file *s, struct gpio_chip *gc)
 {
 	u32 pin_reg;
+	u32 reg_db_mask;
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
 
+			reg_db_mask = (DB_CNTRl_MASK << DB_CNTRL_OFF) & pin_reg;
+			if (reg_db_mask & pin_reg) {
+				tmr_out_unit = pin_reg & BIT(DB_TMR_OUT_UNIT_OFF);
+				tmr_large = pin_reg & BIT(DB_TMR_LARGE_OFF);
+				time = pin_reg & DB_TMR_OUT_MASK;
+				if (!tmr_large) {
+					if (!tmr_out_unit)
+						unit = 61;
+					else
+						unit = 244;
+				} else {
+					if (!tmr_out_unit)
+						unit = 15600;
+					else
+						unit = 62500;
+				}
+				if ((DB_TYPE_REMOVE_GLITCH << DB_CNTRL_OFF) == reg_db_mask)
+					debounce_enable = "debouncing filter (high and low) enabled|";
+				else if ((DB_TYPE_PRESERVE_LOW_GLITCH << DB_CNTRL_OFF) == reg_db_mask)
+					debounce_enable = "debouncing filter (low) enabled|";
+				else
+					debounce_enable = "debouncing filter (high) enabled|";
+
+				snprintf(debounce_value, 40,
+					 "debouncing timeout is %u (us)|", time * unit);
+			} else {
+				debounce_enable = "debouncing filter disabled|";
+				snprintf(debounce_value, 30, " ");
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

