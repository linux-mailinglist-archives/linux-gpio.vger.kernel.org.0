Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E3EA6FCA66
	for <lists+linux-gpio@lfdr.de>; Tue,  9 May 2023 17:42:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235388AbjEIPmR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 May 2023 11:42:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230060AbjEIPmQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 May 2023 11:42:16 -0400
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F00F10CF
        for <linux-gpio@vger.kernel.org>; Tue,  9 May 2023 08:42:15 -0700 (PDT)
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-757942bd912so52544585a.2
        for <linux-gpio@vger.kernel.org>; Tue, 09 May 2023 08:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683646934; x=1686238934;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=etyusjk1GXFs4nnYfd4cGeJfrsfR/4ZZW0m7Y3cJMhE=;
        b=gQvgx4yaxNxAJ4z6OnVdTFJD7nfmxqpFsrcSlJ+//USie9wQ4d+jFgdgb0oN/9Nklv
         75C0QiRvyWBPLvCyVBh0jJHS1nVmgSjOyCGdQeUvzx65J7ZtRZVL2b+TUc0Tpp+CesG5
         TgB51BGvVxMzEpfDA/UAYy8b8LglTKAKOGHhs+V0ftNypCy491RHWnLgLtqcnst2zlHv
         Jc76yXe08VJyLcp0XCogs7frY3nLbmnwwbw25KpABxQzyAkBwgfb6RPGv83SbNQeeC3t
         pRbkGxNtS2V89A0hXYX8eLhUFTbkDUQHksQ7zogoV1KwfD/1qbxwLqTTcskkj9lxpGvd
         h83g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683646934; x=1686238934;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=etyusjk1GXFs4nnYfd4cGeJfrsfR/4ZZW0m7Y3cJMhE=;
        b=OjGCytXzKEZAHEU8ZSCfq5XhJHvY7BJXO8/nBznmeHNU4n9c0xioSqus8tPuW5LoMz
         CiF/UGV+a3YNZFNU4Y0ewRZlVVA75CkRiiEkH37qLJCBM1lRqAiBkexjCAbmnipzRsam
         L8yV1AlafZtwfEjGNB9aDZ+CkLsPRY6RQigZ27iszXINf5W5jZC6p0ysBEbc4Vu6Bt5g
         /+5NVhVwtTAARD6oe/ajoVQ/imMRbC7g2d2PGFqXlSWn74Ts71SWydztxhh7W09pBygM
         pVgex9tlMnyXMb9JWsFPPAuSyczvlhdPzw7Mz0xTqvNrCX0sc4gHQXqMhbVKJjlZtr34
         Qelw==
X-Gm-Message-State: AC+VfDyUg0tUBWuj5S+Zr8W2+JhGhlJ1JJUooJRaTnEpCYc3iAUV3LHy
        T4MYD+kQfRki3LJYh1EdrZJB5HgRZtHp+wuAOq8=
X-Google-Smtp-Source: ACHHUZ7m1Owh79aqBIldjLKAWVnO6vNex98FkCdiuazHdseDmML3KQFsOqWVhZ+cp2cTzitnRA9WyxgBEP4Zbt7CMqE=
X-Received: by 2002:a05:6214:1cc4:b0:5c7:d03c:f2b2 with SMTP id
 g4-20020a0562141cc400b005c7d03cf2b2mr18822533qvd.28.1683646934468; Tue, 09
 May 2023 08:42:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230508194555.1057007-1-shenwei.wang@nxp.com>
 <CAHp75VesbGkmG_7haH3LvHawA1Z3=TGv+w-kqF5nUkaTd5tfag@mail.gmail.com> <PAXPR04MB9185BFE399C00B2BEB3184C589769@PAXPR04MB9185.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB9185BFE399C00B2BEB3184C589769@PAXPR04MB9185.eurprd04.prod.outlook.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 9 May 2023 18:41:38 +0300
Message-ID: <CAHp75VfpgSaNvnZwVYD-vXX0G7eeWimxrqKGyNReB7t2ZQ6h_g@mail.gmail.com>
Subject: Re: [EXT] Re: [PATCH 1/1] gpio: mxc: use platform_get_irq_optional()
 to avoid error message
To:     Shenwei Wang <shenwei.wang@nxp.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stephen Boyd <swboyd@chromium.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        dl-linux-imx <linux-imx@nxp.com>,
        Fugang Duan <fugang.duan@nxp.com>
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

On Tue, May 9, 2023 at 6:31=E2=80=AFPM Shenwei Wang <shenwei.wang@nxp.com> =
wrote:
> > From: Andy Shevchenko <andy.shevchenko@gmail.com>
> > Sent: Tuesday, May 9, 2023 4:12 AM
> > On Mon, May 8, 2023 at 10:46=E2=80=AFPM Shenwei Wang <shenwei.wang@nxp.=
com>
> > wrote:

...

> > >         if (irq_count > 1) {
> > > -               port->irq_high =3D platform_get_irq(pdev, 1);
> > > +               port->irq_high =3D platform_get_irq_optional(pdev, 1)=
;
> > >                 if (port->irq_high < 0)
> > >                         port->irq_high =3D 0;
> >
> > I would rather do
> >
> >   err =3D platform_get_irq_optional(pdev, 1);
> >   if (err >=3D 0)
>
> Should be "if (err > 0)", right? As the platform_get_irq_optional() retur=
n non-zero
> IRQ number on success.

Either way will work, but your proposal is better.

> >     port->irq_high =3D err;
> >
> > >         }
> >
> > And looking into the code the above piece makes more sense after asking=
 for
> > the first (mandatory) IRQ.


--=20
With Best Regards,
Andy Shevchenko
