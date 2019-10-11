Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D90D0D39FC
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2019 09:24:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727585AbfJKHYP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Oct 2019 03:24:15 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:44046 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726679AbfJKHYP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Oct 2019 03:24:15 -0400
Received: by mail-oi1-f196.google.com with SMTP id w6so7143868oie.11
        for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2019 00:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+jsslCcOZL1zwh7rI9IumPKO6jV7VRR657d4aCnppBU=;
        b=gQ8OzKUC9SM806HoYLooGGSu6+uwTBsN4ZUzpThMe/x85bFXiMStdXajnxKnOcYZcq
         VP4jME4Z5/CAigtga9q2AM+633T2pZ9Ye0sOHe9to50ZwO7rGfucYA4qKnRAb6njrv+B
         sSAeA4nmFwg3wZenHz72uKYK2hNJwJ1KqzhcYubZRc4h4HvYPB0AjAuyOyCav5ybcTiR
         qluditJXrTW8Afc/6QNSUDA0Wr1g+bugBhac/l4eIuQmiiNomnQL6tfCmYl1eM0vYWIF
         M8LPGHhnAruebm25JQ5ObkubBio9v2iu50aBJfkv2Dh+eotc0CNkBmpw/2PsO21eBw1U
         OcgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+jsslCcOZL1zwh7rI9IumPKO6jV7VRR657d4aCnppBU=;
        b=fm5aU1WPvwRILjQmTHzK4RJKTWd9vhx6hwEt96Z71F1X8fX4JPgUm2iYZORiYtFQC2
         LVBHXVIG303YwdJzSKU0FLliypNn4U62GZysSD+VyhGvihWCYBhiFxhCGtfs1T+ffp9y
         8dIbLywbo2EWQLtYg4S/Jz+ECPiUN+FnqiV0/FIhpDoxSzR5OYLt0G0E5NR32BpPvohG
         66CE8glwq0c4liHe0SMlS7xxtJBjxjFpOfhxeAr0pa3Vb3dRSACWd67687xTKVobYDfc
         ZkiQ3iKgJT9UTBXDkrgm7YDmil99HSXapCOkM/X6zEgpExI2I48hHIZnBu4iFnWi7yS3
         gezg==
X-Gm-Message-State: APjAAAXIuyPXtJa4gqPB/ltnHm/bIrFOvSn7oG1SEMzncp422MerrmT4
        /vt+eG3KSgenZUnC4gYsXq8vBC1+q4MU1c0fSxeovq1S
X-Google-Smtp-Source: APXvYqwJ84SFWy8yK3RKIkwgJJenTl1T+oWEl5E7aEj47lbptf9qiT3nfOyGmaGMQPBYjVgd7IKJs2R4rqhZFS0d9bQ=
X-Received: by 2002:aca:4c43:: with SMTP id z64mr11219812oia.170.1570778654434;
 Fri, 11 Oct 2019 00:24:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAOsEZohCedO1d+-oQkGnxpZm6kJnBCRgGPswRKGOxkx41yCxiA@mail.gmail.com>
 <CACRpkdb7irxRVCB2htGhomnO-EpPSPRd9VqmHktwBo=+2Zx4tg@mail.gmail.com>
In-Reply-To: <CACRpkdb7irxRVCB2htGhomnO-EpPSPRd9VqmHktwBo=+2Zx4tg@mail.gmail.com>
From:   Jay Aurabind <jay.aurabind@gmail.com>
Date:   Fri, 11 Oct 2019 12:54:02 +0530
Message-ID: <CAOsEZoitZmA848a4W2rkFZNjCWoN5aj291zcUi9P-+xMprCFRw@mail.gmail.com>
Subject: Re: GPIO controller driver pull up/down without pinctrl
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 11 Oct 2019 at 12:39, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Fri, Oct 11, 2019 at 8:26 AM Jay Aurabind <jay.aurabind@gmail.com> wrote:
>
> > Quoting "Documentation/devicetree/bindings/gpio/gpio.txt":
> >
> >          Optional standard bitfield specifiers for the last cell:
> >
> >          [snip]
> >
> >          This setting only applies to hardware with a simple on/off
> >          control for pull-up configuration. If the hardware has more
> >          elaborate pull-up configuration, it should be represented
> >          using a pin control binding.
> >
> > So if I do not want a separate pinctrl driver, how can I do the
> > necessary pull up/down setup in the gpio controller driver? I could
> > not find any drivers using the simple interface. Is this facility
> > available?
>
> See:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpio/gpio-pca953x.c
> Callbacks pca953x_gpio_set_config() and what it calls further from there.
>

Thank you very much for the quick response!

-- 

Thanks and Regards,
Jay
