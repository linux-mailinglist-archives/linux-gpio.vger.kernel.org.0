Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE73B6D75F
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jul 2019 01:49:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726066AbfGRXtL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Jul 2019 19:49:11 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:36269 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725992AbfGRXtL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Jul 2019 19:49:11 -0400
Received: by mail-lj1-f196.google.com with SMTP id i21so29039048ljj.3;
        Thu, 18 Jul 2019 16:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LfwfSaM/DkKEFavaXQu6tXhI5mw1k44jFL4SmIH5mFg=;
        b=ovX7OB4q7JqOZksIbgc4HmQQiVh3TbYjW7/Y4qjHMeBy4Sg28by7oMeYHiaB1ImB55
         ZFz14IdzFBnhL+4hVnnzMlbRNL91ge8jDdTuHOGWzFxgBDV4FOWLckJFCi2mS6rEF+lG
         vB7jqJHY10wKWoUTaFzG0ltAKKa210kVGwyVrEgSCa/E3TQeiVMJepEnZeZHZXRuzzYH
         LyuLHufQ6Mef3RPUtRp4vu2uxsKsCa/jbAb2B7rHerTvoQWEV+PdVFpu6mpGAw9zzYH+
         BJX3FA1Lgi9A/O8VZ0AZEZlHq6ddPzHAjdudoIpTYMgCJZjBVKQL/IZOtEi1HUZuq34t
         qibg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LfwfSaM/DkKEFavaXQu6tXhI5mw1k44jFL4SmIH5mFg=;
        b=YHJDGPGDHPf0wf9W3xOEAkNsva6fRNtuGSC20wDSadL85LQmWwYhwM5UM0peW0s2HS
         QzA3Av/XVH0HKSGhEAVAi+xad7kgU97fLzhIkZmj1YsfEsVtx/s9vUnXZvR+2mZ+clMN
         Nsd2af44fPwES5f9JZyWuJL66hUM+oSf8C/TqwngMkYF+9VEDjujr04YVjb2zSjc9gGP
         i3N5Tsj1keW1RZ5tSPbODjZrUuZes6z3Bxrl+JZWW4StyvtzjVjSvouw45DbnEV13nRQ
         upIF/to0nVWMouNsOrhRqQt8L3fPKhnGA0OZdzL1pjVp2wkUkvjEEZbKRi7XjCH3SPbN
         ok+w==
X-Gm-Message-State: APjAAAU3wrLU605gNlEzcc/w6f4C6vaxRt7y0o49Pv0dRZ2bLiEbUW2z
        7r+vyymRzCN/B/KAhvEtmRS5RX0Y
X-Google-Smtp-Source: APXvYqyFsH258+vEgml49uVeZdZb7r8ZbKF3dkWxtj5sAZwOSJDshyS7Q1Rkq4eIXe3sxjgpbMPhAg==
X-Received: by 2002:a2e:3a13:: with SMTP id h19mr9141684lja.220.1563493748290;
        Thu, 18 Jul 2019 16:49:08 -0700 (PDT)
Received: from dimatab (ppp79-139-233-208.pppoe.spdop.ru. [79.139.233.208])
        by smtp.gmail.com with ESMTPSA id l23sm5360830lje.106.2019.07.18.16.49.06
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 18 Jul 2019 16:49:07 -0700 (PDT)
Date:   Fri, 19 Jul 2019 02:52:41 +0300
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     Peter De Schrijver <pdeschrijver@nvidia.com>, <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Joseph Lo <josephl@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <tglx@linutronix.de>,
        <jason@lakedaemon.net>, <marc.zyngier@arm.com>,
        <linus.walleij@linaro.org>, <stefan@agner.ch>,
        <mark.rutland@arm.com>, <pgaikwad@nvidia.com>,
        <linux-clk@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <jckuo@nvidia.com>, <talho@nvidia.com>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <mperttunen@nvidia.com>, <spatra@nvidia.com>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH V5 11/18] clk: tegra210: Add support for Tegra210 clocks
Message-ID: <20190719025241.28d03c57@dimatab>
In-Reply-To: <f664f161-9b6b-6446-e2f9-6373e654dfc3@nvidia.com>
References: <351a07d4-ba90-4793-129b-b1a733f95531@nvidia.com>
        <e3e9beaf-b195-305e-4010-66e824813472@gmail.com>
        <9271ae75-5663-e26e-df26-57cba94dab75@nvidia.com>
        <7ae3df9a-c0e9-cf71-8e90-4284db8df82f@nvidia.com>
        <b01e37aa-f14e-e628-ceef-b25a845c6359@gmail.com>
        <46b55527-da5d-c0b7-1c14-43b5c6d49dfa@nvidia.com>
        <2de9a608-cf38-f56c-b192-7ffed65092f8@nvidia.com>
        <bff3e9c0-727d-9aef-a0e2-583e53c39afd@gmail.com>
        <5eedd224-77b0-1fc9-4e5e-d884b41a64ed@nvidia.com>
        <89f23878-d4b2-2305-03e5-8a3e781c2b02@gmail.com>
        <20190718194222.GH12715@pdeschrijver-desktop.Nvidia.com>
        <056496ed-9abf-6907-c61c-a99ccf23b834@gmail.com>
        <1c85cb35-ce7c-1dd1-f637-0c91b2b36db3@nvidia.com>
        <f664f161-9b6b-6446-e2f9-6373e654dfc3@nvidia.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

=D0=92 Thu, 18 Jul 2019 16:08:48 -0700
Sowjanya Komatineni <skomatineni@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5=D1=82:

> On 7/18/19 1:36 PM, Sowjanya Komatineni wrote:
> >
> > On 7/18/19 1:26 PM, Dmitry Osipenko wrote: =20
> >> 18.07.2019 22:42, Peter De Schrijver =D0=BF=D0=B8=D1=88=D0=B5=D1=82: =
=20
> >>> On Thu, Jul 18, 2019 at 02:44:56AM +0300, Dmitry Osipenko wrote: =20
> >>>>> dependencies I am referring are dfll_ref, dfll_soc, and DVFS=20
> >>>>> peripheral
> >>>>> clocks which need to be restored prior to DFLL reinit. =20
> >>>> Okay, but that shouldn't be a problem if clock dependencies are
> >>>> set up properly.
> >>>> =20
> >>>>>>> reverse list order during restore might not work as all other=20
> >>>>>>> clocks are
> >>>>>>> in proper order no with any ref clocks for plls getting
> >>>>>>> restored prior
> >>>>>>> to their clients =20
> >>>>>> Why? The ref clocks should be registered first and be the
> >>>>>> roots for PLLs
> >>>>>> and the rest. If it's not currently the case, then this need
> >>>>>> to be fixed. You need to ensure that each clock is modeled
> >>>>>> properly. If some
> >>>>>> child clock really depends on multiple parents, then the
> >>>>>> parents need to
> >>>>>> in the correct order or CCF need to be taught about such
> >>>>>> multi-dependencies.
> >>>>>>
> >>>>>> If some required feature is missed, then you have to implement
> >>>>>> it properly and for all, that's how things are done in
> >>>>>> upstream. Sometimes
> >>>>>> it's quite a lot of extra work that everyone are benefiting
> >>>>>> from in the end.
> >>>>>>
> >>>>>> [snip] =20
> >>>>> Yes, we should register ref/parents before their clients.
> >>>>>
> >>>>> cclk_g clk is registered last after all pll and peripheral
> >>>>> clocks are registers during clock init.
> >>>>>
> >>>>> dfllCPU_out clk is registered later during dfll-fcpu driver
> >>>>> probe and gets added to the clock list.
> >>>>>
> >>>>> Probably the issue seems to be not linking dfll_ref and dfll_soc
> >>>>> dependencies for dfllCPU_out thru clock list.
> >>>>>
> >>>>> clk-dfll driver during dfll_init_clks gets ref_clk and soc_clk=20
> >>>>> reference
> >>>>> thru DT. =20
> >>> The dfll does not have any parents. It has some clocks which are
> >>> needed for the logic part of the dfll to function, but there's no
> >>> parent clock as such unlike for peripheral clocks or PLLs where
> >>> the parent is at least used as a reference. The I2C controller of
> >>> the DFLL shares the lines with a normal I2C controller using some
> >>> arbitration logic. That logic only works if the clock for the
> >>> normal I2C controller is enabled. So you need probably 3 clocks
> >>> enabled to initialize the dfll in that case. I don't think it
> >>> makes sense to add complicated logic to the clock
> >>> core to deal with this rather strange case. To me it makes more=20
> >>> sense to
> >>> use pmops and open code the sequence there. =20
> >> It looks to me that dfllCPU is a PLL and dfll_ref is its reference
> >> parent, while dfll_soc clocks the logic that dynamically
> >> reconfigures dfllCPU in background. I see that PLLP is defined as
> >> a parent for dfll_ref and dfll_soc in the code. Hence seems
> >> dfll_ref should be set as a parent for dfllCPU, no? =20
> >
> > dfll_soc will not be restored by the time dfllCPU resume happens
> > after dfll_ref.
> >
> > without dfll_soc, dfllCPU cannot be resumed either. So if we decide
> > to use parent we should use dfll_soc.
> > =20
> >> Either way is good to me, given that DFLL will be disabled during
> >> suspend. Resetting DFLL on DFLL's driver resume using PM ops
> >> should be good. And then it also will be better to error out if
> >> DFLL is active during suspend on the DFLL's driver suspend. =20
> >
> > Doing in dfll-fcpu pm_ops is much better as it happens right after
> > all clocks are restored and unlike other clock enables, dfll need
> > dfll controller programming as well and is actually registered in
> > dfll-fcpu driver.
> >
> > With this, below is the sequence:
> >
> > CPUFreq suspend switches CPU to PLLP and disables dfll
> >
> > Will add dfll_suspend/resume in dfll-fcpu driver and in dfll
> > suspend will check for dfll active and will error out suspend.
> >
> > dfll resume does dfll reinit.
> >
> > CPUFreq resume enables dfll and switches CPU to dfll.
> >
> >
> > Will go with doing in dfll-fcpu pm_ops rather than parenting=20
> > dfllCPU_OUT...
> > =20
> Does is make sense to return error EBUSY if dfll is not disabled by
> the time dfll-fcpu suspend happens?

Yes

> Or should I use ETIMEOUT?

No
