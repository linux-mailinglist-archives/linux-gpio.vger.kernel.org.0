Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93060119BB5
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Dec 2019 23:12:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728811AbfLJWK7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Dec 2019 17:10:59 -0500
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:58847 "EHLO
        wout1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728909AbfLJWK6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 10 Dec 2019 17:10:58 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 326DAF5A;
        Tue, 10 Dec 2019 17:10:57 -0500 (EST)
Received: from imap2 ([10.202.2.52])
  by compute4.internal (MEProxy); Tue, 10 Dec 2019 17:10:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm1; bh=iTzj/LXruarNxkB4mF+5qgnxYnni345
        HnB4zzW+dtao=; b=CeFET6SFvvOE8YyX5U34URQmorm1Zg3iCfE5rXF71XrLsVG
        giyMAGOcfVkLtVPHkfQNU1dCrua9wiUW9Np2OHESJiYHcc090vZyjEMIdEvkYxnn
        ZuYcMc7hmSP611btvl7KumhtA5vrmJwWtoMfLZuGLvseUMVk9kL16OmKjxXcgtVN
        MKmtwhlc6gP6P7hP3tNT1QNTg5quvUs6KpR466SRb51wv4XaEifDJJunVgPAgoZy
        ZepqZRxvMqx5TNoWdLacjk3E7vp5TwJdIpsnS5NzbCDQUHRxCGAfrO9LMHAZ34q2
        Y7MK+ct62tW0jBiaXpmVdDoWx7oRqQGydg8hLvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=iTzj/L
        XruarNxkB4mF+5qgnxYnni345HnB4zzW+dtao=; b=ipJwzUWJtdhmKRNun/ZAsR
        aMJ+C3uwPWPBTkCIeYbXdnP7phZ9WcW+P8DN8BVA1KwVrMQ23gTZkR2u//dwUCxe
        YroByIKLA3BfeSthfMMDPhhiE9938ISPW03bEr+VUMke1hA8K47MZwwjS5qjNgwC
        nZdTmoQIzW14j4XmYLjBHBky+x5jAkzDS1cMOWB+rRgQ4vfmemLCTZU/e0AJLNZ2
        KFpmbFSDFxraP8nqzlPITpvd8EHvk+CLYO3fpGbP71hSHvtwbZ5ryeddofpZ42Uy
        l3jzqHr0Vyg+x15g2PLwA+VNjsJO4BfQzCeKH1m/miWQiELGOZYdZ6fTK4JCKB0A
        ==
X-ME-Sender: <xms:7xfwXY-JogK4UnIVNCkzWFBVV5d4RmKSrOPzwzavIsixdDhUueZZtQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudelfedgudehjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrg
    hrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushht
    vghrufhiiigvpedt
X-ME-Proxy: <xmx:7xfwXcGiJxH3pF9WB_W9UqzemEHMu2DN__Qi5Gy42va_s7-oz1VoEw>
    <xmx:7xfwXb42G6oXpxQpY6OyGru9RkoJqIsfN-WL3b2U-5cmfkiK9-W4SQ>
    <xmx:7xfwXTmMCcNi4xGkFOcmkjHwUKL8BYE2o_l_yX-3sg2Wwm3pezufCA>
    <xmx:8BfwXbFv2yYn4A5iNzu1Uzqg1LES15xXThOEbQtiJxOt934a-ItNAQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 78AE2E00A2; Tue, 10 Dec 2019 17:10:55 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-679-g1f7ccac-fmstable-20191210v1
Mime-Version: 1.0
Message-Id: <f6a514d1-44cb-4577-af07-fd2f3fefc974@www.fastmail.com>
In-Reply-To: <20191210202842.2546758-1-arnd@arndb.de>
References: <20191210202842.2546758-1-arnd@arndb.de>
Date:   Wed, 11 Dec 2019 08:42:35 +1030
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Arnd Bergmann" <arnd@arndb.de>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        "Bartosz Golaszewski" <bgolaszewski@baylibre.com>,
        "Joel Stanley" <joel@jms.id.au>
Cc:     "Hongwei Zhang" <hongweiz@ami.com>, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: aspeed: avoid return type warning
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Wed, 11 Dec 2019, at 06:58, Arnd Bergmann wrote:
> gcc has a hard time tracking whether BUG_ON(1) ends
> execution or not:
> 
> drivers/gpio/gpio-aspeed-sgpio.c: In function 'bank_reg':
> drivers/gpio/gpio-aspeed-sgpio.c:112:1: error: control reaches end of 
> non-void function [-Werror=return-type]
> 
> Use the simpler BUG() that gcc knows cannot continue.
> 
> Fixes: f8b410e3695a ("gpio: aspeed-sgpio: Rename and add Kconfig/Makefile")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Andrew Jeffery <andrew@aj.id.au>
