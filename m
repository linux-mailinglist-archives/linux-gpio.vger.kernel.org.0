Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC6CA280001
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Oct 2020 15:23:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732235AbgJANXS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Oct 2020 09:23:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732169AbgJANXP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Oct 2020 09:23:15 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 558DCC0613D0
        for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2020 06:23:15 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id d13so4028186pgl.6
        for <linux-gpio@vger.kernel.org>; Thu, 01 Oct 2020 06:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=QMvUWwpCbcRQWQ/67lZpDcdES3Tgoo1hAu0TKVA+3CU=;
        b=JcvmfdFU26r00kIq3l8tb+NbqO9R1ZBiVqfDQRV1DUXwOUnLXISFCCwGwYekcaYFeE
         Ampei1bHnEoGp4ESwceDSp9hUzwT1OyGtecn39CfrSvHxteavnq0GVhxh9VWmR47txY9
         AGlGrtTf287uB1Zk+8MbmO+CHko+d3AzEKz3I7OjkVC6M1qRoCqfBoA5YE0JdptBes5a
         GXljDHpPLJc4gQlW1NC+jO1Z/M+Yp3EkjOWOtGhsUWvqT/pQdjZ7ThEE5UTh6tpBec8X
         5NmV/9FBdwOnko5QEpsm3xUXscYQsXHlSgT0Yrm2qD4nV25XqftScXxJ43xZcrrFHHm0
         fE6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=QMvUWwpCbcRQWQ/67lZpDcdES3Tgoo1hAu0TKVA+3CU=;
        b=fZjGLEbDuHihhzCOv8gjg0fjqsbC3MrA3Bdpw4f+YjoTIgiLJT5rGgOFUfcS1+3UMh
         Ek7zXIV9eq45oG4jCjZ6Vpq00rXGQYTD2eVYkCHXhFX/w60LUtqUrTjx0InlINvU3kOO
         aUgxAWKQuEq/eYr2CYZFnbHzhDmsPlchnysgVMPtNQRuOeKHECeaYiwRRLC8ZZ617ZCB
         dN/NZazKFIgiwgyPFs+reaRmLwrYHdL7Mpbt3zUqPc4dV0SNA/zBdIePNh3QVc3StJAn
         rI/nxS+Pk6nzf5Yqu1I/wkLbX84aErzMzgHlfHEz4xw+gDB4aOOflvLPjpERXpTTIo2i
         4v3g==
X-Gm-Message-State: AOAM533HYMUkoxw/+hwrmJrVDnZn1bUM1LbeGE+XYAu5pdHZr/0DRyv6
        iBERtuG34YPvH3i6d/4sARYE4yhDO0S0dQ==
X-Google-Smtp-Source: ABdhPJyErk+l+mmIOPOASjYGAmYk5IF/PxLoEMqf52PS+fba8x+lCgnMI1Ygz6OXRdGG20eh8oDwtQ==
X-Received: by 2002:a62:7f0e:0:b029:152:197b:e2bd with SMTP id a14-20020a627f0e0000b0290152197be2bdmr1175738pfd.7.1601558594102;
        Thu, 01 Oct 2020 06:23:14 -0700 (PDT)
Received: from localhost ([2001:e42:102:1532:160:16:113:140])
        by smtp.gmail.com with ESMTPSA id y4sm6824494pfr.46.2020.10.01.06.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2020 06:23:12 -0700 (PDT)
From:   Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date:   Thu, 1 Oct 2020 21:22:58 +0800
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Nehal Shah <Nehal-bakulchandra.Shah@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Any other ways to debug GPIO interrupt controller (pinctrl-amd) for
 broken touchpads of a new laptop model?
Message-ID: <20201001132258.6yzosj2w7k4eod42@Rk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

I'm trying to fix broken touchpads [1] for a new laptop model Legion-5
15ARH05 which is shipped with two different touchpads, i.e., ElAN and
Synaptics. For the ELAN touchpad, the kernel receives no interrupts to
be informed of new data from the touchpad. For the Synaptics touchpad,
only 7 interrupts are received per second which makes the touchpad
completely unusable. Based on current observations, pinctrl-amd seems to
be the most suspicious cause.


Why do I think pinctrl-amd smells the most suspicious?
======================================================

This laptop model has the following hardware configurations specified
via ACPI,
  - The touchpad's data interrupt line is connected to pin#130 of a GPIO
    chip

         GpioInt (Level, ActiveLow, ExclusiveAndWake, PullUp, 0x0000,
                         "\\_SB.GPIO", 0x00, ResourceConsumer, ,
                         )
                         {   // Pin list
                             0x0082
                         }

  - This GPIO chip (HID: AMDI0030) which is assigned with IRQ#7 has its
    common interrupt output line connected to one IO-APIC's pin#7

         Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, )
         {
             0x00000007,
         }

I add some code to kernel to poll the status of the GPIO chip's pin#130
and IO-APIc's pin#7 every 1ms when I move my finger on the surface of
the Synaptics touchpad continuously for about 1s. During the process of I
move my finger, most of the time,
  - GPIO chip's pin#130: low input, interrupt unmasked
  - IO-APIC's pin#7: IRR=0, interrupt unmasked (in fact mask/unmask_ioapic_irq
    have never been called by the IRQ follow controller handle_fasteoi_irq)

So the touchpad has been generating interrupts most of the time while
IO-APIC controller hasn't been masking the interrupt from the GPIO chip.
But somehow the kernel could only get ~7 interrupts each second while
the touchpad could generate 140 interrupts (time resolution of 7.2ms)
per second. Assuming IO-APIC (arch/x86/kernel/apic/io_apic.c) is fine,
then there's something wrong with the GPIO interrupt controller which
works fine for the touchpad under Windows. Besides if I poll the touchpad
data based on pin#130's status, the touchpad could also work under
Windows.

Ways to debug pinctrl-amd
=========================

I can't find any documentation about the AMDI0030 GPIO chip except for
the commit logs of drivers/pinctrl/pinctrl-amd. One commit
ba714a9c1dea85e0bf2899d02dfeb9c70040427c ("pinctrl/amd: Use regular interrupt instead of chained")
inspired me to bring back chained interrupt to see if "an interrupt storm"
would happen. The only change I noticed is that the interrupts arrive in
pairs. The time internal between two interrupts in a pair is ~0.0016s
but the time internal between interrupt pairs is still ~0.12s (~8Hz).
Unfortunately, I don't get any insight about the GPIO interrupt
controller from this tweaking. I wonder if there are any other ways
to debug drivers/pinctrl/pinctrl-amd?

Thank you!


[1] https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1887190

--
Best regards,
Coiby

