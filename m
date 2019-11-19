Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38A64102991
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2019 17:42:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727910AbfKSQmD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Nov 2019 11:42:03 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:41258 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727299AbfKSQmD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Nov 2019 11:42:03 -0500
Received: by mail-oi1-f196.google.com with SMTP id e9so19540378oif.8
        for <linux-gpio@vger.kernel.org>; Tue, 19 Nov 2019 08:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=A85TSNGm7K+RaBadsnUIp68Z/l71MMMOUNnCgewKA6o=;
        b=rDYaNUkKwdtjQmvpcam2qztShQlW76Pc8zjxt/wXQAa+sN+7wq1ibiMHNVLaCA5xiG
         bDiZxs2feFBg8/bmAz8uQd79vrNhEtMpym5aj9KMJIMWiUbScrYVkXVn8Ko3wJHaevUC
         57WQYZC7Y5g56OuhbCzkpK3MyK2eHC5PnsNsA5V4R//hrCitv/yC/2ovRGLZgO1jhw3g
         lMw/+8NGpmZQ32Wf64BJ/vKH8kNESrNTR7OkUBdH/B13nEqEwy1lG84J/mz9w5T7ye8X
         G+lk2Aro1GziU8QmVGglBsE3fXSg8HtAQoVoJhIhFy/gI+GCTaqffAOpAYTYFs5+otuf
         Lb4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=A85TSNGm7K+RaBadsnUIp68Z/l71MMMOUNnCgewKA6o=;
        b=oRaqQ/aidNX9r9dNYdzebcf8tgTKfcdbdtkt9c0EBoktl4U4S32LvCYl/JcJnkBWEl
         t8rV2bsc/UoWNiWOiWSGvk3UCPs3t9ui/n+U4Z34tTGzISW6dp59tX0wVh1QdEWdDcbe
         X9Dj+EB0qd0S/rCPv0JY+nPtIUM07r4q81Fehs+SiROQDKr82J+TZzsaG9LlyKECO72k
         /w8TdZen039rTwHGksOJyeH1lbrBM0DQHNpgwPYI/D2wzbfiRwLRqG11vGucqb12kKED
         HNUobtOz4pdJ/VCG4GJ3H8P46j2CjwU8qCeEdQQDoTxWfZ+R39uMLci9NJR4CrfixZeH
         adDQ==
X-Gm-Message-State: APjAAAW2jAAv4GSu0j2N4Yb2WizCpzBcS4E9QRPG3xLa4anUt3crb8yA
        e8TsswtwsrklEQFJSKSrJMIcZCUOY/r0oQLJoRr8Dg==
X-Google-Smtp-Source: APXvYqx7cskxLkBBXBA7knh9DkcCJarVIobwkve0fLSrrww5YHLowJhAvBe1oJj6wFqp95kT/WCRIqkTRDLrTMPc5L0=
X-Received: by 2002:a05:6808:9a1:: with SMTP id e1mr5012423oig.175.1574181722495;
 Tue, 19 Nov 2019 08:42:02 -0800 (PST)
MIME-Version: 1.0
References: <1573560684-48104-1-git-send-email-yash.shah@sifive.com>
 <1573560684-48104-4-git-send-email-yash.shah@sifive.com> <CAMpxmJWcuV7goPWxOWv_Og9GwzGrioF62SfS1LCiHf9eDX=vdw@mail.gmail.com>
 <CH2PR13MB33680443C101511E66ECADF08C4D0@CH2PR13MB3368.namprd13.prod.outlook.com>
 <CAMpxmJU+P=nWe9fpp45Jw=GwX3+V0sVVshRcE7AD1Kyz_F0qJQ@mail.gmail.com> <CACRpkdb9KKPsu7dkjVmHbgQcdo1Zx9uC_jtd6HFwM+RO2EA4nw@mail.gmail.com>
In-Reply-To: <CACRpkdb9KKPsu7dkjVmHbgQcdo1Zx9uC_jtd6HFwM+RO2EA4nw@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 19 Nov 2019 17:41:51 +0100
Message-ID: <CAMpxmJXFK4VLgJU+P0ZMNkduGfFxAeQ_NguRHtedf7cRPav7LQ@mail.gmail.com>
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

wt., 19 lis 2019 o 16:03 Linus Walleij <linus.walleij@linaro.org> napisa=C5=
=82(a):
>
> On Mon, Nov 18, 2019 at 11:15 AM Bartosz Golaszewski
> <bgolaszewski@baylibre.com> wrote:
> > pon., 18 lis 2019 o 11:03 Yash Shah <yash.shah@sifive.com> napisa=C5=82=
(a):
>
> > > As suggested in the comments received on the RFC version of this patc=
h[0], I am trying to use regmap MMIO by looking at gpio-mvebu.c. I got your=
 point regarding the usage of own locks is not making any sense.
> > > Here is what I will do in v2:
> > > 1. drop the usage of own locks
> > > 2. consistently use regmap_* apis for register access (replace all io=
writes).
> > > Does this make sense now?
> >
> > The thing is: the gpio-mmio code you're (correctly) reusing uses a
> > different lock - namely: bgpio_lock in struct gpio_chip. If you want
> > to use regmap for register operations, then you need to set
> > disable_locking in regmap_config to true and then take this lock
> > manually on every access.
>
> Is it really so? The bgpio_lock does protect the registers used
> by regmap-mmio but unless the interrupt code is also using the
> same registers it is fine to have a different lock for those.
>
> Is the interrupt code really poking into the very same registers
> as passed to bgpio_init()?
>
> Of course it could be seen as a bit dirty to poke around in the
> same memory space with regmap and the bgpio_* accessors
> but in practice it's no problem if they never touch the same
> things.
>
> Yours,
> Linus Walleij

I'm wondering if it won't cause any inconsistencies when for example
interrupts are being triggered on input lines while we're also reading
their values? Seems to me it's just more clear to use a single lock
for a register range. Most drivers using gpio-mmio do just that in
their irq-related routines.

Anyway: even without using bgpio_lock this code is inconsistent: if
we're using regmap for interrupt registers, we should either decide to
rely on locking provided by regmap or disable it and use a locally
defined lock. Also: if we're using regmap, then let's use it
everywhere, not only when it's convenient for updating registers.

Bart
