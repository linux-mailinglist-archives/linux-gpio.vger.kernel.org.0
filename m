Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37C2841DEF8
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Sep 2021 18:26:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245512AbhI3Q21 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Sep 2021 12:28:27 -0400
Received: from mail-ua1-f49.google.com ([209.85.222.49]:45612 "EHLO
        mail-ua1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350828AbhI3Q21 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Sep 2021 12:28:27 -0400
Received: by mail-ua1-f49.google.com with SMTP id 64so4644356uab.12;
        Thu, 30 Sep 2021 09:26:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JiF0/ZgjKWbd99LN0jFcf3oajDZ2ssdc3I0XUDxzEhU=;
        b=5wBSQiAfAi8nlZ4+HZXYjDS5ca3XisOSNQqyjHlmPl+WuD98ULpkHVSHEYsjk8GR3P
         YNChRoTCT24rMQ+CclzV6joyfX3o8eqpvbufXmsrqcjxNxvQCVQdiNbv9d/SXaR25iwv
         7V6Q0ajfSSwKzCsPE78376f4BLYJHtRXD91UiP/4HTr9si0uQk8yEXGmxzNZO9YnivXV
         uP8u8DnNeBb3LygoeJ6MZyyQzYY0wLF2+jOaMMQgdj5ZFL0lH08gv7mSCLjuEAQwUbY7
         wzY+aYxYgBmmlbvwdXhxU68hzyY5YjJKoM66vO73XWxIdcyY3A3R8m1sT4Bk9qISbq2O
         1Rkg==
X-Gm-Message-State: AOAM533ubi3RHAzaGp0c7dclA6w6IqGQP+OQygq9rhg/6n/bhkzn7bj5
        lnDV8FvYlu9MwLAtQHZiZW+IAlOsiftgJD/xMiM=
X-Google-Smtp-Source: ABdhPJxXKENqdoBP7B9ZGTIy/mSCP2ayP3D8cOsCZjbfOGW3dAAimFFBEtD7kMLVg//tPmAC5MEnBkgUBT1EBe51f7Y=
X-Received: by 2002:ab0:58c1:: with SMTP id r1mr6402945uac.89.1633019203566;
 Thu, 30 Sep 2021 09:26:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210928235635.1348330-1-willmcvicker@google.com>
 <7766faf8-2dd1-6525-3b9a-8ba790c29cff@canonical.com> <CABYd82YodFDwBxexCv+0hpYrdYEX1Z1CvnRkmnBPkEJNJ4bssQ@mail.gmail.com>
 <c65bf0db-6fd1-eb05-f407-37c41f9125f4@canonical.com> <YVWCK5QO331rfhJJ@google.com>
 <72d27a82-9d4d-1f91-bd1f-ebead3b75ffa@canonical.com> <YVWwBz8jrznqXah4@google.com>
 <8d260548-176e-d76b-6f05-d4d02ddd4f67@canonical.com> <YVW7xoHaLdGHBoEQ@google.com>
 <CAMuHMdU_dbQYHF=8uOZ3e_v4+Li0bHfQABdLVSpJJPG4XkwhZw@mail.gmail.com> <YVXkGiwAV3kGiBd3@google.com>
In-Reply-To: <YVXkGiwAV3kGiBd3@google.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 30 Sep 2021 18:26:31 +0200
Message-ID: <CAMuHMdXTp_cv4Ry0XBzCkv+-Gh3RY-HPZ8uDiNkxqK227+cozw@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] arm64: Kconfig: Update ARCH_EXYNOS select configs
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Will McVicker <willmcvicker@google.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        John Stultz <john.stultz@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Saravana Kannan <saravanak@google.com>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-rtc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Lee,

On Thu, Sep 30, 2021 at 6:21 PM Lee Jones <lee.jones@linaro.org> wrote:
> On Thu, 30 Sep 2021, Geert Uytterhoeven wrote:
> > On Thu, Sep 30, 2021 at 3:29 PM Lee Jones <lee.jones@linaro.org> wrote:
> > > On Thu, 30 Sep 2021, Krzysztof Kozlowski wrote:
> > > > On 30/09/2021 14:39, Lee Jones wrote:
> > > > > On Thu, 30 Sep 2021, Krzysztof Kozlowski wrote:
> > > > >> On 30/09/2021 11:23, Lee Jones wrote:
> > > > >>> [0] Full disclosure: part of my role at Linaro is to keep the Android
> > > > >>> kernel running as close to Mainline as possible and encourage/push the
> > > > >>> upstream-first mantra, hence my involvement with this and other sets.
> > > > >>> I assure you all intentions are good and honourable.  If you haven't
> > > > >>> already seen it, please see Todd's most recent update on the goals and
> > > > >>> status of GKI:
> > > > >>>
> > > > >>>   Article: https://tinyurl.com/saaen3sp
> > > > >>>   Video:   https://youtu.be/O_lCFGinFPM
> > > > >>>
> > > > >>
> > > > >> Side topic, why this patchset is in your scope or Will's/Google's scope?
> > > > >> Just drop it from Android main kernel, it will not be your problem. I
> > > > >> mean, really, you don't need this patchset in your tree at all. The only
> > > > >> platform which needs it, the only platform which will loose something
> > > > >> will be one specific vendor. Therefore this will be an incentive for
> > > > >> them to join both discussions and upstream development. :)
> > > > >
> > > > > How would they fix this besides upstreaming support for unreleased
> > > > > work-in-progress H/W?
> > > > >
> > > > > Haven't I explained this several times already? :)
> > > >
> > > > Either that way or the same as Will's doing but that's not my question.
> > > > I understand you flush the queue of your GKI patches to be closer to
> > > > upstream. Reduce the backlog/burden. you can achieve your goal by simply
> > > > dropping such patch and making it not your problem. :)
> > >
> > > git reset --hard mainline/master   # job done - tea break  :)
> > >
> > > Seriously though, we wish to encourage the use of GKI so all vendors
> > > can enjoy the benefits of more easily updateable/secure code-bases.
> > >
> > > I can't see how pushing back on seamlessly benign changes would
> > > benefit them or anyone else.
> >
> > I like your wording ;-)
> >
> > Indeed, seamlessly benign changes, which are (1) not tested, and (2)
> > some believed by the platform maintainer to break the platform.
> > What can possibly go wrong? ;-)
>
> William has already shown a willingness to test the series.

I'm looking forward to the results!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
