Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 148B5107247
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Nov 2019 13:39:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726802AbfKVMje (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Nov 2019 07:39:34 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:38528 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726620AbfKVMjd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Nov 2019 07:39:33 -0500
Received: by mail-ot1-f66.google.com with SMTP id z25so6027983oti.5
        for <linux-gpio@vger.kernel.org>; Fri, 22 Nov 2019 04:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=pIaE2t8kEhzDVYCOk21I3VO5ugELTHI5U7MvhDfP+Bw=;
        b=wPFNW57zKwWO86/8XbUcXJJRoWhRtgaz8SFbCVb3kzCZs5NoKJ5NAi5XITr/5axrWF
         7t/bmKwgoI/qdkwMUMKfuO+JQl+KF3HA6koatw564ZgsHkf3LTN617naBAfhOMLIk1jZ
         UHtrysleLqU2AQjrR/Qy+bepkiaXKqSBtTLbQlDmapNYB9kdfzlMSB4DFre/jEwUF15D
         P4ChWAELcH4Fly7afKA1+MiGJLmLKPBjBPpU+ZSFXBtlLmgYQEerSeMbL04k3cDXdeYH
         u658C2PbUnrGIPJl+JsiWXXiN0wUe5kS+NfcvxGIKAHHshIVt2KylgTsXH3ib1SkOmx6
         Rosg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=pIaE2t8kEhzDVYCOk21I3VO5ugELTHI5U7MvhDfP+Bw=;
        b=ATLtEHNb3td2s0Dnc6ghXFJIJZ9g54ZL646QihOZtwz7vYc3dwAkTFSPL25hQL7jLy
         1dWf3XPaFy+qwdGRGr5vPujuz+BF9NpSYwtx7R35q14G/B7uDmMDB5ReaqgrCCdIUbk3
         FTEQPp6T8Lq+FpQGk2vm7Gki7wuXJx3cHeThK82liVmwCw/3p6CDaD10Q/WntTg7+nLr
         2sIO9YQh1cbWm+7XG0x1D7BFt1voHFidPeSeP35n0zqj2RCECfcBqepWXwiR9b8hKhQj
         WNtg9ux+hvJoSbvG9AIZpiM+ebOXzC76vublPBymz1WzGhsBK9u7bJgCofb/xi+IWeSO
         uL5g==
X-Gm-Message-State: APjAAAXkJvyAG909bvnDBJwD6wkiTtEuVORmq7sfm72zmMnDCpT7g5Sc
        9HmJtHcoQlcnsk5z1MQ+ZFVnCdwvcIVO1K7VhRSYNA==
X-Google-Smtp-Source: APXvYqxKHhBekxA9nnYnqjLUFq+26q+Pt7iPthEshyRausyypcoh9ry3D5ayg7l4W/Vg0xxTE7p87Rqo7hkmAImYaDM=
X-Received: by 2002:a9d:17ca:: with SMTP id j68mr10551757otj.250.1574426371219;
 Fri, 22 Nov 2019 04:39:31 -0800 (PST)
MIME-Version: 1.0
References: <1573560684-48104-1-git-send-email-yash.shah@sifive.com>
 <1573560684-48104-4-git-send-email-yash.shah@sifive.com> <CAMpxmJWcuV7goPWxOWv_Og9GwzGrioF62SfS1LCiHf9eDX=vdw@mail.gmail.com>
 <CH2PR13MB33680443C101511E66ECADF08C4D0@CH2PR13MB3368.namprd13.prod.outlook.com>
 <CAMpxmJU+P=nWe9fpp45Jw=GwX3+V0sVVshRcE7AD1Kyz_F0qJQ@mail.gmail.com>
 <CACRpkdb9KKPsu7dkjVmHbgQcdo1Zx9uC_jtd6HFwM+RO2EA4nw@mail.gmail.com>
 <CAMpxmJXFK4VLgJU+P0ZMNkduGfFxAeQ_NguRHtedf7cRPav7LQ@mail.gmail.com> <CACRpkdaDmd+0809wmiNwSRbsdHaDNzpbOaxCcx6bEfYuyzPNQg@mail.gmail.com>
In-Reply-To: <CACRpkdaDmd+0809wmiNwSRbsdHaDNzpbOaxCcx6bEfYuyzPNQg@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 22 Nov 2019 13:39:20 +0100
Message-ID: <CAMpxmJUq_YLU4ha1hTzDUKYMxD36Yb-6C3SraMHgZywx=bm=eA@mail.gmail.com>
Subject: Re: [PATCH 3/4] gpio: sifive: Add GPIO driver for SiFive SoCs
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Yash Shah <yash.shah@sifive.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "palmer@dabbelt.com" <palmer@dabbelt.com>,
        "Paul Walmsley ( Sifive)" <paul.walmsley@sifive.com>,
        "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "jason@lakedaemon.net" <jason@lakedaemon.net>,
        "maz@kernel.org" <maz@kernel.org>,
        "bmeng.cn@gmail.com" <bmeng.cn@gmail.com>,
        "atish.patra@wdc.com" <atish.patra@wdc.com>,
        Sagar Kadam <sagar.kadam@sifive.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sachin Ghadi <sachin.ghadi@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pt., 22 lis 2019 o 13:28 Linus Walleij <linus.walleij@linaro.org> napisa=C5=
=82(a):
>
> On Tue, Nov 19, 2019 at 5:42 PM Bartosz Golaszewski
> <bgolaszewski@baylibre.com> wrote:
> > wt., 19 lis 2019 o 16:03 Linus Walleij <linus.walleij@linaro.org> napis=
a=C5=82(a):
> > > On Mon, Nov 18, 2019 at 11:15 AM Bartosz Golaszewski
> > > <bgolaszewski@baylibre.com> wrote:
>
> > > > pon., 18 lis 2019 o 11:03 Yash Shah <yash.shah@sifive.com> napisa=
=C5=82(a):
> > > Is it really so? The bgpio_lock does protect the registers used
> > > by regmap-mmio but unless the interrupt code is also using the
> > > same registers it is fine to have a different lock for those.
> > >
> > > Is the interrupt code really poking into the very same registers
> > > as passed to bgpio_init()?
> > >
> > > Of course it could be seen as a bit dirty to poke around in the
> > > same memory space with regmap and the bgpio_* accessors
> > > but in practice it's no problem if they never touch the same
> > > things.
> > >
> > > Yours,
> > > Linus Walleij
> >
> > I'm wondering if it won't cause any inconsistencies when for example
> > interrupts are being triggered on input lines while we're also reading
> > their values? Seems to me it's just more clear to use a single lock
> > for a register range. Most drivers using gpio-mmio do just that in
> > their irq-related routines.
>
> OK good point. Just one lock for the whole thing is likely
> more maintainable even if it works with two different locks.
>
> > Anyway: even without using bgpio_lock this code is inconsistent: if
> > we're using regmap for interrupt registers, we should either decide to
> > rely on locking provided by regmap or disable it and use a locally
> > defined lock.
>
> OK makes sense, let's say we use the bgpio_lock everywhere
> for this.
>
> Yash: are you OK with this? (Haven't read the new patch set
> yet, maybe it is already fixed...)
>
> > Also: if we're using regmap, then let's use it
> > everywhere, not only when it's convenient for updating registers.
>
> I think what you are saying is that we should extend gpio-mmio.c
> with some optional regmap API (or create a separate MMIO library
> for regmap consumers) which makes sense, but it feels a bit
> heavy task to toss at contributors.
>
> We could add it to the TODO file, where I already have some
> item like this for port-mapped I/O.
>

It's been on my personal TODO list too for some time as it seems it
could benefit some i2c drivers too. Also: I think such a helper could
eventually completely replace the generic drivers such as gpio-mmio
and gpio-reg.

In other words: good idea to put it into the TODO. If there are no
objections I was thinking about starting the work soon aiming at v5.6,
as soon as we get the recent changes in uAPI out of the way.

Bart

> Yours,
> Linus Walleij
