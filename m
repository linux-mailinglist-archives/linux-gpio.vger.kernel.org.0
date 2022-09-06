Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 164775AED03
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Sep 2022 16:30:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240718AbiIFN6O (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Sep 2022 09:58:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239839AbiIFN4N (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Sep 2022 09:56:13 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CD6082769;
        Tue,  6 Sep 2022 06:42:06 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id AC4CF5C00E9;
        Tue,  6 Sep 2022 09:40:59 -0400 (EDT)
Received: from imap47 ([10.202.2.97])
  by compute2.internal (MEProxy); Tue, 06 Sep 2022 09:40:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
         h=cc:cc:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1662471659; x=1662558059; bh=hm
        ETg07QBgLYqlBFCF6cd3D9OyAgefzmdWPH2ymqdXY=; b=lV8m4FUPjwTcqUKp3U
        l4KWUYHpKC6ES/Oq0YirqpysOvejJZfD3Wz6DxDIUOKxPiwEDhP7a+pXVlmawgsT
        J860vB57TaSym/SyTxU7BGLieTzgT0pELqeIXR0VWPnSmYHOKfhmznAlmgnRNpd/
        Buitv9ZOp8kBwnKJNmNqO04QS8aEEm/nZ8+4akq03Rvg4w4GPmx9RsxGUQjDptEc
        8x/gEUJHYNQGEt+7EkAQFt7DB6XrGSb1QGheBUVd0R67O7BrulvTIVdssF6k4I9O
        i+6sp1vHLoVWoLg2CDeFzrSWOiuRy/YSsVSSt2x4miXhFOfCoQHGYZscuy2dl2O7
        3Eyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; t=1662471659; x=1662558059; bh=hmETg07QBgLYqlBFCF6cd3D9OyAg
        efzmdWPH2ymqdXY=; b=AP/PvmR3Hdlpkt/At17981fk8jOoa6E73FsspiH7v6vo
        4qkBw4lsatebD/D0axYsVgysWva+U351FElef+B+0lvZ9zw65HIYdOr3lBYqe84s
        Cmk5ShwkBoTCyQsxcqgNzg5FFdCuzKqoz355xUGvURYHC+RfA5cQ+vuLg5tJzG8w
        oq66yEVNgXeHLKKKAGnCAs4pXYYukWW5+0N6yB2uD8R8ePfc9shLlOHXF/sFS9nk
        MPgu8wSxlFiATBfvKMU/Vd3EARiHJiNpDrNkFgY4pXJITOgVfOWABUBDoQuenJo0
        59qds2cS9HnqF3Kicm62f+8wZqhDO94SrXF7kodOkQ==
X-ME-Sender: <xms:600XY5-2t4VhvHbbK-jL20auEqw4s-9BztI79RxZ4Mb94iGGhU4zNQ>
    <xme:600XY9u31YFVNHkOvvFh_07MWWDVVmSaZrSCB55JMamV8q-InFfK_dyeJppwk2hIZ
    Nch5KgjG8q5jubfjKc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdelkedgieekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedfufhv
    vghnucfrvghtvghrfdcuoehsvhgvnhesshhvvghnphgvthgvrhdruggvvheqnecuggftrf
    grthhtvghrnhepleevgfegffehvedtieevhfekheeftedtjeetudevieehveevieelgffh
    ieevieeunecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
    epshhvvghnsehsvhgvnhhpvghtvghrrdguvghv
X-ME-Proxy: <xmx:600XY3BicqoeZyVc9qTSYqAGeF_PziCDHlOw2iS7hBBxkTzDckTxBw>
    <xmx:600XY9f1R3tvPMaV6cAIE4W-0z5tAMmUr3NI8-91VEuo1-_kDFi-pw>
    <xmx:600XY-Oa-nQtFytXvomr4NCsU2QDWL8_n1bOtKl7z52zg2zShgzJWA>
    <xmx:600XYzzHSxkVE1hzNCd5y4jppskJFR8oXv2KyvyGMkeX9YYvJjUWIg>
Feedback-ID: i51094778:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 70B06A6007C; Tue,  6 Sep 2022 09:40:59 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-927-gf4c98c8499-fm-20220826.002-gf4c98c84
Mime-Version: 1.0
Message-Id: <a6e62126-46cb-4c83-8a50-5c57e67b49eb@www.fastmail.com>
In-Reply-To: <E1oVYUc-005Cme-SM@rmk-PC.armlinux.org.uk>
References: <YxdInl2qzQWM+3bs@shell.armlinux.org.uk>
 <E1oVYUc-005Cme-SM@rmk-PC.armlinux.org.uk>
Date:   Tue, 06 Sep 2022 15:40:38 +0200
From:   "Sven Peter" <sven@svenpeter.dev>
To:     "Russell King" <rmk+kernel@armlinux.org.uk>,
        "Arnd Bergmann" <arnd@arndb.de>, "Lee Jones" <lee@kernel.org>,
        "Linus Walleij" <linus.walleij@linaro.org>
Cc:     "Alyssa Rosenzweig" <alyssa@rosenzweig.io>,
        "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
        asahi@lists.linux.dev, "Bartosz Golaszewski" <brgl@bgdev.pl>,
        devicetree@vger.kernel.org, "Hector Martin" <marcan@marcan.st>,
        "Jonathan Corbet" <corbet@lwn.net>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "Petr Mladek" <pmladek@suse.com>,
        "Rasmus Villemoes" <linux@rasmusvillemoes.dk>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Sergey Senozhatsky" <senozhatsky@chromium.org>,
        "Steven Rostedt" <rostedt@goodmis.org>
Subject: Re: [PATCH 6/7] gpio: Add new gpio-macsmc driver for Apple Macs
Content-Type: text/plain
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Tue, Sep 6, 2022, at 15:19, Russell King wrote:
> From: Hector Martin <marcan@marcan.st>
>
> This driver implements the GPIO service on top of the SMC framework
> on Apple Mac machines. In particular, these are the GPIOs present in the
> PMU IC which are used to control power to certain on-board devices.
>
> Although the underlying hardware supports various pin config settings
> (input/output, open drain, etc.), this driver does not implement that
> functionality and leaves it up to the firmware to configure things
> properly. We also don't yet support interrupts/events. This is
> sufficient for device power control, which is the only thing we need to
> support at this point. More features will be implemented when needed.
>
> To our knowledge, only Apple Silicon Macs implement this SMC feature.
>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Sven Peter <sven@svenpeter.dev>
