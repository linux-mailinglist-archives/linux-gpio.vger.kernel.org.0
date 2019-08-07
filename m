Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B2F883E69
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2019 02:35:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727481AbfHGAfq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Aug 2019 20:35:46 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:53151 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726419AbfHGAfp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Aug 2019 20:35:45 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 44A004C6;
        Tue,  6 Aug 2019 20:35:44 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute4.internal (MEProxy); Tue, 06 Aug 2019 20:35:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm3; bh=CZQ9fy4bGaBJTciSXCw5R8GomHrVEfV
        S66D46ri1O50=; b=TnuDr/2hZoFEeTFZDsK5eI+/TF3Zr0olB70M6alI8oO6H9z
        FdL40k4b/LQeUGml1uVNSzUk1eRXkBCe9M/uXTLSYbslTJ6yMdYTUnHQy2dmUNie
        mrY0Mq3AT9SHV2unfYXodJ8JXy/u1zsL/0++aFr2XTBFSMX/15iZ5OsgOsrrnXad
        +fKpiO6/IU+67QcwnbR1ADHt0HFCNHpqLR+UlAmlQweEY93Qt41ySoLEXZKezn+D
        4XyzJ2A1GaPSqapSLW6insh0i0MbUUp5SFWK85wWzyjD9HOdkDIMZJf1+HyvZTAD
        f8rIEHW86rNXmqJlx0gE+JpikIYE7hEru1M7rtw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=CZQ9fy
        4bGaBJTciSXCw5R8GomHrVEfVS66D46ri1O50=; b=NcXj2Y0X3VwUuqjRP/4+z9
        YPSTYXHY0jFM2wUiwFMMYwzaOqFjLSFcp2h9rCYxnMnST7qz7nq+uS6Qyqd8y21D
        /oLvQvgc9on752SCnvPFI9VoYOC/N0e7irJe8aTpuTw41Lj9Ju8TganWV/zzdXnK
        3hvU9lDOt5kHGm0w9VJJvo4MYYqnu8YeGyTNSMTOiHgkFbe5rMJRpeSLfjFEkgMW
        hz7+zsYlzq0hHxdt9/1GMcAist1Xf26zQq1lmFRgu07QMjcNGSC6hTJbXK9ivO1T
        gE/71SD75xfRNi5DOuygvXzgLyH6kb1+2IEXK1hBclYW1zZMANQP9R9+2pHQNDbA
        ==
X-ME-Sender: <xms:3hxKXQImpMul6c42CY4tIMPcYm4J44HTpMQ1095tL-vPyfoZNI6siQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudduuddgfeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuffhomh
    grihhnpehgihhthhhusgdrtghomhenucfrrghrrghmpehmrghilhhfrhhomheprghnughr
    vgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:3hxKXZFZRuRPF8Frq_zT_iscIX8zlfIzjN6kBNokq0XrZtWbJyeqUg>
    <xmx:3hxKXeDW0FfgKa1Qks8BB8DWLdSrBplsZlyO703kpmfdiBYghPpQJQ>
    <xmx:3hxKXRFwFkqHfU3wU-h0YvAIrwXW_Yb1dar4V7jXKIIHAsN6fQIWPg>
    <xmx:3xxKXdyPAINqAsQZUjaifWPOkzR80ZmlgOL4_DDtHUj2PulRsFsJCw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id CE574E00A2; Tue,  6 Aug 2019 20:35:42 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-808-g930a1a1-fmstable-20190805v2
Mime-Version: 1.0
Message-Id: <0e4bf79c-0e35-4cf4-b375-a023aa2cd034@www.fastmail.com>
In-Reply-To: <20190807003037.48457-1-natechancellor@gmail.com>
References: <20190807003037.48457-1-natechancellor@gmail.com>
Date:   Wed, 07 Aug 2019 10:06:00 +0930
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Nathan Chancellor" <natechancellor@gmail.com>,
        "Linus Walleij" <linus.walleij@linaro.org>
Cc:     "Joel Stanley" <joel@jms.id.au>, linux-aspeed@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com
Subject: =?UTF-8?Q?Re:_[PATCH]_pinctrl:_aspeed:_g6:_Remove_const_specifier_from_a?=
 =?UTF-8?Q?speed=5Fg6=5Fsig=5Fexpr=5Fset's_ctx_parameter?=
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Wed, 7 Aug 2019, at 10:02, Nathan Chancellor wrote:
> clang errors:
> 
> drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c:2325:9: error: incompatible
> pointer types initializing 'int (*)(struct aspeed_pinmux_data *, const
> struct aspeed_sig_expr *, bool)' with an expression of type 'int (const
> struct aspeed_pinmux_data *, const struct aspeed_sig_expr *, bool)'
> [-Werror,-Wincompatible-pointer-types]
>         .set = aspeed_g6_sig_expr_set,
>                ^~~~~~~~~~~~~~~~~~~~~~
> 1 error generated.
> 
> Commit 674fa8daa8c9 ("pinctrl: aspeed-g5: Delay acquisition of regmaps")
> changed the set function pointer declaration and the g6 one wasn't
> updated (I assume because it wasn't merged yet).
> 
> Fixes: 2eda1cdec49f ("pinctrl: aspeed: Add AST2600 pinmux support")
> Link: https://github.com/ClangBuiltLinux/linux/issues/632
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>

That's exactly what happened. Thanks.

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
