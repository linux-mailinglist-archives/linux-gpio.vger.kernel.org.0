Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D8C8698FE4
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Feb 2023 10:35:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229648AbjBPJfs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Feb 2023 04:35:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbjBPJfr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Feb 2023 04:35:47 -0500
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82B1B38677
        for <linux-gpio@vger.kernel.org>; Thu, 16 Feb 2023 01:35:46 -0800 (PST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id D1766320083A;
        Thu, 16 Feb 2023 04:35:44 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Thu, 16 Feb 2023 04:35:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1676540144; x=1676626544; bh=hljOJv/Nlh
        Zo5xPpIEqF0Ap3RGmRA978HIIYBff6hxQ=; b=JgXQEmaG94RagIIdcO6/fwvW3d
        lLjuepMwc//e5gLXBGKjEvQYSOntoRt3AUFO8oy68rYfW8GTj57UzJhtU/H9nCCS
        gXeaJPpzChiyHu6aw8hIIqFj1flV76J18hhMsYuk/ZTCAJBMcKMoQvzxoPDBflgy
        d399eGTHi2TbTrzuZ3zH0cBdDIyT5Gj9z4uwagnm0gp4+xfFygjBoQfdBsREnN5j
        K6a0CHA3VLzdO2iGPPE7OtUqUAkFM39vgggalQlJDOQi7phON5R6bY4Uhutsb4JH
        h8HtTKWysZV75iaeBxNEk1YPMVPrKakzFC7eRBGWn4i/EXFM5xDf1ck7EX4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; t=1676540144; x=1676626544; bh=hljOJv/NlhZo5xPpIEqF0Ap3RGmR
        A978HIIYBff6hxQ=; b=cr02bg3l1EBSBnNUeFsJ/Rh7XZOkGzgvdIyuqKNaUd9Q
        MySvHL7rWmGLxjjpsIHFvMBKru3+UmMBlTBThy8Co4Atck5h/1tGLBpqETDNgWyr
        qpBXGxlMUG+9owYcbZ4toEFqXp2YaMwJI1a33qVQDWofQi+VTUzJ7oLvilQ9RR6S
        WKeIOftCG9BrWsrqDOYI0OZCXRV5NdiVK2nu3QY8jDO1ongfD6KVIgLDw+nrKpIp
        L9/ryfK2/634jCaJSi26MDXLQ0zKOCVLQ9P4KXqgwW6NeTym/H/k31VmaepsDytO
        /yUxiQ34cuVvJ3b/NBrGW6Syc+c+9fk/llDpW7aOYg==
X-ME-Sender: <xms:7_jtY6tjmGHO6C3MkMTNkV_8xn-TIIBwGpCGtbAxBnka1AjtF5iTlA>
    <xme:7_jtY_ctCOsPtdJljzcSq6pBHRcDkM6G72xjuaiV6vtIKic8AbMuxOpXWfuoAJwWZ
    Kj8zn6PyxVHijGWmWk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeijedgtdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:7_jtY1zU2_RL3wLzDmACWHApX3LvT7Po8zx02Jzr7eit-luq2q_88w>
    <xmx:7_jtY1N_F5Q8oeHuK-S6wMJ1sJKpUgwD5gRDHT2_jK3ZjNznWQYVzg>
    <xmx:7_jtY6-MLcHrFXsmnGy0pm2XZzY7mr3PFWyfp3DJYyLVroex9Y6xig>
    <xmx:8PjtYxYIVq6YLrd3wTcvkcHxdLRiFsOT7NY6V9xW0G0LQqMo7bMdBA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 8135EB60086; Thu, 16 Feb 2023 04:35:43 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-156-g081acc5ed5-fm-20230206.001-g081acc5e
Mime-Version: 1.0
Message-Id: <eb7339be-dfb7-4dd3-95d6-2f1e8c40d76b@app.fastmail.com>
In-Reply-To: <20230215213843.1737181-1-linus.walleij@linaro.org>
References: <20230215213843.1737181-1-linus.walleij@linaro.org>
Date:   Thu, 16 Feb 2023 10:35:26 +0100
From:   "Arnd Bergmann" <arnd@arndb.de>
To:     "Linus Walleij" <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "Bartosz Golaszewski" <brgl@bgdev.pl>
Cc:     "Janusz Krzysztofik" <jmkrzyszt@gmail.com>,
        "Tony Lindgren" <tony@atomide.com>, "Marc Zyngier" <maz@kernel.org>
Subject: Re: [PATCH] gpio: omap: Drop irq_base
Content-Type: text/plain
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Feb 15, 2023, at 22:38, Linus Walleij wrote:
> The OMAP1 at one point was using static irqs but that time is gone,
> OMAP1 uses sparse irqs like all other multiplatform targets so this
> static allocation of descriptors should just go.
>
> Cc: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Acked-by: Arnd Bergmann <arnd@arndb.de>
