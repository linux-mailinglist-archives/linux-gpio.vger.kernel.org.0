Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 761E539EA0E
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Jun 2021 01:22:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230319AbhFGXYn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Jun 2021 19:24:43 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:56549 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230237AbhFGXYm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Jun 2021 19:24:42 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.nyi.internal (Postfix) with ESMTP id 28BCB5803A8;
        Mon,  7 Jun 2021 19:22:50 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
  by compute2.internal (MEProxy); Mon, 07 Jun 2021 19:22:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm3; bh=QICwXEloCx6aw2/RCotid55ESt9TMAU
        7Fh6aVjperoc=; b=Qc0M7i9qAyYrzxXWgXuC95IXot+t6pTavyAWIdEeKVrFCUY
        RKtyVKM6aYP32csgFYUEIOZO6Pi97kYKTIlAWwljoB5/UlOe97YGZ2AmZpKAwCt9
        5qq56pefkTWmU7KGJ2ZAZrfQiBYOUrhhu1dE229jgPB4sHgjOOV71qZctGncC+LC
        HeGf2FLzT8EWS/Wrdwc264HZJp32Qcpj7RMJRg3ZE+s5fc3h9zpQ4YAuulEGEgpJ
        /RO6CUI20XVW/pVtGMonfL/odnniSNc7i7QIaOhSnkGp/8IOIX2c1HvHUg1n6Qxo
        lkFpsYGzxw0V8pGLnaGRT4zYJKm66DPfwh+WYJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=QICwXE
        loCx6aw2/RCotid55ESt9TMAU7Fh6aVjperoc=; b=ubFTo3by9lSkT2+k7Fhzzt
        TX6lstx2njF6lqoexmHlcHwL601VjcpdSJKJi5RXvxcy3V5RbvuJk9Lb0wVF94Mg
        FkiROCrcliDuWinqknBv83XCq1vjP04hwadCXtwcnEllpYQoZ5kJXM/gntcWtpiu
        HAvO25XT7KK3jbv6y/GUh7Bc0agjk7mlYEDVC5OwdPHonaZCReU+aEO23cAZ6FWF
        1Mi8k7UFYzhg7lkGYbfKFe7TvJRywOz2l3Y05P5CN3nC2DCHrPaYDdQRohUX6p5t
        OnixvDrn6DdMCOuzmDKz0o9kjy+1jjLyprqkDz2lE7NErcrwziJ7/9rz/8VRXnlA
        ==
X-ME-Sender: <xms:R6q-YMo-JJfZP-iql89XEhlPDyMPh6gAwAj6YcDCSnPrwuSRxHGLPA>
    <xme:R6q-YCpUBkETy0EM1nQn8EXJQiMR13To0TX8bjFwOKYqdk_JGpHoJ01Lo1wDFbLn0
    rRoZb1W-z2QAc8Z8g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedtkedguddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
    grthhtvghrnhepuddttdekueeggedvtddtueekiedutdfguedutdefieeuteefieelteet
    vddthfeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:R6q-YBPqZ1lazXFrW8PmanqwwsBTsPNw9C5km0c0eKsczulqoeNRKg>
    <xmx:R6q-YD4o8_XdUnH1u1ykjxToir9lzpaiwD2F591RXcQfr94jYSJNmw>
    <xmx:R6q-YL6aG0jp2HljAXfFVxhxyQJ1Cuf7UMw85czeJ3Cv9iiRC4niVQ>
    <xmx:Sqq-YIxYtnS-BsfMWXfDqPIIYKzY4sSNrGqKWCvTbm_RWh4ujtdD2g>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 27546AC0062; Mon,  7 Jun 2021 19:22:47 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-519-g27a961944e-fm-20210531.001-g27a96194
Mime-Version: 1.0
Message-Id: <578c8522-a182-427f-8587-746fc8ec93d5@www.fastmail.com>
In-Reply-To: <20210607071514.11727-3-steven_lee@aspeedtech.com>
References: <20210607071514.11727-1-steven_lee@aspeedtech.com>
 <20210607071514.11727-3-steven_lee@aspeedtech.com>
Date:   Tue, 08 Jun 2021 08:52:26 +0930
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Steven Lee" <steven_lee@aspeedtech.com>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        "Bartosz Golaszewski" <bgolaszewski@baylibre.com>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Joel Stanley" <joel@jms.id.au>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        "open list" <linux-kernel@vger.kernel.org>
Cc:     "Hongwei Zhang" <Hongweiz@ami.com>,
        "Ryan Chen" <ryan_chen@aspeedtech.com>,
        "Billy Tsai" <billy_tsai@aspeedtech.com>
Subject: =?UTF-8?Q?Re:_[PATCH_v4_2/7]_dt-bindings:_aspeed-sgpio:_Add_ast2600_sgpi?=
 =?UTF-8?Q?o_compatibles.?=
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Mon, 7 Jun 2021, at 16:45, Steven Lee wrote:
> AST2600 SoC has 2 SGPIO master interfaces one with 128 pins another one
> with 80 pins. Add ast2600-sgpiom0-80 and ast2600-sgpiom-128 compatibles
> and update descriptions to introduce the max number of available gpio
> pins that AST2600 supported.
> 
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
