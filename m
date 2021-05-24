Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9249238E1EE
	for <lists+linux-gpio@lfdr.de>; Mon, 24 May 2021 09:49:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232266AbhEXHvX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 May 2021 03:51:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232099AbhEXHvX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 May 2021 03:51:23 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9B1AC061574;
        Mon, 24 May 2021 00:49:54 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id k5so14363540pjj.1;
        Mon, 24 May 2021 00:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7TQVEWhmRQ6cumP+zJm1cd6xIHLuipPnV4vmfMxJf9E=;
        b=hiFuS4gy9uJ1Vrdkb8ofyQij8g7UJrPeWf0FxfZo+Qt5Wp4evaOrkw+K4oNcw58YjF
         d/4W97xt3/SC+wCCSWJ62beXcRRZp5o7HE19W4pz09irN/FLOxex4MmGpmb/I2q1BGTV
         Vtptnobs1CU6PEDSy7zMimWZ44m31YpJcAUlc6t7baCH1jcndVD5nYujsEAYLrGTCZ4S
         nPcPuKobW763XUdCEmcfH086hFz/mkPUbctFu7JOOHOfM8xxwd9bBhUWD+NuZuX+Wm60
         C/ozZc6rMBG4pbiTOk1XuBQAgdnDetlNXHDNyn+pZ9EqN27YhouPZ5a9nnwwuUSpJDn4
         xcYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7TQVEWhmRQ6cumP+zJm1cd6xIHLuipPnV4vmfMxJf9E=;
        b=A42Uu4rFn0fNXeaqoQ1DMWaPOwxt31cA7Ns3CJiRFsxofEfUJrZ7sjb2kPDtG0idAO
         LXADB2BFrTiIBRqbAI/3sihL4ki9DO10MIfWytNnbzbPl1xs2D18Mfs6+jNINbGWtG5U
         PnahuTdsFgo2zjv8FD4xTDzOYgmjohldMFuB38NmKaRTcng1GXO2i7PXajk/3kuN+V9A
         sD2bA1sf3DfENUkVYmX/+X2OI/l3I6BcwDMGrZwEvSBjY98Xk6IgoQNGE6ZNislhT/xg
         HBG3NrzcrQ/M1hnYKJE+6kRDx5tuaHvJKVMa2QZL8cq8Kl9YWW2ba/hBgihSOzXEMGGa
         CyGQ==
X-Gm-Message-State: AOAM531giygp8wsnL62d4OhVnUSAq86r6nN9v9QnHAmfNnW5llVrhMHq
        4qpCi04p2FyyeoFr+vYYDWF+MngRPRlnMxh5aGc=
X-Google-Smtp-Source: ABdhPJyZqXQbmVqdfhIueIt+YT4xxFGWSaMk5UeJdl3pUS4myoMBLyD5+RHaxJ5Qhq6bYbbpHZGcC2fKjDGZgZ29db4=
X-Received: by 2002:a17:902:bf48:b029:fa:9401:cda8 with SMTP id
 u8-20020a170902bf48b02900fa9401cda8mr2799553pls.0.1621842594222; Mon, 24 May
 2021 00:49:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1621279162.git.sander@svanheule.net> <f1ca940216c0accfc804afee2dbe46d260d890ae.1621279162.git.sander@svanheule.net>
 <CAHp75Vc5a4PsHsJ2sNsRNT7BaBJ=Kxb+KKM7x7jWeRdOS8WfnQ@mail.gmail.com> <7b5235057380d5997d8f91e70bc8782137c726e1.camel@svanheule.net>
In-Reply-To: <7b5235057380d5997d8f91e70bc8782137c726e1.camel@svanheule.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 24 May 2021 10:49:38 +0300
Message-ID: <CAHp75Ve-8ALxeNwYDdXkZndahv0PY8P=VdHKkKJR=2=suo8L6A@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] mfd: Add RTL8231 core device
To:     Sander Vanheule <sander@svanheule.net>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 24, 2021 at 12:28 AM Sander Vanheule <sander@svanheule.net> wrote:
> On Tue, 2021-05-18 at 00:18 +0300, Andy Shevchenko wrote:
> > On Mon, May 17, 2021 at 10:28 PM Sander Vanheule <sander@svanheule.net> wrote:
> > >
> > > The RTL8231 is implemented as an MDIO device, and provides a regmap
> > > interface for register access by the core and child devices.
> > >
> > > The chip can also be a device on an SMI bus, an I2C-like bus by Realtek.
> > > Since kernel support for SMI is limited, and no real-world SMI
> > > implementations have been encountered for this device, this is currently
> > > unimplemented. The use of the regmap interface should make any future
> > > support relatively straightforward.
> > >
> > > After reset, all pins are muxed to GPIO inputs before the pin drivers
> > > are enabled. This is done to prevent accidental system resets, when a
> > > pin is connected to the parent SoC's reset line.
> >
> > > [missing MDIO_BUS dependency, provided via REGMAP_MDIO]
> > > Reported-by: kernel test robot <lkp@intel.com>
> >
> > What is the culprit? Shouldn't this have a Fixes tag?
>
> But it doesn't actually fix an issue created by an existing commit, just
> something that was wrong in the first version of the patch.

Then why is it in the tag block?
If you want to give a credit to LKP, do it in the comments block
(after '---' cutter line).

>  This patch is not
> dedicated to fixing that single issue though, it's just a part of it. Hence the
> note above the Reported-by tag.

--
With Best Regards,
Andy Shevchenko
