Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C843D45370F
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Nov 2021 17:13:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229742AbhKPQQo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Nov 2021 11:16:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbhKPQQn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Nov 2021 11:16:43 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8B37C061570;
        Tue, 16 Nov 2021 08:13:46 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id e3so53835787edu.4;
        Tue, 16 Nov 2021 08:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=50QCkGUElk/jMFTX3H/2D+qJecjTCiwTPcIPrxs29UY=;
        b=lROBxbp6aw1lSJFZve0CLEi4r203O6x+xtEj4ordjC5YTDarvHSdJbgbfvOZeQ4ryQ
         dmel/Fomvo8b1w2IxT5JHIBLL9YmtpQBnc6aiL8Hpnhjn9y/Ms+zRyzsuXzsyi13N9B1
         rCjjSDOCjdoezAhHLmxac+RjiU/GAIoHBGRc6R232naf75seKfUcJhXtso17EAfNKyrx
         udsHnKa59eMP4lZl2tuZzYuXUlAn2LOKugdb0ndhYuAugSN+nGtB40egxYe9nC62qJz4
         fxWh0LgJ21Ig9tf8KDFyFN6bu4AiLlaRDjG/NhR5ixEMQ7LYwdvNKzwETWjwVedqr9cQ
         b7fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=50QCkGUElk/jMFTX3H/2D+qJecjTCiwTPcIPrxs29UY=;
        b=BnteWz4npiQu9ZxDyjqoOGOjvfhNQS3TdXk/4YxbNVN5nQ0moFJAflLmXxcSyG2sGj
         YKkysUYWrD6kwYIoieZDrDQZ58Tq8hO78CLgFlYkPhJ8OYn2DL6qfrwpT9qpOY5EsQb3
         dy04Gdv6Daw/aY459U4JGIQAXE9BxC8pEhkibRLPknZ+9XhKtO/W8kC8ep5opSMKcskT
         z8zFn9r9oTC5/10vsKmqn9JTz9AzptsGOfZuhSO5cvURvMiLiaei3VT2xuK+/+bZTudA
         rg4Dqqrm4xbNrpgRCv3mU6mBOE8plTliIfJaR/EQvD+sNQn7pq7Sy0SS+GaOPO0mLcGn
         f0MA==
X-Gm-Message-State: AOAM531ORE+a/4/jI9E99GnTP/YDXYwVHrKpnNCW9XADg8nJQ1DvQfW8
        TlV4RHBLV5eQsONFOiIMxHq7ttVzUbGzDtPLFNw=
X-Google-Smtp-Source: ABdhPJxz9YUq27598es1YhF6T5O+95wGFrkVO6obEtS3MnJuRp9PIA9hZgOWIYXzAalnrrOc/cFIJBlzV47JzYhjrgk=
X-Received: by 2002:a17:906:6a0a:: with SMTP id qw10mr11823300ejc.141.1637079225318;
 Tue, 16 Nov 2021 08:13:45 -0800 (PST)
MIME-Version: 1.0
References: <20211116150119.2171-1-kernel@esmil.dk> <CAK8P3a38+Osmr7SjD42ZEQzOPwWXM7x+31a5E4bRWVp6JdMS_w@mail.gmail.com>
In-Reply-To: <CAK8P3a38+Osmr7SjD42ZEQzOPwWXM7x+31a5E4bRWVp6JdMS_w@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 16 Nov 2021 18:13:04 +0200
Message-ID: <CAHp75VcCL1eSMaZy_KXdfY=UyTy-hxz4XN5TGkXd6Cf8p+pRNw@mail.gmail.com>
Subject: Re: [PATCH v4 00/16] Basic StarFive JH7100 RISC-V SoC support
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Emil Renner Berthing <kernel@esmil.dk>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        DTML <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Sagar Kadam <sagar.kadam@sifive.com>,
        Drew Fustini <drew@beagleboard.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Zhu <michael.zhu@starfivetech.com>,
        Fu Wei <tekkamanninja@gmail.com>,
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Matteo Croce <mcroce@microsoft.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 16, 2021 at 6:09 PM Arnd Bergmann <arnd@arndb.de> wrote:
> On Tue, Nov 16, 2021 at 4:01 PM Emil Renner Berthing <kernel@esmil.dk> wrote:

...

> One general (minor) comment about the patches: please put your own
> 'Signed-off-by'
> into the last line of the patch description, below all the lines you
> took from other people, so
> instead of:
>
> | Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> | Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> | Acked-by: Rob Herring <robh@kernel.org>
>
> do this:
>
> | Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> | Acked-by: Rob Herring <robh@kernel.org>
> | Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>

Why?
Submitting Patches tells about chronological order and last SoB to be
from the submitter.
These both are correct. Note the difference between 'last SoB' and
'SoB to be last [line]'.

Here is the excerpt:
"Notably, the last Signed-off-by: must always be that of the developer
submitting the patch."

-- 
With Best Regards,
Andy Shevchenko
