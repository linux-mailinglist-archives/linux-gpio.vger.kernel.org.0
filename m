Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF6ED2C189D
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Nov 2020 23:44:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731237AbgKWWlC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Nov 2020 17:41:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730558AbgKWWlB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Nov 2020 17:41:01 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9814CC0613CF;
        Mon, 23 Nov 2020 14:41:01 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id f17so7082971pge.6;
        Mon, 23 Nov 2020 14:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :content-transfer-encoding;
        bh=klkgzjgfmJINdSFUpH5xMPShhHFpqLaKwqqvdz16jMA=;
        b=qCB8I+EjW5CVtXeRxXHgJUiMzJtzER5ujZ5KGKRWXb7Qp79Q7dXZ2b6qxmxMUsl4LL
         pkOQS5xnC2UO5n5UqnyS/VolF4AjKHYH8mA1kLED9rra3eJVKzYNslSU+YECoYxTCs0L
         j/LDk9rTENMlb4SVW4vdqi+H8bc4P14FozNPcOr/FYLDJ7K5sA5uAWnTTrn1k7uc3W4B
         KMiZKGnjglDaff9IK688XdYme4141zIl942h82fx7Ydk15ylWU/TD+HnY6OdOrlyi+zb
         CM2WrkjatAxf/BKTZ6yoIjXTGZHfVUtGu5yfF9FDObJZv2Z2EbHK7OXTm4eNww1BMdVF
         JOfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding;
        bh=klkgzjgfmJINdSFUpH5xMPShhHFpqLaKwqqvdz16jMA=;
        b=qWGnt8pR2NgYtN6jjXNnRbTO+mGrfQW2OV8fcduA1x06sIMqvx0mqqNm2o8yjlmFt4
         YMuFhmlLcrYM6ej+1waHoAqCh0bNtiI4ZTSIzjQApyO+htSzCNTU/kxqrgJdpmNfGp/R
         3brUOS6a+HMZP66o3GuWWLQtP+m2PjuUAYwJPu7iKQ6Elk2fRrkSapbXfqubMRq6PtHi
         mRRE4ICQZUXACqZBubKyjaemjI0y6xNWZF2/kk4eUBCYI1Dhlxw9gtRRzX2Ril4Q7HdQ
         oG6gTTJTXo4Bpx4enByxNw2algRlY/WHPkSk1F3ce8hw+APt7qFxvHQ7by7ff/2mMrGD
         z3Jg==
X-Gm-Message-State: AOAM532o3NbCIL/vckhUgp7u7S6IX0p4r6AdWA8xRVvefyaH0MnfnSNs
        b5q/+CYpi10ZcZwhl5fgrOU=
X-Google-Smtp-Source: ABdhPJxOj5mD/XLIpT/wWiurOiQ6L/9IGLGz7CkzT82ZNIV67krBG7lU1+0vSY5zg0BllbjHbZZbjw==
X-Received: by 2002:a17:90a:7f93:: with SMTP id m19mr1220499pjl.61.1606171261036;
        Mon, 23 Nov 2020 14:41:01 -0800 (PST)
Received: from guptapadev.amr ([192.55.54.42])
        by smtp.gmail.com with ESMTPSA id ge21sm437935pjb.5.2020.11.23.14.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 14:41:00 -0800 (PST)
Date:   Mon, 23 Nov 2020 14:33:33 -0800
From:   Pawan Gupta <writetopawan@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Drew Fustini <drew@beagleboard.org>
Subject: [PATCH] pinctrl: core: Fix unused variable build warnings
Message-ID: <d1a71663e96239ced28509980ea484cadc10c80a.1606170299.git.writetopawan@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

A recent commit f1b206cf7c57 ("pinctrl: core: print gpio in pins debugfs
file") added build warnings when CONFIG_GPIOLIB=n. Offcourse the kernel
fails to build when warnings are treated as errors. Below is the error
message:

  $ make CFLAGS_KERNEL+=-Werror

  drivers/pinctrl/core.c: In function ‘pinctrl_pins_show’:
  drivers/pinctrl/core.c:1607:20: error: unused variable ‘chip’ [-Werror=unused-variable]
   1607 |  struct gpio_chip *chip;
        |                    ^~~~
  drivers/pinctrl/core.c:1606:15: error: unused variable ‘gpio_num’ [-Werror=unused-variable]
   1606 |  unsigned int gpio_num;
        |               ^~~~~~~~
  drivers/pinctrl/core.c:1605:29: error: unused variable ‘range’ [-Werror=unused-variable]
   1605 |  struct pinctrl_gpio_range *range;
        |                             ^~~~~
  cc1: all warnings being treated as errors

These variables are only used inside #ifdef CONFIG_GPIOLIB, fix the
build warnings by wrapping the definition inside the config.

Fixes: f1b206cf7c57 ("pinctrl: core: print gpio in pins debugfs file")
Signed-off-by: Pawan Gupta <writetopawan@gmail.com>
---
 drivers/pinctrl/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 3663d87f51a0..1bb371a5cf8d 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1602,10 +1602,11 @@ static int pinctrl_pins_show(struct seq_file *s, void *what)
 	struct pinctrl_dev *pctldev = s->private;
 	const struct pinctrl_ops *ops = pctldev->desc->pctlops;
 	unsigned i, pin;
+#ifdef CONFIG_GPIOLIB
 	struct pinctrl_gpio_range *range;
 	unsigned int gpio_num;
 	struct gpio_chip *chip;
-
+#endif
 	seq_printf(s, "registered pins: %d\n", pctldev->desc->npins);
 
 	mutex_lock(&pctldev->mutex);
-- 
2.21.3

