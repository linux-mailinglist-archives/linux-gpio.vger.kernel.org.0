Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F59941D84A
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Sep 2021 13:01:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350275AbhI3LD1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Sep 2021 07:03:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350262AbhI3LD0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Sep 2021 07:03:26 -0400
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80D6EC06176A;
        Thu, 30 Sep 2021 04:01:44 -0700 (PDT)
Received: by mail-il1-x130.google.com with SMTP id h20so6309886ilj.13;
        Thu, 30 Sep 2021 04:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=sI1mIG42y3NEuIaeyCkeJUiQ2a25iQMmIeBT19wOWsg=;
        b=ib51AfAqKfbbJA4QpJkaIteofQSgCDOZnD/g5j7+mriwhrwp/QYE7TvAqg4eg42aQA
         T6EPqGn5KaiNfpFaXbErMsPTQp68C7ow/ZnJeC/dvRxDSaOUKkdDyRwiQ4XIm+T6qdgj
         CtoEtTHPnTiiVjiHj8egzHaOxUfEpTT4+hZpyf+AuX3Vseh++/3hFCxLyLtENavfhN9X
         68SowWtjYWi0rtXW9rzabJk1Ozj3vrH3shjsOiD5SsxNIgZFMgjnrFEUmV1GFeYOZwxb
         iLdknJloQarqcJsHti8OgFnj+PbqSHCwgUxkG7kvPZfaUHQ58tVAbJxzVKX8U/4kbcG0
         lgMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=sI1mIG42y3NEuIaeyCkeJUiQ2a25iQMmIeBT19wOWsg=;
        b=QJpzokY9RhHBry9vHUbf426pmnFUjk+yMIwqp1Dqs3jQd7zsUMic5Ibhyn3apWtrG6
         jExzerSQ6kX1QOCujwNxMHhNkZSmZmoH6WLdoOy2diCrBCuGB3OI/0kX782G5lXrqRJK
         8Fp6eo0Bi8wc8zsZMTMmTcjO5X0+Dd0TzTcEt3TYhE6nx6vF7SK/17YRkfXZM111V2Vx
         43ulZLreFxuacPeRQV+hWZGqJwQZw2pcKh5+FFyPt5V4mluNOyhjHxFXeVVEFZyWDMlY
         TrUIFJmY/GBEGOb7+JXjpHNNkY6ob7JxHSkynS/qCcTVc5YsnFSHB47yuRu6REkD6sjZ
         S/MA==
X-Gm-Message-State: AOAM530l3vVwi69rxbLglVRX6EJSJltZj9iI/dDoq0UcQLUBU1QE5KQb
        w/ljdISrQzu7Mmolgo1jYYeoWMSTlHo2gYLHJdM=
X-Google-Smtp-Source: ABdhPJx8SB0hw0YFekIWEw0c9alVbTYaJVFxN/13kenxvRFCv+EjuctA31TmOZgr9g9sCT6WhP5upHhwgpdq+i8QI4c=
X-Received: by 2002:a05:6e02:b4d:: with SMTP id f13mr3585904ilu.183.1632999703831;
 Thu, 30 Sep 2021 04:01:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210928235635.1348330-1-willmcvicker@google.com>
 <7766faf8-2dd1-6525-3b9a-8ba790c29cff@canonical.com> <CABYd82YodFDwBxexCv+0hpYrdYEX1Z1CvnRkmnBPkEJNJ4bssQ@mail.gmail.com>
 <c65bf0db-6fd1-eb05-f407-37c41f9125f4@canonical.com> <YVWCK5QO331rfhJJ@google.com>
In-Reply-To: <YVWCK5QO331rfhJJ@google.com>
From:   Tomasz Figa <tomasz.figa@gmail.com>
Date:   Thu, 30 Sep 2021 20:01:32 +0900
Message-ID: <CA+Ln22EbXKsRFZ=3L4A_jqciRxG2hnAh9iKTfQ_Ypr2NJgDzQQ@mail.gmail.com>
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
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        John Stultz <john.stultz@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
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
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

2021=E5=B9=B49=E6=9C=8830=E6=97=A5(=E6=9C=A8) 18:23 Lee Jones <lee.jones@li=
naro.org>:
>
> I've taken the liberty of cherry-picking some of the points you have
> reiteratted a few times.  Hopefully I can help to address them
> adequently.
>
> On Thu, 30 Sep 2021, Krzysztof Kozlowski wrote:
> > Reminder: these are essential drivers and all Exynos platforms must hav=
e
> > them as built-in (at least till someone really tests this on multiple
> > setups).
>
> > Therefore I don't agree with calling it a "problem" that we select
> > *necessary* drivers for supported platforms. It's by design - supported
> > platforms should receive them without ability to remove.
>
> > The selected drivers are essential for supported platforms.
>
> SoC specific drivers are only essential/necessary/required in
> images designed to execute solely on a platform that requires them.
> For a kernel image which is designed to be generic i.e. one that has
> the ability to boot on vast array of platforms, the drivers simply
> have to be *available*.
>
> Forcing all H/W drivers that are only *potentially* utilised on *some*
> platforms as core binary built-ins doesn't make any technical sense.
> The two most important issues this causes are image size and a lack of
> configurability/flexibility relating to real-world application i.e.
> the one issue we already agreed upon; H/W or features that are too
> new (pre-release).
>
> Bloating a generic kernel with potentially hundreds of unnecessary
> drivers that will never be executed in the vast majority of instances
> doesn't achieve anything.  If we have a kernel image that has the
> ability to boot on 10's of architectures which have 10's of platforms
> each, that's a whole host of unused/wasted executable space.
>
> In order for vendors to work more closely with upstream, they need the
> ability to over-ride a *few* drivers to supplement them with some
> functionality which they believe provides them with a competitive edge
> (I think you called this "value-add" before) prior to the release of a
> device.  This is a requirement that cannot be worked around.

[Chiming in as a clock driver sub-maintainer and someone who spent a
non-insignificant part of his life on SoC driver bring-up - not as a
Google employee.]

I'd argue that the proper way for them to achieve it would be to
extend the upstream frameworks and/or existing drivers with
appropriate APIs to allow their downstream modules to plug into what's
already available upstream.

Best regards,
Tomasz
