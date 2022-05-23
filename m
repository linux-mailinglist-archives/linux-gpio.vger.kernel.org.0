Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A091530C9F
	for <lists+linux-gpio@lfdr.de>; Mon, 23 May 2022 12:40:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232752AbiEWJOE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 May 2022 05:14:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232732AbiEWJOD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 May 2022 05:14:03 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2672C46B33
        for <linux-gpio@vger.kernel.org>; Mon, 23 May 2022 02:14:03 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-2fee9fe48c2so140892097b3.3
        for <linux-gpio@vger.kernel.org>; Mon, 23 May 2022 02:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=SQZsaj0M8fHShXXknzlKyPhMqdrqN8j1Wb/aoO8KOSU=;
        b=x9yzEPCVMpUEX5ggfloOSfYRwd3Ucvm/la2zeRE/aRDZsLmo7Vpl7HFkkL9STksumZ
         PkpJ2Ec4rQV469rhN7e5wL1ZFnlab+tOWBxTdIECeQa6DXCZzVvJkR4aFoTot5gCtBFq
         IaX/NFrX2T+kjvEkzcn7TaucsIOq9nUwz7V6jOxpncJ9TPJynh4S8ohW9cD9cp6s5bEI
         fBeO3Zm8uMFk5F2nSQW1kcF8zvqTx+NuvTkA22c97/3WYIwlVlZfhZnJrGJ27DoO690l
         hS6J7wxlhIVryBsWGQUOUQWt5JBsMXjSLq1JY8nKUHIMkyx/0GAyS8Zl4Ek3+MyYqlyt
         6mdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=SQZsaj0M8fHShXXknzlKyPhMqdrqN8j1Wb/aoO8KOSU=;
        b=oAWswPHfE79zfeFwOXOTZ7QQ21FBIwCPRUac3Wv8q+kNCuiwtExBNmxATgODShe4J1
         kgCZjFrb7hE4gdC/u+xEybKn8bV5Dfjeyk04lEsETUSx9WBDx630PJN8DArpHGmzz3o7
         KLgt/g0nLo5W0ugVkqmQMZOJ5bnK9VMTmk4xXx8Rpbi+mzwHL6cY1YCZCeyWzqOarGNx
         8M0myfCL+ElfCe0AmlKiGlqo3UFVMYcTIZtBJXyfknpp3ghrQ6Fr8G6H5ucJIOEQbUrZ
         6VSjnoJ+FC91H4Dsb9W86CBMXtC89E+QcUtwfkn1Bmcy3izBk7OWdCSddDyXbRbhY5bR
         8hJQ==
X-Gm-Message-State: AOAM530b4akrJezczplZrLGvPsYStApNqRo9AB1RzYi+otrOMaIhPPIO
        aF65pAIkX6Nu07gYd8hyiPMcjmkBtFqISveSYPYntUdFNMw=
X-Google-Smtp-Source: ABdhPJxgQLDBBnR26JqlGTi2StmRR07MCVb8Kdv8PsM2z/6EVmtDMUqtw8mTN0odh2BP5lFbmMY5iMm+zZxU6QFgNcE=
X-Received: by 2002:a81:c07:0:b0:2ff:8a7b:f37c with SMTP id
 7-20020a810c07000000b002ff8a7bf37cmr14523063ywm.118.1653297242396; Mon, 23
 May 2022 02:14:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220523083947.840708-1-u.kleine-koenig@pengutronix.de>
 <CACRpkdb10ZdARL1cmAkYVeVzJz4HQs8djrNHs50k7hWfCZxrjg@mail.gmail.com> <20220523090941.fvtjo4lykqgmaqvj@pengutronix.de>
In-Reply-To: <20220523090941.fvtjo4lykqgmaqvj@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 23 May 2022 11:13:51 +0200
Message-ID: <CACRpkdZM+iuoENUBbREFO0NYWird1Wwu_dhYvGMC8aUMooiUYQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: adp5588: Remove support for platform setup and
 teardown callbacks
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        kernel@pengutronix.de,
        Michael Hennerich <michael.hennerich@analog.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 23, 2022 at 11:09 AM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> On Mon, May 23, 2022 at 10:43:20AM +0200, Linus Walleij wrote:
> > On Mon, May 23, 2022 at 10:40 AM Uwe Kleine-K=C3=B6nig
> > <u.kleine-koenig@pengutronix.de> wrote:
> >
> > > If the teardown callback failed in the gpio driver, it fails to free =
the
> > > irq (if there is one). The device is removed anyhow. If later on the =
irq
> > > triggers, all sorts of unpleasant things might happen (e.g. accessing
> > > the struct adp5588_gpio which is already freed in the meantime or sta=
rting
> > > i2c bus transfers for an unregistered device). Even before irq suppor=
t was
> > > added to this driver, exiting early was wrong; back then it failed to
> > > unregister the gpiochip.
> > >
> > > Fortunately these callbacks aren't used any more since at least black=
fin
> > > was removed in 2018. So just drop them.
> > >
> > > Note that they are not removed from struct adp5588_gpio_platform_data
> > > because the keyboard driver adp5588-keys.c also makes use of them.
> > > (I didn't check if the callbacks might have been called twice, maybe =
there
> > > is another reason hidden to better not call these functions.)
> > >
> > > This patch is a preparation for making i2c remove callbacks return vo=
id.
> > >
> > > Fixes: 80884094e344 ("gpio: adp5588-gpio: new driver for ADP5588 GPIO=
 expanders")
> > > Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> >
> > Good riddance!
> > But also remove the setup and teardown prototypes in
> > include/linux/platform_data/adp5588.h
>
> Please reread the commit log. They were not remove on purpose. If you
> missed that part, you also missed half of the "fun". :-P

Ugh never review patches before the second cup of coffee.
What a weird reuse of callbacks. Oh well they are not so weird after
this.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
