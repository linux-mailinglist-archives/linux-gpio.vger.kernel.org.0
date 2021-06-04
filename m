Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D18D039B6F1
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jun 2021 12:23:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230010AbhFDKYq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Jun 2021 06:24:46 -0400
Received: from mail-pj1-f53.google.com ([209.85.216.53]:52844 "EHLO
        mail-pj1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229625AbhFDKYq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Jun 2021 06:24:46 -0400
Received: by mail-pj1-f53.google.com with SMTP id h16so5309372pjv.2;
        Fri, 04 Jun 2021 03:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aUTAR6wf3YjHvE8+6bjBL3/E962RYRKJQK58myGqUmo=;
        b=L30wT9Gqzu4Awu7kONktI1IDMc9NsZdNoJ8lA7zfngTzBLSGNIdxGF27OrmMGpOes2
         NCHhHQqIIvIuIrghRnAUcYJFwQkPv+bVNz28ZyWSkQnxBV/ySlmFlc/tNXEu1keHQKcU
         tOyJTfyocsBvW4COyd7jQyNEmqdxJ2TYsyEeLkmo+goJIEdTDkGRIiV06oxzN+mgSV0A
         cvBKAmYQ9iZ5h35JJmLAWsEVklfeTKWclOgJ9qnXC5fQmPut7pKgGjirxe6IZc9DDy53
         lHsTUWh0L5vLGSj4IrUPGXAIvsbPpAKCf49KClLz+aSsX3snEKv6pBEdp40bkof5BySK
         nOrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aUTAR6wf3YjHvE8+6bjBL3/E962RYRKJQK58myGqUmo=;
        b=e5jMALYzshO2ciXGPEB0sI9UfhsbuaWMOF6U45+vqF98btd1r6jXUqixjXN/H7zySo
         WRUXZXT9A4ZeXcuLsT5D4pg4mvc+8vVyr97O5Uh9QQph1WkNtD0wAFXN4+424JqHJn3E
         mazOG15vm7AMSAMixNGhZqzY3G4UBiiXR9OXPO/S9L6wKra09EFtW0+awV2jkDp3rRpg
         ToCTYwXecoPt21w5D8vIwAJ2GTSugff1BABkbB6mwoCYvalnbEcnYpWKkhczSBhOETfw
         rhJNfbI6OawcB9k36v8CZKmC3Mg4wwdAtLvsbKyNQRZkgw0rTyXmWBzKmU/Q/hBZkn4h
         l5Cg==
X-Gm-Message-State: AOAM5301LA/XkRPvgtzyxXuUBpU26rojzUqPlG9NCstpAKcWNSCNZ83h
        AVltw8/rJAh8qQTMyjRaVFWZtKo6+LJAulGJrrk=
X-Google-Smtp-Source: ABdhPJz0oU98a0IEMUBvGYHgVWiHvtHkWNGD3vRTHMitz6twCDnTyAUyXMyaiL9RpUbfVkqVHjdEnWAwNttkcCue/po=
X-Received: by 2002:a17:90a:17ad:: with SMTP id q42mr16339993pja.181.1622802120096;
 Fri, 04 Jun 2021 03:22:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210603101822.9645-1-steven_lee@aspeedtech.com>
 <20210603101822.9645-4-steven_lee@aspeedtech.com> <CAHp75Vef0HDXAHzSNL-LtA0Sra6Zpivt513_+aFR_um0JeFkog@mail.gmail.com>
 <20210604021422.GA25112@aspeedtech.com>
In-Reply-To: <20210604021422.GA25112@aspeedtech.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 4 Jun 2021 13:21:43 +0300
Message-ID: <CAHp75VfmCJEP+N-U5nhg-R1bhG5iSfqAsPf3022u8T2mmTFRAA@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] gpio: gpio-aspeed-sgpio: Add AST2600 sgpio support
To:     Steven Lee <steven_lee@aspeedtech.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>,
        "Hongweiz@ami.com" <Hongweiz@ami.com>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 4, 2021 at 5:14 AM Steven Lee <steven_lee@aspeedtech.com> wrote:
> The 06/03/2021 19:05, Andy Shevchenko wrote:
> > On Thu, Jun 3, 2021 at 1:19 PM Steven Lee <steven_lee@aspeedtech.com> wrote:

> > > +#define GPIO_OFFSET(x)        ((x) & 0x1f)
> >
> > GENMASK()
> >
> > ...
> >
>
> Do you mean the macro should be modified as follows?
> #define GPIO_OFFSET(x)        ((x) & GENMASK(4, 0))

Yes.

-- 
With Best Regards,
Andy Shevchenko
