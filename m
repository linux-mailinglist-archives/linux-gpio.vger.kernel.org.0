Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E04541ECCC
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Oct 2021 14:01:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354221AbhJAMCv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Oct 2021 08:02:51 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:46239 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231321AbhJAMCu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Oct 2021 08:02:50 -0400
Received: from mail-wr1-f50.google.com ([209.85.221.50]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N6c0W-1msZ7H0NNG-0180nj; Fri, 01 Oct 2021 14:01:05 +0200
Received: by mail-wr1-f50.google.com with SMTP id v25so4479815wra.2;
        Fri, 01 Oct 2021 05:01:04 -0700 (PDT)
X-Gm-Message-State: AOAM533ioC2e3WWC+NmDbLYA5DUzZjwMKgsxKwfRAGzzx0iCCpsfAaB8
        IrM+0oWGWECP8XyL72ngiVXnPDedjeofOp1WiWs=
X-Google-Smtp-Source: ABdhPJxF7qwzgMOFRomdZPfIPBjV2u63kV0wQz6BuSjHgJ/rhb/kjnzII6TF6JxnJJ0KLkUW4F1MOePcz4q52bkqPzc=
X-Received: by 2002:adf:a505:: with SMTP id i5mr638099wrb.428.1633089664533;
 Fri, 01 Oct 2021 05:01:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210928235635.1348330-1-willmcvicker@google.com>
 <7766faf8-2dd1-6525-3b9a-8ba790c29cff@canonical.com> <CABYd82YodFDwBxexCv+0hpYrdYEX1Z1CvnRkmnBPkEJNJ4bssQ@mail.gmail.com>
 <CAOesGMgSt_mYvRzF0rC=fnjMYGO9EX0_Ow2cD1d8XKLD5pHsZA@mail.gmail.com>
 <CAGETcx-b0ea-rqH+fj37sq9SLWY=+ePK94Y6rnLPuNbqFVBWmw@mail.gmail.com>
 <CAOesGMhQ3YsLJeQ7aUfb=0oNa3uPCx42wO1U7-ArqJTAUq1G3Q@mail.gmail.com> <CAGETcx_k2-mo9oUcYhsXhhsazLdwbifjP7ZT8pvyEbWB5k_qQg@mail.gmail.com>
In-Reply-To: <CAGETcx_k2-mo9oUcYhsXhhsazLdwbifjP7ZT8pvyEbWB5k_qQg@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 1 Oct 2021 14:00:47 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1HtDoEDeqs42s1hDzCZMwU7MhudJ7TVONn6TjoijaWRw@mail.gmail.com>
Message-ID: <CAK8P3a1HtDoEDeqs42s1hDzCZMwU7MhudJ7TVONn6TjoijaWRw@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] arm64: Kconfig: Update ARCH_EXYNOS select configs
To:     Saravana Kannan <saravanak@google.com>
Cc:     Olof Johansson <olof@lixom.net>,
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
        Linus Walleij <linus.walleij@linaro.org>,
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
        linux-rtc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:foxnByHIMO41LZr2Z9LmJI+Xn9wMZxV+n7u/copOM8vplzqsmPq
 jR0qYunbX8ndaxF6fiJEnYKZ9QTe5YOqMK0OUEoCvLlMygoU7UBRCW3ZFeJV69c0fQhGMyU
 KdyNuOQRzyq+2oUnJVvEtvJRkHCMggf+sChlcywy2b/+o7SuV/BTtxlZK6sB41ilXcbhMoe
 Dmr6Rw9ls3MUfGuGRRjoA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+EeM5I3yKm4=:BAfcGYStGatexgBFCaTvFU
 oiQpdFuvN4v0TRZjsV+YhZZotQduvRA0vDXaUAQTJcs9OlonWzFb0S0LVMGiKh1dXOywRnEtx
 DuwokwP5UM3PhQ5uoTIgx3ipQhpEthQ7Eit7Oz4/VO25jmDYxzVXdA3X5XWABXmU+m+soE1De
 Co1EBCoSavOaKaCKdLvHLnfitOsNwM/nPU/y8O98i4+gECri0B4LXN7dowu0U+vpYiVgU8hB4
 enUhTY1su97SP6ItKlUAPAHgG/piBQA4dzmdX5aJz4vj4Wr15LLZ4JTriyXGPfA6Sf3nTn6CJ
 GTVt3ML9VUI6wBswEC8wT0KhjhO81hlNi8vdt/fQuIeRWoeSumTCdTc/6GCeBZSybDCVigFqw
 miUo4/6mdWnh5B4lRApFzNXAqdl8otP7n1kI+4uECuWym/Mr8qiM6ecM3b175YMw4m/GHN7dW
 LKJ9HSlGnnjGSAlRpX+iSP1UAnJJ8EwpjYhQh1xp418H10ujJUUG3CFFF+4pycXvVUKEEw6x9
 oaMmLdWOhAYygO11OrqqkDZy1WR2nHaTQmAqOPRcOQQyQPVtUmTmDh3m3hVy8lfb2PndJvEgQ
 ul5kxDkaYPQHRTuz+cj52ZuR2uece/3paDTMAwnmMa83ePMDs4uAPZhwA2kSNMshq+ZU2c+vX
 8wQGTi2UHweGAQ1dllSA07lqMGiy80hAfswcbqoBMSIUoQS1Dh2/tQ3Gsrh/d8ft6MQZ7QtSv
 5cfuBFRnEXHeZRtQQr3feYQT7emRtFUmk053Vd6Y6giirKVOlnRVHOylSdean2esrUCYenSpK
 XqnNaRPLkdgUUTbOsqZLxViDsV9CzgCZmSqddDiIv70VI+bzMU7Nr0zHIjPuTB5oa/oso1yNZ
 K5kMYC3dRwa3WdnnViSg==
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 1, 2021 at 8:02 AM Saravana Kannan <saravanak@google.com> wrote:

> > A much more valuable approach would be to work towards being able to
> > free up memory by un-probed drivers at the end of boot. That would
> > possibly benefit all platforms on all architectures.
>
> Sure it would help memory after boot, but it won't help with size on
> "disk", kernel load time, etc. And some of the devices have very tight
> boot requirements. Think battery operated outdoor cameras for example.

I think we can draw a clear line (or several lines) between devices that boot
from strictly constrained NOR flash and those that run a platform-independent
kernel.

Also, when I look at a distro kernel, I see over 5000 kernel modules that
need to be stored on disk, but only a small fraction of those are platform
specific while most are for general-purpose pluggable devices, network
features or file systems that could be used on any system.

The vmlinux file is clearly too big and includes too much stuff that should
be in loadable modules, but I'm not really that worried about disk space
for the platform specific code.

         Arnd
