Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA79F419DD8
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Sep 2021 20:07:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235968AbhI0SJR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Sep 2021 14:09:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235919AbhI0SJQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Sep 2021 14:09:16 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44E06C061714
        for <linux-gpio@vger.kernel.org>; Mon, 27 Sep 2021 11:07:38 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id r4so25874969ybp.4
        for <linux-gpio@vger.kernel.org>; Mon, 27 Sep 2021 11:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YolFVCrzWqJGBIiStEoOBZ3MZ7NnNyNvRsLA4PugcZ4=;
        b=N4/LuKRExHZ/Ke9/1lT1dORZxc6QJyC/1mxPNC+htXeykWUDoWOZhAcDG0AinlHXS+
         BiLIOUy+UYwpqDxlWimW/f6c2vm60ZRl16Y09c+WgrhhQAeFPApvDcKMHe1VHGm9LKRl
         keIVyQY0wZQu2s4xj5f9XsyONEQrgVxrqC7NsnxljjXcvuq6VXaaSInu9A8I6nMFT7OU
         NZccim8iWq66W8RT8IA4gX7rYWiytfLtIB2op4ZVIdWfD+EcgqdRHrxJqTlDjyMdLoH8
         ZIlW4hZWDXFqjwUcaVHkV14b20+QuTasEnsKAgUdQSNSnF+q3I41eLKbo8q1YWgBLv+4
         jLlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YolFVCrzWqJGBIiStEoOBZ3MZ7NnNyNvRsLA4PugcZ4=;
        b=XkCMVRFeZljCEQZMjy2Wg4of3y9Supd3kQ78UBa8A5S4ETaOQ1tqdboYHcJGGibCYJ
         S+TES0Gqj+GLUj14/ygUlrRf1KKdCpehSzP46iJt+fc78xn/zlVJ3AM7Aty+uFOuToGI
         7ZgzDUorzJ6hVE1uXVUY3aJqOmjNkG2//ecXmfTys/swMkVsBI1ftgR2S8F3r5ufEEh8
         U16tob2L7icA7fylfyAP9IFVk/dmMpnhVmLZyv5Q25E0dMChRWGJ99MwZdG/aU6Mhwlg
         0x7xkwEvxVo6PFouldyFZhwHP+HgaPI8YNA4UbB2m94ntTg3O+C1FT8cqTVCothaK8Mo
         c6Og==
X-Gm-Message-State: AOAM531Odk3gpyAePmHxQUTxbK/3CkPRCz8dPzRC2fBNZzPizVsVQb4u
        PCI+W3W+hMLEAArBVE6fotwnVD0SJWmKamY4g6roeQ==
X-Google-Smtp-Source: ABdhPJxk9waOnE/GEpYsMZa+XW5YCS/TXzMipOQFVXGjZyi0Hb5rxdU/5QmjNVirBYqrwoiRjihGMovnx5H10BTy12I=
X-Received: by 2002:a25:dd46:: with SMTP id u67mr1424730ybg.295.1632766057145;
 Mon, 27 Sep 2021 11:07:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210920190350.3860821-1-willmcvicker@google.com>
 <7735b09c-cf1c-5e37-a737-9a330fbacf1e@canonical.com> <YUmTwZPqrCfRMekd@google.com>
 <d6212801-f2a0-a6a7-6154-0f99b57f1c4d@canonical.com> <CAGETcx9wp3cbsehODj=oAd658hF6KNL5Qiy2nVc=7Bxqxxwimw@mail.gmail.com>
 <5ec72235-add4-d6dd-f89f-ca3941c9878e@canonical.com>
In-Reply-To: <5ec72235-add4-d6dd-f89f-ca3941c9878e@canonical.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Mon, 27 Sep 2021 11:07:00 -0700
Message-ID: <CAGETcx-b9nPjq2PqUYoXohU-WE1PAPzy4Mz5M99CzNfqvGTOsA@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] arm64: Kconfig: Update ARCH_EXYNOS select configs
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Will McVicker <willmcvicker@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 27, 2021 at 1:08 AM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 25/09/2021 04:17, Saravana Kannan wrote:
> > On Tue, Sep 21, 2021 at 1:25 AM Krzysztof Kozlowski
> > <krzysztof.kozlowski@canonical.com> wrote:
> >>
> >> On 21/09/2021 10:11, Lee Jones wrote:
> >>> On Tue, 21 Sep 2021, Krzysztof Kozlowski wrote:
> >>>
> >>>> On 20/09/2021 21:03, Will McVicker wrote:
> >>>>> This patch series tries to address the issue of ARCH_EXYNOS force selecting
> >>>>> a handful of drivers without allowing the vendor to override any of the
> >>>>> default configs. This takes away from the flexibilty of compiling a generic
> >>>>> kernel with exynos kernel modules. For example, it doesn't allow vendors to
> >>>>> modularize these drivers out of the core kernel in order to share a generic
> >>>>> kernel image across multiple devices that require device-specific kernel
> >>>>> modules.
> >>>>
> >>>> You do not address the issue in these patches. The problem you describe
> >>>> is that drivers are not modules and you are not changing them into modules.
> >>>
> >>> The wording is unfortunate.  The reason for this change doesn't have
> >>> much to do with kernel modules.
> >>>
> >>> Let's go back in time 18 months or so when Greg KH submitted this [0]
> >>> patch, which you Acked.  Greg was trying to solve the problem of not
> >>> having to enable ARCH_EXYNOS on kernels which are designed to be
> >>> platform agnostic (sometimes called Generic Kernels).  For some reason
> >>> SERIAL_SAMSUNG is the only symbol with these dependencies, so the
> >>> solution seemed simple and straight forward at the time.
> >>>
> >>> However, For sound reasons Geert NACKed the patch.
> >>>
> >>> Quoting from [1] he says:
> >>>
> >>>   "A generic kernel will include Samsung SoC support, hence
> >>>   PLAT_SAMSUNG or ARCH_EXYNOS will be enabled."
> >>
> >> Yes, it's correct reasoning. There is also one more use-case -
> >> non-upstreamed (out of tree) platform which wants to use Exynos-specific
> >> drivers. Something like was happening with Apple M1 except that it got
> >> upstreamed and we do not care much about out-of-tree.
> >>
> >>>
> >>> However, since the entry for ARCH_EXYNOS *insists* on building-in a
> >>> bunch of other symbols (via 'select') which will be unused in most
> >>> cases, this is not a currently acceptable approach for many Generic
> >>> Kernels due to size constraints.
> >>
> >> In the mainline kernel there is no such use case. If you want to have
> >> Exynos-whatever-driver (e.g. SERIAL_SAMSUNG or S3C RTC), you should
> >> select ARCH_EXYNOS because otherwise it does not make any sense. Zero
> >> sense. Such kernel won't work.
> >>
> >> It makes sense only if there is some other work, hidden here, where
> >> someone might want to have SERIAL_SAMSUNG or S3C RTC without
> >> ARCH_EXYNOS. Although GKI is not that work because GKI kernel will
> >> select ARCH_EXYNOS. It must select ARCH_EXYNOS if it wants to support
> >> Exynos platforms.
> >>
> >> Therefore I expect first to bring this "some other work, hidden here" to
> >> broader audience, so we can review its use case.
> >>
> >>>
> >>> What this patch does is migrates those symbols from being 'select'ed
> >>> (always built-in with no recourse) to 'default y'.  Where the former
> >>> cannot be over-ridden, but the latter can be via a vendor's
> >>> defconfig/fragment.
> >>
> >> It cannot be overridden by vendor fragment because options are not
> >> visible. You cannot change them.
> >>
> >> The patch does nothing in this regard (making them selectable/possible
> >> to disable), which is why I complained.
> >>
> >>>
> >>> I doubt many (any?) of these symbols can be converted to kernel
> >>> modules anyway, as they are required very early on in the boot
> >>> sequence.
> >>
> >> True, some could, some not. Also some platforms are set up via
> >> bootloader, so actually could "survive" till module is loaded from some
> >> initrd.
> >
> > Hi Krzysztof,
> >
> > I was trying to chime in, but the discussion got spread out across all
> > the patches. Since the cover letter seems to have everyone, I thought
> > I'd reply here. Hope you don't mind. I'll try to respond/chime in on
> > the various topics that were raised across the patches.
> >
> > Yes, the next patch series would To/Cc folks correctly. William simply
> > forgot to use the --to-cover and --cc-cover options when using git
> > send-email.
> >
> > I agree with you that it doesn't make sense to have ARCH_EXYNOS
> > enabled but to have all the clock drivers exynos compiled out. Then
> > one obviously can't boot an exynos platform using that kernel.
>
> If downstream kernel does not use any upstream platforms (e.g.
> Exynos5433 or Exynos7) and has its own drivers for everything, then
> downstream does not even need ARCH_EXYNOS. Just disable it.

As Geert pointed out in another reply, that prevents the use of
earlyconsole on an exynos SoC + fully modular generic kernel. Are we
okay with removing the ARCH_EXYNOS dependency on the early console
driver now?

> > I think
> > William is going to send out a new patch series with a few drivers
> > modularized. That'll ensure all the common exynos clock code is
> > modularized and we have a few examples of exynos clock modules.
>
> If it works on supported Exynos platforms: awesome!

Yes, that's the idea :) What's the point of sending a module upstream
if it doesn't work with upstream? And this is where William would need
help with testing.

> If it does not work: not that good. I understand that downstream or
> vendor do not want to mainline their SoC drivers and SoC support. Either
> because HW is too new (do not disclose it) or it is too old (lost
> interest). It's their right, they do not have to work with mainline on
> this. However changing mainline kernel in such a case to affect it so
> you can use your non-upstreamed drivers is wrong.

Since the goal is to have some of the existing clock drivers work as
modules, we wouldn't be running into this situation above.

> Affecting upstream platforms just because vendor/downstream does not
> want to mainline some code is unacceptable. Please upstream your drivers
> and DTS.
>
> Everyone else are working like this. NXP, Renesas, Xilinx, TI, Rockchip,
> AllWinner. Samsung or Google is not special to receive an exception for
> this.
>
> >
> > Speaking of modules, a fully modularized generic ARM64 kernel where
> > everything is modularized out and we only load the necessary modules
> > is a great goal. And this is where I can chime in the most since I
> > wrote fw_devlink and tested this out. Such a kernel is not
> > hypothetical. IIRC hikey960 can already do this. There's an upstream
> > amlogic(?) board that can do this (Kevin Hilman has done that). A more
> > complex/recent/powerful, but downstream example is the Pixel 5 -- it
> > has a fully modular kernel. 320+ modules! Including interrupt
> > controllers, timers, pinctrl and clocks.
>
> Awesome! I am in, if it works. :)

Great!

> > I can assure you any of the framework code related to pulling off
> > booting a fully modular ARM64 kernel is already upstreamed
> > (fw_devlink, irq framework changes, etc) or sent upstream (timer -- by
> > a SoC vendor, etc) and being worked on. As for fw_devlink, I've
> > extended it way past what GKI or Android would need. It would have
> > been super trivial if all I wanted to do was support Android devices.
> > I've also upstreamed changes that improve module loading time for all
> > ARM64 modules. All of this and more upstream work came out of GKI and
> > our push to be upstream first -- so I think it's reasonable to say the
> > GKI effort helps and cares to get more work upstreamed.
>
> Except UFS driver and recent Linaro work on Exynos850, none of these
> apply to the vendor discussed here.

I obviously can't force a vendor to upstream their stuff and I can't
speak for them. However the Android kernel team's goal is to have the
core Android kernel be the upstream kernel (we are making progress
every year). This will also have the nice effect that vendor
downstream drivers written for Android would automatically be
compatible with upstream and way more likely to get upstreamed.

> > Speaking of GKI, let's not speak of it. It really doesn't matter.
> > Android is just yet another distribution (albeit a very popular one).
> > The part that's relevant to upstream/all the other distributions is
> > the fully modular generic ARM64 kernel and that's what we should focus
> > on.
> >
> > In that context, I think William's attempts are reasonable and I think
> > he'll be glad to fix up any technical issues that people point out. So
> > hopefully we can focus on that?
>
> Yes, we can focus on that.

Thanks!

> In technical issues, I do not agree to
> affecting negatively supported platforms just because downstream/vendor
> does not want to send upstream its drivers.
>
> Please upstream your drivers. By "your" I mean all the drivers which you
> want to enable after disabling ARCH_EXYNOS mainline drivers.

I'm not sure I fully understood this part. But if your point is that
we shouldn't have a negative impact on hardware supported in upstream
just so a downstream driver can work, I completely agree with you.

At the same time, it also doesn't make sense to have a negative impact
on upstream (rejecting patches that are working towards a fully
modular generic ARM64 kernel) just because it might also help
downstream drivers. That is like cutting your nose to spite your face.

Also, by taking this position, you are just making it even harder to
upstream the downstream drivers while also hurting upstream. Which is
clearly not what we want. Almost all vendors have engineers working
for them that'd like to see more of their code upstream. Treating them
as one monolithic "vendor" entity doesn't help. You are just making it
harder for the pro-upstream engineers to make a case for upstreaming
their drivers.


-Saravana
