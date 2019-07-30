Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4D9C79E94
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jul 2019 04:22:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731204AbfG3CWH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Jul 2019 22:22:07 -0400
Received: from mx.socionext.com ([202.248.49.38]:54799 "EHLO mx.socionext.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729020AbfG3CWH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 29 Jul 2019 22:22:07 -0400
Received: from unknown (HELO iyokan-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 30 Jul 2019 11:22:05 +0900
Received: from mail.mfilter.local (m-filter-1 [10.213.24.61])
        by iyokan-ex.css.socionext.com (Postfix) with ESMTP id 1313860629;
        Tue, 30 Jul 2019 11:22:06 +0900 (JST)
Received: from 172.31.9.53 (172.31.9.53) by m-FILTER with ESMTP; Tue, 30 Jul 2019 11:22:06 +0900
Received: from yuzu.css.socionext.com (yuzu [172.31.8.45])
        by iyokan.css.socionext.com (Postfix) with ESMTP id DF57040370;
        Tue, 30 Jul 2019 11:22:05 +0900 (JST)
Received: from [127.0.0.1] (unknown [10.213.132.48])
        by yuzu.css.socionext.com (Postfix) with ESMTP id BE93B120C1E;
        Tue, 30 Jul 2019 11:22:05 +0900 (JST)
Date:   Tue, 30 Jul 2019 11:22:05 +0900
From:   Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH 2/5] pinctrl: uniphier: Add another audio I/O pin-mux settings for LD20
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Masami Hiramatsu <masami.hiramatsu@linaro.org>,
        Jassi Brar <jaswinder.singh@linaro.org>
In-Reply-To: <CAK7LNASuNMij8Fttup6T6hd=vyKSEu=B7HCPMAezWK6T2b0Gfg@mail.gmail.com>
References: <1562668156-12927-3-git-send-email-hayashi.kunihiko@socionext.com> <CAK7LNASuNMij8Fttup6T6hd=vyKSEu=B7HCPMAezWK6T2b0Gfg@mail.gmail.com>
Message-Id: <20190730112205.F397.4A936039@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Mailer: Becky! ver. 2.70 [ja]
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

On Mon, 29 Jul 2019 22:44:27 +0900 <yamada.masahiro@socionext.com> wrote:

> On Tue, Jul 9, 2019 at 7:29 PM Kunihiko Hayashi
> <hayashi.kunihiko@socionext.com> wrote:
> >
> > This adds support for pinmux settings of aout1b groups. This group includes
> > aout1 signals derived from xirq pins.
> >
> > Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> > ---
> >  drivers/pinctrl/uniphier/pinctrl-uniphier-ld20.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/pinctrl/uniphier/pinctrl-uniphier-ld20.c b/drivers/pinctrl/uniphier/pinctrl-uniphier-ld20.c
> > index 28e54b3..2c66e70 100644
> > --- a/drivers/pinctrl/uniphier/pinctrl-uniphier-ld20.c
> > +++ b/drivers/pinctrl/uniphier/pinctrl-uniphier-ld20.c
> > @@ -544,6 +544,8 @@ static const struct pinctrl_pin_desc uniphier_ld20_pins[] = {
> >
> >  static const unsigned aout1_pins[] = {137, 138, 139, 140, 141, 142};
> >  static const int aout1_muxvals[] = {0, 0, 0, 0, 0, 0};
> > +static const unsigned aout1b_pins[] = {150, 151, 152, 153, 154, 155, 156};
> > +static const int aout1b_muxvals[] = {1, 1, 1, 1, 1, 1, 1};
> >  static const unsigned aoutiec1_pins[] = {135, 136};
> >  static const int aoutiec1_muxvals[] = {0, 0};
> >  static const unsigned int emmc_pins[] = {19, 20, 21, 22, 23, 24, 25};
> > @@ -664,6 +666,7 @@ static const unsigned int gpio_range2_pins[] = {
> >
> >  static const struct uniphier_pinctrl_group uniphier_ld20_groups[] = {
> >         UNIPHIER_PINCTRL_GROUP(aout1),
> > +       UNIPHIER_PINCTRL_GROUP(aout1b),
> >         UNIPHIER_PINCTRL_GROUP(aoutiec1),
> >         UNIPHIER_PINCTRL_GROUP(emmc),
> >         UNIPHIER_PINCTRL_GROUP(emmc_dat8),
> > @@ -708,6 +711,7 @@ static const struct uniphier_pinctrl_group uniphier_ld20_groups[] = {
> >  };
> >
> >  static const char * const aout1_groups[] = {"aout1"};
> > +static const char * const aout1b_groups[] = {"aout1b"};
> 
> If this has the same functionality as "aout1",
> shouldn't it be a part of aout1_groups?

Indeed.
I'll merge "aout1b" with aout1_groups.

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


