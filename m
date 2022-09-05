Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B91D35AD54D
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Sep 2022 16:45:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238584AbiIEOoy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Sep 2022 10:44:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238600AbiIEOoN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Sep 2022 10:44:13 -0400
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BAD563A9
        for <linux-gpio@vger.kernel.org>; Mon,  5 Sep 2022 07:43:24 -0700 (PDT)
Received: by mail-qt1-x833.google.com with SMTP id h21so6247260qta.3
        for <linux-gpio@vger.kernel.org>; Mon, 05 Sep 2022 07:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=7v5FOOLdYwdsxSG69jSBYyu9WWlJmRm14US74QjJnDs=;
        b=iobyYV4YHb+9WxY4ehI5eM3twNy2598O1GpSbSRuDv9F234PY1Tl6I1t8OCoWUeSOW
         WUGW06ZOKMRMgu0kigvUpCzCw13umaW7qIiXbrMrxbBeVqFtWf6dwKq1qPxUobzt0ym/
         SbsDOU0DXDZc5m/CF70JVWv7C75WLR796SyLIHbwhB/NVXy1mwyq1mFia/TRgfqMkjfB
         zU3wHEaxMQsMhZ++LgZ2D7pi9d4dLVR/34U5plZ62ZI96s6JNepu+GabdRoFf3MTXWJq
         i7f/5jIcnVdJ8ycDxX+l72A1zjSv09sHEutiSJzGgEJHtriL3OD0KW4feqvh30IDZ7FU
         7aQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=7v5FOOLdYwdsxSG69jSBYyu9WWlJmRm14US74QjJnDs=;
        b=XHrp3R8mmR0oGUFy2xa351T+VxcjqfnPTIS0vi7HvzXPuB3PhvXBbpIePevxrTA0EY
         bOLBeA9MtNGSgr7l5ueHR/RwBEbETwUUnJBSOSqJq6g89SCuPmgk+cfv7poNjvmZEfWL
         mDGHIhNeudQROaS8SjSx4c88wm43Ia7sA9SUp3jCaSUD2K7HXcnB9ZWn9924mVxw4I4N
         7wIyu4phI2Db7c88Sw8iuCEEMFOxnEoUNqVWdhv8+ousNlZQ5FShrCRtMvLwfU1s8JYN
         p4Oa3Y6g0SkwBefFOrn8VrCdVYsJuU+L0yDuO67UHF8zck5MS9Q+KFEtF9tBT2nuvwAQ
         r5gQ==
X-Gm-Message-State: ACgBeo0ThE9HmdXa7v0CGEU2n6RMoxnkKyzDaMZ7/L5H8ZQdcRKDlEU9
        nRDPWkrpFdZjgPbVXaQzq/C0uio6VAWiJZVfY3s=
X-Google-Smtp-Source: AA6agR5gIIBAC5RARGKi4D/n28ff3ZYzSHL8AHcEcioACVL0822fiOKz55Y4VaTkO2LUwHLdMVsU5l7raus1LFqlw48=
X-Received: by 2002:ac8:7f92:0:b0:344:8cd8:59a1 with SMTP id
 z18-20020ac87f92000000b003448cd859a1mr40695434qtj.384.1662389003092; Mon, 05
 Sep 2022 07:43:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAHp75Vd-hT3Z-TUCG3y872_Y7sPAW2QBGC28S7aimOf3WQHg6A@mail.gmail.com>
 <YxIXPSZlEBcKYulW@shell.armlinux.org.uk> <CAHp75VeTYSn+ODtoH27OB2U+XYVEphonm+QR3Z+NVs-nJ90w9w@mail.gmail.com>
 <YxIifddpeJRCuImc@shell.armlinux.org.uk> <CAHp75VddN-cEY3AN=PWO5pR4D6YaDTRQgjbZLS=C5dLBTSVGwA@mail.gmail.com>
 <YxXNZzeBRiiS6FNk@shell.armlinux.org.uk> <CAHp75Vcq4LVRmgELvLJ8fNk3xdSfGikyLDL_7LGvKg4a4L4J=A@mail.gmail.com>
 <YxX1Lp7ClRSBhbno@shell.armlinux.org.uk> <CAHp75VfcTzbhOGr=0YH+nfpgcfDg8mhF1b5tZF3wudPiKhp7Qw@mail.gmail.com>
 <YxYBJcRGCOlcSZH8@shell.armlinux.org.uk> <YxYBeMz8nIIA+1P/@shell.armlinux.org.uk>
In-Reply-To: <YxYBeMz8nIIA+1P/@shell.armlinux.org.uk>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 5 Sep 2022 17:42:46 +0300
Message-ID: <CAHp75VdYevopN673hqg7Tau4Fouythq7OAeDDJP4C4fh7KgYyw@mail.gmail.com>
Subject: Re: [PATCH 5/6] gpio: Add new gpio-macsmc driver for Apple Macs
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc:     Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        Hector Martin <marcan@marcan.st>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sven Peter <sven@svenpeter.dev>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 5, 2022 at 5:02 PM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
> On Mon, Sep 05, 2022 at 03:01:09PM +0100, Russell King (Oracle) wrote:

...

> Oh, and another thing. Your behaviour on this is making me regret
> trying to get involved in improving the upstream support for this
> platform.

Taking into account that technical aspects quite likely are not the
cause, what did you expect to be different?

-- 
With Best Regards,
Andy Shevchenko
