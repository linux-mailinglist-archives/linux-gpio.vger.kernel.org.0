Return-Path: <linux-gpio+bounces-29077-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B87C89BD1
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Nov 2025 13:22:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E4AAA34A10A
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Nov 2025 12:22:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 181783271E7;
	Wed, 26 Nov 2025 12:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bRgcFxH9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C391431AF2A
	for <linux-gpio@vger.kernel.org>; Wed, 26 Nov 2025 12:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764159754; cv=none; b=r0CUKdN7wU2x4wzyGJRFsabDHTWeu5prNDOzuv9OLrk7MHn7v0g5f6sd8XfdNuGxrrBIXbTfiFdTz8LFqporAWI12AiWcPnikgbaPupm9UEIvH+WOq29CPsAUz6wDTL6Du7BGAALfqjvhFNc3juG6FIuqf9Q0lcr5upMQdfOQUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764159754; c=relaxed/simple;
	bh=2+VAOmWz9et0UUjpPkVqfC+IdwUvWdpOacB97kIfSEI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FHwTdWwpK1V6WSwehzPNw/GBUhcVEAiVLD7jgq9BJ5QojnoaGtChOCOQs0pnKXtlJtYUiqhV0l0AvJEWgD7QlGxThciw8KdLWEgrj7cspoVOsGFkZiddoJHydyFXWU4w941eudjZPaVEVHtS9qcSJUoc9lj92j9CGlU2YWtk31M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bRgcFxH9; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-477770019e4so55233465e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 26 Nov 2025 04:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764159750; x=1764764550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nb8J59nTRhuMgqiDZt7LhAGF4nSCUqiI5XGaUGNyCZM=;
        b=bRgcFxH9pH2aZ6nqwlEv1/86nNS0Z5Zmd4Np1ZDbRlXuLyCEJQLMYCyHKGB3yJMxj/
         0U3fpAHaXEuxKbQEnOc/iukEY5u12KuJMGazVi0yxdiHKVr94CaFJfM08XoXQnLfYyaG
         Hkr0ve7VTx1Cyvv17e2uiktlsWIE9blhe+l/guky2DeIjUM9M/xu8C/2uCrYXzc0V+WB
         YzMsYNmuRHyKs2DHbQw8Nnd1CcIrR8//P4p+mZCmSl7UGwFF83LU2blYvBYeAtM6zc3p
         yntE/zOOTK1HOVyoxWn7mcmyBfRfpzcJhLGMAO8kRlNiUjRt0p1JCaLse5Ak3tHZBnSz
         1MxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764159750; x=1764764550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nb8J59nTRhuMgqiDZt7LhAGF4nSCUqiI5XGaUGNyCZM=;
        b=kfZHaU8lNCNWlzO+9kJBeWcC9SMeo9c9uYtEVvWjMAyZRomCS0yBTifRpBQisOFsZg
         dVSQ1BPzw7YACUERbEAHMxTee6eOYw6jX5MsSn9rPWCSKzspgiMAhJ9cdFgqnTav224e
         awH/iBMBGXOpY0dtE+VhW8mP4B55MoCkjH1GAgFj4wH0pOzAutvHviLj7CqjteQd/uxp
         9jNRNShiBzIpi3nNAaG1CO5EB4PYevH3b9AG2YLuz1FZOMrqvzfnGZKHF4QSohNuedek
         kxdNJjcGLRVYGwJL0Q4Eb75mAXJ2jvolC2+zl7daGWWzEo2rXHzHi13nWomfel1mfbYK
         rhZg==
X-Forwarded-Encrypted: i=1; AJvYcCW5J+IBCM1VwmkhEnXA26IEtiPwTRlP4wUQ3kx749Uv0NL+4YViWunQogfRX/Nsg0jsFBjdnm8ZvO7c@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2UNoluFrepD2cVISODutAVwz7NJQjNneCguX09EqRoF0mRRHF
	gcA0ENI23Uz0gOIK7zFkVGC/iCH8kbzC2qeZzLuXcPQ5/NmBDmPKGpQVMElwOEj8t/I=
X-Gm-Gg: ASbGnct3w67FnEh5gR/Hhor72mfygA/6VHUpsHR6DrCVO5+53MSuosOEf8gziMj1UhU
	0ehM8jX9pmygTK488Btay1Mi09jDYbPTGk6VoSgJrRl0fzluGAwi3eInXyACUM0jpInHpL8nvFa
	CJayBBZCgvCNMiCH7/ENdzc/jWT4mGGo5hl/3mwpc4XpWreL0nAyvpLGdh5FMJE38roEmltGCpu
	M6CPeYt2MBhREWWJsWbIlp/OPqqZkI2dISdFpr0cEIZ1s/v+CeLddUa9zcC/Swym6GyDMQv6dCO
	3Bi3AhlSe1XVgG5fOlBUg4un53KUUwOmIUqCGyD2gU/wu02M6RXgaYptNo+PBtdjMXRWnUUrwzO
	JI8ArgYWRrcnW5uCQt7HTePWiyKjoznAJ4zBzvRC1fKQWAezkE6XTvL9O7dflYmmOjS1aidt+jG
	EDiaLI
X-Google-Smtp-Source: AGHT+IHSWyiPvjo6pfwtzQLGPlt73Ie+wpC27JU1nwVttO0MEHGbEomKIPCG3/Aoh1JNOO8u4xSerw==
X-Received: by 2002:a05:600c:46d2:b0:477:54cd:2030 with SMTP id 5b1f17b1804b1-47904b1afcemr63214885e9.21.1764159749845;
        Wed, 26 Nov 2025 04:22:29 -0800 (PST)
Received: from brgl-uxlite ([2a01:cb1d:dc:7e00:544e:b6f5:116d:4a8c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f2e454sm40179244f8f.2.2025.11.26.04.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 04:22:29 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	stable@vger.kernel.org,
	Val Packett <val@packett.cool>
Subject: [PATCH] pinctrl: qcom: lpass-lpi: mark the GPIO controller as sleeping
Date: Wed, 26 Nov 2025 13:22:19 +0100
Message-ID: <20251126122219.25729-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The gpio_chip settings in this driver say the controller can't sleep
but it actually uses a mutex for synchronization. This triggers the
following BUG():

[    9.233659] BUG: sleeping function called from invalid context at kernel/locking/mutex.c:281
[    9.233665] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 554, name: (udev-worker)
[    9.233669] preempt_count: 1, expected: 0
[    9.233673] RCU nest depth: 0, expected: 0
[    9.233688] Tainted: [W]=WARN
[    9.233690] Hardware name: Dell Inc. Latitude 7455/0FK7MX, BIOS 2.10.1 05/20/2025
[    9.233694] Call trace:
[    9.233696]  show_stack+0x24/0x38 (C)
[    9.233709]  dump_stack_lvl+0x40/0x88
[    9.233716]  dump_stack+0x18/0x24
[    9.233722]  __might_resched+0x148/0x160
[    9.233731]  __might_sleep+0x38/0x98
[    9.233736]  mutex_lock+0x30/0xd8
[    9.233749]  lpi_config_set+0x2e8/0x3c8 [pinctrl_lpass_lpi]
[    9.233757]  lpi_gpio_direction_output+0x58/0x90 [pinctrl_lpass_lpi]
[    9.233761]  gpiod_direction_output_raw_commit+0x110/0x428
[    9.233772]  gpiod_direction_output_nonotify+0x234/0x358
[    9.233779]  gpiod_direction_output+0x38/0xd0
[    9.233786]  gpio_shared_proxy_direction_output+0xb8/0x2a8 [gpio_shared_proxy]
[    9.233792]  gpiod_direction_output_raw_commit+0x110/0x428
[    9.233799]  gpiod_direction_output_nonotify+0x234/0x358
[    9.233806]  gpiod_configure_flags+0x2c0/0x580
[    9.233812]  gpiod_find_and_request+0x358/0x4f8
[    9.233819]  gpiod_get_index+0x7c/0x98
[    9.233826]  devm_gpiod_get+0x34/0xb0
[    9.233829]  reset_gpio_probe+0x58/0x128 [reset_gpio]
[    9.233836]  auxiliary_bus_probe+0xb0/0xf0
[    9.233845]  really_probe+0x14c/0x450
[    9.233853]  __driver_probe_device+0xb0/0x188
[    9.233858]  driver_probe_device+0x4c/0x250
[    9.233863]  __driver_attach+0xf8/0x2a0
[    9.233868]  bus_for_each_dev+0xf8/0x158
[    9.233872]  driver_attach+0x30/0x48
[    9.233876]  bus_add_driver+0x158/0x2b8
[    9.233880]  driver_register+0x74/0x118
[    9.233886]  __auxiliary_driver_register+0x94/0xe8
[    9.233893]  init_module+0x34/0xfd0 [reset_gpio]
[    9.233898]  do_one_initcall+0xec/0x300
[    9.233903]  do_init_module+0x64/0x260
[    9.233910]  load_module+0x16c4/0x1900
[    9.233915]  __arm64_sys_finit_module+0x24c/0x378
[    9.233919]  invoke_syscall+0x4c/0xe8
[    9.233925]  el0_svc_common+0x8c/0xf0
[    9.233929]  do_el0_svc+0x28/0x40
[    9.233934]  el0_svc+0x38/0x100
[    9.233938]  el0t_64_sync_handler+0x84/0x130
[    9.233943]  el0t_64_sync+0x17c/0x180

Mark the controller as sleeping.

Fixes: 6e261d1090d6 ("pinctrl: qcom: Add sm8250 lpass lpi pinctrl driver")
Cc: stable@vger.kernel.org
Reported-by: Val Packett <val@packett.cool>
Closes: https://lore.kernel.org/all/98c0f185-b0e0-49ea-896c-f3972dd011ca@packett.cool/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
index 1c97ec44aa5ff..78212f9928430 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
@@ -498,7 +498,7 @@ int lpi_pinctrl_probe(struct platform_device *pdev)
 	pctrl->chip.base = -1;
 	pctrl->chip.ngpio = data->npins;
 	pctrl->chip.label = dev_name(dev);
-	pctrl->chip.can_sleep = false;
+	pctrl->chip.can_sleep = true;
 
 	mutex_init(&pctrl->lock);
 
-- 
2.51.0


