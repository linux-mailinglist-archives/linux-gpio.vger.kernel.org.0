Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B95D733CA2
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jun 2019 02:57:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726245AbfFDA5r (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Jun 2019 20:57:47 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:41005 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726163AbfFDA5q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Jun 2019 20:57:46 -0400
Received: by mail-qt1-f193.google.com with SMTP id s57so4679632qte.8
        for <linux-gpio@vger.kernel.org>; Mon, 03 Jun 2019 17:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wGerWka379zTFKk4O18r7e4C+XH4CLZsivoNiqmFflA=;
        b=N/B5m564uGRU5DzGSaidfavHUZK6VVz9j6uZFXnLNih2mM8li/CbD2YgPhtBuvUB8s
         DN56C6nsS+a65E4/Eg/e5JNxm/80fhAUP4jtU75cgX61L0i1ES1BdsVNbWLZ+IHWgRLe
         /GgIQasYCPFzw6oMVy2VAHhTKmSHlCsEKIGLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wGerWka379zTFKk4O18r7e4C+XH4CLZsivoNiqmFflA=;
        b=jIUYxKWs8rLetX18BYoc9Rpa4pPZnc5w2VnjpEutTJf2JMw1UzkOVWoZpiAA83MSLe
         q62XhoBqznchfIMfBvAuIy0wnPLLmZCH0mk1KYxvY8x7dyTEandpx3Qr2gSFnRLG5T5s
         cnnIxDwbPHDVd340JgAWCW0YPB/7vCHLfdko3uHPype1w+79TfSKVBIdHd4i/Pcs/usv
         3xLu5vrPJu/9w+b00mj3APKn8qZD0i4Pizdz8zgmkd6m9IrnHpuZsHTEzzJiNVSZtdkk
         DfST/RP/lG3wmj8ETknIJ+TXcIpLblr0A6zKICkx5GmeSUqKGuSkRcWNkv3VFW2f3XnH
         BAiw==
X-Gm-Message-State: APjAAAWcmWpOOD0XoFvY7Z3sIEPdJCHyn7ky1Ljl/Ymnk61c/qQUPx+t
        wxlDNosHbKa4NSrHg0kwWVWN2OwZL2dWdvlwVEQigg==
X-Google-Smtp-Source: APXvYqxd1ny21RExqnq7JxPUK1A22sSWLMoGbsUPyUKcwzjXuOfVTLyluasxBlW5p4bcUE1Z0qQ+MAcSLMQnKm97wRo=
X-Received: by 2002:a0c:b04d:: with SMTP id l13mr24741070qvc.104.1559609865168;
 Mon, 03 Jun 2019 17:57:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190429035515.73611-1-drinkcat@chromium.org> <20190429035515.73611-3-drinkcat@chromium.org>
 <155778659317.14659.136626364818483852@swboyd.mtv.corp.google.com>
 <CANMq1KBMd7eR3dP=V9gJ6G4OgE6DsXad_gzvuNJ25_pee4+6eg@mail.gmail.com>
 <155786487644.14659.17142525593824613967@swboyd.mtv.corp.google.com>
 <CANMq1KCNzn-5sYJZGivUedsNaQfVW_MjgDZn27W6sz8Fk3beNA@mail.gmail.com>
 <CAE=gft6jxR9Lt7tLwm6VKy9_shMVW7wf3g6rBGEqtB7oNH0hUA@mail.gmail.com>
 <1559289956.13732.17.camel@mhfsdcap03> <CAE=gft7YOVFUiWD=u39xSPVFUtiqb7m93sMGBFb7Ufn2RB+B_g@mail.gmail.com>
 <1559548885.13732.28.camel@mhfsdcap03>
In-Reply-To: <1559548885.13732.28.camel@mhfsdcap03>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Tue, 4 Jun 2019 08:57:34 +0800
Message-ID: <CANMq1KCYjOE277EQbDB9inJjVqUfq6=c98d3+JgNByRgA4cKTA@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: mediatek: Update cur_mask in mask/mask ops
To:     Chuanjia Liu <Chuanjia.Liu@mediatek.com>
Cc:     Evan Green <evgreen@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 3, 2019 at 4:01 PM Chuanjia Liu <Chuanjia.Liu@mediatek.com> wrote:
>
> On Fri, 2019-05-31 at 10:17 -0700, Evan Green wrote:
> > On Fri, May 31, 2019 at 1:06 AM Chuanjia Liu <Chuanjia.Liu@mediatek.com> wrote:
> > >
> > > On Thu, 2019-05-30 at 10:12 -0700, Evan Green wrote:
> > > > On Wed, May 15, 2019 at 1:05 AM Nicolas Boichat <drinkcat@chromium.org> wrote:
> > > > >
> > > > > On Wed, May 15, 2019 at 4:14 AM Stephen Boyd <swboyd@chromium.org> wrote:
> > > > > >
> > > > > > Quoting Nicolas Boichat (2019-05-13 18:37:58)
> > > > > > > On Tue, May 14, 2019 at 6:29 AM Stephen Boyd <swboyd@chromium.org> wrote:
> > > > > > > >
> > > > > > > > Quoting Nicolas Boichat (2019-04-28 20:55:15)
> > > > > > > > > During suspend/resume, mtk_eint_mask may be called while
> > > > > > > > > wake_mask is active. For example, this happens if a wake-source
> > > > > > > > > with an active interrupt handler wakes the system:
> > > > > > > > > irq/pm.c:irq_pm_check_wakeup would disable the interrupt, so
> > > > > > > > > that it can be handled later on in the resume flow.
> > > > > > > > >
> > > > > > > > > However, this may happen before mtk_eint_do_resume is called:
> > > > > > > > > in this case, wake_mask is loaded, and cur_mask is restored
> > > > > > > > > from an older copy, re-enabling the interrupt, and causing
> > > > > > > > > an interrupt storm (especially for level interrupts).
> > > > > > > > >
> > > > > > > > > Instead, we just record mask/unmask changes in cur_mask. This
> > > > > > > > > also avoids the need to read the current mask in eint_do_suspend,
> > > > > > > > > and we can remove mtk_eint_chip_read_mask function.
> > > > > > > > >
> > > > > > > > > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> > > > > > > >
> > > > > > > > It looks an awful lot like you should just use IRQCHIP_MASK_ON_SUSPEND
> > > > > > > > here. Isn't that what's happening? All non-wake irqs should be masked at
> > > > > > > > the hardware level so they can't cause a wakeup during suspend and on
> > > > > > > > resume they can be unmasked?
> > > > > > >
> > > > > > > No, this is for an line that has both wake and interrupt enabled. To
> > > > > > > reword the commit message above:
> > > > > >
> > > > > > Is my understanding correct that there isn't a different "wake up"
> > > > > > register that can be written to cause a GPIO to be configured to wake
> > > > > > the system from suspend? The only way to do so is to leave the GPIO
> > > > > > unmasked in the hardware by having EINT_EN[irq] = 1? And thus any
> > > > > > interrupts that we don't want to wake us up during suspend should be
> > > > > > masked in the hardware?
> > > > >
> > > > > Yes, that's my understanding as well.
> > > > >
> > > > > And then, what this driver does is to emulate the behaviour of a
> > > > > controller that would actually have separate irq and wake enable
> > > > > registers.
> > > > >
> > > > > > If that's true, the code here that's trying to keep track of enabled
> > > > > > irqs and wakeup enabled irqs can be replaced with the irqchip flag so
> > > > > > that wakeup irqs are not masked while non-wakeups are masked.
> > > > >
> > > > > Correct, but with the caveat that I don't see anything that definitely
> > > > > requires an interrupt to be enabled to be a wake source. See below...
> > > > >
> > > > > >
> > > > > > >  1. cur_mask[irq] = 1; wake_mask[irq] = 1; EINT_EN[irq] = 1 (interrupt
> > > > > > > enabled at hardware level)
> > > > > > >  2. System suspends, resumes due to that line (at this stage EINT_HW
> > > > > > > == wake_mask)
> > > > > > >  3. irq_pm_check_wakeup is called, and disables the interrupt =>
> > > > > > > EINT_EN[irq] = 0, but we still have cur_mask[irq] = 1
> > > > > > >  4. mtk_eint_do_resume is called, and restores EINT_EN = cur_mask, so
> > > > > > > it reenables EINT_EN[irq] = 1 => interrupt storm.
> > > > > > >
> > > > > > > This patch fixes the issue in step 3. So that the interrupt can be
> > > > > > > re-enabled properly later on, sometimes after mtk_eint_do_resume, when
> > > > > > > the driver is ready to handle it.
> > > > > >
> > > > > > Right, we'd rather not see irqchip drivers working around the genirq
> > > > > > layer to do these things like tracking cur_mask and wake_mask. That
> > > > > > leads to subtle bugs and makes the driver maintain state across the
> > > > > > irqchip callbacks and system suspend/resume.
> > > > > >
> > > > > > >
> > > > > > > Also, IRQCHIP_MASK_ON_SUSPEND does not handle lines that are enabled
> > > > > > > as a wake source, but without interrupt enabled (e.g. cros_ec driver
> > > > > > > does that), which we do want to support.
> > > > > >
> > > > > > Hmm. I thought that even if the irq is disabled by a driver, that would
> > > > > > be a lazy disable so it isn't really masked in the hardware. Then if an
> > > > > > interrupt comes in during suspend on a wake configured irq line, the
> > > > > > hardware will have left it unmasked because IRQCHIP_MASK_ON_SUSPEND in
> > > > > > combination with lazy disable would mean that the line is left unmasked
> > > > > > (ignoring whatever this mediatek driver is doing to mask and unmask in
> > > > > > PM hooks).
> > > > >
> > > > > At the very least, that's not what happens with this system. The
> > > > > interrupt is definitely not kept enabled in suspend, and the system
> > > > > would not wake from an EC interrupt. (see also this series, BTW:
> > > > > https://patchwork.kernel.org/cover/10921121/).
> > > > >
> > > > > > Just reading Documentation/power/suspend-and-interrupts.txt I'm led to
> > > > > > believe that the cros_ec driver shouldn't call disable_irq() on the
> > > > > > interrupt if it wants to wakeup from it:
> > > > > >
> > > > > > "Calling enable_irq_wake() causes suspend_device_irqs() to treat the
> > > > > > given IRQ in a special way.  Namely, the IRQ remains enabled, by on the
> > > > > > first interrupt it will be disabled, marked as pending and "suspended"
> > > > > > so that it will be re-enabled by resume_device_irqs() during the
> > > > > > subsequent system resume.  Also the PM core is notified about the event
> > > > > > which causes the system suspend in progress to be aborted (that doesn't
> > > > > > have to happen immediately, but at one of the points where the suspend
> > > > > > thread looks for pending wakeup events)."
> > > > >
> > > > > I think this describes the behaviour when you keep both enabled.
> > > > >
> > > > > > I suppose the problem is an irq line disabled in hardware that has
> > > > > > wakeup armed on it? Is this even valid? Shouldn't an irq be enabled for
> > > > > > wakeup to work?
> > > > >
> > > > > I couldn't really find a definite answer, but there are a bunch of
> > > > > examples of other drivers in the kernel:
> > > > >  - drivers/extcon/extcon-usb-gpio.c:usb_extcon_suspend
> > > > >  - drivers/hid/i2c-hid/i2c-hid.c:i2c_hid_suspend
> > > > >  - drivers/mfd/max77843.c:max77843_suspend
> > > > > (not exhaustive, this is quite hard to grep for...)
> > > > >
> > > > > > We could immediately unmask those lines in the hardware when the
> > > > > > set_wake() callback is called. That way the genirq layer can use the
> > > > > > driver to do what it wants with the hardware and the driver can make
> > > > > > sure that set_wake() will always cause the wakeup interrupt to be
> > > > > > delivered to genirq even when software has disabled it.
> > > > > >
> > > > > > But I think that there might be a problem with how genirq understands
> > > > > > the masked state of a line when the wakeup implementation conflates
> > > > > > masked state with wakeup armed state. Consider this call-flow:
> > > > > >
> > > > > >         irq masked in hardware, IRQD_IRQ_MASKED is set
> > > > > >         enable_irq_wake()
> > > > > >           unmask_irq in hardware
> > > > > >         IRQD_WAKEUP_ARMED is set
> > > > > >         <suspend and wakeup from irq>
> > > > > >         handle_level_irq()
> > > > > >           mask_ack_irq()
> > > > > >             mask_irq()
> > > > > >               if (irqd_irq_masked()) -> returns true and skips masking!
> > > > > >             if (desc->irq_data.chip->irq_ack)
> > > > > >               ...
> > > > > >           irq_may_run()
> > > > > >             irq_pm_check_wakeup()
> > > > > >               irq_disable()
> > > > > >                 mask_irq() -> does nothing again
> > > > > >
> > > > > > In the above flow, we never mask the irq because we thought it was
> > > > > > already masked when it was disabled, but the irqchip implementation
> > > > > > unmasked it to make wakeup work. Maybe we should always mask the irq if
> > > > > > wakeup is armed and we're trying to call mask_irq()? Looks hacky.
> > > Maybe we can implement irqchip's mask_ack_irq  in mediatek driver to
> > > always mask the irq. Then flow will always call it without judgment
> > > IRQD_IRQ_MASKED.
> > >
> > > diff --git a/drivers/pinctrl/mediatek/mtk-eint.c
> > > b/drivers/pinctrl/mediatek/mtk-
> > > index f464f8c..9f1aae2 100644
> > > --- a/drivers/pinctrl/mediatek/mtk-eint.c
> > > +++ b/drivers/pinctrl/mediatek/mtk-eint.c
> > > @@ -272,12 +272,19 @@ static void mtk_eint_irq_release_resources(struct
> > > irq_data
> > >         gpiochip_unlock_as_irq(gpio_c, gpio_n);
> > >  }
> > >
> > > +static void mtk_eint_mask_ack(struct irq_data *d)
> > > +{
> > > +       mtk_eint_mask(d);
> > > +       mtk_eint_ack(d);
> > > +}
> > > +
> > >  static struct irq_chip mtk_eint_irq_chip = {
> > >         .name = "mt-eint",
> > >         .irq_disable = mtk_eint_mask,
> > >         .irq_mask = mtk_eint_mask,
> > >         .irq_unmask = mtk_eint_unmask,
> > >         .irq_ack = mtk_eint_ack,
> > > +       .irq_mask_ack = mtk_eint_mask_ack,
> > >         .irq_set_type = mtk_eint_set_type,
> > >         .irq_set_wake = mtk_eint_irq_set_wake,
> > >         .irq_request_resources = mtk_eint_irq_request_resources,
> > >
> > > This seems like a small change.
> > > thanks.
> >
> > Does this work? My understanding is that Linux thinks the irq is
> > _already_ masked, so it short-circuits in the generic IRQ code and
> > doesn't call mask again.
> > -Evan
>
> Yes, you are right.
>
> The underlying problem is really that the hardware IRQ enabled state is
> out of sync with what linux thinks.In resume flow,Linux thinks the irq
> is _already_masked, so it short-circuits in the generic IRQ code and
> doesn't call mask again.So in step 3 will have a interrupt storm.
>
> But we implement irqchip's mask_ack_irq so that mask_ack_irq() calls
> desc->irq_data.chip->irq_mask_ack instead of mask_irq() that needs to
> judge IRQD_IRQ_MASKED. This will correctly set cur_mask[irq] = 0 to
> sync with kernel state.

Oh, I see. I guess that would work as mask_ack_irq does not check for
current masked status before calling irq_chip->irq_mask_ack... But
that's only if irq_chip->irq_mask_ack is defined, else it just calls
mask_irq which does that check.

But if we follow bf22ff45bed ("genirq: Avoid unnecessary low level irq
function calls"), this is actually a bug and we should add that same
check to mask_ack_irq (and since pinctrl-rockchip.c does not implement
irq_mask_ack, it's understandable why the author missed that).

So I'm not sure if this is the right change either...

> Also, this patch can solve the issue of [1/2] in this patchset[1] which
> also is the interrupt mask cannot be set correctly due to hardware irq
> state not sync kernel.
>
> [1] https://patchwork.kernel.org/patch/10921143/
>
>
