Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B22415745C
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2020 13:16:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727518AbgBJMQy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Feb 2020 07:16:54 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:33092 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727490AbgBJMQy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Feb 2020 07:16:54 -0500
Received: by mail-lj1-f195.google.com with SMTP id y6so6909847lji.0
        for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2020 04:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5eNKpJ2fOcGBtGtaR8Z4oVHkb0yJESxOKFA1w5bh9mI=;
        b=c4g/qmSJa+Zgs+tSzZ3ZyL/oTotOrfULMTCq28gIA0dCPIk6IMicB0Xdx1KXC0vHYX
         72e3w63wcv++46B4aggJMG906r2Eq+FocNhKmUpJB8iXNaCjGZEZH8ayiC1+jfBb8XoM
         RhB5NgbXoJsMfbSjUc7nJyDL1tmfVTvfi0rQ4ZABt70Bwvm1ijpW3wjpcnldrhxVZ5ON
         13uzzmW+HcRijNOakWc2VAa7hfY2cKIHmjlF6GEacp3Ia1zdJb5UgVEfv0ala0R9IWKw
         oDsbmTa2nIF4meyGlF90+niDgxTmBImsbWjlrblZVL7fogD54a56l5yPmV4s8S0G4YWZ
         jIXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5eNKpJ2fOcGBtGtaR8Z4oVHkb0yJESxOKFA1w5bh9mI=;
        b=E849nb4QGaQS1gISzCoQPufm9FLhVw9G/wps7uhuZipFKK0jRsWsv8MX2uGfgK/woC
         S6ybXwnnT37ul40/hTWUGQ3TJFGMRBdUiIYoQkREbqdiM/SYYLZNsKVZPSiz20YEmpe8
         9VOQfjb+6TVEB758kDieMO6NN61NX+GWTrvTzhNFcoR5uV6v9EevxmLBlrLdYU6E290E
         moGB8bNpDMr65FEDULAbk/P26gvDP61OgD7i0TTDzQ7r7s0FzGug1HCth2PtAKHzWy/A
         2Ps6C/Ph6HbZRINFGOgRIxaF5+FkbCoojs9m7Uj5QF/1jorIXEeB3gEvF7ueMu07njAs
         XFcQ==
X-Gm-Message-State: APjAAAWZfhpBT4WG8IQnTwicnxJhMGSHLkQ4WitHxJlDkGGo2iM6nxCA
        ZnDxXAGtx5YS+BEJ0vP/IuKBWUqL0FvVkGZxFd83gQ==
X-Google-Smtp-Source: APXvYqzchaI6Ddw8rsOxi5Vl/xPWG4XzJNN6ePO5E7X7GzlxqdBVj/iltqYp7aDCuyqtYEEnbSvJYrZLpfE4pup6RD8=
X-Received: by 2002:a05:651c:1bb:: with SMTP id c27mr759792ljn.277.1581337012690;
 Mon, 10 Feb 2020 04:16:52 -0800 (PST)
MIME-Version: 1.0
References: <20200121183748.68662-1-swboyd@chromium.org>
In-Reply-To: <20200121183748.68662-1-swboyd@chromium.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 10 Feb 2020 13:16:41 +0100
Message-ID: <CACRpkdY_bB2Y5Y-ShW2YRAsRb4TQ2vQPagwtjEsMMqeCO1-sNw@mail.gmail.com>
Subject: Re: [PATCH] spmi: pmic-arb: Set lockdep class for hierarchical irq domains
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Brian Masney <masneyb@onstation.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 21, 2020 at 7:37 PM Stephen Boyd <swboyd@chromium.org> wrote:

> I see the following lockdep splat in the qcom pinctrl driver when
> attempting to suspend the device.
>
>  WARNING: possible recursive locking detected
>  5.4.11 #3 Tainted: G        W
>  --------------------------------------------
>  cat/3074 is trying to acquire lock:
>  ffffff81f49804c0 (&irq_desc_lock_class){-.-.}, at: __irq_get_desc_lock+0x64/0x94
>
>  but task is already holding lock:
>  ffffff81f1cc10c0 (&irq_desc_lock_class){-.-.}, at: __irq_get_desc_lock+0x64/0x94
>
>  other info that might help us debug this:
>   Possible unsafe locking scenario:
>
>         CPU0
>         ----
>    lock(&irq_desc_lock_class);
>    lock(&irq_desc_lock_class);
>
>   *** DEADLOCK ***
>
>   May be due to missing lock nesting notation
>
>  6 locks held by cat/3074:
>   #0: ffffff81f01d9420 (sb_writers#7){.+.+}, at: vfs_write+0xd0/0x1a4
>   #1: ffffff81bd7d2080 (&of->mutex){+.+.}, at: kernfs_fop_write+0x12c/0x1fc
>   #2: ffffff81f4c322f0 (kn->count#337){.+.+}, at: kernfs_fop_write+0x134/0x1fc
>   #3: ffffffe411a41d60 (system_transition_mutex){+.+.}, at: pm_suspend+0x108/0x348
>   #4: ffffff81f1c5e970 (&dev->mutex){....}, at: __device_suspend+0x168/0x41c
>   #5: ffffff81f1cc10c0 (&irq_desc_lock_class){-.-.}, at: __irq_get_desc_lock+0x64/0x94
>
>  stack backtrace:
>  CPU: 5 PID: 3074 Comm: cat Tainted: G        W         5.4.11 #3
>  Hardware name: Google Cheza (rev3+) (DT)
>  Call trace:
>   dump_backtrace+0x0/0x174
>   show_stack+0x20/0x2c
>   dump_stack+0xc8/0x124
>   __lock_acquire+0x460/0x2388
>   lock_acquire+0x1cc/0x210
>   _raw_spin_lock_irqsave+0x64/0x80
>   __irq_get_desc_lock+0x64/0x94
>   irq_set_irq_wake+0x40/0x144
>   qpnpint_irq_set_wake+0x28/0x34
>   set_irq_wake_real+0x40/0x5c
>   irq_set_irq_wake+0x70/0x144
>   pm8941_pwrkey_suspend+0x34/0x44
>   platform_pm_suspend+0x34/0x60
>   dpm_run_callback+0x64/0xcc
>   __device_suspend+0x310/0x41c
>   dpm_suspend+0xf8/0x298
>   dpm_suspend_start+0x84/0xb4
>   suspend_devices_and_enter+0xbc/0x620
>   pm_suspend+0x210/0x348
>   state_store+0xb0/0x108
>   kobj_attr_store+0x14/0x24
>   sysfs_kf_write+0x4c/0x64
>   kernfs_fop_write+0x15c/0x1fc
>   __vfs_write+0x54/0x18c
>   vfs_write+0xe4/0x1a4
>   ksys_write+0x7c/0xe4
>   __arm64_sys_write+0x20/0x2c
>   el0_svc_common+0xa8/0x160
>   el0_svc_handler+0x7c/0x98
>   el0_svc+0x8/0xc
>
> Set a lockdep class when we map the irq so that irq_set_wake() doesn't
> warn about a lockdep bug that doesn't exist.
>
> Fixes: 12a9eeaebba3 ("spmi: pmic-arb: convert to v2 irq interfaces to support hierarchical IRQ chips")
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Brian Masney <masneyb@onstation.org>
> Cc: Lina Iyer <ilina@codeaurora.org>
> Cc: Maulik Shah <mkshah@codeaurora.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Applied for fixes in the GPIO tree!

Thanks
Linus Walleij
