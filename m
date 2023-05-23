Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3CD270DD57
	for <lists+linux-gpio@lfdr.de>; Tue, 23 May 2023 15:18:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236316AbjEWNSv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 May 2023 09:18:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231357AbjEWNSu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 May 2023 09:18:50 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6375911F
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 06:18:49 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-309438004a6so4651308f8f.2
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 06:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684847928; x=1687439928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SgYUpbB+EciF5oMTK+JgXzHr3tLmMCU3kUYRKLfQftY=;
        b=nrjcF2Smh14Mc75q8FaRr8vD/YS0vERnCfltqBEG6SrBgH9r/KIqh9VrtVRDdSG7M4
         kb11+Ks1biDAf7ogY1YV9uhzObdQeRdhdqMJrpKmXUKSGIjhBRZ9lJHJW93rV0mmZ1MJ
         It62PRs2Utmod/Ck3FE04GD1WNCfWSZlF9s8tHjYiiheFm3BuElKnEK795VPpdZ/5F+9
         tE+yDOPOW4im5jA1V8G0kvS2T44wbyKDCrlKzjobJsngPDcbBOm9zx8ZaLb+ZL5FoJ+e
         3ZwJ8mTIu4aLc19oZiREi+tFYamgA0kGjIMoqDsutXtRx3extUiegPt0/53vDsBO+F4C
         wtlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684847928; x=1687439928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SgYUpbB+EciF5oMTK+JgXzHr3tLmMCU3kUYRKLfQftY=;
        b=kAw1jUKqtuTgcf4Xk3/2syLOUy7o3qSgiDWBxrfgCUJ2f/lshfNpVdtLBQeD9wjkMN
         csRZgXzyQaI1NJXwyihLlYvbSf1hQbmnrJ5eVshYoG1h+BnqblIQX50boXGdaRZbtDyQ
         5w0xCCpCwNTHgGVja/JEZhX3jGMKX4Ibd5+WP6MIM5p/UCTpSgYdGCRhuoN2HuZDje/p
         Y2ge2TluAWywD0p39u1qjB2U127jxcCs6ZTmvHeq4LsHzAuaOF7tORdJbzGa0KiNjM2H
         Hssi9W7/VKsWDfJs5Ej5nK53UlV6382efBeeRM7rWAroJ0T0db5S3xSL5H4UscRTNlBo
         jDCQ==
X-Gm-Message-State: AC+VfDwu1SEu0f32CGuiatD1hH8x5dGitMi1rFDHn6dWix4XHSm4swDO
        SUZwm9z1/8HjscgZCdi8cA5jybouPv8=
X-Google-Smtp-Source: ACHHUZ55+ovzcdQrdYeiuGmJ/u1xBa80QE7OCVERk9fZmyfrCBxtQ7ejC/6gxKlUTzg/WSfDGE8znA==
X-Received: by 2002:a5d:4ace:0:b0:2f5:3fa1:6226 with SMTP id y14-20020a5d4ace000000b002f53fa16226mr10611452wrs.14.1684847927513;
        Tue, 23 May 2023 06:18:47 -0700 (PDT)
Received: from archbook.localnet (84-72-105-84.dclient.hispeed.ch. [84.72.105.84])
        by smtp.gmail.com with ESMTPSA id x11-20020a05600c21cb00b003f427db0015sm11823956wmj.38.2023.05.23.06.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 06:18:47 -0700 (PDT)
From:   Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     andy.shevchenko@gmail.com, linux-gpio@vger.kernel.org
Subject: Re: [libgpiod] [RFC PATCH] bindings: python: allow specifying infinite
 timeout
Date:   Tue, 23 May 2023 15:18:46 +0200
Message-ID: <3608182.x0L4EvOPPF@archbook>
In-Reply-To: <CAMRc=Md3o9a9qrrPAugBo4tr15ciXRt-6EMSsMqZYA-JdkkqNA@mail.gmail.com>
References: <20230519174619.58308-1-frattaroli.nicolas@gmail.com>
 <9115353.xy6ZZbE24F@archbook>
 <CAMRc=Md3o9a9qrrPAugBo4tr15ciXRt-6EMSsMqZYA-JdkkqNA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Dienstag, 23. Mai 2023 15:04:54 CEST Bartosz Golaszewski wrote:
> On Tue, May 23, 2023 at 2:38=E2=80=AFPM Nicolas Frattaroli
> <frattaroli.nicolas@gmail.com> wrote:
> >
> > On Dienstag, 23. Mai 2023 14:33:12 CEST Bartosz Golaszewski wrote:
> > >
> > > ...
> > >
> > > As has been said elsewhere - the pythonic way is to interpret None as
> > > indefinite timeout. It's just that it would change the current
> > > behavior. The question is - should we interpret the current behavior
> > > as "undefined" and change it, or "defined but not documented" and
> > > consider it part of the API.
> > >
> > > Bart
> > >
> >
> > As an alternate suggestion, we could change the default function argume=
nt
> > to 0.0 and remove the None -> 0 code. That way, people who were calling
> > the function with no arguments still get the same behaviour, and the
> > only break is for users who explicitly passed None.
> >
>=20
> Honestly, if we were to change the behavior, then I'd prefer to do it
> right and not use any half-measures.
>=20
> Bart
>=20

That's fair, I don't mind either way. I don't think the behavioural
change would be that big of an issue either way; the obviousness of a
wait on events function that returns immediately by default is
debatable in my eyes, as the only use for using it like that I could
ever come up with is to peek at whether there are any events queued
up based on its return value.

What I do think is a bad solution now is the float("inf") stuff.
While it's fun to assign meaning to special floating point values,
I think it strictly makes the API worse for the sake of stability.

Kind regards,
Nicolas Frattaroli


