Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1714134E552
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Mar 2021 12:22:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231599AbhC3KVq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Mar 2021 06:21:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231549AbhC3KVO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Mar 2021 06:21:14 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F4078C061574
        for <linux-gpio@vger.kernel.org>; Tue, 30 Mar 2021 03:21:13 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id x16so15672388wrn.4
        for <linux-gpio@vger.kernel.org>; Tue, 30 Mar 2021 03:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=E3nKbcHNee+AFuGzI1iCWqsWMPBeJ6UycqIXtb3VUtw=;
        b=qG1pc9pvXYFmRS7EJqHjGH/bCzX+VRTydslWJ0GuUWmVNddNFNK8xN0U6R4Iyznj4q
         6sRDeN+FAQCZIZbHgpRW4HYpbfgHyf0yWsyMtkt1a/6KNEfZdNnI5R6TMEUTbsvUrYX4
         ELVd5uMPznitcxeLph52kuWRg48urLqAOVHtEMOYfiymOsWCN+ODjcABuNzrDygV7KbI
         xu5DZ0jtPpTBTvn8/e7ShqUpZodS1IkAIVo1lHtkl26sPvrLAbs+6FLrduIAGqXK/YGt
         LdcWqnQpMs4ui0aypRVQGrdYgktj/qT22Q1aK8U8jrlViLp1m2GpZw6wo6+30Nb/iZiI
         zV/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=E3nKbcHNee+AFuGzI1iCWqsWMPBeJ6UycqIXtb3VUtw=;
        b=V/8NkrEWnRr5gsNm7lc7V9dLjS8v1fvX9P+0EueE7Puv22PUmNXk77cp9V+MhRkB/3
         oQsa9Qwbrs2G8ILkPgf7azmmLiesVMBp0x23aCp3NxDRJW+cmEyK7M2vNAcKs+Q2r39l
         TSdP9rOGjdssJ1WgpOrKo0I1Ul0oSRi6++1rCtUsjUK8VxS78wTk4WP1nq8K4f4hZMuO
         mKkxROCnFSWTp7DzWsCFz3rb8jWGm7eT/D4Y9tsYVMh2J2q3bTe2gIeqTXGfxg945cVu
         PdGnd79mpqqgAWtPgd/Z80t8T4f1pzzPTzWpOwawheyJDkTKTPJLgGiIFcHwOkeRkBcn
         NnoQ==
X-Gm-Message-State: AOAM5336InT9gqaavWo0IO5ZuWY3qqESXmvm4IPkRl0yARAXTB7mw4Lf
        2xMLJTPuXrE/GuTfSOooSgXpMg==
X-Google-Smtp-Source: ABdhPJxxOkX1dQXsYvU8WfWst8XD53s5DAcn+KSB2Z8d2E0j/8GePIyLB+0xjJNn2g9+CkUYFDL/kg==
X-Received: by 2002:a5d:4d09:: with SMTP id z9mr32431059wrt.426.1617099672742;
        Tue, 30 Mar 2021 03:21:12 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-149-6.w2-15.abo.wanadoo.fr. [2.15.231.6])
        by smtp.gmail.com with ESMTPSA id u17sm34046866wrw.51.2021.03.30.03.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 03:21:12 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] gpio: sim: actually use the OF module table
Date:   Tue, 30 Mar 2021 12:21:10 +0200
Message-Id: <20210330102110.10881-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

We don't assign the of_device_id table to the platform driver resulting
in the following build warning:

>> drivers/gpio/gpio-sim.c:388:34: warning: unused variable 'gpio_sim_of_match' [-Wunused-const-variable]
   static const struct of_device_id gpio_sim_of_match[] = {

This fixes it.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-sim.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index a1807f518837..ea17289a869c 100644
--- a/drivers/gpio/gpio-sim.c
+++ b/drivers/gpio/gpio-sim.c
@@ -394,6 +394,7 @@ MODULE_DEVICE_TABLE(of, gpio_sim_of_match);
 static struct platform_driver gpio_sim_driver = {
 	.driver = {
 		.name = "gpio-sim",
+		.of_match_table = gpio_sim_of_match,
 	},
 	.probe = gpio_sim_probe,
 };
-- 
2.30.1

