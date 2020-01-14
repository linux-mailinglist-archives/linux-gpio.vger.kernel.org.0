Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3040C13B5AC
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2020 00:11:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728760AbgANXLG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jan 2020 18:11:06 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:54466 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728650AbgANXLG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jan 2020 18:11:06 -0500
Received: by mail-pj1-f65.google.com with SMTP id kx11so6402048pjb.4
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jan 2020 15:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CS2jApvFb3S3JDzvv3Eoi/FOtO442LOnLZxI8A+XLvU=;
        b=L02tMrWZj0xaO61Jny+KX0dMMUNf/Qi1ZERiYigEZzD76rIz/gjTNOLKviF/9STrA3
         dXJhrhdJ3Ss0R2DI3f/gFnS0EjQNtVIgSKDw8ncpqqQbakkyvMntRS77GWcLfOzr3tBi
         8P7+TwI6GkNhqGefgxqgGyQZhYTyBT6ZDyE0c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CS2jApvFb3S3JDzvv3Eoi/FOtO442LOnLZxI8A+XLvU=;
        b=moU0aTzsS+sMI+hw8og3H22+8WxbY7jKG9pj4d1d38F+b6l5YZ4Dw5OsbkeRiLTf43
         0ku/OPYCtEKqvnbeGa/X5YX+u+wrRid5RVY6xcQSttwsQ8evmJ9PKrbNG2r5hGxYq+VV
         oPBtSMmzd88UlSD+oxA1XsAbCyjoP7MBwS5vtQQ5pbXCnhOLbXjtJvhFQI7DswcOxtlq
         27U6BNVmXEK0fS4c+5q+OnhzYSniffx8ctgsun4TyLNUmdGR0JxbtH2jrN3o7HtX3sKt
         abiGgFKAgLV+I7m668Tte5opuEZcqVS8SdAbjYGplBrutsH9gNoeu4vNChJxw0jJcIm/
         55Sw==
X-Gm-Message-State: APjAAAWsYptFHjaD7t7Sm9rEZ4ETnL+sNfXoXofPieoEeB232QfRsC5s
        COzmWbJCTRu0ICg+RedsYZjL+A==
X-Google-Smtp-Source: APXvYqynG6l761uuqSHEb49BAp2s5XUbDF125f8m/zx3CsoIimwVjlhfUtEyMjC6RefIdJ8xyoPSIg==
X-Received: by 2002:a17:90a:31cc:: with SMTP id j12mr31131379pjf.103.1579043465324;
        Tue, 14 Jan 2020 15:11:05 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id z19sm18707231pfn.49.2020.01.14.15.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2020 15:11:04 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, Thierry Reding <treding@nvidia.com>,
        Brian Masney <masneyb@onstation.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Marc Zyngier <maz@kernel.org>,
        Maulik Shah <mkshah@codeaurora.org>
Subject: [PATCH] gpiolib: Set lockdep class for hierarchical irq domains
Date:   Tue, 14 Jan 2020 15:11:03 -0800
Message-Id: <20200114231103.85641-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.25.0.rc1.283.g88dfdc4193-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

I see the following lockdep splat in the qcom pinctrl driver when
attempting to suspend the device.

 ============================================
 WARNING: possible recursive locking detected
 5.4.2 #2 Tainted: G S
 --------------------------------------------
 cat/6536 is trying to acquire lock:
 ffffff814787ccc0 (&irq_desc_lock_class){-.-.}, at: __irq_get_desc_lock+0x64/0x94

 but task is already holding lock:
 ffffff81436740c0 (&irq_desc_lock_class){-.-.}, at: __irq_get_desc_lock+0x64/0x94

 other info that might help us debug this:
  Possible unsafe locking scenario:

        CPU0
        ----
   lock(&irq_desc_lock_class);
   lock(&irq_desc_lock_class);

  *** DEADLOCK ***

  May be due to missing lock nesting notation

 7 locks held by cat/6536:
  #0: ffffff8140e0c420 (sb_writers#7){.+.+}, at: vfs_write+0xc8/0x19c
  #1: ffffff8121eec480 (&of->mutex){+.+.}, at: kernfs_fop_write+0x128/0x1f4
  #2: ffffff8147cad668 (kn->count#263){.+.+}, at: kernfs_fop_write+0x130/0x1f4
  #3: ffffffd011446000 (system_transition_mutex){+.+.}, at: pm_suspend+0x108/0x354
  #4: ffffff814302b970 (&dev->mutex){....}, at: __device_suspend+0x16c/0x420
  #5: ffffff81436740c0 (&irq_desc_lock_class){-.-.}, at: __irq_get_desc_lock+0x64/0x94
  #6: ffffff81479b8c10 (&pctrl->lock){....}, at: msm_gpio_irq_set_wake+0x48/0x7c

 stack backtrace:
 CPU: 4 PID: 6536 Comm: cat Tainted: G S                5.4.2 #2
 Call trace:
  dump_backtrace+0x0/0x174
  show_stack+0x20/0x2c
  dump_stack+0xdc/0x144
  __lock_acquire+0x52c/0x2268
  lock_acquire+0x1dc/0x220
  _raw_spin_lock_irqsave+0x64/0x80
  __irq_get_desc_lock+0x64/0x94
  irq_set_irq_wake+0x40/0x144
  msm_gpio_irq_set_wake+0x5c/0x7c
  set_irq_wake_real+0x40/0x5c
  irq_set_irq_wake+0x70/0x144
  cros_ec_rtc_suspend+0x38/0x4c
  platform_pm_suspend+0x34/0x60
  dpm_run_callback+0x64/0xcc
  __device_suspend+0x314/0x420
  dpm_suspend+0xf8/0x298
  dpm_suspend_start+0x84/0xb4
  suspend_devices_and_enter+0xbc/0x628
  pm_suspend+0x214/0x354
  state_store+0xb0/0x108
  kobj_attr_store+0x14/0x24
  sysfs_kf_write+0x4c/0x64
  kernfs_fop_write+0x158/0x1f4
  __vfs_write+0x54/0x18c
  vfs_write+0xdc/0x19c
  ksys_write+0x7c/0xe4
  __arm64_sys_write+0x20/0x2c
  el0_svc_common+0xa8/0x160
  el0_svc_compat_handler+0x2c/0x38
  el0_svc_compat+0x8/0x10

This is because the msm_gpio_irq_set_wake() function calls
irq_set_irq_wake() as a backup in case the irq comes in during the path
to idle. Given that we're calling irqchip functions from within an
irqchip we need to set the lockdep class to be different for this child
controller vs. the default one that the parent irqchip gets.

This used to be done before this driver was converted to hierarchical
irq domains in commit e35a6ae0eb3a ("pinctrl/msm: Setup GPIO chip in
hierarchy") via the gpiochip_irq_map() function. With hierarchical irq
domains this function has been replaced by
gpiochip_hierarchy_irq_domain_alloc(). Therefore, set the lockdep class
like was done previously in the irq domain path so we can avoid this
lockdep warning.

Fixes: fdd61a013a24 ("gpio: Add support for hierarchical IRQ domains")
Cc: Thierry Reding <treding@nvidia.com>
Cc: Brian Masney <masneyb@onstation.org>
Cc: Lina Iyer <ilina@codeaurora.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Maulik Shah <mkshah@codeaurora.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpio/gpiolib.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 967371377a9d..dcdbdddb3396 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2040,6 +2040,7 @@ static int gpiochip_hierarchy_irq_domain_alloc(struct irq_domain *d,
 				     parent_type);
 	chip_info(gc, "alloc_irqs_parent for %d parent hwirq %d\n",
 		  irq, parent_hwirq);
+	irq_set_lockdep_class(irq, gc->irq.lock_key, gc->irq.request_key);
 	ret = irq_domain_alloc_irqs_parent(d, irq, 1, &parent_fwspec);
 	if (ret)
 		chip_err(gc,
-- 
Sent by a computer, using git, on the internet

