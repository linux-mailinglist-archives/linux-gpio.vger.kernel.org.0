Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4EDF5AAD3F
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Sep 2022 13:14:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235851AbiIBLNw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Sep 2022 07:13:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235866AbiIBLNh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Sep 2022 07:13:37 -0400
X-Greylist: delayed 48036 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 02 Sep 2022 04:12:45 PDT
Received: from hutie.ust.cz (unknown [IPv6:2a03:3b40:fe:f0::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11BBBD3EDC
        for <linux-gpio@vger.kernel.org>; Fri,  2 Sep 2022 04:12:44 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
        t=1662117159; bh=x1kEKVlTjSC6IylVTcVkCTwfg80qtjjZ7WXtR9JWdS8=;
        h=Subject:From:In-Reply-To:Date:Cc:References:To;
        b=qrD6wX6wjMFK9Am1zP+e7JIO8EjdeYdVOWcPv+BG3OSQJTUTEc6nHsZPp9HGRJt+/
         +yxIZHLM6qqXc57zv3CHDyPdNKuOoaE0QnmNILGACFkBtcqx7Eojv1pCQOhiNw9nc2
         Dc+kZ/QToo8kvELOz8gANHoHvn6Yx+UF9nUcgDbY=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH 5/6] gpio: Add new gpio-macsmc driver for Apple Macs
From:   =?utf-8?Q?Martin_Povi=C5=A1er?= <povik@cutebit.org>
In-Reply-To: <CAHp75VeB3_sZ2vsSxMSsLeJSkyemDh9iOPHXJCN1mhodA13LNQ@mail.gmail.com>
Date:   Fri, 2 Sep 2022 13:12:37 +0200
Cc:     Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        Hector Martin <marcan@marcan.st>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sven Peter <sven@svenpeter.dev>
Content-Transfer-Encoding: quoted-printable
Message-Id: <E753B391-D2CB-4213-AF82-678ADD5A7644@cutebit.org>
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk>
 <E1oTkeb-003t9e-Iy@rmk-PC.armlinux.org.uk>
 <CAHp75VcG5E+yTH2hG2CbnArsm+ZJ-sWRMmM-wLks0xUJkwSgcg@mail.gmail.com>
 <FEE9F7AE-B324-4426-AB26-17BDF30CFC91@cutebit.org>
 <CAHp75Vd8-mOuJvr=PRKjVKbz0SM9hPe39rEcraOMJFYtrwHjng@mail.gmail.com>
 <3B649A66-8116-432D-B88A-B5CE493EF930@cutebit.org>
 <CAHp75VeB3_sZ2vsSxMSsLeJSkyemDh9iOPHXJCN1mhodA13LNQ@mail.gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_FAIL,SPF_HELO_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Pardon, I lost the CC list in my earlier reply. Adding it back now.

> On 2. 9. 2022, at 12:23, Andy Shevchenko <andy.shevchenko@gmail.com> =
wrote:
>=20
> On Fri, Sep 2, 2022 at 12:47 PM Martin Povi=C5=A1er =
<povik@cutebit.org> wrote:
>>> On 2. 9. 2022, at 8:31, Andy Shevchenko <andy.shevchenko@gmail.com> =
wrote:
>>> On Fri, Sep 2, 2022 at 12:52 AM Martin Povi=C5=A1er =
<povik@cutebit.org> wrote:
>>>>> On 1. 9. 2022, at 20:55, Andy Shevchenko =
<andy.shevchenko@gmail.com> wrote:
>>>>> On Thu, Sep 1, 2022 at 5:17 PM Russell King =
<rmk+kernel@armlinux.org.uk> wrote:
>>>>=20
>>>>>> + ret =3D apple_smc_write_u32(smcgp->smc, key, CMD_OUTPUT | =
value);
>>>>>> + if (ret < 0)
>>>>>> + dev_err(smcgp->dev, "GPIO set failed %p4ch =3D 0x%x\n", &key, =
value);
>>>>>=20
>>>>> Strange specifier... It seems like a hashed pointer with added (or
>>>>> skipped? I don't remember) '4ch'. Perhaps you meant one of '%pE',
>>>>> '%p4cc'?
>>>>> Ditto for other cases.
>>>>=20
>>>> As was pointed out by Sven elsewhere in the thread, this is an
>>>> unupstreamed specifier (that was missed as a dependency of this
>>>> code).
>>>>=20
>>>> =
https://github.com/AsahiLinux/linux/blob/f8c0d18173a7b649999ee27515393f7aa=
e40310c/Documentation/core-api/printk-formats.rst#generic-fourcc-code
>>>=20
>>> I don't see why we need that. The %.4s (0x%08x) is repeating that =
with
>>> the existing codebase. (I do understand why v4l2/drm have it). =
Ideally
>>> the first should use %4pE, but it might not be suitable in some =
cases.
>>=20
>> Just from a superficial understanding of things: %p4ch on =
little-endian
>> will print in a reversed order to %.4s. As I see it the handling of
>> endianness is the value proposition of the new specifiers.
>=20
> So, what prevents you from adding this to %pE?
> The preferred way is not adding a specifier for a single user with a
> particular case, esp. when it's covered by the existing ones.

Adding the endianness conversion into %pE as, ehm, an =E2=80=98escaping =
flag=E2=80=99?
If you think that would be accepted...

I guess this was added on the assumption that keys like this will
be a common occurrence in interaction with Apple firmware. Though
greping the =E2=80=98asahi=E2=80=99 staging tree for =E2=80=98%p4ch=E2=80=99=
 I only see it in the
SMC code (9 times):

./drivers/power/reset/macsmc-reboot.c
./drivers/platform/apple/smc_core.c
./drivers/gpio/gpio-macsmc.c

>> So
>>=20
>> %p4ch - interpret as an u32, print the character in most significant =
byte first
>=20
> %.4s + be32_to_cpu()

Well, AIUI instead of

  printk(=E2=80=9C%p4ch =3D ...\n=E2=80=9D, &key);

you need to do

  u32 key_be =3D cpu_to_be32(key);
  printk(=E2=80=9C%.4s =3D ...\n=E2=80=9D, &key_be);

in at least 9 places now, the number of which will probably grow.
Just to make the case for *some* printk helper.

>=20
>> %p4cb - the same as %.4s
>=20
>> %p4cl - reversed to %.4s
>=20
> %.4s + swab32()

Sure, these two are uninteresting, probably added for completeness.

>=20
> So?

Well, so nothing. I am primarily explaining how that strange specifier
came to be.

Martin

> --=20
> With Best Regards,
> Andy Shevchenko

