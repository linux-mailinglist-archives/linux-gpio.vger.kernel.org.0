Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E52170DCBB
	for <lists+linux-gpio@lfdr.de>; Tue, 23 May 2023 14:38:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236904AbjEWMi4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 May 2023 08:38:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230230AbjEWMiz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 May 2023 08:38:55 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AC5BC4
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 05:38:54 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-30a95ec7744so1830880f8f.3
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 05:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684845532; x=1687437532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ag+LXp/ffXf/LaSiDvGBxLTgJ/PsBMFbz/QdY88sA3Q=;
        b=UaUcbQtMX0z7G7jgildNI2BhCjfVH1tIVE7BCOs39wOri1iyWRpLTi7crXF4jwr9ek
         S0JOmpfDiKjfgCM/IyybTYhAVTpzLw1QupLZ00cOYym8ZOCA1MyJmqlyd4i1FmVB45ob
         aKsNKYx7FIdJ8lQnZLer21MDtfEmfj+rV+X5lIMhA/E+FjmOwJ9kZsFoOde6Dg/AApZj
         uguylRp54bJwlLD+f3cyipeH6nBOCYhOl3KHNvmbSVphaTjDUZJp74Ib7BYj2PM/hrqq
         O9DXVogv/qw8zxSOQNmW+CKUy0CMP9HwUGMrZ0MPb4vcndbUDHXOiyIotm5WKf6gmOJP
         OYmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684845532; x=1687437532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ag+LXp/ffXf/LaSiDvGBxLTgJ/PsBMFbz/QdY88sA3Q=;
        b=LQHOaKK+mRXLUieAb4O5PGULYQL5Y45nnHGmUYJ3N674E342k/6hFuX1IPb6WRJQzX
         BymSnlF1C2hzANHd/B9SmjhToHI8kuRZAoDBWPN6cv23D4g5wG4T3vkeorLJmYCKXS7f
         bfN0vM5Lzz5oJJ5Cjwc6sl8a/K9ATyUPr6UPACoqyrQer8OYUI5xbkh1P4XG1LVA3T8m
         jb8HM96n/u74/dphZL95cd8danNkoVpFo8mhV8Pjmh06tBNPNhp4ZIo06InWJq3lEftl
         Nnf/Vl6tiu6tZTsfDpaKUmHKu5q4NVibMjBZx/f67XWe47/ZGmPb54xl+BqMxw2704Dp
         Mt5g==
X-Gm-Message-State: AC+VfDzwXJj6VouHNG4ia1MZ+KHSft/nMi9C44yAa7vR8+xIw+P+jXZW
        bWuhY8uVHaJ9dC7+ablX95RSBQ34TZc=
X-Google-Smtp-Source: ACHHUZ6/89guXneE6nyAR/TVLZY7PZaXcMyFpt0eQ9Rq6yUyh3zK+qqpka3yMaGf2tJfehOGo+zXfA==
X-Received: by 2002:adf:e9c1:0:b0:309:4f39:de4b with SMTP id l1-20020adfe9c1000000b003094f39de4bmr10809412wrn.12.1684845532368;
        Tue, 23 May 2023 05:38:52 -0700 (PDT)
Received: from archbook.localnet (84-72-105-84.dclient.hispeed.ch. [84.72.105.84])
        by smtp.gmail.com with ESMTPSA id j5-20020adfea45000000b0030629536e64sm11000644wrn.30.2023.05.23.05.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 05:38:52 -0700 (PDT)
From:   Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
To:     andy.shevchenko@gmail.com, Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org
Subject: Re: [libgpiod] [RFC PATCH] bindings: python: allow specifying infinite
 timeout
Date:   Tue, 23 May 2023 14:38:51 +0200
Message-ID: <9115353.xy6ZZbE24F@archbook>
In-Reply-To: <CAMRc=Mddz7rVNXNbHKe_bFpnk8BZ4rf4DW-4o333H5sT9-rhfg@mail.gmail.com>
References: <20230519174619.58308-1-frattaroli.nicolas@gmail.com>
 <ZGyvKn4NG0j9K2Q_@surfacebook>
 <CAMRc=Mddz7rVNXNbHKe_bFpnk8BZ4rf4DW-4o333H5sT9-rhfg@mail.gmail.com>
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

On Dienstag, 23. Mai 2023 14:33:12 CEST Bartosz Golaszewski wrote:
> On Tue, May 23, 2023 at 2:18=E2=80=AFPM <andy.shevchenko@gmail.com> wrote:
> >
> > Tue, May 23, 2023 at 12:06:47PM +0200, Bartosz Golaszewski kirjoitti:
> > > On Fri, May 19, 2023 at 7:47=E2=80=AFPM Nicolas Frattaroli
> > > <frattaroli.nicolas@gmail.com> wrote:
> >
> > > > So far, libgpiod's Python bindings had no way to state that a
> > > > user wishes to wait for events indefinitely, as a timeout of
> > > > None would intentionally be converted to 0 seconds, i.e. return
> > > > from the select call in poll_fd immediately.
> > > >
> > > > The usual Python convention and even the select convention is
> > > > to block indefinitely on a timeout=3DNone. However, changing the
> > > > poll_fd function to do this now would change an (intentional)
> > > > API design choice by libgpiod 2.0 that API users presumably
> > > > rely on.
> > > >
> > > > By allowing float("inf") (or in fact math.inf, or your favourite
> > > > other way to get an infinite float) to mean waiting infinitely
> > > > solves this by extending the API rather than changing it.
> > > >
> > > > On gpiod Python bindings without this change, passing inf results
> > > > in an OverflowError being raised in select. API users who wish to
> > > > support older versions of the bindings can catch this exception and
> > > > act on it.
> >
> > ...
> >
> > > I like this approach too. In fact - it may be even clearer and more
> > > intuitive than converting None to infinite timeout.
> >
> > With all respect to the clever design solutions I would rather go the
> > de facto Pythonic way. If the native libraries use None for indefinite
> > then it's better to do that way, otherwise we will add quite a confusion
> > to the Python users.
> >
> > > Any objections against using negative numbers for the same purpose as=
 well?
> >
> > The question here is: What in the very same situations are other (presu=
mably
> > native) Python libraries using?
> >
>=20
> As has been said elsewhere - the pythonic way is to interpret None as
> indefinite timeout. It's just that it would change the current
> behavior. The question is - should we interpret the current behavior
> as "undefined" and change it, or "defined but not documented" and
> consider it part of the API.
>=20
> Bart
>=20

As an alternate suggestion, we could change the default function argument
to 0.0 and remove the None -> 0 code. That way, people who were calling
the function with no arguments still get the same behaviour, and the
only break is for users who explicitly passed None.

Kind regards,
Nicolas Frattaroli



