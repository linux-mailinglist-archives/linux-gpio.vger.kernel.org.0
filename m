Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F15C207618
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jun 2020 16:52:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391116AbgFXOwd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Jun 2020 10:52:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390843AbgFXOwb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Jun 2020 10:52:31 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B96FBC061573;
        Wed, 24 Jun 2020 07:52:31 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id x8so250729plm.10;
        Wed, 24 Jun 2020 07:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2F6v8JQ44zNL7WDKYUMFQlmy+yKvwRWWXRmkHnYvxmA=;
        b=gRUizZgUZKJgrY28tFVUUKrshLf1ohUdM2a/kBaeYieCFRiCLgbbjU1ge2bruKIutR
         V6Vq/gbn23RrhxS8uz0RdLNdxKXJgKxUb/P2jzTyzkPeEiZEqtive/TQmvdY7db82F2z
         nkyztsrdb/4ABnUdqEbzt4uD6KAHLG12Atc+VlkG9JQNk8j+4+QUCnisiEyCLq3v77Vr
         MU+57Ipex43nlk65fQFgmUj4Y9jiN7M9/VlO8KgcrB0not2N7yk4NdfhV5hZNzqIVu8N
         Zujc1IZGoRexNUX7mD7+mDwoqfzlfgAu+dBu6KjE5CuxPDIP9mX3WT6ybTXsqe/q7U/A
         BE6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2F6v8JQ44zNL7WDKYUMFQlmy+yKvwRWWXRmkHnYvxmA=;
        b=LTNDBslrdxPYAb/R/vA6RFE8bkLZaX2DZ/bY+NlNb2+Tf2ERWmZ78TzeR87JqdEKd7
         pUgSEIMMVeC2Bl90fQqIfWphgYDIYaO+aVsyoWnvKBmza17OaYKQngaD0fZFeUKImFbu
         qj1/StkfU9X8GgRSH4fVusuUB8OCzo/Hq/3fhkBC78+8Ev2rzVAIjWVpvnOq/lhf/Uk4
         i5CuNC+tPb/fBxn4DRNDbOlEOQ32CPL6J76nL2iCj2q0Wwh/EU+Zjwtvt6bM66gFrytx
         Log2+fjA2ieZxZpDVUe5HQCnS2JR90b2LKe/SNiWLLRFWr9DK1UcYMUYen7SQtEfpojX
         xiXA==
X-Gm-Message-State: AOAM532gDvML1rv20wgJuL+pHLO0DQ/Zig5yfPhxjFHjnLSdStM3NTVG
        sQDHImp6xQpQgCC0MCh7c3Pze11Z2ZwjZyQj234=
X-Google-Smtp-Source: ABdhPJxQZvDtc8fb5eM/H4YrRoZb6YlPQLvmpsPekPIdTz2fOpy0OiUqkuAzib92figajBbrmwyLUdH6I08AfVHRyag=
X-Received: by 2002:a17:90a:b30d:: with SMTP id d13mr28499822pjr.181.1593010351239;
 Wed, 24 Jun 2020 07:52:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200623060526.29922-1-mans0n@gorani.run> <80bbca9a625b2a0feb9b816906549b7c@walle.cc>
 <2291c01d-30df-518e-a952-644bd955f1f3@gorani.run> <69f5d1a1970838b8c4bd8d6e8dba6cac@walle.cc>
 <CAHp75Vfc2udv2mLLJCFO6P+n8_kcO7OZKhH_XkOy7Cf4fnxgtA@mail.gmail.com> <9956439a3c887dde7b2b8fa48de20db2@walle.cc>
In-Reply-To: <9956439a3c887dde7b2b8fa48de20db2@walle.cc>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 24 Jun 2020 17:52:18 +0300
Message-ID: <CAHp75VciJmV1wTB0AWvbjyOZzzk1A1KC70+dtr0jNziAvQ2tHw@mail.gmail.com>
Subject: Re: [PATCH] gpio: add GPO driver for PCA9570
To:     Michael Walle <michael@walle.cc>
Cc:     Sungbo Eo <mans0n@gorani.run>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 24, 2020 at 4:46 PM Michael Walle <michael@walle.cc> wrote:
> Am 2020-06-24 15:33, schrieb Andy Shevchenko:
> > On Tue, Jun 23, 2020 at 3:48 PM Michael Walle <michael@walle.cc> wrote:
> >> Am 2020-06-23 14:22, schrieb Sungbo Eo:
> >> > On 2020-06-23 17:31, Michael Walle wrote:
> >> >> Am 2020-06-23 08:05, schrieb Sungbo Eo:

...

> >> That won't work because the underlying regmap expects the address bits
> >> to be either 8 or 16. In this case I'd guess gpio-regmap, doesn't make
> >> sense, because there is actually no real gain.
> >
> > From the DS:
> > "The device acknowledges and the master sends the data byte for P7 to
> > P0 and is acknowledged by the device. Writes to P7 to P4 are ignored
> > in the PCA9570 as only P3 through P0 are available. The 4-bit data is
> > presented on the port lines after it has been acknowledged by the
> > device. The number of data bytes that can be sent successively is not
> > limited. The previous data is overwritten every time a data byte has
> > been sent."
> >
> > So, basically writing to the register the value of register can
> > simulate register map, but the question is do we gain anything from
> > that abstraction because it means that all 256 (or 16 for 4-bit
> > variant) registers are possible?
>
> Mh? I can't follow you. Port means a physical I/O port, if I
> read the datasheet correctly. And because that is a 4 port IO
> expander only the lower four bits are used. I'd guess if it is
> a 8 port IO expander all bits would be used. (Actually, its
> output only.)
>
> So you just write one byte of data (or you might repeat it, but
> that is just as if you start a new i2c transaction, just that
> you save the i2c addressing).

You can write the same value twice.
It means that the first byte can represent the register address. But
it's still too volatile.
Perhaps regmap can gain something like register-less communication.

-- 
With Best Regards,
Andy Shevchenko
