Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF91F313A3
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2019 19:17:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726628AbfEaRR6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 31 May 2019 13:17:58 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:45814 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726520AbfEaRR6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 31 May 2019 13:17:58 -0400
Received: by mail-lf1-f65.google.com with SMTP id u10so1485462lfm.12
        for <linux-gpio@vger.kernel.org>; Fri, 31 May 2019 10:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MZw9c2R5om/NyL0DMAys5vBUCQTox2AMRFuBJhcUNKw=;
        b=AeNP6KZQR5cGb2TVRJZDTkOwDPTxZCQfWq/GUixI5HuUj8WaXPqUshhmUibmf54BVP
         Q6dzy+G5OlJyHdqFpT6Uo+VmvLf2cjqFlb3yqQ7K9yZ9jYEZLr59LTxC/afLC8tFVLmU
         bthNEqlDMQSwXTqFzTTLIa8mSrbf6/04dXblA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MZw9c2R5om/NyL0DMAys5vBUCQTox2AMRFuBJhcUNKw=;
        b=eTKuzwbbdIe4TRD0gBYmwq6eXvxcJqouulCCE2/xNTvqS1r74uKP0CkxxiKXdnvTwo
         t3nhNUYYizscqwmrDge71+D/VY786M1xbLM3TOOU34rCcyCmqpOnljRAbYmbfBJ4bF4h
         04C2dvu7c8VIvnrvTaCig0llu2WGeVntI41m9mH0uLz6rQu42IM1bt/VHllCRxZWpG9C
         VW+y2KHeXtys0Q95cW9tog+u1yn/eyAd3m5+LdrSM/Mld5wjE2099Ta30/hfN+UALk2G
         xFa2zePGO8wfia7jfhVtakS7kDy44gKKFj5es88wyRnY1QiVKHEdyt9139GQ+zwVixJy
         rUqQ==
X-Gm-Message-State: APjAAAVx23uP2wfUnDrJAlj9AB6haVpD0Sxas2XPuJnVWE5xigcga+Uj
        JdXk8YGqBDbKcgiRXndleLKTsnriB1E=
X-Google-Smtp-Source: APXvYqydBqS1RMT0VrdotFrrw4KUgNAEOv2nxwWQe2aKAGzBPKNNvq9g4zuulX0VhmlFCh9gVy7f6g==
X-Received: by 2002:a19:ee12:: with SMTP id g18mr6046943lfb.58.1559323075016;
        Fri, 31 May 2019 10:17:55 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id h23sm1340373ljf.28.2019.05.31.10.17.52
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Fri, 31 May 2019 10:17:53 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id v29so500965ljv.0
        for <linux-gpio@vger.kernel.org>; Fri, 31 May 2019 10:17:52 -0700 (PDT)
X-Received: by 2002:a2e:86da:: with SMTP id n26mr6332422ljj.212.1559323071921;
 Fri, 31 May 2019 10:17:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190429035515.73611-1-drinkcat@chromium.org> <20190429035515.73611-3-drinkcat@chromium.org>
 <155778659317.14659.136626364818483852@swboyd.mtv.corp.google.com>
 <CANMq1KBMd7eR3dP=V9gJ6G4OgE6DsXad_gzvuNJ25_pee4+6eg@mail.gmail.com>
 <155786487644.14659.17142525593824613967@swboyd.mtv.corp.google.com>
 <CANMq1KCNzn-5sYJZGivUedsNaQfVW_MjgDZn27W6sz8Fk3beNA@mail.gmail.com>
 <CAE=gft6jxR9Lt7tLwm6VKy9_shMVW7wf3g6rBGEqtB7oNH0hUA@mail.gmail.com> <1559289956.13732.17.camel@mhfsdcap03>
In-Reply-To: <1559289956.13732.17.camel@mhfsdcap03>
From:   Evan Green <evgreen@chromium.org>
Date:   Fri, 31 May 2019 10:17:15 -0700
X-Gmail-Original-Message-ID: <CAE=gft7YOVFUiWD=u39xSPVFUtiqb7m93sMGBFb7Ufn2RB+B_g@mail.gmail.com>
Message-ID: <CAE=gft7YOVFUiWD=u39xSPVFUtiqb7m93sMGBFb7Ufn2RB+B_g@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: mediatek: Update cur_mask in mask/mask ops
To:     Chuanjia Liu <Chuanjia.Liu@mediatek.com>
Cc:     Nicolas Boichat <drinkcat@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-gpio@vger.kernel.org,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 31, 2019 at 1:06 AM Chuanjia Liu <Chuanjia.Liu@mediatek.com> wrote:
>
> On Thu, 2019-05-30 at 10:12 -0700, Evan Green wrote:
> > On Wed, May 15, 2019 at 1:05 AM Nicolas Boichat <drinkcat@chromium.org> wrote:
> > >
> > > On Wed, May 15, 2019 at 4:14 AM Stephen Boyd <swboyd@chromium.org> wrote:
> > > >
> > > > Quoting Nicolas Boichat (2019-05-13 18:37:58)
> > > > > On Tue, May 14, 2019 at 6:29 AM Stephen Boyd <swboyd@chromium.org> wrote:
> > > > > >
> > > > > > Quoting Nicolas Boichat (2019-04-28 20:55:15)
> > > > > > > During suspend/resume, mtk_eint_mask may be called while
> > > > > > > wake_mask is active. For example, this happens if a wake-source
> > > > > > > with an active interrupt handler wakes the system:
> > > > > > > irq/pm.c:irq_pm_check_wakeup would disable the interrupt, so
> > > > > > > that it can be handled later on in the resume flow.
> > > > > > >
> > > > > > > However, this may happen before mtk_eint_do_resume is called:
> > > > > > > in this case, wake_mask is loaded, and cur_mask is restored
> > > > > > > from an older copy, re-enabling the interrupt, and causing
> > > > > > > an interrupt storm (especially for level interrupts).
> > > > > > >
> > > > > > > Instead, we just record mask/unmask changes in cur_mask. This
> > > > > > > also avoids the need to read the current mask in eint_do_suspend,
> > > > > > > and we can remove mtk_eint_chip_read_mask function.
> > > > > > >
> > > > > > > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> > > > > >
> > > > > > It looks an awful lot like you should just use IRQCHIP_MASK_ON_SUSPEND
> > > > > > here. Isn't that what's happening? All non-wake irqs should be masked at
> > > > > > the hardware level so they can't cause a wakeup during suspend and on
> > > > > > resume they can be unmasked?
> > > > >
> > > > > No, this is for an line that has both wake and interrupt enabled. To
> > > > > reword the commit message above:
> > > >
> > > > Is my understanding correct that there isn't a different "wake up"
> > > > register that can be written to cause a GPIO to be configured to wake
> > > > the system from suspend? The only way to do so is to leave the GPIO
> > > > unmasked in the hardware by having EINT_EN[irq] = 1? And thus any
> > > > interrupts that we don't want to wake us up during suspend should be
> > > > masked in the hardware?
> > >
> > > Yes, that's my understanding as well.
> > >
> > > And then, what this driver does is to emulate the behaviour of a
> > > controller that would actually have separate irq and wake enable
> > > registers.
> > >
> > > > If that's true, the code here that's trying to keep track of enabled
> > > > irqs and wakeup enabled irqs can be replaced with the irqchip flag so
> > > > that wakeup irqs are not masked while non-wakeups are masked.
> > >
> > > Correct, but with the caveat that I don't see anything that definitely
> > > requires an interrupt to be enabled to be a wake source. See below...
> > >
> > > >
> > > > >  1. cur_mask[irq] = 1; wake_mask[irq] = 1; EINT_EN[irq] = 1 (interrupt
> > > > > enabled at hardware level)
> > > > >  2. System suspends, resumes due to that line (at this stage EINT_HW
> > > > > == wake_mask)
> > > > >  3. irq_pm_check_wakeup is called, and disables the interrupt =>
> > > > > EINT_EN[irq] = 0, but we still have cur_mask[irq] = 1
> > > > >  4. mtk_eint_do_resume is called, and restores EINT_EN = cur_mask, so
> > > > > it reenables EINT_EN[irq] = 1 => interrupt storm.
> > > > >
> > > > > This patch fixes the issue in step 3. So that the interrupt can be
> > > > > re-enabled properly later on, sometimes after mtk_eint_do_resume, when
> > > > > the driver is ready to handle it.
> > > >
> > > > Right, we'd rather not see irqchip drivers working around the genirq
> > > > layer to do these things like tracking cur_mask and wake_mask. That
> > > > leads to subtle bugs and makes the driver maintain state across the
> > > > irqchip callbacks and system suspend/resume.
> > > >
> > > > >
> > > > > Also, IRQCHIP_MASK_ON_SUSPEND does not handle lines that are enabled
> > > > > as a wake source, but without interrupt enabled (e.g. cros_ec driver
> > > > > does that), which we do want to support.
> > > >
> > > > Hmm. I thought that even if the irq is disabled by a driver, that would
> > > > be a lazy disable so it isn't really masked in the hardware. Then if an
> > > > interrupt comes in during suspend on a wake configured irq line, the
> > > > hardware will have left it unmasked because IRQCHIP_MASK_ON_SUSPEND in
> > > > combination with lazy disable would mean that the line is left unmasked
> > > > (ignoring whatever this mediatek driver is doing to mask and unmask in
> > > > PM hooks).
> > >
> > > At the very least, that's not what happens with this system. The
> > > interrupt is definitely not kept enabled in suspend, and the system
> > > would not wake from an EC interrupt. (see also this series, BTW:
> > > https://patchwork.kernel.org/cover/10921121/).
> > >
> > > > Just reading Documentation/power/suspend-and-interrupts.txt I'm led to
> > > > believe that the cros_ec driver shouldn't call disable_irq() on the
> > > > interrupt if it wants to wakeup from it:
> > > >
> > > > "Calling enable_irq_wake() causes suspend_device_irqs() to treat the
> > > > given IRQ in a special way.  Namely, the IRQ remains enabled, by on the
> > > > first interrupt it will be disabled, marked as pending and "suspended"
> > > > so that it will be re-enabled by resume_device_irqs() during the
> > > > subsequent system resume.  Also the PM core is notified about the event
> > > > which causes the system suspend in progress to be aborted (that doesn't
> > > > have to happen immediately, but at one of the points where the suspend
> > > > thread looks for pending wakeup events)."
> > >
> > > I think this describes the behaviour when you keep both enabled.
> > >
> > > > I suppose the problem is an irq line disabled in hardware that has
> > > > wakeup armed on it? Is this even valid? Shouldn't an irq be enabled for
> > > > wakeup to work?
> > >
> > > I couldn't really find a definite answer, but there are a bunch of
> > > examples of other drivers in the kernel:
> > >  - drivers/extcon/extcon-usb-gpio.c:usb_extcon_suspend
> > >  - drivers/hid/i2c-hid/i2c-hid.c:i2c_hid_suspend
> > >  - drivers/mfd/max77843.c:max77843_suspend
> > > (not exhaustive, this is quite hard to grep for...)
> > >
> > > > We could immediately unmask those lines in the hardware when the
> > > > set_wake() callback is called. That way the genirq layer can use the
> > > > driver to do what it wants with the hardware and the driver can make
> > > > sure that set_wake() will always cause the wakeup interrupt to be
> > > > delivered to genirq even when software has disabled it.
> > > >
> > > > But I think that there might be a problem with how genirq understands
> > > > the masked state of a line when the wakeup implementation conflates
> > > > masked state with wakeup armed state. Consider this call-flow:
> > > >
> > > >         irq masked in hardware, IRQD_IRQ_MASKED is set
> > > >         enable_irq_wake()
> > > >           unmask_irq in hardware
> > > >         IRQD_WAKEUP_ARMED is set
> > > >         <suspend and wakeup from irq>
> > > >         handle_level_irq()
> > > >           mask_ack_irq()
> > > >             mask_irq()
> > > >               if (irqd_irq_masked()) -> returns true and skips masking!
> > > >             if (desc->irq_data.chip->irq_ack)
> > > >               ...
> > > >           irq_may_run()
> > > >             irq_pm_check_wakeup()
> > > >               irq_disable()
> > > >                 mask_irq() -> does nothing again
> > > >
> > > > In the above flow, we never mask the irq because we thought it was
> > > > already masked when it was disabled, but the irqchip implementation
> > > > unmasked it to make wakeup work. Maybe we should always mask the irq if
> > > > wakeup is armed and we're trying to call mask_irq()? Looks hacky.
> Maybe we can implement irqchip's mask_ack_irq  in mediatek driver to
> always mask the irq. Then flow will always call it without judgment
> IRQD_IRQ_MASKED.
>
> diff --git a/drivers/pinctrl/mediatek/mtk-eint.c
> b/drivers/pinctrl/mediatek/mtk-
> index f464f8c..9f1aae2 100644
> --- a/drivers/pinctrl/mediatek/mtk-eint.c
> +++ b/drivers/pinctrl/mediatek/mtk-eint.c
> @@ -272,12 +272,19 @@ static void mtk_eint_irq_release_resources(struct
> irq_data
>         gpiochip_unlock_as_irq(gpio_c, gpio_n);
>  }
>
> +static void mtk_eint_mask_ack(struct irq_data *d)
> +{
> +       mtk_eint_mask(d);
> +       mtk_eint_ack(d);
> +}
> +
>  static struct irq_chip mtk_eint_irq_chip = {
>         .name = "mt-eint",
>         .irq_disable = mtk_eint_mask,
>         .irq_mask = mtk_eint_mask,
>         .irq_unmask = mtk_eint_unmask,
>         .irq_ack = mtk_eint_ack,
> +       .irq_mask_ack = mtk_eint_mask_ack,
>         .irq_set_type = mtk_eint_set_type,
>         .irq_set_wake = mtk_eint_irq_set_wake,
>         .irq_request_resources = mtk_eint_irq_request_resources,
>
> This seems like a small change.
> thanks.

Does this work? My understanding is that Linux thinks the irq is
_already_ masked, so it short-circuits in the generic IRQ code and
doesn't call mask again.
-Evan
