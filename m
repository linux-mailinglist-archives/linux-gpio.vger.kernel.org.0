Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 789B42990CB
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Oct 2020 16:16:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1783543AbgJZPQT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Oct 2020 11:16:19 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:44610 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1783542AbgJZPQS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Oct 2020 11:16:18 -0400
Received: by mail-pf1-f194.google.com with SMTP id 133so363852pfx.11;
        Mon, 26 Oct 2020 08:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/bvapBCKK/vVWkKSrIl+yYe3mbKBXvrpucUBeVkQhK4=;
        b=lWGtLbz3qmnloO+4a79zcN6mFwXD3xpPkSuo29ne1f4UoUH2A69wKEkmLHOd+bzx2f
         5fi7HZc+4XuH/m12kmXJBQb//SdH7HtKPPd9XZuQMHck/2r+xGeu2VwJXIEEOExEAOiC
         zppilGa4hEha7QOu79YuRDOdwUa5uCVI6AwsVlTm7DpfSwztx6EDC4F09EGRSDBuxZTb
         kROygw959FoxGaPbsOVQ6yPHG1LACd7k++WBT40ZVpiPd5k5QU+NmiVPQslko0j98X3F
         ToQxhFUrJMuU1tMv873nlQ7agTNMvayutqVYUMbV7PnDAfXODEP6cQBsLripggpUMBXS
         gDBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/bvapBCKK/vVWkKSrIl+yYe3mbKBXvrpucUBeVkQhK4=;
        b=bMVKAaOgBLf/9vaNDHdoJe2vuLOtSKtKC1W2WQmOm/GGqXJnqZpJRf1J93GgL8n2Y/
         mhkboBfk/SBsr4ZuKqmzQ61GDm9yHDbni3c0Nyw8XqqxjelyzYRDtzwZdsS1xu3ZGeXI
         xKUoOIBftgLyLItoYB96K4oxhB6wCYeBUgwGlnG0ACnWfK6cWVMLl+f653iHladr4qIF
         Pc/Zwacj9RpzsO4jvUAoZS+0b+Gmqp1WOPZTTzxtAQUg7A3U9A39gc0Ziuih4QMYm4ul
         a+IP9jD9amt7uqixhUzih2AwGHoSlOBJrYdjR/n5lSG3fpwoYDKuinYn5mYi4ciCDaQS
         ZL9w==
X-Gm-Message-State: AOAM531OYFLh2azcu9DlP/ockJpbUG1C1PjWBuLiM4fzuOC2yNN4NiA2
        4z6Ok7DSWBbF0Ra540Fp6fJQ8VcxPNZfF2gs
X-Google-Smtp-Source: ABdhPJzaPXW8Z88izKttCRA5jk6scgCZysqUYaP2pLvGXz3bC7so0APjO+OT7xaZuAxky5ODqY4CIg==
X-Received: by 2002:a65:5b4a:: with SMTP id y10mr8113462pgr.379.1603725376830;
        Mon, 26 Oct 2020 08:16:16 -0700 (PDT)
Received: from localhost ([2001:e42:102:1532:160:16:113:140])
        by smtp.gmail.com with ESMTPSA id c67sm12161969pfb.176.2020.10.26.08.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 08:16:15 -0700 (PDT)
From:   Coiby Xu <coiby.xu@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] pinctrl: amd: print debounce filter info in debugfs
Date:   Mon, 26 Oct 2020 23:16:00 +0800
Message-Id: <20201026151600.2703-1-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Print the status of debounce filter as follows,
$ cat /sys/kernel/debug/gpio
pin129          interrupt is disabled| interrupt is masked| disable wakeup in S0i3 state| disable wakeup in S3 state|
 disable wakeup in S4/S5 state| input is high|   pull-up is disabled| Pull-down is disabled|   output is disabled| debouncing filter disabled|   0x50000
pin130          interrupt is disabled| interrupt is masked| disable wakeup in S0i3 state| disable wakeup in S3 state|
 disable wakeup in S4/S5 state| input is high|   pull-up is disabled| Pull-down is disabled|   output is disabled| debouncing filter (high) enabled| debouncing timeout is 124800 (us)| 0x503c8
                                                                                                                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 drivers/pinctrl/pinctrl-amd.c | 43 +++++++++++++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 9a760f5cd7ed..77782d420967 100644
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
+				if (tmr_large) {
+					if (tmr_out_unit)
+						unit = 62500;
+					else
+						unit = 15600;
+				} else {
+					if (tmr_out_unit)
+						unit = 244;
+					else
+						unit = 61;
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
+				snprintf(debounce_value, 40, " ");
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

