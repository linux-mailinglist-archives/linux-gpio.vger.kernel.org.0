Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 247E672CCEC
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jun 2023 19:34:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236885AbjFLReQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Jun 2023 13:34:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235126AbjFLRd5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Jun 2023 13:33:57 -0400
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com [IPv6:2607:f8b0:4864:20::930])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C7A12D74
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jun 2023 10:31:05 -0700 (PDT)
Received: by mail-ua1-x930.google.com with SMTP id a1e0cc1a2514c-78a03acc52aso47504241.3
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jun 2023 10:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686591041; x=1689183041;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=72REXKyRvB2hUg8itJ544H91wzgvR4XtcD6murg8e+0=;
        b=3zpmA0GSaPuAjdfPArP5lc8CbK7XhqtsERH8HGZ3cL1FCzFbodPTElgoHLAjBEm8xv
         rcTWF5jXgBSPaqAg9o3S/A8EkQe4/AsG+EjHLiCb7ZyNQ9NucRvGbqOaE5ECCzHkcuiG
         I4o2b8bC2XbA3zcP0ULVVAp2GznV8vdCe8aBbuyVMR66DU6cyR/w+Jx/msgyaAWrVUFl
         tb3LDA7xTRLQapPkEgfE0e+F2WTKwOJF/tJp8QKmJy55ft1bwwa5wMPZBL0foSDsXbip
         7PMErJb+KflAgn3EF6XxHMaKAVIHhcs8J93XwVd4gdXlXPJkppMrkoD9XCdAMs3H4zQa
         wRLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686591041; x=1689183041;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=72REXKyRvB2hUg8itJ544H91wzgvR4XtcD6murg8e+0=;
        b=DRKyCYmInRquatdPDCK7776BoHdite9GYvb/RPcToecfphfaE0/RxuwZSQv9Qg4OXC
         d55qQPf6q5bv/K9/WYR7Uk/x/W0TsaKTvb06JdPtwKcumGjlkuqKxIixiCfUye5DRTaQ
         zFKdv1vcG1fF9eKZDGCcSiSEP1Hq1lcmVrha0Cehdpl8X359XqGYzHmB/76jYNnTmuu4
         A1VgHy1w+P0yhcorK4dkURTwTBX8tW4Om8Qr1lx4heFoLKhHuUwdgOhAdf7sS1vNiXQ3
         HO/jzf42ojZhBWJZToeEg4szcWypxL8/N98Q8uR1wAah3QpmM3Bx//Xo7N8gCWKlmgAI
         T3wA==
X-Gm-Message-State: AC+VfDwZqlEVEd0d51Lgsh3RzaM80O8dUVb61RbyX4vSuLZEhyx5/Vlw
        +2LUldlXrYx1iw2MoQFmuCFLlBMDtc1jbPbj+Q9c21QlrJWfg/8/
X-Google-Smtp-Source: ACHHUZ4cd+EHaAzHjZ4e0Qfuj401J+YyzeSA5jOniMVZlH/poJ5eBGhGFxCfeKS8HPWyBthcutKdry+Ao9xZOz4BkUs=
X-Received: by 2002:a67:f60c:0:b0:43d:c290:bac with SMTP id
 k12-20020a67f60c000000b0043dc2900bacmr4329912vso.15.1686591041117; Mon, 12
 Jun 2023 10:30:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230610020148.8973-1-warthog618@gmail.com> <CAMRc=Mct7uByAbiHxQJRQTXnGEkty28keX1wjhR+aHgpOa1EQA@mail.gmail.com>
 <ZIdKh3kAEZVrOYIL@sol>
In-Reply-To: <ZIdKh3kAEZVrOYIL@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 12 Jun 2023 19:30:30 +0200
Message-ID: <CAMRc=Mc8S7ynaZXaMO4izWBccT8DmCTDP3pSjvuiob2rhTsCqg@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] doc: add configuration to generate doxygen
 documentation on readthedocs.
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 12, 2023 at 6:40=E2=80=AFPM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Mon, Jun 12, 2023 at 06:27:42PM +0200, Bartosz Golaszewski wrote:
> > On Sat, Jun 10, 2023 at 4:01=E2=80=AFAM Kent Gibson <warthog618@gmail.c=
om> wrote:
> > >
> > > +# Copyright (C) 2022 Bartosz Golaszewski <bartekgola@gmail.com>
> >
> > I would stick with regular SPDX-FileCopyrightText line that we use
> > everywhere else and - while I understand that I maintain the project -
> > this file is authored by you so it's only right to have your copyright
> > here.
> >
>
> Yeah, this is an old patch prior to that change and I haven't updated
> it - just sent it as is since that is what has been used to generate the
> rtd to date, and you mentioned you wanted to look into updating the
> docs.
>
>
> > This works well with sphinx-build, thank you for doing that. I'm
> > actually looking into using the breathe[1] and exhale[2] extensions
> > for sphinx for translating doxygen into nice sphinx docs. This is a
> > good fundament to build upon.
> >
>
> That was the idea.  I thought I had posted it back during v2
> development, but apparently not.
>
> So you want the copyright headers updated?
>

Yes, please.

Bart
