Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FD9C3B9F42
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jul 2021 12:48:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231296AbhGBKur (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Jul 2021 06:50:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230205AbhGBKup (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Jul 2021 06:50:45 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAEEAC061762;
        Fri,  2 Jul 2021 03:48:13 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id d12so8617922pfj.2;
        Fri, 02 Jul 2021 03:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wqwnhxtlglmAaYDzAvIsZkFyCWaBTFBNCUfpNfqLrZ0=;
        b=D72A7EA7Mof5xwMYOMtlb0QUoBUtL1xO8IM69Zdfn0zQG6dICqWSvNh0ROuXm5MeFz
         kcCvQN0xq49HVe7s+XCHYcSLdK9IHPwx3rZg0xCreCFjZmiA3H5goegVJzgWrH5XVI7r
         ChkMVzj5ChB7UG3qPsLyu0cYfrVqn8HPyansr8kdjDFCoVzm+hKiZb3DzaCY627+JOsA
         mezoMBIQ9tsoZq68WzI7MRfKNa9hXx7CTK4hz6Wo9ChJeblJ/Yig4zj+vC85te05uQHq
         4FVrFaHywg3NO1u5ePjhRzyzA4nNPidcIdATWn0oz7MR57eelbxRqR0cxkgsAHhol1b8
         57eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wqwnhxtlglmAaYDzAvIsZkFyCWaBTFBNCUfpNfqLrZ0=;
        b=RHB+JG9bmMvykadm29IeZte3vBETqhUdse2FsmsOPGYtaePSj+hcL/WAM92Ft/dfoN
         0oguOQk3lD6UZcrw3G7hSWMSen8GqhQJkICF/D5KS38uPWZjR00DT87V8aeO+JMeCbtQ
         BdYMKbu+m7U4T7N/dhrxUEBvLcebyXe3tDIDO8GdJHlTzzmn8MJHHTrxx43xnMO7+iHh
         STSnhKKa3RQak9U3Q6x5voSzGgU82qhpSpq5QGPisPMzzINt7xN3iEroLZvXFbw58PX4
         VvqPXhmV7Z3dbG2Q0U7t/hU/EZ+rVF6hX/0inuhfIJINeLQef+0L9dpqmpj+qboZbSSV
         9ihQ==
X-Gm-Message-State: AOAM531OnmYpAH93T8NBO+EXrk7QxJCBmjBmeokEvI6B5VxEHaAvAjuC
        06213bRc2DskaJg8eG+7rt0=
X-Google-Smtp-Source: ABdhPJxoqC8ogJRAGTTK0sO9M9jE1RbLlempRGYZJfyu3bRhaF2p36xY/kCOCShjdhGjpeWomBZp1w==
X-Received: by 2002:a63:7d15:: with SMTP id y21mr1091004pgc.352.1625222893288;
        Fri, 02 Jul 2021 03:48:13 -0700 (PDT)
Received: from localhost.lan (p1284205-ipngn14601marunouchi.tokyo.ocn.ne.jp. [153.205.193.205])
        by smtp.gmail.com with ESMTPSA id j2sm3248394pfb.53.2021.07.02.03.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jul 2021 03:48:12 -0700 (PDT)
Received: from localhost (localhost [IPv6:::1])
        by localhost.lan (Postfix) with ESMTPSA id 611A69008F8;
        Fri,  2 Jul 2021 10:48:10 +0000 (GMT)
Date:   Fri, 2 Jul 2021 10:48:10 +0000
From:   Vincent Pelletier <plr.vincent@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: gpiochip_lock_as_irq on pins without FLAG_REQUESTED: bug or
 feature ?
Message-ID: <20210702104810.581438d0@gmail.com>
In-Reply-To: <CACRpkdY4bU=bEAyA5ZCx7PVF7nKoPSR7iv6x0t-QM6Bc6bc99Q@mail.gmail.com>
References: <CAF78GY0jB_oeKgfZc4SHWBVusGnNfxKk5jTC4UBDsteSEVEzTw@mail.gmail.com>
        <CACRpkdY4bU=bEAyA5ZCx7PVF7nKoPSR7iv6x0t-QM6Bc6bc99Q@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 2 Jul 2021 02:09:17 +0200, Linus Walleij <linus.walleij@linaro.org> wrote:
> The basic reason is that gpiochips and irqchips are orthogonal.
> You can request an IRQ on a GPIO line without requesting the
> GPIO line for anything else.
> 
> This is also used when drivers want to inspect the state of a GPIO
> line (read the value) while the same line triggers IRQs. This is
> perfectly legal. An extreme example is:
> drivers/media/cec/platform/cec-gpio/cec-gpio.c

Interesting, thank you very much.

> On Mon, Jun 28, 2021 at 5:37 AM Vincent Pelletier <plr.vincent@gmail.com> wrote:
> > Also, I notice that both gpiochip_hierarchy_add_domain and
> > gpiochip_reqres_irq call gpiochip_lock_as_irq, and I am surprised I do not
> > get any error about this: in my understanding only the first call on a given pin
> > should succeed, but with my WARN_ON I am seeing both stack traces and
> > no other warning.  
> 
> Hm that may be a subtle bug.
> 
> The state is just a bool so the first to leave will turn out the lights
> for whoever is left in the room :P

Actually my question came from yet another misunderstanding on my side:
I expected this function to act as an exclusive access control (because
of the "lock" in the name), but I then realised my assumption is wrong.

So while this could be a subtle bug indeed (irq_disable without
irq_shutdown is not the exact same state as right after irq_startup),
it's likely not the one I'm chasing - if it leads to any actual issue
at all.

Regards,
-- 
Vincent Pelletier
GPG fingerprint 983A E8B7 3B91 1598 7A92 3845 CAC9 3691 4257 B0C1
