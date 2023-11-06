Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3774E7E2D18
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Nov 2023 20:42:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232618AbjKFTmU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Nov 2023 14:42:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232380AbjKFTmT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Nov 2023 14:42:19 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4461AB
        for <linux-gpio@vger.kernel.org>; Mon,  6 Nov 2023 11:42:14 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1cc209561c3so32655ad.0
        for <linux-gpio@vger.kernel.org>; Mon, 06 Nov 2023 11:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699299734; x=1699904534; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MVYpx2vstvPHrNqm/sbG4Wpn52mx0IbOtVopQJBTAZU=;
        b=ibRQRSPXjyuHtPSEWsE8Q4hOjCn3WuD6/Ij4ZvIuzr4QRPwDgrH1V4fY0yK2ZkfxCk
         8buU9UT7fgIVLfdHzGufVK9ryMUvjvTDKz0o1tPIPxjLargTvWYJuqLZZNs3b4Awoftu
         ouwUNEopTkQBpVDU5NQFOnWUKRXzebcVKBUJt6A9P561S3AGqXVlG+MgfjEsaHvfOVn2
         Tb5x5dcmX6EzcdM7KH+V8oO42bvnWR4JNeKX5t+qAa845scO3SSXZGam3gAlgX06UJJU
         YTTXG773i984uYND2RP9eH+ngUxtuGs10Ts/SKQZaznw+P4KLI5s1E+MjyXwKm2I0PC/
         /z7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699299734; x=1699904534;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MVYpx2vstvPHrNqm/sbG4Wpn52mx0IbOtVopQJBTAZU=;
        b=vos/bNwrsPv/Xe7R92NxIeoyCk/D+uzeqA0ypD2wQUBnDvpVW6IEJompmoQOkjX7eC
         GrddLxgn1tzSVxnqhF9a3NkH5Oo3Mn8qH/pndAiOeKzM/WjGpxEI1XP8qarHJaBO9GHw
         4CRO1HQUXVromcXi9IY2DKi+hqh88zaGes2245SiJ3HEcBIO+HpDhdKGB4q0EX5MyIFV
         kjlD0c4QsOD4JqoG6JxdR5SfPr8Dl/L9R+SLcmwYOEdJhZx8VuwvSu53AbfGe9Kh9mi2
         vw1LNSX4hJKsUwPGMAK1rI049Ai2Jta2sSpMwHZB++u1JznrgzWyhoRDEMXqsw+Bp9R5
         FjEA==
X-Gm-Message-State: AOJu0YxPaD5Ol4nnSprUmy7bFX3fpCf5jNz1erACjUsr43bU27CZL0kj
        o0R8zInMM4RGY57RXV8KKYB5qg==
X-Google-Smtp-Source: AGHT+IHAD/mZ6f2P4F8AKM3u6joriL/MkXqr6Q2XZrmRdqwlBPOdXpx3rtrHv7iceXwrPJ16n5u4/g==
X-Received: by 2002:a17:902:8e82:b0:1cc:569b:1ddf with SMTP id bg2-20020a1709028e8200b001cc569b1ddfmr42062plb.18.1699299733933;
        Mon, 06 Nov 2023 11:42:13 -0800 (PST)
Received: from google.com (137.22.168.34.bc.googleusercontent.com. [34.168.22.137])
        by smtp.gmail.com with ESMTPSA id a24-20020aa78658000000b006b287c0ed63sm5917035pfo.137.2023.11.06.11.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 11:42:13 -0800 (PST)
Date:   Mon, 6 Nov 2023 11:42:09 -0800
From:   William McVicker <willmcvicker@google.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Peter Griffin <peter.griffin@linaro.org>,
        Maksym Holovach <maksym.holovach.an.2022@lpnu.ua>,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, cw00.choi@samsung.com,
        tudor.ambarus@linaro.org, andre.draszik@linaro.org,
        semen.protsenko@linaro.org, saravanak@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [PATCH v2 00/20] Add minimal Tensor/GS101 SoC support and
 Oriole/Pixel6 board
Message-ID: <ZUlBkeQ5ZaSmcTt0@google.com>
References: <20231010224928.2296997-1-peter.griffin@linaro.org>
 <3d489d6c-2098-4f0c-9ec4-f6040665753e@lpnu.ua>
 <CADrjBPp+fyNoPdix6=Wp4cDCRFq2Mui8NS6WENejcHn+H1M-jA@mail.gmail.com>
 <48e1c0bd-9518-4927-b490-f3206256bbd4@lpnu.ua>
 <CADrjBPqB5MOQeMV6uSJHLVyMJYWm7Nm_1XGSq331gPRfO1jkzg@mail.gmail.com>
 <308e2d07-1993-42d2-95eb-8132efaed1df@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <308e2d07-1993-42d2-95eb-8132efaed1df@linaro.org>
X-Spam-Status: No, score=-15.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,FSL_HELO_FAKE,HK_RANDOM_ENVFROM,HK_RANDOM_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Krzysztof,

On 11/06/2023, Krzysztof Kozlowski wrote:
> On 06/11/2023 13:46, Peter Griffin wrote:
> >>
> >> Also, what kind of Google IP are you talking about? I believe only the
> >> neural accelerator should be custom-ish.
> > 
> > This should not be considered an exhaustive list, but whilst looking in the
> > downstream public drivers at least the following Google IPs in the SoC
> > 
> > TPU/ML accelerator
> > Bigocean av1 video accelerator
> > Emerald hill compression engine
> > Camera ISP blocks
> > (AoC) Always on Compute
> > 
> > Plus of course Arm IPs (CPU+GPU), Synopsis IPs (USB, PCI. phys) etc.
> 
> These are all common to Exynos and usually they use Exynos-specific
> glue, so we consider them all Exynos-specific.
> 
> > 
> > The Exynos based IPs tend to be for things like pinmux, clocks, i2c, spi,
> > uart, mfc, display controller, timer etc.
> > 
> >>
> >> Additionally, I believe it having or not having Google IP is irrelevant:
> >> for example, the new Raspberry Pi 5 Broadcom SoC has a lot of
> >> Raspberry's own IP, but it's still called Broadcom as it's the real
> >> manufacturer and designer of the chip.
> > 
> > I think RPi / Broadcom is a very different situation to this. The original SoC
> > in RPi 1 was wholly designed by Broadcom, and marketed as a Broadcom
> > SoC [1].
> > 
> > Further iterations of the SoC until now have also not had RPi IP integrated.
> > RPi themselves refer to them as "Broadcom SoCs" on their webpage [2],
> > so it is completely expected that they live in a broadcom directory.
> > 
> > BCM2717 has integrated the RPi ISP, but to all intents and purposes this is a
> > Broadcom owned and designed SoC, albeit only now sold to one customer.
> 
> Not that different.
> Broadcom designed previous chip.
> Samsung designed previous chip.
> Broadcom designed BCM2717 with RPi ISP.
> Samsung designed GS101 with Tensor NPU and other blocks.
> 
> >>>
> >>> I guess the same is also true for `axis,artpec8` and `tesla,fsd` SoCs.
> >>> IMO the SoC compatible string should be uniquely identifying the actual
> >>> SoC, not a close relative.
> >>>
> >>> Regarding product_id you are correct this reads 0x09845000 but even
> >>> within Samsung Exynos family there are examples where the register
> >>> value does not match the SoC compatible. For example Exynos850 SoC
> >>> has a product ID value of "E3830". Where the Linux compatible is
> >>> matching the Samsung marketing name, not the internal/outdated name.
> >>
> >> I did not know Exynos 850 is also not going under it's real name.
> > 
> > It is going by its real name :) just not by its internal name that nobody has
> > heard of.
> > 
> >> Ultimately, I believe all of those SoCs should go under their technical
> >> name in the exynos/ directory.
> >>
> >> Another concern is that Google could in the future license other SoC: be
> >> it Qualcomm, Nvidia or anything. If we put completely different hw under
> >> google/ directory, does it really make sense? In that case, who'll
> >> maintain the google/ directory? Exynos people? Qualcomm people if they
> >> license it? Some other people?
> > 
> > I expect Google, or Google sponsored devs (as is the case for Linaro) to be
> > helping maintain the Google SoCs upstream. See the MAINTAINERS entry
> > for this series of who I expect to maintain this google directory.
> 
> That's fine. What I don't agree is with putting it into Google, because
> Google wants to have all its phones in one place. That's not the
> argument we used for any other SoCs or products.
> 
> We do not make decisions based on marketing or packaging wishes of some
> company. Otherwise Samsung phones will be together. Toradex boards (also
> spanning over NXP and TI) as well. Chromebooks DTS as well (oh, Doug
> would be happy, I guess :) ). And so on.
> 
> > 
> >>
> >> Then, I don't think Tensor G3 has a proper "GS" name, it goes by "Zuma"
> >> in decompiled kernel modules as far as I see.
> > 
> > That is correct, it is named Zuma downstream and they did away with the
> > gs101, gs201 type naming scheme.
> > 
> >>
> >> Finally, Tesla people already tried to submit drivers called by Tesla
> >> name, but which basically copied the functionality of the Exynos
> >> drivers. We would want to avoid that, ideally.
> > 
> > As you can see from this series we are not proposing that. Any IPs that
> > use Exynos IP we are using the existing upstream driver and enhance
> > it where we have features that aren't present upstream.
> > 
> >>
> >> My opinion is that all the Tesla and Google SoCs should be in the
> >> exynos/ directory, not only because they are basically Samsung Exynos,
> >> but also because they don't really need a separate directory: neither
> >> Google nor Tesla didn't neither manufacture or design those SoCs from
> >> scratch.
> > 
> > Who manufactures it seems irrelevant. Qcom and Broadcom don't
> > manufacture their SoCs either, but they still live in qcom and broadcom
> > directories upstream. Whether they designed the SoC from scratch or not
> > is also IMO largely irrelevant. In many cases the upstream community
> > has no way to determine whether things were outsourced or not anyway.
> > Did Apple outsource things in their silicon design? Who knows, and why
> > do we care? It's an apple branded chip in an apple branded product
> > let's call the directory apple.
> > 
> > Interestingly apple uses the same uart driver as Tensor, when I check back
> > through the commits in the driver.
> > 
> > fcbba344907afe26da487f1ed0b0e285c06a547b
> > 
> > tty: serial: samsung_tty: Add support for Apple UARTs
> > 
> > Apple SoCs are a distant descendant of Samsung designs and use yet
> >  another variant of their UART style, with different interrupt handling.
> > 
> > 
> >> The only reason I can think of for them to have it in a
> >> separate directory is maybe because Google and Tesla actually paid
> >> Samsung money for the right to call Exynos "Google designed" SoCs, but I
> >> believe the kernel should be left out of that.
> > 
> > Also the fact that they contain IPs not found in Samsung designed devices,
> > aren't known to most people as Exynos, and the maintenance issues of
> > having all the Google, Tesla, Axis, Exynos based SoCs in the same directory
> > (and who knows how many other ASIC customers in the future).
> > 
> > Ultimately it is Krzysztof's decision I think. I followed what he had previously
> > accepted for other SoCs for consistency and also because it seemed like the
> > correct approach to help scale up and ease the maintenance burden. If I look
> > at the number of tensor based SoCs, phones per SoC and board variants per
> > phone model, then you end up having a lot of files in the exynos directory over
> > time.
> 
> I agreed on Tesla FSD in its own place mainly because of arguments
> provided that time: it's entirely different architecture. These
> arguments were not backed by actual facts or proofs, though. The
> upstreamed parts of FSD turned out to be... only Exynos specific. There
> is literally nothing non-Exynos in upstream. Therefore knowing the
> outcome I would say: put FSD into samsung directory.
> 
> About GS101 I have the same questions - how similar it is? I am pretty
> sure that 95% of upstreamed code (DTS and drivers) will be Exynos-like
> (except for missing upstream support for generations of Exynos SoC!).
> But I cannot really judge and I am not going to investigate downstream
> code to figure this out. Thus if you insist that SoC architecture and
> core features are quite different from Exynos family, then sure, I can
> live with it.

I honestly don't care too much about where the DT files are stored --
arch/arm64/boot/dts/exynos vs .../dts/google. I didn't think this would be such
a hot topic! If this makes it easier for you to maintain, then so be it.

Just to note, I do understand what I proposed is something new -- group DT
files based on product owner vs original SoC designer -- and think it warrants
consideration since it does make it easier to distinguish which DT files are
associated with each product as well as package and distribute them easily, but
that can be a discussion for another time when we get more upstreamed.

Thanks,
Will

> 
> Best regards,
> Krzysztof
> 
