Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A3245AB317
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Sep 2022 16:11:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238918AbiIBOK7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Sep 2022 10:10:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238929AbiIBOKh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Sep 2022 10:10:37 -0400
Received: from hutie.ust.cz (unknown [IPv6:2a03:3b40:fe:f0::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDBADE9252
        for <linux-gpio@vger.kernel.org>; Fri,  2 Sep 2022 06:38:36 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
        t=1662125854; bh=tciNiAcemF/xP+86KrN5KXfFgo4o4RSmHFJZ1UK/Fac=;
        h=Subject:From:In-Reply-To:Date:Cc:References:To;
        b=UeIjSDk3IzNUnlY2MWN8yndLc5b0daxKNnOrIu7Il++FsZRLQu3H63l17axc4lYPb
         cq84/9I2CLSF4wbExERM1U+pg02P1cK2kR5eBAXqETrkrtSuyx9WlrTKWieGzDxzVW
         dPQYKMHD6+vJsUQZ+LS+Va4sUdtG/O9X8gq2P42c=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH 5/6] gpio: Add new gpio-macsmc driver for Apple Macs
From:   =?utf-8?Q?Martin_Povi=C5=A1er?= <povik@cutebit.org>
In-Reply-To: <CAHp75VdstDxcZ96d3XD=k8_q2oP3UvoL+QV-27BxWFyALWJ_QQ@mail.gmail.com>
Date:   Fri, 2 Sep 2022 15:37:27 +0200
Cc:     Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        Hector Martin <marcan@marcan.st>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sven Peter <sven@svenpeter.dev>
Content-Transfer-Encoding: quoted-printable
Message-Id: <85AE2F3E-6A1D-4AA0-9205-3E3DE5C6D79F@cutebit.org>
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk>
 <E1oTkeb-003t9e-Iy@rmk-PC.armlinux.org.uk>
 <CAHp75VcG5E+yTH2hG2CbnArsm+ZJ-sWRMmM-wLks0xUJkwSgcg@mail.gmail.com>
 <FEE9F7AE-B324-4426-AB26-17BDF30CFC91@cutebit.org>
 <CAHp75Vd8-mOuJvr=PRKjVKbz0SM9hPe39rEcraOMJFYtrwHjng@mail.gmail.com>
 <3B649A66-8116-432D-B88A-B5CE493EF930@cutebit.org>
 <CAHp75VeB3_sZ2vsSxMSsLeJSkyemDh9iOPHXJCN1mhodA13LNQ@mail.gmail.com>
 <E753B391-D2CB-4213-AF82-678ADD5A7644@cutebit.org>
 <CAHp75VdstDxcZ96d3XD=k8_q2oP3UvoL+QV-27BxWFyALWJ_QQ@mail.gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_FAIL,SPF_HELO_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


> On 2. 9. 2022, at 15:33, Andy Shevchenko <andy.shevchenko@gmail.com> =
wrote:
>=20
> On Fri, Sep 2, 2022 at 2:12 PM Martin Povi=C5=A1er <povik@cutebit.org> =
wrote:
>>> On 2. 9. 2022, at 12:23, Andy Shevchenko <andy.shevchenko@gmail.com> =
wrote:
>>> On Fri, Sep 2, 2022 at 12:47 PM Martin Povi=C5=A1er =
<povik@cutebit.org> wrote:
>>>>> On 2. 9. 2022, at 8:31, Andy Shevchenko =
<andy.shevchenko@gmail.com> wrote:
>>>>> On Fri, Sep 2, 2022 at 12:52 AM Martin Povi=C5=A1er =
<povik@cutebit.org> wrote:
>=20
> ...
>=20
>>>>> I don't see why we need that. The %.4s (0x%08x) is repeating that =
with
>>>>> the existing codebase. (I do understand why v4l2/drm have it). =
Ideally
>>>>> the first should use %4pE, but it might not be suitable in some =
cases.
>>>>=20
>>>> Just from a superficial understanding of things: %p4ch on =
little-endian
>>>> will print in a reversed order to %.4s. As I see it the handling of
>>>> endianness is the value proposition of the new specifiers.
>>>=20
>>> So, what prevents you from adding this to %pE?
>>> The preferred way is not adding a specifier for a single user with a
>>> particular case, esp. when it's covered by the existing ones.
>>=20
>> Adding the endianness conversion into %pE as, ehm, an =E2=80=98escaping=
 flag=E2=80=99?
>> If you think that would be accepted...
>>=20
>> I guess this was added on the assumption that keys like this will
>> be a common occurrence in interaction with Apple firmware. Though
>> greping the =E2=80=98asahi=E2=80=99 staging tree for =E2=80=98%p4ch=E2=80=
=99 I only see it in the
>> SMC code (9 times):
>>=20
>> ./drivers/power/reset/macsmc-reboot.c
>> ./drivers/platform/apple/smc_core.c
>> ./drivers/gpio/gpio-macsmc.c
>=20
>>>> %p4ch - interpret as an u32, print the character in most =
significant byte first
>>>=20
>>> %.4s + be32_to_cpu()
>>=20
>> Well, AIUI instead of
>>=20
>>  printk(=E2=80=9C%p4ch =3D ...\n=E2=80=9D, &key);
>>=20
>> you need to do
>>=20
>>  u32 key_be =3D cpu_to_be32(key);
>>  printk(=E2=80=9C%.4s =3D ...\n=E2=80=9D, &key_be);
>>=20
>> in at least 9 places now, the number of which will probably grow.
>> Just to make the case for *some* printk helper.
>=20
> Wouldn't this be one line
>=20
>  printk(=E2=80=9C%.4s =3D ...\n=E2=80=9D, &cpu_to_be32(key));
>=20
> ?

That would compile? I thought that=E2=80=99s not valid C, taking an
address of function=E2=80=99s return value.

>=20
> So I don't see disadvantages right now. Later on we can consider a new
> specifier _separately_, otherwise this series would be dragging for no
> sense.

Absolutely agreed on the latter point.

Martin

