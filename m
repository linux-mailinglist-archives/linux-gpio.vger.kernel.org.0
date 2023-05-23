Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDDFA70DCA5
	for <lists+linux-gpio@lfdr.de>; Tue, 23 May 2023 14:33:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236863AbjEWMd0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 May 2023 08:33:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236839AbjEWMdZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 May 2023 08:33:25 -0400
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com [IPv6:2607:f8b0:4864:20::930])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB7EFDB
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 05:33:23 -0700 (PDT)
Received: by mail-ua1-x930.google.com with SMTP id a1e0cc1a2514c-786470fd7a3so1141201241.3
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 05:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1684845203; x=1687437203;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lBbELhRnxAaIi5Cfjn097w3cM51l1t6J2x9uh+GUpBM=;
        b=uecpU62ZltceDn3DOYwg5c4l/TzLrhn9exU8dBv46qrCb2eFWlZjtKBJhxVoAKVpFi
         IUG19JqzUF78a/me+tb8v9MjV9YG66t6jKilIFGSmGRf7iheFMKB14o4zwaElgtiJLSQ
         WgGr3LAHpXYEORjxfY9aAgPGWvHSY9mg0d6WNbgt82hV7aaobFzPk6v7VbrQHFZHQTRU
         fzukzeyHA12frJi7aUo1JpOahXQacXoBfNwpy2YSODkY95puwKTOvfl6+NXmQ6JmYGWH
         A6KQAkYE9Y0wPnLUjP/JJBKJuznnLDAE7AsFwtwF+aKp8HwhPo8XuBRhyhM5lRQ8xv+E
         eVlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684845203; x=1687437203;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lBbELhRnxAaIi5Cfjn097w3cM51l1t6J2x9uh+GUpBM=;
        b=SUArgBf9U6Cy8cHUiH6Y/slcAnwCnnsDcQeNDbDHELX1WDDAsH6AU/LM9mmzvD7u9z
         AV0DZi5/EGWBNoPxqkDlRvWj5E+1mte9EFXwQnpOdmxcA6LExmg3DVdDT//sjKxNQX59
         bKj+UIznrsTi80CmaR5bl2E79lE0QEEvhT++1Fcv3LaYP/r+neBb69QJVggyJGCT8YZV
         tdaO12lqJp2/VYOOnix5STxDcx4hOgkm0epXmvS7HY3q+2eX4KfU/9SOcDZWPU5LppGl
         yAA9tGXAEsR5a8WGrw6KywWYcF61zSv1c5c+iIh6d05RMPoVDgJ0t81agSb8Mlsm06uk
         7E4Q==
X-Gm-Message-State: AC+VfDwc8p5cV4tY/Q1NDSu6TvQ0QZvF0ABaTIIWmrrkipCXZZvw6q7p
        MPty6AJx9fWn5Apj4kQvDks4NPKu/XizXKPPidBVhw==
X-Google-Smtp-Source: ACHHUZ6I/J/yShQulegAMELQSmLWxCXDTO2jCSzdWCkS+37XsKFOdpLFWA0n6pzis2RjbWzlfHtqJfV09J7Dg2987RA=
X-Received: by 2002:a67:f959:0:b0:434:69be:8495 with SMTP id
 u25-20020a67f959000000b0043469be8495mr3765675vsq.9.1684845202989; Tue, 23 May
 2023 05:33:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230519174619.58308-1-frattaroli.nicolas@gmail.com>
 <CAMRc=McrerNizhJ+d1m6PaDf65UX-RrZjAYjdABiLjZ69TPRWA@mail.gmail.com> <ZGyvKn4NG0j9K2Q_@surfacebook>
In-Reply-To: <ZGyvKn4NG0j9K2Q_@surfacebook>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 23 May 2023 14:33:12 +0200
Message-ID: <CAMRc=Mddz7rVNXNbHKe_bFpnk8BZ4rf4DW-4o333H5sT9-rhfg@mail.gmail.com>
Subject: Re: [libgpiod] [RFC PATCH] bindings: python: allow specifying
 infinite timeout
To:     andy.shevchenko@gmail.com
Cc:     Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
        linux-gpio@vger.kernel.org
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

On Tue, May 23, 2023 at 2:18=E2=80=AFPM <andy.shevchenko@gmail.com> wrote:
>
> Tue, May 23, 2023 at 12:06:47PM +0200, Bartosz Golaszewski kirjoitti:
> > On Fri, May 19, 2023 at 7:47=E2=80=AFPM Nicolas Frattaroli
> > <frattaroli.nicolas@gmail.com> wrote:
>
> > > So far, libgpiod's Python bindings had no way to state that a
> > > user wishes to wait for events indefinitely, as a timeout of
> > > None would intentionally be converted to 0 seconds, i.e. return
> > > from the select call in poll_fd immediately.
> > >
> > > The usual Python convention and even the select convention is
> > > to block indefinitely on a timeout=3DNone. However, changing the
> > > poll_fd function to do this now would change an (intentional)
> > > API design choice by libgpiod 2.0 that API users presumably
> > > rely on.
> > >
> > > By allowing float("inf") (or in fact math.inf, or your favourite
> > > other way to get an infinite float) to mean waiting infinitely
> > > solves this by extending the API rather than changing it.
> > >
> > > On gpiod Python bindings without this change, passing inf results
> > > in an OverflowError being raised in select. API users who wish to
> > > support older versions of the bindings can catch this exception and
> > > act on it.
>
> ...
>
> > I like this approach too. In fact - it may be even clearer and more
> > intuitive than converting None to infinite timeout.
>
> With all respect to the clever design solutions I would rather go the
> de facto Pythonic way. If the native libraries use None for indefinite
> then it's better to do that way, otherwise we will add quite a confusion
> to the Python users.
>
> > Any objections against using negative numbers for the same purpose as w=
ell?
>
> The question here is: What in the very same situations are other (presuma=
bly
> native) Python libraries using?
>

As has been said elsewhere - the pythonic way is to interpret None as
indefinite timeout. It's just that it would change the current
behavior. The question is - should we interpret the current behavior
as "undefined" and change it, or "defined but not documented" and
consider it part of the API.

Bart
