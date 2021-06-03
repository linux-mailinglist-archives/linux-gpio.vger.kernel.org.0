Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A48FC39AE9C
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jun 2021 01:25:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229786AbhFCX10 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Jun 2021 19:27:26 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:42877 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229704AbhFCX10 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Jun 2021 19:27:26 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.nyi.internal (Postfix) with ESMTP id BABBF58092B;
        Thu,  3 Jun 2021 19:25:40 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
  by compute2.internal (MEProxy); Thu, 03 Jun 2021 19:25:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm2; bh=xHx468dLeIG5R6GuSjFB251+2l0QlcN
        0sTUY7nex3m4=; b=icRT9uMDVWKZMTaKM1mxX6uHGkhSr10fgqqK1HgWEYfskbw
        bFKbUSHXDTe7hcGw1xq++H8wCKIXRL7czMuxe0nThECi5SmdREVpdXKKBoodKV3B
        h9g8saULpsBPRwHPeiUCTPp+HTgcGe8e1nLUSJCyqVPyWVblEC3zS8dyEl8np+po
        Q2cxh9BO8Xom/oEZvMNixiKJf2ggLVTnalANsmF46L0/jHKKqdo/bQYwomL/BO+2
        N/k7xCtvCYyHj0ek2rPEQu3QDETav255i0dXcewr2YGSpVBvEP/2ILepZYrTvXZX
        fwUvLbN94FDUPacNKbeDkZ3xGK1W3XFPwQ5V6wQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=xHx468
        dLeIG5R6GuSjFB251+2l0QlcN0sTUY7nex3m4=; b=bU/CDhozGz1MNTJhvJNNrQ
        sdZLklKokF0066z3eFqfvhK5j4KM0htu+HZRibbea7b3eEUcgP04EkHuou0iD1w2
        /qmWv5TMccCH81SZXtCvvFsMgt53tuS1IqI0rpL2iyn0TY/otWe0XAM52MBCYI6h
        5xjbmRk6xMhE+75/aghV3yw6z55eJ66dpML1dalHI09CfpyOqJ57AImXZLSM1XDa
        QuIHdYJMaEgPy0UiERwEPVrG1riADYCmuhl3wQBjU9iWa1MAW/GS+ociaVhOKatl
        RrosRmaldEuCrXjBNw7G6a+Kdj8PI1DuRQVcPvA/9b5Lcs6jToZe9N4h6A3DQR6A
        ==
X-ME-Sender: <xms:8mS5YL1QjCkgcjc5MI5EdFMtX3KnbIaBjw9iGfZOCABpvjNp4XAoeA>
    <xme:8mS5YKFKel0EUpn9UMJqSrSeTUseu6zz2g-ekXY5YGuxg2T587M0IPDY6LTwRq09N
    RoWUsc4LWiXNpodjQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedttddgudeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
    grthhtvghrnhephefguedvfedvgffgudehjeegudefvedufefgveefudetffdvfeeigffg
    jedvkeetnecuffhomhgrihhnpeguvghvihgtvghtrhgvvgdrohhrghenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhi
    ugdrrghu
X-ME-Proxy: <xmx:8mS5YL7E6g2kg_EDtsDmwiaR4xrV1KD6uEZiE93LKRgdaM-wOrW8Bg>
    <xmx:8mS5YA3lw0F-CIYcheMDnl5KTusFo_wRNmUfwIZADnxjUV77C5IO-A>
    <xmx:8mS5YOH4caqa4XZDEUwAkSZ6YU5kq2gThW3hLFtscpJTSpN4prlmCg>
    <xmx:9GS5YG-FPOEFJFVAJfVICPd6tpAjAzOU7QC0Ehj4Jr-idciXgSKgzg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 765D3AC0064; Thu,  3 Jun 2021 19:25:38 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-519-g27a961944e-fm-20210531.001-g27a96194
Mime-Version: 1.0
Message-Id: <516bb11a-b75f-49e1-ba79-e5a4c344a7ab@www.fastmail.com>
In-Reply-To: <20210603101822.9645-2-steven_lee@aspeedtech.com>
References: <20210603101822.9645-1-steven_lee@aspeedtech.com>
 <20210603101822.9645-2-steven_lee@aspeedtech.com>
Date:   Fri, 04 Jun 2021 08:55:17 +0930
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
Subject: =?UTF-8?Q?Re:_[PATCH_v3_1/5]_dt-bindings:_aspeed-sgpio:_Convert_txt_bind?=
 =?UTF-8?Q?ings_to_yaml.?=
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Steven,

On Thu, 3 Jun 2021, at 19:48, Steven Lee wrote:
> sgpio-aspeed bindings should be converted to yaml format.
> 
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> ---
>  .../bindings/gpio/aspeed,sgpio.yaml           | 78 +++++++++++++++++++
>  .../devicetree/bindings/gpio/sgpio-aspeed.txt | 46 -----------
>  2 files changed, 78 insertions(+), 46 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
>  delete mode 100644 Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
> 
> diff --git a/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml 
> b/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
> new file mode 100644
> index 000000000000..e7c2113cc096
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
> @@ -0,0 +1,78 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/aspeed,sgpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Aspeed SGPIO controller
> +
> +maintainers:
> +  - Andrew Jeffery <andrew@aj.id.au>
> +
> +description:
> +  This SGPIO controller is for ASPEED AST2400, AST2500 and AST2600 SoC,
> +  AST2600 have two sgpio master one with 128 pins another one with 80 
> pins,
> +  AST2500/AST2400 have one sgpio master with 80 pins. Each of the 
> Serial
> +  GPIO pins can be programmed to support the following options
> +  - Support interrupt option for each input port and various interrupt
> +    sensitivity option (level-high, level-low, edge-high, edge-low)
> +  - Support reset tolerance option for each output port
> +  - Directly connected to APB bus and its shift clock is from APB bus 
> clock
> +    divided by a programmable value.
> +  - Co-work with external signal-chained TTL components 
> (74LV165/74LV595)
> +
> +properties:
> +  compatible:
> +    enum:
> +      - aspeed,ast2400-sgpio
> +      - aspeed,ast2500-sgpio
> +      - aspeed,ast2600-sgpiom1
> +      - aspeed,ast2600-sgpiom2

You should have followed Rob's request here and made two patches for 
the binding document:

1. A 1-to-1 conversion of the text file to dt-schema
2. Add your new compatibles for the 2600.

From a cursory glance it looks okay except for the new compatibles.

Regarding the compatibles, I'd prefer we use something a bit more 
meaningful. What do you think of these?

- aspeed,ast2600-sgpiom-80
- aspeed,ast2600-sgpiom-128

Cheers,

Andrew
