Return-Path: <linux-gpio+bounces-17111-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA03A4FE68
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 13:16:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BDEA71888DE4
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 12:16:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA49C245033;
	Wed,  5 Mar 2025 12:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="u0X1SoDr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E753F205E0B
	for <linux-gpio@vger.kernel.org>; Wed,  5 Mar 2025 12:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741176952; cv=none; b=YH2QKallbTyzznhNN2ET74SDaIftanMimy53MrTTAbPi/29NiRlBZ9BlJcmjm2sEpuyY/E8HXINTOgahMIlQcpK2l/lzHloaZulpUZ1RAZf0YF/VaiL7anzvig8juOh030P72lampdtHvZelRjB3ely5xWp2wwo/iS7WBhlDX5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741176952; c=relaxed/simple;
	bh=v5VN0g2CJE82VhBGa6AxOCe3g3zhdg2n0niq+it5f6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WZZj9vzV9zGz0Y1xtpXBF+vBp7CDKeVnxarpWf5MDQtCwOmCzycJgJf3qEM8Jzcskq2vYbbMaQbsKYT4Pk9j5Eowa6zZH9fY+GKazUhr9MLGQYHUk0Y1OFzenaMGZkxwofxfrXARMVy6myb3Uf3LDPL2yo2C08H1v3kVsr7W8iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=u0X1SoDr; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43bc0b8520cso21339165e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 05 Mar 2025 04:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741176949; x=1741781749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BM6itYwhagxx2QRfXmJQSynU85dj8uyDPoe0oqhy1Yk=;
        b=u0X1SoDr1LXRdxrtAoelxooQYtRgnmQ0gVxeE5B3Sh/V5u1y1Q3Ayos6QIhRgkRk4P
         pugM+PU+1HEKKJLJCsZeK2WOdxRDHo9BILVDgySnv87VpnaUKJRQRjX27w1n080KMy4m
         rqht/UcFLKW6yRIO1FKmv3tJQ1oxpyGwDSRKp34sm+jX4uSr1wzxju+3/HT61clM6PXu
         yeG7bgPN5gqUtqXq5ACuRjyIutsdmMcmSO33VL/ucRmBGymXD57+wJ+g35PPaa8rfc7a
         7JzQUCNC30fm9fB+kPAqqTCEQpWyGHtODp7E0dUZObhW5M47uEHBlKb6cWLv9VRFn6Xv
         mOBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741176949; x=1741781749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BM6itYwhagxx2QRfXmJQSynU85dj8uyDPoe0oqhy1Yk=;
        b=wercYymB3yKfch9YdZVk+cbtvdSfkqYKyctFmW6Y05ILVphAMmuhGj9RuOk8Z3fPaA
         4NPX9Zwj3XU/BpjKVqFg9q+kWEeTNGzsmRsfMKwSPi526PvnspLuP/R42HP1vTd9j4Q5
         eUtWK6MKrAfMBeOrW1DaoYCVdydPs96y18qu5Vdz808OBHfa5zYvXRKjXdd0CTQTg9lI
         RS0lsNM+jdmeGjfhesC46v50X14Tp1vCysWj9utio7NLiAcsnEXlcoUi7Qvo+6V9WIl0
         fMC1XaPMCg1Ok4ArMZHdwZR9bFH7X5wjjVL8qLiP0KscA6desIkFEKvmtNcXQNRSiq6i
         vbAg==
X-Forwarded-Encrypted: i=1; AJvYcCUIlFgTMiIZTXzEtyE6DumAKgWim2forewSB2XlPosXAg6GsmQjHc03bIn2oKKuX7oIWm+9V/6bHYGJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyC0cv7HjKPIYAv9mFZvRl7lJbx/GKWJAq3q3JO+dqSSYYjSmqW
	B9NVTkzby891N77lRz1lvPHCurSv5O6KOpMinNdy8NO6M5pK2DCC4uDWgDxYToA=
X-Gm-Gg: ASbGnctKreMsrj0Xc62HG2IICfTuV1L+RmbBQcyqoYzD8nTpv/oTm8FaPpaVhvkjUZE
	5qz1/npk9gaI1ak6758KbwTgF0dNXp7pZ64cG9FWzvC2LzwZ+95HTpz4GWnNwJstrWat6B5AsN5
	lCPO7vpXGeBK5pWVH2sUSleGKVEW4V65Ww7bKhdiiM7DbqnAiqCWgS2sNKl5sAXocTjyZPNrE3R
	2+YNzLONebD+ncfu1+jxIeSlv9HTqgJkAyXL9HYtr3S2rSsSqzPqGyFcuiCMb31MupO+fZdeoAk
	Sg2yemF/vsfyCC53UKYma3Ar/jDa0aXxLiJbNl56zglt
X-Google-Smtp-Source: AGHT+IH5RfWTgST5qLkCs6Rz4XGjY9rY+LfHAoLcQzdtQiMJZKyVtDKB32hsLtqW4IEXyOcIA0d54A==
X-Received: by 2002:a05:600c:1d01:b0:43b:c9a8:8fab with SMTP id 5b1f17b1804b1-43bd2ae025fmr19781605e9.19.1741176948927;
        Wed, 05 Mar 2025 04:15:48 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:e514:53b3:5af8:e408])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bd426c01bsm16061945e9.2.2025.03.05.04.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 04:15:48 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] gpio: rcar: Use raw_spinlock to protect register access
Date: Wed,  5 Mar 2025 13:15:43 +0100
Message-ID: <174117687651.61264.2181182249374483578.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250121135833.3769310-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250121135833.3769310-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 21 Jan 2025 14:58:33 +0100, Niklas Söderlund wrote:
> Use raw_spinlock in order to fix spurious messages about invalid context
> when spinlock debugging is enabled. The lock is only used to serialize
> register access.
> 
>     [    4.239592] =============================
>     [    4.239595] [ BUG: Invalid wait context ]
>     [    4.239599] 6.13.0-rc7-arm64-renesas-05496-gd088502a519f #35 Not tainted
>     [    4.239603] -----------------------------
>     [    4.239606] kworker/u8:5/76 is trying to lock:
>     [    4.239609] ffff0000091898a0 (&p->lock){....}-{3:3}, at: gpio_rcar_config_interrupt_input_mode+0x34/0x164
>     [    4.239641] other info that might help us debug this:
>     [    4.239643] context-{5:5}
>     [    4.239646] 5 locks held by kworker/u8:5/76:
>     [    4.239651]  #0: ffff0000080fb148 ((wq_completion)async){+.+.}-{0:0}, at: process_one_work+0x190/0x62c
>     [    4.250180] OF: /soc/sound@ec500000/ports/port@0/endpoint: Read of boolean property 'frame-master' with a value.
>     [    4.254094]  #1: ffff80008299bd80 ((work_completion)(&entry->work)){+.+.}-{0:0}, at: process_one_work+0x1b8/0x62c
>     [    4.254109]  #2: ffff00000920c8f8
>     [    4.258345] OF: /soc/sound@ec500000/ports/port@1/endpoint: Read of boolean property 'bitclock-master' with a value.
>     [    4.264803]  (&dev->mutex){....}-{4:4}, at: __device_attach_async_helper+0x3c/0xdc
>     [    4.264820]  #3: ffff00000a50ca40 (request_class#2){+.+.}-{4:4}, at: __setup_irq+0xa0/0x690
>     [    4.264840]  #4:
>     [    4.268872] OF: /soc/sound@ec500000/ports/port@1/endpoint: Read of boolean property 'frame-master' with a value.
>     [    4.273275] ffff00000a50c8c8 (lock_class){....}-{2:2}, at: __setup_irq+0xc4/0x690
>     [    4.296130] renesas_sdhi_internal_dmac ee100000.mmc: mmc1 base at 0x00000000ee100000, max clock rate 200 MHz
>     [    4.304082] stack backtrace:
>     [    4.304086] CPU: 1 UID: 0 PID: 76 Comm: kworker/u8:5 Not tainted 6.13.0-rc7-arm64-renesas-05496-gd088502a519f #35
>     [    4.304092] Hardware name: Renesas Salvator-X 2nd version board based on r8a77965 (DT)
>     [    4.304097] Workqueue: async async_run_entry_fn
>     [    4.304106] Call trace:
>     [    4.304110]  show_stack+0x14/0x20 (C)
>     [    4.304122]  dump_stack_lvl+0x6c/0x90
>     [    4.304131]  dump_stack+0x14/0x1c
>     [    4.304138]  __lock_acquire+0xdfc/0x1584
>     [    4.426274]  lock_acquire+0x1c4/0x33c
>     [    4.429942]  _raw_spin_lock_irqsave+0x5c/0x80
>     [    4.434307]  gpio_rcar_config_interrupt_input_mode+0x34/0x164
>     [    4.440061]  gpio_rcar_irq_set_type+0xd4/0xd8
>     [    4.444422]  __irq_set_trigger+0x5c/0x178
>     [    4.448435]  __setup_irq+0x2e4/0x690
>     [    4.452012]  request_threaded_irq+0xc4/0x190
>     [    4.456285]  devm_request_threaded_irq+0x7c/0xf4
>     [    4.459398] ata1: link resume succeeded after 1 retries
>     [    4.460902]  mmc_gpiod_request_cd_irq+0x68/0xe0
>     [    4.470660]  mmc_start_host+0x50/0xac
>     [    4.474327]  mmc_add_host+0x80/0xe4
>     [    4.477817]  tmio_mmc_host_probe+0x2b0/0x440
>     [    4.482094]  renesas_sdhi_probe+0x488/0x6f4
>     [    4.486281]  renesas_sdhi_internal_dmac_probe+0x60/0x78
>     [    4.491509]  platform_probe+0x64/0xd8
>     [    4.495178]  really_probe+0xb8/0x2a8
>     [    4.498756]  __driver_probe_device+0x74/0x118
>     [    4.503116]  driver_probe_device+0x3c/0x154
>     [    4.507303]  __device_attach_driver+0xd4/0x160
>     [    4.511750]  bus_for_each_drv+0x84/0xe0
>     [    4.515588]  __device_attach_async_helper+0xb0/0xdc
>     [    4.520470]  async_run_entry_fn+0x30/0xd8
>     [    4.524481]  process_one_work+0x210/0x62c
>     [    4.528494]  worker_thread+0x1ac/0x340
>     [    4.532245]  kthread+0x10c/0x110
>     [    4.535476]  ret_from_fork+0x10/0x20
> 
> [...]

Applied, thanks!

[1/1] gpio: rcar: Use raw_spinlock to protect register access
      commit: f02c41f87cfe61440c18bf77d1ef0a884b9ee2b5

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

