Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BD2D1FAFA5
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2020 13:57:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728657AbgFPL5s (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jun 2020 07:57:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726467AbgFPL5r (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jun 2020 07:57:47 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08676C08C5C2
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2020 04:57:47 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id d66so9399379pfd.6
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2020 04:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=CrhBgRCkF1offe/wGYgudc00yXLl3OPNVUMs9mpEVnM=;
        b=LwwQxAQpjHwso9BJ1tR1rhuBrRAfl+cOBMdQ2kjpXaYvvdFG6XW/iCfX/trryaZWsz
         f2jWqJN5LZq6EXsnQnxlMEl0OSEIJZIAHLrxW3nqWzv7EQUpBAyOo6aLbYkZrtxX+Nhk
         thevzGm2hI1ltbq2nvWdoEhJl/nxmYDWpDJ3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=CrhBgRCkF1offe/wGYgudc00yXLl3OPNVUMs9mpEVnM=;
        b=I+cjrj+7oiwOqViOZ684JmGQfjbxdxRKPfKYsqby9ZbuxDgIE1uNPv3WUOseRgnyRm
         cGkpFVpDS0tie8TLdr1c9XrFiRZPfT3Tk7NZMzdCRohQhxWfCxtTAni/zNnqEZGA74u2
         VjctJxbN30VNmIrqWLeAzughEP88RoVmvWLbRxB70aBTyPHOcuFL2f2eEUPddsdOJ03M
         tgBNKyfQZv6kGSqcQYSxtB75lkxzC+i2x85JwSJCmTz1EJINNi5l4DZ80gabif1gI6i7
         TPNoGM26elNbw1YyISYVNaRwpS9DRzCdwjZRus/8mfkmkhRyoYWqOUrci7k+XxitCbJy
         IKog==
X-Gm-Message-State: AOAM530C4SzR90ExN/l314MXbyzK3mJnGENHIX+HvqHeR6DS3v9Lws1I
        DyfUngaUXnOVkFRDflJVQ1wCPw==
X-Google-Smtp-Source: ABdhPJyPGiUlFFbnEi1GrizQqWMSc+1IJ5buXyebb6Lrv5QYdyrN3i4Ge/Dui3N6HEpy8NH3b+TFzA==
X-Received: by 2002:a63:f906:: with SMTP id h6mr1859146pgi.134.1592308666320;
        Tue, 16 Jun 2020 04:57:46 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id j8sm2370847pji.3.2020.06.16.04.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 04:57:45 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <c93695d4-a03e-7f62-747a-90d892c48694@codeaurora.org>
References: <1590253873-11556-1-git-send-email-mkshah@codeaurora.org> <1590253873-11556-5-git-send-email-mkshah@codeaurora.org> <159057454795.88029.5963412495484312088@swboyd.mtv.corp.google.com> <e565f798-e62b-7b03-6cd5-6daf9b516262@codeaurora.org> <159086679215.69627.4444511187342075544@swboyd.mtv.corp.google.com> <c93695d4-a03e-7f62-747a-90d892c48694@codeaurora.org>
Subject: Re: [PATCH v2 4/4] irqchip: qcom-pdc: Introduce irq_set_wake call
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, agross@kernel.org, tglx@linutronix.de,
        jason@lakedaemon.net, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org
To:     Maulik Shah <mkshah@codeaurora.org>, bjorn.andersson@linaro.org,
        evgreen@chromium.org, linus.walleij@linaro.org, maz@kernel.org,
        mka@chromium.org
Date:   Tue, 16 Jun 2020 04:57:44 -0700
Message-ID: <159230866475.62212.10807813558467898966@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Maulik Shah (2020-06-01 04:38:25)
> On 5/31/2020 12:56 AM, Stephen Boyd wrote:
> > Quoting Maulik Shah (2020-05-29 02:20:32)
> >> On 5/27/2020 3:45 PM, Stephen Boyd wrote:
> >>> Quoting Maulik Shah (2020-05-23 10:11:13)
> >>>> @@ -118,6 +120,7 @@ static void qcom_pdc_gic_unmask(struct irq_data =
*d)
> >>>>           if (d->hwirq =3D=3D GPIO_NO_WAKE_IRQ)
> >>>>                   return;
> >>>>   =20
> >>>> +       pdc_enable_intr(d, true);
> >>>>           irq_chip_unmask_parent(d);
> >>>>    }
> >>>>   =20
> >>> I find these two hunks deeply confusing. I'm not sure what the
> >>> maintainers think though. I hope it would be simpler to always enable
> >>> the hwirqs in the pdc when an irq is requested and only disable it in
> >>> the pdc when the system goes to suspend and the pdc pin isn't for an =
irq
> >>> that's marked for wakeup. Does that break somehow?
> >> PDC monitors interrupts during CPUidle as well, in cases where deepest
> >> low power mode happened from cpuidle where GIC is not active.
> >> If we keep PDC IRQ always enabled/unmasked during idle and then
> >> disable/mask when entering to suspend, it will break cpuidle.
> > How does it break cpuidle? The irqs that would be enabled/unmasked in
> > pdc would only be the irqs that the kernel has setup irq handlers for
> > (from request_irq() and friends).  We want those irqs to keep working
> > during cpuidle and wake the CPU from the deepest idle states.
>=20
> >>I hope it would be simpler to always enable
> >>the hwirqs in the pdc when an irq is requested and only disable it in
> >>the pdc when the system goes to suspend and the pdc pin isn't for an irq
> >>that's marked for wakeup
>=20
> >>How does it break cpuidle?
>=20
> Consider a scenario..
> 1. All PDC irqs enabled/unmasked in HW when request_irq() happened/alloc =
happens
> 2. Client driver disable's irq. (lazy disable is there, so in HW its stil=
l unmasked) but disabled in SW.
> 3. Device enters deep CPUidle low power modes where only PDC monitors IRQ.
> 4. This IRQ can still wakeup from CPUidle since it was monitored by PDC.
> 5. From handler, it comes to know that IRQ is disabled in SW, so it reall=
y invokes irq_mask callback now to disable in HW.
> 6. This mask callback doesn't operate on PDC (since in PDC, IRQs gets mas=
ked only during suspend, all other times its enabled)
> 7. step 3 to 6 repeats, if this IRQ keeps on coming and waking up from de=
ep cpuidle states.

Ok so in summary, irq is left unmasked in pdc during deep cpu idle and
it keeps waking up the CPU because it isn't masked at the PDC after the
first time it interrupts? Is this a power problem? Because from a
correctness standpoint we don't really care. It woke up the CPU because
it happened, and the GIC can decide to ignore it or not by masking it at
the GIC. I thought that the PDC wouldn't wake up the CPU if we masked
the irq at the GIC level. Is that not true?

>=20
> >
> >>> My understanding of the hardware is that the GPIO controller has lines
> >>> directly connected to various SPI lines on the GIC and PDC has a way =
to
> >>> monitor those direct connections and wakeup the CPUs when they trigger
> >>> the detection logic in the PDC. The enable/disable bit in PDC gates t=
hat
> >>> logic for each wire between the GPIO controller and the GIC.
> >>>
> >>> So isn't it simpler to leave the PDC monitoring pins that we care abo=
ut
> >>> all the time and only stop monitoring when we enter and leave suspend?
> >> it can affect idle path as explained above.
> >>
> >>> And shouldn't the driver set something sane in qcom_pdc_init() to
> >>> disable all the pdc pins so that we don't rely on boot state to
> >>> configure pins for wakeup?
> >> We don't rely on boot state, by default all interrupt will be disabled.
> > Does 'default' mean the hardware register reset state?
> correct.
> > I'm worried that
> > we will kexec and then various pdc pins will be enabled because the
> > previous kernel had them enabled but then the new kernel doesn't care
> > about those pins and we'll never be able to suspend or go idle. I don't
> > know what happens in the GIC case but I think gic_dist_config() and
> > things set a sane state at kernel boot.
>=20
> Right however when switching kernel, i suppose client drivers will do a=20
> free_irq(), then this will
>=20
> clear the PDC interrupt in HW by invoking mask_irq() from within free_irq=
().

We can't rely on drivers to do that.

>=20
> >
> >> This is same to GIC driver having GICD_ISENABLER register, where all
> >> bits (one bit per interrupt) set to 0 (masked irqs) during boot up.
> >>
> >> Similarly PDC also have all bits set to 0 in PDC's IRQ_ENABLE_BANK.
> >>
> > What code sets the IRQ_ENABLE_BANK to all zero when this driver probes?
>=20
> Enable bank will be zero as part of HW reset status when booting up=20
> first time.
>=20

It's not a concern about the hardware reset state of these registers at
boot. I'm worried that the bootloaders or previous OS will configure pdc
pins to wake us up. It's better to just force it to something sane, i.e.
everything disabled in the PDC, at driver probe time so that nothing can
be wrong.
