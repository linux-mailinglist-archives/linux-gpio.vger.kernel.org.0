Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 591327C4E3F
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 11:11:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230454AbjJKJLb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 05:11:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230437AbjJKJLb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 05:11:31 -0400
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com [66.111.4.224])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 835DA94;
        Wed, 11 Oct 2023 02:11:28 -0700 (PDT)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
        by mailnew.nyi.internal (Postfix) with ESMTP id C202B580226;
        Wed, 11 Oct 2023 05:11:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Wed, 11 Oct 2023 05:11:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
        :cc:content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1697015487; x=1697022687; bh=tK
        JZwlG7RmKymCLeNieFghypwABVyjCkdJ+rHglNrlU=; b=NRH9aGZmEJsDwBIast
        gvUoPMiKmxr6No6l1TX8cL4zzlFQH3y3fkryOwohsVaRgAnpUCj0sF820kty6njk
        O/h0q+QcnAiuJbqFht6+VNAgs0xf18S75mGQ56DGk0zVelGW3Dcb/+VG4a4vmInV
        BkSccpZwTBG/oSKAB8Eed8/7qJcznife01Nx7jCuGll8uxixqLVJqoIaNAx9cbvc
        ogQ78MEObkqWipKn0YGgSKFKX4hJUbLhDkcYkDKXOW2lZOkSL7KkSc6YPoJVVCd+
        P2FOdUeFJGN4GaUhOMKa/0adY7UswExXGJSr+MSL3/kxdNR3PFQUux8NXTdp6hwd
        nNxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1697015487; x=1697022687; bh=tKJZwlG7RmKym
        CLeNieFghypwABVyjCkdJ+rHglNrlU=; b=ZM2wOK2vsFsKmckbrlPiaIvISb3Hu
        6Ydfa1iu9yvsl1Ug9aT4a4ycsL2/ShCIIT83Q1SgrwVKbUCqVgZ+j2Oo7HPnTw1y
        GGb7Rmlf5M5/VQ1YHa2MdY4cjbzuBsEk5ao4uJc1Oe/0UlErI1rzwTCFXyAco8ia
        zb5uqYjxEF8bvPgZWSagqVs8uJO+x64j+wK2uEE55DMH6EPPo17NrHsgNtTWbKUi
        wlUOySumcsul8eUoalqz2cFnpqXKcqHgTt33AJVFhxu+dF6xVUGZebdl2WkQ4mrb
        kyfF9xFrJ0Hnx1UBeKCZ5JiP+ANdzLNgqk1o+vW9KgrIR6UA0eGEXKk0w==
X-ME-Sender: <xms:vmYmZXgx5MdgJoSlHm_z4qEuZjm4oXkMcIF4uX5jXN7vVmVXx-ObkQ>
    <xme:vmYmZUD8MBOzTiHvHq9PVNqvFptyjNRqys7G45gr0aAUYGPrW8IRo2vMA0-m4N97I
    af7ZstGOTKUKA>
X-ME-Received: <xmr:vmYmZXE_3TD9EOJ4_zVTiKV1gXBHEivWgAF8v06k-X9IwxyNYSLtK-1kGeyc2-eL8PSgcDkGQtcefUXlFVNFMKrNu3oOAgwjilB12Gc9qgI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrheekgddutdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeegheeuhe
    fgtdeluddtleekfeegjeetgeeikeehfeduieffvddufeefleevtddtvdenucffohhmrghi
    nhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:vmYmZUT1QlR8UJG5jUm7t4RZu8Kq4IrBisUdt_6L3hCUk-X5YUIEWg>
    <xmx:vmYmZUxK0Vcdf4v3DLzDA5xNkYAjdKM_gvLakEzJ-OE22Ngm737BkA>
    <xmx:vmYmZa6G01Nh0HxRYtcenfKac3i32DkUaw7dPTX1fjTcISeeQVRemg>
    <xmx:v2YmZcNeCr4sC70JPEN_3kXoHds4V9TC9vT2OmEUoQwDDcYWI-wFVg>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 Oct 2023 05:11:25 -0400 (EDT)
Date:   Wed, 11 Oct 2023 11:11:22 +0200
From:   Greg KH <greg@kroah.com>
To:     Peter Griffin <peter.griffin@linaro.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
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
        kernel-team@android.com, linux-serial@vger.kernel.org
Subject: Re: [PATCH v2 00/20] Add minimal Tensor/GS101 SoC support and
 Oriole/Pixel6 board
Message-ID: <2023101139-skinless-lash-b777@gregkh>
References: <20231010224928.2296997-1-peter.griffin@linaro.org>
 <2023101101-mauve-underarm-1b48@gregkh>
 <CADrjBPr2UAfpuuw6M8T5UaiTmCYz0e3jabfDCcUJtH+35mwBKw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADrjBPr2UAfpuuw6M8T5UaiTmCYz0e3jabfDCcUJtH+35mwBKw@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 11, 2023 at 10:06:18AM +0100, Peter Griffin wrote:
> Hi Greg,
> 
> Thanks for your reply!
> 
> On Wed, 11 Oct 2023 at 08:44, Greg KH <greg@kroah.com> wrote:
> >
> > On Tue, Oct 10, 2023 at 11:49:08PM +0100, Peter Griffin wrote:
> > > Hi folks,
> > >
> > > Firstly, thanks to everyone who reviewed the v1 series! V2 incorporates all
> > > the review feedback received so far.
> > >
> > > This series adds initial SoC support for the GS101 SoC and also initial board
> > > support for Pixel 6 phone (Oriole).
> > >
> > > The gs101 / Tensor SoC is also used in Pixel6a (bluejay) and Pixel 6 Pro
> > > (raven) phones. Currently DT is added for the gs101 SoC and Oriole.
> > > As you can see from the patches the SoC is based on a Samsung Exynos SoC,
> > > and therefore lots of the low level Exynos drivers can be re-used.
> > >
> > > The support added in this series consists of:
> > > * cpus
> > > * pinctrl
> > > * some CCF implementation
> > > * watchdog
> > > * uart
> > > * gpio
> >
> > So you have sent a patch series that crosses multiple subsystems, who is
> > supposed to be taking these patches?  Or do you not want them actually
> > merged?
> 
> Krzysztof indicated here:
> https://lore.kernel.org/all/b1598405-b01f-426a-aaba-89f2d2dc9c2e@linaro.org/
> that he would like to be the one applying the entire series through the Samsung
> SoC tree. If that's fine with everyone (it's OK with me).

As the serial changes are not ok (see my comments on them), I don't
think they should be going through any tree at this point in time :)

Also, in your 00/XX email, say what tree you expect them to go through
so we have a chance to know that please.

thanks,

greg k-h
