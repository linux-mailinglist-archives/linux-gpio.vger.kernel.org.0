Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9871A144463
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jan 2020 19:37:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729134AbgAUShu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jan 2020 13:37:50 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:50435 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729096AbgAUShu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jan 2020 13:37:50 -0500
Received: by mail-pj1-f68.google.com with SMTP id r67so1787627pjb.0
        for <linux-gpio@vger.kernel.org>; Tue, 21 Jan 2020 10:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d/edO9aJPoxq9g8rnEO2HYdRuntyLYALCbAy7vUg4MQ=;
        b=iruQMEZf6Rqj00alf/sWYoU7wkexznSITdkZFHLCdtwuvZyqJZN14M2f00bK3OG/jZ
         TcGu+AZd3rNmcwoRjdcZjDJTr28RaE320khkTPwfgEi1dDHYLiqpmSLT+uTwphGwUhiS
         OuIDqJlRtbswf+u4oyh5BPcmzke1DWQiWHxeo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d/edO9aJPoxq9g8rnEO2HYdRuntyLYALCbAy7vUg4MQ=;
        b=pKbDUQHO+wof2qzPadYIZNuuwPFuv0mVp0u+cqirpCto7yCqLaol4YLmLhRzjoz8+x
         yZEsLaBmR44E1n9+640Hh1P8EacQ3iIQxPd6prQGunXSU4orflnRsbo8TFFHZBk1bmkJ
         cxkZ277wbLXxXQ0894uM6aTcbYobrPIiDTfuNGZcjMSNzjMwVUgf23m6f8Isbmqa4OzI
         nqLkgCwbsol+oOsf0W5yWDvulaCMpiaTy1gEr/ybcn/lCkhEu3InNwKgpP5QpAO0kfen
         VmoLcLF7Tk60MqIRQehiHH2CkzOAqAxwcQFoZYKiSY9JU3KRuOv0Dsj8VsQsu8GpIXF7
         J5FQ==
X-Gm-Message-State: APjAAAX0+ab+TjR4HidmmtL9bpSQgubK2i3x4Q5zxr6aB4GbuWNkLhWP
        kofm+5EMT60znUVdnF8dKAHWBj4Dq5KrLg==
X-Google-Smtp-Source: APXvYqxUpWf2jqEZGnl6npXNAnSrYtJCmXM6P+Qy21YZI5vfC7PE4b+UpLRr+pn4bVOqnayAn8+svg==
X-Received: by 2002:a17:90b:142:: with SMTP id em2mr7014885pjb.4.1579631869791;
        Tue, 21 Jan 2020 10:37:49 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id i23sm43182250pfo.11.2020.01.21.10.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2020 10:37:49 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Brian Masney <masneyb@onstation.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] spmi: pmic-arb: Set lockdep class for hierarchical irq domains
Date:   Tue, 21 Jan 2020 10:37:48 -0800
Message-Id: <20200121183748.68662-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

I see the following lockdep splat in the qcom pinctrl driver when
attempting to suspend the device.

 WARNING: possible recursive locking detected
 5.4.11 #3 Tainted: G        W
 --------------------------------------------
 cat/3074 is trying to acquire lock:
 ffffff81f49804c0 (&irq_desc_lock_class){-.-.}, at: __irq_get_desc_lock+0x64/0x94

 but task is already holding lock:
 ffffff81f1cc10c0 (&irq_desc_lock_class){-.-.}, at: __irq_get_desc_lock+0x64/0x94

 other info that might help us debug this:
  Possible unsafe locking scenario:

        CPU0
        ----
   lock(&irq_desc_lock_class);
   lock(&irq_desc_lock_class);

  *** DEADLOCK ***

  May be due to missing lock nesting notation

 6 locks held by cat/3074:
  #0: ffffff81f01d9420 (sb_writers#7){.+.+}, at: vfs_write+0xd0/0x1a4
  #1: ffffff81bd7d2080 (&of->mutex){+.+.}, at: kernfs_fop_write+0x12c/0x1fc
  #2: ffffff81f4c322f0 (kn->count#337){.+.+}, at: kernfs_fop_write+0x134/0x1fc
  #3: ffffffe411a41d60 (system_transition_mutex){+.+.}, at: pm_suspend+0x108/0x348
  #4: ffffff81f1c5e970 (&dev->mutex){....}, at: __device_suspend+0x168/0x41c
  #5: ffffff81f1cc10c0 (&irq_desc_lock_class){-.-.}, at: __irq_get_desc_lock+0x64/0x94

 stack backtrace:
 CPU: 5 PID: 3074 Comm: cat Tainted: G        W         5.4.11 #3
 Hardware name: Google Cheza (rev3+) (DT)
 Call trace:
  dump_backtrace+0x0/0x174
  show_stack+0x20/0x2c
  dump_stack+0xc8/0x124
  __lock_acquire+0x460/0x2388
  lock_acquire+0x1cc/0x210
  _raw_spin_lock_irqsave+0x64/0x80
  __irq_get_desc_lock+0x64/0x94
  irq_set_irq_wake+0x40/0x144
  qpnpint_irq_set_wake+0x28/0x34
  set_irq_wake_real+0x40/0x5c
  irq_set_irq_wake+0x70/0x144
  pm8941_pwrkey_suspend+0x34/0x44
  platform_pm_suspend+0x34/0x60
  dpm_run_callback+0x64/0xcc
  __device_suspend+0x310/0x41c
  dpm_suspend+0xf8/0x298
  dpm_suspend_start+0x84/0xb4
  suspend_devices_and_enter+0xbc/0x620
  pm_suspend+0x210/0x348
  state_store+0xb0/0x108
  kobj_attr_store+0x14/0x24
  sysfs_kf_write+0x4c/0x64
  kernfs_fop_write+0x15c/0x1fc
  __vfs_write+0x54/0x18c
  vfs_write+0xe4/0x1a4
  ksys_write+0x7c/0xe4
  __arm64_sys_write+0x20/0x2c
  el0_svc_common+0xa8/0x160
  el0_svc_handler+0x7c/0x98
  el0_svc+0x8/0xc

Set a lockdep class when we map the irq so that irq_set_wake() doesn't
warn about a lockdep bug that doesn't exist.

Fixes: 12a9eeaebba3 ("spmi: pmic-arb: convert to v2 irq interfaces to support hierarchical IRQ chips")
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Brian Masney <masneyb@onstation.org>
Cc: Lina Iyer <ilina@codeaurora.org>
Cc: Maulik Shah <mkshah@codeaurora.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/spmi/spmi-pmic-arb.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
index 97acc2ba2912..de844b412110 100644
--- a/drivers/spmi/spmi-pmic-arb.c
+++ b/drivers/spmi/spmi-pmic-arb.c
@@ -731,6 +731,7 @@ static int qpnpint_irq_domain_translate(struct irq_domain *d,
 	return 0;
 }
 
+static struct lock_class_key qpnpint_irq_lock_class, qpnpint_irq_request_class;
 
 static void qpnpint_irq_domain_map(struct spmi_pmic_arb *pmic_arb,
 				   struct irq_domain *domain, unsigned int virq,
@@ -746,6 +747,9 @@ static void qpnpint_irq_domain_map(struct spmi_pmic_arb *pmic_arb,
 	else
 		handler = handle_level_irq;
 
+
+	irq_set_lockdep_class(virq, &qpnpint_irq_lock_class,
+			      &qpnpint_irq_request_class);
 	irq_domain_set_info(domain, virq, hwirq, &pmic_arb_irqchip, pmic_arb,
 			    handler, NULL, NULL);
 }
-- 
Sent by a computer, using git, on the internet

