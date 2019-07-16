Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 073AA6B161
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jul 2019 23:52:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728681AbfGPVwd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jul 2019 17:52:33 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:35782 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728587AbfGPVwd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jul 2019 17:52:33 -0400
Received: by mail-lf1-f65.google.com with SMTP id p197so14832000lfa.2
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jul 2019 14:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sChX2tjZXXzFm/FF0+gISHJ8+I30zgl6h1ocaPpSr4w=;
        b=TVDnEiknWAcRrVYjpkVEp+7UlZza/YL/doDnWkXLRwGqJ9YS6xQoSpx94TtYwkM0Zm
         9JcQMIFbg+AGr5yblr8fIfyWGtAiWjIILXfM7IITLcHbJNA9fCyb6PLAg+BasgvkoPqY
         mOu8Q8JEY5ecE/Co/dtC9Acv0384Ahf5uv5clQz+i59KnETYFC1wsz8UK5PiDYs/T9n1
         cgi/EyRXEgBnePqIEVvybyK+Lmko4rVlZEkLGBTQU7Ct2fceE6jFBcW+cy4RZHOvyaT4
         yK6DJECW1VMyuUV4EO4RpgP01Zcz3GnzbCKe0KHKjUI5P8ZOseBMqWLKAA5U3ku+AEek
         v3mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sChX2tjZXXzFm/FF0+gISHJ8+I30zgl6h1ocaPpSr4w=;
        b=lkLUoCY6OzrrzfBEkFL4x+taxCYRjx4u3oNqWWMfPlvys48sgY3xuPhhMjm4AfKFm1
         inVA8iexcAgnUinJbxEM9BCmY09JWkZMHpLBgk+WU3W+Ku802xHdepJeJgpCRu3TqG+5
         8NehynnH0KRH0jS8ttfrJLW7wJ7UVFyD6fUgqAVrMUjFaiR7w4RD+Jpf7d9XrgMeT2jP
         gvEOI7HvtqQ6xO6FIdbXPlb/pteIe5D9fmQz70VgEBZSIRIk9BE4iiZfZkN3/tU3OEPg
         dF2cxW0qQ2OZtnAfx+OfBZWY8+No8Lz4MhpwdQzYhrRCHqCB8Ie68f1hLDRlcC7L3vAB
         U+0g==
X-Gm-Message-State: APjAAAVxjCJ1zJ9n6lCtmZETSdloTxfS+z87GqOnoJ50MYKdAF2+wDDc
        t2bBjLdEBvyK6rjKIgBrWlQjb0gIdr+VJLolry6LAA==
X-Google-Smtp-Source: APXvYqxF5LGbIM5rW+0/RUz7xG/c4ekdZJIfr+EH8zBCsdrd9zerb9uo3Zsk8A9BlRzj6R313IgBGYMpeLNcjo9YvBk=
X-Received: by 2002:a19:6a01:: with SMTP id u1mr15820032lfu.141.1563313950958;
 Tue, 16 Jul 2019 14:52:30 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000a55d7d058d51ad4f@google.com>
In-Reply-To: <000000000000a55d7d058d51ad4f@google.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 16 Jul 2019 23:52:19 +0200
Message-ID: <CACRpkdYbuJ_yJ+UKtvWrkmBCbQzfk-1mn1-A836dkNMrmTtZow@mail.gmail.com>
Subject: Re: WARNING in gpio_to_desc
To:     syzbot <syzbot+cf35b76f35e068a1107f@syzkaller.appspotmail.com>,
        Johan Hovold <johan@kernel.org>,
        Vincent Cuissard <cuissard@marvell.com>
Cc:     Andrey Konovalov <andreyknvl@google.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 10, 2019 at 1:07 PM syzbot
<syzbot+cf35b76f35e068a1107f@syzkaller.appspotmail.com> wrote:

> HEAD commit:    7829a896 usb-fuzzer: main usb gadget fuzzer driver
(...)
>   __gpio_set_value include/asm-generic/gpio.h:104 [inline]
>   gpio_set_value include/linux/gpio.h:71 [inline]
>   nfcmrvl_chip_halt+0x4e/0x70 drivers/nfc/nfcmrvl/main.c:259
>   nfcmrvl_nci_register_dev+0x2d4/0x378 drivers/nfc/nfcmrvl/main.c:176
>   nfcmrvl_probe+0x4e9/0x5e0 drivers/nfc/nfcmrvl/usb.c:344

This bug is somewhere in the drivers/nfc/nfcmrvl* code handling
GPIOs.

It should be converted to GPIO descriptors and fixed up, see
drivers/gpio/TODO for details on how to do this.

Johan/Vincent, tell me if you want me to forward the full fuzzing
robot crash dump.

Yours,
Linus Walleij
