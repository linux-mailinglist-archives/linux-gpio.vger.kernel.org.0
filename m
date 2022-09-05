Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1051E5AD5AA
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Sep 2022 17:01:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230038AbiIEPBe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Sep 2022 11:01:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238344AbiIEPBc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Sep 2022 11:01:32 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABF815018E
        for <linux-gpio@vger.kernel.org>; Mon,  5 Sep 2022 08:01:31 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id g21so6443371qka.5
        for <linux-gpio@vger.kernel.org>; Mon, 05 Sep 2022 08:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=pZWC1H0WRkhRCjv9BDpPVFJARK9SyE80gpwJCZgud4M=;
        b=BBGj82V2TczLpiRO5dd4Tiqb87w52xNP5e4u5Gr2j3otvBMR9DqfP6GwayIBpTpvri
         V1MO1eQ6/H1RSegcPxFfgJfRnMchoT2OosFXudFcjFecO5QGzYlW7SNLS6Fiyg50qi0N
         hq/6ZqE8oXM5R6h+meBzDusU8a1hzXCzL1jhX20lzIBuuIqMzTvwedNCBRu10fLVQbLj
         NN4Keee3qpZ/0bkD4JY+S/fQ21Zh53nfsv9u7osGBDGZNfh0VQoAujyBnmOLRH5sulms
         JyCm4DN9syy950Poe70aGOPoRqauzTE3hJuzHEmKAxLR9gNj/3Ggs+kCPDoDijxTNPbt
         mscg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=pZWC1H0WRkhRCjv9BDpPVFJARK9SyE80gpwJCZgud4M=;
        b=DlzIPDSOeAQ23zoEqXjT3MgGgZNJDuzbrx1+4+/jRS8HfH49ukOH2vxmVpNc3wFFV6
         S+4cR1R1lz3hwAqjhSJiJryPOkmHIJ1pxFmXIcmmbrlxp+8E1z3aWMj5ET0vgG0M8O+Y
         U6qEHdmMY7drBv0jnmb1zC6SpPk/GNyRnxV7ABPpwxlpQW6Gz/ykLqaRI/LqZ5S+NCa3
         bAO7uk2qhgG0KntMfheVY/ChCRt4F4MG/i0Bpcxs6V1cUupbG8fpB+fb1brWBjv4Mp4g
         dQ8/7pBTuHP8YSSzvSBrL7KxqilXYng2s+yVanHu6DTpELWTs0/wrL0SMMEjU5Jk8Pby
         d1Lg==
X-Gm-Message-State: ACgBeo0sCdAtv62zHcjETI6CU9OBf7XTFkk9abpQXONEOHe04XPRbQ7Q
        2BLZGfJmgycTyx4g5zBAzbWJqvmMO3H4KNAj/CM=
X-Google-Smtp-Source: AA6agR62F2MQpI3xuf0uJbOxKJR8qhHj40PD/Xifr6TPFOael1V1jBsitUPEMphr+JiDSmUzty4eFWgSTO8li5KUncM=
X-Received: by 2002:a05:620a:410e:b0:6bc:5cdc:88ec with SMTP id
 j14-20020a05620a410e00b006bc5cdc88ecmr33097183qko.734.1662390090769; Mon, 05
 Sep 2022 08:01:30 -0700 (PDT)
MIME-Version: 1.0
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk> <E1oTkeW-003t9Y-Ey@rmk-PC.armlinux.org.uk>
 <CAHp75Ve1ackTCOAkVar00OyDW-+BOPbRmsJRH3-z1bdNaukC+Q@mail.gmail.com> <7f20d473-7bbc-b0b3-3daf-dfc935ca3151@marcan.st>
In-Reply-To: <7f20d473-7bbc-b0b3-3daf-dfc935ca3151@marcan.st>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 5 Sep 2022 18:00:54 +0300
Message-ID: <CAHp75Vd3O35mHEqA-iR=Fm47y1R2dPu_Jk7wcutvSmUxf6zpCg@mail.gmail.com>
Subject: Re: [PATCH 4/6] platform/apple: Add new Apple Mac SMC driver
To:     Hector Martin <marcan@marcan.st>
Cc:     Russell King <rmk+kernel@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
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

On Mon, Sep 5, 2022 at 5:45 PM Hector Martin <marcan@marcan.st> wrote:
> On 02/09/2022 04.26, Andy Shevchenko wrote:

...

> Andy, no offense, but you drive-by everything I try to upstream (or
> author in this case) and half of your suggestions are wrong and I have
> to waste my time explaining why, and most of the rest are negligible
> style nitpicks. Every now and then you point out some useful kernel
> function that I didn't know about, but your signal to noise rate is
> terrible. Please put some effort into your reviews. It feels like you're
> on some kind of quest to review as much code as possible, without the
> slightest care for quality.

Okay, if I ever review your code in the future, I'll try my best.

-- 
With Best Regards,
Andy Shevchenko
