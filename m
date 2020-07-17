Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86E39223079
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jul 2020 03:35:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726989AbgGQBfm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jul 2020 21:35:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726964AbgGQBfg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2020 21:35:36 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56A4DC08C5DC
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 18:35:35 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id f7so9289031wrw.1
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 18:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C+8I031c2hEesaHtS2cfGMJOZo6/g22x05Hcv9ocwjk=;
        b=pj1mWLsxalHIuf9Pm1hZOhp9XC3YtUxl5L0+12sMGteVE1eugXs25S6A+S3EFlUgtn
         eO6/H+YEjH5gebkBVpTljRUEQZnlUMDEhQhd1HpPzi6pdRNGNT2hq4Ejrflosh24ECt7
         abG4rpXyfoioF80E+umsrMDWe/rkoihK9yl6Y9EWFP5G7/SP2T/yx8G6Le7LDk91VXdi
         TBcNpIUsV2VYLApwvilSRiR+nzqjyNnwbPFFLXRPojoZfwGPqwtlxJIjKiyErCrOjk4P
         Zqy1dKuqHPb1Z/Z9QUzJz3Vp5XzhpGJd4Qpxmci8lPf/6akkXi0X6npoqsecsTi5tTkO
         aArw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C+8I031c2hEesaHtS2cfGMJOZo6/g22x05Hcv9ocwjk=;
        b=lC3ukOyrnIKBB6yjHcznhfzwR/VpvZ0LNdaRqxSmil5fMlRzR9QWwTC+yyTTwVkBPC
         VE8ywk8YfHFI1svmegMVUIOooRGchR8Qgs7BTThsd3SJUKVfz6uQQ2sHGyQS5EPV7PBb
         lFq7FUDTy0VoZxzZKl2vniC/P7F5PYs7B/05k/VvXcqVO7KfUWdFyTk+QNIk3BAbjdb2
         /rcOWBsVZzxTM+8F4PCHemj0KqLF3SHl5oN6IdSnRZixSWUJiPxggloDwwKuaRaIGCzt
         ydezTp20XEsBECsMjrxEMpX6wGmKIkhAksJ9zVrL+vzj4qu/1RPQMRbMXGPBLKqvK5ga
         XUwA==
X-Gm-Message-State: AOAM533NnYxCsKHWuFiN3Y9rVR0KSGywVQ7LKQUHs3djnrQkyXevh5FW
        bkfVUoPJuprLpzJeqLUPVrlY/pqVfHEUnQ==
X-Google-Smtp-Source: ABdhPJxqER0flvJa+b1TeXf5gn7RqfPuflGfXe4a1gY41a8svtFbOIgL9uqu1kvhe7o16GbeEyX33Q==
X-Received: by 2002:adf:dd83:: with SMTP id x3mr8479774wrl.292.1594949733904;
        Thu, 16 Jul 2020 18:35:33 -0700 (PDT)
Received: from localhost.localdomain (220.red-95-125-197.staticip.rima-tde.net. [95.125.197.220])
        by smtp.gmail.com with ESMTPSA id 138sm6708828wmb.1.2020.07.16.18.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 18:35:33 -0700 (PDT)
From:   Drew Fustini <drew@beagleboard.org>
To:     Tony Lindgren <tony@atomide.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-omap@vger.kernel.org, linux-gpio@vger.kernel.org,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Cc:     Drew Fustini <drew@beagleboard.org>
Subject: [PATCH] pinctrl: single: print gpio number in pins debugfs file
Date:   Fri, 17 Jul 2020 03:33:40 +0200
Message-Id: <20200717013338.1741659-1-drew@beagleboard.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

If there is a gpio range mapping for the pin, then print out the gpio
number for the pin in the debugfs 'pins' file.

Here is an example on the BeagleBone Black:

  $ cat /sys/kernel/debug/pinctrl/44e10800.pinmux-pinctrl-single/pins |head -20
  registered pins: 142
  pin 0 (PIN0) 44e10800 00000027 pinctrl-single GPIO-32
  pin 1 (PIN1) 44e10804 00000027 pinctrl-single GPIO-33
  pin 2 (PIN2) 44e10808 00000027 pinctrl-single GPIO-34
  pin 3 (PIN3) 44e1080c 00000027 pinctrl-single GPIO-35
  pin 4 (PIN4) 44e10810 00000027 pinctrl-single GPIO-36
  pin 5 (PIN5) 44e10814 00000027 pinctrl-single GPIO-37
  pin 6 (PIN6) 44e10818 00000027 pinctrl-single GPIO-38
  pin 7 (PIN7) 44e1081c 00000027 pinctrl-single GPIO-39
  pin 8 (PIN8) 44e10820 00000027 pinctrl-single GPIO-22
  pin 9 (PIN9) 44e10824 00000030 pinctrl-single GPIO-23
  pin 10 (PIN10) 44e10828 00000030 pinctrl-single GPIO-26
  pin 11 (PIN11) 44e1082c 00000030 pinctrl-single GPIO-27
  pin 12 (PIN12) 44e10830 00000030 pinctrl-single GPIO-44
  pin 13 (PIN13) 44e10834 00000030 pinctrl-single GPIO-45
  pin 14 (PIN14) 44e10838 00000030 pinctrl-single GPIO-46
  pin 15 (PIN15) 44e1083c 00000030 pinctrl-single GPIO-47
  pin 16 (PIN16) 44e10840 00000027 pinctrl-single GPIO-48
  pin 17 (PIN17) 44e10844 00000027 pinctrl-single GPIO-49
  pin 18 (PIN18) 44e10848 00000000 pinctrl-single GPIO-50

Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
 drivers/pinctrl/pinctrl-single.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index f3a8a465d27e..473fe0f61792 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -275,6 +275,14 @@ static void pcs_pin_dbg_show(struct pinctrl_dev *pctldev,
 	unsigned val, mux_bytes;
 	unsigned long offset;
 	size_t pa;
+	struct pinctrl_gpio_range *range;
+	unsigned gpio_num = 0;
+
+	list_for_each_entry(range, &pctldev->gpio_ranges, node) {
+		if ((pin >= range->pin_base) &&
+		    (pin < (range->pin_base + range->npins)))
+			gpio_num = range->base + (pin - range->pin_base);
+	}
 
 	pcs = pinctrl_dev_get_drvdata(pctldev);
 
@@ -283,7 +291,10 @@ static void pcs_pin_dbg_show(struct pinctrl_dev *pctldev,
 	val = pcs->read(pcs->base + offset);
 	pa = pcs->res->start + offset;
 
-	seq_printf(s, "%zx %08x %s ", pa, val, DRIVER_NAME);
+	if (gpio_num > 0)
+		seq_printf(s, "%zx %08x %s GPIO-%u", pa, val, DRIVER_NAME, gpio_num);
+	else
+		seq_printf(s, "%zx %08x %s", pa, val, DRIVER_NAME);
 }
 
 static void pcs_dt_free_map(struct pinctrl_dev *pctldev,
-- 
2.25.1

