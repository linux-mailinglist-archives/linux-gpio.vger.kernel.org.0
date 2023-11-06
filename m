Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CE5D7E286F
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Nov 2023 16:16:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232107AbjKFPQg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Nov 2023 10:16:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232077AbjKFPQf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Nov 2023 10:16:35 -0500
X-Greylist: delayed 348 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 06 Nov 2023 07:16:31 PST
Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FDF5F3
        for <linux-gpio@vger.kernel.org>; Mon,  6 Nov 2023 07:16:31 -0800 (PST)
Date:   Mon, 6 Nov 2023 16:10:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
        t=1699283440;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=8IseJkdw2ZJ4O7QHhV2msEv4n+4BZunk72A86TeVvNk=;
        b=QR638+RBEN1ZHFuLBGLLLrN272CNfvCND66lm1i+46gFJNp6vZDMtp8k1YAKbFmkRujKH+
        r+YZGpmpBotCu6G1KjbUd8OaC7opFiOjxzygN0tcKlomn/80U23ZP18rLgK0w4t550aIgN
        jHd1GSjM5rrNfyeFi3RTFyrvDTVcj8A=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Henrik Grimler <henrik@grimler.se>
To:     Peter Griffin <peter.griffin@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Maksym Holovach <maksym.holovach.an.2022@lpnu.ua>,
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
Subject: Re: [PATCH v2 00/20] Add minimal Tensor/GS101 SoC support and
 Oriole/Pixel6 board
Message-ID: <ZUkB6yVyxEmldVPs@samsung-a5>
References: <20231010224928.2296997-1-peter.griffin@linaro.org>
 <3d489d6c-2098-4f0c-9ec4-f6040665753e@lpnu.ua>
 <CADrjBPp+fyNoPdix6=Wp4cDCRFq2Mui8NS6WENejcHn+H1M-jA@mail.gmail.com>
 <48e1c0bd-9518-4927-b490-f3206256bbd4@lpnu.ua>
 <c0b8f356-0f26-459d-850d-ec0fa1fd3987@linaro.org>
 <CADrjBPqXQa0ZhM3YFToH5kZcOU27ZuSajm-gj5mWybGTRM++-Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADrjBPqXQa0ZhM3YFToH5kZcOU27ZuSajm-gj5mWybGTRM++-Q@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi all,

On Mon, Nov 06, 2023 at 01:36:24PM +0000, Peter Griffin wrote:
> Hi Krzysztof,
> 
> On Fri, 3 Nov 2023 at 14:49, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
> >
> > On 03/11/2023 14:56, Maksym Holovach wrote:
> > > Hi Peter,
> > >
> > > On 11/3/23 15:11, Peter Griffin wrote:
> > >> Hi Maksym,
> > >>
> > >> Thanks for your feedback.

[ ... ]

> > >> I guess the same is also true for `axis,artpec8` and `tesla,fsd` SoCs.
> > >> IMO the SoC compatible string should be uniquely identifying the actual
> > >> SoC, not a close relative.
> > >>
> > >> Regarding product_id you are correct this reads 0x09845000 but even
> > >> within Samsung Exynos family there are examples where the register
> > >> value does not match the SoC compatible. For example Exynos850 SoC
> > >> has a product ID value of "E3830". Where the Linux compatible is
> > >> matching the Samsung marketing name, not the internal/outdated name.
> > >
> > > I did not know Exynos 850 is also not going under it's real name.
> > > Ultimately, I believe all of those SoCs should go under their technical
> > > name in the exynos/ directory.
> >
> > The initial technical name does not exist outside of vendor sources and
> > part name. E.g. Winlink E850 board hardware manual calls it:
> > "Samsung Exynos 850, S5E3830"
> > and everywhere else Exynos 850 SoC is used.
> >
> > If you start calling it Exynos 3830, only me and Sam (who mainlined it)
> > would know what is it. Everyone else, all users of kernel, would be
> > confused.
> >
> > Therefore using well known final product name is for Exynos850 reasonable.
> 
> I agree that was the correct decision IMO, and it is a very similar
> situation here
> as far as I'm concerned. Most people don't know Tensor G1 SoC as Exynos
> 9845.

I am not sure if Exynos 3830 and the like would be *that* confusing to
users. It does not seem like the internal names (like Exynos 3830) are
well guarded secret. The wikipedia article for Exynos even sort of
gives these names for recent Exynos models, Exynos 850 is called
S5E3830 for example, see section for Exynos 800:
https://en.wikipedia.org/wiki/Exynos#Exynos_800_series

Exynos 9845/S5E9845 is not mentioned in the article though.

[ ... ]

> > > Another concern is that Google could in the future license other SoC: be
> > > it Qualcomm, Nvidia or anything. If we put completely different hw under
> > > google/ directory, does it really make sense? In that case, who'll
> > > maintain the google/ directory? Exynos people? Qualcomm people if they
> > > license it? Some other people?
> >
> > That's indeed a problem. Future Tesla SoC might have just few pieces
> > similar to FSD. There would be no common SoC part, except the actual
> > Tesla IP.
> >
> > Same for Google. Future GSXXX, if done by Qualcomm, will be absolutely
> > different than GS101 and the only common part would be the TPU (Tensor).
> 
> There is more Google IP than TPU but I see the point you're making.
> 
> >
> > So now let's decide what is the common denominator:
> > 1. Core SoC architecture, like buses, pinctrl, clocks, timers, serial,
> > and many IP blocks, which constitute 95% of Devicetree bindings and drivers,
> > 2. The one, big piece made by Samsung's customer: TPU, NPU or whatever.
> 
> Or multiple big pieces of IP.
> 
> Does having it all under the exynos directory help you somehow with
> maintenance? Has having Alim maintain tesla-fsd in a separate directory
> caused issues?
> 
> I structured it like this as I thought it would scale better, and also
> because it was
> consistent with what you had accepted previously for other Exynos derived SoCs
> like Tesla.

Another small benefit of putting GS101 in exynos/ is that it makes it
easier for future contributors to find the code. If someone is for
example trying to add mainline support for their Samsung Galaxy S21
(Exynos 2100/Exynos 9840) and want to find somewhat related boards to
draw inspiration from then it is not clear at a first glance that
google/gs101-* are (somewhat) related.

[ ... ]

> Thanks,
> 
> Peter.

Best regards,
Henrik Grimler
