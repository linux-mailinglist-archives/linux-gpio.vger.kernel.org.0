Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC67C39AEB3
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jun 2021 01:30:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229755AbhFCXcC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Jun 2021 19:32:02 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:57611 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229576AbhFCXcC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Jun 2021 19:32:02 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.nyi.internal (Postfix) with ESMTP id D7F1458095D;
        Thu,  3 Jun 2021 19:30:16 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
  by compute2.internal (MEProxy); Thu, 03 Jun 2021 19:30:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm2; bh=PyTavatY3hkR5hhSwC8qiixLyB/GxmS
        SiDs9xXK0dVo=; b=pi2VUTI6N3kPFrEb+86tzq3LHQ4k7GLiPTkYwAkvc0veauW
        BRX8qiy78INkoypHs4xJL5pO37AjLAG3DV7l/Z0iPmNAp/6BvK/sK02h9qZ0zzS4
        sIb8n9Y9sDCSnMJwce5Y8Ioaf0jOnrTmjfvtn8pcqCScGprUAoD5u7DkdY5g03Pq
        mPOfn2lEKJ8SWAyV2WIUmfoh5zK93llbwJXpoQGgjpsTt/qz2h0vZv4+JbV2WVM+
        pduhP54ZxB8gwqRh5XfTu/GkeoHSMrDA+MA9MITMom4FiyFrIzYFMen20tcu8s7B
        X/guG59pVqjY8yeWhPHPKT2IassYGqtGLR4o6wQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=PyTava
        tY3hkR5hhSwC8qiixLyB/GxmSSiDs9xXK0dVo=; b=AB+PklDCM7+7IZETf1VuCA
        NDIyHP5tBgcifkRwUEJy/Sbfm1cclI+DMW5Xc+ECRsRnUhrojsaXdr0vaN5cRBd7
        4r458kGvc3TeCI7U3b4RGubELzguTHAT+mm7bNbYt1COY1VXTdkOoZx2fal6REeC
        7WCbYA1fylCdQt2KIvfFAJ4UVkgovSY9p7JGlPLDy8qVsdp1CZlEUsORpEcGBqWX
        FBao6H5Wuj8IhPeO55lG0E6HGCkHQoNZrPJrVQ9UXocliUt8ihIjckgnvjWhmlEZ
        HrpsNtTOpNn+LTaNhj1awxKPxroy3DXW/lCbqgPuAKMVXDpDV17dK6tW3Plisoiw
        ==
X-ME-Sender: <xms:B2a5YA8HM-qnoQIMLZcUBifScl2gOSP6Tsb1pLs54LP4PpLHm7LPFw>
    <xme:B2a5YIuX21vTIOf40SBU7NQDpFcvErcTdHojdtRjYsDsy1v2rN2kKEz3dU6V3rKi9
    QIukxDbvB0qREBrpg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedttddgudejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
    grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
    hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:B2a5YGDAKpyzCRhBotF1l0EpaMCv2Npkdet4eV8fJ1lf5rIU3q51pw>
    <xmx:B2a5YAeVbcTt9hKC7vErq2uQUbMuEX9E6HDgC64AUqWJBtY-uB4f0A>
    <xmx:B2a5YFOCRMfMj32WKJazI_Snmr27_xEdE7DYRk7AnZBA9HiWlQUjtQ>
    <xmx:CGa5YGFPbN8Ej2gu12XjNH1xMPWzOhwjCc5TYl3jh8Ze_HJekxdUaQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id D32B3AC0062; Thu,  3 Jun 2021 19:30:15 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-519-g27a961944e-fm-20210531.001-g27a96194
Mime-Version: 1.0
Message-Id: <fcd435d9-4432-414e-9881-6044757a6fac@www.fastmail.com>
In-Reply-To: <20210603101822.9645-3-steven_lee@aspeedtech.com>
References: <20210603101822.9645-1-steven_lee@aspeedtech.com>
 <20210603101822.9645-3-steven_lee@aspeedtech.com>
Date:   Fri, 04 Jun 2021 08:59:55 +0930
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
Subject: Re: [PATCH v3 2/5] ARM: dts: aspeed-g6: Add SGPIO node.
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Thu, 3 Jun 2021, at 19:48, Steven Lee wrote:
> AST2600 supports 2 SGPIO master interfaces one with 128 pins another one
> with 80 pins.
> 
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> ---
>  arch/arm/boot/dts/aspeed-g6.dtsi | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
> index f96607b7b4e2..e56e92e206f1 100644
> --- a/arch/arm/boot/dts/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
> @@ -377,6 +377,36 @@
>  				#interrupt-cells = <2>;
>  			};
>  
> +			sgpiom0: sgpiom@1e780500 {
> +				#gpio-cells = <2>;
> +				gpio-controller;
> +				compatible = "aspeed,ast2600-sgpiom1";

See my comment on the compatible names on the binding document.

Andrew
