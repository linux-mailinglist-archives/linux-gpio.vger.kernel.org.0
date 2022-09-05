Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE2D25AD453
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Sep 2022 15:55:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238142AbiIENxm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Sep 2022 09:53:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231582AbiIENx1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Sep 2022 09:53:27 -0400
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com [66.111.4.230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E68850049
        for <linux-gpio@vger.kernel.org>; Mon,  5 Sep 2022 06:53:26 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 7FCEB58025B;
        Mon,  5 Sep 2022 09:53:25 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Mon, 05 Sep 2022 09:53:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm1; t=1662386005; x=1662389605; bh=DAwij7Um0i
        kNBEF3YIhOjtbhSpBMWl517NbMhPX1fsA=; b=UUVFdroYt527pFBL+iQI1DSE2g
        vi89Hr3L4cX+r6iyj8v2PY3m/dvdpS0DSrlW2jqsIUOAu+t5xOk+Eo21Sb9Fluli
        uw5+oyhvnRKT2rjya6j0Nps3pUoWcK+rk6GmWqla5bxNCoU0VwBXK1O1aD05tuNN
        pXho7fRVp4tCRWAXNTG3p9spWNVJdqQQbhwZNg/qIPS1MmCe7Jr1LX94dTkT/goB
        B/VG3Ztdt4tfhXg2JgM/u9/bmOE71C1UB6vh3rlVoJdBfMUBlNkLcML9UmF/GiwF
        Fb2DtoyYB2EtQSOdfbZktXj1GRkjPJg6laJY/gGLQ/7RZEMRxX7Wj+bQ5ZcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; t=1662386005; x=1662389605; bh=DAwij7Um0ikNBEF3YIhOjtbhSpBM
        Wl517NbMhPX1fsA=; b=R6u2k8JeLqJVd4QNtrys56Ptc9jBZ8E7WQ/M2GFQOJd0
        rlZ0fw3g9kOhh8U30f+ZEZNph1F/3RLrokYsrASqTLsQPTr7A5+i+8m/pB9HPAmA
        kOaY5H8rIi8lUT41roc/l2zddMJAun34qmxFpF4rLCow90luGzIQTD2QvjjpDWZW
        0VH89qCFtoYrQTBF2gZkP0gy/W6vty+q4L2M/+uJv6dxM9VZj/OInk2QNIFPdllf
        tG5VuW0sGOX+js7Fa8xBWnkmDmrrkGcbQULrVJ8MFwPGMBnSRVPV9wU8fZaioMDl
        iSjQRawkKBBNXXz5dDYKEVnV9gptNCbPGwYipK7tWg==
X-ME-Sender: <xms:VP8VY97tkQVJltSw6k4LmSjIGH5Up9yhjidatrgAXD4EZt0gvk4dfA>
    <xme:VP8VY67XdY-Fy8NIEGZ0xFHi6JcVHAQhpLibrbJkofaJXt3zCROtAaJgHa41Mvbsx
    DE2RhiAEy2vmFi8N9M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeliedgjeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:VP8VY0eBu6STio3Kfq4MW_9Ms_wnPLBXK9RJsw2bQxKFcpUQu8zV3w>
    <xmx:VP8VY2JBU54-ODLEbS_tpChnekxPiKu1dGjay6NQiC10Z240ncJdEw>
    <xmx:VP8VYxKnzLTeed1W5ULls7HbNAi3Ff_Ar3nnQL1ZjZ0aXbtMYNNRxA>
    <xmx:Vf8VY-Hdd4gdBL7S4CrK_OnsUwobHvHAnl1jfgWGf3RncP5rRnN79A>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id B256DB60083; Mon,  5 Sep 2022 09:53:24 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-927-gf4c98c8499-fm-20220826.002-gf4c98c84
Mime-Version: 1.0
Message-Id: <9be88d9b-8531-46f4-8cca-c276b4a741e1@www.fastmail.com>
In-Reply-To: <CACRpkdYKQt8fJ5FaTQgoNgGH73xnC877pQhek5Df1zdSE_c3=w@mail.gmail.com>
References: <202209050605.fezJUgFH-lkp@intel.com>
 <CACRpkdbfHG3r1wtN3Gne-XX0Zg2qyFSgH4yR3ctauABY4u-XJw@mail.gmail.com>
 <20220905133040.GB6496@francesco-nb.int.toradex.com>
 <CACRpkdYKQt8fJ5FaTQgoNgGH73xnC877pQhek5Df1zdSE_c3=w@mail.gmail.com>
Date:   Mon, 05 Sep 2022 15:53:03 +0200
From:   "Arnd Bergmann" <arnd@arndb.de>
To:     "Linus Walleij" <linus.walleij@linaro.org>,
        "Francesco Dolcini" <francesco.dolcini@toradex.com>
Cc:     "kernel test robot" <lkp@intel.com>, llvm@lists.linux.dev,
        kbuild-all@lists.01.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "Fabio Estevam" <festevam@gmail.com>
Subject: Re: [linusw-pinctrl:devel 26/32]
 drivers/pinctrl/freescale/pinctrl-imx.c:260:9: error: call to undeclared
 function 'pinmux_generic_get_function'; ISO C99 and later do not support
 implicit function declarations
Content-Type: text/plain
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 5, 2022, at 3:37 PM, Linus Walleij wrote:
> On Mon, Sep 5, 2022 at 3:30 PM Francesco Dolcini <francesco.dolcini@toradex.com> >
> What annoys me is that the core pinmux/pinctrl part should not
> depend on HAS_IOMEM... :(

Does it actually still depend on it? s390 now has

config HAS_IOMEM
        def_bool PCI

and compile-test has:

config COMPILE_TEST
        bool "Compile also drivers which will not load"
        depends on HAS_IOMEM

so s390 should work both with and without IOMEM here, as long
as drivers do the usual 'depends on ARCH_MXC || COMPILE_TEST'
dance.

The only problem I see is a missing 'select GENERIC_PINMUX_FUNCTIONS'.
There may be other drivers that have the same issue. Would it
make sense to just always build these into the pinctrl
subsystem?

     Arnd
