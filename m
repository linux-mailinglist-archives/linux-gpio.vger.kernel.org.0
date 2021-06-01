Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0C32397680
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jun 2021 17:24:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233924AbhFAP0L (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Jun 2021 11:26:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234452AbhFAP0I (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Jun 2021 11:26:08 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1E4FC061574;
        Tue,  1 Jun 2021 08:24:26 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id f22so11704336pfn.0;
        Tue, 01 Jun 2021 08:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=anO2W9aofrOQ+Dkybd3ysZSrKPI78hxVB+Li9Pdx2qc=;
        b=hV2dPrV4ysDahQFf0qY0Nj959FMEXWL/8ilS7lzw1ohUJMe14XGGtg5QdDDEuMtlQc
         ji1JCr5AmyR9LPluOu7DyeunkwFncZpjw4Ua67PzJ2fF15UYG7xA0qbjWPDt+H+eEYlY
         y1SYpCrH1dUsxWbr1BslXptOgL2wavXrEZKQe6Rj+5Gk8fDhoJLeDWEZQSENy18cKBGr
         QziTRZG3RsSLrPdg5KCn/EIltYD+7voJfcJTb4VYwyl+VeEsLC/ZY8178i6c+sjxyt3O
         jAsdYivnaHrq+zbiaWV9+uDIgcNAuVAnsswNPwPc0qMoHRWQ/qs/k4IzKOSdb6SudZxZ
         ivrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=anO2W9aofrOQ+Dkybd3ysZSrKPI78hxVB+Li9Pdx2qc=;
        b=nzKDO41h71NseGQo8bcbEMenHnNeCHTz9AyMz6BF8mZZLeY5caFrvbW7ehKwkQ3LNa
         EDR1p/XSWFPgNhDvtmHBUTPFmiI6DpzeMfEMcc9zHcB1jlxH+K2JfQZ9m0qEwlDKrsPC
         eozAMVbsLMNwBjY+bNt5p0dlYjeaM0WWPBO5asuyGJfAdwc1VbHRdlNUJYZOnLn5HniD
         yDiN5IL1M8YCFRi3WT7YchxC4sugPx2VtvAx0hHBm2uOLugZcgP4ZLMGX69QOrTwzjkp
         vX4vqZM+tYvBUX7Z3QFKc0MmD0m2d6mn3ee+fwoRQs3NKTsu1FU5V++tASNI2S6X1BDl
         /R4w==
X-Gm-Message-State: AOAM532WnssVyjJB1VjdDmqwjH7ZQcMghXgS+SblZwKx/mV+AuFU4XmJ
        vnW8u57OE/2RuoBYYgBNFKWsdSImVXhiXtdzhrw=
X-Google-Smtp-Source: ABdhPJzcyFP/4DbEurfksW9KSjR9Ihmom1ulB2GpypX5C5sS7K2/6FtPJgvknTHR9twf8mGfOGttp4b4FN92Bpp/1vw=
X-Received: by 2002:a63:79c3:: with SMTP id u186mr28741200pgc.203.1622561065990;
 Tue, 01 Jun 2021 08:24:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1620735871.git.sander@svanheule.net> <cover.1621809029.git.sander@svanheule.net>
 <YKr9G3EfrM34gCsL@lunn.ch> <CAHp75VewCw8ES_9S48qmeCtSXMkGWt0s4iub0Fu4ZuwWANHpaQ@mail.gmail.com>
 <02bbf73ea8a14119247f07a677993aad2f45b088.camel@svanheule.net>
 <f03d5cdc958110fc7d95cfc4258dac4e@walle.cc> <84352c93f27d7c8b7afea54f3932020e9cd97d02.camel@svanheule.net>
 <a644b8fa-c90a-eab6-9cca-08344abec532@redhat.com> <CAHp75VcFmU4rJ6jL204xGFM=s2LV=KQmsV8E75BpuSAZMXBn0w@mail.gmail.com>
 <c7239e0cbbc9748925410937a914bd8a@walle.cc> <7a9978881e9ec5d4b811fa6e5d355fb6bce6f6d8.camel@svanheule.net>
 <0047200eecbd7ee480258cc904d6b7ee@walle.cc> <CAHp75VfOrUBRQH1vrXEwHN4ZPojQfQju-_wp_3djZeozEaatug@mail.gmail.com>
 <272ac6af4a5ba5df4bb085617c9267e5ece61c19.camel@svanheule.net>
 <CAHp75Vcb95HiYxvEzYr0QXcQmA_A+2M9M0uv6PAhPHtgTges8g@mail.gmail.com> <8df77f619730b9e7b5cdd7ddefb60a03@walle.cc>
In-Reply-To: <8df77f619730b9e7b5cdd7ddefb60a03@walle.cc>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 1 Jun 2021 18:24:09 +0300
Message-ID: <CAHp75VdaPS0YPvNHVgeDOuz=9ACn7okHxhyNEZuyQR8=kSdNdg@mail.gmail.com>
Subject: Re: [PATCH 0/5] RTL8231 GPIO expander support
To:     Michael Walle <michael@walle.cc>
Cc:     Sander Vanheule <sander@svanheule.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Andrew Lunn <andrew@lunn.ch>, Pavel Machek <pavel@ucw.cz>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 1, 2021 at 2:49 PM Michael Walle <michael@walle.cc> wrote:
> Am 2021-05-31 17:48, schrieb Andy Shevchenko:
> > On Mon, May 31, 2021 at 6:33 PM Sander Vanheule <sander@svanheule.net>
> > wrote:
> >> On Mon, 2021-05-31 at 14:16 +0300, Andy Shevchenko wrote:
> >> > On Monday, May 31, 2021, Michael Walle <michael@walle.cc> wrote:
> >> > > Am 2021-05-31 10:36, schrieb Sander Vanheule:
> >
> >> Am I missing something here? It seems to me like the regmap interface
> >> can't
> >> really accommodate what's required, unless maybe the rtl8231 regmap
> >> users
> >> perform some manual locking. This all seems terribly complicated
> >> compared to
> >> using an internal output-value cache inside regmap-gpio.
> >
> > Have you had a chance to look into the PCA953x driver?
> > Sounds to me that you are missing the APIs that regmap provides.
>
> What would that be? The register cache? We need to cache the
> value somehow, because (still assuming it is write only) we cannot
> read it back. Thus the read of the RMW, would need get the
> value from the cache. Thus the user of gpio-regmap would need
> to make sure, to (a) use a cache for the regmap supplied to
> gpio-regmap and (b) populate its initial values correctly. Is
> that what you are suggesting? And hopefully, no other user
> of the regmap will call regcache_mark_dirty() or something
> like that.
>
> I had a quick look at the PCA953x driver but it all its
> registers are readable according to the comment on the top
> of the file.

Since regmap doesn't have a facility to support the registers _at the
same offset_ with different meaning (depending on data direction), the
only way to handle this (without redesign regmap internals) is to add
specific "pages" via additional bits in the address space. So, let's
say 0 = RW, 1 = RO, 2 = WO. In this case see the following offset
mapping of the hypothetical hardware registers:

REG1 (RW)   0x00 -> 0x000
REG2 (RW)   0x04 -> 0x004
REG3 (RO)   0x08 -> 0x108
REG3 (RW)   0x08 -> 0x208

Then these bits should be masked out. Something similar is done in the
PCA953x driver for extended addresses and autoincrement.

This is what I propose to look at as the starter.

-- 
With Best Regards,
Andy Shevchenko
