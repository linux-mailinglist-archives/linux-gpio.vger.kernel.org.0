Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E73012D6EFE
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Dec 2020 05:08:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390734AbgLKEHl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Dec 2020 23:07:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726253AbgLKEHK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2020 23:07:10 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FBC7C0613CF;
        Thu, 10 Dec 2020 20:06:30 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id p4so6199178pfg.0;
        Thu, 10 Dec 2020 20:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=D6/ckgGugIV7LFa3arGgfp10r3LChIaS58wHVL76bAY=;
        b=Y4BxYDGdQ3no0rdwnakyqu0CyP/SmNpTEIgyuJHzkvx91rL8kYvim+vqpTDOgyrbsC
         ALlMaeY58SC0tn7H/6IR/RjUSdrUNN4OU3rYCLS6COPo90QpZGWbNyCRk1DVeJWUxvSN
         ETCLxwVp5I8hqiLZTfn6EIVHQvCCwWagiAL7BFVF2rA7IOugXCmnZ+poa17G+LynIv5u
         iPZKeB6cGRMxiJfoMCs5xfhwgRFk3INBpnywCJpIrG6vf6w8ivfM+1vGvq5N3drKPJ/W
         qrm0ZCJBK3Vln3HP1sZFx0h/VVywo3pVifVKnSOmWdN4CtJ5Dm6Bs33nc1MfnSLsXy2Z
         Pizg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=D6/ckgGugIV7LFa3arGgfp10r3LChIaS58wHVL76bAY=;
        b=CjnWtHLiTyjiH6KPhbxHKBX6pagMSgd4aacjTZ+9hHWWaq8Peblhrcj0HikDUP6bp/
         NzVc9VszlOTewC/jMAEXoGeHeqzAgAIEz411waawgjg687GOzsmdwXK8pCGJKcv/7o++
         8YwVCUFlApCUPxuvDX97N1cw5HFsjFKvB5Kay91ZoBlTWnSPuB5fB4j0zVtxYZ4l29Oe
         vfSA7/TYf40Lcx2xtsh7xHSP9UGLsnKnKiM1k+lCIe/UVNN9Q7gTNBPE2+Dup7nup/GN
         Fq+Kpe1j8iIgFxpJEvkKxrXXpH3pr7LceXVvNID78sWNDUZ9QBQ14mRlUrhQ/rltGSs9
         CUnQ==
X-Gm-Message-State: AOAM531XVy946dZT80uJcEWoIV+bP5aIjiOfifDwVdwp1LQNdrC1vstw
        NHSrspXpPNLe7LrBQZBmChI=
X-Google-Smtp-Source: ABdhPJyksAscqyz83BeQ6+z+IQTNycRKWSmp44LwR27BgybVkVod+3ulayEar7JCdffvySDabD8Mew==
X-Received: by 2002:a63:5466:: with SMTP id e38mr9609894pgm.242.1607659590125;
        Thu, 10 Dec 2020 20:06:30 -0800 (PST)
Received: from localhost.localdomain ([203.205.141.39])
        by smtp.gmail.com with ESMTPSA id m26sm8181315pfo.123.2020.12.10.20.06.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Dec 2020 20:06:29 -0800 (PST)
From:   chenlei0x@gmail.com
X-Google-Original-From: lennychen@tencent.com
To:     chenlei0x@gmail.com, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Lei Chen <lennychen@tencent.com>
Subject: [PATCH] driver: pinctrl: fix unused variable warning
Date:   Fri, 11 Dec 2020 12:06:21 +0800
Message-Id: <1607659581-15764-1-git-send-email-lennychen@tencent.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Lei Chen <lennychen@tencent.com>

In pinctrl_pins_show, range, gpio_num and chip variables are not used if
CONFIG_GPIOLIB is not defined. Use this macro to wrap them.

Signed-off-by: Lei Chen <lennychen@tencent.com>
---
 drivers/pinctrl/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 3663d87..9fc4433 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1602,9 +1602,11 @@ static int pinctrl_pins_show(struct seq_file *s, void *what)
 	struct pinctrl_dev *pctldev = s->private;
 	const struct pinctrl_ops *ops = pctldev->desc->pctlops;
 	unsigned i, pin;
+#ifdef CONFIG_GPIOLIB
 	struct pinctrl_gpio_range *range;
 	unsigned int gpio_num;
 	struct gpio_chip *chip;
+#endif
 
 	seq_printf(s, "registered pins: %d\n", pctldev->desc->npins);
 
-- 
1.8.3.1

