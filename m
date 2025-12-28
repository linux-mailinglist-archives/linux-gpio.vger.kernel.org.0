Return-Path: <linux-gpio+bounces-29953-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB57CE49BF
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Dec 2025 08:18:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD027300F9CE
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Dec 2025 07:18:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9020285CAA;
	Sun, 28 Dec 2025 07:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="fOoX9d8/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7835285C98
	for <linux-gpio@vger.kernel.org>; Sun, 28 Dec 2025 07:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766906302; cv=none; b=G51EcT/OF5x6W5nRhoXrfQjjoVn0oeJBpvLzcxYurGDPmEMME1cesxd5mD9qBrrURfQjFnuEEuk3t8IWnvKrZ89yvNCNgsg1K9CK0wvsR9Mk6DSn+2tIHZNSFxR0ltfzBJq0KAZYSxqHKfZXkYhw8y1R0ifNYTUbQoxc9VaarnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766906302; c=relaxed/simple;
	bh=wUjomdOrfd5ZgflqExNAIeww/pW73AuhIw3AMIuyAAg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=hHhWmdbbbpSgrD37cwyJ1fcWr7WTay4DpgtXLwKbmf0mpmIQWMTMqJs8lLln6g5wHH7PkYJu3BenCre1lMPiFrQHkF7MYJzQCAsWuXDZfs83834oGzu2pjhqyuSMNopqaYGedNgXvAr7B2VFfnjcL5lMQiyUJ+g3QMr7nEsMwDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=fOoX9d8/; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-34e730f5fefso9058982a91.0
        for <linux-gpio@vger.kernel.org>; Sat, 27 Dec 2025 23:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1766906300; x=1767511100; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=252N5LOD/z7LwBxyxlisyd+fqIGSSOErjYjMeeMe2EA=;
        b=fOoX9d8/vHLdJOmFn1XDvkr/T8y/DALPLunOnW46NnM69KhmsnoWaf/txJr1+/4Lho
         S+Tlti3i8CWPyrAREuMnG8TmyPtKOCOsnP2w9lKq6fTfa4MAgDfmYznwuXivwg7hv3SA
         UJV8lwFvDejOvMbtCH2J0Udap7IfzlVyR+phA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766906300; x=1767511100;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=252N5LOD/z7LwBxyxlisyd+fqIGSSOErjYjMeeMe2EA=;
        b=TM5hMJuJ4Vh/TkIFauVDbdpk0MqQ3kJscZSoYrYQaF6OYmybckEgJkdr4PXbVmPmfX
         mMiR9oJWfiZtX3I36McjXQsze4pF/QhQ5lqb3kOE0h6yniPo+73YXxU1gvQttmXlocio
         IVNwXKWc8agRqQVv7NpVwSSoKlRtokThfroHEJz5l+qZFzU8Pio2Z1BEli19HsCi/TcZ
         Puq1OMfNnoQ0fa73NRVcch87B/D5i6kq9JKor1dwRirT2rkazA+R1/DNYvcXs9LNlqwL
         qCKpLUoiOiOpLmcMMrpyK8x0bDhUJuiGl4TZEJCp1bXHmUrhKszgM+v54ngCQl+OYyHp
         vuMg==
X-Forwarded-Encrypted: i=1; AJvYcCXG4csVt+2vSltL7vdppjh/awOsOayX1n61oyfgvLZTlx0oiQmRaE2HrXuOOrnb3V0MGNqu5vg/YaFw@vger.kernel.org
X-Gm-Message-State: AOJu0YzzoORdRX2cpClTNxKBVgKstQcVuVvzWkQ581oBwaFzzTzzvXxu
	ZaDfpEeXK3nxEYoJuuidxmZdQj/o0IDAZ+4c/g/SV+Fm/dn5KuIYRDD9eoti3/P1OcJjh+kHC/D
	FmwjDwGtSQ+oMqybzCfx3rIVRdIFSfogOFTDddzaNVw==
X-Gm-Gg: AY/fxX7XAjW5aMkdz9VmLZUOB8F4NPPu78gGsQ9VzzE2sehPlmJypyyK5/EJUqdPom3
	ayWjcAx4SDsVFlKzy7YI5VxMIFNmish/nT32ovJeZJAr1o8i1r4DcIAJYBqmlH+q2tgI6kGTa34
	tSqX5iKE2CoJiJe5bxTs+99yth0pI0HVvG/o81F6BmEjWkXhBNSEyZhFdhJqf0EmXwnOs3cYBdf
	4lg9XuEe+Epv+TdG+AxMqBqNvr+6aH/8x2VQ2ksF5ZhUy0uQkdo9G6FPiHQdEPdEQyM5MZgNtQE
	ff8zEG2EVqbFlbOcrynqP7amlgNMrIHh9TEfYYRcNQv0iHnUssU7tt5eRcJAdwyNUEu4pu+NN/q
	7HHKRtlirQIUvAxKnaC30NiqBGGwortC8RcB3dXjaMFE7E8tz2+kHz3+iHFShWmtmRKVZjDJFRZ
	guAW2iwnJM2IGuUh4jw4By4GMOHxAhMqHBh0bJ
X-Google-Smtp-Source: AGHT+IEbK4kpv9g62QLB7mDKTlw6sPZp4V2lPskCSFVGHsp9NJ5kiRFGA/HD+tgl7/5x6ESz12YO711hAc+NUp5DPA0=
X-Received: by 2002:a17:90b:1810:b0:34a:b8fc:f1d8 with SMTP id
 98e67ed59e1d1-34e921ec5c8mr25648907a91.37.1766906300127; Sat, 27 Dec 2025
 23:18:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Daniel J Blueman <daniel@quora.org>
Date: Sun, 28 Dec 2025 15:18:09 +0800
X-Gm-Features: AQt7F2oe9Cmi1kiotqwKvDDRPqvwcHiavFmo6eS0XOpPXvZZSwedYiJa20eWkfY
Message-ID: <CAMVG2svCF06KF0e8MDCVGGjxP-FM16UE1Fip-toHUcVs-kqBQA@mail.gmail.com>
Subject: [6.19-rc2 arm64] sleeping while atomic in gpiod_configure_flags
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org
Cc: Linux Kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Linus, Bartosz et al,

When booting 6.19-rc2 [1, 2] with lockdep enabled on a Qualcomm X1
Lenovo Slim7x ARM64 laptop, I am seeing mutex usage while atomic
during gpiod driver registration:

BUG: sleeping function called from invalid context at kernel/locking/mutex.c:591
in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 170, name: kworker/u50:6
preempt_count: 1, expected: 0
6 locks held by kworker/u50:6/170:
#0: ffff000800206d48 ((wq_completion)events_unbound){+.+.}-{0:0}, at:
process_one_work (kernel/workqueue.c:3232)
#1: ffff8000824f3d90 (deferred_probe_work){+.+.}-{0:0}, at:
process_one_work (kernel/workqueue.c:3233)
#2: ffff0008059920e8 (&dev->mutex){....}-{4:4}, at: __device_attach
(drivers/base/dd.c:1007)
#3: ffff0008196a3ee8 (&gdev->srcu){.+.+}-{0:0}, at:
gpiod_direction_output_raw_commit (drivers/gpio/gpiolib.c:2927)
#4: ffff0008197434b8 (&shared_desc->spinlock){....}-{3:3}, at:
gpio_shared_proxy_direction_output (drivers/gpio/gpiolib-shared.h:52
(discriminator 7) drivers/gpio/gpio-shared-proxy.c:181 (discriminator
7)) gpio_shared_proxy
#5: ffff000813758ee8 (&gdev->srcu){.+.+}-{0:0}, at:
gpiod_direction_output_raw_commit (drivers/gpio/gpiolib.c:2927)
irq event stamp: 117306
hardirqs last enabled at (117305): _raw_spin_unlock_irqrestore
(./arch/arm64/include/asm/alternative-macros.h:254
./arch/arm64/include/asm/cpufeature.h:809
./arch/arm64/include/asm/irqflags.h:192
./include/linux/spinlock_api_smp.h:151 kernel/locking/spinlock.c:194)
hardirqs last disabled at (117306): _raw_spin_lock_irqsave
(./include/linux/spinlock_api_smp.h:108 (discriminator 7)
kernel/locking/spinlock.c:162 (discriminator 7))
softirqs last enabled at (117044): handle_softirqs
(./arch/arm64/include/asm/current.h:19
./arch/arm64/include/asm/preempt.h:12 kernel/softirq.c:469
kernel/softirq.c:650)
softirqs last disabled at (117033): __do_softirq (kernel/softirq.c:657)
CPU: 5 UID: 0 PID: 170 Comm: kworker/u50:6 Tainted: G  E 6.19.0-rc2 #4
PREEMPTLAZY
Tainted: [E]=UNSIGNED_MODULE
Hardware name: LENOVO 83ED/LNVNB161216, BIOS NHCN60WW 09/11/2025
Workqueue: events_unbound deferred_probe_work_func
Call trace:
show_stack (arch/arm64/kernel/stacktrace.c:501) (C)
dump_stack_lvl (lib/dump_stack.c:122)
dump_stack (lib/dump_stack.c:130)
__might_resched (kernel/sched/core.c:8828)
__might_sleep (kernel/sched/core.c:8757)
__mutex_lock (kernel/locking/mutex.c:593 kernel/locking/mutex.c:776)
mutex_lock_nested (kernel/locking/mutex.c:829)
 lpi_config_set (drivers/pinctrl/qcom/pinctrl-lpass-lpi.c:296) pinctrl_lpass_lpi
 lpi_gpio_direction_output
(drivers/pinctrl/qcom/pinctrl-lpass-lpi.c:334) pinctrl_lpass_lpi
gpiochip_direction_output (drivers/gpio/gpiolib.c:2830)
gpiod_direction_output_raw_commit (drivers/gpio/gpiolib.c:2973)
gpiod_direction_output_nonotify (drivers/gpio/gpiolib.c:3091)
gpiod_direction_output (drivers/gpio/gpiolib.c:3026 drivers/gpio/gpiolib.c:3019)
 gpio_shared_proxy_direction_output
(drivers/gpio/gpio-shared-proxy.c:188) gpio_shared_proxy
gpiochip_direction_output (drivers/gpio/gpiolib.c:2830)
gpiod_direction_output_raw_commit (drivers/gpio/gpiolib.c:2973)
gpiod_direction_output_nonotify (drivers/gpio/gpiolib.c:3091)
gpiod_configure_flags (drivers/gpio/gpiolib.c:4931)
gpiod_find_and_request (drivers/gpio/gpiolib.c:4752)
gpiod_get_index (drivers/gpio/gpiolib.c:4964)
devm_gpiod_get_index (drivers/gpio/gpiolib-devres.c:102)
devm_gpiod_get (drivers/gpio/gpiolib-devres.c:52)
reset_gpio_probe (drivers/reset/reset-gpio.c:81 (discriminator 1))
auxiliary_bus_probe (drivers/base/auxiliary.c:228 (discriminator 1))
really_probe (drivers/base/dd.c:581 drivers/base/dd.c:659)
__driver_probe_device (drivers/base/dd.c:801)
driver_probe_device (drivers/base/dd.c:831)
__device_attach_driver (drivers/base/dd.c:960)
bus_for_each_drv (drivers/base/bus.c:500)
__device_attach (drivers/base/dd.c:1033)
device_initial_probe (drivers/base/dd.c:1086)
bus_probe_device (drivers/base/bus.c:576)
deferred_probe_work_func (drivers/base/dd.c:125)
process_one_work (./arch/arm64/include/asm/jump_label.h:36
./include/trace/events/workqueue.h:110 kernel/workqueue.c:3262)
worker_thread (kernel/workqueue.c:3334 (discriminator 2)
kernel/workqueue.c:3421 (discriminator 2))
kthread (kernel/kthread.c:463)
ret_from_fork (arch/arm64/kernel/entry.S:861)

=============================
[ BUG: Invalid wait context ]
6.19.0-rc2 #4 Tainted: G W E
-----------------------------
kworker/u50:6/170 is trying to lock:
ffff000820e9fb78 (&pctrl->lock#2){+.+.}-{4:4}, at: lpi_config_set
(drivers/pinctrl/qcom/pinctrl-lpass-lpi.c:296) pinctrl_lpass_lpi
other info that might help us debug this:
context-{5:5}
6 locks held by kworker/u50:6/170:
#0: ffff000800206d48 ((wq_completion)events_unbound){+.+.}-{0:0}, at:
process_one_work (kernel/workqueue.c:3232)
#1: ffff8000824f3d90 (deferred_probe_work){+.+.}-{0:0}, at:
process_one_work (kernel/workqueue.c:3233)
#2: ffff0008059920e8 (&dev->mutex){....}-{4:4}, at: __device_attach
(drivers/base/dd.c:1007)
#3: ffff0008196a3ee8 (&gdev->srcu){.+.+}-{0:0}, at:
gpiod_direction_output_raw_commit (drivers/gpio/gpiolib.c:2927)
#4: ffff0008197434b8 (&shared_desc->spinlock){....}-{3:3}, at:
gpio_shared_proxy_direction_output (drivers/gpio/gpiolib-shared.h:52
(discriminator 7) drivers/gpio/gpio-shared-proxy.c:181 (discriminator
7)) gpio_shared_proxy
#5: ffff000813758ee8 (&gdev->srcu){.+.+}-{0:0}, at:
gpiod_direction_output_raw_commit (drivers/gpio/gpiolib.c:2927)
stack backtrace:
CPU: 5 UID: 0 PID: 170 Comm: kworker/u50:6 Tainted: G W E 6.19.0-rc2
#4 PREEMPTLAZY
Tainted: [W]=WARN, [E]=UNSIGNED_MODULE
Hardware name: LENOVO 83ED/LNVNB161216, BIOS NHCN60WW 09/11/2025
Workqueue: events_unbound deferred_probe_work_func
Call trace:
show_stack (arch/arm64/kernel/stacktrace.c:501) (C)
dump_stack_lvl (lib/dump_stack.c:122)
dump_stack (lib/dump_stack.c:130)
__lock_acquire (kernel/locking/lockdep.c:4832
kernel/locking/lockdep.c:4902 kernel/locking/lockdep.c:5187)
lock_acquire.part.0 (./arch/arm64/include/asm/percpu.h:40
kernel/locking/lockdep.c:470 kernel/locking/lockdep.c:5870)
lock_acquire (kernel/locking/lockdep.c:5872)
__mutex_lock (kernel/locking/mutex.c:616 kernel/locking/mutex.c:776)
mutex_lock_nested (kernel/locking/mutex.c:829)
 lpi_config_set (drivers/pinctrl/qcom/pinctrl-lpass-lpi.c:296) pinctrl_lpass_lpi
 lpi_gpio_direction_output
(drivers/pinctrl/qcom/pinctrl-lpass-lpi.c:334) pinctrl_lpass_lpi
gpiochip_direction_output (drivers/gpio/gpiolib.c:2830)
gpiod_direction_output_raw_commit (drivers/gpio/gpiolib.c:2973)
gpiod_direction_output_nonotify (drivers/gpio/gpiolib.c:3091)
gpiod_direction_output (drivers/gpio/gpiolib.c:3026 drivers/gpio/gpiolib.c:3019)
 gpio_shared_proxy_direction_output
(drivers/gpio/gpio-shared-proxy.c:188) gpio_shared_proxy
gpiochip_direction_output (drivers/gpio/gpiolib.c:2830)
gpiod_direction_output_raw_commit (drivers/gpio/gpiolib.c:2973)
gpiod_direction_output_nonotify (drivers/gpio/gpiolib.c:3091)
gpiod_configure_flags (drivers/gpio/gpiolib.c:4931)
gpiod_find_and_request (drivers/gpio/gpiolib.c:4752)
gpiod_get_index (drivers/gpio/gpiolib.c:4964)
devm_gpiod_get_index (drivers/gpio/gpiolib-devres.c:102)
devm_gpiod_get (drivers/gpio/gpiolib-devres.c:52)
reset_gpio_probe (drivers/reset/reset-gpio.c:81 (discriminator 1))
auxiliary_bus_probe (drivers/base/auxiliary.c:228 (discriminator 1))
really_probe (drivers/base/dd.c:581 drivers/base/dd.c:659)
__driver_probe_device (drivers/base/dd.c:801)
driver_probe_device (drivers/base/dd.c:831)
__device_attach_driver (drivers/base/dd.c:960)
bus_for_each_drv (drivers/base/bus.c:500)
__device_attach (drivers/base/dd.c:1033)
device_initial_probe (drivers/base/dd.c:1086)
bus_probe_device (drivers/base/bus.c:576)
deferred_probe_work_func (drivers/base/dd.c:125)
process_one_work (./arch/arm64/include/asm/jump_label.h:36
./include/trace/events/workqueue.h:110 kernel/workqueue.c:3262)
worker_thread (kernel/workqueue.c:3334 (discriminator 2)
kernel/workqueue.c:3421 (discriminator 2))
kthread (kernel/kthread.c:463)
ret_from_fork (arch/arm64/kernel/entry.S:861)

I can test any changes or get further debug as preferred.

Thanks,
  Daniel

-- [1] full dmesg

https://htmlpreview.github.io/?https://gist.githubusercontent.com/dblueman/7e33be397278677c323b566140968f0d/raw/77058946593fa96a2a063cb3904456d286821de7/linux-6190rc2-lockdep-qualcomm-x1-dmesg.html

-- [2] .config

https://gist.githubusercontent.com/dblueman/7e33be397278677c323b566140968f0d/raw/77058946593fa96a2a063cb3904456d286821de7/linux-6190rc2-lockdep-qualcomm-x1-dmesg.config
--
Daniel J Blueman

