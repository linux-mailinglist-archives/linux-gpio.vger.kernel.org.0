Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C79C45AB309
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Sep 2022 16:09:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237257AbiIBOJl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Sep 2022 10:09:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238861AbiIBOIg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Sep 2022 10:08:36 -0400
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9834D83BF2
        for <linux-gpio@vger.kernel.org>; Fri,  2 Sep 2022 06:36:55 -0700 (PDT)
Received: by mail-qk1-x734.google.com with SMTP id g21so1690927qka.5
        for <linux-gpio@vger.kernel.org>; Fri, 02 Sep 2022 06:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=WJD9hUtu4rC5sltdkxxaBZYUARUC2mjdG4r45BSg2Do=;
        b=l6LgwyeBvG+nfpd4wbpmiosLOHAznyozSmvz9IQera5MoToj5Cj302ZlObMTUeJaV9
         jxBWb2pBODtZgU0TTtkko7vlP8V2Pvhlen53adTwClVlZYvH4/oE0ASf9lmPtsbTat4Z
         L4W5uqKKDgcTuE4xeHAmTn49o2MCqrmTPQTSNN9xsamwip+h9Bf1ruin0WJRAjBMSALb
         bDcUBfqEMJv6G+X1tbRjE6vTuXyKPO9sAbVAiQcpT0iB2z4Soqqk/shOR7aGu0wnNijf
         z7WYhwFPxviQk7YG6nvxE6LPGSpAlOiFmkzHE4oGSwZbm58ftRX8la/yAD3xo+5KyzMt
         7VuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=WJD9hUtu4rC5sltdkxxaBZYUARUC2mjdG4r45BSg2Do=;
        b=pelYiieGmeGtGRxCRGWE0tPtEZ5C3VwVi9ErTqAcdOudELzk22DWab1C9kiXix/ngO
         UQtCj2Rt0FlUgFxwIQrLQbwyeC6Y42s5wyubLpKPfQEns73iyBZgpCKOFgGUtOlB06k+
         vCYHT5KveFauQKIVwkT8uLrQNpo3sNxyg7RUKySWgy1kTZa5OetInWfPwD+jgPrQhy8q
         +CwOEM0iZUmi42dXsalLOd9IJCTI3BfKM9M0acUzqTdjdXowgepeLe3jSruOyfSQIxTI
         UXK1SzcUyWakmowK+QGnRTy2qUdR4HdBtSrbjifMA6hm7xey2miT9TMZkgAyUQGDEHrQ
         Q35w==
X-Gm-Message-State: ACgBeo39bfuUY1oSkCqAEjtvEADkMA0S692U4a7pJeURUYz48AfV8eGz
        KEANOLT0vALOI6UwA2SCJRB0NOLB/1gS+0ICuAo=
X-Google-Smtp-Source: AA6agR7WApldRnUlS26hSE7qvi7+8SyDZzb5oOo+KIVN7qKJkdDbXbBplgaKPlebaG6+lKPG7ZopDUJ4VhSVuT9G8e0=
X-Received: by 2002:a05:620a:288a:b0:6b8:fcfe:db02 with SMTP id
 j10-20020a05620a288a00b006b8fcfedb02mr23904454qkp.504.1662125810519; Fri, 02
 Sep 2022 06:36:50 -0700 (PDT)
MIME-Version: 1.0
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk> <E1oTkeb-003t9e-Iy@rmk-PC.armlinux.org.uk>
 <CAHp75VcG5E+yTH2hG2CbnArsm+ZJ-sWRMmM-wLks0xUJkwSgcg@mail.gmail.com>
 <FEE9F7AE-B324-4426-AB26-17BDF30CFC91@cutebit.org> <CAHp75Vd8-mOuJvr=PRKjVKbz0SM9hPe39rEcraOMJFYtrwHjng@mail.gmail.com>
 <3B649A66-8116-432D-B88A-B5CE493EF930@cutebit.org> <CAHp75VeB3_sZ2vsSxMSsLeJSkyemDh9iOPHXJCN1mhodA13LNQ@mail.gmail.com>
 <E753B391-D2CB-4213-AF82-678ADD5A7644@cutebit.org> <CAHp75VdstDxcZ96d3XD=k8_q2oP3UvoL+QV-27BxWFyALWJ_QQ@mail.gmail.com>
In-Reply-To: <CAHp75VdstDxcZ96d3XD=k8_q2oP3UvoL+QV-27BxWFyALWJ_QQ@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 2 Sep 2022 16:36:14 +0300
Message-ID: <CAHp75Vfg+qZeVaGwi_SxWcnF77s6R980qe3nqinxHuvG-dx3ng@mail.gmail.com>
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

On Fri, Sep 2, 2022 at 4:33 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Fri, Sep 2, 2022 at 2:12 PM Martin Povi=C5=A1er <povik@cutebit.org> wr=
ote:

...

> > in at least 9 places now, the number of which will probably grow.
> > Just to make the case for *some* printk helper.
>
> Wouldn't this be one line
>
>   printk(=E2=80=9C%.4s =3D ...\n=E2=80=9D, &cpu_to_be32(key));
>
> ?
>
> So I don't see disadvantages right now. Later on we can consider a new
> specifier _separately_, otherwise this series would be dragging for no
> sense.

Just to make my point clear. The single user or small subset of users
does not justify the new specifier. New specifier is a lot of burden
to printf() code. Find 3+ independent users and we can talk again.
That's why I suggest to either create a local (to apple whatever
stuff) helper or use existing specifiers in _this_ series.

--=20
With Best Regards,
Andy Shevchenko
