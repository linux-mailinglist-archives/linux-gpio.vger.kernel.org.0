Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4D01748D23
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jul 2023 21:07:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233719AbjGETHS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 Jul 2023 15:07:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233721AbjGETGS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Jul 2023 15:06:18 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06379273F
        for <linux-gpio@vger.kernel.org>; Wed,  5 Jul 2023 12:04:24 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-51e00695e21so15191a12.1
        for <linux-gpio@vger.kernel.org>; Wed, 05 Jul 2023 12:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688583859; x=1691175859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dlk6SrTMjIXxIPbw9fNdLHRvDWOQ6YKITV0aoNaBjc4=;
        b=XYZNEMk83QxCPePjhwf6tfGfc1Q+Xkje1KPfa/CKqbGDlr9oSpVOsud+H+N135zb0j
         l7RbAb+5TcGlTpzSiou/1KzCDCjs0tHWuzgsHXjAwY8rXuKJ2ZAvsqCCnhkzMfmHXB57
         LC/fjK16TrOlZycqtDtsvLzGVxqTT/H1v7IbyjY9Ob6jNabhqrk+93dQUBaPNvm4qYKU
         ibyaB2yanm4JKpD4ezp4gi3wa3rusrVTUL1u0kBqVwODFObRyyPenA8aFTp6jXPrFw3g
         cdYOE9VTHwsvsmK312raqpAURPpqsvRWOdytZs4cmkUSNIgb3bhj1HqsXooBi2ZAA508
         m1NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688583859; x=1691175859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dlk6SrTMjIXxIPbw9fNdLHRvDWOQ6YKITV0aoNaBjc4=;
        b=KTtpezX5IRcFd+yiFRMULXIguMz/X9kCh5pX/bnRjzdKdyksFqN90dVpRm1E1RYU9x
         WTN6LrmE8g9pmuuRUt2NGO73K3cM/fwevelBq7o4WZAI/bt/EgWyf+Ei/m/nRvPajWK4
         npztMcoytTzlLgN32EY6GW77wmTRUjjspIkAReHUycmN4Kl3RMNgS5B8p0PflLg+SiwR
         I/qcKevvE9nAckwK7YZDGL/0OHunMJgt9M7S05TCi7OJdjsk83E1Bz4e1VP6UG8/1NlW
         SpN6HmUpCorRSetPxPO8YqEebtzV4MEM1UDtRPV79EOGQygUmlC16EZRCfmu72PzvGWx
         CvQA==
X-Gm-Message-State: ABy/qLbGWzoVPP4aofb5bQqwe601uTfdIJMuO9tp9fnUro68h5KsrVWk
        znXhXEdZV6VXEhs94CNzraES+NRH4/67cVViXlk=
X-Google-Smtp-Source: APBJJlH9hww3qfT9A5qO2+YHaxCkFDY6PqoU/anTr+1Ux0HQiV0wNHbefPdtv+rCC7qGgiXFosnvUupFKeFulWo01BM=
X-Received: by 2002:aa7:cb52:0:b0:51b:eb5f:baf with SMTP id
 w18-20020aa7cb52000000b0051beb5f0bafmr34341edt.18.1688583859217; Wed, 05 Jul
 2023 12:04:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230705153713.2511647-1-shenwei.wang@nxp.com> <CAHp75Vf+RovRT2rYJDnizeRUwwKE_Twfd+tF5pY3XEc_xOkXYg@mail.gmail.com>
In-Reply-To: <CAHp75Vf+RovRT2rYJDnizeRUwwKE_Twfd+tF5pY3XEc_xOkXYg@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 5 Jul 2023 22:03:43 +0300
Message-ID: <CAHp75VenYdKJv5=+gCuwPtBM0NEDJiHiyOd-1fDXZPuuXqyipw@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: mxc: add runtime pm support
To:     Shenwei Wang <shenwei.wang@nxp.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
        imx@lists.linux.dev, linux-imx@nxp.com
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

On Wed, Jul 5, 2023 at 10:01=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Wed, Jul 5, 2023 at 6:37=E2=80=AFPM Shenwei Wang <shenwei.wang@nxp.com=
> wrote:
> >
> > Adds runtime PM support and allow the GPIO controller to enter

Add

> > into runtime suspend automatically when not in use to save power.
> > However, it will automatically resume and enable clocks when a
> > GPIO or IRQ is requested.
> >
> > While putting the GPIO module itself into power saving mode may not
> > have an obvious impact on current dissipation, the function is necessar=
y
> > because the GPIO module disables its clock when idle. This enables the
> > system an opportunity to power off the parent subsystem, and this conse=
rves
> > more power. The typical i.MX8 SoC features up to 8 GPIO controllers, bu=
t
> > most of the controllers often remain unused.

...

> > +       pm_runtime_set_active(&pdev->dev);
> > +       pm_runtime_enable(&pdev->dev);
> > +       err =3D pm_runtime_resume_and_get(&pdev->dev);
> > +       if (err < 0)
> > +               goto out_pm_dis;
>
> So, after this if an error happens, you will have PM left enabled and
> the next probe won't work as expected, right?

Just noticed that this patch completely screwed up the error handling
WRT clock and PM.

...

> >         platform_set_drvdata(pdev, port);
> > +       pm_runtime_put_autosuspend(&pdev->dev);
> >
> >         return 0;
>
> ...something here is missing?
>
> > +out_pm_dis:
> > +       pm_runtime_disable(&pdev->dev);
> > +       clk_disable_unprepare(port->clk);

This is definitely in the wrong position to begin with.

> >  out_irqdomain_remove:
> >         irq_domain_remove(port->domain);
> >  out_bgio:

--=20
With Best Regards,
Andy Shevchenko
