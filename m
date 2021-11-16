Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA48F45375A
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Nov 2021 17:25:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232018AbhKPQ2W (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Nov 2021 11:28:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231539AbhKPQ2W (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Nov 2021 11:28:22 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0642DC061570;
        Tue, 16 Nov 2021 08:25:25 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id t5so4822793edd.0;
        Tue, 16 Nov 2021 08:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q88psRCm5CJ7gKksPQ7q1UXlzh7VhWtfPRNOkpoGNsw=;
        b=kfiUOtAuB5auAwn6AVDVpys4wB6g0I2bSAC0FIHN3DpPvqcIlOSTeoC1oGWMueVfym
         RmnYtoARlWHc+I4MY3t5a9LQztqWjJwtu6lEpY5zkkPMdRpO7cHOSeg8iFoqKM1m7tL9
         /sMZVW+2uoSK/wvjjEFrcJDv230PSSB9Y8nAd/iihG+dRUmbjm+Dz6MqaWqMADWUxvPz
         EXhI5fOuNlLnOftgovf0Mhz1o6peHH1ZzFNE8ApE9z84vdYBCSqO2O7inmeyowTQOOJ1
         NjutVAiljTVNpv0UqG7zOKG/GqNg9FYzUS972bTDhPxONhK4539hCCLVe09RWrrqLAOJ
         5dOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q88psRCm5CJ7gKksPQ7q1UXlzh7VhWtfPRNOkpoGNsw=;
        b=qbNdR+sbTyRLtS9kQpmLNAOt6JCeanXh1Lsuqbjrz/ms9tEOf8a9DQ7RquPTTpHQEF
         gcxxu3z5OmahqTrht+d9S3r7nD97x+mtZd0+JvpDNxuV2Cd3D58etbVae2XAL8OaxCnY
         TrpYWNB17oY2ZBYtk6F08Zyss8AcEWl7ToEr3ScyGPSwpFcVbKn0eX4+OYmoXSQKQaVk
         jrh+83EsMlHRRY49Sp0MULFfagpak+eZwQQsuKPPMEskVgr5sUcsrRh68m/d9Ubn1AOJ
         nK6n5VQdb12/1mHKNcJrlSSUNbextVKNEShJGa7sdTQErntvEl47sWatKJLeODLGRfwU
         V88A==
X-Gm-Message-State: AOAM5319INpTJs1Q9WYx0t2Pmvnbos2vay5+J1XkDRPhsL77smKpFvPr
        trCi8rq+Od/KRQwxr1eSHKIJKcEkPa6ikeTye5c=
X-Google-Smtp-Source: ABdhPJw6thu0W4I08er21OMHvXTqHCmRke36jRJTw4oXoQF/f+U0K4R8gl9a4RxuiOpRyHKj2w6qLkAgCbzfL6d5hyk=
X-Received: by 2002:a50:9ec9:: with SMTP id a67mr11550144edf.238.1637079923561;
 Tue, 16 Nov 2021 08:25:23 -0800 (PST)
MIME-Version: 1.0
References: <20211116150119.2171-1-kernel@esmil.dk> <20211116150119.2171-10-kernel@esmil.dk>
 <CAHp75VcUziRv4_U9aDfKu2SKnqj1dab7y+N90tw0JaEKxWW_wQ@mail.gmail.com>
 <CANBLGcz-sRBVGDc2sLtuTdwUesi4QDgB9yCZqhZpMfF6f5dReg@mail.gmail.com> <CAHp75VdJ1xZ8ZGSwjKdvcQzkyfTKcEDzVBLkhdh-Vp3Cx=HdBA@mail.gmail.com>
In-Reply-To: <CAHp75VdJ1xZ8ZGSwjKdvcQzkyfTKcEDzVBLkhdh-Vp3Cx=HdBA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 16 Nov 2021 18:24:42 +0200
Message-ID: <CAHp75VcX-RRjEwK_4GjoXwsgM_Uz5foXTXA7E8rUZm_px1ZTOg@mail.gmail.com>
Subject: Re: [PATCH v4 09/16] reset: starfive-jh7100: Add StarFive JH7100
 reset driver
To:     Emil Renner Berthing <kernel@esmil.dk>
Cc:     linux-riscv <linux-riscv@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
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
        Matteo Croce <mcroce@microsoft.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 16, 2021 at 6:21 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Tue, Nov 16, 2021 at 6:06 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > On Tue, 16 Nov 2021 at 17:01, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > On Tue, Nov 16, 2021 at 5:06 PM Emil Renner Berthing <kernel@esmil.dk> wrote:

> Maybe at the end of the day simple use of u64 will be better than bitmap.
> Up to you, you have got the idea. Either way you may put my tag.

At least I see pros of the current solution that it won't read more
registers than needed.

P.S. And do not add that guy to the Cc list, I think people are
already annoyed by bounces.

-- 
With Best Regards,
Andy Shevchenko
