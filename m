Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55FB71E935C
	for <lists+linux-gpio@lfdr.de>; Sat, 30 May 2020 21:26:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728998AbgE3T0f (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 30 May 2020 15:26:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726898AbgE3T0f (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 30 May 2020 15:26:35 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF6A5C03E969
        for <linux-gpio@vger.kernel.org>; Sat, 30 May 2020 12:26:34 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id y11so2610236plt.12
        for <linux-gpio@vger.kernel.org>; Sat, 30 May 2020 12:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=2T0aLQUwRsDchTrSRoZf6tTcC88x6EG9LzIM9HnWkKw=;
        b=LXUHmbbsoTsI9pgn1naPhBj6seoyX39ob5zm5cHemeZdEOahTM0JcRv5hn4DgAPrit
         4GIkBzcJOmxQB2n72Vd4fcvJiU3ZUjzAsV9QrbX0DLAHQwWRuEYzTUS6aaeMGuEA+PAz
         0ajQWw20wAPQ4ZvZIeIrY3TIQDqOySLiAQDls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=2T0aLQUwRsDchTrSRoZf6tTcC88x6EG9LzIM9HnWkKw=;
        b=sybdOyP9Bq4Lr22gsaLFxPGPHId5QHcoRWDgEYn9q9J0dKru4ee+OvBPQb5yfVTKPZ
         NuOa3wjfGwiK0LiP5NITYc4cVMHwLe9+RtYfTt6wvTtX1iB2vFEGQtSSc5s7f5TwSzJR
         RgSj/KbErFrJmnSrTEN5VNBZ6K+nJLla9pFwqB4ip/3JDWpdxljv+1dmURQg9PE67z/0
         2I6Euik9/TFADiyBp9kfbi8ao3P0eDki2wrYJpyLlnXjvj71ULUSDTUCbrgRUtAm+WGi
         ufTY8N0xSn62LZAMqBmS8sK1Dt6IZV9BQtCQJR9vNleKwL8FgKylIPJyvq5wfkM/Q5up
         Chfw==
X-Gm-Message-State: AOAM533JCXniBuTn7D7g2PmAYq8vR2SUukVsSMMEn6tEDYLeBX02mi1i
        qtyPPeS0afRAGMLG+tsh/8SnCg==
X-Google-Smtp-Source: ABdhPJy2uXox2GvbmAb7MRF1tS4QNfQeSna7QOgiyH8UZdp95WeW7F54VtQRkImis88on8qEJgv9Uw==
X-Received: by 2002:a17:90b:e0c:: with SMTP id ge12mr16122709pjb.3.1590866794004;
        Sat, 30 May 2020 12:26:34 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id q201sm10519458pfq.40.2020.05.30.12.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2020 12:26:33 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <e565f798-e62b-7b03-6cd5-6daf9b516262@codeaurora.org>
References: <1590253873-11556-1-git-send-email-mkshah@codeaurora.org> <1590253873-11556-5-git-send-email-mkshah@codeaurora.org> <159057454795.88029.5963412495484312088@swboyd.mtv.corp.google.com> <e565f798-e62b-7b03-6cd5-6daf9b516262@codeaurora.org>
Subject: Re: [PATCH v2 4/4] irqchip: qcom-pdc: Introduce irq_set_wake call
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, agross@kernel.org, tglx@linutronix.de,
        jason@lakedaemon.net, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org
To:     Maulik Shah <mkshah@codeaurora.org>, bjorn.andersson@linaro.org,
        evgreen@chromium.org, linus.walleij@linaro.org, maz@kernel.org,
        mka@chromium.org
Date:   Sat, 30 May 2020 12:26:32 -0700
Message-ID: <159086679215.69627.4444511187342075544@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Maulik Shah (2020-05-29 02:20:32)
> Hi,
>=20
> On 5/27/2020 3:45 PM, Stephen Boyd wrote:
> > Quoting Maulik Shah (2020-05-23 10:11:13)
> >> @@ -87,22 +88,20 @@ static void pdc_enable_intr(struct irq_data *d, bo=
ol on)
> >>          raw_spin_unlock(&pdc_lock);
> >>   }
> >>  =20
> >> -static void qcom_pdc_gic_disable(struct irq_data *d)
> >> +static int qcom_pdc_gic_set_wake(struct irq_data *d, unsigned int on)
> >>   {
> >>          if (d->hwirq =3D=3D GPIO_NO_WAKE_IRQ)
> >> -               return;
> >> -
> >> -       pdc_enable_intr(d, false);
> >> -       irq_chip_disable_parent(d);
> >> -}
> >> +               return 0;
> > Shouldn't this fail if we can't set for wake?
>=20
> we return success/failure from parent chip with below call at end of=20
> set_wake.
>=20
> return irq_chip_set_wake_parent(d, on);

It's not a question about the parent irqchip. I'm wondering why we would
return success for a gpio irq that can't be marked for wakeup when a
client driver tries to enable wake on it. My understanding is that all
gpios irqs call here and PDC can't monitor all of them so some are
GPIO_NO_WAKE_IRQ and thus trying to mark those for wakeup should fail.
Of course msm_gpio_irq_set_wake() should also fail if it can't mark the
gpio for wakeup, but that's another problem.

> >> @@ -118,6 +120,7 @@ static void qcom_pdc_gic_unmask(struct irq_data *d)
> >>          if (d->hwirq =3D=3D GPIO_NO_WAKE_IRQ)
> >>                  return;
> >>  =20
> >> +       pdc_enable_intr(d, true);
> >>          irq_chip_unmask_parent(d);
> >>   }
> >>  =20
> > I find these two hunks deeply confusing. I'm not sure what the
> > maintainers think though. I hope it would be simpler to always enable
> > the hwirqs in the pdc when an irq is requested and only disable it in
> > the pdc when the system goes to suspend and the pdc pin isn't for an irq
> > that's marked for wakeup. Does that break somehow?
> PDC monitors interrupts during CPUidle as well, in cases where deepest=20
> low power mode happened from cpuidle where GIC is not active.
> If we keep PDC IRQ always enabled/unmasked during idle and then=20
> disable/mask when entering to suspend, it will break cpuidle.

How does it break cpuidle? The irqs that would be enabled/unmasked in
pdc would only be the irqs that the kernel has setup irq handlers for
(from request_irq() and friends).  We want those irqs to keep working
during cpuidle and wake the CPU from the deepest idle states.

>=20
> >
> > My understanding of the hardware is that the GPIO controller has lines
> > directly connected to various SPI lines on the GIC and PDC has a way to
> > monitor those direct connections and wakeup the CPUs when they trigger
> > the detection logic in the PDC. The enable/disable bit in PDC gates that
> > logic for each wire between the GPIO controller and the GIC.
> >
> > So isn't it simpler to leave the PDC monitoring pins that we care about
> > all the time and only stop monitoring when we enter and leave suspend?
>=20
> it can affect idle path as explained above.
>=20
> > And shouldn't the driver set something sane in qcom_pdc_init() to
> > disable all the pdc pins so that we don't rely on boot state to
> > configure pins for wakeup?
>=20
> We don't rely on boot state, by default all interrupt will be disabled.

Does 'default' mean the hardware register reset state? I'm worried that
we will kexec and then various pdc pins will be enabled because the
previous kernel had them enabled but then the new kernel doesn't care
about those pins and we'll never be able to suspend or go idle. I don't
know what happens in the GIC case but I think gic_dist_config() and
things set a sane state at kernel boot.

>=20
> This is same to GIC driver having GICD_ISENABLER register, where all=20
> bits (one bit per interrupt) set to 0 (masked irqs) during boot up.
>=20
> Similarly PDC also have all bits set to 0 in PDC's IRQ_ENABLE_BANK.
>=20

What code sets the IRQ_ENABLE_BANK to all zero when this driver probes?
