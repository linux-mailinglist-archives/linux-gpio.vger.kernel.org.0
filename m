Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDDE350DDB6
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Apr 2022 12:15:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237793AbiDYKSh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Apr 2022 06:18:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236310AbiDYKSf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Apr 2022 06:18:35 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1B2835A8F
        for <linux-gpio@vger.kernel.org>; Mon, 25 Apr 2022 03:15:29 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id g23so10754637edy.13
        for <linux-gpio@vger.kernel.org>; Mon, 25 Apr 2022 03:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZUseZCfMKifoEa5D6gPAjOPxAmseKNfZjI+ANN1hWKA=;
        b=xN1mcgLdS8Dsbu4fb0NAWfjb5zQSOZomJvqSm7qIYj0sSJ83Uu4Tn/rSivmqLDxE0q
         +sVA6jVhEnFHdHekhGKcfJ+uOxnkgPK/cUjEjZ84oL3augNVhysnRLXA0+UwZhGOxyOl
         bmHp9OAEQIvrLAJqiW+kWFFw8IR0lqVwbtLtMDX+UQKrGG/wN9HCPBVanEEZ87kCRmp+
         yT/tsJrN4Cjj1cfy1VPfFPodyiOUK0fJr/lEMg0y+VkocAMVecRZCUMfYMGWZnAW7Cr0
         byFgw2UHxfDOdNCEeYR7zGgZxIpmrqzmbVaqjQEQU6QvSqVddvRBRTeEyTV8RF6v293h
         fdSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZUseZCfMKifoEa5D6gPAjOPxAmseKNfZjI+ANN1hWKA=;
        b=iqWjztuYOgBV+rF2o6I+cFQ/YIi9yifw6YER7LJ/dDsZuyd0nVFTUM0kUsmhHf5XOY
         ZYpKgg7XY0mIhz8guuppEcDakcCczDQ528DNTeVFBv662mdJHaqL0GS9vJtt/lbQfj7j
         UjEhfSysRFjaA5/xvVXWiCDPx2tJsVaxnEmn9Q/Uq7fIPEn7ccVqniFLIZUp2k1Cja9B
         /ZjcjORArzMpfE8DaxgS4z6jyauLpZP2GeBS/Y0MBdUI0dS4XAwf129mYoGPmpDDBcYv
         ruiTYqFyxXy+wHsMp4lPfSeFj+yd+1B5ChTYPVr+uumVcgPAmS2e3/p5IrQ5TiTt5Q6z
         dA3A==
X-Gm-Message-State: AOAM531qv8d9PfLvQrkZUM154EQ++OMolqkZAuDYyjD9gBJ7UZK1+OCz
        y8zk4q6Xdhu2xxxeIqF5yHnrbw79Y7IPvVV10z4znQ==
X-Google-Smtp-Source: ABdhPJwLTBx4/Q88g+QHH0yd1sat4fNWvOXd8gjHc5E2PIUHyeEUX0480EWsccm5/7ZCUqbcQHURieCwOjJN1RBqblk=
X-Received: by 2002:a05:6402:5286:b0:425:f0fb:5d23 with SMTP id
 en6-20020a056402528600b00425f0fb5d23mr1680469edb.243.1650881728489; Mon, 25
 Apr 2022 03:15:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAMRc=Meo4TbdxQzynb7paDgC7J19Tc6hhKU7du4mZvgP0mynTQ@mail.gmail.com>
 <20220419012810.88417-1-schspa@gmail.com>
In-Reply-To: <20220419012810.88417-1-schspa@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 25 Apr 2022 12:15:17 +0200
Message-ID: <CAMRc=MfP=6PD+Qcz_HhjgkCQ__a7tzDNLntWNMWk_e7vr=3qZw@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: use raw spinlock for gpio chip shadowed data
To:     Schspa Shi <schspa@gmail.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Doug Berger <opendmb@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 19, 2022 at 3:28 AM Schspa Shi <schspa@gmail.com> wrote:
>
> In case of PREEMPT_RT, there is a raw_spinlock -> spinlock dependency
> as the lockdep report shows.
>
> __irq_set_handler
>   irq_get_desc_buslock
>     __irq_get_desc_lock
>       raw_spin_lock_irqsave(&desc->lock, *flags);  // raw spinlock get here
>   __irq_do_set_handler
>     mask_ack_irq
>       dwapb_irq_ack
>         spin_lock_irqsave(&gc->bgpio_lock, flags); // sleep able spinlock
>   irq_put_desc_busunlock
>
> Replace with a raw lock to avoid BUGs. This lock is only used to access
> registers, and It's safe to replace with the raw lock without bad
> influence.
>
> [   15.090359][    T1] =============================
> [   15.090365][    T1] [ BUG: Invalid wait context ]
> [   15.090373][    T1] 5.10.59-rt52-00983-g186a6841c682-dirty #3 Not tainted
> [   15.090386][    T1] -----------------------------
> [   15.090392][    T1] swapper/0/1 is trying to lock:
> [   15.090402][    T1] 70ff00018507c188 (&gc->bgpio_lock){....}-{3:3}, at: _raw_spin_lock_irqsave+0x1c/0x28
> [   15.090470][    T1] other info that might help us debug this:
> [   15.090477][    T1] context-{5:5}
> [   15.090485][    T1] 3 locks held by swapper/0/1:
> [   15.090497][    T1]  #0: c2ff0001816de1a0 (&dev->mutex){....}-{4:4}, at: __device_driver_lock+0x98/0x104
> [   15.090553][    T1]  #1: ffff90001485b4b8 (irq_domain_mutex){+.+.}-{4:4}, at: irq_domain_associate+0xbc/0x6d4
> [   15.090606][    T1]  #2: 4bff000185d7a8e0 (lock_class){....}-{2:2}, at: _raw_spin_lock_irqsave+0x1c/0x28
> [   15.090654][    T1] stack backtrace:
> [   15.090661][    T1] CPU: 4 PID: 1 Comm: swapper/0 Not tainted 5.10.59-rt52-00983-g186a6841c682-dirty #3
> [   15.090682][    T1] Hardware name: Horizon Robotics Journey 5 DVB (DT)
> [   15.090692][    T1] Call trace:
> ......
> [   15.090811][    T1]  _raw_spin_lock_irqsave+0x1c/0x28
> [   15.090828][    T1]  dwapb_irq_ack+0xb4/0x300
> [   15.090846][    T1]  __irq_do_set_handler+0x494/0xb2c
> [   15.090864][    T1]  __irq_set_handler+0x74/0x114
> [   15.090881][    T1]  irq_set_chip_and_handler_name+0x44/0x58
> [   15.090900][    T1]  gpiochip_irq_map+0x210/0x644
>
> Signed-off-by: Schspa Shi <schspa@gmail.com>
>
> ---

Applied, thanks!

Bart
