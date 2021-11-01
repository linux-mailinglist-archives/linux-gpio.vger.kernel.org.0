Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4578944120F
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Nov 2021 03:07:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230234AbhKACKH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 31 Oct 2021 22:10:07 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:34847 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230233AbhKACKG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 31 Oct 2021 22:10:06 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.nyi.internal (Postfix) with ESMTP id 4A4EF58088F;
        Sun, 31 Oct 2021 22:07:33 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
  by compute2.internal (MEProxy); Sun, 31 Oct 2021 22:07:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm1; bh=2Pa73OCvVZ6FCpJAmxpXhiTTNaL3ZPO
        i42kibXrMVvU=; b=Y9IbCLdROcwxWh1jDIoWKOIyGdzPYLLFSM8DiXhlY5C5i+M
        nOyktCddU5Ej8L2A/jJn37BDVcS1LMmiZffFrtLS6cOFIIQbZjZzWL/80ZhS++4T
        3Q14H2K9062jHz4Z0FkHseHNMup9iNYPf1n5AjotDwNBSu618pxcr7QWHfrv7XAq
        H7K/S0XrsWtiQ+982qdYcqHsXpgdd5Bw684eFz1nkGoivX/zGdHz00LeYFVUMamb
        GHgHIIENIzKW802c6FVx1eLW55nGtJZWtVHK1VhMf9AOpA2IJlqp/j7GJ5CPftDt
        k2V4TLFVXeQLJget719SHfSCEAN/Glg6aTYs5TQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=2Pa73O
        CvVZ6FCpJAmxpXhiTTNaL3ZPOi42kibXrMVvU=; b=mKTIx7Ol1+aVcifYxXZ+x2
        HD+uOVKdjBkLLMTitUMMJ4xYu1ygA1N9IISW+MLLc7AVxLF8FxqK3/neNdQqrnfj
        vqWC5gLZYq87VZOUDZc2TqmH7uT6Rmo25uy1JkfmwHGcnq+AWFHQwGjxMitgJF4R
        uSfsr1DhHnbzKchkrsT5Pn6D3AocvA8ns6yj3rygn9Ug74dF+NqA3teenKvF72aJ
        GgyXpYC0ho5+zaVfiPqKmX07CK/6yaaN83Bz7HPq50etyy5n3BXZWoSkbBs0okFP
        oCLpyyLCgZt7/Jaq6eFZFpIGWtwn8jQlLvzEgDbNSqcqnJHzgRbb1jmDZrMMaSWA
        ==
X-ME-Sender: <xms:5Et_YdPm6QH7dx4vDb35FH-wCwJgzZzm12PvOBwB138nF35fYTK7sg>
    <xme:5Et_Yf_1cgLDUC0cTNh7jop3rslHPh1hiMpVBl1X-wxyI_4iUYtW4Qd3pQbAYDEgC
    FjKQOSlfKsEgANA6Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdehuddggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
    grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
    hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:5Et_YcQvajSpH6r7M6_zHZpXIhPJdbXwTNu6F0StI1ndz_tT5CAZ_A>
    <xmx:5Et_YZvas_3AhWKqW939XzQBkWIh_j5XIPL0xJdc1pQzoQKh8EiVFQ>
    <xmx:5Et_YVcaI8ndX8KHSAm5EhODaHTLHaAvtxRYBSk85qAEJKNAmD-Qgg>
    <xmx:5Ut_YR7YsB3Qz0epng1dL9bcEaIeXz2nfq9Dr5LGDxTJ3OPcSFleYQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id EC830AC0DD1; Sun, 31 Oct 2021 22:07:31 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1369-gd055fb5e7c-fm-20211018.002-gd055fb5e
Mime-Version: 1.0
Message-Id: <ea912be8-ad2d-4332-97b4-5626b19eac5f@www.fastmail.com>
In-Reply-To: <20210921043936.468001-2-andrew@aj.id.au>
References: <20210921043936.468001-1-andrew@aj.id.au>
 <20210921043936.468001-2-andrew@aj.id.au>
Date:   Mon, 01 Nov 2021 12:37:11 +1030
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     linux-leds@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Joel Stanley" <joel@jms.id.au>, "Pavel Machek" <pavel@ucw.cz>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        "Andy Shevchenko" <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 1/2] leds: pca955x: Make the gpiochip always expose all pins
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 21 Sep 2021, at 14:09, Andrew Jeffery wrote:
> The devicetree binding allows specifying which pins are GPIO vs LED.
> Limiting the instantiated gpiochip to just these pins as the driver
> currently does requires an arbitrary mapping between pins and GPIOs, but
> such a mapping is not implemented by the driver. As a result,
> specifying GPIOs in such a way that they don't map 1-to-1 to pin indexes
> does not function as expected.
>
> Establishing such a mapping is more complex than not and even if we did,
> doing so leads to a slightly hairy userspace experience as the behaviour
> of the PCA955x gpiochip would depend on how the pins are assigned in the
> devicetree. Instead, always expose all pins via the gpiochip to provide
> a stable interface and track which pins are in use.
>
> Specifying a pin as `type = <PCA955X_TYPE_GPIO>;` in the devicetree
> becomes a no-op.
>
> I've assessed the impact of this change by looking through all of the
> affected devicetrees as of the tag leds-5.15-rc1:
>
> ```
> $ git grep -l 'pca955[0123]' $(find . -name dts -type d)
> arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
> arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts
> arch/arm/boot/dts/aspeed-bmc-opp-mowgli.dts
> arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
> arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> ```
>
> These are all IBM-associated platforms. I've analysed both the
> devicetrees and schematics where necessary to determine whether any
> systems hit the hazard of the current broken behaviour. For the most
> part, the systems specify the pins as either all LEDs or all GPIOs, or
> at least do so in a way such that the broken behaviour isn't exposed.
>
> The main counter-point to this observation is the Everest system whose
> devicetree describes a large number of PCA955x devices and in some cases
> has pin assignments that hit the hazard. However, there does not seem to
> be any use of the affected GPIOs in the userspace associated with
> Everest.
>
> Regardless, any use of the hazardous GPIOs in Everest is already broken,
> so let's fix the interface and then fix any already broken userspace
> with it.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Hello LED maintainers,

Just checking in on the state of this as it hasn't appeared in for-next.

Andrew
