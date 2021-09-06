Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FC40401D75
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Sep 2021 17:17:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232158AbhIFPSM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Sep 2021 11:18:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242065AbhIFPSL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Sep 2021 11:18:11 -0400
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com [IPv6:2607:f8b0:4864:20::92c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8838EC0613CF
        for <linux-gpio@vger.kernel.org>; Mon,  6 Sep 2021 08:17:04 -0700 (PDT)
Received: by mail-ua1-x92c.google.com with SMTP id z3so106054uav.13
        for <linux-gpio@vger.kernel.org>; Mon, 06 Sep 2021 08:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=bQrcOPSf7pBZJCYQQnVkSrgNEesYDMSFecU9BQuGKZU=;
        b=zYe9FR9ZNaFmXa/bzWa/4JbqZVIulgJ6lbYskzgikyVc6Og/9TOjcJKnIjDb1eEucZ
         kG1X8tg1HoGjsJ95+BxJb243vLWeu00fyyYGcVmkyEO44lBEJ6TEVhBrkiDs3dyaCZui
         It/w80qNYdvf6f1NrDkZnuYNfWGMD331qsX1YEMeiAaO+LCSbB5oRh9OevAwdfydjhMI
         4gk9S+zG+gEquPWYXFTPSehBZME3pX38EZruq85WmqlX2awokHjcXOkR1NPpzRRMjsNO
         VffyLSHsnQwJy4HqiGq4WZLxNQUPVBkJW5ejLYE2bhDuxgbHNojK1rp1+I0cVZFU3N1s
         cPUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bQrcOPSf7pBZJCYQQnVkSrgNEesYDMSFecU9BQuGKZU=;
        b=hgkUYcVuYgY8O0P7/YIfOe1qdwGSUYvpSHaE9pYDaFsOnpBmE7WIjf1mKx3l3cZj6i
         wuzFDYpJUVWREPAwMKTpL5Y/MvfNJYfpk06kF1BJKWxXOTwo0hcGGtyrb0iqvZEdYkBe
         V3VN++436Krov4AcFGjxQNsMtO2q1AAGnvSTRW2eur7JgscCJjGItxhVkXe86yB/u6Gr
         RQma/mysxTsbbegbCxlJOb2i6kIFlzGiwGsihMwySIrf2bxxPoN6otAQ9sWj3MGlYfWb
         Ye/ID9KfGtiyS9t+pU3xnRZZFhu9m8L2mf2tollDDtJj6w969xtNYD5J2EcgVwh06oOm
         QhJg==
X-Gm-Message-State: AOAM530zm9YMlXpB7/SLyvBEy6bn1RVBwo+Y9STriBYoDxFFXaEETxsS
        o+fi4C1y5Pex99QwZV0Exyoh2IUDsxceG0x499An7Q==
X-Google-Smtp-Source: ABdhPJwRm+FKxm0YSP8+0/3Dgu/q6YVV1RAAkL/Hx1QxF9PMM6RdemkterGZszBPDz4vhjLfYOArLtkqbVaXsEbQvhE=
X-Received: by 2002:ab0:3303:: with SMTP id r3mr6027322uao.17.1630941423339;
 Mon, 06 Sep 2021 08:17:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210730144922.29111-1-semen.protsenko@linaro.org>
 <20210730144922.29111-13-semen.protsenko@linaro.org> <455cfb5e-dff7-a5c0-3875-49abe3e900f3@canonical.com>
 <CAPLW+4nDS0atrbUFagDA0W_Ky5MvOiY+N+NQoQ+me4pndp_iWg@mail.gmail.com>
 <68734f6c-fc76-595c-8d34-8924dbbbb845@canonical.com> <CAPLW+4n_JKj5xeBHXONcv__vyAFvx3fhXoxJa17NTHK1RSJFJw@mail.gmail.com>
 <b753796c-2ce6-4166-7c20-289e950237ad@canonical.com> <50f84842-c397-8012-af95-e9d9fce53162@gmail.com>
In-Reply-To: <50f84842-c397-8012-af95-e9d9fce53162@gmail.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Mon, 6 Sep 2021 18:16:51 +0300
Message-ID: <CAPLW+4=qDpwU0Qkc9Q8bewnQb283RonAUHwwM-H86qkbPrU9gw@mail.gmail.com>
Subject: Re: [PATCH 12/12] arm64: dts: exynos: Add Exynos850 SoC support
To:     =?UTF-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Charles Keepax <ckeepax@opensource.wolfsonmicro.com>,
        Ryu Euiyoul <ryu.real@samsung.com>,
        Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 6 Aug 2021 at 23:32, Pawe=C5=82 Chmiel
<pawel.mikolaj.chmiel@gmail.com> wrote:
>
> W dniu 06.08.2021 o 14:32, Krzysztof Kozlowski pisze:
> > On 06/08/2021 14:07, Sam Protsenko wrote:
> >> On Fri, 6 Aug 2021 at 10:49, Krzysztof Kozlowski
> >> <krzysztof.kozlowski@canonical.com> wrote:
> >>>
> >>> On 06/08/2021 01:06, Sam Protsenko wrote:
> >>>> On Sat, 31 Jul 2021 at 12:03, Krzysztof Kozlowski
> >>>> <krzysztof.kozlowski@canonical.com> wrote:
> >>>>
> >>>>>>
> >>>>>> This patch adds minimal SoC support. Particular board device tree =
files
> >>>>>> can include exynos850.dtsi file to get SoC related nodes, and then
> >>>>>> reference those nodes further as needed.
> >>>>>>
> >>>>>> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> >>>>>> ---
> >>>>>>   .../boot/dts/exynos/exynos850-pinctrl.dtsi    | 782 ++++++++++++=
++++++
> >>>>>>   arch/arm64/boot/dts/exynos/exynos850-usi.dtsi |  30 +
> >>>>>>   arch/arm64/boot/dts/exynos/exynos850.dtsi     | 245 ++++++
> >>>>>
> >>>>> Not buildable. Missing Makefile, missing DTS. Please submit with in=
itial
> >>>>> DTS, otherwise no one is able to verify it even compiles.
> >>>>>
> >>>>
> >>>> This device is not available for purchase yet. I'll send the patch f=
or
> >>>> board dts once it's announced. I can do all the testing for now, if
> >>>> you have any specific requests. Would it be possible for us to revie=
w
> >>>> and apply only SoC support for now? Will send v2 soon...
> >>>
> >>> What you propose is equal to adding a driver (C source code) without
> >>> ability to compile it. What's the point of having it in the kernel? I=
t's
> >>> unverifiable, unbuildable and unusable.
> >>>
> >>
> >> Yes, I understand. That's adding code with no users, and it's not a
> >> good practice.
> >>
> >>> We can review the DTSI however merging has to be with a DTS. Usually =
the
> >>> SoC vendor adds first an evalkit (e.g. SMDK board). Maybe you have on=
e
> >>> for Exynos850? Otherwise if you cannot disclose the actual board, the
> >>> DTSI will have to wait. You can submit drivers, though.
> >>>
> >>
> >> Sure, let's go this way. I'll send v2 soon. Improving patches and
> >> having Reviewed-by tag for those would good enough for me at this
> >> point. I'll continue to prepare another Exynos850 related patches
> >> until the actual board is announced, like proper clock driver, reset,
> >> MMC, etc. Is it ok if I send those for a review too (so I can fix all
> >> issues ahead)?
> >
> > Sure, prepare all necessary drivers earlier. I suspect clocks will be a
> > real pain because of significant changes modeled in vendor kernel. I
> > remember Pawe=C5=82 Chmiel (+Cc) was doing something for these:
> > https://github.com/PabloPL/linux/tree/exynos7420
> >
> > I mentioned before - you should also modify the chipid driver. Check
> > also other drivers in drivers/soc/samsung, although some are needed onl=
y
> > for suspend&resume.
> >
> > BTW, Pawe=C5=82,
> > How is your Exynos7420 progress? :)
> Hi
>
> Sadly i had to postpone it for a while. Maybe will have more time now to
> get back to it.
>
> About clock driver. In vendor sources there is clk driver with something
> called virtual clocks (different than real ones). That driver calls
> another driver called pwrcal, responsible for real manipulation of
> clocks in hardware. This one has info about real clocks and also
> additional info about for example rate for some of them, which is read
> from binary from memory, by another driver called ect_parser in case of
> devices at which i did looked.
>
> In my case i was able to find some more info about real clocks there -
> for example register names and offsets
> https://github.com/krzk/linux-vendor-backup/blob/mokee/android-3.18-samsu=
ng-galaxy-s7-sm-g930f-exynos8890/drivers/soc/samsung/pwrcal/S5E8890/S5E8890=
-cmusfr.h
> and some clocks hierarchy info inside
> https://github.com/krzk/linux-vendor-backup/blob/mokee/android-3.18-samsu=
ng-galaxy-s7-sm-g930f-exynos8890/drivers/soc/samsung/pwrcal/S5E8890/S5E8890=
-cmu.c
> but there was still many info missing.
>
> Finding a way (which could be applied to other Exynos SOC) to "convert"
> or use that vendor code and turn it into mainline driver, especially
> without TRM which is not available for all/most of them, would be great.
>
> I'm wondering if Exynos850 device has the same issue as on 7420 (and
> probably 8890/7578 and maybe also other 64 bit Exynos devices) - broken
> firmware. For example i had to specify in dts timer clock frequency, on
> few devices there is also a problem with timer registers not properly
> configured by FW, which probably won't be fixed by vendor and patches
> with workaround for it in kernel were rejected :/.

Hi Pawe=C5=82,

Sorry for the late reply. Thanks for your input! I just started
implementing the clock driver, and maybe I can share some useful stuff
in exchange.

ECT parser: in downstream kernel there is an option to dump ECT tables
via some DebugFS file. I did that, and it seems to me it would be
easier to just hard code necessary table in corresponding drivers
code. E.g., PLL tables can be hard-coded in the clock driver (which is
how it seems to be implemented for other Exynos SoC upstream anyway).
So I don't think there is a huge need to upstream ECT parser itself.
But dumping the tables can be useful to implement corresponding
drivers (clocks, DVFS, APM, etc).

Investigating downstream clock driver for Exynos850 and its
dependencies (like VCLK, RA, CMUCAL), I figured it's much easier to
implement the clock driver completely from scratch. Looking into
clk-exynos7.c and clk-exynos5433.c implementation, this is probably
how upstream design should look like. And it has nothing to do with
downstream implementation. E.g., downstream driver has one single CMU
node in dts (for the whole clock subsystem), but for upstream drivers
we want to have separate nodes for each particular CMU. Also
downstream implementation is over-complicated; that might have some
sense for the vendor, if they have a bunch of similar SoCs or sharing
driver code between different OS kernels, but for upstream kernel it's
just unneeded complexity (several layers of abstraction that should be
just removed, and useful stuff should be integrated in already
existing upstream infrastructure). So I ended up using TRM and trying
to make something similar to mentioned upstream drivers. Of course,
there are some questions on whether we should use manual clocks
control, or rely on automatic clock gating and Q-channel
communication. But I'm having some progress already, and hopefully
will submit the minimal driver in a week or so.

As for downstream design and how to make a sense of it, for converting
that to something more upstreamable, here is what I figured.

1. Clock driver (clk-exynosXXXX.c) registers some vclk clocks
("Virtual Clocks"). Those are clocks which will be actually used. But
those are lacking any hardware specific data yet (like register
offsets, etc).

2. ".calid" field from those vclk's is used to find more
hardware-related info (later in run-time) for those registered clocks,
from cmucal-node.c file. That file contains actual parent information
and some info on HW stuff, but not real addresses/offset, but only
indexes.

3. Those indexes are resolved further (in run-time), obtaining actual
offsets from cmucal-sfr.c file, in ra_init() function.

4. Instead of using existing CCF clocks, custom vclk clock ops are
used. Those are defined in composite.c (has nothing to do with CCF
composite clocks). So the whole VCLK type looks like vendor
re-implementation of composite clocks. For example, one VCLK clock can
have the whole list of clocks which will be controlled via that single
VCLK clock, and all operations will be called for each clock from the
list.

5. Further those operations are actually calling the code from ra.c,
different functions are used for different clock types (PLL_TYPE,
MUX_TYPE, etc). So if you're curious about actual ops implementation
(like PLL, muxes, etc), just look there.

That should be enough to convert downstream driver to upstream one.
Basically one can use downstream source code to figure out info about
registers and offsets (from cmucal-sfr.c) and info about internal
clocks structure from cmucal-node.c and cmucal-vclk.c, and implement
everything from scratch using clk-exynos7.c/clk-exynos5433.c as a
template. I'd say it's easier to just use TRM for that, though :)

As for the broken firmware and clock freq registers: yes, CNTFRQ_EL0
registers wasn't set in EL3 firmware too, so I'm setting the
"clock-frequency" property for arch timer in dts as a workaround right
now, in my local tree. But I already let vendor guys know about that
problem, and they are trying to fix that right now (at least for
Exynos850 SoC).

Thanks!

> >
> >> And should I maybe add RFC tag for those?
> >
> > No need. Drivers can be merged before DTS users.
> >
> > Best regards,
> > Krzysztof
> >
>
