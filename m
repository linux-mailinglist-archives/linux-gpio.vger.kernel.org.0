Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B790B0CD5
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Sep 2019 12:26:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730923AbfILK0b (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Sep 2019 06:26:31 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:36005 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730872AbfILK0b (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Sep 2019 06:26:31 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id CDAA322245;
        Thu, 12 Sep 2019 06:26:27 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute4.internal (MEProxy); Thu, 12 Sep 2019 06:26:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm3; bh=hH6krjDyM1ef7cBjth9GvNBMbTUI9b+
        39ETpeM1V4vs=; b=NHMNQMg+HFPouEvMQ00sKE/W0BsIAYFMCmqPDrTUQO6EqlR
        0wh/LUFfCkK9s3vYt2qjyKQvYd4tFrh0P/t00fYORmhhxbXQqQj4bzkZ2uaWfPk+
        n3qrYCOHYv30kvYh+P+myvR4uJg/mKyMOd1Ay0Iz1wtq0QXaArzQieqCrNvwU2qs
        1bTfGjrhRV7DSto1+GrQ0gvyJyzfgBUEaRDfKugJ23ZYqC71h3fgj6CKARc/ZGw/
        4Ml53ei0IbK/SWxVNT4+jV2iUfiCOTU2NTrmow3LFuPGtUxQZa0Z5amAV6dj1w1s
        MA10yj0+f/TMChNfXg04bVJXrWeX52EQDpSWS6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=hH6krj
        DyM1ef7cBjth9GvNBMbTUI9b+39ETpeM1V4vs=; b=SXH9K8WEkJux2WUVSDI78n
        AOj3buJkf8DgR3jYi7VHNH2a3c4uqEsc/dGKY1uknNvnrgJfp6dJZk7gWVHwC9zi
        S1SpNPI6ChUtzJEojbDYRGZP/EL2sMlMWX4KHJygDIapXlMsKS+9xPLdKbPhImRg
        S4BoBRe+i1MpHIubusilRTqr5GB6nAVmchSAQItbTYxHHN5/67E/her2lw18oQiD
        8SxcH9CoFvKxXBcCBNHbzGTm7WltTmzg1kPQrxxAJxZp/F8v+/I6XLNTqRNck2I8
        kN6nri4R6vUf4Pu2nWEfiH23TIZDHwTK/CofWJ58x/5u9IaUZgODEQWsTngifRPA
        ==
X-ME-Sender: <xms:Uh16XSVBjtb16JkF2tIvIYISZaCxuUrOVo92Ul0Z-4MDK0VbF0HJ-Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrtdehgddviecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
    vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
    hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
    ufhiiigvpedt
X-ME-Proxy: <xmx:Uh16XQL3Oxbb0GmE0XZZDmuKp1_PaBTv2QJpPgBENmsyMaV6XdHv1Q>
    <xmx:Uh16XcveF0GiadG_lUbwsrsYyUrA5VLiSrWrVGY1iO1MG0bb3U-1fA>
    <xmx:Uh16XVJ3HgoxVidgB2HsX8LfawoOQtQ02K13OoyzQrzvTnhobwfVEw>
    <xmx:Ux16XUk7PROLbEoYHv_ELhTN8sOnkupa5QZJq7d4yxrADFT3zS1jnA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id DB132E00A9; Thu, 12 Sep 2019 06:26:26 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-237-gf35468d-fmstable-20190912v1
Mime-Version: 1.0
Message-Id: <c51f0ef0-cd1a-47db-8551-706c5864e0be@www.fastmail.com>
In-Reply-To: <CACRpkdYW_PX7npB+b1YJ4pfFQNLVOsMx2hpKtntBeHg=C1j-Cg@mail.gmail.com>
References: <20190829071738.2523-1-andrew@aj.id.au>
 <CACRpkdYW_PX7npB+b1YJ4pfFQNLVOsMx2hpKtntBeHg=C1j-Cg@mail.gmail.com>
Date:   Thu, 12 Sep 2019 19:56:05 +0930
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Linus Walleij" <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "Joel Stanley" <joel@jms.id.au>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        "OpenBMC Maillist" <openbmc@lists.ozlabs.org>,
        "Linux ARM" <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "John Wang" <wangzqbj@inspur.com>
Subject: =?UTF-8?Q?Re:_[PATCH_pinctrl/fixes]_pinctrl:_aspeed:_Fix_spurious_mux_fa?=
 =?UTF-8?Q?ilures_on_the_AST2500?=
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Thu, 12 Sep 2019, at 17:53, Linus Walleij wrote:
> On Thu, Aug 29, 2019 at 8:17 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> 
> > Commit 674fa8daa8c9 ("pinctrl: aspeed-g5: Delay acquisition of regmaps")
> > was determined to be a partial fix to the problem of acquiring the LPC
> > Host Controller and GFX regmaps: The AST2500 pin controller may need to
> > fetch syscon regmaps during expression evaluation as well as when
> > setting mux state. For example, this case is hit by attempting to export
> > pins exposing the LPC Host Controller as GPIOs.
> >
> > An optional eval() hook is added to the Aspeed pinmux operation struct
> > and called from aspeed_sig_expr_eval() if the pointer is set by the
> > SoC-specific driver. This enables the AST2500 to perform the custom
> > action of acquiring its regmap dependencies as required.
> >
> > John Wang tested the fix on an Inspur FP5280G2 machine (AST2500-based)
> > where the issue was found, and I've booted the fix on Witherspoon
> > (AST2500) and Palmetto (AST2400) machines, and poked at relevant pins
> > under QEMU by forcing mux configurations via devmem before exporting
> > GPIOs to exercise the driver.
> >
> > Fixes: 7d29ed88acbb ("pinctrl: aspeed: Read and write bits in LPC and GFX controllers")
> > Fixes: 674fa8daa8c9 ("pinctrl: aspeed-g5: Delay acquisition of regmaps")
> > Reported-by: John Wang <wangzqbj@inspur.com>
> > Tested-by: John Wang <wangzqbj@inspur.com>
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> 
> Applied for fixes already yesterday!

Thanks! Hoping to avoid such late fixes in the future...

Andrew
