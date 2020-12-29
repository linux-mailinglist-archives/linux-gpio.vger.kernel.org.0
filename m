Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D8402E73FB
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Dec 2020 21:49:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726214AbgL2UsD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Dec 2020 15:48:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726126AbgL2UsD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Dec 2020 15:48:03 -0500
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0122BC061574;
        Tue, 29 Dec 2020 12:47:23 -0800 (PST)
Received: by mail-qv1-xf2c.google.com with SMTP id h16so6882418qvu.8;
        Tue, 29 Dec 2020 12:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y+rG0GxaF7x1wXd8TaaHi/8Xfv1oonAYxPZa52+iv1g=;
        b=VbPKpHSd6tZDH2zm47wqbko1A0NgXSGNZkyRuWT0E2sm0HTfdFGyHB/RCpWIrj7w6K
         6n3mAJ2YuIkUF8tc/Vwb7YU3jzqAvQ2K6gMG6pw9rwMinOmto/FfSwtx3dEuJVqwnIJK
         nJ0oxhLGzqgHFkd/VxDZ25QH9kktVZZZG2zzfsYFgUC3h3471N3WWeDrlbOJrLxhFyKb
         DB4DGheTESkWASZV2gKyaTv9HKFUbvDmwZo1pGfdaxr6PaTv8s8/Fem2m2YLZt6RMK7v
         BthRbKXKTbOpr1mRPdPglD+3dbyVjIDJgve7+rr+6hEi2O4dHkip7cTrYSKDpbCTN/1h
         siuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y+rG0GxaF7x1wXd8TaaHi/8Xfv1oonAYxPZa52+iv1g=;
        b=t7rWJhUuud2TATO+kc5vRrFDczRk2Ntxos8k4+MeCr9FBx3+MqTv4wGrncumg9At3x
         z2omKgq/Olmhg68sS9ShJ/oS4zr30Vmequw9TmBLQy0riIvZ5x21BsMjbDdylVN3Df8F
         PCUWgtc+gw9bkKgRd3Tdkfb9W86VImd1lplqnUVAPTqXgIx++FVqbbb/nSQRcb3Vks9l
         7NghPHe7uLKICLtWBdth6FPzK1s2j0C5fLXAH3eUUTuG3UyAeEi3cJwRn+eQ3aGyvOzz
         rfxMKgyw+tAUg3sk3wmN8h/m7blTlhSgybSvFAWKOMGDQQargTvr7dC88pr6hl/PgUcL
         NFnA==
X-Gm-Message-State: AOAM5307ycM5qk8CLyaleJCeTDvFpcNsNWPPtyDG7C/NEnS5RBwFa1mY
        IefjigR5c05QvUrH8fITMcU=
X-Google-Smtp-Source: ABdhPJx/7QCz1uzdmG7N+yZpMXQZ01RrfD1TOA7M0mU/tmv2rVqr45+D6n3cQ9hHWlePDfPWlfO3pA==
X-Received: by 2002:a0c:f690:: with SMTP id p16mr5946583qvn.58.1609274842134;
        Tue, 29 Dec 2020 12:47:22 -0800 (PST)
Received: from localhost.localdomain ([2604:1380:45f1:1d00::1])
        by smtp.gmail.com with ESMTPSA id w8sm27667541qts.50.2020.12.29.12.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Dec 2020 12:47:21 -0800 (PST)
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        Nathan Chancellor <natechancellor@gmail.com>
Subject: [PATCH] pinctrl: nomadik: Remove unused variable in nmk_gpio_dbg_show_one
Date:   Tue, 29 Dec 2020 13:47:10 -0700
Message-Id: <20201229204710.1129033-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Clang warns:

drivers/pinctrl/nomadik/pinctrl-nomadik.c:952:8: warning: unused
variable 'wake' [-Wunused-variable]
                bool wake;
                     ^
1 warning generated.

There were two wake declarations added to nmk_gpio_dbg_show_one when
converting it to use irq_has_action but only one is used within its
scope. Remove the unused one so there is no more warning.

Fixes: f3925032d7fd ("pinctrl: nomadik: Use irq_has_action()")
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 drivers/pinctrl/nomadik/pinctrl-nomadik.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik.c b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
index d4ea10803fd9..abfe11c7b49f 100644
--- a/drivers/pinctrl/nomadik/pinctrl-nomadik.c
+++ b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
@@ -949,7 +949,6 @@ static void nmk_gpio_dbg_show_one(struct seq_file *s,
 	} else {
 		int irq = chip->to_irq(chip, offset);
 		const int pullidx = pull ? 1 : 0;
-		bool wake;
 		int val;
 		static const char * const pulls[] = {
 			"none        ",

base-commit: 5c8fe583cce542aa0b84adc939ce85293de36e5e
-- 
2.30.0

