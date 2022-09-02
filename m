Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E58965AB2F6
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Sep 2022 16:06:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238784AbiIBOGh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Sep 2022 10:06:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238786AbiIBOGR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Sep 2022 10:06:17 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 326F5135BAC
        for <linux-gpio@vger.kernel.org>; Fri,  2 Sep 2022 06:34:14 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id g14so1416186qto.11
        for <linux-gpio@vger.kernel.org>; Fri, 02 Sep 2022 06:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=Gkpmi9v/Zg1z+jYmfWZseXaPc8qDinSrvckWTlev+4o=;
        b=IlnWAH9ba0fxoVhZaboZc38zbbHoqqdVnynDSmCY4zEL5kazQWT1bBY/B9tDawwACF
         whpMF8OGNY9DED2tGDnAKQRooa00tzkmEhQe7MFlhtcj/U+I5goqgFcBTCzABlWuaA+L
         qe2DPEsRy+uszsvR1RGMr9hTaK/hOajBBLsSqcoNYWFO8R1//e86h7J8+TVIDpb5izay
         8Oi1BLNpytRbr6lRpGBY8RmpPIlqsMTLqd23Z5/3MbQnhkQgWpK7oUfgZbA9Zn7oF25B
         AsKD2EM3D35eB/zYCjxNS3B7Pqgpuz1u/fmGM+OKmc5v/E4lsz2VX+JZLZju2cf4IG4B
         svHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Gkpmi9v/Zg1z+jYmfWZseXaPc8qDinSrvckWTlev+4o=;
        b=2IYXGKxpoCyvWj2k1W2yqIxpDe1fY2d9kBjZqdEKgwm8vHrocdaU7WlLHtqDoTQAWr
         pUo2Y+fa5INIODMh20mjY5bQeVUo3Ptp3a3D6uUEylg+A/PlTamOOmfKL1vHn9Ju02tv
         1uaM3tfq5+pYBUF0cQ6XIfBi0rtoWk/xs0MlPuStF5H/pDWE8d6E/c1N2oeT67HaAPDv
         3zooRC4UwtQbJ/AZ515ImBNEsBQjohgtPa6/mIFKwP9G11B4xtm4q3SmOUy7dsIhdd3P
         wb0ZHTK1nU5oTS7cb5tiuUaiFLzOXgWEYQEV60t3S/i4vEDfHGRqWgULG3BcdVJby3XQ
         b5Jg==
X-Gm-Message-State: ACgBeo1lE8mgdIF9s27ydjOJKkSmvrUYav2iSY1532CVieSVn0mJv1XV
        OYZPvErrVSjugCbztmV0j9ELxcXpfIkr7DItwxc=
X-Google-Smtp-Source: AA6agR70JafKl8vd6yqzpSoneLWMOadRHZ7KK1Dfyex2M1IYykk+PqGzJOo7e4Fu15BAshv/O2UboAIo6utt735Vdmk=
X-Received: by 2002:ac8:5786:0:b0:343:3051:170d with SMTP id
 v6-20020ac85786000000b003433051170dmr28009819qta.429.1662125651651; Fri, 02
 Sep 2022 06:34:11 -0700 (PDT)
MIME-Version: 1.0
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk> <E1oTkeb-003t9e-Iy@rmk-PC.armlinux.org.uk>
 <CAHp75VcG5E+yTH2hG2CbnArsm+ZJ-sWRMmM-wLks0xUJkwSgcg@mail.gmail.com>
 <FEE9F7AE-B324-4426-AB26-17BDF30CFC91@cutebit.org> <CAHp75Vd8-mOuJvr=PRKjVKbz0SM9hPe39rEcraOMJFYtrwHjng@mail.gmail.com>
 <3B649A66-8116-432D-B88A-B5CE493EF930@cutebit.org> <CAHp75VeB3_sZ2vsSxMSsLeJSkyemDh9iOPHXJCN1mhodA13LNQ@mail.gmail.com>
 <E753B391-D2CB-4213-AF82-678ADD5A7644@cutebit.org>
In-Reply-To: <E753B391-D2CB-4213-AF82-678ADD5A7644@cutebit.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 2 Sep 2022 16:33:35 +0300
Message-ID: <CAHp75VdstDxcZ96d3XD=k8_q2oP3UvoL+QV-27BxWFyALWJ_QQ@mail.gmail.com>
Subject: Re: [PATCH 5/6] gpio: Add new gpio-macsmc driver for Apple Macs
To:     =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik@cutebit.org>
Cc:     Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        Hector Martin <marcan@marcan.st>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sven Peter <sven@svenpeter.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 2, 2022 at 2:12 PM Martin Povi=C5=A1er <povik@cutebit.org> wrot=
e:
> > On 2. 9. 2022, at 12:23, Andy Shevchenko <andy.shevchenko@gmail.com> wr=
ote:
> > On Fri, Sep 2, 2022 at 12:47 PM Martin Povi=C5=A1er <povik@cutebit.org>=
 wrote:
> >>> On 2. 9. 2022, at 8:31, Andy Shevchenko <andy.shevchenko@gmail.com> w=
rote:
> >>> On Fri, Sep 2, 2022 at 12:52 AM Martin Povi=C5=A1er <povik@cutebit.or=
g> wrote:

...

> >>> I don't see why we need that. The %.4s (0x%08x) is repeating that wit=
h
> >>> the existing codebase. (I do understand why v4l2/drm have it). Ideall=
y
> >>> the first should use %4pE, but it might not be suitable in some cases=
.
> >>
> >> Just from a superficial understanding of things: %p4ch on little-endia=
n
> >> will print in a reversed order to %.4s. As I see it the handling of
> >> endianness is the value proposition of the new specifiers.
> >
> > So, what prevents you from adding this to %pE?
> > The preferred way is not adding a specifier for a single user with a
> > particular case, esp. when it's covered by the existing ones.
>
> Adding the endianness conversion into %pE as, ehm, an =E2=80=98escaping f=
lag=E2=80=99?
> If you think that would be accepted...
>
> I guess this was added on the assumption that keys like this will
> be a common occurrence in interaction with Apple firmware. Though
> greping the =E2=80=98asahi=E2=80=99 staging tree for =E2=80=98%p4ch=E2=80=
=99 I only see it in the
> SMC code (9 times):
>
> ./drivers/power/reset/macsmc-reboot.c
> ./drivers/platform/apple/smc_core.c
> ./drivers/gpio/gpio-macsmc.c

> >> %p4ch - interpret as an u32, print the character in most significant b=
yte first
> >
> > %.4s + be32_to_cpu()
>
> Well, AIUI instead of
>
>   printk(=E2=80=9C%p4ch =3D ...\n=E2=80=9D, &key);
>
> you need to do
>
>   u32 key_be =3D cpu_to_be32(key);
>   printk(=E2=80=9C%.4s =3D ...\n=E2=80=9D, &key_be);
>
> in at least 9 places now, the number of which will probably grow.
> Just to make the case for *some* printk helper.

Wouldn't this be one line

  printk(=E2=80=9C%.4s =3D ...\n=E2=80=9D, &cpu_to_be32(key));

?

So I don't see disadvantages right now. Later on we can consider a new
specifier _separately_, otherwise this series would be dragging for no
sense.

--=20
With Best Regards,
Andy Shevchenko
