Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7856E641FCE
	for <lists+linux-gpio@lfdr.de>; Sun,  4 Dec 2022 22:24:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230221AbiLDVYW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 4 Dec 2022 16:24:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230177AbiLDVYV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 4 Dec 2022 16:24:21 -0500
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E396912D3F
        for <linux-gpio@vger.kernel.org>; Sun,  4 Dec 2022 13:24:19 -0800 (PST)
Received: by mail-qv1-xf2c.google.com with SMTP id c14so7108946qvq.0
        for <linux-gpio@vger.kernel.org>; Sun, 04 Dec 2022 13:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HolxdYhsC6PPIuSCF4IWrRxJ55WK09MiKQKgTRRQ1u4=;
        b=LgrZIBNgjv+lshYOLGa+M54L/9z3KlJ+3Wa0Eftxr5t5Rh+W3izppj/A+bJmEPNgwj
         OC0C13AtDgJryL6ona35BuMC4+ZK/vgtrqYxVOuwTAMzgdVFBLuDFi8Xe2Oqo6y9pLdH
         WLfa94Ocazgs1GdbZ1XsvCsX0WJ2xvKuWczHg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HolxdYhsC6PPIuSCF4IWrRxJ55WK09MiKQKgTRRQ1u4=;
        b=tZTZc22LrHEW6eJna0K7U+NkRDI15ANMvGxc9r4sxtICW1p0PVQVRiabLfbNGVhQ5h
         o/DvqS2psWLY280e+4/gBWB+yc2hoeuFk4caFwtoG5C6AhuHdq9tGbyUDHKRy9A4fcy1
         FaIL6R1VoWF51KTit1/zoBmXg6VV454hI/VyAHtCI5W0WnwMTWwBsmpr/ZGDl+2vgJP8
         2QEZjtX9CAsS92UFyUjINCF8KDcnxoUfIBBuhZxBRQb8CEY9zR32+/tQm/4xRGQk7aUd
         kWstBANhEyTjY1MNiS/FrQIfvyQ03ZBjPgrgEJwUZgoMuIKDYyPxZocL/1gr1SAj1iDZ
         f76w==
X-Gm-Message-State: ANoB5pnN1Ch0SWq8cRXG1h2USLaoTxfytuf4UClGGmWPbKt0ki8VFoGG
        NNWgo2I5K+kOo6BO/02rGBC3tlu/9c/wVLYF
X-Google-Smtp-Source: AA0mqf5lOoCxEW6W7ydwtfwHMUTsxzfNCJaRPZYEeaEFioHa/y9Gdei8O9jDguy/0vprKdWTBUzf8A==
X-Received: by 2002:a0c:f841:0:b0:4c7:4939:7f31 with SMTP id g1-20020a0cf841000000b004c749397f31mr9607056qvo.83.1670189058535;
        Sun, 04 Dec 2022 13:24:18 -0800 (PST)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com. [209.85.222.174])
        by smtp.gmail.com with ESMTPSA id bj18-20020a05620a191200b006ce0733caebsm11079685qkb.14.2022.12.04.13.24.16
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Dec 2022 13:24:16 -0800 (PST)
Received: by mail-qk1-f174.google.com with SMTP id j13so2145613qka.3
        for <linux-gpio@vger.kernel.org>; Sun, 04 Dec 2022 13:24:16 -0800 (PST)
X-Received: by 2002:ae9:e00c:0:b0:6f8:1e47:8422 with SMTP id
 m12-20020ae9e00c000000b006f81e478422mr71801248qkk.72.1670189055913; Sun, 04
 Dec 2022 13:24:15 -0800 (PST)
MIME-Version: 1.0
References: <20221203150539.11483-1-brgl@bgdev.pl> <CAHk-=wjD8+XZyO4H1STwXte6x1UcYsiHKaQ4OQF5ucssY=uT8g@mail.gmail.com>
 <CAMRc=Me--X58j+tLn50osPRXSsJeqms8m=aYDcwMwktfZvFQow@mail.gmail.com>
In-Reply-To: <CAMRc=Me--X58j+tLn50osPRXSsJeqms8m=aYDcwMwktfZvFQow@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 4 Dec 2022 13:24:00 -0800
X-Gmail-Original-Message-ID: <CAHk-=wi+7kAEK9f+t=z5B39bASzswNCVE+ZJKnDPjAHM_FoRNg@mail.gmail.com>
Message-ID: <CAHk-=wi+7kAEK9f+t=z5B39bASzswNCVE+ZJKnDPjAHM_FoRNg@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: fixes for v6.1-rc8 - take 2
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Dec 4, 2022 at 12:47 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> No, the data can't be removed with these locks in place. It's just to
> avoid going into the callbacks if gpiochip_remove() is already in
> progress (the only reason why trylock would fail).

That "the only reason why trylock would fail" may be true in practice,
but it's really just an implementation detail.

Other issues *could* make a trylock fail.

For example, assuming the trylock is just implemented as a non-looping
"cmpxchg" (which may or may not be the case), even another reader
coming in and racing with a trylock could make the cmpxchg fail.

That "do one single cmpxchg" is what the spinlock trylock code does,
for example.

Now, that's not actually what we do for the down_read_trylock() case -
we will actually loop over it - but locking is complicated and you
absolutely should not make assumptions about the exact implementation
details.

And even with the loop, if you ever have *any* other reason to get the
write-lock (or even just do a "try_write", suddenly the details of
when the trylock fails changes entirely.

So that's why I really don't want some random driver layer to depend
on some semantics for trylock that aren't actually guaranteed in the
bigger picture.

The only thing "trylock" says is "I tried to get the lock". It really
could easily fail for random reasons that aren't about actual writers.

For example, even aside from any "do a single cmpxchg" issue: a
sleeping lock could be implemented using a spinlock to protect the
"real" locking data. That kind of implementation is particularly
likely for debugging.

And then, in order to be usable in a recursive environment, a
"trylock" would quite likely be implemented without spinning on that
spinlock, even before it gets to the actual lock internal
implementation. So just contention on the spinlock - by other readers,
not writers - could make the trylock fail.

See?

             Linus
