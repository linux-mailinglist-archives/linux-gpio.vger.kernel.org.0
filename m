Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0A2B3D749
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2019 21:55:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405345AbfFKTzK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Jun 2019 15:55:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:60936 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404282AbfFKTzK (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 11 Jun 2019 15:55:10 -0400
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 41EE82173C;
        Tue, 11 Jun 2019 19:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560282909;
        bh=2jeSb/OUEFUwExRaSwm27O/BgcQGHGrpHx+20YxbtuM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=WTgRZYFURDZsQb5+TwkIswCl5Zg+MioxluX+zL+ZzZWomQHLpkKCnGCZBynVvT1qo
         IhlX7pJGYmtDRJgSbcHGZDxgB6fAqtkxiqBUXeZBjaaLoX/Byz2TW4otC/3mkYhXpw
         65X0hL2dZitOE6NFf3oTd8sboqXvP/dDOSreRQBg=
Received: by mail-qk1-f180.google.com with SMTP id m14so8466957qka.10;
        Tue, 11 Jun 2019 12:55:09 -0700 (PDT)
X-Gm-Message-State: APjAAAWtGlbF+oiyCNMLpRG50tYDM3e8ZC0c9vnLOXNr1iztlLJm/rg+
        czWntOds4nHHjFQk/X07V0KvR2aB1AAHHvtbDQ==
X-Google-Smtp-Source: APXvYqzDOaQFq9KRqVoTAyLrNcdmraacXiFjUvpNJC9DC1OsA19tDc1ngzzrggZx0+ae9yjZdwjNOgSx2r/OE2MEo4c=
X-Received: by 2002:ae9:c208:: with SMTP id j8mr61663393qkg.264.1560282908475;
 Tue, 11 Jun 2019 12:55:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190514005033.15593-1-robh@kernel.org> <CACRpkdZabT3_vjkv0PR+GLC0ZXWzpMxfwJU6O9Y+omKJ=6zCaA@mail.gmail.com>
 <20190527064146.5rlm2audk6uojdxn@vireshk-i7>
In-Reply-To: <20190527064146.5rlm2audk6uojdxn@vireshk-i7>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 11 Jun 2019 13:54:57 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK3iS+Tv+0HYMApL6C6WQeVsf9hXgvpLpuR+dbDuygQdg@mail.gmail.com>
Message-ID: <CAL_JsqK3iS+Tv+0HYMApL6C6WQeVsf9hXgvpLpuR+dbDuygQdg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpio: Convert Arm PL061 to json-schema
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 27, 2019 at 12:41 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 24-05-19, 13:38, Linus Walleij wrote:
> > On Tue, May 14, 2019 at 2:50 AM Rob Herring <robh@kernel.org> wrote:
> >
> > > Convert the Arm PL061 GPIO controller binding to json-schema format.
> > >
> > > As I'm the author for all but the gpio-ranges line, make the schema dual
> > > GPL/BSD license.
> > >
> > > Cc: Linus Walleij <linus.walleij@linaro.org>
> > > Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > Cc: linux-gpio@vger.kernel.org
> > > Signed-off-by: Rob Herring <robh@kernel.org>
> >
> > Patch applied. As you know I am already a big fan of this scheme.
> >
> > > This warns on a few platforms missing clocks, interrupt-controller
> > > and/or #interrupt-cells. We could not make those required, but really
> > > they should be IMO. OTOH, it's platforms like Spear and Calxeda which
> > > aren't too active, so I don't know that we want to fix them.
> >
> > What works for you works for me.
> >
> > We could add dummy fixed clocks in the DTS files if
> > we wanted I suppose. The #interrupt-cells and interrupt-controller
> > things we can just fix, but I wonder what the maintainers of these
> > platforms are up to? Isn't Calxeda yours, and could Viresh fix
> > up the SPEAr?

I was hoping to delete Calxeda rather than fix. I'm pretty sure none
of the distros are using the systems anymore and they were the main
users for a while. Otherwise, I would have converted all the bindings
it uses.

> I checked SPEAr and it is missing interrupt-controller at few places and clocks
> everywhere. Missing clocks should be fine as SPEAr doesn't get clocks from DT.

Clocks not from DT was supposed to be a transitional thing...

>
> And interrupt-controller can be just added, I don't think there would be any
> platform dependent side-affects ?

There shouldn't be.

Rob
