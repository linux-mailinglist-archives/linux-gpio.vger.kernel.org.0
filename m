Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 307255ADAEF
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Sep 2022 23:40:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232195AbiIEVk3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Sep 2022 17:40:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230415AbiIEVk2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Sep 2022 17:40:28 -0400
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com [64.147.123.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9AA043E69
        for <linux-gpio@vger.kernel.org>; Mon,  5 Sep 2022 14:40:26 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.west.internal (Postfix) with ESMTP id C17272B05AFF;
        Mon,  5 Sep 2022 17:40:25 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Mon, 05 Sep 2022 17:40:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm1; t=1662414025; x=1662417625; bh=Vgo0AtXrQ8
        j8CwRv9hCXFvG4cPRHv9K1Ip+Kzzkibik=; b=B2flso5YbibdySPYZ20z8jWqJu
        Wy1U19c80n3tL4M0yo/fm7QphbzzVFpUSgSN19BUG8f8qvypY/fLMIr8UQjpgy4V
        /tAXwxSjguCWLjGr8z8hBOZNvtihy/DF7sC3Cdv1s+tEtXiJskQ3KNmXt2oeVSG5
        sYzcuozQXiAuCBaMJtbTLd0tft/l0twJFN43whqW0c4dfbtoLnrJdtWzAer+OCit
        XW/2SUSR161Q3oEbqnUKTjk4i4dtbA2AOGLwV3yyuKU8FN0eRB1OfGzTLOd6RtfC
        L2DrnB8bB2tYWJ+sQ0DiB7Htc0vvNx+mIjBM8k44AbUyluO7yUk5JYsx0gNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; t=1662414025; x=1662417625; bh=Vgo0AtXrQ8j8CwRv9hCXFvG4cPRH
        v9K1Ip+Kzzkibik=; b=c/WDrRpMvfg5XSyVhZNTXKioBMYq2eIJC2j2EomWseOo
        DQXUpzCbcw/cLGVj3h3lbIKc3XwGhHryasZmpnY1zj7GTrBGFxuR+gvreIBa5ut4
        UyGQw8c41Orsixq0zywMg3iLYMif6CAhujVUptVvIThOWXQmFKFn9IFLYhqGhqEB
        l/bxGvxNdMSM4XMH4mBgXYKjp2JH1TCc0Mn2OjsaLYKVBI0Aea7qBXVzM2kU2GLo
        fQQDjZheOKbqruDg8fq6xTdkQHdXhV8UEEhPOJd0C17AtlKjCNWNmIavj2Bs5dHU
        kI7sWzO37ddV2PB+sLBSRJCWAsUCanflrIt+GBn08Q==
X-ME-Sender: <xms:yGwWY1rXBk2K54dup7RbAu-S9f4IzHlCfphCsvoZo8CJK6DwqRCDdQ>
    <xme:yGwWY3qpUswQjhjSb3BuLesPCOw1541-qP3arnMRGtCbxRKrME9n46qDMjnwPoRlb
    AgS1Zv54qdqxE3ntdg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeljecutefuodetggdotefrodftvfcurf
    hrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeetffen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggv
X-ME-Proxy: <xmx:yGwWYyMdTkOonkMxDsZ1ovqpAKJEantIvH-vMo1qV-rhe1MeXOVkPA>
    <xmx:yGwWYw5Gl1EWGdpoYInT8OuUvn-vqwG-LrEX2A4KZITlhb7GK0uDjQ>
    <xmx:yGwWY04shZvTBEfbIt_NZy-pEXNMfLKvBYG6q18b8s2WWdIXOy5chQ>
    <xmx:yWwWY_1ySjkctc83QLbuiJmW6NTBfbTmmaFB-iISfGt67UpFgKkSFWPjtkA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 3391FB60083; Mon,  5 Sep 2022 17:40:24 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-927-gf4c98c8499-fm-20220826.002-gf4c98c84
Mime-Version: 1.0
Message-Id: <4f5ca7a1-b472-4bc6-aab9-58fae036db5c@www.fastmail.com>
In-Reply-To: <CACRpkdYGHMMD5ti0m9nyk6VV_sNsyptgpULPDzQcV3A9aRd5Jg@mail.gmail.com>
References: <202209050605.fezJUgFH-lkp@intel.com>
 <CACRpkdbfHG3r1wtN3Gne-XX0Zg2qyFSgH4yR3ctauABY4u-XJw@mail.gmail.com>
 <20220905133040.GB6496@francesco-nb.int.toradex.com>
 <CACRpkdYKQt8fJ5FaTQgoNgGH73xnC877pQhek5Df1zdSE_c3=w@mail.gmail.com>
 <9be88d9b-8531-46f4-8cca-c276b4a741e1@www.fastmail.com>
 <CACRpkdYGHMMD5ti0m9nyk6VV_sNsyptgpULPDzQcV3A9aRd5Jg@mail.gmail.com>
Date:   Mon, 05 Sep 2022 23:40:01 +0200
From:   "Arnd Bergmann" <arnd@arndb.de>
To:     "Linus Walleij" <linus.walleij@linaro.org>
Cc:     "Francesco Dolcini" <francesco.dolcini@toradex.com>,
        "kernel test robot" <lkp@intel.com>, llvm@lists.linux.dev,
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


On Mon, Sep 5, 2022, at 11:20 PM, Linus Walleij wrote:
> On Mon, Sep 5, 2022 at 3:53 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> I have a kismet warning that sometimes this selecting PINCTRL_IMX
> is inconsistens since it depends on OF and apparently there are
> now non-OF configs compiling it. So could the real problem be
> that everything selecting PINCTRL_IMX should depend on OF
> too?

Ah right, that sounds the like the root cause. Yes, you either
have to make sure it's possible to build PINCTRL_IMX without
CONFIG_OF, or have everything that selects it have an OF dependency.

If a select statement in Kconfig hits a missing dependency, it
does not follow the indirect 'select' statements from that.

      Arnd
