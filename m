Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6898D34074C
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Mar 2021 14:57:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230010AbhCRN5A (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Mar 2021 09:57:00 -0400
Received: from mail.thorsis.com ([92.198.35.195]:60956 "EHLO mail.thorsis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229849AbhCRN4o (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 18 Mar 2021 09:56:44 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.thorsis.com (Postfix) with ESMTP id 8CECD1C61
        for <linux-gpio@vger.kernel.org>; Thu, 18 Mar 2021 14:56:43 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
        by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id VZSbH-4I-ats for <linux-gpio@vger.kernel.org>;
        Thu, 18 Mar 2021 14:56:43 +0100 (CET)
Received: by mail.thorsis.com (Postfix, from userid 109)
        id 6522D4E5; Thu, 18 Mar 2021 14:56:43 +0100 (CET)
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NO_RECEIVED,
        NO_RELAYS autolearn=unavailable autolearn_force=no version=3.4.2
Date:   Thu, 18 Mar 2021 14:56:37 +0100 (CET)
From:   Alexander Dahl <ada@thorsis.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Message-ID: <1236506597.11463.1616075798037@seven.thorsis.com>
In-Reply-To: <CAHp75Vftrq66SweYKYprWBoi9X8csxe9ROaMorRFUjGSD8gNSQ@mail.gmail.com>
References: <946021874.11132.1615900079722@seven.thorsis.com>
 <CAHp75Vf05NN0dXUrMSOXBRuYRnQRHO_92itZ3ndOyX1oERWt=g@mail.gmail.com>
 <CAHp75VczovYQB70HVEmDA=xfTBcNuSm2f8x9Mnbj0P0Z4UHRMQ@mail.gmail.com>
 <854891727.11376.1616061014891@seven.thorsis.com>
 <CAHp75Vftrq66SweYKYprWBoi9X8csxe9ROaMorRFUjGSD8gNSQ@mail.gmail.com>
Subject: Re: setting gpio-line-names in dts for sama5d2 SoC
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Originating-Client: open-xchange-appsuite
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Andy,

> Andy Shevchenko <andy.shevchenko@gmail.com> hat am 18.03.2021 13:40 geschrieben:
> You may look into the commit
> 7cba1a4d5e16 ("gpiolib: generalize devprop_gpiochip_set_names() for
> device properties")
> which unifies the logic, but at the same time removed one comment:
> 
> -       /* If the chip defines names itself, these take precedence */

Well, that could be added again. And if that precedence stays as is, it should be documented in the gpio devicetree bindings to not cause further confusion?

> So, logic was that for a long time. And unfortunately I don't see how
> we may change this without breakage. This backs us to the discussion
> if the name of the line is ABI or not.

I want to point out one point for consideration. There's usually a difference between the SoC and the boards using that SoC. So those pins are all the same from the chips point of view and the default names are set in a driver related to the chip (family).  However the line names set in device tree are probably related to a board.  Obviously different boards may have different line names, even when using the same SoC.

In other words: if I design a new board, there's no interface I would break, at least not from the userspace point of view just looking at the line names, or is there?

Thanks for looking into this.

Greets
Alex
