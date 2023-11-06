Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2862A7E25C7
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Nov 2023 14:36:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232850AbjKFNgm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Nov 2023 08:36:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231240AbjKFNgl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Nov 2023 08:36:41 -0500
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F34710B
        for <linux-gpio@vger.kernel.org>; Mon,  6 Nov 2023 05:36:37 -0800 (PST)
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-da2b9211dc0so4315001276.3
        for <linux-gpio@vger.kernel.org>; Mon, 06 Nov 2023 05:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699277796; x=1699882596; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=83490tanbieQpNkzB0DdxUY/5tq5M+Egl36lG1f/02A=;
        b=FE8QNUieH6xvx3yo0YbjE70G9DShRUXkbc93PobuQO38tpWVLBPaUeqsNl8VhhLgbH
         EYUi9ByuLqNYa8P+u/WW5mL9rLYP+Nt18a3wJm6tw6WyigcFsLLMt8Kpu8q22tWeXHB3
         yQdDk3VYETEofuQvgaT2MyLb9BiRzM5rn8UgSX6sTWP5vlT8rSoZVE1pC8dG3ARmKEK+
         rehjikfOvzkrDFAYghJJAEzQrTFJPe1MN35IpEGABxx4KveoTTBPhGX+4qgVyW0IABof
         1WfWIZL/DfbBTX9wHWj1YBwLq0d5Cmyjet7urTIIhJBsOUQYtxvNQ7ChWQACjQNKOFxu
         u1cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699277796; x=1699882596;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=83490tanbieQpNkzB0DdxUY/5tq5M+Egl36lG1f/02A=;
        b=VP4/SuOnKYxHTsrCRYuyKVPSMfJXsj9JGMp4+ilk+16OSbE33VyKH1/bGyyuBVH8RQ
         iBJtXGNFls8LscoURel6sdUkHhXiEghITFg2ciDmVmQBGki+M2+q1lByifk6+4gparMk
         eDSxV+dH8CzUgUBy9LXUh6pgnPtsQHv4qfJrbPReCuDZIvrNj0qdAvHO/1Ffh2BRSjUE
         2mLiuRzf4Dnw7MOmWiFZB/lQHplsrDSpsij6gR7qbGdqx+hoWBqJd9Sawg719JVxBlY2
         70crmrK8Y/T/rSp06Z8fP6kf+kGd3kxIKVWsGOPvQP7QYiJaNkpNAcJnRMZvUJlQYp8q
         C69g==
X-Gm-Message-State: AOJu0Ywgxq7C3S0QMf3XLoTJPOuD2SgSkZ80r86M8VRuYKbvquAT8oIW
        cVemzH3PQuUULXpbIHaCmOwX7fPrFOd7GMGpkSUy/g==
X-Google-Smtp-Source: AGHT+IGmQY13BxBxBzb0d8lmlJ4oIMy3ib1c8YevIHL2R8UlJ8RMiTrVYzodkbj49vb/zL/CxhLBLD8lDqBmIx+jBDg=
X-Received: by 2002:a25:8590:0:b0:da0:cf4b:c504 with SMTP id
 x16-20020a258590000000b00da0cf4bc504mr29059132ybk.8.1699277796488; Mon, 06
 Nov 2023 05:36:36 -0800 (PST)
MIME-Version: 1.0
References: <20231010224928.2296997-1-peter.griffin@linaro.org>
 <3d489d6c-2098-4f0c-9ec4-f6040665753e@lpnu.ua> <CADrjBPp+fyNoPdix6=Wp4cDCRFq2Mui8NS6WENejcHn+H1M-jA@mail.gmail.com>
 <48e1c0bd-9518-4927-b490-f3206256bbd4@lpnu.ua> <c0b8f356-0f26-459d-850d-ec0fa1fd3987@linaro.org>
In-Reply-To: <c0b8f356-0f26-459d-850d-ec0fa1fd3987@linaro.org>
From:   Peter Griffin <peter.griffin@linaro.org>
Date:   Mon, 6 Nov 2023 13:36:24 +0000
Message-ID: <CADrjBPqXQa0ZhM3YFToH5kZcOU27ZuSajm-gj5mWybGTRM++-Q@mail.gmail.com>
Subject: Re: [PATCH v2 00/20] Add minimal Tensor/GS101 SoC support and
 Oriole/Pixel6 board
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Maksym Holovach <maksym.holovach.an.2022@lpnu.ua>,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, cw00.choi@samsung.com,
        tudor.ambarus@linaro.org, andre.draszik@linaro.org,
        semen.protsenko@linaro.org, saravanak@google.com,
        willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Krzysztof,

On Fri, 3 Nov 2023 at 14:49, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 03/11/2023 14:56, Maksym Holovach wrote:
> > Hi Peter,
> >
> > On 11/3/23 15:11, Peter Griffin wrote:
> >> Hi Maksym,
> >>
> >> Thanks for your feedback.
> >>
> >> On Thu, 2 Nov 2023 at 22:32, Maksym Holovach
> >> <maksym.holovach.an.2022@lpnu.ua> wrote:
> >>> Hi, all
> >>>
> >>> I wanted to inquire about how do you all feel about calling this SoC by
> >>> the Google "gs101" name.
> >> Interesting question, I think calling it gs101 is the correct approach see
> >> below for my rationale.
> >>
> >>> I believe the proper name for it should be the actual Samsung name,
> >>> written in the silicon and reported in the Chip ID hardware: Exynos9845.
> >>> This also touches the Tensor G2 (Exynos9855), Tensor G3 (Exynos9865),
> >>> and possibly the "Tesla" SoCs.
> >>>
> >>> I do not think the Linux kernel should be a marketing material: it
> >>> should reflect reality. The chip is almost 100% composed of Samsung
> >>> Exynos IP blocks and should be called that way.
> >> As you alluded to Tesla fsd and Axis artpec8 SoCs are also based on
> >> Exynos designs and support upstream uses the axis,artpec8* or tesla,fsd*
> >> compatibles.
> >>
> >> So using google,gs101 is consistent with the existing upstream naming
> >> scheme, for customized ASICs that were based off a Exynos design. But
> >> it also reflects the reality that this SoC is not a Exynos9845 as there is
> >> also a lot of Google owned and other third party IP integrated that is not
> >> found in Exynos9845.
> >
> > A quick question: Do you imply Exynos9845 exists outside of the context
> > of Tensor G1? I used to believe Exynos9845 **is** Tensor G1.
> >
> > Also, what kind of Google IP are you talking about? I believe only the
> > neural accelerator should be custom-ish.
> >
> > Additionally, I believe it having or not having Google IP is irrelevant:
> > for example, the new Raspberry Pi 5 Broadcom SoC has a lot of
> > Raspberry's own IP, but it's still called Broadcom as it's the real
> > manufacturer and designer of the chip.
>
> That's a good argument. Indeed BCM2712 contains "New Raspberry
> Pi-developed ISP".
> https://www.raspberrypi.com/documentation/computers/processors.html
>
> There aren't many patches but GPU is still called brcm,2712.

RPi ISP is named 'raspberrypi,pispbe' in RPi downstream drivers. See
linux/drivers/media/platform/raspberrypi/pisp_be/ in RPi tree.

>
> For Tesla FSD, there was discussion and output was not very consisting.
> First, the name itself was used for everything - SoC architecture, one
> given SoC and eventually the board.
> https://lore.kernel.org/all/5ab62673-8d46-ec1d-1c80-696421ab69ca@canonical.com/
>
> Eventually the last part - board - was renamed to "Evaluation board",
> but I don't know how true or real it is.
>
> See also:
> "I would argue that if this SoC shares the pinctrl, clock, spi, adc,
> and timer implementation
> with Exynos, we should consider it part of the Exynos family,"
> https://lore.kernel.org/all/CAK8P3a31bCHNcNWrLX+QW+4RuK=DBpxLA_j5BFKxXxXKCT8PFQ@mail.gmail.com/
>
> However it was also claimed:
>
> "AFA architecture is concerns both Exynos and FSD has completely
> different architecture (at least at HW level)."
> https://lore.kernel.org/all/07ce01d8091e$9a6fd9c0$cf4f8d40$@samsung.com/

Thanks for those references.

I know nothing about Tesla FSD SoC internals I'm afraid. But it seems
plausible to
me that you would not goto the expense of designing your own SoC if something
existed off the shelf you could just buy.

I suspect the original SoC series for Tesla, Tensor etc tend to look
very "exynos"
centric as it is the non differentiating bits of IP, but also the IP
that is required first
to bring up the platform.

>
> >> I guess the same is also true for `axis,artpec8` and `tesla,fsd` SoCs.
> >> IMO the SoC compatible string should be uniquely identifying the actual
> >> SoC, not a close relative.
> >>
> >> Regarding product_id you are correct this reads 0x09845000 but even
> >> within Samsung Exynos family there are examples where the register
> >> value does not match the SoC compatible. For example Exynos850 SoC
> >> has a product ID value of "E3830". Where the Linux compatible is
> >> matching the Samsung marketing name, not the internal/outdated name.
> >
> > I did not know Exynos 850 is also not going under it's real name.
> > Ultimately, I believe all of those SoCs should go under their technical
> > name in the exynos/ directory.
>
> The initial technical name does not exist outside of vendor sources and
> part name. E.g. Winlink E850 board hardware manual calls it:
> "Samsung Exynos 850, S5E3830"
> and everywhere else Exynos 850 SoC is used.
>
> If you start calling it Exynos 3830, only me and Sam (who mainlined it)
> would know what is it. Everyone else, all users of kernel, would be
> confused.
>
> Therefore using well known final product name is for Exynos850 reasonable.

I agree that was the correct decision IMO, and it is a very similar
situation here
as far as I'm concerned. Most people don't know Tensor G1 SoC as Exynos
9845.

>
> >
> > Another concern is that Google could in the future license other SoC: be
> > it Qualcomm, Nvidia or anything. If we put completely different hw under
> > google/ directory, does it really make sense? In that case, who'll
> > maintain the google/ directory? Exynos people? Qualcomm people if they
> > license it? Some other people?
>
> That's indeed a problem. Future Tesla SoC might have just few pieces
> similar to FSD. There would be no common SoC part, except the actual
> Tesla IP.
>
> Same for Google. Future GSXXX, if done by Qualcomm, will be absolutely
> different than GS101 and the only common part would be the TPU (Tensor).

There is more Google IP than TPU but I see the point you're making.

>
> So now let's decide what is the common denominator:
> 1. Core SoC architecture, like buses, pinctrl, clocks, timers, serial,
> and many IP blocks, which constitute 95% of Devicetree bindings and drivers,
> 2. The one, big piece made by Samsung's customer: TPU, NPU or whatever.

Or multiple big pieces of IP.

Does having it all under the exynos directory help you somehow with
maintenance? Has having Alim maintain tesla-fsd in a separate directory
caused issues?

I structured it like this as I thought it would scale better, and also
because it was
consistent with what you had accepted previously for other Exynos derived SoCs
like Tesla.

>
> >
> > Then, I don't think Tensor G3 has a proper "GS" name, it goes by "Zuma"
> > in decompiled kernel modules as far as I see.
> >
> > Finally, Tesla people already tried to submit drivers called by Tesla
> > name, but which basically copied the functionality of the Exynos
> > drivers. We would want to avoid that, ideally.
> >
> > My opinion is that all the Tesla and Google SoCs should be in the
> > exynos/ directory, not only because they are basically Samsung Exynos,
> > but also because they don't really need a separate directory: neither
> > Google nor Tesla didn't neither manufacture or design those SoCs from
> > scratch. The only reason I can think of for them to have it in a
> > separate directory is maybe because Google and Tesla actually paid
> > Samsung money for the right to call Exynos "Google designed" SoCs, but I
> > believe the kernel should be left out of that.
>
> For some reason, although I know which, Cc-list is here trimmed and
> misses Alim...
>
> So standard reply follow (it makes me really, really grumpy, because it
> means you develop on some crazy old kernel or do not use tools which
> automate the process):
>
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC (and consider --no-git-fallback argument). It might
> happen, that command when run on an older kernel, gives you outdated
> entries. Therefore please be sure you base your patches on recent Linux
> kernel.

Sorry about that. I can add Alim and others to CC next time around. I didn't
notice he was listed as a reviewer of Exynos. I thought it was only for Tesla
FSD SoC. My apologies Alim!

Thanks,

Peter.
