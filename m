Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD61D72C911
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jun 2023 16:58:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232973AbjFLO6p (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Jun 2023 10:58:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238328AbjFLO6o (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Jun 2023 10:58:44 -0400
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com [IPv6:2607:f8b0:4864:20::92f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DF3CCC
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jun 2023 07:58:43 -0700 (PDT)
Received: by mail-ua1-x92f.google.com with SMTP id a1e0cc1a2514c-786de394130so1331917241.2
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jun 2023 07:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686581922; x=1689173922;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N5RYbQgd/QGFTDK40gOEso5TylP5PlP1WhQS9LcDfvo=;
        b=KPhG94wlBlE62ZMxZqEXbv7aCgMv5OhbjEB9UwUnvH7xBYwzkxnmockWlt+qvsC0WH
         8qrKSeEzyxmSb8K5YFG/IdJv8ZNnVXhjqbH7JCfpmxZz/PWmR5SwXQi5k3wuefMEg9J7
         fBvH80luLoxHtxOo7QDO+KCt9SIJhGNR1tQe8UQW94CzgRbhszs6C1dgfbucsNzyqPUj
         SQv9ylplQ9ajbNVdG88gKwvoTZ36EOgRVajo15UW81c1V/1nG/E0X9MrfET0cXpaY/YW
         J8nmGOKNuYy1PMhugtICZTHaQ1Vo+UfQdW5GteNw09rN5PLGB8Z9uxQqD8bPC3X9WL9L
         vbhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686581922; x=1689173922;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N5RYbQgd/QGFTDK40gOEso5TylP5PlP1WhQS9LcDfvo=;
        b=ZdJb1B02foKz9aNEx+bmCf8+6/XsfT4xYGMYlP71cPeHiBxREtVJZ75XJfqZrzaT+9
         QjwwI3c/XVcydH5QGie7v8zft0iO4QGzgAwHFiW5P7TMVUKZmlfllq26jvYVrjoQBBV5
         hZRWpBv9yLvE4GkACT5wqko0f22efg54+6m9CC3VHbm6PHUE/JYA5Z6r7t0+Zv48sgl2
         jRAyLe35q+CIODwK5eCurY2MHnS/4G9L+jJPGlUbpjEpUoOw1XbsRU3UpHmleH/DoxAr
         sfshvol2LAIrCGGftPL/O2JRCp4WhnAAZjxsRyzirdbdndUXXzZjvo7dSPKvZG0dHlV9
         AXng==
X-Gm-Message-State: AC+VfDyFjdCDiFnUnP6TjClwmHqo2mP90dHugGvaGdVGo41pU7nrkFD4
        Ac6BrqU4h19+uDHMvLNekRQDKYnoE6yv7USDXiwNaA==
X-Google-Smtp-Source: ACHHUZ4qw3g7Zt0+06PO9ha8atwg2VIIpUKnCCcVChsxd92u0Hv2BcjfibfnBaWpTLOrvzHArQrm0rgY9tI4J4hwCuc=
X-Received: by 2002:a67:f752:0:b0:436:344b:24a8 with SMTP id
 w18-20020a67f752000000b00436344b24a8mr2508882vso.17.1686581922487; Mon, 12
 Jun 2023 07:58:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230609153607.133379-1-warthog618@gmail.com> <20230609153607.133379-2-warthog618@gmail.com>
 <ZIOJM-CgPrfKtIFC@surfacebook> <CAMRc=MeYRKpoU8TaOGnYCqrBy2BdxfNPKhorUx=5rkRNNC7dkg@mail.gmail.com>
 <ZIcxghbvNPtCr8+o@sol>
In-Reply-To: <ZIcxghbvNPtCr8+o@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 12 Jun 2023 16:58:31 +0200
Message-ID: <CAMRc=McXmA=PJxNS500=zxaGQt_YA0pv0Ve-TW_MkE2V7thyGA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 1/2] bindings: python: examples: fix potential
 glitch in gpioset.py
To:     Kent Gibson <warthog618@gmail.com>
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

On Mon, Jun 12, 2023 at 4:54=E2=80=AFPM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Mon, Jun 12, 2023 at 04:26:46PM +0200, Bartosz Golaszewski wrote:
> > On Fri, Jun 9, 2023 at 10:19=E2=80=AFPM <andy.shevchenko@gmail.com> wro=
te:
> > >
> > > Fri, Jun 09, 2023 at 11:36:06PM +0800, Kent Gibson kirjoitti:
> > > > gpioset.py requests lines without setting their output value, and s=
o
> > > > sets them all inactive, and subsequently sets them to their request=
ed
> > > > value.  This can result in glitches on lines which were active and
> > > > are set active.
> > > >
> > > > As this is example code, it is also important to demonstrate that t=
he
> > > > output value can be set by the request itself.
> > > >
> > > > Request the lines with the correct output values set in the request
> > > > itself.
> > >
> > > Do we need a comment in the code to specify this?
> > >
>
> Andy, I'm not ignoring you - I'm still not getting mail from you, and I
> hadn't looked on the list for replies.  Weird.
>
> In answer to your point - yes and no.  The code is not doing anything
> unusual, so no.  OTOH it does serve as example code, so a bit of
> commentary wouldn't hurt.
>
> > > ...
> > >
> > > > +    config =3D dict([(l, settings(v)) for (l, v) in lvs])
> > >
> > > Aren't [] not needed?
> > >
>
> Ok, but now I did get this one:
>
> > Think about it in dynamic:
>
> > In [1]: x=3D [(1,2),(2,4)]
> > In [2]: dict((a,b)for a,b in x)
> > Out[2]: {1: 2, 2: 4}
>
> > [] are redundant, so I remembered that correctly =F0=9F=98=84
>
> Terrible example - which 2 is which?
> 1,2,3,4 would've been better.
>
> True - dict() accepts an iterable, so the [] are redundant in thise case.
>
> Cheers,
> Kent.

Ok, I will add a follow-up commit.

Bart
