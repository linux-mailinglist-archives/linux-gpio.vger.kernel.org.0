Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 425A65E9A8E
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Sep 2022 09:38:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234082AbiIZHir (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Sep 2022 03:38:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233416AbiIZHiq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Sep 2022 03:38:46 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F9B829826
        for <linux-gpio@vger.kernel.org>; Mon, 26 Sep 2022 00:38:45 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id z13-20020a7bc7cd000000b003b5054c6f9bso6386277wmk.2
        for <linux-gpio@vger.kernel.org>; Mon, 26 Sep 2022 00:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=iszbgWp+XMy4E/1Fqaw0VvMuVcvOlJ2rp3ekiASDHJc=;
        b=YOou8AySocycsI7Np6RjW55+2oLY8WOCSybWG/iYtcDrTf/tBU2WB5sHlC852NhMHy
         uHW2SxZa51yTaLCn3qRhlQMRbGQzOvKsu+/XJOzMPnoaf8tVVc/VxtWKJF51XrpMivSw
         x5QadKJwp7iVZTwmJO4YuqyyCQgDIPz6LJc6pNnFbKiGnBum7QKA5eBKyEMw6RA/DgNq
         YLB02CXUn4dmwVUIwwACLDsD1NJqOOwMpwXQaJW2fEHd5xpRpfxBvpd24Xmgi8DIkiQX
         GyYJuWUjFoJgs0wDbyw0h+I/TAvZ3b8zMAT8+qJX2enix4/ViSbQTZEHy1X96BAlRXGr
         UqbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=iszbgWp+XMy4E/1Fqaw0VvMuVcvOlJ2rp3ekiASDHJc=;
        b=xXpRWfE7Hg6QrDIJJysMb+dQkzv53gLN8a3JDTtxQr2Ag6dU7u9iiu/L6mqCae0bAN
         F6snGr+slwSITgUVDtSqJKViGucjXKvME/5nMOlo7fD3S7FmG6MdRz5kstGJfi30JoFQ
         AvLIx/Kpk+ACZZTxlzNWawHmThHnAiLa508ywIwqwA2TfqaLujp2OxOP++seoQZ4/9ge
         GK00RW5ADt7tnc6WGOqK//1y5eStXZ7ExpG89ET9kjkrd1D/xuxRdYBcnxKn3MxWL1A3
         6gSWN+mMbLPzLygPsKokxxrwLO8phz71v+k3jZAi2aMWnMyVaFibpSKfvc0sj8vP5NHV
         ZPtg==
X-Gm-Message-State: ACrzQf2Zp9h3e2e1b7I+SfJGUiLPy6w8wAq+tvGY4NvOm+Jlr1oHZlwN
        gDaF16lQa8D03p94pCuqLk/aNWO55BsG4lIMFCC6uQJdSsQ=
X-Google-Smtp-Source: AMsMyM4BBX3eEIMBCTD1q0iEZpqaQUCLBZ2gbTsIsicgqoiL+eK4qdHLRPfRoG0zMEPaMp0wA/I0bkN1LtSiPE0U5Cw=
X-Received: by 2002:a05:600c:1caa:b0:3a8:4066:981d with SMTP id
 k42-20020a05600c1caa00b003a84066981dmr21051372wms.54.1664177923562; Mon, 26
 Sep 2022 00:38:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220826080230.1712978-1-weiyongjun1@huawei.com>
 <CAMRc=Mc-m7JfDqM3ALy43T+S9DdpV8boEy+J6ruQZjLkqbZHPw@mail.gmail.com> <557e3d18-057c-f787-d422-d54f6e4be36f@huawei.com>
In-Reply-To: <557e3d18-057c-f787-d422-d54f6e4be36f@huawei.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 26 Sep 2022 09:38:32 +0200
Message-ID: <CAMRc=MeNJAgkaD6P4t6=0hy4F7Mkw_Jyg_X5QJ5C3em9cW4iOw@mail.gmail.com>
Subject: Re: [PATCH -next 0/2] allow gpio simulator be used as interrupt controller
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 26, 2022 at 8:57 AM Wei Yongjun <weiyongjun1@huawei.com> wrote:
>
>
>
> On 2022/9/1 0:08, Bartosz Golaszewski wrote:
> > On Fri, Aug 26, 2022 at 9:44 AM Wei Yongjun <weiyongjun1@huawei.com> wrote:
> >>
> >> This series allow gpio simulator be used as interrupt controller, the use
> >> case is mockup some device which using GPIO as interrupt controller, such
> >> as mcp2515 CAN device. With the dts [1], we can mockup a mcp2515 device,
> >> and trigger irq by following commands:
> >>
> >>  $ echo pull-down > /sys/bus/gpio/devices/gpiochip0/sim_gpio0/pull
> >>  $ echo pull-up > /sys/bus/gpio/devices/gpiochip0/sim_gpio0/pull
> >>
> >>
> >> --[1]---------------------------------------------------------
> >> /dts-v1/;
> >>
> >> #include <dt-bindings/interrupt-controller/irq.h>
> >>
> >> / {
> >>         clk24m: clk24m {
> >>                 compatible = "fixed-clock";
> >>                 clock-output-names = "clk24m";
> >>                 clock-frequency = <24000000>;
> >>                 #clock-cells = <0>;
> >>         };
> >>
> >>         gpio-sim {
> >>                 compatible = "gpio-simulator";
> >>
> >>                 bank0: bank0 {
> >>                         gpio-controller;
> >>                         #gpio-cells = <2>;
> >>                         ngpios = <16>;
> >>
> >>                         interrupt-controller;
> >>                         #interrupt-cells = <2>;
> >>
> >>                         line_b-hog {
> >>                                 gpio-hog;
> >>                                 gpios = <0 1>;
> >>                                 input;
> >>                                 line-name = "irq-sim";
> >>                         };
> >
> > Why do you need this hog? The GPIO will be marked as requested once
> > the interrupt is taken by the driver.
>
> Sorry for reply later.
>
> It seems that only if driver request gpio with fwnode_gpiod_get_index()
> marks GPIO as request one.
>
> If driver using request_threaded_irq() request one irq, the requested
> status will not be marked. We need to use hog or request by userspace
> to mark as requested.
>

Right, of course. Thanks.

> >
> >>                 };
> >>         };
> >>
> >>         spi: spi {
> >>                 compatible = "spi-mockup";
> >>
> >>                 #address-cells = <1>;
> >>                 #size-cells = <0>;
> >>
> >>                 can0: can@1 {
> >>                         compatible = "microchip,mcp2515";
> >>                         reg = <1>;
> >>                         clocks = <&clk24m>;
> >>                         interrupt-parent = <&bank0>;
> >>                         interrupts = <0 IRQ_TYPE_EDGE_BOTH>;
> >>                 };
> >>
> >>         };
> >> };
> >> ------------------------------><-----------------------------
> >>
> >> Wei Yongjun (2):
> >>   genirq/irq_sim: Allow both one and two cell bindings
> >>   gpio: sim: make gpio simulator can be used as interrupt controller
> >>
> >>  drivers/gpio/gpio-sim.c | 2 +-
> >>  kernel/irq/irq_sim.c    | 1 +
> >>  2 files changed, 2 insertions(+), 1 deletion(-)
> >>
> >> --
> >> 2.34.1
> >>
> >
> > Can you add some info about this to the documentation?
>

Ok, I'll wait for v2.

And you can drop the -next prefix too, it doesn't fix anything in next.

Bart

> Will do that
>
> Thanks,
> Wei Yongjun
