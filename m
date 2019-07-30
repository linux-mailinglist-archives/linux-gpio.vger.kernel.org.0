Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30DC879E92
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jul 2019 04:21:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730790AbfG3CV5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Jul 2019 22:21:57 -0400
Received: from mx.socionext.com ([202.248.49.38]:54792 "EHLO mx.socionext.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729020AbfG3CV5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 29 Jul 2019 22:21:57 -0400
Received: from unknown (HELO kinkan-ex.css.socionext.com) ([172.31.9.52])
  by mx.socionext.com with ESMTP; 30 Jul 2019 11:21:54 +0900
Received: from mail.mfilter.local (m-filter-1 [10.213.24.61])
        by kinkan-ex.css.socionext.com (Postfix) with ESMTP id 31EDE180B6E;
        Tue, 30 Jul 2019 11:21:55 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP; Tue, 30 Jul 2019 11:21:55 +0900
Received: from yuzu.css.socionext.com (yuzu [172.31.8.45])
        by kinkan.css.socionext.com (Postfix) with ESMTP id 00E801A04E1;
        Tue, 30 Jul 2019 11:21:55 +0900 (JST)
Received: from [127.0.0.1] (unknown [10.213.132.48])
        by yuzu.css.socionext.com (Postfix) with ESMTP id D373B120C1E;
        Tue, 30 Jul 2019 11:21:54 +0900 (JST)
Date:   Tue, 30 Jul 2019 11:21:54 +0900
From:   Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH 1/5] pinctrl: uniphier: Separate modem group from UART ctsrts group
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Masami Hiramatsu <masami.hiramatsu@linaro.org>,
        Jassi Brar <jaswinder.singh@linaro.org>
In-Reply-To: <CAK7LNARTjBH=bWz3AjTrw2ySVziAH-f4uaYcu51E-ZXk-5zskQ@mail.gmail.com>
References: <1562668156-12927-2-git-send-email-hayashi.kunihiko@socionext.com> <CAK7LNARTjBH=bWz3AjTrw2ySVziAH-f4uaYcu51E-ZXk-5zskQ@mail.gmail.com>
Message-Id: <20190730112153.F396.4A936039@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Mailer: Becky! ver. 2.70 [ja]
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

On Mon, 29 Jul 2019 22:45:01 +0900 <yamada.masahiro@socionext.com> wrote:

> On Tue, Jul 9, 2019 at 7:29 PM Kunihiko Hayashi
> <hayashi.kunihiko@socionext.com> wrote:
> >
> > It depends on the board implementation whether to have each pins of
> > CTS/RTS, and others for modem. So it is necessary to divide current
> > uart_ctsrts group into uart_ctsrts and uart_modem groups.
> >
> > Since the number of implemented pins for modem differs depending
> > on SoC, each uart_modem group also has a different number of pins.
> >
> > Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> > ---
> 
> > diff --git a/drivers/pinctrl/uniphier/pinctrl-uniphier-ld6b.c b/drivers/pinctrl/uniphier/pinctrl-uniphier-ld6b.c
> > index 414ff3a..d1ed5b7 100644
> > --- a/drivers/pinctrl/uniphier/pinctrl-uniphier-ld6b.c
> > +++ b/drivers/pinctrl/uniphier/pinctrl-uniphier-ld6b.c
> > @@ -780,8 +780,10 @@ static const unsigned system_bus_cs5_pins[] = {55};
> >  static const int system_bus_cs5_muxvals[] = {6};
> >  static const unsigned uart0_pins[] = {135, 136};
> >  static const int uart0_muxvals[] = {3, 3};
> > -static const unsigned uart0_ctsrts_pins[] = {137, 138, 139, 140, 141, 124};
> > -static const int uart0_ctsrts_muxvals[] = {3, 3, 3, 3, 3, 3};
> > +static const unsigned uart0_ctsrts_pins[] = {137, 139};
> > +static const int uart0_ctsrts_muxvals[] = {3, 3};
> > +static const unsigned uart0_modem_pins[] = {138, 140, 141, 124};
> 
> Please sort this array
> while you are here.

Thank you for pointing out.
I'll sort it in v2.

> 
> Otherwise, looks good to me.
> 
> 
> 
> 
> 
> 
> --
> Best Regards
> Masahiro Yamada

---
Best Regards,
Kunihiko Hayashi


