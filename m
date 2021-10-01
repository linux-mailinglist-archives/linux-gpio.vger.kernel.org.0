Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23DDA41EC62
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Oct 2021 13:38:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354085AbhJALkK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Oct 2021 07:40:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354007AbhJALkJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Oct 2021 07:40:09 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42486C06177C
        for <linux-gpio@vger.kernel.org>; Fri,  1 Oct 2021 04:38:25 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id i25so37564962lfg.6
        for <linux-gpio@vger.kernel.org>; Fri, 01 Oct 2021 04:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PgQJwBmVLBdUeAFbcJpLOUvKI5KGsOalaorIVrJziYU=;
        b=ulGdV921YPSj31Yv4v5aF/syTvWDzr0emxFqFfTXLGaac8eOgGmUwTS2oQqs9+4MaT
         ycJJ4EGMFd1wiR/zE0HlRhLZMtUDrYcG8Cr0hZxQmBlm3f6VfnGmWUYOyEGuccqje6Kd
         f4GITEqFG47ZwzLDHw9uq53A5+pAdnhsw17ahJv5ZuVf4U9IJ2d3AwJBGWDMAfF5AhZm
         MrXvj+pMDYf7U5gRFhMMsvAqNMb/OCUK9FxDr6neZzgERJ4g+QgUNRGh/nG+POoPyV28
         vf9j6BK1UWjNCQXLmoyAqCerQFmcdJzzsxVO48fBV8Tiiwq75Yk8tA868/lhicBoEji6
         WTSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PgQJwBmVLBdUeAFbcJpLOUvKI5KGsOalaorIVrJziYU=;
        b=nDOuejhaIeFHijN5WKVzYogAhYJaIDZtr+3A20dYpMw/XuboZHgVZWMEW1nAqRYUs+
         JRJOIDgtrQdlimfja0689OJXJZWHjN0Ud7E1N5usaDhEb7q/Qp5+zl5r/BkPgEQPgffX
         I5iusmKPBJzQakHS8cp8pbqLRs68BLTB/5uSmxPOGWfOAWBzipv7u8cp0ryMuox5Yds6
         F9OutV5rJeh3YqFPzBT6XZmjJ41AeQ+BkGC4di0cVaeiK3RTXvKQzGMpESbL+RZz8EVE
         +suiGfDYKhoyCmcVd6FzReeP+y/Ro5XiEPTpjh1wqHhR4nBr04FyknBz09W3tp3UJNmQ
         SENg==
X-Gm-Message-State: AOAM532dIKxb2ZkW2sCG7TxQXVgfvraPhww2lhvCg7/iAB+XlmaxoWib
        fFNFRPt+KqDil50DRs3ygN6lGZQ78YVdlx2ZbGcy0w==
X-Google-Smtp-Source: ABdhPJxco3cL637mdMjAYhbk4AYPbPN/02smOY4EnT08ERaI7xmLVT0QYUwcEKNdpq2dlrNPhyl+AzDtpyyabfLalGs=
X-Received: by 2002:a2e:8011:: with SMTP id j17mr10931191ljg.145.1633088303563;
 Fri, 01 Oct 2021 04:38:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210928235635.1348330-1-willmcvicker@google.com>
 <7766faf8-2dd1-6525-3b9a-8ba790c29cff@canonical.com> <CABYd82YodFDwBxexCv+0hpYrdYEX1Z1CvnRkmnBPkEJNJ4bssQ@mail.gmail.com>
 <CAOesGMgSt_mYvRzF0rC=fnjMYGO9EX0_Ow2cD1d8XKLD5pHsZA@mail.gmail.com>
 <CAGETcx-b0ea-rqH+fj37sq9SLWY=+ePK94Y6rnLPuNbqFVBWmw@mail.gmail.com> <CAOesGMhQ3YsLJeQ7aUfb=0oNa3uPCx42wO1U7-ArqJTAUq1G3Q@mail.gmail.com>
In-Reply-To: <CAOesGMhQ3YsLJeQ7aUfb=0oNa3uPCx42wO1U7-ArqJTAUq1G3Q@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 1 Oct 2021 13:38:11 +0200
Message-ID: <CACRpkdajAwysiTOGuFcEySJjePp774J+4Z_YHXaoquTXk6cA+g@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] arm64: Kconfig: Update ARCH_EXYNOS select configs
To:     Olof Johansson <olof@lixom.net>
Cc:     Saravana Kannan <saravanak@google.com>,
        Will McVicker <willmcvicker@google.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        John Stultz <john.stultz@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Lee Jones <lee.jones@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-rtc <linux-rtc@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 1, 2021 at 7:36 AM Olof Johansson <olof@lixom.net> wrote:

> A much more valuable approach would be to work towards being able to
> free up memory by un-probed drivers at the end of boot. That would
> possibly benefit all platforms on all architectures.

This would be really neat.

Also the ages-old problem of discarding unreferenced strings which
apparently still isn't possible would be great to have solved. E.g.
to couple strings to the file/module it belongs with and discard them
if the code is not probed.

Yours,
Linus Walleij
