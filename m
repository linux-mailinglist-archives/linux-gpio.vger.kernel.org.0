Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D24136BB587
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Mar 2023 15:11:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231663AbjCOOLK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Mar 2023 10:11:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231428AbjCOOLJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Mar 2023 10:11:09 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00FADE188
        for <linux-gpio@vger.kernel.org>; Wed, 15 Mar 2023 07:11:08 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-54195ef155aso191953757b3.9
        for <linux-gpio@vger.kernel.org>; Wed, 15 Mar 2023 07:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678889468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FGX60x9p4oWuTiJf6B1ZfJk1mMaS0COQOMjg31wuy5o=;
        b=jENBxPi/XCO1ht6RtCcBuyftc73bosjpr4Fq7+CIme9kjWAFxy0LeMfta8bR3JpF8v
         wpOqB77QeVXbn/pJx9DAskJM18XfmUPbKxC6/FI7UOpA5wYt5SH9NseMyaHeIW2Ah3FJ
         oGfm2G6uOWL65Lp9zOJREX//P8V1zW32gmSYZqG+Dpkzie9Bjuq9scXdau+37Cvr6ZJ7
         7kW+yUvZKUx9ijfDN1WsgdVUZ0BYX2vqCcPaj4c3stVTZMH5ua/kDvqt7ocUNqE/ldqO
         EAnChm9hyUrVoQrg8DSf9dLSIrUkiTJ0mLQjv4ZlxYXXBgd5XxSjVtk66cycZg3G0OYd
         /t/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678889468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FGX60x9p4oWuTiJf6B1ZfJk1mMaS0COQOMjg31wuy5o=;
        b=HX89GJfB0XNtGhQgKu+b3LieoBiirsIh3U7ht/00sUPL36H2/W5QSZ7O4yVw+CtwMS
         QzSeNloJiocyHalcSq33ehHB7VaIJ4MXwBJvC7zapmLduaL2meYK6ChwqRcxlot7jZs2
         oV4RUusSDTm6cG/h36AEalle6duJvu6wG9HDbFjKdG7IYJQNdBqfw2wu2dI7iCoB/9rZ
         ubdY6B47IBtuTOgSVExEnqEWH5bsIpFaC6AahJ4td4A2OxGMV4J3I4gL6zTyWJFc+n7y
         iXDGcfEVfkEdY2B9eu+NyRj79fAuSCdO0m2ZHUdrGBzQNdw4lOBxSvHvWOmgsEBVCyXv
         AHgQ==
X-Gm-Message-State: AO0yUKU1rIGQ1GPbXcwHzSc7D/iEAsGpdSKzSvMEd/aIicjn71WieQmD
        E73UNyjjbfpiLWAcFz+7idtYiB6ggzs6BMftZa81Og==
X-Google-Smtp-Source: AK7set/W9PNttG875z0fRt5a96OQ0tJa2XI0ULNOTLG3Ee+idMtjmLVV8oFoFRTDD/YYkA9YVnsmPUX620lVxiT03M8=
X-Received: by 2002:a81:ac53:0:b0:541:e84a:9d9 with SMTP id
 z19-20020a81ac53000000b00541e84a09d9mr8978ywj.7.1678889468162; Wed, 15 Mar
 2023 07:11:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230315083456.27590-1-brgl@bgdev.pl> <CACRpkdaBKxSbRxCoYRyNJMfjiDZ5TswYg7s-Z0Loy+aha4ZFLQ@mail.gmail.com>
 <ZBHQP3e0/iDs0Jyn@smile.fi.intel.com>
In-Reply-To: <ZBHQP3e0/iDs0Jyn@smile.fi.intel.com>
From:   Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date:   Wed, 15 Mar 2023 15:10:57 +0100
Message-ID: <CACMJSes1uQV=eNSTjhG+EWoOOZ8OrO1Y7=9K3DmbkV0qi4b_PQ@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] tools: gpiomon: fix setting event clock type
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Kent Gibson <warthog618@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org, Wes Tarro <wes.tarro@azuresummit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 15 Mar 2023 at 15:04, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Mar 15, 2023 at 09:44:17AM +0100, Linus Walleij wrote:
> > On Wed, Mar 15, 2023 at 9:35=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev=
.pl> wrote:
> >
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > Fix an inverted logic bug when parsing event clock type in gpiomon.
> > >
> > > Fixes: 8ffb6489286f ("tools: line name focussed rework")
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > Reported-by: Wes Tarro <wes.tarro@azuresummit.com>
> >
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> >
> > > -       if (strcmp(option, "hte") !=3D 0)
> > > +       if (strcmp(option, "hte") =3D=3D 0)
> >
> > I tend to code if (!strcmp(option, "hte")) but taste differs.
>
> Pity we don't have match_string() API in a libc or somewhere in the user =
space.
> Allows to avoid such mistakes at once.
>

We have several instances of such string parsing in tools/ in libgpiod
so feel free to add and use it. You can even port linux code verbatim
- libgpiod is GPL after all. :)

Bart
