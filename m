Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 073FE79E97
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jul 2019 04:22:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731218AbfG3CWN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Jul 2019 22:22:13 -0400
Received: from mx.socionext.com ([202.248.49.38]:54804 "EHLO mx.socionext.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729020AbfG3CWN (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 29 Jul 2019 22:22:13 -0400
Received: from unknown (HELO kinkan-ex.css.socionext.com) ([172.31.9.52])
  by mx.socionext.com with ESMTP; 30 Jul 2019 11:22:10 +0900
Received: from mail.mfilter.local (m-filter-2 [10.213.24.62])
        by kinkan-ex.css.socionext.com (Postfix) with ESMTP id AB03B180B6E;
        Tue, 30 Jul 2019 11:22:10 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP; Tue, 30 Jul 2019 11:22:10 +0900
Received: from yuzu.css.socionext.com (yuzu [172.31.8.45])
        by kinkan.css.socionext.com (Postfix) with ESMTP id 5B0BA1A04E1;
        Tue, 30 Jul 2019 11:22:10 +0900 (JST)
Received: from [127.0.0.1] (unknown [10.213.132.48])
        by yuzu.css.socionext.com (Postfix) with ESMTP id 37DE9120C1E;
        Tue, 30 Jul 2019 11:22:10 +0900 (JST)
Date:   Tue, 30 Jul 2019 11:22:10 +0900
From:   Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH 4/5] pinctrl: uniphier: Add Pro5 PCIe pin-mux settings
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Masami Hiramatsu <masami.hiramatsu@linaro.org>,
        Jassi Brar <jaswinder.singh@linaro.org>
In-Reply-To: <CAK7LNAT7irhQWdMkKsY9E8Qwgvwqobs8GF1Mvmoe9wfTqVE4nA@mail.gmail.com>
References: <1562668156-12927-5-git-send-email-hayashi.kunihiko@socionext.com> <CAK7LNAT7irhQWdMkKsY9E8Qwgvwqobs8GF1Mvmoe9wfTqVE4nA@mail.gmail.com>
Message-Id: <20190730112209.F398.4A936039@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Mailer: Becky! ver. 2.70 [ja]
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

On Mon, 29 Jul 2019 22:46:02 +0900 <yamada.masahiro@socionext.com> wrote:

> On Tue, Jul 9, 2019 at 7:29 PM Kunihiko Hayashi
> <hayashi.kunihiko@socionext.com> wrote:
> >
> > Pro5 PCIe interface uses the following pins:
> >     XPERST, XPEWAKE, XPECLKRQ
> >
> > Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> > ---
> >  drivers/pinctrl/uniphier/pinctrl-uniphier-pro5.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/pinctrl/uniphier/pinctrl-uniphier-pro5.c b/drivers/pinctrl/uniphier/pinctrl-uniphier-pro5.c
> > index 1d418e3..577f12e 100644
> > --- a/drivers/pinctrl/uniphier/pinctrl-uniphier-pro5.c
> > +++ b/drivers/pinctrl/uniphier/pinctrl-uniphier-pro5.c
> > @@ -855,6 +855,8 @@ static const unsigned usb1_pins[] = {126, 127};
> >  static const int usb1_muxvals[] = {0, 0};
> >  static const unsigned usb2_pins[] = {128, 129};
> >  static const int usb2_muxvals[] = {0, 0};
> > +static const unsigned pcie_pins[] = {109, 110, 111};
> > +static const int pcie_muxvals[] = {0, 0, 0};
> 
> Please keep the alphabetical sorting.

I made mistake in adding it.
Okay, I'll sort it including below in v2.

> >  static const unsigned int gpio_range_pins[] = {
> >         89, 90, 91, 92, 93, 94, 95, 96,         /* PORT0x */
> >         97, 98, 99, 100, 101, 102, 103, 104,    /* PORT1x */
> > @@ -925,6 +927,7 @@ static const struct uniphier_pinctrl_group uniphier_pro5_groups[] = {
> >         UNIPHIER_PINCTRL_GROUP(usb0),
> >         UNIPHIER_PINCTRL_GROUP(usb1),
> >         UNIPHIER_PINCTRL_GROUP(usb2),
> > +       UNIPHIER_PINCTRL_GROUP(pcie),
> 
> Ditto.
> 
> >         UNIPHIER_PINCTRL_GROUP_GPIO(gpio_range),
> >  };
> >
> > @@ -957,6 +960,7 @@ static const char * const uart3_groups[] = {"uart3"};
> >  static const char * const usb0_groups[] = {"usb0"};
> >  static const char * const usb1_groups[] = {"usb1"};
> >  static const char * const usb2_groups[] = {"usb2"};
> > +static const char * const pcie_groups[] = {"pcie"};
> >
> >  static const struct uniphier_pinmux_function uniphier_pro5_functions[] = {
> >         UNIPHIER_PINMUX_FUNCTION(emmc),
> > @@ -979,6 +983,7 @@ static const struct uniphier_pinmux_function uniphier_pro5_functions[] = {
> >         UNIPHIER_PINMUX_FUNCTION(usb0),
> >         UNIPHIER_PINMUX_FUNCTION(usb1),
> >         UNIPHIER_PINMUX_FUNCTION(usb2),
> > +       UNIPHIER_PINMUX_FUNCTION(pcie),
> 
> Ditto.
> 
> 
> 
> >  };
> >
> >  static int uniphier_pro5_get_gpio_muxval(unsigned int pin,
> > --
> > 2.7.4
> >
> 
> 
> --
> Best Regards
> Masahiro Yamada

---
Best Regards,
Kunihiko Hayashi


