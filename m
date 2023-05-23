Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64EC070DD6F
	for <lists+linux-gpio@lfdr.de>; Tue, 23 May 2023 15:27:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236533AbjEWN1l (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 May 2023 09:27:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235999AbjEWN1k (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 May 2023 09:27:40 -0400
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com [IPv6:2607:f8b0:4864:20::a2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A44CF11F
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 06:27:39 -0700 (PDT)
Received: by mail-vk1-xa2c.google.com with SMTP id 71dfb90a1353d-4571d25d288so2791753e0c.3
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 06:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1684848459; x=1687440459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IaZRZ213txOaHDv+5OE307wbxgABlQXYfsamG36HiQo=;
        b=vEkip3qOYymNhcljcyv9/A0n+3jsCVbZQ0SNQNceyOXNx2IvLtp1B8B2w1weJwi0B6
         kAH6IN/LwSGaPXE4WKW+jE64ZadbevPTL+sPqUrvnd/B+2XkgkuoQaogL3xHVUCy2BuA
         Wc7NePvt5uj9ja2k24tXrJLWHuvztmLm9YUjdqaPF33NbXV6t2ssE+wYFSQd2xPPVnyG
         zJO1VrAMJteNoKMlPZOTSUPapFINuJ8sRywBgtg0lUBI5K4OfoIbLMSTdN6s8FGj/RIJ
         dkKhIsdxPHv62xck9r5RZlsX6OEfidNAqrEn7TslpUTqLXlYw2eMfP6lPt6rZwEA/Sjx
         t0rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684848459; x=1687440459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IaZRZ213txOaHDv+5OE307wbxgABlQXYfsamG36HiQo=;
        b=IzZcElmdUXlsSnufssQgluJLbc8AR6/34elJtslhJT81HKjVwzovX7SBVNLr3xuOYz
         rp+1nx7AbOfv29lM9yDK8lg2BpquqPzb2QaIQTeVtTcTfNU3xg4Emc3tuFEikj+L9BWg
         x/6Rb4s0fA1wAAV4zl/IBj3ZOOHU+dFbhmXpUNfOQYPyTg1Q7NFXwe+tpiLqqiHsnxtn
         ec2GpP+kRO8JuPkbmqdOdtT/KX5QNOjhoqDso0ELPPIMfJcBy3CAO7RW0aqohdA/ybaA
         /HCZegQAV7bSi4ambVizJFRa+IBioQ+gTl2B6ClkT5uZYLYwpTW7QTV/FQ4I3ja7/lvu
         ge3g==
X-Gm-Message-State: AC+VfDz3peQ8FHEiDEwtrmeJbZ7S+t+WqJ+w8mYEiQkNp7X7aK7YWTDI
        nZgeC1rdtEpQ0CgY8P2GdjOuo/ytw8upewlxU3Zz/Q==
X-Google-Smtp-Source: ACHHUZ74EZ7YgLZArqCP1o2JCodScZI4C9c0LTpPgghfg9qvhk3SHLkiQlrMDe5y202zL6B+R+PsX4xLiBsEBg+ngRg=
X-Received: by 2002:a1f:3f03:0:b0:453:753f:ef2e with SMTP id
 m3-20020a1f3f03000000b00453753fef2emr5044902vka.8.1684848458741; Tue, 23 May
 2023 06:27:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230519174619.58308-1-frattaroli.nicolas@gmail.com>
 <9115353.xy6ZZbE24F@archbook> <CAMRc=Md3o9a9qrrPAugBo4tr15ciXRt-6EMSsMqZYA-JdkkqNA@mail.gmail.com>
 <3608182.x0L4EvOPPF@archbook>
In-Reply-To: <3608182.x0L4EvOPPF@archbook>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 23 May 2023 15:27:27 +0200
Message-ID: <CAMRc=MfSvOYKZJJuy=aZr5ZsFSq-+rAOtPxNV4X3Dk4Nftok+g@mail.gmail.com>
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

On Tue, May 23, 2023 at 3:18=E2=80=AFPM Nicolas Frattaroli
<frattaroli.nicolas@gmail.com> wrote:
>
> On Dienstag, 23. Mai 2023 15:04:54 CEST Bartosz Golaszewski wrote:
> > On Tue, May 23, 2023 at 2:38=E2=80=AFPM Nicolas Frattaroli
> > <frattaroli.nicolas@gmail.com> wrote:
> > >
> > > On Dienstag, 23. Mai 2023 14:33:12 CEST Bartosz Golaszewski wrote:
> > > >
> > > > ...
> > > >
> > > > As has been said elsewhere - the pythonic way is to interpret None =
as
> > > > indefinite timeout. It's just that it would change the current
> > > > behavior. The question is - should we interpret the current behavio=
r
> > > > as "undefined" and change it, or "defined but not documented" and
> > > > consider it part of the API.
> > > >
> > > > Bart
> > > >
> > >
> > > As an alternate suggestion, we could change the default function argu=
ment
> > > to 0.0 and remove the None -> 0 code. That way, people who were calli=
ng
> > > the function with no arguments still get the same behaviour, and the
> > > only break is for users who explicitly passed None.
> > >
> >
> > Honestly, if we were to change the behavior, then I'd prefer to do it
> > right and not use any half-measures.
> >
> > Bart
> >
>
> That's fair, I don't mind either way. I don't think the behavioural
> change would be that big of an issue either way; the obviousness of a
> wait on events function that returns immediately by default is
> debatable in my eyes, as the only use for using it like that I could
> ever come up with is to peek at whether there are any events queued
> up based on its return value.
>
> What I do think is a bad solution now is the float("inf") stuff.
> While it's fun to assign meaning to special floating point values,
> I think it strictly makes the API worse for the sake of stability.
>

For sure, I just preferred it in case of keeping the old behavior. Let
me send out a patch changing the behavior.

Bart
