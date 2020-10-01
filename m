Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27F8D2808E4
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Oct 2020 22:57:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726980AbgJAU5y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Oct 2020 16:57:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726964AbgJAU5y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Oct 2020 16:57:54 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FD07C0613D0
        for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2020 13:57:54 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id b12so268080lfp.9
        for <linux-gpio@vger.kernel.org>; Thu, 01 Oct 2020 13:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yJpxvYn1IrtmCi0NVGi17cbaBYZa6Ea+eC4qwV9pROE=;
        b=N3JSbbiWBYA3ciB7pXH8DzIrSgsk6SxtanyGwVCJxGhIJJDG0xOMEs/YgrlucdOMER
         xse64H7PwRCg7yscuPhXLvqM6RNcqE+tCMPuJW3iCMZH0fXysWHVrc3SoLB9UCjvhzy8
         6h00ttaiFCrUoJqVqD7X3CbcpFAmB5gHSl8+XmlgUGHv0zRmbA13jvzP4vOeydQwcEck
         mKMHpBpwTmde5De0BPo++tU2QEZQqTXXyjo0u3cfLQN/nEPrnKN4gdx73OdojtleSEdW
         Ys6RTdtRMNECoNu0Js41FPAOhexQn5yFxOcbdVXzKDk3Zqy/4uW17zanyoSnOQfcFvRW
         ABqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yJpxvYn1IrtmCi0NVGi17cbaBYZa6Ea+eC4qwV9pROE=;
        b=qWvd0wlN+hUcSQhEUWIejV3ePNXA3IujbwrAlHg9obZU/VfLe979N1PLUzY2S8IESt
         3Yekdq+9qs+d+pJjld7eI4lj1VRkacyEuOiRLfXaZgmXiVVAKYtd810t88LK8Sxr8J6Q
         /SA/I1i6WAUPtrLxVAe/JFGoCBMNOUQsGtO7BzFvb90OuV2XEBo/wKNpoxBOnRBu/TF/
         XVLF96KQ0/FNUxDF0kD8LriwDfZow+LfPr0JBlHBksQ3GR1wZTIjPeYFBX6XW35IUf2J
         VBR6/KFTgh/WvKdi0Ss6ExEqDbcTA80Qr7Mw0wdruPBUJTAf542xHSVYdt2Nopn/0UjT
         D5wQ==
X-Gm-Message-State: AOAM533fnq/g+1BebF8V5K9vr0FnmcqbWrqjScQjf9XjkkbcLEItbtAz
        ByrLt15EDZpHKWzZVfWP6P/weqehLXyiszzVglqE9Q==
X-Google-Smtp-Source: ABdhPJySA1o73ty3X+zuWJhNuGrt5ymHqSEkGbgQV6agFl/KAS6qzyCLKZdzl62L/zDnrErHfaG7dXyaLRpBpHzp/jQ=
X-Received: by 2002:a19:6c2:: with SMTP id 185mr3057711lfg.441.1601585872623;
 Thu, 01 Oct 2020 13:57:52 -0700 (PDT)
MIME-Version: 1.0
References: <20201001132258.6yzosj2w7k4eod42@Rk>
In-Reply-To: <20201001132258.6yzosj2w7k4eod42@Rk>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 1 Oct 2020 22:57:40 +0200
Message-ID: <CACRpkdYvaC_DUJW+nvmofhhHieDYAiREBog6rn5iS=J4moAtZg@mail.gmail.com>
Subject: Re: Any other ways to debug GPIO interrupt controller (pinctrl-amd)
 for broken touchpads of a new laptop model?
To:     Coiby Xu <coiby.xu@gmail.com>, Hans de Goede <hdegoede@redhat.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Nehal Shah <Nehal-bakulchandra.Shah@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Sorry for top posting, but I want to page some people.

I do not know anything about ACPI, but Hans de Goede is really
good with this kind of things and could possibly provide some
insight.

Yours,
Linus Walleij

On Thu, Oct 1, 2020 at 3:23 PM Coiby Xu <coiby.xu@gmail.com> wrote:
>
> Hi,
>
> I'm trying to fix broken touchpads [1] for a new laptop model Legion-5
> 15ARH05 which is shipped with two different touchpads, i.e., ElAN and
> Synaptics. For the ELAN touchpad, the kernel receives no interrupts to
> be informed of new data from the touchpad. For the Synaptics touchpad,
> only 7 interrupts are received per second which makes the touchpad
> completely unusable. Based on current observations, pinctrl-amd seems to
> be the most suspicious cause.
>
>
> Why do I think pinctrl-amd smells the most suspicious?
> ======================================================
>
> This laptop model has the following hardware configurations specified
> via ACPI,
>   - The touchpad's data interrupt line is connected to pin#130 of a GPIO
>     chip
>
>          GpioInt (Level, ActiveLow, ExclusiveAndWake, PullUp, 0x0000,
>                          "\\_SB.GPIO", 0x00, ResourceConsumer, ,
>                          )
>                          {   // Pin list
>                              0x0082
>                          }
>
>   - This GPIO chip (HID: AMDI0030) which is assigned with IRQ#7 has its
>     common interrupt output line connected to one IO-APIC's pin#7
>
>          Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, )
>          {
>              0x00000007,
>          }
>
> I add some code to kernel to poll the status of the GPIO chip's pin#130
> and IO-APIc's pin#7 every 1ms when I move my finger on the surface of
> the Synaptics touchpad continuously for about 1s. During the process of I
> move my finger, most of the time,
>   - GPIO chip's pin#130: low input, interrupt unmasked
>   - IO-APIC's pin#7: IRR=0, interrupt unmasked (in fact mask/unmask_ioapic_irq
>     have never been called by the IRQ follow controller handle_fasteoi_irq)
>
> So the touchpad has been generating interrupts most of the time while
> IO-APIC controller hasn't been masking the interrupt from the GPIO chip.
> But somehow the kernel could only get ~7 interrupts each second while
> the touchpad could generate 140 interrupts (time resolution of 7.2ms)
> per second. Assuming IO-APIC (arch/x86/kernel/apic/io_apic.c) is fine,
> then there's something wrong with the GPIO interrupt controller which
> works fine for the touchpad under Windows. Besides if I poll the touchpad
> data based on pin#130's status, the touchpad could also work under
> Windows.
>
> Ways to debug pinctrl-amd
> =========================
>
> I can't find any documentation about the AMDI0030 GPIO chip except for
> the commit logs of drivers/pinctrl/pinctrl-amd. One commit
> ba714a9c1dea85e0bf2899d02dfeb9c70040427c ("pinctrl/amd: Use regular interrupt instead of chained")
> inspired me to bring back chained interrupt to see if "an interrupt storm"
> would happen. The only change I noticed is that the interrupts arrive in
> pairs. The time internal between two interrupts in a pair is ~0.0016s
> but the time internal between interrupt pairs is still ~0.12s (~8Hz).
> Unfortunately, I don't get any insight about the GPIO interrupt
> controller from this tweaking. I wonder if there are any other ways
> to debug drivers/pinctrl/pinctrl-amd?
>
> Thank you!
>
>
> [1] https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1887190
>
> --
> Best regards,
> Coiby
>
