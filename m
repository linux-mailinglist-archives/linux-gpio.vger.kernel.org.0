Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E334F35D9E7
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Apr 2021 10:22:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242673AbhDMIWt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Apr 2021 04:22:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:49898 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229446AbhDMIWs (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 13 Apr 2021 04:22:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BCEBC613BF;
        Tue, 13 Apr 2021 08:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618302148;
        bh=FCK+SMdbdUGO5PuqGh46hY625MCpqFUerFbVNWNJmsU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=rbngbYahMGe4TQffxAdJtnqoA+4uAXIIzQstIvnXyycZn6yoYgbMTptGxkY1QwoCN
         qaRj1wD0ufR2Z6BbaKA79azUIvCglPP1Q9d9Lkh7TDvzW9aq7byrS6HOAtEK604XId
         TxIecErW1PFjgVRTpT/6hn9OUwz9c6l3XRtTUWJXAwV80As1OviKsH0xrI7tBnuYVB
         3TnSL2TNKhzj/rw0+Ms+XlqmAcJSrUvQxex+CUOvd0VjfuLCV7Q6r0gA40TTX8fqce
         PeJ50GXDTxHT4XTSgLiu9HSuHNFAX2bKVELWG8//h8siSyxG99z0Zic5Y9fDM0gcMp
         59hXM3+4vWrCw==
Received: by mail-wm1-f50.google.com with SMTP id t5-20020a1c77050000b029010e62cea9deso8280046wmi.0;
        Tue, 13 Apr 2021 01:22:28 -0700 (PDT)
X-Gm-Message-State: AOAM53057+E4/qw2+OZHuSihv/EsqLpSyyis1TXcHr2o8IYmrOL9N63c
        cJ3IabUQ9Wfi1rsSvMHYNWKoszYksRxrhICo2BA=
X-Google-Smtp-Source: ABdhPJx46kLBDXZba+CnxN/ZUNBoeLvXIwiYMUqu2i8IPMHM68OBFUpSsmGRmKG5BR+iCqeSFMqyDnLyPD7VzAFJe3M=
X-Received: by 2002:a7b:c14a:: with SMTP id z10mr2831003wmi.75.1618302147230;
 Tue, 13 Apr 2021 01:22:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210319062752.145730-1-andrew@aj.id.au> <20210319062752.145730-16-andrew@aj.id.au>
 <CAK8P3a1HDQdbTAT4aRMLu-VFz720ynPqPHG5b22NZ5p5QfUqOw@mail.gmail.com>
 <ba63f830-4758-49aa-a63e-f204a8eec1b4@www.fastmail.com> <CAK8P3a3RXr5CR7DJgD9rEkN8owpPxXRgzRnPB_5LuQcHkzc4LA@mail.gmail.com>
 <e2d7268b-bdaf-45bf-bb21-a5b9f7e985a4@www.fastmail.com>
In-Reply-To: <e2d7268b-bdaf-45bf-bb21-a5b9f7e985a4@www.fastmail.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Tue, 13 Apr 2021 10:22:11 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1VFKuewt65RUK6hFAhZYSFFVUX7_nuJLoZW2WoPXGVTw@mail.gmail.com>
Message-ID: <CAK8P3a1VFKuewt65RUK6hFAhZYSFFVUX7_nuJLoZW2WoPXGVTw@mail.gmail.com>
Subject: Re: [PATCH v2 16/21] ipmi: kcs_bmc: Add a "raw" character device interface
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        openipmi-developer@lists.sourceforge.net,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Corey Minyard <minyard@acm.org>, Joel Stanley <joel@jms.id.au>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        DTML <devicetree@vger.kernel.org>,
        Tomer Maimon <tmaimon77@gmail.com>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Avi Fishman <avifishman70@gmail.com>,
        Patrick Venture <venture@google.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tali Perry <tali.perry1@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Benjamin Fair <benjaminfair@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 13, 2021 at 1:45 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> On Mon, 12 Apr 2021, at 18:18, Arnd Bergmann wrote:
> > On Mon, Apr 12, 2021 at 3:33 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> > > On Fri, 9 Apr 2021, at 17:25, Arnd Bergmann wrote:
> > > > On Fri, Mar 19, 2021 at 7:31 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> > > > >
> > > > > The existing IPMI chardev encodes IPMI behaviours as the name suggests.
> > > > > However, KCS devices are useful beyond IPMI (or keyboards), as they
> > > > > provide a means to generate IRQs and exchange arbitrary data between a
> > > > > BMC and its host system.
> > > >
> > > > I only noticed the series after Joel asked about the DT changes on the arm
> > > > side. One question though:
> > > >
> > > > How does this related to the drivers/input/serio/ framework that also talks
> > > > to the keyboard controller for things that are not keyboards?
> > >
> > > I've taken a brief look and I feel they're somewhat closely related.
> > >
> > > It's plausible that we could wrangle the code so the Aspeed and Nuvoton
> > > KCS drivers move under drivers/input/serio. If you squint, the i8042
> > > serio device driver has similarities with what the Aspeed and Nuvoton
> > > device drivers are providing to the KCS IPMI stack.
> >
> > After looking some more into it, I finally understood that the two are
> > rather complementary. While the  drivers/char/ipmi/kcs_bmc.c
> > is the other (bmc) end of drivers/char/ipmi/ipmi_kcs_sm.c, it seems
> > that the proposed kcs_bmc_cdev_raw.c interface would be
> > what corresponds to the other side of
> > drivers/input/serio/i8042.c+userio.c.
>
> Right. I guess the question is should we be splitting kernel subsystems
> along host/bmc lines? Doesn't feel intuitive, it's all Linux, but maybe
> we can consolidate in the future if it makes sense?

We actually have a number of subsystems with somewhat overlapping
functionality. I brought up serio, because it has an abstraction for multiple
things that communicate over the keyboard controller and I thought
the problem you were trying to solve was also related to the keyboard
controller.
It is also one of multiple abstractions that allow you to connect a device
to a uart (along with serdev and tty_ldisc, probably at least one more that
you can nest above or below these).

Consolidating the kcs_bmc.c interface into something that already
exists would obviously be best, but it's not clear which of these that
should be, that depends on the fundamental properties of the hardware
interface.

> > Then again, these are also on
> > separate ports (0x60 for the keyboard controller, 0xca2 for the BMC
> > KCS), so they would never actually talk to one another.
>
> Well, sort of I guess. On Power systems we don't use the keyboard
> controller for IPMI or keyboards, so we're just kinda exploiting the
> hardware for our own purposes.

Can you describe in an abstract form what the hardware interface
can do here and what you want from it? I wonder if it could be
part of a higher-level interface such as drivers/mailbox/ instead.

         Arnd
