Return-Path: <linux-gpio+bounces-12044-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3219AF8D0
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 06:12:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 07A4A1F22D55
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 04:12:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97ED018C353;
	Fri, 25 Oct 2024 04:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QXftQeQg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A9E1BC5C
	for <linux-gpio@vger.kernel.org>; Fri, 25 Oct 2024 04:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729829541; cv=none; b=XONwngI0leV/zX9dM3aOapJM8vBNQnnwS6wykPopMl96bpy/Dsz8DHYr3mNGywXjvCWgfnTiS9EvLOrOpb0zQ/ssOzshhnoQcLq29dOK22eSsgjgRTo/GFw9jfruigITroCOPhVaIu7nLZ1EL7eKCzC7Z2clJuBTb4yd27wmdm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729829541; c=relaxed/simple;
	bh=ZpB0IvKCkTeg5ieXP87yD1RnmRDloZ2FOI0wBAbdc2k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FtzL8uNYAEdOJd39JwKOu/Y+F2qxZo/HtqrN3ZgaY+89D+UR9PsCuEApvgDTuHsjdoGsT7Hms79NSZAu9xyW2mMY+/dwaQVpbBBfD4Af4YtpCP7g8DihoElPkqmWCoValLbOL5zURskPtu++iSD0Zi/GLUKunEvXdxaK5z1PX8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QXftQeQg; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539f2b95775so1840196e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 24 Oct 2024 21:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729829534; x=1730434334; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uUfqdJG44ExfZhwujdmXStAkKuLbobgKSHM226GAJhs=;
        b=QXftQeQgRqGhfnCIeCDR69FGWtgqowQ032EPwCRRyv0FRTzkmd7DFp1SOYF3nMjVCJ
         p++n6alMLjVJvAEWhbiKtOcNOKPNMsUQJvOzdpiUnpk2beBSGl0zyiKrqCxzQ8kTsIf8
         mG8SLiRnKZugOwwaVr2jvd2oPX0Kwc00kvPzk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729829534; x=1730434334;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uUfqdJG44ExfZhwujdmXStAkKuLbobgKSHM226GAJhs=;
        b=w1us2tviAVdK6Xe9OVgFlsZ8ncL/1Upjct1H7dG9TnNTj1uamh70MDcLi6VEg8irxI
         fQXbHeZ8JMBwi1fUHskId2r6bqbhDyj4v3l4tAaQSgCm+cVx8FgYee3WWxRnzCWAOaOG
         98VhlngMKJjeunk1ew8qL8xY09Ci+OnPXWdeyDV/+027TA6k2co4O2+9e9lpWBf6eI6W
         Ah20s2zkvIGDnezjSxBO2SxmdR/r6dZLCkIdV3WeIX4jtFgwBGEtfocf8XOQvRxvpH0n
         KB8rzujgdo8Z2+nc9pug8EsmIdPeXzTMkfYhO6JxgWfUQskGI+JLUuage774NTwnH7lD
         QLag==
X-Forwarded-Encrypted: i=1; AJvYcCXw3kIazq+RrXCVG5hpIOu+9rzQgjN4wQtyCUU6SEtJF7ZAIUL5c1bR57tduGPRF++wDTNMaPdZbR+2@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0kHLnd69dRIohym5ZjfhK7aeiaN5nik4OgwFOAdcFkBLdPHLT
	YsbzSlU/nscGvrT8H9ZyreaxyCIvoGrPrgWSklplILByEoCn3Lfn3CUnmP009lk1MAgCXfwIQUc
	PhNMW0T7OwmubgJZ3TZzF8AjuUjz1S9N7v8Q6
X-Google-Smtp-Source: AGHT+IFcM8CSTgwXsBVvXsYn7V09xjhqqMkMdhs5h1oMMl1/OV5cFdxG+W2dRUHTNG4qBuAQ8p6Z4IzHBzzxXfLnTSg=
X-Received: by 2002:a05:6512:104c:b0:536:53e3:feae with SMTP id
 2adb3069b0e04-53b1a315e5bmr7766395e87.11.1729829533913; Thu, 24 Oct 2024
 21:12:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241025031814.21442-1-ot_chhao.chang@mediatek.com>
In-Reply-To: <20241025031814.21442-1-ot_chhao.chang@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 25 Oct 2024 12:12:02 +0800
Message-ID: <CAGXv+5GSZYg+P2i4Yb6iMfURq1FrpFF5_UcErO+0=w1e3W5kAw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: add eint new design for mt8196
To: chang hao <ot_chhao.chang@mediatek.com>
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	sean.wang@kernel.org, linus.walleij@linaro.org, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 25, 2024 at 11:19=E2=80=AFAM chang hao <ot_chhao.chang@mediatek=
.com> wrote:
>
> From: Chhao Chang <ot_chhao.chang@mediatek.com>

Please properly version your patch, and also add changelogs. You have
sent three already and I have no idea which one is which version or
what changed.

ChenYu

> eint is divided from the original base address into base addresses
> in five directions: east, south, west, north, and center.
> Stores a limited number of eint numbers in each direction.
>
> Signed-off-by: Chhao Chang <ot_chhao.chang@mediatek.com>
> ---
>  drivers/pinctrl/mediatek/mtk-eint.c           | 831 +++++++++++++-----
>  drivers/pinctrl/mediatek/mtk-eint.h           |  75 +-
>  .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  |  50 +-
>  3 files changed, 723 insertions(+), 233 deletions(-)
>
> diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediat=
ek/mtk-eint.c
> index 27f0a54e12bf..57f812299340 100644
> --- a/drivers/pinctrl/mediatek/mtk-eint.c
> +++ b/drivers/pinctrl/mediatek/mtk-eint.c
> @@ -17,16 +17,13 @@
>  #include <linux/irqdomain.h>
>  #include <linux/module.h>
>  #include <linux/of_irq.h>
> +#include <linux/of_address.h>
>  #include <linux/platform_device.h>
>
>  #include "mtk-eint.h"
>
> -#define MTK_EINT_EDGE_SENSITIVE           0
> -#define MTK_EINT_LEVEL_SENSITIVE          1
> -#define MTK_EINT_DBNC_SET_DBNC_BITS      4
> -#define MTK_EINT_DBNC_MAX                16
> -#define MTK_EINT_DBNC_RST_BIT            (0x1 << 1)
> -#define MTK_EINT_DBNC_SET_EN             (0x1 << 0)
> +static struct mtk_eint *global_eintc;
> +struct mtk_eint_pin pin;
>
>  static const struct mtk_eint_regs mtk_generic_eint_regs =3D {
>         .stat      =3D 0x000,
> @@ -47,6 +44,10 @@ static const struct mtk_eint_regs mtk_generic_eint_reg=
s =3D {
>         .dbnc_ctrl =3D 0x500,
>         .dbnc_set  =3D 0x600,
>         .dbnc_clr  =3D 0x700,
> +       .event     =3D 0x800,
> +       .event_set =3D 0x840,
> +       .event_clr =3D 0x880,
> +       .raw_stat  =3D 0xa00,
>  };
>
>  const unsigned int debounce_time_mt2701[] =3D {
> @@ -64,60 +65,145 @@ const unsigned int debounce_time_mt6795[] =3D {
>  };
>  EXPORT_SYMBOL_GPL(debounce_time_mt6795);
>
> -static void __iomem *mtk_eint_get_offset(struct mtk_eint *eint,
> +/*
> + * Return the iomem of specific register ofset and decode the coordinate
> + * (instance, index) from global eint number.
> + * If return NULL, then it must be either out-of-range or do-not-support=
.
> + */
> +static void __iomem *mtk_eint_get_ofset(struct mtk_eint *eint,
>                                          unsigned int eint_num,
> -                                        unsigned int offset)
> +                                        unsigned int ofset,
> +                                        unsigned int *instance,
> +                                        unsigned int *index)
>  {
> -       unsigned int eint_base =3D 0;
>         void __iomem *reg;
>
> -       if (eint_num >=3D eint->hw->ap_num)
> -               eint_base =3D eint->hw->ap_num;
> +       if (eint_num >=3D eint->total_pin_number ||
> +           !eint->pins[eint_num].enabled) {
> +               WARN_ON(1);
> +               return NULL;
> +       }
>
> -       reg =3D eint->base + offset + ((eint_num - eint_base) / 32) * 4;
> +       *instance =3D eint->pins[eint_num].instance;
> +       *index =3D eint->pins[eint_num].index;
> +       reg =3D eint->instances[*instance].base + ofset + (*index / MAX_B=
IT * REG_OFSET);
>
>         return reg;
>  }
>
> +/*
> + * Generate helper function to access property register of a dedicate pi=
n.
> + */
> +#define DEFINE_EINT_GET_FUNCTION(_NAME, _OFSET) \
> +static unsigned int mtk_eint_get_##_NAME(struct mtk_eint *eint, \
> +                                  unsigned int eint_num) \
> +{ \
> +       unsigned int instance, index; \
> +       void __iomem *reg =3D mtk_eint_get_ofset(eint, eint_num, \
> +                                               _OFSET, \
> +                                               &instance, &index); \
> +       unsigned int bit =3D BIT(index & 0x1f);\
> +\
> +       if (!reg) { \
> +               dev_err(eint->dev, "%s invalid eint_num %d\n", \
> +                       __func__, eint_num); \
> +               return 0;\
> +       } \
> +\
> +       return !!(readl(reg) & bit); \
> +}
> +
> +DEFINE_EINT_GET_FUNCTION(stat, eint->comp->regs->stat);
> +DEFINE_EINT_GET_FUNCTION(mask, eint->comp->regs->mask);
> +DEFINE_EINT_GET_FUNCTION(sens, eint->comp->regs->sens);
> +DEFINE_EINT_GET_FUNCTION(pol, eint->comp->regs->pol);
> +DEFINE_EINT_GET_FUNCTION(dom_en, eint->comp->regs->dom_en);
> +DEFINE_EINT_GET_FUNCTION(event, eint->comp->regs->event);
> +DEFINE_EINT_GET_FUNCTION(raw_stat, eint->comp->regs->raw_stat);
> +
> +int dump_eint_pin_status(unsigned int eint_num)
> +{
> +       unsigned int stat, raw_stat, mask, sens, pol, dom_en, event;
> +
> +       if (eint_num < 0 || eint_num > global_eintc->total_pin_number)
> +               return ENODEV;
> +
> +       stat =3D mtk_eint_get_stat(global_eintc, eint_num);
> +       raw_stat =3D mtk_eint_get_raw_stat(global_eintc, eint_num);
> +       mask =3D mtk_eint_get_mask(global_eintc, eint_num);
> +       sens =3D mtk_eint_get_sens(global_eintc, eint_num);
> +       pol =3D mtk_eint_get_pol(global_eintc, eint_num);
> +       dom_en =3D mtk_eint_get_dom_en(global_eintc, eint_num);
> +       event =3D mtk_eint_get_event(global_eintc, eint_num);
> +       dev_info(global_eintc->dev, "%s eint_num:%u=3Dstat:%u,raw:%u, \
> +                      mask:%u, sens:%u,pol:%u,dom_en:%u,event:%u\n",
> +                      __func__, eint_num, stat, raw_stat, mask, sens,
> +                      pol, dom_en, event);
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(dump_eint_pin_status);
> +
>  static unsigned int mtk_eint_can_en_debounce(struct mtk_eint *eint,
>                                              unsigned int eint_num)
>  {
>         unsigned int sens;
> -       unsigned int bit =3D BIT(eint_num % 32);
> -       void __iomem *reg =3D mtk_eint_get_offset(eint, eint_num,
> -                                               eint->regs->sens);
> +       unsigned int instance, index;
> +       void __iomem *reg =3D mtk_eint_get_ofset(eint, eint_num,
> +                                               eint->comp->regs->sens,
> +                                               &instance, &index);
> +       unsigned int bit =3D BIT(index & 0x1f);
> +
> +       if (!reg) {
> +               dev_err(eint->dev, "%s invalid eint_num %d\n",
> +                       __func__, eint_num);
> +               return 0;
> +       }
>
>         if (readl(reg) & bit)
>                 sens =3D MTK_EINT_LEVEL_SENSITIVE;
>         else
>                 sens =3D MTK_EINT_EDGE_SENSITIVE;
>
> -       if (eint_num < eint->hw->db_cnt && sens !=3D MTK_EINT_EDGE_SENSIT=
IVE)
> +       if (eint->pins[eint_num].debounce &&
> +           sens !=3D MTK_EINT_EDGE_SENSITIVE)
>                 return 1;
>         else
>                 return 0;
>  }
>
> -static int mtk_eint_flip_edge(struct mtk_eint *eint, int hwirq)
> +static int mtk_eint_flip_edge(struct mtk_eint *eint, int eint_num)
>  {
>         int start_level, curr_level;
> -       unsigned int reg_offset;
> -       u32 mask =3D BIT(hwirq & 0x1f);
> -       u32 port =3D (hwirq >> 5) & eint->hw->port_mask;
> -       void __iomem *reg =3D eint->base + (port << 2);
> +       unsigned int reg_ofset;
> +       unsigned int instance, index, mask, port;
> +       void __iomem *reg;
>
> -       curr_level =3D eint->gpio_xlate->get_gpio_state(eint->pctl, hwirq=
);
> +       reg =3D mtk_eint_get_ofset(eint, eint_num, MTK_EINT_NO_OFSET,
> +                                 &instance, &index);
> +
> +       if (!reg) {
> +               dev_err(eint->dev, "%s invalid eint_num %d\n",
> +                       __func__, eint_num);
> +               return 0;
> +       }
> +
> +       mask =3D BIT(index & 0x1f);
> +       port =3D index >> REG_GROUP;
> +       reg =3D eint->instances[instance].base + port * REG_OFSET;
> +
> +       curr_level =3D eint->gpio_xlate->get_gpio_state(eint->pctl, eint_=
num);
>
>         do {
>                 start_level =3D curr_level;
>                 if (start_level)
> -                       reg_offset =3D eint->regs->pol_clr;
> +                       reg_ofset =3D eint->comp->regs->pol_clr;
>                 else
> -                       reg_offset =3D eint->regs->pol_set;
> -               writel(mask, reg + reg_offset);
> +                       reg_ofset =3D eint->comp->regs->pol_set;
> +
> +               writel(mask, reg + reg_ofset);
>
>                 curr_level =3D eint->gpio_xlate->get_gpio_state(eint->pct=
l,
> -                                                             hwirq);
> +                                                             eint_num);
>         } while (start_level !=3D curr_level);
>
>         return start_level;
> @@ -126,11 +212,19 @@ static int mtk_eint_flip_edge(struct mtk_eint *eint=
, int hwirq)
>  static void mtk_eint_mask(struct irq_data *d)
>  {
>         struct mtk_eint *eint =3D irq_data_get_irq_chip_data(d);
> -       u32 mask =3D BIT(d->hwirq & 0x1f);
> -       void __iomem *reg =3D mtk_eint_get_offset(eint, d->hwirq,
> -                                               eint->regs->mask_set);
> +       unsigned int instance, index;
> +       void __iomem *reg =3D mtk_eint_get_ofset(eint, d->hwirq,
> +                                               eint->comp->regs->mask_se=
t,
> +                                               &instance, &index);
> +       u32 mask =3D BIT(index & 0x1f);
> +
> +       if (!reg) {
> +               dev_err(eint->dev, "%s invalid eint_num %lu\n",
> +                       __func__, d->hwirq);
> +               return;
> +       }
>
> -       eint->cur_mask[d->hwirq >> 5] &=3D ~mask;
> +       eint->instances[instance].cur_mask[index >> REG_GROUP] &=3D ~mask=
;
>
>         writel(mask, reg);
>  }
> @@ -138,43 +232,91 @@ static void mtk_eint_mask(struct irq_data *d)
>  static void mtk_eint_unmask(struct irq_data *d)
>  {
>         struct mtk_eint *eint =3D irq_data_get_irq_chip_data(d);
> -       u32 mask =3D BIT(d->hwirq & 0x1f);
> -       void __iomem *reg =3D mtk_eint_get_offset(eint, d->hwirq,
> -                                               eint->regs->mask_clr);
> +       unsigned int instance, index;
> +       void __iomem *reg =3D mtk_eint_get_ofset(eint, d->hwirq,
> +                                               eint->comp->regs->mask_cl=
r,
> +                                               &instance, &index);
> +       u32 mask =3D BIT(index & 0x1f);
> +
> +       if (!reg) {
> +               dev_err(eint->dev, "%s invalid eint_num %lu\n",
> +                       __func__, d->hwirq);
> +               return;
> +       }
>
> -       eint->cur_mask[d->hwirq >> 5] |=3D mask;
> +       eint->instances[instance].cur_mask[index >> REG_GROUP] |=3D mask;
>
>         writel(mask, reg);
>
> -       if (eint->dual_edge[d->hwirq])
> +       if (eint->pins[d->hwirq].dual_edge)
>                 mtk_eint_flip_edge(eint, d->hwirq);
>  }
>
> -static unsigned int mtk_eint_get_mask(struct mtk_eint *eint,
> +static void mtk_eint_ack(struct irq_data *d)
> +{
> +       struct mtk_eint *eint =3D irq_data_get_irq_chip_data(d);
> +       unsigned int instance, index;
> +       void __iomem *reg;
> +       unsigned int bit;
> +
> +       if (eint->comp->ops.ack)
> +               eint->comp->ops.ack(d);
> +       else {
> +               reg =3D mtk_eint_get_ofset(eint, d->hwirq,
> +                                         eint->comp->regs->ack,
> +                                         &instance, &index);
> +               bit =3D BIT(index & 0x1f);
> +               if (!reg) {
> +                       dev_err(eint->dev, "%s invalid eint_num %lu\n",
> +                               __func__, d->hwirq);
> +                       return;
> +               }
> +
> +               writel(bit, reg);
> +       }
> +}
> +
> +static void mtk_eint_soft_set(struct mtk_eint *eint,
>                                       unsigned int eint_num)
>  {
> -       unsigned int bit =3D BIT(eint_num % 32);
> -       void __iomem *reg =3D mtk_eint_get_offset(eint, eint_num,
> -                                               eint->regs->mask);
> +       unsigned int instance, index;
> +       void __iomem *reg =3D mtk_eint_get_ofset(eint, eint_num,
> +                                               eint->comp->regs->soft_se=
t,
> +                                               &instance, &index);
> +       unsigned int bit =3D BIT(index & 0x1f);
> +
> +       if (!reg) {
> +               dev_err(eint->dev, "%s invalid eint_num %d\n",
> +                       __func__, eint_num);
> +               return;
> +       }
>
> -       return !!(readl(reg) & bit);
> +       writel(bit, reg);
>  }
>
> -static void mtk_eint_ack(struct irq_data *d)
> +static void mtk_eint_soft_clr(struct mtk_eint *eint,
> +                                     unsigned int eint_num)
>  {
> -       struct mtk_eint *eint =3D irq_data_get_irq_chip_data(d);
> -       u32 mask =3D BIT(d->hwirq & 0x1f);
> -       void __iomem *reg =3D mtk_eint_get_offset(eint, d->hwirq,
> -                                               eint->regs->ack);
> +       unsigned int instance, index;
> +       void __iomem *reg =3D mtk_eint_get_ofset(eint, eint_num,
> +                                               eint->comp->regs->soft_cl=
r,
> +                                               &instance, &index);
> +       unsigned int bit =3D BIT(index & 0x1f);
> +
> +       if (!reg) {
> +               dev_err(eint->dev, "%s invalid eint_num %d\n",
> +                       __func__, eint_num);
> +               return;
> +       }
>
> -       writel(mask, reg);
> +       writel(bit, reg);
>  }
>
>  static int mtk_eint_set_type(struct irq_data *d, unsigned int type)
>  {
>         struct mtk_eint *eint =3D irq_data_get_irq_chip_data(d);
> -       bool masked;
> -       u32 mask =3D BIT(d->hwirq & 0x1f);
> +       u32 mask;
> +       unsigned int instance, index;
>         void __iomem *reg;
>
>         if (((type & IRQ_TYPE_EDGE_BOTH) && (type & IRQ_TYPE_LEVEL_MASK))=
 ||
> @@ -186,36 +328,42 @@ static int mtk_eint_set_type(struct irq_data *d, un=
signed int type)
>         }
>
>         if ((type & IRQ_TYPE_EDGE_BOTH) =3D=3D IRQ_TYPE_EDGE_BOTH)
> -               eint->dual_edge[d->hwirq] =3D 1;
> +               eint->pins[d->hwirq].dual_edge =3D 1;
>         else
> -               eint->dual_edge[d->hwirq] =3D 0;
> +               eint->pins[d->hwirq].dual_edge =3D 0;
>
> -       if (!mtk_eint_get_mask(eint, d->hwirq)) {
> -               mtk_eint_mask(d);
> -               masked =3D false;
> -       } else {
> -               masked =3D true;
> -       }
> +       if (type & (IRQ_TYPE_LEVEL_LOW | IRQ_TYPE_EDGE_FALLING))
> +               reg =3D mtk_eint_get_ofset(eint, d->hwirq,
> +                                         eint->comp->regs->pol_clr,
> +                                         &instance, &index);
> +       else
> +               reg =3D mtk_eint_get_ofset(eint, d->hwirq,
> +                                         eint->comp->regs->pol_set,
> +                                         &instance, &index);
>
> -       if (type & (IRQ_TYPE_LEVEL_LOW | IRQ_TYPE_EDGE_FALLING)) {
> -               reg =3D mtk_eint_get_offset(eint, d->hwirq, eint->regs->p=
ol_clr);
> -               writel(mask, reg);
> -       } else {
> -               reg =3D mtk_eint_get_offset(eint, d->hwirq, eint->regs->p=
ol_set);
> -               writel(mask, reg);
> -       }
> +       mask =3D BIT(index & 0x1f);
> +       writel(mask, reg);
> +
> +       if (type & (IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING))
> +               reg =3D mtk_eint_get_ofset(eint, d->hwirq,
> +                                         eint->comp->regs->sens_clr,
> +                                         &instance, &index);
> +       else
> +               reg =3D mtk_eint_get_ofset(eint, d->hwirq,
> +                                         eint->comp->regs->sens_set,
> +                                         &instance, &index);
>
> -       if (type & (IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING)) {
> -               reg =3D mtk_eint_get_offset(eint, d->hwirq, eint->regs->s=
ens_clr);
> -               writel(mask, reg);
> -       } else {
> -               reg =3D mtk_eint_get_offset(eint, d->hwirq, eint->regs->s=
ens_set);
> -               writel(mask, reg);
> +       if (!reg) {
> +               dev_err(eint->dev, "%s invalid eint_num %lu\n",
> +                       __func__, d->hwirq);
> +               return 0;
>         }
>
> -       mtk_eint_ack(d);
> -       if (!masked)
> -               mtk_eint_unmask(d);
> +       mask =3D BIT(index & 0x1f);
> +       writel(mask, reg);
> +
> +       if (eint->pins[d->hwirq].dual_edge)
> +               mtk_eint_flip_edge(eint, d->hwirq);
>
>         return 0;
>  }
> @@ -223,30 +371,28 @@ static int mtk_eint_set_type(struct irq_data *d, un=
signed int type)
>  static int mtk_eint_irq_set_wake(struct irq_data *d, unsigned int on)
>  {
>         struct mtk_eint *eint =3D irq_data_get_irq_chip_data(d);
> -       int shift =3D d->hwirq & 0x1f;
> -       int reg =3D d->hwirq >> 5;
> +       unsigned int instance, index, shift, port;
> +       void __iomem *reg =3D mtk_eint_get_ofset(eint, d->hwirq,
> +                                               MTK_EINT_NO_OFSET,
> +                                               &instance, &index);
> +
> +       if (!reg) {
> +               dev_err(eint->dev, "%s invalid eint_num %lu\n",
> +                       __func__, d->hwirq);
> +               return 0;
> +       }
> +
> +       shift =3D index & 0x1f;
> +       port =3D index >> REG_GROUP;
>
>         if (on)
> -               eint->wake_mask[reg] |=3D BIT(shift);
> +               eint->instances[instance].wake_mask[port] |=3D BIT(shift)=
;
>         else
> -               eint->wake_mask[reg] &=3D ~BIT(shift);
> +               eint->instances[instance].wake_mask[port] &=3D ~BIT(shift=
);
>
>         return 0;
>  }
>
> -static void mtk_eint_chip_write_mask(const struct mtk_eint *eint,
> -                                    void __iomem *base, u32 *buf)
> -{
> -       int port;
> -       void __iomem *reg;
> -
> -       for (port =3D 0; port < eint->hw->ports; port++) {
> -               reg =3D base + (port << 2);
> -               writel_relaxed(~buf[port], reg + eint->regs->mask_set);
> -               writel_relaxed(buf[port], reg + eint->regs->mask_clr);
> -       }
> -}
> -
>  static int mtk_eint_irq_request_resources(struct irq_data *d)
>  {
>         struct mtk_eint *eint =3D irq_data_get_irq_chip_data(d);
> @@ -290,7 +436,7 @@ static void mtk_eint_irq_release_resources(struct irq=
_data *d)
>  }
>
>  static struct irq_chip mtk_eint_irq_chip =3D {
> -       .name =3D "mt-eint",
> +       .name =3D "mtk-eint",
>         .irq_disable =3D mtk_eint_mask,
>         .irq_mask =3D mtk_eint_mask,
>         .irq_unmask =3D mtk_eint_unmask,
> @@ -301,35 +447,51 @@ static struct irq_chip mtk_eint_irq_chip =3D {
>         .irq_release_resources =3D mtk_eint_irq_release_resources,
>  };
>
> +/*
> + * Configure all EINT pins as domain 0, which only belongs to AP.
> + */
>  static unsigned int mtk_eint_hw_init(struct mtk_eint *eint)
>  {
> -       void __iomem *dom_en =3D eint->base + eint->regs->dom_en;
> -       void __iomem *mask_set =3D eint->base + eint->regs->mask_set;
> -       unsigned int i;
> -
> -       for (i =3D 0; i < eint->hw->ap_num; i +=3D 32) {
> -               writel(0xffffffff, dom_en);
> -               writel(0xffffffff, mask_set);
> -               dom_en +=3D 4;
> -               mask_set +=3D 4;
> +       void __iomem *reg,*eevt_clr;
> +       unsigned int i, j;
> +
> +       for (i =3D 0; i < eint->instance_number; i++) {
> +               reg =3D eint->instances[i].base + eint->comp->regs->dom_e=
n;
> +               eevt_clr =3D eint->instances[i].base + eint->comp->regs->=
event_clr;
> +               for (j =3D 0; j < eint->instances[i].number; j +=3D MAX_B=
IT, reg +=3D REG_OFSET, eevt_clr +=3D REG_OFSET) {
> +                       writel(REG_VAL, reg);
> +                       writel(REG_VAL, eevt_clr);
> +               }
>         }
>
>         return 0;
>  }
>
>  static inline void
> -mtk_eint_debounce_process(struct mtk_eint *eint, int index)
> +mtk_eint_debounce_process(struct mtk_eint *eint, int eint_num)
>  {
> -       unsigned int rst, ctrl_offset;
> +       unsigned int rst, ctrl_ofset;
>         unsigned int bit, dbnc;
> +       unsigned int instance, index;
> +       void __iomem *reg;
> +
> +       reg =3D mtk_eint_get_ofset(eint, eint_num, MTK_EINT_NO_OFSET,
> +                                 &instance, &index);
> +
> +       if (!reg) {
> +               dev_err(eint->dev, "%s invalid eint_num %d\n",
> +                       __func__, eint_num);
> +               return;
> +       }
> +
> +       ctrl_ofset =3D (index / REG_OFSET) * REG_OFSET + eint->comp->regs=
->dbnc_ctrl;
> +       dbnc =3D readl(eint->instances[instance].base + ctrl_ofset);
> +       bit =3D MTK_EINT_DBNC_SET_EN << ((index % REG_OFSET) * DB_GROUP);
>
> -       ctrl_offset =3D (index / 4) * 4 + eint->regs->dbnc_ctrl;
> -       dbnc =3D readl(eint->base + ctrl_offset);
> -       bit =3D MTK_EINT_DBNC_SET_EN << ((index % 4) * 8);
>         if ((bit & dbnc) > 0) {
> -               ctrl_offset =3D (index / 4) * 4 + eint->regs->dbnc_set;
> -               rst =3D MTK_EINT_DBNC_RST_BIT << ((index % 4) * 8);
> -               writel(rst, eint->base + ctrl_offset);
> +               ctrl_ofset =3D (index / REG_OFSET) * REG_OFSET + eint->co=
mp->regs->dbnc_set;
> +               rst =3D MTK_EINT_DBNC_RST_BIT << ((index % REG_OFSET) * D=
B_GROUP);
> +               writel(rst, eint->instances[instance].base + ctrl_ofset);
>         }
>  }
>
> @@ -337,65 +499,72 @@ static void mtk_eint_irq_handler(struct irq_desc *d=
esc)
>  {
>         struct irq_chip *chip =3D irq_desc_get_chip(desc);
>         struct mtk_eint *eint =3D irq_desc_get_handler_data(desc);
> -       unsigned int status, eint_num;
> -       int offset, mask_offset, index;
> -       void __iomem *reg =3D  mtk_eint_get_offset(eint, 0, eint->regs->s=
tat);
> -       int dual_edge, start_level, curr_level;
> +       unsigned int status, i, j;
> +       int shift, port, eint_num, virq;
> +       unsigned int dual_edge, start_level, curr_level;
> +       struct mtk_eint_instance eint_instance;
> +       void __iomem *addr;
>
>         chained_irq_enter(chip, desc);
> -       for (eint_num =3D 0; eint_num < eint->hw->ap_num; eint_num +=3D 3=
2,
> -            reg +=3D 4) {
> -               status =3D readl(reg);
> -               while (status) {
> -                       offset =3D __ffs(status);
> -                       mask_offset =3D eint_num >> 5;
> -                       index =3D eint_num + offset;
> -                       status &=3D ~BIT(offset);
> -
> -                       /*
> -                        * If we get an interrupt on pin that was only re=
quired
> -                        * for wake (but no real interrupt requested), ma=
sk the
> -                        * interrupt (as would mtk_eint_resume do anyway =
later
> -                        * in the resume sequence).
> -                        */
> -                       if (eint->wake_mask[mask_offset] & BIT(offset) &&
> -                           !(eint->cur_mask[mask_offset] & BIT(offset)))=
 {
> -                               writel_relaxed(BIT(offset), reg -
> -                                       eint->regs->stat +
> -                                       eint->regs->mask_set);
> -                       }
> -
> -                       dual_edge =3D eint->dual_edge[index];
> -                       if (dual_edge) {
> -                               /*
> -                                * Clear soft-irq in case we raised it la=
st
> -                                * time.
> -                                */
> -                               writel(BIT(offset), reg - eint->regs->sta=
t +
> -                                      eint->regs->soft_clr);
>
> -                               start_level =3D
> -                               eint->gpio_xlate->get_gpio_state(eint->pc=
tl,
> -                                                                index);
> -                       }
> +       for (i =3D 0; i < eint->instance_number; i++) {
> +               eint_instance =3D eint->instances[i];
>
> -                       generic_handle_domain_irq(eint->domain, index);
> +               /* Iterate all pins by port */
> +               for (j =3D 0; j < eint_instance.number; j +=3D MAX_BIT) {
> +                       port =3D j >> REG_GROUP;
> +                       status =3D readl(eint_instance.base + port * REG_=
OFSET +
> +                                      eint->comp->regs->stat);
> +                       while (status) {
> +                               shift =3D __ffs(status);
> +                               status &=3D ~BIT(shift);
>
> -                       if (dual_edge) {
> -                               curr_level =3D mtk_eint_flip_edge(eint, i=
ndex);
> +                               eint_num =3D eint->instances[i].pin_list[=
shift + j];
> +                               virq =3D irq_find_mapping(eint->domain, e=
int_num);
>
>                                 /*
> -                                * If level changed, we might lost one ed=
ge
> -                                * interrupt, raised it through soft-irq.
> +                                * If we get an interrupt on pin that was=
 only required
> +                                * for wake (but no real interrupt reques=
ted), mask the
> +                                * interrupt (as would mtk_eint_resume do=
 anyway later
> +                                * in the resume sequence).
>                                  */
> -                               if (start_level !=3D curr_level)
> -                                       writel(BIT(offset), reg -
> -                                              eint->regs->stat +
> -                                              eint->regs->soft_set);
> -                       }
> +                               if (eint->instances[i].wake_mask[port] & =
BIT(shift) &&
> +                                   !(eint->instances[i].cur_mask[port] &=
 BIT(shift))) {
> +                                       addr =3D eint_instance.base + por=
t * REG_OFSET +
> +                                               eint->comp->regs->mask_se=
t;
> +                                       writel_relaxed(BIT(shift), addr);
> +                               }
> +
> +                               dual_edge =3D eint->pins[eint_num].dual_e=
dge;
> +                               if (dual_edge) {
> +                                       /*
> +                                        * Clear soft-irq in case we rais=
ed it last
> +                                        * time.
> +                                        */
> +                                       mtk_eint_soft_clr(eint, eint_num)=
;
> +
> +                                       start_level =3D
> +                                       eint->gpio_xlate->get_gpio_state(=
eint->pctl,
> +                                                                        =
eint_num);
> +                               }
> +
> +                               generic_handle_irq(virq);
> +
> +                               if (dual_edge) {
> +                                       curr_level =3D mtk_eint_flip_edge=
(eint, eint_num);
> +
> +                                       /*
> +                                        * If level changed, we might los=
t one edge
> +                                        * interrupt, raised it through s=
oft-irq.
> +                                        */
> +                                       if (start_level !=3D curr_level)
> +                                               mtk_eint_soft_set(eint, e=
int_num);
> +                               }
> +
> +                               if (eint->pins[eint_num].debounce)
> +                                       mtk_eint_debounce_process(eint, e=
int_num);
>
> -                       if (index < eint->hw->db_cnt)
> -                               mtk_eint_debounce_process(eint, index);
> +                       }
>                 }
>         }
>         chained_irq_exit(chip, desc);
> @@ -403,7 +572,20 @@ static void mtk_eint_irq_handler(struct irq_desc *de=
sc)
>
>  int mtk_eint_do_suspend(struct mtk_eint *eint)
>  {
> -       mtk_eint_chip_write_mask(eint, eint->base, eint->wake_mask);
> +       unsigned int i, j, port;
> +
> +       for (i =3D 0; i < eint->instance_number; i++) {
> +               struct mtk_eint_instance inst =3D eint->instances[i];
> +
> +               for (j =3D 0; j < inst.number; j +=3D MAX_BIT) {
> +                       port =3D j >> REG_GROUP;
> +                       writel_relaxed(~inst.wake_mask[port],
> +                                      inst.base + port*REG_OFSET + eint-=
>comp->regs->mask_set);
> +                       writel_relaxed(inst.wake_mask[port],
> +                                      inst.base + port*REG_OFSET + eint-=
>comp->regs->mask_clr);
> +               }
> +       }
> +       dsb(sy);
>
>         return 0;
>  }
> @@ -411,7 +593,20 @@ EXPORT_SYMBOL_GPL(mtk_eint_do_suspend);
>
>  int mtk_eint_do_resume(struct mtk_eint *eint)
>  {
> -       mtk_eint_chip_write_mask(eint, eint->base, eint->cur_mask);
> +       unsigned int i, j, port;
> +
> +       for (i =3D 0; i < eint->instance_number; i++) {
> +               struct mtk_eint_instance inst =3D eint->instances[i];
> +
> +               for (j =3D 0; j < inst.number; j +=3D MAX_BIT) {
> +                       port =3D j >> REG_GROUP;
> +                       writel_relaxed(~inst.cur_mask[port],
> +                                      inst.base + port*REG_OFSET + eint-=
>comp->regs->mask_set);
> +                       writel_relaxed(inst.cur_mask[port],
> +                                      inst.base + port*REG_OFSET + eint-=
>comp->regs->mask_clr);
> +               }
> +       }
> +       dsb(sy);
>
>         return 0;
>  }
> @@ -420,27 +615,45 @@ EXPORT_SYMBOL_GPL(mtk_eint_do_resume);
>  int mtk_eint_set_debounce(struct mtk_eint *eint, unsigned long eint_num,
>                           unsigned int debounce)
>  {
> -       int virq, eint_offset;
> -       unsigned int set_offset, bit, clr_bit, clr_offset, rst, i, unmask=
,
> +       int virq, eint_ofset;
> +       unsigned int set_ofset, bit, clr_bit, clr_ofset, rst, i, unmask,
>                      dbnc;
> +       static const unsigned int debounce_time[] =3D { 156, 313, 625, 12=
50,
> +               20000, 40000, 80000, 160000, 320000, 640000 };
>         struct irq_data *d;
> +       unsigned int instance, index;
> +       void __iomem *reg;
>
> -       if (!eint->hw->db_time)
> -               return -EOPNOTSUPP;
> +       /*
> +        * Due to different number of bit field, we only decode
> +        * the coordinate here, instead of get the VA.
> +        */
> +       reg =3D mtk_eint_get_ofset(eint, eint_num, MTK_EINT_NO_OFSET,
> +                                 &instance, &index);
> +
> +       if (!reg) {
> +               dev_err(eint->dev, "%s invalid eint_num %lu\n",
> +                       __func__, eint_num);
> +               return 0;
> +       }
>
>         virq =3D irq_find_mapping(eint->domain, eint_num);
> -       eint_offset =3D (eint_num % 4) * 8;
> +       eint_ofset =3D (index % REG_OFSET) * DB_GROUP;
>         d =3D irq_get_irq_data(virq);
>
> -       set_offset =3D (eint_num / 4) * 4 + eint->regs->dbnc_set;
> -       clr_offset =3D (eint_num / 4) * 4 + eint->regs->dbnc_clr;
> +       reg =3D eint->instances[instance].base;
> +       set_ofset =3D (index / REG_OFSET) * REG_OFSET + eint->comp->regs-=
>dbnc_set;
> +       clr_ofset =3D (index / REG_OFSET) * REG_OFSET + eint->comp->regs-=
>dbnc_clr;
>
>         if (!mtk_eint_can_en_debounce(eint, eint_num))
>                 return -EINVAL;
>
> -       dbnc =3D eint->num_db_time;
> -       for (i =3D 0; i < eint->num_db_time; i++) {
> -               if (debounce <=3D eint->hw->db_time[i]) {
> +       /*
> +        * Check eint number to avoid access out-of-range
> +        */
> +       dbnc =3D ARRAY_SIZE(debounce_time) - 1;
> +       for (i =3D 0; i < ARRAY_SIZE(debounce_time); i++) {
> +               if (debounce <=3D debounce_time[i]) {
>                         dbnc =3D i;
>                         break;
>                 }
> @@ -449,23 +662,20 @@ int mtk_eint_set_debounce(struct mtk_eint *eint, un=
signed long eint_num,
>         if (!mtk_eint_get_mask(eint, eint_num)) {
>                 mtk_eint_mask(d);
>                 unmask =3D 1;
> -       } else {
> +       } else
>                 unmask =3D 0;
> -       }
>
> -       clr_bit =3D 0xff << eint_offset;
> -       writel(clr_bit, eint->base + clr_offset);
> +       clr_bit =3D 0xff << eint_ofset;
> +       writel(clr_bit, reg + clr_ofset);
>
> -       bit =3D ((dbnc << MTK_EINT_DBNC_SET_DBNC_BITS) | MTK_EINT_DBNC_SE=
T_EN) <<
> -               eint_offset;
> -       rst =3D MTK_EINT_DBNC_RST_BIT << eint_offset;
> -       writel(rst | bit, eint->base + set_offset);
> +       bit =3D ((dbnc << MTK_EINT_DBNC_SET_DBNC_BITS)
> +               | MTK_EINT_DBNC_SET_EN) << eint_ofset;
> +       rst =3D MTK_EINT_DBNC_RST_BIT << eint_ofset;
> +       writel(rst | bit, reg + set_ofset);
>
>         /*
> -        * Delay a while (more than 2T) to wait for hw debounce counter r=
eset
> -        * work correctly.
> +        * Delay should be (8T @ 32k) from dbc rst to work correctly.
>          */
> -       udelay(1);
>         if (unmask =3D=3D 1)
>                 mtk_eint_unmask(d);
>
> @@ -473,6 +683,53 @@ int mtk_eint_set_debounce(struct mtk_eint *eint, uns=
igned long eint_num,
>  }
>  EXPORT_SYMBOL_GPL(mtk_eint_set_debounce);
>
> +unsigned int mtk_eint_get_debounce_en(struct mtk_eint *eint,
> +                                     unsigned int eint_num)
> +{
> +       unsigned int instance, index, bit;
> +       void __iomem *reg;
> +
> +       reg =3D mtk_eint_get_ofset(eint, eint_num, MTK_EINT_NO_OFSET,
> +                                 &instance, &index);
> +
> +       if (!reg) {
> +               dev_err(eint->dev, "%s invalid eint_num %d\n",
> +                       __func__, eint_num);
> +               return 0;
> +       }
> +
> +       reg =3D eint->instances[instance].base +
> +               (index / REG_OFSET) * REG_OFSET + eint->comp->regs->dbnc_=
ctrl;
> +
> +       bit =3D MTK_EINT_DBNC_SET_EN << ((index % REG_OFSET) * DB_GROUP);
> +
> +       return (readl(reg) & bit) ? 1 : 0;
> +}
> +
> +unsigned int mtk_eint_get_debounce_value(struct mtk_eint *eint,
> +                                          unsigned int eint_num)
> +{
> +       unsigned int instance, index, mask, ofset;
> +       void __iomem *reg;
> +
> +       reg =3D mtk_eint_get_ofset(eint, eint_num, MTK_EINT_NO_OFSET,
> +                                 &instance, &index);
> +
> +       if (!reg) {
> +               dev_err(eint->dev, "%s invalid eint_num %d\n",
> +                       __func__, eint_num);
> +               return 0;
> +       }
> +
> +       reg =3D eint->instances[instance].base +
> +               (index / REG_OFSET) * REG_OFSET + eint->comp->regs->dbnc_=
ctrl;
> +
> +       ofset =3D MTK_EINT_DBNC_SET_DBNC_BITS + ((index % REG_OFSET) * DB=
_GROUP);
> +       mask =3D 0xf << ofset;
> +
> +       return ((readl(reg) & mask) >> ofset);
> +}
> +
>  int mtk_eint_find_irq(struct mtk_eint *eint, unsigned long eint_n)
>  {
>         int irq;
> @@ -485,45 +742,209 @@ int mtk_eint_find_irq(struct mtk_eint *eint, unsig=
ned long eint_n)
>  }
>  EXPORT_SYMBOL_GPL(mtk_eint_find_irq);
>
> +static const struct mtk_eint_compatible default_compat =3D {
> +       .regs =3D &mtk_generic_eint_regs,
> +};
> +
> +static const struct of_device_id eint_compatible_ids[] =3D {
> +       { }
> +};
> +
>  int mtk_eint_do_init(struct mtk_eint *eint)
>  {
> -       int i;
> +       int i, virq;
> +       unsigned int size, inst =3D 0;
> +       eint->instance_number =3D 1;
> +       eint->total_pin_number =3D eint->hw->ap_num;
> +
> +       for (i =3D 0; i < eint->total_pin_number; i++) {
> +               eint->pins[i].enabled =3D true;
> +               eint->pins[i].instance =3D inst;
> +               eint->pins[i].index =3D i;
> +               eint->pins[i].debounce =3D  (i < eint->hw->db_cnt) ? 1 : =
0;
> +
> +               eint->instances[inst].pin_list[i] =3D i;
> +               eint->instances[inst].number++;
> +       }
>
> -       /* If clients don't assign a specific regs, let's use generic one=
 */
> -       if (!eint->regs)
> -               eint->regs =3D &mtk_generic_eint_regs;
> +       for (i =3D 0; i < eint->instance_number; i++) {
> +               size =3D (eint->instances[i].number / MAX_BIT + 1) * size=
of(unsigned int);
> +               eint->instances[i].wake_mask =3D
> +                       devm_kzalloc(eint->dev, size, GFP_KERNEL);
> +               eint->instances[i].cur_mask =3D
> +                       devm_kzalloc(eint->dev, size, GFP_KERNEL);
>
> -       eint->wake_mask =3D devm_kcalloc(eint->dev, eint->hw->ports,
> -                                      sizeof(*eint->wake_mask), GFP_KERN=
EL);
> -       if (!eint->wake_mask)
> +               if (!eint->instances[i].wake_mask ||
> +                   !eint->instances[i].cur_mask)
> +                       return -ENOMEM;
> +       }
> +
> +       eint->comp =3D &default_compat;
> +
> +       eint->domain =3D irq_domain_add_linear(eint->dev->of_node,
> +                                            eint->total_pin_number,
> +                                            &irq_domain_simple_ops, NULL=
);
> +       if (!eint->domain)
>                 return -ENOMEM;
>
> -       eint->cur_mask =3D devm_kcalloc(eint->dev, eint->hw->ports,
> -                                     sizeof(*eint->cur_mask), GFP_KERNEL=
);
> -       if (!eint->cur_mask)
> +       mtk_eint_hw_init(eint);
> +       for (i =3D 0; i < eint->total_pin_number; i++) {
> +               virq =3D irq_create_mapping(eint->domain, i);
> +
> +               irq_set_chip_and_handler(virq, &mtk_eint_irq_chip,
> +                                        handle_level_irq);
> +               irq_set_chip_data(virq, eint);
> +       }
> +
> +       irq_set_chained_handler_and_data(eint->irq, mtk_eint_irq_handler,
> +                                        eint);
> +
> +       global_eintc =3D eint;
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(mtk_eint_do_init);
> +
> +int mtk_eint_do_init_v2(struct mtk_eint *eint)
> +{
> +       int i, virq, matrix_number =3D 0;
> +       struct device_node *node;
> +       unsigned int ret, size, ofset;
> +       unsigned int id, inst, idx, support_deb;
> +
> +       const phandle *ph;
> +
> +       ph =3D of_get_property(eint->dev->of_node, "mediatek,eint", NULL)=
;
> +       if (!ph) {
> +               dev_err(eint->dev, "Cannot find EINT phandle in PIO node.=
\n");
> +               return -ENODEV;
> +       }
> +
> +       node =3D of_find_node_by_phandle(be32_to_cpup(ph));
> +       if (!node) {
> +               dev_err(eint->dev, "Cannot find EINT node by phandle.\n")=
;
> +               return -ENODEV;
> +       }
> +
> +       ret =3D of_property_read_u32(node, "mediatek,total-pin-number",
> +                                  &eint->total_pin_number);
> +       if (ret) {
> +               dev_err(eint->dev,
> +                      "%s cannot read total-pin-number from device node.=
\n",
> +                      __func__);
> +               return -EINVAL;
> +       }
> +
> +       dev_info(eint->dev, "%s eint total %u pins.\n", __func__,
> +               eint->total_pin_number);
> +
> +       ret =3D of_property_read_u32(node, "mediatek,instance-num",
> +                                  &eint->instance_number);
> +       if (ret)
> +               eint->instance_number =3D 1; // only 1 instance in legacy=
 chip
> +
> +       size =3D eint->instance_number * sizeof(struct mtk_eint_instance)=
;
> +       eint->instances =3D devm_kzalloc(eint->dev, size, GFP_KERNEL);
> +       if (!eint->instances)
>                 return -ENOMEM;
>
> -       eint->dual_edge =3D devm_kcalloc(eint->dev, eint->hw->ap_num,
> -                                      sizeof(int), GFP_KERNEL);
> -       if (!eint->dual_edge)
> +       size =3D eint->total_pin_number * sizeof(struct mtk_eint_pin);
> +       eint->pins =3D devm_kzalloc(eint->dev, size, GFP_KERNEL);
> +       if (!eint->pins)
>                 return -ENOMEM;
>
> +       for (i =3D 0; i < eint->instance_number; i++) {
> +               ret =3D of_property_read_string_index(node, "reg-name", i=
,
> +                                                   &(eint->instances[i].=
name));
> +               if (ret) {
> +                       dev_info(eint->dev,
> +                                "%s cannot read the name of instance %d.=
\n",
> +                                __func__, i);
> +               }
> +
> +               eint->instances[i].base =3D of_iomap(node, i);
> +               if (!eint->instances[i].base)
> +                       return -ENOMEM;
> +       }
> +
> +       matrix_number =3D of_property_count_u32_elems(node, "mediatek,pin=
s") / ARRAY_0;
> +       if (matrix_number < 0) {
> +               matrix_number =3D eint->total_pin_number;
> +               dev_info(eint->dev, "%s eint in legacy mode, assign the m=
atrix number to %u.\n",
> +                        __func__, matrix_number);
> +       } else
> +               dev_info(eint->dev, "%s eint in new mode, assign the matr=
ix number to %u.\n",
> +                        __func__, matrix_number);
> +
> +       for (i =3D 0; i < matrix_number; i++) {
> +               ofset =3D i * REG_OFSET;
> +
> +               ret =3D of_property_read_u32_index(node, "mediatek,pins",
> +                                          ofset, &id);
> +               ret |=3D of_property_read_u32_index(node, "mediatek,pins"=
,
> +                                          ofset+FIRST, &inst);
> +               ret |=3D of_property_read_u32_index(node, "mediatek,pins"=
,
> +                                          ofset+SECOND, &idx);
> +               ret |=3D of_property_read_u32_index(node, "mediatek,pins"=
,
> +                                          ofset+THIRD, &support_deb);
> +
> +               /* Legacy chip which no need to give coordinate list */
> +               if (ret) {
> +                       id =3D i;
> +                       inst =3D 0;
> +                       idx =3D i;
> +                       support_deb =3D (i < MAX_BIT) ? 1 : 0;
> +               }
> +
> +               eint->pins[id].enabled =3D true;
> +               eint->pins[id].instance =3D inst;
> +               eint->pins[id].index =3D idx;
> +               eint->pins[id].debounce =3D support_deb;
> +
> +               eint->instances[inst].pin_list[idx] =3D id;
> +               eint->instances[inst].number++;
> +
> +#if defined(MTK_EINT_DEBUG)
> +               pin =3D eint->pins[id];
> +               dev_info(eint->dev,
> +                        "EINT%u in (%u-%u), su_deb =3D %u",
> +                        id,
> +                        pin.instance,
> +                        eint->instances[inst].number,
> +                        pin.debounce,
> +#endif
> +       }
> +
> +       for (i =3D 0; i < eint->instance_number; i++) {
> +               size =3D (eint->instances[i].number / MAX_BIT + 1) * size=
of(unsigned int);
> +               eint->instances[i].wake_mask =3D
> +                       devm_kzalloc(eint->dev, size, GFP_KERNEL);
> +               eint->instances[i].cur_mask =3D
> +                       devm_kzalloc(eint->dev, size, GFP_KERNEL);
> +
> +               if (!eint->instances[i].wake_mask ||
> +                   !eint->instances[i].cur_mask)
> +                       return -ENOMEM;
> +       }
> +
> +       eint->comp =3D &default_compat;
> +
> +       eint->irq =3D irq_of_parse_and_map(node, 0);
> +       if (!eint->irq) {
> +               dev_err(eint->dev,
> +                       "%s IRQ parse fail.\n", __func__);
> +               return -EINVAL;
> +       }
> +
>         eint->domain =3D irq_domain_add_linear(eint->dev->of_node,
> -                                            eint->hw->ap_num,
> +                                            eint->total_pin_number,
>                                              &irq_domain_simple_ops, NULL=
);
>         if (!eint->domain)
>                 return -ENOMEM;
>
> -       if (eint->hw->db_time) {
> -               for (i =3D 0; i < MTK_EINT_DBNC_MAX; i++)
> -                       if (eint->hw->db_time[i] =3D=3D 0)
> -                               break;
> -               eint->num_db_time =3D i;
> -       }
> -
>         mtk_eint_hw_init(eint);
> -       for (i =3D 0; i < eint->hw->ap_num; i++) {
> -               int virq =3D irq_create_mapping(eint->domain, i);
> +       for (i =3D 0; i < eint->total_pin_number; i++) {
> +               virq =3D irq_create_mapping(eint->domain, i);
>
>                 irq_set_chip_and_handler(virq, &mtk_eint_irq_chip,
>                                          handle_level_irq);
> @@ -533,9 +954,11 @@ int mtk_eint_do_init(struct mtk_eint *eint)
>         irq_set_chained_handler_and_data(eint->irq, mtk_eint_irq_handler,
>                                          eint);
>
> +       global_eintc =3D eint;
> +
>         return 0;
>  }
> -EXPORT_SYMBOL_GPL(mtk_eint_do_init);
> +EXPORT_SYMBOL_GPL(mtk_eint_do_init_v2);
>
>  MODULE_LICENSE("GPL v2");
>  MODULE_DESCRIPTION("MediaTek EINT Driver");
> diff --git a/drivers/pinctrl/mediatek/mtk-eint.h b/drivers/pinctrl/mediat=
ek/mtk-eint.h
> index 6139b16cd225..aa17a6073029 100644
> --- a/drivers/pinctrl/mediatek/mtk-eint.h
> +++ b/drivers/pinctrl/mediatek/mtk-eint.h
> @@ -11,6 +11,25 @@
>
>  #include <linux/irqdomain.h>
>
> +#define MAX_PIN 999
> +#define MTK_EINT_EDGE_SENSITIVE           0
> +#define MTK_EINT_LEVEL_SENSITIVE          1
> +#define MTK_EINT_DBNC_SET_DBNC_BITS       4
> +#define MTK_EINT_DBNC_RST_BIT             (0x1 << 1)
> +#define MTK_EINT_DBNC_SET_EN              (0x1 << 0)
> +#define MTK_EINT_NO_OFSET                 0
> +#define MAX_BIT                           32
> +#define REG_OFSET                         4
> +#define REG_GROUP                         5
> +#define REG_VAL                           0xFFFFFFFF
> +#define DB_GROUP                          8
> +#define FIRST                             1
> +#define SECOND                            2
> +#define THIRD                             3
> +#define ARRAY_0                           4
> +
> +//#define MTK_EINT_DEBUG
> +
>  struct mtk_eint_regs {
>         unsigned int    stat;
>         unsigned int    ack;
> @@ -30,6 +49,36 @@ struct mtk_eint_regs {
>         unsigned int    dbnc_ctrl;
>         unsigned int    dbnc_set;
>         unsigned int    dbnc_clr;
> +       unsigned int    event;
> +       unsigned int    event_set;
> +       unsigned int    event_clr;
> +       unsigned int    raw_stat;
> +};
> +
> +struct mtk_eint_ops {
> +       void (*ack)(struct irq_data *d);
> +};
> +
> +struct mtk_eint_compatible {
> +       struct mtk_eint_ops ops;
> +       const struct mtk_eint_regs *regs;
> +};
> +
> +struct mtk_eint_instance {
> +       const char *name;
> +       void __iomem *base;
> +       unsigned int number;
> +       unsigned int pin_list[MAX_PIN];
> +       unsigned int *wake_mask;
> +       unsigned int *cur_mask;
> +};
> +
> +struct mtk_eint_pin {
> +       bool enabled;
> +       unsigned int instance;
> +       unsigned int index;
> +       bool debounce;
> +       bool dual_edge;
>  };
>
>  struct mtk_eint_hw {
> @@ -60,11 +109,14 @@ struct mtk_eint {
>         struct irq_domain *domain;
>         int irq;
>
> -       int *dual_edge;
> -       u32 *wake_mask;
> -       u32 *cur_mask;
> -
> -       /* Used to fit into various EINT device */
> +       /* An array to record the coordinate, index by global EINT ID */
> +       struct mtk_eint_pin *pins;
> +       /* An array to record the global EINT ID, index by coordinate*/
> +       struct mtk_eint_instance *instances;
> +       unsigned int total_pin_number;
> +       unsigned int instance_number;
> +       unsigned int dump_target_eint;
> +       const struct mtk_eint_compatible *comp;
>         const struct mtk_eint_hw *hw;
>         const struct mtk_eint_regs *regs;
>         u16 num_db_time;
> @@ -74,13 +126,15 @@ struct mtk_eint {
>         const struct mtk_eint_xt *gpio_xlate;
>  };
>
> -#if IS_ENABLED(CONFIG_EINT_MTK)
> +#if (IS_ENABLED(CONFIG_EINT_MTK) || IS_ENABLED(CONFIG_DEVICE_MODULES_EIN=
T_MTK))
>  int mtk_eint_do_init(struct mtk_eint *eint);
> +int mtk_eint_do_init_v2(struct mtk_eint *eint);
>  int mtk_eint_do_suspend(struct mtk_eint *eint);
>  int mtk_eint_do_resume(struct mtk_eint *eint);
>  int mtk_eint_set_debounce(struct mtk_eint *eint, unsigned long eint_n,
>                           unsigned int debounce);
>  int mtk_eint_find_irq(struct mtk_eint *eint, unsigned long eint_n);
> +int dump_eint_pin_status(unsigned int eint_num);
>
>  #else
>  static inline int mtk_eint_do_init(struct mtk_eint *eint)
> @@ -88,6 +142,11 @@ static inline int mtk_eint_do_init(struct mtk_eint *e=
int)
>         return -EOPNOTSUPP;
>  }
>
> +static inline int mtk_eint_do_init_v2(struct mtk_eint *eint)
> +{
> +       return -EOPNOTSUPP;
> +}
> +
>  static inline int mtk_eint_do_suspend(struct mtk_eint *eint)
>  {
>         return -EOPNOTSUPP;
> @@ -108,5 +167,9 @@ static inline int mtk_eint_find_irq(struct mtk_eint *=
eint, unsigned long eint_n)
>  {
>         return -EOPNOTSUPP;
>  }
> +static inline int dump_eint_pin_status(unsigned int eint_num)
> +{
> +       return -EOPNOTSUPP;
> +}
>  #endif
>  #endif /* __MTK_EINT_H */
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/p=
inctrl/mediatek/pinctrl-mtk-common-v2.c
> index 54301fbba524..3740e868c650 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> @@ -375,33 +375,37 @@ int mtk_build_eint(struct mtk_pinctrl *hw, struct p=
latform_device *pdev)
>         if (!of_property_read_bool(np, "interrupt-controller"))
>                 return -ENODEV;
>
> -       hw->eint =3D devm_kzalloc(hw->dev, sizeof(*hw->eint), GFP_KERNEL)=
;
> -       if (!hw->eint)
> -               return -ENOMEM;
> -
> -       hw->eint->base =3D devm_platform_ioremap_resource_byname(pdev, "e=
int");
> -       if (IS_ERR(hw->eint->base)) {
> -               ret =3D PTR_ERR(hw->eint->base);
> -               goto err_free_eint;
> -       }
> +       if (hw->soc->eint_hw) {
> +               hw->eint =3D devm_kzalloc(hw->dev, sizeof(*hw->eint), GFP=
_KERNEL);
> +               if (!hw->eint)
> +                       return -ENOMEM;
> +
> +               hw->eint->base =3D devm_platform_ioremap_resource_byname(=
pdev, "eint");
> +               if (IS_ERR(hw->eint->base)) {
> +                       ret =3D PTR_ERR(hw->eint->base);
> +                       goto err_free_eint;
> +               }
>
> -       hw->eint->irq =3D irq_of_parse_and_map(np, 0);
> -       if (!hw->eint->irq) {
> -               ret =3D -EINVAL;
> -               goto err_free_eint;
> -       }
> +               hw->eint->irq =3D irq_of_parse_and_map(np, 0);
> +               if (!hw->eint->irq) {
> +                       ret =3D -EINVAL;
> +                       goto err_free_eint;
> +               }
>
> -       if (!hw->soc->eint_hw) {
> -               ret =3D -ENODEV;
> -               goto err_free_eint;
> -       }
> +               hw->eint->dev =3D &pdev->dev;
> +               hw->eint->hw =3D hw->soc->eint_hw;
> +               hw->eint->pctl =3D hw;
> +               hw->eint->gpio_xlate =3D &mtk_eint_xt;
> +
> +                return mtk_eint_do_init(hw->eint);
>
> -       hw->eint->dev =3D &pdev->dev;
> -       hw->eint->hw =3D hw->soc->eint_hw;
> -       hw->eint->pctl =3D hw;
> -       hw->eint->gpio_xlate =3D &mtk_eint_xt;
> +        } else {
> +                hw->eint->dev =3D &pdev->dev;
> +                hw->eint->pctl =3D hw;
> +                hw->eint->gpio_xlate =3D &mtk_eint_xt;
>
> -       return mtk_eint_do_init(hw->eint);
> +                return mtk_eint_do_init_v2(hw->eint);
> +       }
>
>  err_free_eint:
>         devm_kfree(hw->dev, hw->eint);
> --
> 2.34.1
>
>

