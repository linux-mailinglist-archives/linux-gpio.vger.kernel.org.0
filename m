Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC3825AB4BC
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Sep 2022 17:12:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236212AbiIBPMW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Sep 2022 11:12:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236211AbiIBPMB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Sep 2022 11:12:01 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CD6E16EEE7
        for <linux-gpio@vger.kernel.org>; Fri,  2 Sep 2022 07:41:55 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id b2so1824171qkh.12
        for <linux-gpio@vger.kernel.org>; Fri, 02 Sep 2022 07:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=0ac1i9buWoWncajk6SXq/V2mUp/aPapb/moPxFtHBro=;
        b=mmaBi/9RC6JzJIPiGTLURB2g4mTUjg0f6HHHHeLisvJFyzFg3cllpWRBvU60UwISVN
         jy6mjv6UYv9oxlK69um/FYVDRIKQTkHR209BH6UvQM8oa6Wymarxp65qjBc+Bs1IdfOI
         1/rFKL14OWkpUnVbTqlF1u64YZuGaSotce3ZlBI1bKT7BD0UT5G9MXNmfYq9ZkOFflNg
         U2J1zR0fSA1f7n+jPsfAvrmCQjxRc4/SPJGL/1SoQVfqzWCLVMt/eaGrimYKpQGRmZEE
         J4jNztbsdP3fgPZ14Fvf8S7p0Zz4c1rtX8mqOvOhDTbKdkfgCXk6qgsfI9IDrsIe9yTq
         8NJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=0ac1i9buWoWncajk6SXq/V2mUp/aPapb/moPxFtHBro=;
        b=74IMCjy0O0aGrkUYFfFStPdeVb1xVKEkvO6ImRn5GJSZyrN7NE/RYqbmsygEN8HZE6
         G7l79OQfhHxLgGpr4dn5EpiJGOjSzxM3ahIJk0Jxp+zDp1DN4JMPa1KSm32YwyCdYplZ
         +xuZpl9e1s7tBcoBktnvYFicxjlJwKBuYwzuyaMAnvsmy/FYW9HreKHjMiz8GOiyKZId
         tniCKCpGNDzurj7AgQOf87AEI+SACgP1mrYfdaGwLMT6o04v3VbmbDiiikxdHGKZ/AKd
         A1mDX64dsuwuLr5NJvxSY5uHH5kS91FyfrTuC9Z1qgwT071l4WZmKeoViiaMfomogBJC
         Hhvg==
X-Gm-Message-State: ACgBeo3rrBG/iVnZMnMs6sufrXjWNWKEC2tEEhB7BWh+AlhOKqwD3Y4B
        cZBAnNXcaUHUEf4mH9lpqThd6S04KEbcu17tkIU=
X-Google-Smtp-Source: AA6agR56MurRTLIs4bBYExs7jDRPEMyhQr5Mhf/O8ly8l0LxrCoTs+3wDiuMvxTNR4W5Nf7u3JlY9+f75gF3CAk/OfE=
X-Received: by 2002:a05:620a:288a:b0:6b8:fcfe:db02 with SMTP id
 j10-20020a05620a288a00b006b8fcfedb02mr24165177qkp.504.1662129714040; Fri, 02
 Sep 2022 07:41:54 -0700 (PDT)
MIME-Version: 1.0
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk> <E1oTkeb-003t9e-Iy@rmk-PC.armlinux.org.uk>
 <CAHp75VcG5E+yTH2hG2CbnArsm+ZJ-sWRMmM-wLks0xUJkwSgcg@mail.gmail.com>
 <FEE9F7AE-B324-4426-AB26-17BDF30CFC91@cutebit.org> <CAHp75Vd8-mOuJvr=PRKjVKbz0SM9hPe39rEcraOMJFYtrwHjng@mail.gmail.com>
 <3B649A66-8116-432D-B88A-B5CE493EF930@cutebit.org> <CAHp75VeB3_sZ2vsSxMSsLeJSkyemDh9iOPHXJCN1mhodA13LNQ@mail.gmail.com>
 <E753B391-D2CB-4213-AF82-678ADD5A7644@cutebit.org> <CAHp75VdstDxcZ96d3XD=k8_q2oP3UvoL+QV-27BxWFyALWJ_QQ@mail.gmail.com>
 <85AE2F3E-6A1D-4AA0-9205-3E3DE5C6D79F@cutebit.org>
In-Reply-To: <85AE2F3E-6A1D-4AA0-9205-3E3DE5C6D79F@cutebit.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 2 Sep 2022 17:41:16 +0300
Message-ID: <CAHp75Vdfo87xT2S-MEO+z3o0eHZYtHHEzJBswSMNaWTSVhcXPA@mail.gmail.com>
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

On Fri, Sep 2, 2022 at 4:37 PM Martin Povi=C5=A1er <povik@cutebit.org> wrot=
e:
> > On 2. 9. 2022, at 15:33, Andy Shevchenko <andy.shevchenko@gmail.com> wr=
ote:
> > On Fri, Sep 2, 2022 at 2:12 PM Martin Povi=C5=A1er <povik@cutebit.org> =
wrote:

...

> >> you need to do
> >>
> >>  u32 key_be =3D cpu_to_be32(key);
> >>  printk(=E2=80=9C%.4s =3D ...\n=E2=80=9D, &key_be);
> >>
> >> in at least 9 places now, the number of which will probably grow.
> >> Just to make the case for *some* printk helper.
> >
> > Wouldn't this be one line
> >
> >  printk(=E2=80=9C%.4s =3D ...\n=E2=80=9D, &cpu_to_be32(key));
> >
> > ?
>
> That would compile? I thought that=E2=80=99s not valid C, taking an
> address of function=E2=80=99s return value.

Ah, you are right. My bad.

--=20
With Best Regards,
Andy Shevchenko
