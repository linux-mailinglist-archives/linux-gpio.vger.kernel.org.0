Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D03015AEC96
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Sep 2022 16:28:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239480AbiIFOGS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Sep 2022 10:06:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241627AbiIFOFD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Sep 2022 10:05:03 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C02D844C1;
        Tue,  6 Sep 2022 06:45:18 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 035155C012B;
        Tue,  6 Sep 2022 09:43:16 -0400 (EDT)
Received: from imap47 ([10.202.2.97])
  by compute2.internal (MEProxy); Tue, 06 Sep 2022 09:43:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
         h=cc:cc:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1662471795; x=1662558195; bh=77
        5C0tvEJHto5QjpXnW0h0+sCP1phI8skW6l0uy8ijE=; b=1RasTfLFA8jsQaZAo0
        7wHn7aRXszDUU4x9QbcJY9nauAiJ9VpPKNS+3dd2u7K8Sr77oD/ZGV47uR+mlEku
        rZEJ0q6NWxaqeUlPM6CWp3TqjHnvySr5HztZZGATVeC98QKnohWz9rYllC6nCOG3
        1HPn8w4r7JsBG1SqqOTZrf2yH0wBKe6mtVXjD5oQUm8dDzCSQ0AvQl9G0TFB9wW8
        lcbir0IK4cJzR5LSerdGN2cT6pqeotOt5kr+Mhy5q+y2DM4sJ778wvZpOSZkNEN4
        mqapKDCzcmBMoj7KvKk526ObJ+2ZvGlBQq18KPanDUumiI6brERAJbdop8x96owN
        hT0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; t=1662471795; x=1662558195; bh=775C0tvEJHto5QjpXnW0h0+sCP1p
        hI8skW6l0uy8ijE=; b=WpvTjDS/fCP3NS/RRBGHtOS2Gt38vXUS9AqShHRIcZio
        JYvDXMDvBfP956imD/5fDg2/EohH2uV/MUNHXbZsozC1jBE6vhX8mM0hEPnZND5q
        igDu6atYIPlpyDbBJEo4lvGfgPrspDmxAvIigjuiLoIruyEObxLNOIAR4qyA8fsu
        YJp1Qp9IBOK79VBYHkGnLdSDKaVWdF1SbH1L+zs8f29AOxhJ08u4E4Day1UUvypV
        D18bD06kcj+lEup5Qje/boSsZvHvMUGTOjW6q7cjqs6IrsaSFbkXHLYw4S4MiZPq
        3ko9Pg2OkpWNWg6W+XPGQdoZjQ9NXKECzdFdxmM/yQ==
X-ME-Sender: <xms:c04XY5pRlaKJ5R0-Lo1m8r1KarvO7nm3qJ6OB8m201Hd_1_LV1zQfQ>
    <xme:c04XY7o20m6-o6unPCGaqMfNReTzJt2G7pSfH4GOab0jdN9lOZ7a_C1fS0sspZH-G
    MyunyavNm3oyJbrUTQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdelkedgieekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedfufhv
    vghnucfrvghtvghrfdcuoehsvhgvnhesshhvvghnphgvthgvrhdruggvvheqnecuggftrf
    grthhtvghrnhepleevgfegffehvedtieevhfekheeftedtjeetudevieehveevieelgffh
    ieevieeunecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomh
    epshhvvghnsehsvhgvnhhpvghtvghrrdguvghv
X-ME-Proxy: <xmx:c04XY2PBhMOjeEiZekKrHSbhpOwtjrwMHEY9HmRMrXBPQk42pD8bfw>
    <xmx:c04XY061bOu8AeuTyIO8NNPrcfh2P5z40zczHtvXX0qD4q1CLUIdrw>
    <xmx:c04XY44KWezZD-mHFdys3K6wRR4_jwNZ-E3vKqu0eg3NlHGK3BEQ7g>
    <xmx:c04XY1PiZhV0TFhxvajAv0_BYchuqTSXmRqaOBuhSbZW_GHA5xfgWA>
Feedback-ID: i51094778:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id A6F3BA6007C; Tue,  6 Sep 2022 09:43:15 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-927-gf4c98c8499-fm-20220826.002-gf4c98c84
Mime-Version: 1.0
Message-Id: <8a94f2e6-f537-4e29-8375-e79b84524582@www.fastmail.com>
In-Reply-To: <E1oVYUi-005Cmk-0R@rmk-PC.armlinux.org.uk>
References: <YxdInl2qzQWM+3bs@shell.armlinux.org.uk>
 <E1oVYUi-005Cmk-0R@rmk-PC.armlinux.org.uk>
Date:   Tue, 06 Sep 2022 15:42:47 +0200
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
Subject: Re: [PATCH 7/7] arm64: dts: apple: Add SMC node to t8103/t6001 devicetrees
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



On Tue, Sep 6, 2022, at 15:20, Russell King wrote:
> From: Hector Martin <marcan@marcan.st>
>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  arch/arm64/boot/dts/apple/t8103.dtsi | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi 
> b/arch/arm64/boot/dts/apple/t8103.dtsi
> index 51a63b29d404..15c6023cf612 100644
> --- a/arch/arm64/boot/dts/apple/t8103.dtsi
> +++ b/arch/arm64/boot/dts/apple/t8103.dtsi
> @@ -336,6 +336,32 @@ wdt: watchdog@23d2b0000 {
>  			interrupts = <AIC_IRQ 338 IRQ_TYPE_LEVEL_HIGH>;
>  		};
> 
> +		smc_mbox: mbox@23e408000 {
> +			compatible = "apple,t8103-asc-mailbox", "apple,asc-mailbox-v4";
> +			reg = <0x2 0x3e408000 0x0 0x4000>;
> +			interrupt-parent = <&aic>;
> +			interrupts = <AIC_IRQ 400 IRQ_TYPE_LEVEL_HIGH>,
> +				<AIC_IRQ 401 IRQ_TYPE_LEVEL_HIGH>,
> +				<AIC_IRQ 402 IRQ_TYPE_LEVEL_HIGH>,
> +				<AIC_IRQ 403 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "send-empty", "send-not-empty",
> +				"recv-empty", "recv-not-empty";
> +			#mbox-cells = <0>;
> +		};
> +
> +		smc: smc@23e400000 {

Usually we sort these nodes by their address to prevent merge conflicts.
I guess it doesn't really matter here though since nothing will be between
these two nodes.
Either way,

Reviewed-by: Sven Peter <sven@svenpeter.dev>

> +			compatible = "apple,t8103-smc", "apple,smc";
> +			reg = <0x2 0x3e400000 0x0 0x4000>,
> +				<0x2 0x3fe00000 0x0 0x100000>;
> +			reg-names = "smc", "sram";
> +			mboxes = <&smc_mbox>;
> +
> +			smc_gpio: gpio {
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +			};
> +		};
> +
>  		pinctrl_smc: pinctrl@23e820000 {
>  			compatible = "apple,t8103-pinctrl", "apple,pinctrl";
>  			reg = <0x2 0x3e820000 0x0 0x4000>;
> -- 
> 2.30.2
