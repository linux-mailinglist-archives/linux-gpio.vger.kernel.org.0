Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14A20342C0A
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Mar 2021 12:21:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229546AbhCTLVA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 20 Mar 2021 07:21:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230228AbhCTLUo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 20 Mar 2021 07:20:44 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E34E1C0613E7
        for <linux-gpio@vger.kernel.org>; Sat, 20 Mar 2021 04:20:43 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id u10so15061769lju.7
        for <linux-gpio@vger.kernel.org>; Sat, 20 Mar 2021 04:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=holiK4bPtRVekn/U8k3E7zXysHloVgOH2k+4QzNeo3U=;
        b=oGsAEqAEvKtVqZCplWGtvKIsFRnwWWTgB2+NcAFcQDbVqYyJykIv/yTPK0YNwCDcQI
         d8hwuqFSKbhAVkCTPfsuYKz4J7FeaH4EOCLBmP7xTLC4FgmmM8bcZe615Bl3z/ed62Kr
         ljPGv4gh7txfEuLLZeURMpv0pOGJXH6KNgSc3yx24npwGCOZYKkoMUIGmvXAPGiwEMp3
         hOCOn5a8WyLxl76f9IgjDno9Q3x2hUc8saqjKnquwcFEGW4EhXUL54/ahCqJF+Kl4KNM
         6nq8pSc5+tC2l3Ix7wZe+bDVEwu0k33DHoyiyD4v3qn/p+w30iiT1Dn2UyGxEw3m5tn6
         TNtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=holiK4bPtRVekn/U8k3E7zXysHloVgOH2k+4QzNeo3U=;
        b=MhFBnmT+aeXMLqFigGs9l25k3y7qmDptsgPtENDbGZr6CZykwLWBAv4Dnx60AMFRTp
         2PLUd3JHTA+fqRQqGeuGN+HnWngV3dr9RZBW+npuqarOzs42v9ltS7lzDeaQOJhMVPMB
         6uDUQi4HbYNFEBUue01MH0oNeTS1yaivoHRc8wGb5ICGogo7eOhOtYUVYoq62jNb2Bty
         XlOYDd8M8crhJBnC6dp1VGGsf8jg4g8JkAXcnDx7ywlI2OHFoCNXBS1qXXHzlmUHL1+P
         2Se4qwmr/e/u4ZkZ4Or8Cg52P9VjibdvK7dlqoLid9qnuZmaY5NnSJHP8jR2EM6pbkIF
         ir5w==
X-Gm-Message-State: AOAM532t0H8rWOwmsExp1fQEp5qddBIc9K99QDCANhhqyLDDLLm8nnL+
        oifxGvx/qp2iQvV4NRQkzcuxnit25wE6zj9sKgj2zDgJBlmEp+JY
X-Google-Smtp-Source: ABdhPJx+BKTK3tz47/UiBJXw1DjJbeW1s04QYJWhdonl6vXJvUd/61kqc3gHHfWSurXqtni21ZYpoTpNSiNCZsdEkIs=
X-Received: by 2002:a2e:9004:: with SMTP id h4mr3603790ljg.326.1616239242456;
 Sat, 20 Mar 2021 04:20:42 -0700 (PDT)
MIME-Version: 1.0
References: <946021874.11132.1615900079722@seven.thorsis.com>
 <CAHp75Vf05NN0dXUrMSOXBRuYRnQRHO_92itZ3ndOyX1oERWt=g@mail.gmail.com>
 <CAHp75VczovYQB70HVEmDA=xfTBcNuSm2f8x9Mnbj0P0Z4UHRMQ@mail.gmail.com>
 <854891727.11376.1616061014891@seven.thorsis.com> <CAHp75Vftrq66SweYKYprWBoi9X8csxe9ROaMorRFUjGSD8gNSQ@mail.gmail.com>
 <1236506597.11463.1616075798037@seven.thorsis.com> <CAHp75Vd-+rSgG08TV0P3ocCQjUdPkNypxGncJmT5K62SEuwXog@mail.gmail.com>
In-Reply-To: <CAHp75Vd-+rSgG08TV0P3ocCQjUdPkNypxGncJmT5K62SEuwXog@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 20 Mar 2021 12:20:31 +0100
Message-ID: <CACRpkdaHA2a2hOCHNNnbLgNV2QeB-UZFKgEw111Fmg-Lh_=bOQ@mail.gmail.com>
Subject: Re: setting gpio-line-names in dts for sama5d2 SoC
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Alexander Dahl <ada@thorsis.com>, Rob Herring <robh+dt@kernel.org>,
        Kent Gibson <warthog618@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 18, 2021 at 4:00 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Thu, Mar 18, 2021 at 3:56 PM Alexander Dahl <ada@thorsis.com> wrote:

> > In other words: if I design a new board, there's no interface I would break, at least not from the userspace point of view just looking at the line names, or is there?
>
> I understand that  names are platform specific and I'm on your side as
> an IoT specialist, but on the Linux side we may not blindly do changes
> like this due to ABI concerns. You see the problem here: you can't fix
> all (legacy) DTSs in the world which do not have GPIO line names
> listed, and for those users we effectively break their tools and
> scripts which relies on the hard coded naming scheme.
>
> So, we may change if and only if the names of the lines are not an ABI!
>
> What we can do as a workaround is to reverse the partsing order, and
> if somebody complains, it will be their DTS issues, whoever not the
> best solution either.

The line names are not really supposed to be used as ABI since
they are not necessarily unique. This problem was pointed out
by Johan a few times. The real ABI is the HW line number (local
offset) when used with the GPIO character device.

This is logical since the gpio-line-names attribute is optional.

It must be possible to get a handle to a GPIO line without a
name. And using the offset number should be the preferred
way for userspace: use a number on a gpiochipN with the
character device.

(The topology of the gpiochip per se can be determined from sysfs.)

However this has not stopped userspace from using it as ABI,
and these names are used by the GPIO aggregator.

It's hard to do it right without resetting history and requireing that
all names in the device tree be unique as well, at the root of the
problem, but when introduced, these names were there for
the file /sys/kernel/debug/gpio, not for exposing to userspace.

However the character device does give the name away, as
a piece of information, it is not supposed to be used to look
up lines but merely as information, but well people use it
for looking up lines by name anyway so what can we do.

I don't think it's a big deal to change these names.

Yours,
Linus Walleij
