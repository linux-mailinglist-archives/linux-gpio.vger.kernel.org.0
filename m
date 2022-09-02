Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D158A5AA839
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Sep 2022 08:45:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233557AbiIBGpq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Sep 2022 02:45:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235483AbiIBGpo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Sep 2022 02:45:44 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ED5E4331F
        for <linux-gpio@vger.kernel.org>; Thu,  1 Sep 2022 23:45:41 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id BF88B3200AA1;
        Fri,  2 Sep 2022 02:45:38 -0400 (EDT)
Received: from imap47 ([10.202.2.97])
  by compute2.internal (MEProxy); Fri, 02 Sep 2022 02:45:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
         h=cc:cc:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm1; t=1662101138; x=1662187538; bh=bY
        LZ913Dp4ZRTutrVUDsylQfP4PyGybvm0JPexpAVjU=; b=KhcAMIs2YHep2jlRRO
        QbkSmQM712fJB4yt/bzEHrtuoD11z0u5pulVP6dXilNhfZnSuN0yn21up9xoFJeA
        oNNU7CPFVjsx4YCV/ZrmWFfK7UV5XbCxMXbh5wKvhXXzIYYH19SbZjDmx7CkAmBO
        5ECaiT0Icm8u3vOuIfTQDi0V2ZPPpQpdkaqOVUteaVX9OBPE0l137igKR5Rv1YbO
        yadSnbBE0EJG2ExUSE2+J6FLIQfUTqNHyp9QX8QDz84ydDBn3PAHF+lC7JCnLryV
        PWuj0uk1+A1jJzIwseNkgwrDUDIxpSX8eQTdkL6M5+GoJzbqkI/zr9tpEBdNiM2h
        oqtQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; t=1662101138; x=1662187538; bh=bYLZ913Dp4ZRTutrVUDsylQfP4Py
        Gybvm0JPexpAVjU=; b=svfbX1bqsJVGSY5/Bt/8cV8k7ubPHmmNcb/gZ+B3BLZp
        qEjMNoQC2zDfu3h5PLW2Q+SC0XkDu3tuYO/NDdzabemMS4Jz5yBdyXag0o4QhN1N
        8pKikiekWrkOTBHZcDKBHfCe3OIcABgAjUbNp+SiL/17EMD4T1opa+y+vr8/XMtR
        94JWZsCf1ktYqdtP1+KdsH2oeiwaUNFM+OzxA4WTTmZjlUAx65yvORoy+JW6FlX1
        wFpZboyp6bSgI5h8JJHJ8UplFtNFDnD2EPJlIhblWn1Z/yn7vs4lAaTKsLo+6mZa
        Mar9OwTBv4SekHC+VxeDJTFKn2Q5hl57Jc5jALGdjg==
X-ME-Sender: <xms:kaYRY5ND_g4mYC9t9sy6PIoyjrebZQuq_Kq94iMk46F6472l76aUKA>
    <xme:kaYRY7_zcuAkioI92ViBILJtzeqmwWXr6AINMdzzgINGCqQXQRzsJ6rw5gc5-TzNu
    QFL5sSWHNcCOI_VPuk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekledgudduvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdfu
    vhgvnhcurfgvthgvrhdfuceoshhvvghnsehsvhgvnhhpvghtvghrrdguvghvqeenucggtf
    frrghtthgvrhhnpeelvefggeffheevtdeivefhkeehfeettdejteduveeiheevveeilefg
    hfeiveeiueenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehsvhgvnhesshhvvghnphgvthgvrhdruggvvh
X-ME-Proxy: <xmx:kaYRY4S6YyWPB8nSZ1bFyEJmFqJ4uN3Xp9y_E_VWS6q9znP69PRomg>
    <xmx:kaYRY1tunDO5RTurEuBueAtB03zIB5zmTExDfC-bSluszGFQuO14UQ>
    <xmx:kaYRYxeD6GaXrXXvbNYTN2SFiAko0YnihhSffE3Ot3Zow04U52A1Ng>
    <xmx:kqYRYwxMRoG3xUxqQBLPkGcB1Q683AszGaxaoJ4ql4-gUtWIxR1sqw>
Feedback-ID: i51094778:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 38E0DA60082; Fri,  2 Sep 2022 02:45:37 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-841-g7899e99a45-fm-20220811.002-g7899e99a
Mime-Version: 1.0
Message-Id: <20d82d72-ed8a-458f-bb84-37906bd41bcc@www.fastmail.com>
In-Reply-To: <CAHp75Ve1ackTCOAkVar00OyDW-+BOPbRmsJRH3-z1bdNaukC+Q@mail.gmail.com>
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk>
 <E1oTkeW-003t9Y-Ey@rmk-PC.armlinux.org.uk>
 <CAHp75Ve1ackTCOAkVar00OyDW-+BOPbRmsJRH3-z1bdNaukC+Q@mail.gmail.com>
Date:   Fri, 02 Sep 2022 08:45:16 +0200
From:   "Sven Peter" <sven@svenpeter.dev>
To:     "Andy Shevchenko" <andy.shevchenko@gmail.com>,
        "Russell King" <rmk+kernel@armlinux.org.uk>
Cc:     "Arnd Bergmann" <arnd@arndb.de>, "Lee Jones" <lee@kernel.org>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        "Alyssa Rosenzweig" <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
        "Bartosz Golaszewski" <brgl@bgdev.pl>,
        "Hector Martin" <marcan@marcan.st>,
        "linux-arm Mailing List" <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 4/6] platform/apple: Add new Apple Mac SMC driver
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

On Thu, Sep 1, 2022, at 21:26, Andy Shevchenko wrote:
> On Thu, Sep 1, 2022 at 5:18 PM Russell King <rmk+kernel@armlinux.org.uk> wrote:
[...]
>
> ...
>
>> +       if (size <= 4)
>> +               memcpy(buf, &rdata, size);
>> +       else
>> +               memcpy_fromio(buf, smc->shmem.iomem, size);
>
> This is unclear why plain memcpy() for the small size and what are the
> side effects of the memory. Maybe you wanted memremap() instead of
> ioremap() to begin with?

rdata is used for small buffers, comes directly as part of a message sent on the
underlying hardware FIFO and is on the stack (and thus mapped as as Normal memory)
while smc->shmem.iomem has to be Device-nGnRnE. Mapping it with any other attributes
will generate SErrors for each access.




Sven
