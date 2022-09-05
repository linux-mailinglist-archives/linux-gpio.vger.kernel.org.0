Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F397E5AD6CC
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Sep 2022 17:44:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238116AbiIEPoV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Sep 2022 11:44:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237921AbiIEPoU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Sep 2022 11:44:20 -0400
Received: from hutie.ust.cz (unknown [IPv6:2a03:3b40:fe:f0::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B151A43337
        for <linux-gpio@vger.kernel.org>; Mon,  5 Sep 2022 08:44:17 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
        t=1662392653; bh=NLba8lc0pkWgzOMx+tSiHBynnT+i06gpNWGJ9Hu70rk=;
        h=Subject:From:In-Reply-To:Date:Cc:References:To;
        b=Fu5vMmgmziBcdAAiyJsUApSm/ErshYXUGYAYZwh9qY8mwKhKgycj4EE1RRsPwvZCB
         jqlR4O2XGJmOvZPYYzJk1eafdXa5/vqbzfMxMlePc2icQJSuuLBptNTki3ZqdBX4ZI
         rz/y24yxIy0BKKN3AFnbB/QHBUaBHIoF+UbN5Mrk=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH 5/6] gpio: Add new gpio-macsmc driver for Apple Macs
From:   =?utf-8?Q?Martin_Povi=C5=A1er?= <povik@cutebit.org>
In-Reply-To: <YxYWdDUBNOV+DaU0@shell.armlinux.org.uk>
Date:   Mon, 5 Sep 2022 17:44:09 +0200
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        Hector Martin <marcan@marcan.st>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sven Peter <sven@svenpeter.dev>
Content-Transfer-Encoding: quoted-printable
Message-Id: <FD0C690B-DFA6-4CF0-8C54-8D829F0ABE2B@cutebit.org>
References: <YxHp6CNhlQ5Hx1m8@shell.armlinux.org.uk>
 <CAHp75Vd-hT3Z-TUCG3y872_Y7sPAW2QBGC28S7aimOf3WQHg6A@mail.gmail.com>
 <YxIXPSZlEBcKYulW@shell.armlinux.org.uk>
 <CAHp75VeTYSn+ODtoH27OB2U+XYVEphonm+QR3Z+NVs-nJ90w9w@mail.gmail.com>
 <YxIifddpeJRCuImc@shell.armlinux.org.uk>
 <CAHp75VddN-cEY3AN=PWO5pR4D6YaDTRQgjbZLS=C5dLBTSVGwA@mail.gmail.com>
 <YxXNZzeBRiiS6FNk@shell.armlinux.org.uk>
 <CAHp75Vcq4LVRmgELvLJ8fNk3xdSfGikyLDL_7LGvKg4a4L4J=A@mail.gmail.com>
 <YxX1Lp7ClRSBhbno@shell.armlinux.org.uk>
 <CAHp75VfcTzbhOGr=0YH+nfpgcfDg8mhF1b5tZF3wudPiKhp7Qw@mail.gmail.com>
 <YxYWdDUBNOV+DaU0@shell.armlinux.org.uk>
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_FAIL,SPF_HELO_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


> On 5. 9. 2022, at 17:32, Russell King (Oracle) <linux@armlinux.org.uk> =
wrote:

> I still need a resolution between you and Hector over the smc_key
> issue - specifically, do I pick up the patch that adds support for
> %p4ch, or do we re-architect the smc_key thing and also in doing so
> get rid of the need for your "endian conversion" thing.

Idea about the %p4ch thing: We will leave the keys true
to their nature (i.e. 32-bit integer), and at least initially
for the prints we will employ macros

#define SMC_KEYFMT =E2=80=9C%c%c%c%c=E2=80=9D
#define SMC_KEYFMT_VAL(val) (val)>>24,(val)>>16,(val)>>8,(val)

used like

printk(=E2=80=9Cblah blah=E2=80=9D SMC_KEYFMT =E2=80=9C blah\n=E2=80=9D, =
SMC_KEYFMT_VAL(key));

This has the nice property that it is pretty much like the specifier,
and later can be easily replaced with the real thing.

--
Martin

