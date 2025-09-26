Return-Path: <linux-gpio+bounces-26612-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE24BA3C4D
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Sep 2025 15:10:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 79E5B188F160
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Sep 2025 13:11:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5539D2F5A3E;
	Fri, 26 Sep 2025 13:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dDBnNVCv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A5C24A049
	for <linux-gpio@vger.kernel.org>; Fri, 26 Sep 2025 13:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758892239; cv=none; b=D7Y3HzNZa7LzgIwcUWYEe/4pb52g+kRuiCudlAAfrMi3pOslCCviTg4gZu5Td49gd7qV8FQ5Njiaw01sP8ADfzkVVhJlo4PirbNwCf4DK4fStBVQnkxfhWSPHwhyjzCRTbQIYFRIZkwgess3scJuQnyMEnKj63PEqvOWsIkBUMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758892239; c=relaxed/simple;
	bh=jgH4dTS+vRh3FfWibIxLSPRJHe6hE8/f0y1+VSoVbvo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V5z2a5uip57p/qg2gZRkt1uwrg0GeaF59EWYT2V3ovdYSI+cz7275mY8cz7saQoixJ+dFRwSdn+dTFNWCtHuxHpkSRHCrIXfmmL058B+e2ZpgWE9BH2DAssIytuYcSGXin6P22f6pE61oVHlvI0Mlu4ttF+v6O9orYy3+Lpwayc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dDBnNVCv; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-633be3be1e6so1317808d50.1
        for <linux-gpio@vger.kernel.org>; Fri, 26 Sep 2025 06:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758892235; x=1759497035; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0XGNz+4Fqnv88lNTVrhwM/5oRrCCXevKa00uId3Ku9w=;
        b=dDBnNVCvmLu+xQjX0T5/vW408AErLhg3maQMC8XyQV7ZnCA54GpcAgq4KBr2H9wT5B
         jLbepO4pbQyYLwpiwWkcr3q+vjUr5PtIl0pqCMwmn6Vgljg5wYLea7cOCrmIeLnWhC/d
         t5xjDvbNILh8twlRAcBpyQnYqw0BJkCRBX/QgrIyS0wuubw2fGlshWApGi59GzAY5+VJ
         fmx7Fu90sM8zGfU9UjBcRcVvhJ/lCLZCtk7jdtB0Y6FPfD1qS0aaOBrPoH08yX3tEkKG
         XpYGJ91XeIycWvIvTn2LnIP/yoGv694dLEtLG+aG7a9XOrEBx4qPGw//QBdSeYCeN1i2
         zc7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758892235; x=1759497035;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0XGNz+4Fqnv88lNTVrhwM/5oRrCCXevKa00uId3Ku9w=;
        b=fR8OZYrSLj234hkdUtrZybgrrI/Keg0TRtuk5VTQpLU62hyFmJ03g/ieVgKpOu7LDG
         QW/1+cC1Q8MVZGtJG4+xcJ07x8/e5QQha5nYgHhnLAwFUGqrRb79hf/3pj10q1X5opnB
         bw3CDM0j7Fcau5WNvYc1K0M8ZcGNvqPPLrh6/YdQnM/cMoqaoo4qrXHWqdsNLBp6MqeS
         BFuq9rzSIFadD2TSMMGCUz//iK0W5Kc93YwC5oqofvabMWTvW6uB5ZGk1unBDk5nnYsP
         uR2Q2RQHX7nzVjPGkV/IK+sOaqU9q5kJANGDw0ndleooromyq1zEtpfwq/p3WLQbf37u
         yD9g==
X-Forwarded-Encrypted: i=1; AJvYcCWgm4CiPbZ592AYBBtKXdjg9T6qCh1PCS+8+6c8YAd8sbg9EoXqeSp5rsgM0PlHlpbzI/eFgQiU7C+V@vger.kernel.org
X-Gm-Message-State: AOJu0YxcVsSjsB7jU5/cSGw3WSBDUQv9et28eOmjtviJtX92LIcUAs0e
	58/il/F1T4urlgoA8YueRwkFrRON5bSVX8YS8XtmHDu4E17DcLdaG47nVAp6rGNxmKfxttB1W+1
	EPxB4aU6J/3RLM/ced4fxEhiyzEX57zy+rNxEjG27zw==
X-Gm-Gg: ASbGnctYlWBlr2C1h2pEJKl7sslzYvUV4mrvIqGYzCbW8SKa2prEaQXfl7djW6VyTbd
	V3eU+m3WlFYpU0MatAuHmSvRWC4jkQsLo3NwOc8W+/W1IuhAANiaMhRDp9Cq/j1zmXg/8eofYQO
	tjJbzBzwTsZpcIdL3jqCyvM1/A2yTX5I0dGIHAX8lIJfjb2IoF5VINJxzkCnE3ygiMamfX58/BX
	qpqaySX
X-Google-Smtp-Source: AGHT+IGkqYXp9xR/yu8qAOW0Ibc73J9HH3IrW9JdTv/K6ifqOoFYIjqgN5XEKcNLk7Um94uIi+Xl8oWs/TUkJrI/aIw=
X-Received: by 2002:a05:690e:2501:10b0:636:20c2:8eaf with SMTP id
 956f58d0204a3-63620c2900bmr4822233d50.20.1758892235087; Fri, 26 Sep 2025
 06:10:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250926024847.45814-1-michael@allwinnertech.com>
In-Reply-To: <20250926024847.45814-1-michael@allwinnertech.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 26 Sep 2025 15:09:59 +0200
X-Gm-Features: AS18NWBkn1WQu-sLTFC661ef84KqnjlKinVpbCKO_kBrhPqD4rS5YFEx5E8rC9g
Message-ID: <CAPDyKFpdYhp5Go7_gSh=A0q3kxHs_gcBsUi6wc8sMs5bZW2JFA@mail.gmail.com>
Subject: Re: [PATCH] mmc: core: Fix system shutdown hang in mmc_bus_shutdown
To: Michael Wu <michael@allwinnertech.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, adrian.hunter@intel.com, 
	avri.altman@wdc.com, wsa+renesas@sang-engineering.com, 
	andy-ld.lu@mediatek.com, victor.shih@genesyslogic.com.tw, 
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 26 Sept 2025 at 04:49, Michael Wu <michael@allwinnertech.com> wrote:
>
> During system shutdown, mmc_bus_shutdown() calls __mmc_stop_host() which
> uses cancel_delayed_work_sync(). This can block indefinitely if the work
> queue is stuck, causing the system to hang during shutdown.

Why, more exactly, is it stuck?

I looked at the trace below, it looks like we are failing to remove an
SDIO card, why?

>
> This patch introduces a new function __mmc_stop_host_no_sync() that skips
> the synchronous work cancellation, preventing potential shutdown hangs.
> The function is used in mmc_bus_shutdown() where blocking is not
> acceptable during system shutdown.

This isn't the only thing that can block in mmc_bus_shutdown().

With this change, I am worried that we may execute the
power-off-notifications to an eMMC/SD card, when it's not safe to do
so. But perhaps there is no other way?

Kind regards
Uffe

>
> Changes:
> - Add __mmc_stop_host_no_sync() function that avoids cancel_delayed_work_sync()
> - Update mmc_bus_shutdown() to use the new non-blocking function
> - Keep the original __mmc_stop_host() unchanged for normal operation
>
> This ensures graceful system shutdown while maintaining existing
> functionality for regular MMC host operations.
>
> stack information when an error occurs:
> INFO: task init:1 blocked for more than 720 seconds.
>       Tainted: G           OE     5.15.185-android13-8-00043-gd00fb6bce7ed-ab13792018 #1
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> task:init            state:D stack:    0 pid:    1 ppid:     0 flags:0x04000008
> Call trace:
>  __switch_to+0x234/0x470
>  __schedule+0x694/0xb8c
>  schedule+0x150/0x254
>  schedule_timeout+0x48/0x138
>  wait_for_common+0x144/0x308
>  __flush_work+0x3d8/0x508
>  __cancel_work_timer+0x120/0x2e8
>  mmc_bus_shutdown+0x90/0x158
>  device_shutdown+0x204/0x434
>  kernel_restart+0x54/0x220
>  kernel_restart+0x0/0x220
>  invoke_syscall+0x60/0x150
>  el0_svc_common+0xb8/0xf8
>  do_el0_svc+0x28/0x98
>  el0_svc+0x24/0x84
>  el0t_64_sync_handler+0x88/0xec
>  el0t_64_sync+0x1b8/0x1bc
> INFO: task kworker/1:1:73 blocked for more than 721 seconds.
>       Tainted: G           OE     5.15.185-android13-8-00043-gd00fb6bce7ed-ab13792018 #1
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> task:kworker/1:1     state:D stack:    0 pid:   73 ppid:     2 flags:0x00000008
> Workqueue: events_freezable mmc_rescan.cfi_jt
> Call trace:
>  __switch_to+0x234/0x470
>  __schedule+0x694/0xb8c
>  schedule+0x150/0x254
>  schedule_preempt_disabled+0x2c/0x4c
>  __mutex_lock+0x360/0xb00
>  __mutex_lock_slowpath+0x18/0x28
>  mutex_lock+0x48/0x12c
>  device_del+0x48/0x8d0
>  mmc_remove_card+0x128/0x158
>  mmc_sdio_remove+0x190/0x1ac
>  mmc_sdio_detect+0x7c/0x118
>  mmc_rescan+0xe8/0x42c
>  process_one_work+0x248/0x55c
>  worker_thread+0x3b0/0x740
>  kthread+0x168/0x1dc
>  ret_from_fork+0x10/0x20
>
> Signed-off-by: Michael Wu <michael@allwinnertech.com>
> ---
>  drivers/mmc/core/bus.c  |  2 +-
>  drivers/mmc/core/core.c | 14 ++++++++++++++
>  drivers/mmc/core/core.h |  1 +
>  3 files changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/core/bus.c b/drivers/mmc/core/bus.c
> index 1cf64e0952fbe..6ff6fcb4c6f27 100644
> --- a/drivers/mmc/core/bus.c
> +++ b/drivers/mmc/core/bus.c
> @@ -149,7 +149,7 @@ static void mmc_bus_shutdown(struct device *dev)
>         if (dev->driver && drv->shutdown)
>                 drv->shutdown(card);
>
> -       __mmc_stop_host(host);
> +       __mmc_stop_host_no_sync(host);
>
>         if (host->bus_ops->shutdown) {
>                 ret = host->bus_ops->shutdown(host);
> diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
> index a0e2dce704343..2d75ad26f84a9 100644
> --- a/drivers/mmc/core/core.c
> +++ b/drivers/mmc/core/core.c
> @@ -2336,6 +2336,20 @@ void __mmc_stop_host(struct mmc_host *host)
>         cancel_delayed_work_sync(&host->detect);
>  }
>
> +void __mmc_stop_host_no_sync(struct mmc_host *host)
> +{
> +       if (host->rescan_disable)
> +               return;
> +
> +       if (host->slot.cd_irq >= 0) {
> +               mmc_gpio_set_cd_wake(host, false);
> +               disable_irq(host->slot.cd_irq);
> +       }
> +
> +       host->rescan_disable = 1;
> +       /* Skip cancel_delayed_work_sync to avoid potential blocking */
> +}
> +
>  void mmc_stop_host(struct mmc_host *host)
>  {
>         __mmc_stop_host(host);
> diff --git a/drivers/mmc/core/core.h b/drivers/mmc/core/core.h
> index 622085cd766f9..eb59a61717357 100644
> --- a/drivers/mmc/core/core.h
> +++ b/drivers/mmc/core/core.h
> @@ -71,6 +71,7 @@ static inline void mmc_delay(unsigned int ms)
>  void mmc_rescan(struct work_struct *work);
>  void mmc_start_host(struct mmc_host *host);
>  void __mmc_stop_host(struct mmc_host *host);
> +void __mmc_stop_host_no_sync(struct mmc_host *host);
>  void mmc_stop_host(struct mmc_host *host);
>
>  void _mmc_detect_change(struct mmc_host *host, unsigned long delay,
> --
> 2.29.0
>

