Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3EEB107225
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Nov 2019 13:28:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727827AbfKVM22 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Nov 2019 07:28:28 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:43324 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726546AbfKVM21 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Nov 2019 07:28:27 -0500
Received: by mail-lj1-f193.google.com with SMTP id y23so7124214ljh.10
        for <linux-gpio@vger.kernel.org>; Fri, 22 Nov 2019 04:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Sb0l5wZZ4x3uEUBJJPu8/Qg1fPjfMYDDa2uRl9Za+6g=;
        b=dEr2jjn9fgOjdiaDJE2cZkZfXprKxiCesiH6JGQ81KlVLsOAGLk2zI3vm3VTxAW/Dt
         ZAWD9BggBEV7m9WWyDmoJLJQLBLAb655y6NgNk/WDLD6uEI/O8S08ynaATwcY9j91g/X
         oz6jR2QHAF05zYR4+HVWmCa5e4flLcECiB+55HYKL/QYKAUVUIgkRwnch+WdQq8HQQeX
         wKKBM4IOSVLQf4ztqRZ0MjhDejiodCApagsb6m9creQc3gJ83j5p+55dvpS01vvlXDsE
         /HJ54qBLHQD9VnBEpRVhFG/r3OLcZpVj7BTpKPDCMJV9fuFmPgFiiNrbj/+bvDGzfw1v
         ZjwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Sb0l5wZZ4x3uEUBJJPu8/Qg1fPjfMYDDa2uRl9Za+6g=;
        b=NSlaeLtM2xT9ZTEMrl7UnV4rcD1TrpCrBmDftppMC79ChEVLXdH3eqfKhX5yfbrRLQ
         al7rzYjri5LuAhbK1QACxtqGKQNB8ayDfJA4VhjxfSGV84GrlArcLqOKuNCRUJyaHMvM
         kZtR64ckHVLdbLKJZNWNYL6kNgFNYFz6D+H36HC1rdcNTNajvrmh67Tm0Gq7vKO6lL/5
         elASnVQfJlJDh5Jyn09o5fQX+vfypgXXlJcEI9lk1Q5x/ANAuxkM5Dp1yYsp5NA/i0gO
         E1xe3X9eP37a42Vj8m2ibtuGgi2zsyMoeWwTaVBw2+YLKdsh349dlofFyDhdHM+TNSoj
         dH+w==
X-Gm-Message-State: APjAAAU+SRTzezp7ErldzDcQW5DWklsQhwm5ZHwmgRrBzB4mak9QX/el
        +p7zGojbbixLseXOK7y7y4LDPXG5lK8GLsWG0Mf3og==
X-Google-Smtp-Source: APXvYqyEr875KK6+Z3AoTFLNHg9GG1Nc70IgJCEP8t2ZeLuj4RGoP4v/mkCP2LZsVpBsQMxyu52/73Y3stYR9or4KTU=
X-Received: by 2002:a2e:9699:: with SMTP id q25mr12078801lji.251.1574425704107;
 Fri, 22 Nov 2019 04:28:24 -0800 (PST)
MIME-Version: 1.0
References: <1573560684-48104-1-git-send-email-yash.shah@sifive.com>
 <1573560684-48104-4-git-send-email-yash.shah@sifive.com> <CAMpxmJWcuV7goPWxOWv_Og9GwzGrioF62SfS1LCiHf9eDX=vdw@mail.gmail.com>
 <CH2PR13MB33680443C101511E66ECADF08C4D0@CH2PR13MB3368.namprd13.prod.outlook.com>
 <CAMpxmJU+P=nWe9fpp45Jw=GwX3+V0sVVshRcE7AD1Kyz_F0qJQ@mail.gmail.com>
 <CACRpkdb9KKPsu7dkjVmHbgQcdo1Zx9uC_jtd6HFwM+RO2EA4nw@mail.gmail.com> <CAMpxmJXFK4VLgJU+P0ZMNkduGfFxAeQ_NguRHtedf7cRPav7LQ@mail.gmail.com>
In-Reply-To: <CAMpxmJXFK4VLgJU+P0ZMNkduGfFxAeQ_NguRHtedf7cRPav7LQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 22 Nov 2019 13:28:12 +0100
Message-ID: <CACRpkdaDmd+0809wmiNwSRbsdHaDNzpbOaxCcx6bEfYuyzPNQg@mail.gmail.com>
Subject: Re: [PATCH 3/4] gpio: sifive: Add GPIO driver for SiFive SoCs
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
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

On Tue, Nov 19, 2019 at 5:42 PM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
> wt., 19 lis 2019 o 16:03 Linus Walleij <linus.walleij@linaro.org> napisa=
=C5=82(a):
> > On Mon, Nov 18, 2019 at 11:15 AM Bartosz Golaszewski
> > <bgolaszewski@baylibre.com> wrote:

> > > pon., 18 lis 2019 o 11:03 Yash Shah <yash.shah@sifive.com> napisa=C5=
=82(a):
> > Is it really so? The bgpio_lock does protect the registers used
> > by regmap-mmio but unless the interrupt code is also using the
> > same registers it is fine to have a different lock for those.
> >
> > Is the interrupt code really poking into the very same registers
> > as passed to bgpio_init()?
> >
> > Of course it could be seen as a bit dirty to poke around in the
> > same memory space with regmap and the bgpio_* accessors
> > but in practice it's no problem if they never touch the same
> > things.
> >
> > Yours,
> > Linus Walleij
>
> I'm wondering if it won't cause any inconsistencies when for example
> interrupts are being triggered on input lines while we're also reading
> their values? Seems to me it's just more clear to use a single lock
> for a register range. Most drivers using gpio-mmio do just that in
> their irq-related routines.

OK good point. Just one lock for the whole thing is likely
more maintainable even if it works with two different locks.

> Anyway: even without using bgpio_lock this code is inconsistent: if
> we're using regmap for interrupt registers, we should either decide to
> rely on locking provided by regmap or disable it and use a locally
> defined lock.

OK makes sense, let's say we use the bgpio_lock everywhere
for this.

Yash: are you OK with this? (Haven't read the new patch set
yet, maybe it is already fixed...)

> Also: if we're using regmap, then let's use it
> everywhere, not only when it's convenient for updating registers.

I think what you are saying is that we should extend gpio-mmio.c
with some optional regmap API (or create a separate MMIO library
for regmap consumers) which makes sense, but it feels a bit
heavy task to toss at contributors.

We could add it to the TODO file, where I already have some
item like this for port-mapped I/O.

Yours,
Linus Walleij
