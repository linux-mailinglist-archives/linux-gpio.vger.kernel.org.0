Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85FB9DA638
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2019 09:18:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727729AbfJQHSp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Oct 2019 03:18:45 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:46610 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726208AbfJQHSp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Oct 2019 03:18:45 -0400
Received: by mail-lj1-f196.google.com with SMTP id d1so1328532ljl.13
        for <linux-gpio@vger.kernel.org>; Thu, 17 Oct 2019 00:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=hSXKTq2k1WdNjLga2XVFjSkFq3trw/2sXWpj5OjgM5k=;
        b=B6ZJaxDrKALUj4wti1RvLF+Th9kOUkZKKkx/KE2iIY70qt2kjLMHVOWlvLf3fcRIFU
         Lp6gbUPqdGjz1x89Rn/jC6bzMfA+yg+CCU+o6bkdzB1HA0wlIBzicPoFeB21S5E4bMt6
         v+XIshdQQb8s5A6CMAn790AUH026Ai95/78HDObD5G8lHclrY0HxEKTqC1IiaqFER0Lb
         BpNczUCvov4yr50y9g2V4o1TskofCKseSAGMgKUoRGoAD8329Qx40ZDqpPKgqrjpoGUM
         T+imwNW4sVTEGbbIsRNWRt7lPKwk4/cMf0eFy6X8sq3z6AmLGftFCN4SlI1qkfcY1sKT
         5oRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=hSXKTq2k1WdNjLga2XVFjSkFq3trw/2sXWpj5OjgM5k=;
        b=BL5PtO2OWtiOvJpeeRNix35IYec7LVybjhI66kYHWMPIp3cD5li0st4LZdbAbNUW46
         0+Sh3JTdPOzRQTfzoEXhIzaM3od31hZMLq2CBaVcBa2cC0XhZG4bvSi9vFaE9TQ1e96u
         s4i72kXZsSh0roXoBVDtaxI90PVjjXc321qSqGjtUWTYfoLnyV0Oxl9TI0oQc2tNEY2f
         olV5dd6zqfiAZDQvajIJ4GrYVQSR3VJnxVcIESYlAkzLGERj5e0Sue833WClsfHoOzWK
         77RBmD9omcmPPIPBgmnBA9m7zv/ypZEgjetYDte1twBAbuUQuqfiOeBky+925wXzAPsE
         0wMg==
X-Gm-Message-State: APjAAAXGQHmtMciThGRxSh/RmK0rDKGJ7w8w3we0qO6/9fKWPXWo2eph
        Co9VmxWaGvT5MDNcnBoUfkCsgzPB0LyDJAofLg6ylb52ERE=
X-Google-Smtp-Source: APXvYqwzOKErt4wziOULA8kqzMDkDiJRR0fAJOjUmr0JbKc9signWOenacf4MVoKrYQlhIyxaC1XTXbu3a5oHPsNOxc=
X-Received: by 2002:a2e:964c:: with SMTP id z12mr1383464ljh.79.1571296723380;
 Thu, 17 Oct 2019 00:18:43 -0700 (PDT)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 17 Oct 2019 09:18:32 +0200
Message-ID: <CACRpkdb_iv9Ywpddu1AiG+b+AMC7LUcnPRjf7yPHnt78JNDtuQ@mail.gmail.com>
Subject: [GIT PULL] GPIO fixes for v5.4 take two
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

here are some GPIO fixes, pertaining to Intel SoCs.

Details in the signed tag as usual.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 4f5cafb5cb8471e54afdc9054d973535614f7675:

  Linux 5.4-rc3 (2019-10-13 16:37:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/gpio-v5.4-3

for you to fetch changes up to 75e99bf5ed8fa74bc80d693d8e0a24eeaa38202b:

  gpio: lynxpoint: set default handler to be handle_bad_irq()
(2019-10-15 01:19:05 +0200)

----------------------------------------------------------------
GPIO fixes for the v5.4 series

The fixes pertain to a problem with initializing the Intel GPIO
irqchips when adding gpiochips, Andy fixed it up elegantly by
adding a hardware initialization callback to the struct
gpio_irq_chip so let's use this. Tested and verified on the
target hardware.

----------------------------------------------------------------
Andy Shevchenko (6):
      gpio: merrifield: Restore use of irq_base
      gpiolib: Initialize the hardware with a callback
      gpio: intel-mid: Move hardware initialization to callback
      gpio: lynxpoint: Move hardware initialization to callback
      gpio: merrifield: Move hardware initialization to callback
      gpio: lynxpoint: set default handler to be handle_bad_irq()

 drivers/gpio/gpio-intel-mid.c  |  9 ++++++---
 drivers/gpio/gpio-lynxpoint.c  | 10 ++++++----
 drivers/gpio/gpio-merrifield.c |  9 ++++++---
 drivers/gpio/gpiolib.c         | 22 +++++++++++++++++++++-
 include/linux/gpio/driver.h    |  8 ++++++++
 5 files changed, 47 insertions(+), 11 deletions(-)
