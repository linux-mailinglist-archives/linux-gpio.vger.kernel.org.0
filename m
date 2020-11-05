Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FCA42A8A93
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Nov 2020 00:19:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732414AbgKEXTs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Nov 2020 18:19:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732527AbgKEXTr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Nov 2020 18:19:47 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97995C0613CF;
        Thu,  5 Nov 2020 15:19:47 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id t14so2459889pgg.1;
        Thu, 05 Nov 2020 15:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sxq6iS7z4TMJrVBzCyMOFVUa+T3+DeO/GNTrIU6LLsY=;
        b=k+pgNX0qsdFoufT/Pl2/0UGIEFkbKnyX9DaoDHWa4eqDo2hX44fuhEGVlhNpC1Ovgg
         t8ffv8Vey8+t2NYAZPvP72Wij9tYenx649q1PZ1AaEt/47QHaI7dEuEOiHLwQ2poF1Ez
         prrd9c4k6Mhw6ZjLIkmV7ANsC3se4GKnRbdAGHhmumsvyAreVa/IufeCHfsj57uZrznu
         6OVBdtP1pgHfSpvbNPPTeSufmUS9e+iXVrF48AI208sbkvQCunp2WiaWmFPPNXb1B/IH
         Z941Qk8WxnM2nFBmO91oIffj3bmknMxdDE6ipeSL6bi9L0bhrVPSTjpMEaBLiH/Vaesp
         Jkrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sxq6iS7z4TMJrVBzCyMOFVUa+T3+DeO/GNTrIU6LLsY=;
        b=bvB6wmZMbRDn3o1FYyyOZYyFZ3doLazro+vIVphHE++fN6vLPvRZ76QHD/isZZJhAf
         U0zCpjaf4CfJUMBQTYY4V4K13j3Bd4Zb8O8EFMRJah/LwqePIyXySgE+PVlY+vQMmNvp
         Sjgz+ePbj13jl7IZhCj/ugB4tEzr3krMiqOyP3u5YxeMcLzwRPUw8YQavFPfqUunLt3/
         3LjVZedkVxlU1qpYD+Mia4kuCmWSJto8ywVJDg65116hNVOx8w3qoVz+HoXpZtd3ZGVj
         ogcmMuoFxjc4giqdWnKeyUUUEaO1n8sZ5ItOxvNrSpv03fVDiTSDWrArG9AhaxnXsmiG
         bGPQ==
X-Gm-Message-State: AOAM530ZlLNiB2yA9Q02ByM+DCvLzemaSnJjBAocY/kQaekcc4LomcwA
        tC1Rxpt3fYQSB8SoLLT232w=
X-Google-Smtp-Source: ABdhPJzxmYcu+EKr6p0fk2axsk6eWQmNg9l2ZKcsfR8AykkidZs6kr8WF9+n1qwVAMAaUS72F37MTA==
X-Received: by 2002:a17:90b:1b43:: with SMTP id nv3mr5054026pjb.67.1604618387186;
        Thu, 05 Nov 2020 15:19:47 -0800 (PST)
Received: from localhost ([160.16.113.140])
        by smtp.gmail.com with ESMTPSA id d4sm3397400pjj.45.2020.11.05.15.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 15:19:46 -0800 (PST)
From:   Coiby Xu <coiby.xu@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 3/4] pinctrl: amd: print debounce filter info in debugfs
Date:   Fri,  6 Nov 2020 07:19:11 +0800
Message-Id: <20201105231912.69527-4-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201105231912.69527-1-coiby.xu@gmail.com>
References: <20201105231912.69527-1-coiby.xu@gmail.com>
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

