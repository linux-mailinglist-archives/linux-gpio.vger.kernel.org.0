Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD9EC2A6904
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Nov 2020 17:04:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729257AbgKDQEx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Nov 2020 11:04:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726564AbgKDQEw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Nov 2020 11:04:52 -0500
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33539C0613D3;
        Wed,  4 Nov 2020 08:04:51 -0800 (PST)
Received: by mail-pl1-x642.google.com with SMTP id b19so10507374pld.0;
        Wed, 04 Nov 2020 08:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VqjCeWNGiMMMDgfCQ+LZpzOPzsK/BdUKeSAKsbo3Mb0=;
        b=kOXHXgXUOE75qVZxEVp6wAPzWSMdMEvUyLBaXeQgEhmMQV8Cug/HOHoT5OYKE+y5Yc
         eRxBc4lH3/+ywJxu8bTL4oRA3fwMPzxFvRcXK29ghaPE2QE2hd+T7KRFpeBTJwYKg9n4
         TJs5JoknQ7YGtsTeooODRtRIl2f80aYvdYRzQc651LtOZEVN4Jq/vaEfhBJgj3C7E0ev
         Grun1t9woax/VhyrFfYBVYZuQ6+HBdygpOy7gjJ24Lq/umfd1tu3DrrtWEoO74lr7004
         LWSaVI7KLveYA7R/BZKcem8i9eFDaHuwJZykV9O6svs9x3StQMv63l6REDzbVvwW84D5
         F76A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VqjCeWNGiMMMDgfCQ+LZpzOPzsK/BdUKeSAKsbo3Mb0=;
        b=hjqMnmqEmBtdPaxK4K+wni7VOJHSbyc5Xc62U+oMpndnFYhTuokMHJgTvJrSbt+iQN
         ymmCOsRPNQ1mDcIrRzuMME8WbGjVakiFu1CWz88fbo9we8VW34wlagokcGNTVPutqMC8
         eE+6k1OIrql0VX94SxEupzyo7Ge/bGg2HwSgmUYMmekLDcPoCH6LODUevHRFnmOdfQC1
         P/1mdtHXW6wCkquhHOf2KCwk17NnI7aX19qslf0UH3abaTaDA0KBzmDFVKAckBUXCe9j
         w/qWVN6YEEznDHJyxBXcVu2q6ppKqS6zn0b4NxvBLAd5mmvzln9NfaAqWeIGIGJHyeBh
         w+tQ==
X-Gm-Message-State: AOAM531JdjvCP/8ap/gWkVVmx/sWNG8NMqIp5DLRF1d0VHpKJLWjHzfs
        PHYAOBURgZ6CWFVpjlkGL7fju9xZExHQ5w==
X-Google-Smtp-Source: ABdhPJxJfMufwoYi597zMHexGywQCoo/uR9XuNlZ9x0z/E4ob9E9vKG6XYchH4Ub6zjlvegmr5bb8w==
X-Received: by 2002:a17:902:be0f:b029:d6:62a5:3b73 with SMTP id r15-20020a170902be0fb02900d662a53b73mr31244277pls.49.1604505890828;
        Wed, 04 Nov 2020 08:04:50 -0800 (PST)
Received: from localhost ([2001:e42:102:1532:160:16:113:140])
        by smtp.gmail.com with ESMTPSA id 12sm2817529pfh.88.2020.11.04.08.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 08:04:50 -0800 (PST)
From:   Coiby Xu <coiby.xu@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org (open list:PIN CONTROL SUBSYSTEM),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 3/4] pinctrl: amd: print debounce filter info in debugfs
Date:   Thu,  5 Nov 2020 00:03:43 +0800
Message-Id: <20201104160344.4929-4-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201104160344.4929-1-coiby.xu@gmail.com>
References: <20201104160344.4929-1-coiby.xu@gmail.com>
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
index 4aea3e05e8c6..524d55546b61 100644
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

