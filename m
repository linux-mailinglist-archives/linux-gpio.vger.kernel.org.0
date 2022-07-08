Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 657A656BC45
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jul 2022 17:09:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238692AbiGHPIG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jul 2022 11:08:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238766AbiGHPIF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jul 2022 11:08:05 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38EA461D50;
        Fri,  8 Jul 2022 08:08:05 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-31c89111f23so150839767b3.0;
        Fri, 08 Jul 2022 08:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=FoauNT8sTZEYYOxxre6ENk8BK6sfLeoBHDyIlRgoBcU=;
        b=h6gG2azplVjGTYbAAIwgA5ZQgUTP0y3rNoPeOb47vm+LNmPow/NiMgcHUvyKUfi3a3
         TON/uJqHbf+fn2j4lv7SOeMJ4UothO1cLdL9hVW2BcVMBLCz7phCMt23Ftuh1WTiirkf
         urXYRge+otewk6gnpqdRTThn5R1w/VjcEUDgcsbom0yUa2INPJq4TxvPH/oFeonZMLh8
         NOEfRcQUSrtUhFjFliTq6hdxj9zZf7968DfmhW3rk3dSS49vhw1IW45In6Sb/livv6pQ
         swgXC9J0ykcneE/3LgS+JcbWFMwhOsSL5N4LRVR+F4frDf1S0MQBaJVTftjl4c+LhLTI
         waeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=FoauNT8sTZEYYOxxre6ENk8BK6sfLeoBHDyIlRgoBcU=;
        b=LbLjisPR738cZUr2UjIydEdWIJV8LB+XlRCxsv1H4SDKcb1/4nxTJYbkUiUBwYtvhk
         HtfX9Jy3wHObOoU/GZOkdrZE150uMUCQv5mT/4d9vWaVPAiOmsF7KDNV/qsfFt2YBIE8
         B2N3mZcEU3hzWxs70XF6QhnrxMNRR9CCRWcfWGuAu9/0atSjcSi5mtQ9vq6/B/GenAD1
         z9fNtxRBGNf7foisuorFLVmhTtYe2lnDJ5yTfcOrpkD5JOTaKS06VTGfrdAN50vwAxox
         MM4y61WlcWtwTgzVULefh5VZRysAXt1d2DbTkTFz/9KQTVj1nTGy19YfdGwT8u4v60ZT
         J39A==
X-Gm-Message-State: AJIora8/v4HGQkq9SHeN+bFScLvkjHj9Cr9b0CMK3jdNDzZ4qkGXpAT9
        9tdMNFx7ntRW2o+GD8rubAS41ySxNx5tpDVGarfLQ1mXDLY=
X-Google-Smtp-Source: AGRyM1t2nBQ1nmniHR0WGe1SNeZCNy0OtQYHTstAF8J6Kom7cNEliNsvADL2pDMCSKFz5ATmNKonFCWHoV8j8AcF2hU=
X-Received: by 2002:a81:4986:0:b0:31d:388b:d08d with SMTP id
 w128-20020a814986000000b0031d388bd08dmr147327ywa.185.1657292884081; Fri, 08
 Jul 2022 08:08:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220708093448.42617-1-nuno.sa@analog.com> <20220708093448.42617-5-nuno.sa@analog.com>
 <CAHp75Vcv8i-XXarjA=sE_gkG57ngADLrsG2=xA71zOfxtfEUCg@mail.gmail.com> <PH0PR03MB67864AAC5B51C36E6FB202BF99829@PH0PR03MB6786.namprd03.prod.outlook.com>
In-Reply-To: <PH0PR03MB67864AAC5B51C36E6FB202BF99829@PH0PR03MB6786.namprd03.prod.outlook.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 8 Jul 2022 17:07:26 +0200
Message-ID: <CAHp75VfqT7L7EkSt=6DTwYeK-Nz6pX9edhrfoAR9AUTz40pcMA@mail.gmail.com>
Subject: Re: [PATCH 04/10] input: keyboard: adp5588-keys: add support for fw properties
To:     "Sa, Nuno" <Nuno.Sa@analog.com>
Cc:     devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "Hennerich, Michael" <Michael.Hennerich@analog.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
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

On Fri, Jul 8, 2022 at 5:04 PM Sa, Nuno <Nuno.Sa@analog.com> wrote:
> > From: Andy Shevchenko <andy.shevchenko@gmail.com>
> > Sent: Friday, July 8, 2022 4:56 PM
> > On Fri, Jul 8, 2022 at 11:37 AM Nuno S=C3=A1 <nuno.sa@analog.com> wrote=
:

...

> > Okay, you add something in the wrong form and then fix it in the other
> > patch in the very same series? Please no ping-pong type of changes.
> > Squash / rebase your series accordingly.
>
> Well, I thought to just copy it as it was on the platform file and then j=
ust fix
> it with the rest of the coding styles changes. But I'm fine in fixing it =
already
> in this patch. In fact, there's a lot of defines that are not used (it's =
just
> defining the complete register map) so I can as well get rid of all the s=
tuff
> that is not used anywhere in the driver.

This needs to be split to:

1) fix existing
2) move data
3) use that data

Or

1) move data (no other changes, if possible)
2) fix data
3) use it

...

> > > +       ret =3D adp5588_write(client, KP_GPIO2, KP_SEL(kpad->cols) &
> > 0xFF);
> >
> > Do you need these " & 0xFF" parts?
>
> Not sure but probably not. I just kept as it was...

It's rather for a separate change.

--=20
With Best Regards,
Andy Shevchenko
