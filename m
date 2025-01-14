Return-Path: <linux-gpio+bounces-14779-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C47A107DB
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2025 14:32:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6DE21888A05
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2025 13:32:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEAA4234CE7;
	Tue, 14 Jan 2025 13:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="tOSH2xHT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3161C5F22
	for <linux-gpio@vger.kernel.org>; Tue, 14 Jan 2025 13:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736861531; cv=none; b=PcLSU5G+FvbfOLsBbAS9y+ho+fm5LfQivVo6SB3CrfDIYPUez495pZ8bRneHfArvGn5vfwbRVAPbrOOVG9nL7KDV9bjUkfyhjxV5Z+vQtVSzAF/M0UVnjhu68VJtapsvEqjWANrOWglBItEsLfReP/C/M29DWnIVOKNZFxRrUX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736861531; c=relaxed/simple;
	bh=C/n5ueEHMAubjla/enKlwcyP9Db0+La1s6xIRdKq9lA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DSlXvFMb9fgfx4IYHWD40EbenHG7fMKC7CtK88aocJGDDiKUqcqTbYi6FlM1CEVN7Zqw+9UosbMP0kfa8qGa9qMCUWoUcjNoabAnzrZChQ+aN6FyNIkNq3SRwXxgBQXUSoV9dkHs2HaXHAuOKGHotyW4NwJO1963ke1kQEZKpK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=tOSH2xHT; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3862a921123so3177202f8f.3
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jan 2025 05:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1736861528; x=1737466328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TlqTUnZXimSv0OpNMeG8KSN6cDTihkE7gFuE8ClySV4=;
        b=tOSH2xHTd4HbCDjcMTlz/6HWT+Cqk/+ZBHwvSHyBA/MkG/Ap52G0zmjOnMW/qOF5EC
         D0p08yvgNO5ehIQflM2mHC/8rEREmPTsrNoRgVc2lXHTmnhhE07JslDiT5OGK5EGXLMQ
         lx7tw56SwXP/OYkakvBHpZ4LbyboSVTKwnnqkW3kkhtZ6IS4FSRbBR0L5WwpskQVuJ2+
         v5beJv8CdE1zBnewnmo3F9y7aQOPMN3bXpGPYD659XMAG2jt7YAS9b2nvHJM5X/EJc0l
         mJVvmx+sDuup909Qg1cdF/sxqQ83v7dzx0pHxTLlEMMpxrLpXOtCFqrJmym+ek3aTOsm
         Y8EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736861528; x=1737466328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TlqTUnZXimSv0OpNMeG8KSN6cDTihkE7gFuE8ClySV4=;
        b=vfSX/maj+dhXIqNsTLOTiYr4Ugx/khTaaAj3zL9DqUsT+iZVACSvvYlgCwSkjg+J63
         MCIfFkNVppG15A+n6jp9FcdDLWdi+Z0p0pD4wjvI/2Alcf651vb+BaZyJMeQY+xWr3vo
         R4e70kPJrzTHYLz4YD12iQAHaSmLFck2COS1xv9geKUVwYwYXad9zhl4LKHzTNlkX1nQ
         tUb5xXKhI61AB5tr9s5I1NnMfg/tjeDXRRWELrf/8kEpdvQyH6l4B7pZkWY6F7kfJNNv
         Dgahlztt0wByYsonqfY2HFAePY0DGNAW3edLECa8V8lG3I2uuBSeUOhiuP1yoQ3+WL36
         P9Yg==
X-Forwarded-Encrypted: i=1; AJvYcCXeDmV/fw0vq+aeVXJTXa732G4oaWAljjYWN+7qAHgyhoxVoIYcQhPle9/MxlgYT89nBj6IUGaCLaWY@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0ylmGjxXNhnsAas1zlcYUwa6EhtwaKQyD/zsZnn2nmqJLzu7L
	OSFl70aIR9ZglhI40AMfPhDs//h/J1//wDC4Z1auctOR/1bHJyROc7hwvcbaNVQ=
X-Gm-Gg: ASbGnctrhqIBPmzdfk/mxIWF9MFS9/4iUCU+WJL4OVGc/facE4lxfeejcqaBwnLlA/W
	PPmPgZowUfegA7xdXQ077oN401B5ZdDfaVLLTR6hCam63zShU9Aaw+QIZ8MebOELvnMvwfDvnQ8
	f3mvrHBI6YoqXcHaUVewCUfgDRJrtafxXB6Bug9ETaLFve6FKdGFXRXq6mOg+dFWY/KNDbVQkC2
	jUabUeCIUdUXmkNu+lWHZOSyee9FC/dfbz+DijmpPBNLFm7Ih+rYZz9
X-Google-Smtp-Source: AGHT+IGX7/UMGlqtT7zZvRfxlsgQa+uEneORt172vk0+CI+jGXB6Xgxav5wRl12bJyoriN3HKN0zhQ==
X-Received: by 2002:a05:6000:4020:b0:385:e3c1:50d5 with SMTP id ffacd0b85a97d-38a87338fa8mr25876636f8f.48.1736861527841;
        Tue, 14 Jan 2025 05:32:07 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:a8b0:e23c:79c1:dc2b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e38c7aesm15154949f8f.53.2025.01.14.05.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 05:32:07 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org,
	Sean Anderson <sean.anderson@linux.dev>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Michal Simek <michal.simek@amd.com>,
	linux-arm-kernel@lists.infradead.org,
	Robert Hancock <hancock@sedsystems.ca>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] gpio: xilinx: Convert gpio_lock to raw spinlock
Date: Tue, 14 Jan 2025 14:32:06 +0100
Message-ID: <173686152290.39040.17367940998093783534.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250110163354.2012654-1-sean.anderson@linux.dev>
References: <20250110163354.2012654-1-sean.anderson@linux.dev>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 10 Jan 2025 11:33:54 -0500, Sean Anderson wrote:
> irq_chip functions may be called in raw spinlock context. Therefore, we
> must also use a raw spinlock for our own internal locking.
> 
> This fixes the following lockdep splat:
> 
> [    5.349336] =============================
> [    5.353349] [ BUG: Invalid wait context ]
> [    5.357361] 6.13.0-rc5+ #69 Tainted: G        W
> [    5.363031] -----------------------------
> [    5.367045] kworker/u17:1/44 is trying to lock:
> [    5.371587] ffffff88018b02c0 (&chip->gpio_lock){....}-{3:3}, at: xgpio_irq_unmask (drivers/gpio/gpio-xilinx.c:433 (discriminator 8))
> [    5.380079] other info that might help us debug this:
> [    5.385138] context-{5:5}
> [    5.387762] 5 locks held by kworker/u17:1/44:
> [    5.392123] #0: ffffff8800014958 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_one_work (kernel/workqueue.c:3204)
> [    5.402260] #1: ffffffc082fcbdd8 (deferred_probe_work){+.+.}-{0:0}, at: process_one_work (kernel/workqueue.c:3205)
> [    5.411528] #2: ffffff880172c900 (&dev->mutex){....}-{4:4}, at: __device_attach (drivers/base/dd.c:1006)
> [    5.419929] #3: ffffff88039c8268 (request_class#2){+.+.}-{4:4}, at: __setup_irq (kernel/irq/internals.h:156 kernel/irq/manage.c:1596)
> [    5.428331] #4: ffffff88039c80c8 (lock_class#2){....}-{2:2}, at: __setup_irq (kernel/irq/manage.c:1614)
> [    5.436472] stack backtrace:
> [    5.439359] CPU: 2 UID: 0 PID: 44 Comm: kworker/u17:1 Tainted: G        W          6.13.0-rc5+ #69
> [    5.448690] Tainted: [W]=WARN
> [    5.451656] Hardware name: xlnx,zynqmp (DT)
> [    5.455845] Workqueue: events_unbound deferred_probe_work_func
> [    5.461699] Call trace:
> [    5.464147] show_stack+0x18/0x24 C
> [    5.467821] dump_stack_lvl (lib/dump_stack.c:123)
> [    5.471501] dump_stack (lib/dump_stack.c:130)
> [    5.474824] __lock_acquire (kernel/locking/lockdep.c:4828 kernel/locking/lockdep.c:4898 kernel/locking/lockdep.c:5176)
> [    5.478758] lock_acquire (arch/arm64/include/asm/percpu.h:40 kernel/locking/lockdep.c:467 kernel/locking/lockdep.c:5851 kernel/locking/lockdep.c:5814)
> [    5.482429] _raw_spin_lock_irqsave (include/linux/spinlock_api_smp.h:111 kernel/locking/spinlock.c:162)
> [    5.486797] xgpio_irq_unmask (drivers/gpio/gpio-xilinx.c:433 (discriminator 8))
> [    5.490737] irq_enable (kernel/irq/internals.h:236 kernel/irq/chip.c:170 kernel/irq/chip.c:439 kernel/irq/chip.c:432 kernel/irq/chip.c:345)
> [    5.494060] __irq_startup (kernel/irq/internals.h:241 kernel/irq/chip.c:180 kernel/irq/chip.c:250)
> [    5.497645] irq_startup (kernel/irq/chip.c:270)
> [    5.501143] __setup_irq (kernel/irq/manage.c:1807)
> [    5.504728] request_threaded_irq (kernel/irq/manage.c:2208)
> 
> [...]

Applied, thanks!

[1/1] gpio: xilinx: Convert gpio_lock to raw spinlock
      commit: 9860370c2172704b6b4f0075a0c2a29fd84af96a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

