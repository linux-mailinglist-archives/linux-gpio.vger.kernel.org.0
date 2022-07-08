Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C87556BCC8
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jul 2022 17:09:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238151AbiGHO6L (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jul 2022 10:58:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238753AbiGHO6I (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jul 2022 10:58:08 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A2726052B;
        Fri,  8 Jul 2022 07:58:04 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id r3so38232191ybr.6;
        Fri, 08 Jul 2022 07:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=lto50dUAZu3ra16SnNsGkPDnTG8DozCsxI6O7kkeRxY=;
        b=LRSsoBBWkP4CIIMrrnSKRQjpOULtrEHq7kw9zZZCz6d/ubwo4ADxpbrWfDEDV0IoPG
         7IDd6i+RoDWoxWzJ091nYOwUDmikxAPVFhigfanNqy1PrNVJL/7HgNTDs9jPXv/ooRjW
         56hsr278+mrHDz5QhIgGol+ppcrv1BsXmP0lgUFwwWHt9D7T+ZSQwE5fbw/gp7l5rK5w
         sf46ln6Q/LEkxDHGAFRvMowOchTvKETG8FcVcogvOMvVBmBGTBopA7pxTKyN0uIYsoXV
         E67Xs1+u6Rmx3a2lxMF4Md5D1YPZRknpAamXX0k2XVPMFm91zsIJMfR1KklX5drw2MJj
         z9nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=lto50dUAZu3ra16SnNsGkPDnTG8DozCsxI6O7kkeRxY=;
        b=vjnNR8lOd4XaEXWwy4KIrwm0avEkcn3+EFYWFk0jMdLXbOC+BJvOjryLuv8VVt0zEK
         ofDPK+72HddBlDrFycz6h5okFhSfeibfFIefr2QX2S5lMx1W321uSh/4l5E8Oj4VjHMh
         1HWfOMnpvCJjcXjPzJoWRy73WxXq91zNqDQThuah+cnTFVIMGTs1NMISWbdNmNLFybVY
         EJ9SZ2l4tIB95wa4uJ+orf4Qd2gM0wtEc6RRIwsFBfMwaKVMGp9O3gVlxi/Oaej6IbOR
         dcmtSpErBSgwrcHEbsdZKpv5fGQaSSYhCwEFd8E1YE3jfCrTw9XBwrvalX6MbCIyn3Tb
         UPeg==
X-Gm-Message-State: AJIora9BypT03ot8Z2g7gqjw/2D5hVA1MeUEJHHQtcgH1broRiWcP1Wv
        UjAyGhLGvxLntxeaxgoKVcCuGY6j4z9zw4vgWgE=
X-Google-Smtp-Source: AGRyM1uPzcoUN+a5BnHu5BgVBifDiqI6/aQ9JvMZKIIo4Jc1qjzRZlQBTdIdt1ymiwrqJFWekExgKpl7OD3dgQu2d8I=
X-Received: by 2002:a25:cbcf:0:b0:66e:8893:a02c with SMTP id
 b198-20020a25cbcf000000b0066e8893a02cmr4083198ybg.460.1657292283603; Fri, 08
 Jul 2022 07:58:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220708093448.42617-1-nuno.sa@analog.com> <20220708093448.42617-4-nuno.sa@analog.com>
 <CAHp75Vconnzkh6JA03X9G7QKNaBEu2fad7GwHckmyZY3rV8QVw@mail.gmail.com> <PH0PR03MB67867C03C5FE5604E948417099829@PH0PR03MB6786.namprd03.prod.outlook.com>
In-Reply-To: <PH0PR03MB67867C03C5FE5604E948417099829@PH0PR03MB6786.namprd03.prod.outlook.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 8 Jul 2022 16:57:27 +0200
Message-ID: <CAHp75Vc7kRC8Gf66N9X8jzwn_SRM67GTyQ4M_SqM-QAPGtEo=A@mail.gmail.com>
Subject: Re: [PATCH 03/10] input: keyboard: adp5588-keys: bail out on returned error
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

On Fri, Jul 8, 2022 at 4:35 PM Sa, Nuno <Nuno.Sa@analog.com> wrote:
> > From: Andy Shevchenko <andy.shevchenko@gmail.com>
> > Sent: Friday, July 8, 2022 4:25 PM
> > On Fri, Jul 8, 2022 at 11:36 AM Nuno S=C3=A1 <nuno.sa@analog.com> wrote=
:

...

> > Looks like a good candidate for bitmap_get_value8(pull_mask).
>
> I'm not touching the original way the driver was handling this
> kind of stuff. I do have in my mind to just convert this driver to use
> regmap and with it (by using the *bits functions) we can get rid of
> most of the "plain" bitmaps in the driver.

Works for me!

--=20
With Best Regards,
Andy Shevchenko
