Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA8E724D1DD
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Aug 2020 11:59:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728004AbgHUJ7V (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Aug 2020 05:59:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:50508 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727101AbgHUJ7V (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 21 Aug 2020 05:59:21 -0400
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EE3EB207DE;
        Fri, 21 Aug 2020 09:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598003960;
        bh=6lh8v9cVemjT3jBDnziS64+IY43tdAd2MM8ArvnEnwM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Ev1rZxl06IyNhyRTd512c7nq3kdnBRla8UaI7zrC2WUIRmGGgrMDbwH7srGmRZGH9
         aKO0NgPfw7FnEVDbq7DFFz7AcQ4dWx8s4LLiI7zxxMhYHKYMf7U5zDN+b1cxahHNgp
         evmtydnMCZd6oTiMclBS8UdhVcGEfuaqX5AM591E=
Received: by mail-il1-f171.google.com with SMTP id p18so893087ilm.7;
        Fri, 21 Aug 2020 02:59:19 -0700 (PDT)
X-Gm-Message-State: AOAM531UlI5rGo8bExLj5oiBm7RvURW2H8WXrUA02Cgx2b8URYjIXzu/
        Yz4NQSyBe5v4vmrIKp38pqQhhfYbiESbzlyCDfg=
X-Google-Smtp-Source: ABdhPJziEDnmhrGq8OhVozQdRjzD6EAFpspHY6IqaLQmfT7wM+TItD6CZ20HooROnMXmdFEF8mxdFEgqxtTlvKeOEFM=
X-Received: by 2002:a92:db47:: with SMTP id w7mr1978701ilq.264.1598003959218;
 Fri, 21 Aug 2020 02:59:19 -0700 (PDT)
MIME-Version: 1.0
References: <1597739776-15944-1-git-send-email-light.hsieh@mediatek.com>
 <CAGp9Lzo31FPCQ5PMyA7wAgB_pGM3bZbxP84XYqL7Njb9d+w6Fw@mail.gmail.com> <1597985231.23380.22.camel@mtkswgap22>
In-Reply-To: <1597985231.23380.22.camel@mtkswgap22>
From:   Sean Wang <sean.wang@kernel.org>
Date:   Fri, 21 Aug 2020 02:59:07 -0700
X-Gmail-Original-Message-ID: <CAGp9Lzqdc6EK6vF80gQE=dhgT-L_FKovKWwpUJDG=1BKTh=1mg@mail.gmail.com>
Message-ID: <CAGp9Lzqdc6EK6vF80gQE=dhgT-L_FKovKWwpUJDG=1BKTh=1mg@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] pinctrl: mediatek: support access registers
 without race-condition
To:     Light Hsieh <light.hsieh@mediatek.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, kuohong.wang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Light,

On Thu, Aug 20, 2020 at 9:47 PM Light Hsieh <light.hsieh@mediatek.com> wrote:
>
> On Wed, 2020-08-19 at 16:11 -0700, Sean Wang wrote:
> > Hi Light,
> >
> > On Tue, Aug 18, 2020 at 1:36 AM <light.hsieh@mediatek.com> wrote:
> > >
> > > From: Light Hsieh <light.hsieh@mediatek.com>
> > >
> > > Some MediaTek SOC provide more control registers other than value register.
> >
> > s/MT6765/Some MediaTek SoC/
> >
> > > Generanll, a value register need read-modify-write is at offset 0xXXXXXXXX0.
> >
> > s/Generally/Generanll/
> >
> > > A corresponding SET register is at offset 0xXXXXXXX4. Write 1s' to some bits
> > >   of SET register will set same bits in value register.
> > > A corresponding CLR register is at offset 0xXXXXXXX8. Write 1s' to some bits
> > >   of CLR register will clear same bits in value register.
> > > For GPIO mode selection, MWR register is provided at offset 0xXXXXXXXC.
> > >   With MWR, the MSBit of GPIO mode selection field is for modification-enable,
> > >   not for GPIO mode selection, and the remaining LSBits are for mode
> > >   selection.
> > >   Take mode selection field with 4-bits as example, to select mode 0~7 via
> > >   MWR register, 8~15 (instead of 0~7) shall be written to corresponding mode
> > >   selection field.
> > > When using SET/CLR/MWR registers, read-modify-write of value register is not
> > >   necessary. This can prevent from race condition when multiple bus masters
> > >   concurrently read-modify-write the same value register for setting different
> > >   fields of the same value register.
> > >
> > > Signed-off-by: Light Hsieh <light.hsieh@mediatek.com>
> > > ---
> > >  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 69 ++++++++++++++++++++++--
> > >  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h |  2 +
> > >  2 files changed, 67 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> > > index b77b18f..51f0b53 100644
> > > --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> > > +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> > > @@ -18,6 +18,29 @@
> > >  #include "mtk-eint.h"
> > >  #include "pinctrl-mtk-common-v2.h"
> > >
> > > +/* Some MediaTek SOC provide more control registers other than value register.
> >
> > s/MT6765/Some MediaTek SoC/
>
> Not only MT6765 provides such control registers.
> Actually, many (but not all) MediaTek SoC support.
> Other MediaTek SoC can enable such control according to its HW support.
>
> >
> > > + * Generanll, a value register need read-modify-write is at offset 0xXXXXXXXX0.
> >
> > s/Generally/Generanll/
> >
> > > + * A corresponding SET register is at offset 0xXXXXXXX4. Write 1s' to some bits
> > > + *  of SET register will set same bits in value register.
> > > + * A corresponding CLR register is at offset 0xXXXXXXX8. Write 1s' to some bits
> > > + *  of CLR register will clear same bits in value register.
> > > + * For GPIO mode selection, MWR register is provided at offset 0xXXXXXXXC.
> > > + *  With MWR, the MSBit of GPIO mode selection field is for modification-enable,
> > > + *  not for GPIO mode selection, and the remaining LSBits are for mode
> > > + *  selection.
> > > + *  Take mode selection field with 4-bits as example, to select mode 0~7 via
> > > + *  MWR register, 8~15 (instead of 0~7) shall be written to corresponding mode
> > > + *  selection field.
> > > + * When using SET/CLR/MWR registers, read-modify-write of value register is not
> > > + *  necessary. This can prevent from race condition when multiple bus masters
> > > + *  concurrently read-modify-write the same value register for setting different
> > > + *  fields of the same value register.
> > > + */
> > > +
> > > +#define SET_OFFSET 0x4
> > > +#define CLR_OFFSET 0x8
> >
> > can set/clr offset work for mode register?
>
> Yes. However, use set/clr to change mode require 2 register access when
> target mode is not all 0's or all 1's.

DRV/TDSEL and RDSEL register might have value not all 0's or all 1's.
That seems to be we still require two steps register access for such
fields, right?

> The mwr HW support is not available on mode register.

if I understand correctly, that seems to be a typo, MWR should be only
available on mode register

>
> >
> > > +#define MWR_OFFSET 0xC
> > > +
> > >  /**
> > >   * struct mtk_drive_desc - the structure that holds the information
> > >   *                         of the driving current
> > > @@ -64,6 +87,38 @@ void mtk_rmw(struct mtk_pinctrl *pctl, u8 i, u32 reg, u32 mask, u32 set)
> > >         mtk_w32(pctl, i, reg, val);
> > >  }
> > >
> > > +
> > > +static void mtk_hw_set_value_race_free(struct mtk_pinctrl *pctl,
> > > +               struct mtk_pin_field *pf, u32 value)
> >
> > s/mtk_hw_set_value_race_free/mtk_hw_w1sc/ to explictly indicate
> > write-one ethier set or clear operation supported by hw
> >
> > > +{
> > > +       unsigned int set, clr;
> > > +
> > > +       set = value & pf->mask;
> > > +       clr = (~set) & pf->mask;
> > > +
> > > +       if (set)
> > > +               mtk_w32(pctl, pf->index, pf->offset + SET_OFFSET,
> > > +                       set << pf->bitpos);
> > > +       if (clr)
> > > +               mtk_w32(pctl, pf->index, pf->offset + CLR_OFFSET,
> > > +                       clr << pf->bitpos);
> > > +}
> > > +
> > > +static void mtk_hw_set_mode_race_free(struct mtk_pinctrl *pctl,
> > > +               struct mtk_pin_field *pf, u32 value)
> >
> > s/mtk_hw_set_mode_race_free/mtk_hw_mwr/
> >
> > > +{
> > > +       unsigned int value_new;
> > > +
> > > +       /* MSB of mask is modification-enable bit, set this bit */
> > > +       value_new = (1 << (pctl->soc->mwr_field_width - 1)) | value;
> >
> > it seems to be we can use fls(pf->mask) to replace ctl->soc->mwr_field_width
> >
>
> pf->mask cannot be used direct. It needs conversion.For example:
> pf->mask: 0x1f -> value_new = (1 << 4) | value;
> pf->mask: 0xf -> value_new = (1 << 3) | value;
> pf->mask: 0x7 -> value_new = (1 << 2) | value;
>
> The code size of perform conversion is greater than using a direct
> mwr_field_width field.
>

using pf->mask can allow MWR supports any field that can support MWR
to be generic.

that would be a mess when there are more fields relying on MWR on
certain SoC someday.

>
> > > +       if (value_new == value)
> > > +               dev_notice(pctl->dev,
> > > +                       "invalid mode 0x%x, use it by ignoring MSBit!\n",
> > > +                       value);
> > > +       mtk_w32(pctl, pf->index, pf->offset + MWR_OFFSET,
> > > +               value_new << pf->bitpos);
> > > +}
> > > +
> > >  static int mtk_hw_pin_field_lookup(struct mtk_pinctrl *hw,
> > >                                    const struct mtk_pin_desc *desc,
> > >                                    int field, struct mtk_pin_field *pfd)
> > > @@ -197,10 +252,16 @@ int mtk_hw_set_value(struct mtk_pinctrl *hw, const struct mtk_pin_desc *desc,
> > >         if (value < 0 || value > pf.mask)
> > >                 return -EINVAL;
> > >
> > > -       if (!pf.next)
> > > -               mtk_rmw(hw, pf.index, pf.offset, pf.mask << pf.bitpos,
> > > -                       (value & pf.mask) << pf.bitpos);
> > > -       else
> > > +       if (!pf.next) {
> > > +               if (hw->soc->race_free_access) {
> >
> > let's create an extra flags caps under hw->soc and the SoC capability
> > check, something like hw->soc->caps & MTK_HW_CAPS_RMW_ATOMIC to easily
> > extend various things for future SoC
> >
> > > +                       if (field == PINCTRL_PIN_REG_MODE)
> > > +                               mtk_hw_set_mode_race_free(hw, &pf, value);
> > > +                       else
> > > +                               mtk_hw_set_value_race_free(hw, &pf, value);
> > > +               }
> >
> > let's create a function holding that specific hardware stuff (at least
> > currently it look like), something like
> >
> > static void mtk_hw_rmw(struct mtk_pinctrl *pctl,  struct mtk_pin_field *pf)
> > {
> >      if (pf->field == PINCTRL_PIN_REG_MODE) /* create a member field for pf */
> >             mtk_hw_mwr(...);
> >     else
> >             mtk_hw_w1sc(...);
> > }
> >
>
> Sine there is no member 'field' in struct mtk_pin_field, pf->field
> cannot be used.
> Therefore an extra function parameter is required if you want to use a
> standalone function mtk_hw_rmw. Like this:
>
> void mtk_hw_rmw(struct mtk_pinctrl *pctl, struct mtk_pin_field *pf,
>                 int field, u32 value)
> {
>         if (field == PINCTRL_PIN_REG_MODE)
>                 mtk_hw_set_mode_race_free(hw, &pf, value);
>         else
>                 mtk_hw_set_value_race_free(hw, &pf, value);
> }
>
> I wonder the necessity/efficiency of such extra intermediate function
> with many function parameters.

holding it in a separate function is for that operation is not generic
enough for the moment.

>
>
> > > +                       mtk_rmw(hw, pf.index, pf.offset, pf.mask << pf.bitpos,
> > > +                               (value & pf.mask) << pf.bitpos);
> > > +       } else
> > >                 mtk_hw_write_cross_field(hw, &pf, value);
> > >
> > >         return 0;
> > > diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
> > > index 27df087..95fb329 100644
> > > --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
> > > +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
> > > @@ -203,6 +203,8 @@ struct mtk_pin_soc {
> > >         /* Specific parameters per SoC */
> > >         u8                              gpio_m;
> > >         bool                            ies_present;
> > > +       bool                            race_free_access;
> > > +       unsigned int                    mwr_field_width;
> > >         const char * const              *base_names;
> > >         unsigned int                    nbase_names;
> > >
> > > --
> > > 1.8.1.1.dirty
>
