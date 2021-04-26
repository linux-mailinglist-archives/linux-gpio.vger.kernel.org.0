Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 013E836B15C
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Apr 2021 12:12:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232249AbhDZKNe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Apr 2021 06:13:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232103AbhDZKNd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Apr 2021 06:13:33 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35B62C061574
        for <linux-gpio@vger.kernel.org>; Mon, 26 Apr 2021 03:12:52 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id o5so30315076ljc.1
        for <linux-gpio@vger.kernel.org>; Mon, 26 Apr 2021 03:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Lyy/Re1s1s+Z5eh8XszEUdKw3Fr6Gtk7rUYUd1Y7PfQ=;
        b=gdTMIBkY9imrbLVBT+IE8sorPViM1hxvtvi8ftS86+77sn6DSqY/3accPsMbakQjgV
         NtbUpdyKK2QOcuOoayuRjSN9Fmq3Xa6IHnTQHSC9cgZOTLK7gLDtHOEG15djictpVQVI
         DKUQ0A+aoXUkt29LMf5m+XiBf+6IL4x5JmlbE+qdXYKys0sfjnvySI5qSH11csYJlCOS
         17PVDAMJBoZhq85hnkgd/65fMS2UA3CkTqFXRngDPTQHmXNmOYzDDAn6MJAyoIWohB0B
         KjHF7yXDsrSJgctnnCsXRsNXHEL0PIxhYz0Oy9RC/izkGpUzQaSshnMHu2NWzL5PMzXT
         dNAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Lyy/Re1s1s+Z5eh8XszEUdKw3Fr6Gtk7rUYUd1Y7PfQ=;
        b=hQjKvo6flgQ3y9y1fDEtIjYNCAao4rsqp/nOBXaMsSihSqoW/POmvv82ht7MIeIaEP
         Z0KOxho44hO8APfu2dkUOvr5ySerWfGBvBPRY0CZgRNpqp+DsqAgvN/PV7sZPkBZvAvj
         aFHcFfa7g/efHarjL1SAXcfuVD/KI5jHoP0KrQVuwC8VJbIjj4yK9Tx2P82syALajRVL
         tJ0M9piGvBZTjTJt1rWPiJZI9o7cQZHPH4SdqVjjLKPX2BZ1CJxgliEX2AvRmlDlGRPl
         GqUM6yfN5vk1c4QmS/1PIptF7zV2nIaAfnhJokVN+FlZSweEGvYLTEAcLjwDEZlTRnbF
         I0Ow==
X-Gm-Message-State: AOAM530hFi1qDgzSi7Du0iRItcmTSDK874PPOq+EChvLm0OU934axZLX
        3qepbT8/u/YpUslvLuFfmVg0u9WcHJbfDPua7vRH/A==
X-Google-Smtp-Source: ABdhPJzf7hN18eR4KHrTjm9E4O0Ljw1WrqVDd3Cdoac1Z9K/qhC68u1BiL6b7sFK9zkTzjZNIHRo1MFlNys+3M3TPQA=
X-Received: by 2002:a2e:9cb:: with SMTP id 194mr12351701ljj.438.1619431970701;
 Mon, 26 Apr 2021 03:12:50 -0700 (PDT)
MIME-Version: 1.0
References: <01afcac0-bd34-3fd0-b991-a8b40d4b4561@enneenne.com>
 <CAMuHMdUtguuu4FWU4nRS=pBUyEwKM1JZ8DYPdCQHXBYN0i_Frg@mail.gmail.com>
 <87efe96c-3679-14d5-4d79-569b6c047b00@enneenne.com> <CAMuHMdUght0hkJT1N8ub5xR5GB+U18MAhAg+zDmAAuxoRSRaYg@mail.gmail.com>
 <d30e64c9-ad7f-7cd5-51a4-3f37d6f1e3d8@enneenne.com> <070fa558-6e20-0fbf-d3e4-0a0eca4fe82c@enneenne.com>
 <CACRpkdYFAW2bcB53M3_b2LsveJO_PWZJhprGhdTtfmW11B1WmQ@mail.gmail.com>
 <f66dc9c4-b164-c934-72a8-d4aca063fca5@enneenne.com> <CACRpkdbjc6vvpHVjnJNGisRw6LiLZd-95aHWJJORwvaRNigPcw@mail.gmail.com>
 <cb6e208b-446e-eba4-b324-d88aec94a69b@enneenne.com> <CACRpkdZBUw5UPyZB-aeVwh8-GiCifbwABZ9mOsyK90t3cdMQ+w@mail.gmail.com>
 <80bf1236-aacd-1044-b0e5-5b5718b7e9f0@enneenne.com> <CAHp75Vc1ezuW9m8OCQUmEJoNVoD-Z3eWF=Lzcr2v32Br8Gr60w@mail.gmail.com>
 <CACRpkdY+amtrDE4gaSU5Du2CUivxo6gnUV5zZOcaJJ8=md-4Kg@mail.gmail.com>
 <87207962-5848-3e5c-4d8d-f4a66c864413@enneenne.com> <CACRpkdYCdhi_Vb_+0cfD02WRzOhvenoFt5tbowe91RMjQBfeug@mail.gmail.com>
 <474f975d-3fb6-8345-cfbf-79ee313c0850@enneenne.com>
In-Reply-To: <474f975d-3fb6-8345-cfbf-79ee313c0850@enneenne.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 26 Apr 2021 12:12:39 +0200
Message-ID: <CACRpkdZn4+jM1K=UyowOkmax5aP35ao2JtGSy96apOd+_fOp3A@mail.gmail.com>
Subject: Re: [RFC v2 GPIO lines [was: GPIO User I/O]
To:     Rodolfo Giometti <giometti@enneenne.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Apr 26, 2021 at 11:44 AM Rodolfo Giometti <giometti@enneenne.com> wrote:
> On 26/04/21 11:31, Linus Walleij wrote:
> > On Mon, Apr 26, 2021 at 10:44 AM Rodolfo Giometti <giometti@enneenne.com> wrote:

> > I would send an RFC of the proposed DT bindings there.
>
> I agree. Please, let me know if you need some help.

I [general tense] would, implied [if I were you].

What I mean is that whoever wants to drive this should send
proposed DT bindings there.

I am not volunteering to drive the project. It needs to be driven
by those who have the need and can verify that it is fulfils the
needs they have.

Yours,
Linus Walleij
