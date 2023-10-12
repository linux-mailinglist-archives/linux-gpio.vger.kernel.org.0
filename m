Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 233F87C6519
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Oct 2023 08:07:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347055AbjJLGHp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Oct 2023 02:07:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232786AbjJLGHp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Oct 2023 02:07:45 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EEC8A9;
        Wed, 11 Oct 2023 23:07:43 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 0BBF95C029F;
        Thu, 12 Oct 2023 02:07:40 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Thu, 12 Oct 2023 02:07:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1697090860; x=1697177260; bh=aU
        +SwGF3D8irJzbJ0XYZdXz2nuYhoW1FhSN9OYu/qZw=; b=qFg5oooM+mQN2i04VE
        XTEA/XCGavynglnQzBxjXl+adadKDGYGTffRzmDIYS0zJ7QVtnVe+K+Nlbiz3i5q
        wntkaoLbg5awW5r4lueh2xnO/jVu/tMxEGFWq9pCzwzgKTXTYbE2r5EAzj+Mvzxh
        DRFRAeA4Cavd96BgYWY9faT18rQZ4sIZ5Gt4iOnT1bG8C8LXMD59UKIVueZuRs66
        6fSquMXWeOtZ18c6lMwa4BbhW5CWbrUEsu6WY7jtNQ4lTvvbHQrPGqhXGKdhGkZg
        NJgHpsiJN5aOzeP1giGIpf2oPUhz9lk2kGe/TL088B5WCkYeM2IaZv9UqL2tBJXc
        9q2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1697090860; x=1697177260; bh=aU+SwGF3D8irJ
        zbJ0XYZdXz2nuYhoW1FhSN9OYu/qZw=; b=M/QWXTAwvAuw7KcvGOxlDK+qPW0uz
        uRx4oY9zl88YWsIQuzUoOewHDY5J52Kw6cPUDivUe88+frNhtG7bTp0h4Lx0Eyej
        XmNIvvCMyHxo6ETN0GsVkeuEAOsixdJ9nUTj6OF/AM4ehh+lPvpke1SXmCkDg4B8
        LVhoinUKebgCNpaHXDys+nu7CkxENWwwu0+LrfiLU4rIZ+2NtSGyUYXhTwT7DpPD
        7aIgm7tztMVZs+6d/LqocfT9J2SvXLSx4gCb5sDCOImNC4PCCMtk//Gel4SREOC8
        4xZTVNprKRKYeC4zISz+w7qkrKq31IJsxDX201RSfM59MyMciQ/iv1b8w==
X-ME-Sender: <xms:K40nZQLaRXsVM90Qxyo0jM_y3TsuihL4DRc917nySxruJI5FyPTFrQ>
    <xme:K40nZQK7aTyqqwY01Yi8oxXvRzekX5Xu1MbjZjPjhdy4PeW5RhaseccfsZrZ0rivC
    5GYFj01x7yt2E6Ldrw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrheelgddutdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:K40nZQvEQNDCQYq4caXMHtCLm0roe7pCMmqlnYP3EpGmNIzPVNVKKg>
    <xmx:K40nZdbGvGRICocFpuA-k-fg7Y0hCQ2456IOk09ff7sFbuDs9jC5Og>
    <xmx:K40nZXaxkJyOwqwbjJFHmTq9mRplrgLEsoW9DHf9TDIVZ6EhjMLfxw>
    <xmx:LI0nZVZkm3ptp8gOSDu7fFjuZ3HfqcoBeQZNYd1bWWymPo4wJbJBXA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 2B043B6008D; Thu, 12 Oct 2023 02:07:39 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1019-ged83ad8595-fm-20231002.001-ged83ad85
MIME-Version: 1.0
Message-Id: <eca9feea-b4a6-438c-83c7-452e8fe388c6@app.fastmail.com>
In-Reply-To: <20231011184823.443959-17-peter.griffin@linaro.org>
References: <20231011184823.443959-1-peter.griffin@linaro.org>
 <20231011184823.443959-17-peter.griffin@linaro.org>
Date:   Thu, 12 Oct 2023 08:07:18 +0200
From:   "Arnd Bergmann" <arnd@arndb.de>
To:     "Peter Griffin" <peter.griffin@linaro.org>,
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
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        "Chanwoo Choi" <cw00.choi@samsung.com>
Cc:     "Tudor Ambarus" <tudor.ambarus@linaro.org>,
        andre.draszik@linaro.org,
        "Sam Protsenko" <semen.protsenko@linaro.org>, saravanak@google.com,
        "William McVicker" <willmcvicker@google.com>, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-watchdog@vger.kernel.org, kernel-team@android.com,
        linux-serial@vger.kernel.org
Subject: Re: [PATCH v3 16/20] tty: serial: samsung: Add gs101 compatible and SoC data
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 11, 2023, at 20:48, Peter Griffin wrote:
> Add serial driver data for Google Tensor gs101 SoC.
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

While the patch is now correct, I would point out a few
improvements we could make on top:

> +static const struct s3c24xx_serial_drv_data gs101_serial_drv_data = {
> +	EXYNOS_COMMON_SERIAL_DRV_DATA(),
> +	/* rely on samsung,uart-fifosize DT property for fifosize */
> +	.fifosize = { 0 },
> +};
> +
>  #define EXYNOS4210_SERIAL_DRV_DATA (&exynos4210_serial_drv_data)
>  #define EXYNOS5433_SERIAL_DRV_DATA (&exynos5433_serial_drv_data)
>  #define EXYNOS850_SERIAL_DRV_DATA (&exynos850_serial_drv_data)
> +#define GS101_SERIAL_DRV_DATA (&gs101_serial_drv_data)

Since this is now actually correct for any Exynos variant that
has the FIFO size listed in the DT, we could use a variable/macro
name that leads itself to being used by future chips.

There is also the question of whether we want to address the
ordering bug for the other SoC types. The way I understand it,
the .fifosize array logic is wrong because it relies on having
a particular alias for each of the ports to match the entry in
the array. For the exynosautov9, this would be trivially fixed
by using the same data as gs101 (since it already lists the
correct size in DT), but for the other ones we'd need a different
logic.

> @@ -2688,6 +2696,9 @@ static const struct platform_device_id 
> s3c24xx_serial_driver_ids[] = {
>  	}, {
>  		.name		= "artpec8-uart",
>  		.driver_data	= (kernel_ulong_t)ARTPEC8_SERIAL_DRV_DATA,
> +	}, {
> +		.name		= "gs101-uart",
> +		.driver_data	= (kernel_ulong_t)GS101_SERIAL_DRV_DATA,
>  	},
>  	{ },
>  };

I just noticed that the platform_device_id array is currently
only used for mach-crag6410, since everything else uses DT
based probing. s3c64xx is scheduled for removal in early 2024
(though no patch has been sent), and we can probably just
remove all the atags/platform_device based code when that happens.

      Arnd
