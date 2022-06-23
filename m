Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B81AF5589F6
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jun 2022 22:20:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229745AbiFWUUS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Jun 2022 16:20:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229733AbiFWUUR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jun 2022 16:20:17 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F36F74E3B9
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jun 2022 13:20:15 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id z11so534878edp.9
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jun 2022 13:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fAKuybCH+dwB1fMNirGRqtMvEWYeJzWmxMGv84MA8aE=;
        b=KME+38Xcr1BELnAPftspCCgUlWz/O9gpyn6U8mMdFSQIbnfF6/U3LpylhOO7d+jjyy
         BMLWcYPwC6aXcnhEmsrucLY1P8wAgblqe3TCOCnyu6ofrXXDy52M2iVPYWyFmKoj9fGx
         izOSeUCLhYGk6o2oXXsVfbmeCwsA9h3U240e4gfFllwd4YGHnqaXprCiiSTsZaZ3JPte
         ZEa8TZ6JW5KYB6yzh7rXXd2vy8i+d7c7I+QMBYLHt1y4iEKtBtWAlSyLY1HcDVdmqkHB
         J8hnDuOa6QOJ+Zvsd1bM8cbhLgqQef0MvgGiDU7pxBush8+rh3nOFr4Lmy+yh00p0weI
         D/3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fAKuybCH+dwB1fMNirGRqtMvEWYeJzWmxMGv84MA8aE=;
        b=deO4qalkiRRm/3BCH84FOHJxMkgVJ9I4K8LKakB2jntNGHjqFICZ+UsDYh/IQagivd
         hBCLayOy7pZo0zgS/ysegs8jB7/+/TMcTLkwS6VV8eiWSJZjoDjyg4w8OaLPk2MMcRC8
         GdYeN/h2dNfldCO6FY7ccPSxbGntR15b8+mItB70U3BkfG3Z01/G6qRit7LT8TPROFic
         XICOm3h7gyfexYHZqlmqor7WgdGcj93An2qPnTNfG45Mtvuo6ETTgV1mL4oaKzvfQWVc
         U6KbKF9aW6GtdGWmr/Sn8Xbas8Oxa51d9B69PC26UNodL5lBxagJUjV4Kg8xYqpyzXcM
         TBsw==
X-Gm-Message-State: AJIora/alrvoIM4uFQ3GIgHc8RGTBG7NY/qsPV2k+7XPGfF6VfqK8BTx
        Q0CuhzODrTSGzaGIqqxS5tH2bCDTrKpP2lY35krVGw==
X-Google-Smtp-Source: AGRyM1sefRXRZuBMZmLCIuE/E/N9Qsz/+HjOWAx/A9T3s/9nmY1cLplssQUkWwd4E5zHKvzURX7iKcvBi1kbILbQHnI=
X-Received: by 2002:a05:6402:18:b0:435:9a79:9a40 with SMTP id
 d24-20020a056402001800b004359a799a40mr12856318edu.328.1656015614585; Thu, 23
 Jun 2022 13:20:14 -0700 (PDT)
MIME-Version: 1.0
References: <27612e81-d843-d161-ecd2-c653c7d5bae9@gmail.com> <84cdc48a-feb8-4aa5-7d96-a68f2c556e25@gmail.com>
In-Reply-To: <84cdc48a-feb8-4aa5-7d96-a68f2c556e25@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 23 Jun 2022 22:20:03 +0200
Message-ID: <CAMRc=Mc85Yw3uRGwTLFtZxBt81M5T8p0B+sQ4RoxB-QvgHdm_A@mail.gmail.com>
Subject: Re: [PATCH] gpio: Fix kernel-doc comments to nested union
To:     Akira Yokosawa <akiyks@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Joey Gouly <joey.gouly@arm.com>, Marc Zyngier <maz@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jun 12, 2022 at 2:02 AM Akira Yokosawa <akiyks@gmail.com> wrote:
>
> On Mon, 6 Jun 2022 13:44:24 +0900, Akira Yokosawa wrote:
> > Commit 48ec13d36d3f ("gpio: Properly document parent data union")
> > is supposed to have fixed a warning from "make htmldocs" regarding
> > kernel-doc comments to union members.  However, the same warning
> > still remains [1].
> >
> > Fix the issue by following the example found in section "Nested
> > structs/unions" of Documentation/doc-guide/kernel-doc.rst.
> >
> > Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > Fixes: 48ec13d36d3f ("gpio: Properly document parent data union")
> > Link: https://lore.kernel.org/r/20220606093302.21febee3@canb.auug.org.au/ [1]
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> > Cc: Joey Gouly <joey.gouly@arm.com>
> > Cc: Marc Zyngier <maz@kernel.org>
> Gentle ping to gpio maintainers.
>
> I thought this fix would go through brgl's tree.
>
>         Thanks, Akira
>

Now applied, thanks! Sorry for the delay.

Bart
