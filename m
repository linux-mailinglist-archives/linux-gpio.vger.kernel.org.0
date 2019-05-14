Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8FE81C05E
	for <lists+linux-gpio@lfdr.de>; Tue, 14 May 2019 03:38:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726657AbfENBiL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 May 2019 21:38:11 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:45819 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726604AbfENBiL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 May 2019 21:38:11 -0400
Received: by mail-qk1-f194.google.com with SMTP id j1so9291990qkk.12
        for <linux-gpio@vger.kernel.org>; Mon, 13 May 2019 18:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zwRPJV1ea5/fubxrHAnDt8q85ACTUpNCnRonfvDrwtQ=;
        b=cV8CDih8rYP1Q2P21ENTjW7+9KHarjnNarh3p+yta6mBnxR3GWMtJ+F9aPtbPrgmmG
         X+DiLrn5IlCaW7mpsL9/U0ujHeFG2aNeIn9QmS2ZUcIoDhQcUHCUg3kwoTnsR0XXvXwE
         FaEg81DlK47GL87NGWbxzH/nAjQTjMixtBP3w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zwRPJV1ea5/fubxrHAnDt8q85ACTUpNCnRonfvDrwtQ=;
        b=Cgqzvc7u/9qNvBFBzJqLBduC4u+hmuJmRrY9Avs1IRO6kuplli0JmvUrTNkGLpQ7XR
         ZGff+091DzXAhOmnxvFLRTly6SsChrDQ6SBed7ALE95fQWmps0BbjeQPiqXTF/0QN+ek
         dFjURHI8CUDUymDZt+IgTkiVwTTXxmMoUVaSl4h1pPZ/MzzBOgFZ+KmXAWBdkFcUmp6R
         jprPtdTr7sUq7Ywf1MG+nnE3Jnf0TsAAQmj7foRBQvsviPN+piJ4Ps0IlieMvokwvd52
         xo3G72J8HxbgxNV9bYodJ8BtMctULFSKWWZLdYHXbn6kbRYEjsS21nLDLAt/uoHK7Qmg
         4hVQ==
X-Gm-Message-State: APjAAAXMLLchms0Q+Ej62dPvfbyfz/LY69QEv9Hc5j0GO9+ao6JIOWM5
        4HY3ubimM6KV9kS92cHUJDG7/IyEZm7s6bLrhRZxow==
X-Google-Smtp-Source: APXvYqzsJpqxHDJ2qevMSmT1HPJa1iHE7NRKTlyDxcyCq4T4aHwPxe7bd9ialVJHGfZ/iY2dzrt8lG7EoBq9Zw90IgI=
X-Received: by 2002:a37:2e05:: with SMTP id u5mr26568027qkh.124.1557797889779;
 Mon, 13 May 2019 18:38:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190429035515.73611-1-drinkcat@chromium.org> <20190429035515.73611-3-drinkcat@chromium.org>
 <155778659317.14659.136626364818483852@swboyd.mtv.corp.google.com>
In-Reply-To: <155778659317.14659.136626364818483852@swboyd.mtv.corp.google.com>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Tue, 14 May 2019 09:37:58 +0800
Message-ID: <CANMq1KBMd7eR3dP=V9gJ6G4OgE6DsXad_gzvuNJ25_pee4+6eg@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: mediatek: Update cur_mask in mask/mask ops
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-gpio@vger.kernel.org,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Chuanjia Liu <Chuanjia.Liu@mediatek.com>,
        Evan Green <evgreen@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 14, 2019 at 6:29 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Nicolas Boichat (2019-04-28 20:55:15)
> > During suspend/resume, mtk_eint_mask may be called while
> > wake_mask is active. For example, this happens if a wake-source
> > with an active interrupt handler wakes the system:
> > irq/pm.c:irq_pm_check_wakeup would disable the interrupt, so
> > that it can be handled later on in the resume flow.
> >
> > However, this may happen before mtk_eint_do_resume is called:
> > in this case, wake_mask is loaded, and cur_mask is restored
> > from an older copy, re-enabling the interrupt, and causing
> > an interrupt storm (especially for level interrupts).
> >
> > Instead, we just record mask/unmask changes in cur_mask. This
> > also avoids the need to read the current mask in eint_do_suspend,
> > and we can remove mtk_eint_chip_read_mask function.
> >
> > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
>
> It looks an awful lot like you should just use IRQCHIP_MASK_ON_SUSPEND
> here. Isn't that what's happening? All non-wake irqs should be masked at
> the hardware level so they can't cause a wakeup during suspend and on
> resume they can be unmasked?

No, this is for an line that has both wake and interrupt enabled. To
reword the commit message above:
 1. cur_mask[irq] = 1; wake_mask[irq] = 1; EINT_EN[irq] = 1 (interrupt
enabled at hardware level)
 2. System suspends, resumes due to that line (at this stage EINT_HW
== wake_mask)
 3. irq_pm_check_wakeup is called, and disables the interrupt =>
EINT_EN[irq] = 0, but we still have cur_mask[irq] = 1
 4. mtk_eint_do_resume is called, and restores EINT_EN = cur_mask, so
it reenables EINT_EN[irq] = 1 => interrupt storm.

This patch fixes the issue in step 3. So that the interrupt can be
re-enabled properly later on, sometimes after mtk_eint_do_resume, when
the driver is ready to handle it.

Also, IRQCHIP_MASK_ON_SUSPEND does not handle lines that are enabled
as a wake source, but without interrupt enabled (e.g. cros_ec driver
does that), which we do want to support.

> > diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediatek/mtk-eint.c
> > index 737385e86beb807..7e526bcf5e0b55c 100644
> > --- a/drivers/pinctrl/mediatek/mtk-eint.c
> > +++ b/drivers/pinctrl/mediatek/mtk-eint.c
> > @@ -113,6 +113,8 @@ static void mtk_eint_mask(struct irq_data *d)
> >         void __iomem *reg = mtk_eint_get_offset(eint, d->hwirq,
> >                                                 eint->regs->mask_set);
> >
> > +       eint->cur_mask[d->hwirq >> 5] &= ~mask;
> > +
> >         writel(mask, reg);
> >  }
> >
> > @@ -123,6 +125,8 @@ static void mtk_eint_unmask(struct irq_data *d)
> >         void __iomem *reg = mtk_eint_get_offset(eint, d->hwirq,
> >                                                 eint->regs->mask_clr);
> >
> > +       eint->cur_mask[d->hwirq >> 5] |= mask;
> > +
> >         writel(mask, reg);
> >
> >         if (eint->dual_edge[d->hwirq])
> > @@ -384,7 +375,6 @@ static void mtk_eint_irq_handler(struct irq_desc *desc)
> >
> >  int mtk_eint_do_suspend(struct mtk_eint *eint)
> >  {
> > -       mtk_eint_chip_read_mask(eint, eint->base, eint->cur_mask);
> >         mtk_eint_chip_write_mask(eint, eint->base, eint->wake_mask);
> >
>
>
> This alone looks like, write out the mask to only allow wake interrupts.

Yes, and enable wake interrupts that may not be in cur_mask.
