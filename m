Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8FE97BB37D
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Oct 2023 10:49:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231228AbjJFIta (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Oct 2023 04:49:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230434AbjJFIt3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Oct 2023 04:49:29 -0400
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E142B83;
        Fri,  6 Oct 2023 01:49:27 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 553463200B27;
        Fri,  6 Oct 2023 04:49:22 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Fri, 06 Oct 2023 04:49:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1696582161; x=1696668561; bh=fq
        7jUTQDYY98nWZgnWeYl6Cagk6XWBLFE67pLot1gWo=; b=kBZzKMgJZsyJhJ4jkw
        jQU20dAsOX6gV5+9PEwOC6EDKw7Yrab03w7x2jeKDOi5U8sb/zmQ8Do9RTmngNC8
        yW1XTJd1bUm/rTmNlB9F9TExc3icsyP1glN07DJTwfqW+FzA7E339NrTeU5sRc/L
        n3VnfG7n+yfSNcSvAHPhilUJEguUWvbqXhCccmjZaMBvxEY4yFK+ZSL9Gp0LtFha
        cZ0A9UoKYcf32ekNsano2pLPsmc54RzW/g3tPBuRro7L3uPt90fH3hIN8BzDhNze
        p9rH9D8bX843QRBOTm7lQAd41lszXDeeJikGphg72AEiyROyBJHPvmCE3IgtC1B8
        I8xw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1696582161; x=1696668561; bh=fq7jUTQDYY98n
        WZgnWeYl6Cagk6XWBLFE67pLot1gWo=; b=Z9wduYnbaSjO4hO9z4ThmB4lkJ+ww
        qv48JvZetC68Oy7Cwu1FZTuWCiNrKWgPVlC3WfLZq9CQAtRwtR+Hgmm5hm7ogHvR
        g0HhACHoO4MLD7fxHHWj2C3pZU6RASeeLf/9XyNP46PxJ9+Wl/0D6WC9DBYJNVUx
        mtNhY7IAXC9PqRSim+iZ7rzPLHV0BIft9I6alaUUj3XxUqUv5l7FauuYS80Rf78F
        T7iw5HeL/xcklmoBHAfAZMLxvFOyUulgeZzpl67xGf0yowfKAw8nWtTXzHAQ8HCE
        psBkN+QRkt9PJmeDlBFt3h9VAeNTcJJeZFH8l8liepztop+DKATVvf2XQ==
X-ME-Sender: <xms:EMofZT2i-9GISWVnjxgMhlfr_K0J1DDCikeZffdfaxxvS-c9ZvWmTA>
    <xme:EMofZSH-GDrTlbKrOc09JAu6xzst-K08JW-bRaweoc7LuQJp4GgEj665KOBjFQo1J
    Ga257VUxycRUUCsOyk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrgeeigddtjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:EMofZT4ywgzN7LkzmXzXPySCJeAKjukN8v43qGhqwxizLsQRUilCXg>
    <xmx:EMofZY2E3kF4qLgYpdHd4RbTBZENJnE3pcBjp3j1fIuAPC4cUrEcNA>
    <xmx:EMofZWHiFKv5E0Dvozm7fdb71mAiOQ7Sue59rxI-niu4_MbVJRdtNw>
    <xmx:EcofZZYKcoYBWJfaMLlaG0rL0xmTDuYDJQLE8dL3BH9l1IWy6uP6mQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id ABDB6B60089; Fri,  6 Oct 2023 04:49:20 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-958-g1b1b911df8-fm-20230927.002-g1b1b911d
MIME-Version: 1.0
Message-Id: <e8b23683-36ac-4547-9386-935a1b211d7d@app.fastmail.com>
In-Reply-To: <44816879-a3a7-4bd0-bb20-19a645107b4b@linaro.org>
References: <20231005155618.700312-1-peter.griffin@linaro.org>
 <20231005155618.700312-19-peter.griffin@linaro.org>
 <ZR75cIvnQS2cqTT3@google.com> <2023100520-cleaver-sinless-fbae@gregkh>
 <99419159-cab0-4c79-a4a0-12229bfad3c0@linaro.org>
 <2023100513-mashing-scrubber-ea59@gregkh>
 <efc9f099-9c97-460b-b0c8-9891aa3b772a@linaro.org>
 <ZR9EnFw3vB92vlYM@google.com>
 <44816879-a3a7-4bd0-bb20-19a645107b4b@linaro.org>
Date:   Fri, 06 Oct 2023 10:48:58 +0200
From:   "Arnd Bergmann" <arnd@arndb.de>
To:     "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
        "William McVicker" <willmcvicker@google.com>
Cc:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        "Peter Griffin" <peter.griffin@linaro.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        krzysztof.kozlowski+dt@linaro.org,
        "Michael Turquette" <mturquette@baylibre.com>,
        "Conor Dooley" <conor+dt@kernel.org>,
        "Stephen Boyd" <sboyd@kernel.org>,
        "Tomasz Figa" <tomasz.figa@gmail.com>,
        "Sylwester Nawrocki" <s.nawrocki@samsung.com>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        "Wim Van Sebroeck" <wim@linux-watchdog.org>,
        "Guenter Roeck" <linux@roeck-us.net>,
        "Catalin Marinas" <catalin.marinas@arm.com>,
        "Will Deacon" <will@kernel.org>, "Olof Johansson" <olof@lixom.net>,
        "Chanwoo Choi" <cw00.choi@samsung.com>,
        "Tudor Ambarus" <tudor.ambarus@linaro.org>,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        soc@kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-watchdog@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH 18/21] arm64: dts: google: Add initial Google gs101 SoC support
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 6, 2023, at 08:06, Krzysztof Kozlowski wrote:
> On 06/10/2023 01:19, William McVicker wrote:
>> On 10/05/2023, Krzysztof Kozlowski wrote:
>>> On 05/10/2023 21:23, Greg KH wrote:
>>
>> Being able to include SERIAL_SAMSUNG and SERIAL_MSM without all the vendor> specific drivers that ARCH_EXYNOS and ARCH_QCOM select is very
> valuable for
>> debugging early boot issues.
>
> Really? How related? The drivers are independent. You describe some
> out-of-tree development process which we never needed for upstream work.
> And we did here quite a lot of upstream, specially if you look at ARCH_QCOM.

Right: in general, all drivers are independent of the platform
besides the typical 'depends on ARCH_FOO || COMPILE_TEST' dependency,
but I think it's worth mentioning the known exceptions, so Greg and
Will can take that fight to the respective places rather than
discussing it in the platform submission:

- Some subsystems are considered 'special' and the maintainers
  prefer the drivers to be automatically selected based on the
  ARCH_* settings instead of having user-visible options. This is
  traditionally true for large chunks of drivers/irqchip,
  drivers/clocksource and drivers/pinctrl, though it has gotten
  better over time on all of them.

- Some older 32-bit platforms are still not as modular as we'd
  like them to be, especially the StrongARM (ARMv4) platforms that
  require a custom kernel build, and some of ARMv4T and ARMv5
  boards that are still missing DT support. These tend to require
  drivers they directly link to from board code, so disabling
  the drivers would cause a link failure until this gets
  cleaned up.

- A couple of drivers are force-enabled based on the ARCH_*
  options because booting without these drivers would risk
  permanent damage to hardware, e.g. in overtemp or overcurrent
  scenarios.

- ACPI based platforms require the PCI host bridge driver to
  be built-in rather than a loadable module because ACPI
  needs to probe PCI devices during early boot.

- Some subsystems (notably drivers/gpu/, but others as well)
  have an excessive number of 'select' statements, so you
  end up surprise-enabling a number of additional drivers
  and subsystems by enabling certain less important platform
  specific drivers.

      Arnd
