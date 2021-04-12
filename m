Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5ACE035BD60
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Apr 2021 10:51:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238096AbhDLIvN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Apr 2021 04:51:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:36784 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238328AbhDLItb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 12 Apr 2021 04:49:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D155F61379;
        Mon, 12 Apr 2021 08:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618217313;
        bh=eLznHwvEfmec088sW414tCcwJZyAy1dqSqy3r+pI7zc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=uey+W82dISxV0CSUCEiP+7gx9QuEZBJfcRoFlSMpkmrDlRAJJ0xVAOCsY94BkROLO
         zR/I466PgDid3faek70DuVNVg7noHojv66W6cwsIyY2yvu9Lt2qRuc9nGzCIxgZBXn
         b+pFwRet18DXS13aa8a0O4MFYM9FTwIPGTmzP+TKLFSBeZqwLd+xPrXiLpfNkZam//
         nTLqalOsrHTkSgYJ0euxXxHf96MAHZTKfV0Uyr+Q3gmjq/OvXQUq6zhW/U9m2u5Nji
         FvCPzYE1fW7fbdBhJcyx8lAQrFqUby6/4TW+Qu7SCI6vP9Tw1jB9lcRoTkvaxiDZxi
         iOtWMOODr0mgA==
Received: by mail-wr1-f48.google.com with SMTP id a6so12023710wrw.8;
        Mon, 12 Apr 2021 01:48:32 -0700 (PDT)
X-Gm-Message-State: AOAM532eWGV1hrPeuH8JRUJZ3NwfO5LXvWL3KOuKwK1eC7rK6S6szAGj
        ExltV7g47vRwzoDHS11IYRaUMbgTSbFR/zbyazI=
X-Google-Smtp-Source: ABdhPJwdOphNG/NExZknsy5yMxBCnGZA+q7EKNOchQAgxbs01jSI9QEePmT+lsicnZYJB8nH9FG1BOhyUFdSoL2u8ew=
X-Received: by 2002:adf:c70b:: with SMTP id k11mr30918454wrg.165.1618217311367;
 Mon, 12 Apr 2021 01:48:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210319062752.145730-1-andrew@aj.id.au> <20210319062752.145730-16-andrew@aj.id.au>
 <CAK8P3a1HDQdbTAT4aRMLu-VFz720ynPqPHG5b22NZ5p5QfUqOw@mail.gmail.com> <ba63f830-4758-49aa-a63e-f204a8eec1b4@www.fastmail.com>
In-Reply-To: <ba63f830-4758-49aa-a63e-f204a8eec1b4@www.fastmail.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Mon, 12 Apr 2021 10:48:14 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3RXr5CR7DJgD9rEkN8owpPxXRgzRnPB_5LuQcHkzc4LA@mail.gmail.com>
Message-ID: <CAK8P3a3RXr5CR7DJgD9rEkN8owpPxXRgzRnPB_5LuQcHkzc4LA@mail.gmail.com>
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

On Mon, Apr 12, 2021 at 3:33 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> On Fri, 9 Apr 2021, at 17:25, Arnd Bergmann wrote:
> > On Fri, Mar 19, 2021 at 7:31 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> > >
> > > The existing IPMI chardev encodes IPMI behaviours as the name suggests.
> > > However, KCS devices are useful beyond IPMI (or keyboards), as they
> > > provide a means to generate IRQs and exchange arbitrary data between a
> > > BMC and its host system.
> >
> > I only noticed the series after Joel asked about the DT changes on the arm
> > side. One question though:
> >
> > How does this related to the drivers/input/serio/ framework that also talks
> > to the keyboard controller for things that are not keyboards?
>
> I've taken a brief look and I feel they're somewhat closely related.
>
> It's plausible that we could wrangle the code so the Aspeed and Nuvoton
> KCS drivers move under drivers/input/serio. If you squint, the i8042
> serio device driver has similarities with what the Aspeed and Nuvoton
> device drivers are providing to the KCS IPMI stack.

After looking some more into it, I finally understood that the two are
rather complementary. While the  drivers/char/ipmi/kcs_bmc.c
is the other (bmc) end of drivers/char/ipmi/ipmi_kcs_sm.c, it seems
that the proposed kcs_bmc_cdev_raw.c interface would be
what corresponds to the other side of
drivers/input/serio/i8042.c+userio.c. Then again, these are also on
separate ports (0x60 for the keyboard controller, 0xca2 for the BMC
KCS), so they would never actually talk to one another.

> Both the KCS IPMI and raw chardev I've implemented in this patch need
> both read and write access to the status register (STR). serio could
> potentially expose its value through serio_interrupt() using the
> SERIO_OOB_DATA flag, but I haven't put any thought into it beyond this
> sentence. We'd need some extra support for writing STR via the serio
> API. I'm not sure that fits into the abstraction (unless we make
> serio_write() take a flags argument?).
>
> In that vein, the serio_raw interface is close to the functionality
> that the raw chardev provides in this patch, though again serio_raw
> lacks userspace access to STR. Flags are ignored in the ->interrupt()
> callback so all values received via ->interrupt() are exposed as data.
> The result is there's no way to take care of SERIO_OOB_DATA in the
> read() path. Given that, I think we'd have to expose an ioctl() to
> access the STR value after taking care of SERIO_OOB_DATA in
> ->interrupt().
>
> I'm not sure where that lands us.

Based on what I looked up, I think you can just forget about my original
question. We have two separate interfaces that use an Intel 8042-style
protocol, but they don't really interact.

      Arnd
