Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C049531894
	for <lists+linux-gpio@lfdr.de>; Mon, 23 May 2022 22:54:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229832AbiEWTV3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 May 2022 15:21:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229847AbiEWTVG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 May 2022 15:21:06 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8A7642A0D
        for <linux-gpio@vger.kernel.org>; Mon, 23 May 2022 11:56:40 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id ck4so26471888ejb.8
        for <linux-gpio@vger.kernel.org>; Mon, 23 May 2022 11:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8tifE5bLnfHULjuXzdKXlmgh+yYdYzL6ft6zuAUxHcg=;
        b=BbaCu16gsjt26dSAL88WDw2c2uoZsyZk863ptFfWyzXJ5b5CFHDeaY9s26kf41Lq8O
         EhF5L3KPdXX9aFAP1GmTWwwuEmWXLiRH87BY7Ip1+fqM+7ATMOl9nJD2O1CJYhQRgqWk
         OlE9JbosTY98LFAk3zexxQ/Xo0d6513GLb0MUVV8KCAev0jjJg9jD78MEfK4+Mmbo0B7
         TBXMJBYJDxBzV8DAoGhA3V2NSoxBCtdWGshSDpreFTEGqwDvkFsHAGTSC9NhUdc69BLi
         G/PfJruUboOrZ2uZotTPjyRNj8E2EwoZZtDuW3jvxUIpN60NXuKHTf50xc6XRlR8C3Om
         Dyeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8tifE5bLnfHULjuXzdKXlmgh+yYdYzL6ft6zuAUxHcg=;
        b=wHPkdwzZydx/IC47txPOXs7en4tX35qaNBXsa8Iz/Dn8Cw7jH4sy6PhdPH3gePvZdL
         oXPgll/eCwazLvMs9lU6oPPOBRDnlHgEeB3pIP4LqD0a2l25b4ibjFNGeY+pNYffPskE
         u/7RTON7qeojn4pHOFeR3KpG8UvLiRq6YwgTjkEeajoWMhmBr1hvsh/34NJIzYbfFX0+
         LsY1b4WQ0TxJpOAsdJB7YfXiAZ6Lj1lU2UyE3fM+OsuvHsN5NhmvRNBgEFpj3G+A3jQa
         PY7vVan2YlcLYnAklrJE4zpmgMLVgHPofsQKyO62NP72ZWjuEm1nPOv5r0HgIlSSNPTp
         38kA==
X-Gm-Message-State: AOAM533LbvhqJgjQh/5KIJkfgoqvvfJIlPFxcBsu+6XRQq3hGjQ8yK5H
        imfA+wzF+Yi97tFw6ooamiZiUMN0cIxs+iW7/GE50Q==
X-Google-Smtp-Source: ABdhPJwEKQpKbBK2FLsmHHKUY1mYHfr68FuqP8Z2vt9DwnDi5qqzNZIfQfCdriAzhT3uxbP6JRx5flatG3DhTad3ChM=
X-Received: by 2002:a17:907:c28:b0:6f4:2a80:f355 with SMTP id
 ga40-20020a1709070c2800b006f42a80f355mr20485108ejc.101.1653332199212; Mon, 23
 May 2022 11:56:39 -0700 (PDT)
MIME-Version: 1.0
References: <01f7a990654697ca7ec8b2d0025f41403462c8d9.1653042121.git.geert+renesas@glider.be>
 <CAMRc=Mdf_PHyC3doO4KfzeTJz+WT2VZE6pxADOxz3_Sy9jPGqA@mail.gmail.com> <CAMuHMdXe2v8Tamyz6-xhFfoc7X-x9iDk8Rey-PBsdEe9+2-Bgw@mail.gmail.com>
In-Reply-To: <CAMuHMdXe2v8Tamyz6-xhFfoc7X-x9iDk8Rey-PBsdEe9+2-Bgw@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 23 May 2022 20:56:28 +0200
Message-ID: <CAMRc=MfVahrfyaJUwbJZP8XeQYFz9jas5ASaqp3iXCo3NW4bxA@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: dwapb: Make the irqchip immutable
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Hoan Tran <hoan@os.amperecomputing.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        Marc Zyngier <maz@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 23, 2022 at 9:25 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Bartosz,
>
> On Sun, May 22, 2022 at 10:13 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > On Fri, May 20, 2022 at 12:23 PM Geert Uytterhoeven
> > <geert+renesas@glider.be> wrote:
> > > Commit 6c846d026d49 ("gpio: Don't fiddle with irqchips marked as
> > > immutable") added a warning to indicate if the gpiolib is altering the
> > > internals of irqchips.  Following this change the following warning is
> > > now observed for the dwapb driver:
> > >
> > >     gpio gpiochip0: (50200000.gpio): not an immutable chip, please consider fixing it!
> > >
> > > Fix this by making the irqchip in the dwapb driver immutable.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > > Against gpio/for-next.
> > > Boot-tested on SiPEED MAiXBiT (Canaan K210).
> > >
> > > v2:
> > >   - Factor out hwirq using preferred helper.
>
> > I'll pick those patches up for the next cycle to let them spend some
> > time in next.
>
> "next cycle" = later PR for v5.19, I hope?
> If the new warning will make it into v5.19-rc1 (commit 6c846d026d490b23
> is in gpio/for-next), I think you should collect all fixes and make
> sure they end up in v5.19, too.
>

Ah you're right, sorry, yeah I will pick those up now.

Bart
