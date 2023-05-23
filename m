Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72B3470DD26
	for <lists+linux-gpio@lfdr.de>; Tue, 23 May 2023 15:05:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233519AbjEWNFK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 May 2023 09:05:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230283AbjEWNFJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 May 2023 09:05:09 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C470D118
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 06:05:06 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-75b064451d3so134616085a.0
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 06:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1684847106; x=1687439106;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K7ZY69csEZt3xO6zPX4RRRe8b6Lxs4oPlm4sc4oSs4s=;
        b=ZQ2y32VPVr0fDm96h0Pf2dBhbZazE9AzzPgSg0K4H0pfqKMltJZkRwKCIy00kEpqmI
         d1GXhekwCZHbpNaqOzkkQntroxPo/GPYpNx2sa0x0rg41babUH+r0i+FycEB0jy6R4Uh
         Xms03sWX7Kpec7ZX26pm26JALh2GbnP7ZDU+eaFR/Zx8usrGxD8W4bkigXH5thSVPAwT
         m9xBdGUX3nba04vCvDw9G+kXjgHxyCkSpf8cwTSWQP6ai03VUDyT1QNL6gAAuTrv6sdy
         3M5fWPuBZqn+sZjjROJb5aLZZQkoMZUl3p5cLKybBiLf6JqXp5irzUAXVBy/pZSCfZfa
         xG9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684847106; x=1687439106;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K7ZY69csEZt3xO6zPX4RRRe8b6Lxs4oPlm4sc4oSs4s=;
        b=aXcyaWgYF6UY00UQSVTlnIoXURccn7S8oroRmmx2zdNyzTsYJKE/Q8Z4cXQ1vcbGei
         1wLtRU1Ytj7p/MOLLGBRqNGUM5FBPJmMIETi9SBDX2bY5dm+hbLSmqONAQlgxkY5a4i8
         GgkhM8aHLYXMQbRwfsp+PWxsE12yJpe0wjeC2Ku5cG9Od4YY32CmVU/5fiskSIWDBMtw
         2xO1+CikDmiPodLaUe1dBVUU3VtozRTyJIFSoOfPw6pZPrmv8Ei6JfQ2WZ/I8okK81mC
         2Y9/IUB1KghJEjGJbRp2oaFvMjADwKMgHj3b2wRbcposBBmKlWUmt8H0aZCI0iocc4bX
         0Hdg==
X-Gm-Message-State: AC+VfDyNx2d1A2+ZxK+ibcXMwfHaqb84KzUaJlWNHo01qi8Y7lsUqymQ
        D4LdzLF+oTl/i6bUXEKCTr30u1YSG5s7VRaJFMJ6Bg==
X-Google-Smtp-Source: ACHHUZ4/nCMXSYh/92BHBAPm6DnTJfyRTxpiOOoZx2yVAbjffaVVLACyEuCHyw4LFA0AtHIW7YiylPzWfxa2Z7ONkFg=
X-Received: by 2002:a05:620a:460c:b0:75b:23a1:8334 with SMTP id
 br12-20020a05620a460c00b0075b23a18334mr4307554qkb.47.1684847105895; Tue, 23
 May 2023 06:05:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230519174619.58308-1-frattaroli.nicolas@gmail.com>
 <ZGyvKn4NG0j9K2Q_@surfacebook> <CAMRc=Mddz7rVNXNbHKe_bFpnk8BZ4rf4DW-4o333H5sT9-rhfg@mail.gmail.com>
 <9115353.xy6ZZbE24F@archbook>
In-Reply-To: <9115353.xy6ZZbE24F@archbook>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 23 May 2023 15:04:54 +0200
Message-ID: <CAMRc=Md3o9a9qrrPAugBo4tr15ciXRt-6EMSsMqZYA-JdkkqNA@mail.gmail.com>
Subject: Re: [libgpiod] [RFC PATCH] bindings: python: allow specifying
 infinite timeout
To:     Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
Cc:     andy.shevchenko@gmail.com, linux-gpio@vger.kernel.org
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

On Tue, May 23, 2023 at 2:38=E2=80=AFPM Nicolas Frattaroli
<frattaroli.nicolas@gmail.com> wrote:
>
> On Dienstag, 23. Mai 2023 14:33:12 CEST Bartosz Golaszewski wrote:
> > On Tue, May 23, 2023 at 2:18=E2=80=AFPM <andy.shevchenko@gmail.com> wro=
te:
> > >
> > > Tue, May 23, 2023 at 12:06:47PM +0200, Bartosz Golaszewski kirjoitti:
> > > > On Fri, May 19, 2023 at 7:47=E2=80=AFPM Nicolas Frattaroli
> > > > <frattaroli.nicolas@gmail.com> wrote:
> > >
> > > > > So far, libgpiod's Python bindings had no way to state that a
> > > > > user wishes to wait for events indefinitely, as a timeout of
> > > > > None would intentionally be converted to 0 seconds, i.e. return
> > > > > from the select call in poll_fd immediately.
> > > > >
> > > > > The usual Python convention and even the select convention is
> > > > > to block indefinitely on a timeout=3DNone. However, changing the
> > > > > poll_fd function to do this now would change an (intentional)
> > > > > API design choice by libgpiod 2.0 that API users presumably
> > > > > rely on.
> > > > >
> > > > > By allowing float("inf") (or in fact math.inf, or your favourite
> > > > > other way to get an infinite float) to mean waiting infinitely
> > > > > solves this by extending the API rather than changing it.
> > > > >
> > > > > On gpiod Python bindings without this change, passing inf results
> > > > > in an OverflowError being raised in select. API users who wish to
> > > > > support older versions of the bindings can catch this exception a=
nd
> > > > > act on it.
> > >
> > > ...
> > >
> > > > I like this approach too. In fact - it may be even clearer and more
> > > > intuitive than converting None to infinite timeout.
> > >
> > > With all respect to the clever design solutions I would rather go the
> > > de facto Pythonic way. If the native libraries use None for indefinit=
e
> > > then it's better to do that way, otherwise we will add quite a confus=
ion
> > > to the Python users.
> > >
> > > > Any objections against using negative numbers for the same purpose =
as well?
> > >
> > > The question here is: What in the very same situations are other (pre=
sumably
> > > native) Python libraries using?
> > >
> >
> > As has been said elsewhere - the pythonic way is to interpret None as
> > indefinite timeout. It's just that it would change the current
> > behavior. The question is - should we interpret the current behavior
> > as "undefined" and change it, or "defined but not documented" and
> > consider it part of the API.
> >
> > Bart
> >
>
> As an alternate suggestion, we could change the default function argument
> to 0.0 and remove the None -> 0 code. That way, people who were calling
> the function with no arguments still get the same behaviour, and the
> only break is for users who explicitly passed None.
>

Honestly, if we were to change the behavior, then I'd prefer to do it
right and not use any half-measures.

Bart
