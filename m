Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C04F21D053
	for <lists+linux-gpio@lfdr.de>; Tue, 14 May 2019 22:14:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726089AbfENUOj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 May 2019 16:14:39 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:38709 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726151AbfENUOj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 May 2019 16:14:39 -0400
Received: by mail-pg1-f195.google.com with SMTP id j26so115970pgl.5
        for <linux-gpio@vger.kernel.org>; Tue, 14 May 2019 13:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references:from
         :subject:cc:to:message-id:user-agent:date;
        bh=NwBKkvRALDSfJXSRslkyqKuEQQ49X1NvKTDQCoJHdlI=;
        b=CCE5qzleFDtTOHIb/LPu8GAOVirRmVFIRYv2NvKSnorxyMLWDwMVTbDQNdiG4j1kxd
         cFx1dYDfqw+fuqMLvgYSomNiIrrgPxPOWY884zW4I65CqNYiEe0Loz/t6G4UK8OHSwaN
         muyemZmyBqRdfBFtb7yczMlrj2swanAKfQpu8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:from:subject:cc:to:message-id:user-agent
         :date;
        bh=NwBKkvRALDSfJXSRslkyqKuEQQ49X1NvKTDQCoJHdlI=;
        b=nCvAZpnFKB8DlXluym5V0JkRpKFRYLyBhkKroK00JrDT2qwv18TLOFk1DBbsOUK36U
         EAvV4CE+dvZR/BuoO7arcCvObgDKMtIVB09gQmsCo+goQOxHgp/qsO26GjeCJbfcL86R
         kdRrrzt+iO3wknZhZbnzzzYy7PPZVEp45Qw19RaNMpS7RSvdtIwp3VZpn5VkSvwtamMn
         h8GalKlcbZveWdvNUv/HtQXI0Qi/IxbSIXG5JkEtbUX9SDg/UCOcHWxGIUjgtlZLBD0I
         JVArjbFlnTiC+B/R2VEMeP0D1Iw0NcKRCauLm2d9dnzwsEHLkaZEmyiQJdjaFuVRpg87
         /b8A==
X-Gm-Message-State: APjAAAWhfubeDif3sh2ofSKvDTx0hZ7+ZT+kF/oJEOtJArYVy4hFgWMf
        4YovWN7ow1JeRDRVWv74xijIjw==
X-Google-Smtp-Source: APXvYqzDQ19kpSxfLWSgqhbEO+Bv2cEGlMH90i1VoP/vOiYQQXLgL9nWWDvQ5o3dkbO5mmiC4br8CQ==
X-Received: by 2002:aa7:880f:: with SMTP id c15mr44432292pfo.100.1557864878218;
        Tue, 14 May 2019 13:14:38 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id x4sm21867128pfm.19.2019.05.14.13.14.37
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 May 2019 13:14:37 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CANMq1KBMd7eR3dP=V9gJ6G4OgE6DsXad_gzvuNJ25_pee4+6eg@mail.gmail.com>
References: <20190429035515.73611-1-drinkcat@chromium.org> <20190429035515.73611-3-drinkcat@chromium.org> <155778659317.14659.136626364818483852@swboyd.mtv.corp.google.com> <CANMq1KBMd7eR3dP=V9gJ6G4OgE6DsXad_gzvuNJ25_pee4+6eg@mail.gmail.com>
From:   Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 2/2] pinctrl: mediatek: Update cur_mask in mask/mask ops
Cc:     "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-gpio@vger.kernel.org,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Chuanjia Liu <Chuanjia.Liu@mediatek.com>,
        Evan Green <evgreen@chromium.org>,
        Thomas Gleixner <tglx@linutronix.de>
To:     Nicolas Boichat <drinkcat@chromium.org>
Message-ID: <155786487644.14659.17142525593824613967@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Tue, 14 May 2019 13:14:36 -0700
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Nicolas Boichat (2019-05-13 18:37:58)
> On Tue, May 14, 2019 at 6:29 AM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Quoting Nicolas Boichat (2019-04-28 20:55:15)
> > > During suspend/resume, mtk_eint_mask may be called while
> > > wake_mask is active. For example, this happens if a wake-source
> > > with an active interrupt handler wakes the system:
> > > irq/pm.c:irq_pm_check_wakeup would disable the interrupt, so
> > > that it can be handled later on in the resume flow.
> > >
> > > However, this may happen before mtk_eint_do_resume is called:
> > > in this case, wake_mask is loaded, and cur_mask is restored
> > > from an older copy, re-enabling the interrupt, and causing
> > > an interrupt storm (especially for level interrupts).
> > >
> > > Instead, we just record mask/unmask changes in cur_mask. This
> > > also avoids the need to read the current mask in eint_do_suspend,
> > > and we can remove mtk_eint_chip_read_mask function.
> > >
> > > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> >
> > It looks an awful lot like you should just use IRQCHIP_MASK_ON_SUSPEND
> > here. Isn't that what's happening? All non-wake irqs should be masked at
> > the hardware level so they can't cause a wakeup during suspend and on
> > resume they can be unmasked?
>=20
> No, this is for an line that has both wake and interrupt enabled. To
> reword the commit message above:

Is my understanding correct that there isn't a different "wake up"
register that can be written to cause a GPIO to be configured to wake
the system from suspend? The only way to do so is to leave the GPIO
unmasked in the hardware by having EINT_EN[irq] =3D 1? And thus any
interrupts that we don't want to wake us up during suspend should be
masked in the hardware?=20

If that's true, the code here that's trying to keep track of enabled
irqs and wakeup enabled irqs can be replaced with the irqchip flag so
that wakeup irqs are not masked while non-wakeups are masked.


>  1. cur_mask[irq] =3D 1; wake_mask[irq] =3D 1; EINT_EN[irq] =3D 1 (interr=
upt
> enabled at hardware level)
>  2. System suspends, resumes due to that line (at this stage EINT_HW
> =3D=3D wake_mask)
>  3. irq_pm_check_wakeup is called, and disables the interrupt =3D>
> EINT_EN[irq] =3D 0, but we still have cur_mask[irq] =3D 1
>  4. mtk_eint_do_resume is called, and restores EINT_EN =3D cur_mask, so
> it reenables EINT_EN[irq] =3D 1 =3D> interrupt storm.
>=20
> This patch fixes the issue in step 3. So that the interrupt can be
> re-enabled properly later on, sometimes after mtk_eint_do_resume, when
> the driver is ready to handle it.

Right, we'd rather not see irqchip drivers working around the genirq
layer to do these things like tracking cur_mask and wake_mask. That
leads to subtle bugs and makes the driver maintain state across the
irqchip callbacks and system suspend/resume.

>=20
> Also, IRQCHIP_MASK_ON_SUSPEND does not handle lines that are enabled
> as a wake source, but without interrupt enabled (e.g. cros_ec driver
> does that), which we do want to support.

Hmm. I thought that even if the irq is disabled by a driver, that would
be a lazy disable so it isn't really masked in the hardware. Then if an
interrupt comes in during suspend on a wake configured irq line, the
hardware will have left it unmasked because IRQCHIP_MASK_ON_SUSPEND in
combination with lazy disable would mean that the line is left unmasked
(ignoring whatever this mediatek driver is doing to mask and unmask in
PM hooks).

Just reading Documentation/power/suspend-and-interrupts.txt I'm led to
believe that the cros_ec driver shouldn't call disable_irq() on the
interrupt if it wants to wakeup from it:

"Calling enable_irq_wake() causes suspend_device_irqs() to treat the
given IRQ in a special way.  Namely, the IRQ remains enabled, by on the
first interrupt it will be disabled, marked as pending and "suspended"
so that it will be re-enabled by resume_device_irqs() during the
subsequent system resume.  Also the PM core is notified about the event
which causes the system suspend in progress to be aborted (that doesn't
have to happen immediately, but at one of the points where the suspend
thread looks for pending wakeup events)."

I suppose the problem is an irq line disabled in hardware that has
wakeup armed on it? Is this even valid? Shouldn't an irq be enabled for
wakeup to work?

We could immediately unmask those lines in the hardware when the
set_wake() callback is called. That way the genirq layer can use the
driver to do what it wants with the hardware and the driver can make
sure that set_wake() will always cause the wakeup interrupt to be
delivered to genirq even when software has disabled it.

But I think that there might be a problem with how genirq understands
the masked state of a line when the wakeup implementation conflates
masked state with wakeup armed state. Consider this call-flow:

	irq masked in hardware, IRQD_IRQ_MASKED is set
	enable_irq_wake()
	  unmask_irq in hardware
	IRQD_WAKEUP_ARMED is set
	<suspend and wakeup from irq>
	handle_level_irq()
	  mask_ack_irq()
	    mask_irq()
	      if (irqd_irq_masked()) -> returns true and skips masking!
	    if (desc->irq_data.chip->irq_ack)
	      ...
	  irq_may_run()
	    irq_pm_check_wakeup()
	      irq_disable()
	        mask_irq() -> does nothing again

In the above flow, we never mask the irq because we thought it was
already masked when it was disabled, but the irqchip implementation
unmasked it to make wakeup work. Maybe we should always mask the irq if
wakeup is armed and we're trying to call mask_irq()? Looks hacky.

diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
index 51128bea3846..20257d528880 100644
--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -411,7 +411,7 @@ static inline void mask_ack_irq(struct irq_desc *desc)
=20
 void mask_irq(struct irq_desc *desc)
 {
-	if (irqd_irq_masked(&desc->irq_data))
+	if (!irqd_is_wakeup_armed(&desc->irq_data) && irqd_irq_masked(&desc->irq_=
data))
 		return;
=20
 	if (desc->irq_data.chip->irq_mask) {


