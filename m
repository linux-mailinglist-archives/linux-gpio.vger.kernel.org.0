Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EEA823DD23
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Aug 2020 19:03:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729800AbgHFRDq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Aug 2020 13:03:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728840AbgHFRC7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Aug 2020 13:02:59 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EC97C00214D
        for <linux-gpio@vger.kernel.org>; Thu,  6 Aug 2020 08:53:29 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id l1so50078161ioh.5
        for <linux-gpio@vger.kernel.org>; Thu, 06 Aug 2020 08:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=AUHb4o3FG7jDjhkHAAXlsGZzmC8CpNOIF9zSlTlNlWU=;
        b=XD61QKcB0oVs+FiwplnIb494FO5wGPoFvNCvLzlWClKlCXSh43tzAF3IXTbD4TwPgE
         ByuTlNI+4eQDlRVskrx9UB/TqVifibJjz7I9s08keoQ+aHXHFmPh0VEDmcVMQ0EBCJeJ
         KlJyeDbuuFxZ7tMwEgMGi5vVS07ZvJMW8hxF7eN6iN67KmPz9soKagPq1VRpaMs9lxiU
         v/03dRG0TyEtjEI+nMSRGgjL1gsGXRCGdKEt+Lhi4eb227aoMuJs7JF2x24BRyt3IWjs
         IC36Q3Tlma70xuDtcn24f/UFVr10U7q+k2lm+gBGrWvTogVpSACN8me35nbDbPbA5rJb
         ZO1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=AUHb4o3FG7jDjhkHAAXlsGZzmC8CpNOIF9zSlTlNlWU=;
        b=HPBRZSzusQFlaz0WNU82f+0JRCxU/U/I+4iVUu8IqkMPMiIsG8QeA2scEe1C0/gPHw
         3fB9MwwzyQ6EifAGNH4IpdeZ+ez9mI+lvFqKoEdl+i1XMW19/0frg7uDNYRXQVqA87J/
         MzW1j0JIHU50IsvXEBabYAHL3b+sXcnaUNuWDALQ+QB3eWFNbPA7a8pZmhdL+CcHE6H3
         qfwlKG7aRSlz6YaGUdqnbp9yYjE+TEDy7BI+FH05tDJYoBzXJWRmdFCU4L0bgpHzBxT3
         KYzJlzaNcj5aKMBudd6ppTcnHq2XBMqSgKDc7KyVNjF7JDeMbVAlXcSL6YxEwD6D18mB
         9o4Q==
X-Gm-Message-State: AOAM533rkZ6u7RhbmkGg48hlhxBqRBmqghlrAQN1HyyQhEdciTDhcLlG
        mh4DRRVVsIL9ldQhoSQ7q0E=
X-Google-Smtp-Source: ABdhPJx/inlSTBTlukUZuw2E0X0Smymn1kh8BePbPoJF9g0W285AgDaBIFabpstXObisLZjH05dWgw==
X-Received: by 2002:a05:6638:2391:: with SMTP id q17mr12604244jat.31.1596729208443;
        Thu, 06 Aug 2020 08:53:28 -0700 (PDT)
Received: from ola-jn9phv2.ad.garmin.com ([204.77.163.55])
        by smtp.gmail.com with ESMTPSA id p18sm3888434iog.1.2020.08.06.08.53.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Aug 2020 08:53:27 -0700 (PDT)
Date:   Thu, 6 Aug 2020 10:53:25 -0500
From:   Andrew Halaney <ajhalaney@gmail.com>
To:     linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org
Subject: [PATCH] pinctrl: nomadik: Fix pull direction debug info
Message-ID: <20200806155322.GA25523@ola-jn9phv2.ad.garmin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The nomadik pinctrl hardware doesn't have any way to
determine if the active pull is up or down. Reading
the bit currently used to report if the pull is up/down
indicates if the gpio input is reading high or low, it
doesn't reflect the pull state.

For this reason change the output from "pull up"/"pull down" to
"pull enabled". This avoids confusing developers who were using
the output to determine what the pull state is.

Signed-off-by: Andrew Halaney <ajhalaney@gmail.com>
---
 drivers/pinctrl/nomadik/pinctrl-nomadik.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik.c b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
index ba25c4654391..657e35a75d84 100644
--- a/drivers/pinctrl/nomadik/pinctrl-nomadik.c
+++ b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
@@ -931,11 +931,6 @@ static void nmk_gpio_dbg_show_one(struct seq_file *s,
 		[NMK_GPIO_ALT_C+3]	= "altC3",
 		[NMK_GPIO_ALT_C+4]	= "altC4",
 	};
-	const char *pulls[] = {
-		"none     ",
-		"pull down",
-		"pull up  ",
-	};
 
 	clk_enable(nmk_chip->clk);
 	is_out = !!(readl(nmk_chip->addr + NMK_GPIO_DIR) & BIT(offset));
@@ -946,7 +941,7 @@ static void nmk_gpio_dbg_show_one(struct seq_file *s,
 		mode = nmk_prcm_gpiocr_get_mode(pctldev, gpio);
 
 	if (is_out) {
-		seq_printf(s, " gpio-%-3d (%-20.20s) out %s        %s",
+		seq_printf(s, " gpio-%-3d (%-20.20s) out %s           %s",
 			   gpio,
 			   label ?: "(none)",
 			   data_out ? "hi" : "lo",
@@ -954,11 +949,12 @@ static void nmk_gpio_dbg_show_one(struct seq_file *s,
 	} else {
 		int irq = chip->to_irq(chip, offset);
 		struct irq_desc	*desc = irq_to_desc(irq);
-		int pullidx = 0;
+		const int pullidx = pull ? 1 : 0;
 		int val;
-
-		if (pull)
-			pullidx = data_out ? 2 : 1;
+		static const char * const pulls[] = {
+			"none        ",
+			"pull enabled",
+		};
 
 		seq_printf(s, " gpio-%-3d (%-20.20s) in  %s %s",
 			   gpio,
-- 
2.24.1

