Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75B505AA1DF
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Sep 2022 00:02:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233787AbiIAWCD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Sep 2022 18:02:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232731AbiIAWB7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Sep 2022 18:01:59 -0400
X-Greylist: delayed 586 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 01 Sep 2022 15:01:51 PDT
Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0F755C95B
        for <linux-gpio@vger.kernel.org>; Thu,  1 Sep 2022 15:01:51 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
        t=1662069121; bh=6E8Q4wd/LRO3ATv7di2IKGCyLDe3Uj2KYJjxGmXvAqA=;
        h=Subject:From:In-Reply-To:Date:Cc:References:To;
        b=gGHHpB/Fs7mHD1tU54DYL55+BG8BkevJFoxUvVNqVfi/CcHWEv2z6mMlECabYVQ5s
         MRl3+QAI682tOWMapOrix6kZd528jR/+1sBSvZF34sryKPgf4YU7IVOzU+qRl5XUjU
         y6MzgNnMrmoDmJSOmBN1D2ZYP4FPQuyQbFo5jjoU=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH 5/6] gpio: Add new gpio-macsmc driver for Apple Macs
From:   =?utf-8?Q?Martin_Povi=C5=A1er?= <povik@cutebit.org>
In-Reply-To: <CAHp75VcG5E+yTH2hG2CbnArsm+ZJ-sWRMmM-wLks0xUJkwSgcg@mail.gmail.com>
Date:   Thu, 1 Sep 2022 23:51:58 +0200
Cc:     Russell King <rmk+kernel@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        Hector Martin <marcan@marcan.st>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sven Peter <sven@svenpeter.dev>
Content-Transfer-Encoding: quoted-printable
Message-Id: <FEE9F7AE-B324-4426-AB26-17BDF30CFC91@cutebit.org>
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk>
 <E1oTkeb-003t9e-Iy@rmk-PC.armlinux.org.uk>
 <CAHp75VcG5E+yTH2hG2CbnArsm+ZJ-sWRMmM-wLks0xUJkwSgcg@mail.gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        T_SPF_HELO_TEMPERROR autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


> On 1. 9. 2022, at 20:55, Andy Shevchenko <andy.shevchenko@gmail.com> =
wrote:
>=20
> On Thu, Sep 1, 2022 at 5:17 PM Russell King =
<rmk+kernel@armlinux.org.uk> wrote:

>> + ret =3D apple_smc_write_u32(smcgp->smc, key, CMD_OUTPUT | value);
>> + if (ret < 0)
>> + dev_err(smcgp->dev, "GPIO set failed %p4ch =3D 0x%x\n", &key, =
value);
>=20
> Strange specifier... It seems like a hashed pointer with added (or
> skipped? I don't remember) '4ch'. Perhaps you meant one of '%pE',
> '%p4cc'?
> Ditto for other cases.

As was pointed out by Sven elsewhere in the thread, this is an
unupstreamed specifier (that was missed as a dependency of this
code).

=
https://github.com/AsahiLinux/linux/blob/f8c0d18173a7b649999ee27515393f7aa=
e40310c/Documentation/core-api/printk-formats.rst#generic-fourcc-code

Martin

