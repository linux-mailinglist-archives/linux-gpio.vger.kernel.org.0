Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 073B05AD96A
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Sep 2022 21:10:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231349AbiIETKU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Sep 2022 15:10:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230202AbiIETKT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Sep 2022 15:10:19 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6B5618B
        for <linux-gpio@vger.kernel.org>; Mon,  5 Sep 2022 12:10:17 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id u9so18770838ejy.5
        for <linux-gpio@vger.kernel.org>; Mon, 05 Sep 2022 12:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=R22dyG0yqcuhYb9YD9cYalho8rvzbosoNRaxUmrXNSU=;
        b=VBhrJH426IPPB0Alau62UZZryc6Mi8bDJNT72dFyop/+n3ishXd5jhozrDodyzAQne
         uGpnu3a5FS02mgYQULUfRL5ZtQjw/xomrosSs+RhPD9MIU3Dw0PqjewlawTPKSvLWw+j
         3goMg04q/6Sc1M08aCYPWjkhB4WBl2fbvumciwxFZsAoMxIE5nz+3bbLMoLJIFWxobQP
         0ckdXuWisvg1QPNi7EWJf9deHTgCZKMMfL1KwZexl+Eb4bcmbzwFgEWDWrGIFIIfAAzG
         GXKB7jXQmq7AzmNkdPOSQmGUisbovaHTAgo0OiuTkuPmhvlvBcYeaWrZMGgxNw/9O3eo
         Xcug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=R22dyG0yqcuhYb9YD9cYalho8rvzbosoNRaxUmrXNSU=;
        b=0h9SDjbykTCN6TYJTFWYjjbB9WVAX8HhiF4QrTwX50+OuQnkcPbj30/4qx8KknWNDV
         Xu5esTv4BRsaH7wtP4yndgBWexPLaRAGbplxeZG5tO/msXhv1lxStdWpkXaCw15ucKYX
         jMuhUNUVXJQJeMoCeSi6o6iscst44238aXzuyIpDlJQoD2SA+1HfTQ63uGJV9b1J6CHw
         9H6IVx6mB3XJsr8re7XGj8Ysks9uFliDoPfh65drBtl33kV7TD3LX0YQEgur1HeC+hcv
         d7rirmPQ+yfiJk0XF2nfk7HkIV9/0lD2WndB1taBVbsZJgOGQ2z2bEGUN+BnIBTWCtem
         EOQg==
X-Gm-Message-State: ACgBeo1H8wpdl1UxXN0VpKvkDbj/P2Zok+58EYYbcpckJ5sIWzR+OGQ9
        CYgKu31m6s7fTtWke1jT8F4TQSGERxjI4bbEUv/q5IkIDdc=
X-Google-Smtp-Source: AA6agR51Gz8yHkbQoGBNHqvtBQu6detP0ZUT0cLmLi6LZ322J95iaEXCADFjTwZknsq3JisTHUa6t8e8EIAKHJF6Cl4=
X-Received: by 2002:a17:907:7242:b0:741:770b:dfc6 with SMTP id
 ds2-20020a170907724200b00741770bdfc6mr27954518ejc.203.1662405016470; Mon, 05
 Sep 2022 12:10:16 -0700 (PDT)
MIME-Version: 1.0
References: <CAHp75VeTYSn+ODtoH27OB2U+XYVEphonm+QR3Z+NVs-nJ90w9w@mail.gmail.com>
 <YxIifddpeJRCuImc@shell.armlinux.org.uk> <CAHp75VddN-cEY3AN=PWO5pR4D6YaDTRQgjbZLS=C5dLBTSVGwA@mail.gmail.com>
 <YxXNZzeBRiiS6FNk@shell.armlinux.org.uk> <CAHp75Vcq4LVRmgELvLJ8fNk3xdSfGikyLDL_7LGvKg4a4L4J=A@mail.gmail.com>
 <YxX1Lp7ClRSBhbno@shell.armlinux.org.uk> <CAHp75VfcTzbhOGr=0YH+nfpgcfDg8mhF1b5tZF3wudPiKhp7Qw@mail.gmail.com>
 <YxYWdDUBNOV+DaU0@shell.armlinux.org.uk> <FD0C690B-DFA6-4CF0-8C54-8D829F0ABE2B@cutebit.org>
 <57c02bdd-4f98-40f7-22a9-4f39508159e8@marcan.st> <YxYgL+MAJ7oUmLQd@shell.armlinux.org.uk>
In-Reply-To: <YxYgL+MAJ7oUmLQd@shell.armlinux.org.uk>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 5 Sep 2022 21:10:04 +0200
Message-ID: <CACRpkdYEQGobV30EDVd_ZYJ=PYE9nqyKhNT_W9xEjM3Grwrb5g@mail.gmail.com>
Subject: Re: [PATCH 5/6] gpio: Add new gpio-macsmc driver for Apple Macs
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc:     Hector Martin <marcan@marcan.st>,
        =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik@cutebit.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sven Peter <sven@svenpeter.dev>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 5, 2022 at 6:13 PM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:

> I suggest that I try resubmitting the series with IRQ support dropped,
> and with the %p4ch support in it and we'll see what happens.

You can add my
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
on the result, and the code should go in when Hector & you are
happy with it. I surely trust you to fix the final polish.

I don't mind the IRQ patch either, but I understand it's a bit
annoying if you can't test it on anything.

Yours,
Linus Walleij
