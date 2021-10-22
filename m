Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6CDD43795E
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Oct 2021 16:51:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233159AbhJVOxw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Oct 2021 10:53:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232926AbhJVOxw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Oct 2021 10:53:52 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84D26C061764;
        Fri, 22 Oct 2021 07:51:34 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id w19so2549366edd.2;
        Fri, 22 Oct 2021 07:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=U2zlxllI/wA4AeNFHkhcnXvhZJof18yvz4lRtA/A0Ck=;
        b=O4t+iAMSPLWSK3+8w7xF6PGGAwtgvxGdQmcmffBt8Spyk6Y9G+W4+EOcW7y51Ca0kK
         wt6rbnP8vcLn/MdTKOwRy1QRAEzWTHDOIcASOln3ZzYkt+RtjEaTNZSX+K+waaMFOaCR
         EP9FnRrb4A1y/L/LVMoSTpGfj6uMp+E9O1khixqfDXLglxUShkYXh2HIZNQLYGacsbqO
         59XRg+blwjSxXkN/Ol5qstsGst4lnIgU3fT9S2nrWah4ggPyDkpGmyArri6Px2HdLNAs
         w2LIFhzYxGOQx1NJMvezYrw6Ls/E/G7HiG+dOfmr0YkXjdAJI3N0vblHW0o9bTptmElp
         BC6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U2zlxllI/wA4AeNFHkhcnXvhZJof18yvz4lRtA/A0Ck=;
        b=LWtvp7Y5dbDizniPVsS9HHMy57lhURUDcBDw3jgmCVlZCPFmsRUIQ5AaASGhKOKu26
         Ej0b/GNQL2pr6fSaTLeP+lcuoCGJuAp6J5qBKdl9hCKyakM9oK4VHZeTfA9BEeQCJ2UZ
         ZA/PtIlm/bvnzazMr+qbCqzfS4c8qj9VPvinqzUL4coL4cqAHQFwSQAxDckmy5LHkxxV
         Tyyj+fy6DxtYQyA5uSVq0QArYrt8YTiWkxOxOa1VLd67EY5w71C8+8C4X8SxyUk+WmNf
         0YYO2acI4+Rhcmiol17KoiEuv3CXULqk/3nqVp37Cbx4Crsb3HUumz41WU5P4kOcimn6
         OzkA==
X-Gm-Message-State: AOAM532tvaS3ipwGM5/+kqciSDTu5zy5tkn3YKZwGoQTJGSwyJcUYL2j
        FAOECvDsDjMfD8Y+LTatci65sKuSpghtUTXTExc=
X-Google-Smtp-Source: ABdhPJzui1ybEtPFbAKFluoha+ME1JAVGAZslCUhtsKJWtrMojGSkFrSchg6cjyG+w3foBFnnPouMdQjjvq6ufKJHTo=
X-Received: by 2002:a05:6402:2031:: with SMTP id ay17mr607386edb.240.1634914293101;
 Fri, 22 Oct 2021 07:51:33 -0700 (PDT)
MIME-Version: 1.0
References: <20211021174223.43310-1-kernel@esmil.dk> <20211021174223.43310-10-kernel@esmil.dk>
 <CAHp75VcUv6WH0--FANpRExCdEOJNVo8KCtJ2Go090=FZq-Y0UQ@mail.gmail.com>
 <CANBLGcysKdqo+FioSkhd1PZRLzPF=fRJrCTsUGR7vXcn2WpYHg@mail.gmail.com>
 <CAHp75VditKnEcPKgqxz7NfG3ZWLZCu=pW=8qw7HS_iWePTj5Qw@mail.gmail.com>
 <CANBLGcyaSgbOgA4u_QivUQicyZ0MuUmrSsPq56OAANsav8R=VQ@mail.gmail.com> <CAHp75Vf=fGn33JFa-8UwCzv7A6AgHdnvfoabKnCcuKZxOyWX2Q@mail.gmail.com>
In-Reply-To: <CAHp75Vf=fGn33JFa-8UwCzv7A6AgHdnvfoabKnCcuKZxOyWX2Q@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 22 Oct 2021 17:50:37 +0300
Message-ID: <CAHp75Vfbc6Fj31cHsj5YoeO6Yeuz1hE+DNCu7ggVX32pCk=PqA@mail.gmail.com>
Subject: Re: [PATCH v2 09/16] reset: starfive-jh7100: Add StarFive JH7100
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
        Atish Patra <atish.patra@wdc.com>,
        Matteo Croce <mcroce@microsoft.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 22, 2021 at 5:49 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Fri, Oct 22, 2021 at 5:25 PM Emil Renner Berthing <kernel@esmil.dk> wrote:

...

> See gpio-xilinx and gpio-pca953x on how to use bitmaps in the GPIO drivers.

It might be confusing, what I meant is take that as an example on how
the bitmaps are used in the GPIO drivers.

-- 
With Best Regards,
Andy Shevchenko
