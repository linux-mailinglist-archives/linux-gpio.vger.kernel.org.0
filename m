Return-Path: <linux-gpio+bounces-4433-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7A187EB0F
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Mar 2024 15:33:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 646AC1F219D8
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Mar 2024 14:33:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B3A34E1D3;
	Mon, 18 Mar 2024 14:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="QsnP27jY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF4F22094
	for <linux-gpio@vger.kernel.org>; Mon, 18 Mar 2024 14:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710772322; cv=none; b=RcjlMdBX2LFCvBTwF0/gQgj3BddCWyHBE6iF8G1sZEaLKQP824DtlLTspOgLR8btJHO7vmvRK7f2ZA1mG6JCTSAyoVn1eYecHpeYAsum54Epi0zAauA6WWMwHQ0Y+JxO8Y7rcG1lCbUWECx3D0kqlqAf+gV9mq9cZt0VLQZadZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710772322; c=relaxed/simple;
	bh=+n/QrDGFBgiduMWPGE3pCf3COSehjC5oMytJE17n48A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CLlfRc31/pR4bVzjW2kJcP3fhPRgr2sYjVpIY2NBjAc9i8S9+YaHUa61qVoI9XLQDAtJa5Nwh2jcbnXCo9+2TisVbD+J0tfGfGFKUJKxqFAoPAmVBKb9Bm1jThiOQv0yYiMSn88C2n9WlKmUR7ewtrL+RTT+AQf+z8AA1pyElXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=QsnP27jY; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a465ddc2c09so314251166b.2
        for <linux-gpio@vger.kernel.org>; Mon, 18 Mar 2024 07:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1710772317; x=1711377117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nYsmgDq+HbdT80Fs5oAiop4K2l18spP4P/MHxHrhlsg=;
        b=QsnP27jYHKpBIdHrwOmw/zr0CwmJweDeymSYAT5QYA7bKBDb+kbk8PAKlnTOCQMcdu
         t7B3/lDxkW56k4dx16G5V142cTClXKRqUWdq5p4oP4Al0+UBhK8LqRWR+4KI6OycQfsr
         E1iKRo8GLkBIVuCofARz6qTXhRhOxreW0y+nIEvEoea8rVMUAHZmX5n3Ty+9wsinQWew
         Fkljoc0lVBSKwT15yzn1m7ZNsdEJcJ4kgF3CQFNtgKJtPIVS8zT1e28JfBpwzBL4cf5G
         kvFvK6/ngFguftqAQZ5BkEpH9Kl5e97jazICP4viwQr5+64mxnl3TCJrJh0xyQ0dbx4q
         1VBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710772317; x=1711377117;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nYsmgDq+HbdT80Fs5oAiop4K2l18spP4P/MHxHrhlsg=;
        b=vHwKeuJrgmHn/OI2N3YjwiKwv4rWSfbeMzwB7z/avuS0W6S7GMiXR/wDxh5WYSYCpl
         mXbDoHW8gdf6s9FjfDUWWW9uKEQtlh+elGp7av48ajyKh2lnxD3IBNNwFkc7SBUiZzAg
         priZ+dU0Wxvsg5lkNCSGu+tEo1yVyLYJOjO6SLW96Do9HgCt724NKHyvYxvPKjCYpYv/
         PfjhAnRXtOTSvRHs1bnRMSfKcAU44RdYHcq14PlFSx6jnVQX++zj7aEDK8Idn6c5tlvo
         FFyKurGlLgiRMuvAo+iQ4MTbZD0J75Uo8QMpJx4qHEW0h57a18KgcM71Id3AQfUtWF6B
         GrVg==
X-Forwarded-Encrypted: i=1; AJvYcCXJ56WUuXoJy9C/gLlkI9Od62Zo9ODz7lqb4HLAsdBO1wC5O99gPASXcrMWdb7qTmXFirBLDzb3WEXZe3zetWkrQ/hfzDIn2dstIQ==
X-Gm-Message-State: AOJu0Yy/Cm42qMuTq73h0bQJdpwDgCxkoyJldKtdopmwCerQhZu1U50B
	Nu8+NundhWMR5G4/Kuw7Xlsb7OghsFvi98xZwcCPRAaqTp5Jf0Jhs79T+eBjWh4=
X-Google-Smtp-Source: AGHT+IFZcXL0FH2jux1P6llKSareqAG9uv3AaUi0lNBNBiG76p8+JlvkbdQcplYXU2sCea5m/mhKfg==
X-Received: by 2002:a05:6402:501a:b0:56b:8439:6daa with SMTP id p26-20020a056402501a00b0056b84396daamr1300136eda.33.1710772316965;
        Mon, 18 Mar 2024 07:31:56 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id cq28-20020a056402221c00b00568addda0d1sm3656084edb.45.2024.03.18.07.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 07:31:56 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	linus.walleij@linaro.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2] pinctrl: renesas: rzg2l: Execute atomically the interrupt configuration
Date: Mon, 18 Mar 2024 16:31:49 +0200
Message-Id: <20240318143149.2468349-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Lockdep detects a possible deadlock as listed below. This is because it
detects the IA55 interrupt controller .irq_eoi() API is called from
interrupt context while configuration-specific API (e.g., .irq_enable())
could be called from process context on resume path (by calling
rzg2l_gpio_irq_restore()). To avoid this, protect the call of
rzg2l_gpio_irq_enable() with spin_lock_irqsave()/spin_unlock_irqrestore().
With this the same approach that is available in __setup_irq() is mimicked
to pinctrl IRQ resume function.

Below is the lockdep report:

 WARNING: inconsistent lock state
 6.8.0-rc5-next-20240219-arm64-renesas-00030-gb17a289abf1f #90 Not tainted
 --------------------------------
 inconsistent {IN-HARDIRQ-W} -> {HARDIRQ-ON-W} usage.
 str_rwdt_t_001./159 [HC0[0]:SC0[0]:HE1:SE1] takes:
 ffff00000b001d70 (&rzg2l_irqc_data->lock){?...}-{2:2}, at: rzg2l_irqc_irq_enable+0x60/0xa4
 {IN-HARDIRQ-W} state was registered at:
 lock_acquire+0x1e0/0x310
 _raw_spin_lock+0x44/0x58
 rzg2l_irqc_eoi+0x2c/0x130
 irq_chip_eoi_parent+0x18/0x20
 rzg2l_gpio_irqc_eoi+0xc/0x14
 handle_fasteoi_irq+0x134/0x230
 generic_handle_domain_irq+0x28/0x3c
 gic_handle_irq+0x4c/0xbc
 call_on_irq_stack+0x24/0x34
 do_interrupt_handler+0x78/0x7c
 el1_interrupt+0x30/0x5c
 el1h_64_irq_handler+0x14/0x1c
 el1h_64_irq+0x64/0x68
 _raw_spin_unlock_irqrestore+0x34/0x70
 __setup_irq+0x4d4/0x6b8
 request_threaded_irq+0xe8/0x1a0
 request_any_context_irq+0x60/0xb8
 devm_request_any_context_irq+0x74/0x104
 gpio_keys_probe+0x374/0xb08
 platform_probe+0x64/0xcc
 really_probe+0x140/0x2ac
 __driver_probe_device+0x74/0x124
 driver_probe_device+0x3c/0x15c
 __driver_attach+0xec/0x1c4
 bus_for_each_dev+0x70/0xcc
 driver_attach+0x20/0x28
 bus_add_driver+0xdc/0x1d0
 driver_register+0x5c/0x118
 __platform_driver_register+0x24/0x2c
 gpio_keys_init+0x18/0x20
 do_one_initcall+0x70/0x290
 kernel_init_freeable+0x294/0x504
 kernel_init+0x20/0x1cc
 ret_from_fork+0x10/0x20
 irq event stamp: 69071
 hardirqs last enabled at (69071): [<ffff800080e0dafc>] _raw_spin_unlock_irqrestore+0x6c/0x70
 hardirqs last disabled at (69070): [<ffff800080e0cfec>] _raw_spin_lock_irqsave+0x7c/0x80
 softirqs last enabled at (67654): [<ffff800080010614>] __do_softirq+0x494/0x4dc
 softirqs last disabled at (67645): [<ffff800080015238>] ____do_softirq+0xc/0x14

 other info that might help us debug this:
 Possible unsafe locking scenario:

 CPU0
 ----
 lock(&rzg2l_irqc_data->lock);
 <Interrupt>
 lock(&rzg2l_irqc_data->lock);

 *** DEADLOCK ***

 4 locks held by str_rwdt_t_001./159:
 #0: ffff00000b10f3f0 (sb_writers#4){.+.+}-{0:0}, at: vfs_write+0x1a4/0x35c
 #1: ffff00000e43ba88 (&of->mutex){+.+.}-{3:3}, at: kernfs_fop_write_iter+0xe8/0x1a8
 #2: ffff00000aa21dc8 (kn->active#40){.+.+}-{0:0}, at: kernfs_fop_write_iter+0xf0/0x1a8
 #3: ffff80008179d970 (system_transition_mutex){+.+.}-{3:3}, at: pm_suspend+0x9c/0x278

 stack backtrace:
 CPU: 0 PID: 159 Comm: str_rwdt_t_001. Not tainted 6.8.0-rc5-next-20240219-arm64-renesas-00030-gb17a289abf1f #90
 Hardware name: Renesas SMARC EVK version 2 based on r9a08g045s33 (DT)
 Call trace:
 dump_backtrace+0x94/0xe8
 show_stack+0x14/0x1c
 dump_stack_lvl+0x88/0xc4
 dump_stack+0x14/0x1c
 print_usage_bug.part.0+0x294/0x348
 mark_lock+0x6b0/0x948
 __lock_acquire+0x750/0x20b0
 lock_acquire+0x1e0/0x310
 _raw_spin_lock+0x44/0x58
 rzg2l_irqc_irq_enable+0x60/0xa4
 irq_chip_enable_parent+0x1c/0x34
 rzg2l_gpio_irq_enable+0xc4/0xd8
 rzg2l_pinctrl_resume_noirq+0x4cc/0x520
 pm_generic_resume_noirq+0x28/0x3c
 genpd_finish_resume+0xc0/0xdc
 genpd_resume_noirq+0x14/0x1c
 dpm_run_callback+0x34/0x90
 device_resume_noirq+0xa8/0x268
 dpm_noirq_resume_devices+0x13c/0x160
 dpm_resume_noirq+0xc/0x1c
 suspend_devices_and_enter+0x2c8/0x570
 pm_suspend+0x1ac/0x278
 state_store+0x88/0x124
 kobj_attr_store+0x14/0x24
 sysfs_kf_write+0x48/0x6c
 kernfs_fop_write_iter+0x118/0x1a8
 vfs_write+0x270/0x35c
 ksys_write+0x64/0xec
 __arm64_sys_write+0x18/0x20
 invoke_syscall+0x44/0x108
 el0_svc_common.constprop.0+0xb4/0xd4
 do_el0_svc+0x18/0x20
 el0_svc+0x3c/0xb8
 el0t_64_sync_handler+0xb8/0xbc
 el0t_64_sync+0x14c/0x150

Fixes: 254203f9a94c ("pinctrl: renesas: rzg2l: Add suspend/resume support")
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- used raw_spin_lock_irqsave()/raw_spin_unlock_irqrestore()

 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index eb5a8c654260..93916553bcc7 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -2063,8 +2063,17 @@ static void rzg2l_gpio_irq_restore(struct rzg2l_pinctrl *pctrl)
 			continue;
 		}
 
-		if (!irqd_irq_disabled(data))
+		if (!irqd_irq_disabled(data)) {
+			unsigned long flags;
+
+			/*
+			 * This has to be atomically executed to protect against a concurrent
+			 * interrupt.
+			 */
+			raw_spin_lock_irqsave(&pctrl->lock.rlock, flags);
 			rzg2l_gpio_irq_enable(data);
+			raw_spin_unlock_irqrestore(&pctrl->lock.rlock, flags);
+		}
 	}
 }
 
-- 
2.39.2


