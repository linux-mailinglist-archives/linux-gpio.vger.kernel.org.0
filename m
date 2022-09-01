Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F2DA5A9DA3
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Sep 2022 19:02:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235032AbiIARAt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Sep 2022 13:00:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235059AbiIARAr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Sep 2022 13:00:47 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AC4758B65
        for <linux-gpio@vger.kernel.org>; Thu,  1 Sep 2022 10:00:44 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 6B24932009AE;
        Thu,  1 Sep 2022 13:00:39 -0400 (EDT)
Received: from imap47 ([10.202.2.97])
  by compute2.internal (MEProxy); Thu, 01 Sep 2022 13:00:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
         h=cc:cc:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm1; t=1662051638; x=1662138038; bh=P0
        EYURgGEYV4/k5h0fO2XjErH1mwBxtZbyN06bfLMJU=; b=JZgBHRPUXi7NnInWKF
        pd8UVoEh/aC+/iXXUhwiBKv2iPQAnvf60inOeW8ZQ2h7cRUSYy2IboBHatTJF5Ov
        kr1rmCdk0kNrSsr6qF3YzGI+fRFobYm9F2qK2R5JZwIgBCudLpMQ7BBWY1z1tCJY
        G4nfN0SqBZsGWwNKivaqyO+iBW+rPtj1eOkFCRDUXrMdo+Qjx9AkVm2+eQzOSAt8
        JzgtP6EcyT6hd9ACW9OjY4JsHAvx9w5St7NA1P1QFeQT6qvTmm1W/EkzncectKTg
        xTwR9CtopgvRddJM/qdG/TRz+dB7IcljBpaGMoiZAfxHVh3xJT0CLOd0yu36D42s
        dytQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; t=1662051638; x=1662138038; bh=P0EYURgGEYV4/k5h0fO2XjErH1mw
        BxtZbyN06bfLMJU=; b=02aAASxornoa32bXR9ayTDbY+EMWVCuT7RG2j0YIetaZ
        sHrw+REyf2Wh1goAVSMMbceAJsOAMHZ4dlRaHp1gJmr3MPTUtTFTXxohV8nWk2Pi
        WPAy1MHVgMhUNXqW16ONqMP0JdVsAF2qllaXgAkRcyX8bBCW31ctJ/o+J4gaBgSv
        yKmBZJCb2aVf8qhmedwHglE6LAEHZU+6AKH7Uo6B403jKewnaNx/vQdBX7/gYvKo
        Xbb97SB3NY/2mSvYt5sNcexq8rgKK4EKGntBMhRwu5Ty9mPvH0viyLgIPfPRtvEL
        AQ71GoQ4D6ZqYnk2M/ovPglgmgyNFxYUKpFwIVomgg==
X-ME-Sender: <xms:NOUQYxdfz1idkHpU3R8ITDLdUF4oHKZTGMa1bxYt1zW7jozWD7omNA>
    <xme:NOUQY_NC5AKAS3sStPUMeh0vte9k2--5d_j4D9sbNTff-NeB9J7fDqvrC4mjfL0kB
    ugBKaumXVvtPcaW5bo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekkedguddtlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdfu
    vhgvnhcurfgvthgvrhdfuceoshhvvghnsehsvhgvnhhpvghtvghrrdguvghvqeenucggtf
    frrghtthgvrhhnpeelvefggeffheevtdeivefhkeehfeettdejteduveeiheevveeilefg
    hfeiveeiueenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehsvhgvnhesshhvvghnphgvthgvrhdruggvvh
X-ME-Proxy: <xmx:NOUQY6gru7hEFNAK3mkumdyJXRwugl3-3k17RdLAi6_bcrRAcnSUsA>
    <xmx:NOUQY6_yrQS8mj7jq9CIGfgpSlKss2LKTii9_GVScFK9ooAURALfeQ>
    <xmx:NOUQY9tSsf3fXZ-sV_NHfhhY9npTJgskeYwAjGC3vzD6rcfBFYK1qA>
    <xmx:NuUQY-9vAO3YRskbLzKcJfxiGZW5RlpSCZlHAx_kOokLXVTBqhjxHg>
Feedback-ID: i51094778:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 27050A60082; Thu,  1 Sep 2022 13:00:36 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-841-g7899e99a45-fm-20220811.002-g7899e99a
Mime-Version: 1.0
Message-Id: <93863660-2f44-49ce-9bf2-93fad4adfa2c@www.fastmail.com>
In-Reply-To: <E1oTkeR-003t9R-BK@rmk-PC.armlinux.org.uk>
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk>
 <E1oTkeR-003t9R-BK@rmk-PC.armlinux.org.uk>
Date:   Thu, 01 Sep 2022 19:00:14 +0200
From:   "Sven Peter" <sven@svenpeter.dev>
To:     "Russell King" <rmk+kernel@armlinux.org.uk>,
        "Arnd Bergmann" <arnd@arndb.de>, "Lee Jones" <lee@kernel.org>,
        "Linus Walleij" <linus.walleij@linaro.org>
Cc:     "Alyssa Rosenzweig" <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
        "Bartosz Golaszewski" <brgl@bgdev.pl>,
        "Hector Martin" <marcan@marcan.st>,
        linux-arm-kernel@lists.infradead.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 3/6] soc: apple: rtkit: Add apple_rtkit_poll
Content-Type: text/plain
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 1, 2022, at 15:54, Russell King wrote:
> From: Hector Martin <marcan@marcan.st>
>
> This allows a client to receive messages in atomic context, by polling.
>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Sven Peter <sven@svenpeter.dev>


