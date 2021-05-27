Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED343392474
	for <lists+linux-gpio@lfdr.de>; Thu, 27 May 2021 03:41:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232381AbhE0BnY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 May 2021 21:43:24 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:54815 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231968AbhE0BnX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 26 May 2021 21:43:23 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 4AF7C580589;
        Wed, 26 May 2021 21:41:51 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute3.internal (MEProxy); Wed, 26 May 2021 21:41:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm2; bh=HShTPGN305qweA3+k/g3h9Fb9JHGdhF
        iPsYEsyMmato=; b=uAOk8M7/y+c4HLrsrSG6nNXRB5p9ry3D5rAaQSG5miW64YJ
        D4/5YXbOhNXADNgbx3GqST/1L5Ii1f20mLv9f8B3K+dCUzcabUiUyMjMScefANDL
        7jC2G+y3MyXFTmG0/iLLqbplmsN53Dlav6qO0znx8FkZ7PUxK7Qy1heuh9xANjdr
        ggkBmPuXHytfDtSQy9YsZqYkBH4zFPAP8aG2cJdu7Xwd3yv1VmAiCp0MGTxbA25a
        4/uZ3rrbicMlxNx+PHxBAPJGdiQJG9LBKEYA5XMMeU1bWyOhjyMlSTsl11UAMH1a
        87EXgbwRSENJ0nJR684iMHgZKRAuE3i0cdkGCjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=HShTPG
        N305qweA3+k/g3h9Fb9JHGdhFiPsYEsyMmato=; b=Jp1/ResC9WoMLg2M4oUFRN
        +eQhYiCcqgvo0pTeWK5EfsypfI/V6qWAM1EgHp/125BmX1vBt5Ib240oVLXEHZ/k
        BouLwSVmzgWfhmkpx8M5wrJeM2HdQmj2orad4Y7vj1axYvJFCzVlFLsocrx3yu2E
        1oMJ4SXQByCPwjNtEFLKIo/77mT2/14H5Vm5VBVNnwYLmIO57OROj72vuheD4m/n
        m6Y7M8AHE92MqwnGk2dXs05fEBpicWFJhtEOi8SeDOPOLnTAbg0nLhKnlnUYb/ms
        aHPYtcQ2UgjTywNzZ5O+BpsZL+bCOF3S1vA04PMkU2qwWyaKzWZJpDlST+e+90jg
        ==
X-ME-Sender: <xms:3fiuYPBW4HoDBUI61GGh4PbGvNVT-uchY05o1Fgr2YOTYZmLDWkfSQ>
    <xme:3fiuYFjA1myrlGk7gBkZjvrupPthdiWPZam_t1pDpT_YGcjinLC1Drfdudtl7gOlp
    YP8o0ezX1K9yNFR7w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdekgedggeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
    grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
    hfevueffnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:3fiuYKlNv-D4qaHQUyFRfrU4bsY0Hqkv0XKA_PyG9pvxPS0C08TwBw>
    <xmx:3fiuYBxT6ft4vNAae4tpuX7zyvMhksDQREBYi6akoHtmsALhjroxUA>
    <xmx:3fiuYERPFwUV3-rR17fknnsJJgJxJQUYyiOp8m8Xn7NiB18ME_tzQg>
    <xmx:3_iuYJI6wHQuTSchgVNsM0abDzDtKVwXl8wpSyoRQ6cq5m2nJLcioA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id C98C4A00079; Wed, 26 May 2021 21:41:49 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-468-gdb53729b73-fm-20210517.001-gdb53729b
Mime-Version: 1.0
Message-Id: <4d995f6e-b582-4f45-b87c-2cd795de8d14@www.fastmail.com>
In-Reply-To: <20210527005455.25758-1-steven_lee@aspeedtech.com>
References: <20210527005455.25758-1-steven_lee@aspeedtech.com>
Date:   Thu, 27 May 2021 11:11:28 +0930
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
Subject: Re: [PATCH v2 0/4] ASPEED sgpio driver enhancement.
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Steven,

On Thu, 27 May 2021, at 10:24, Steven Lee wrote:
> AST2600 SoC has 2 SGPIO master interfaces one with 128 pins another one
> with 80 pins, AST2500/AST2400 SoC has 1 SGPIO master interface that
> supports up to 80 pins.
> In the current driver design, the max number of sgpio pins is hardcoded
> in macro MAX_NR_HW_SGPIO and the value is 80.
> 
> For supporting sgpio master interfaces of AST2600 SoC, the patch series
> contains the following enhancement:
> - Convert txt dt-bindings to yaml.
> - Update aspeed dtsi to support the enhanced sgpio.
> - Get the max number of sgpio that SoC supported from dts.
> - Support muiltiple SGPIO master interfaces.
> - Support up to 128 pins.
> 
> Changes from v1:
> * Fix yaml format issues.
> * Fix issues reported by kernel test robot.
> 
> Please help to review.

I think it's worth leaving a little more time between sending series.

I've just sent a bunch of reviews on v1.

Cheers,

Andrew
