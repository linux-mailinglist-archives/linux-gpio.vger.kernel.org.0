Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1D1070D9F0
	for <lists+linux-gpio@lfdr.de>; Tue, 23 May 2023 12:07:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233125AbjEWKHD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 May 2023 06:07:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236362AbjEWKHA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 May 2023 06:07:00 -0400
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com [IPv6:2607:f8b0:4864:20::e2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3949094
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 03:06:59 -0700 (PDT)
Received: by mail-vs1-xe2e.google.com with SMTP id ada2fe7eead31-4394217a8cbso692163137.1
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 03:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1684836418; x=1687428418;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sveMA1pLHpFzwHr/zLzHhtetXlVeCK1ds1U199Fo7do=;
        b=k3/J0NEzE8gEAx1mVhl3ELbtxaO8A75LexhtvnvrmSX77SJxq8yh1s5SYNB/PS+bvl
         WCvhVHhQsHW2aUljfHPVpqjmDXxjp5uAdRMGdIbrXys51rS1BRIGe/9YgXz/z2j8TwMG
         4U/gZvPx3kRUvopPOBzhvM49vGQ6FMJajVDN2kzslF3JmrMeUWMl5OKDHeKP6/SlJ4ws
         YLqQAyThKx9WhuOxVsnWklzE7IoIKtxwsBNwvJOt8jdHoDK4G/6MoRuUxp1S+fpkbn3a
         n8m/Lg6EaBG+yaUHagq4wVEdsGNvfq07x8E5lT0ZoVSxu0/usNW9yNVdUd6BrTjhCXYB
         +S4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684836418; x=1687428418;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sveMA1pLHpFzwHr/zLzHhtetXlVeCK1ds1U199Fo7do=;
        b=RePx2mr0Q76Ij/uUkx1g+HSLrUWhw2jWzl9+H2teiwjru7sGWcT/FEod1bkUjJmCEk
         Ob6A/Yi/Mu+JNWqFOkWu3OHgj8iLxvSvMkDGh/C5cQgz2cUfJQT7WR9YOZMnXJL69xvL
         rBDRge0Njin/a6NPBFEWG4jd3NFplvgUrFhWXmeAUtDmi245AL91O5AxBr6OCf6GvKxG
         /+gOAxNw2vBC089V3NNNcJCnii2VCLVIWGbwmBpXvwwNOQTRpPLPoA0VER51E2QcnvvE
         BuCvmbU2KGEiQ1zI7iQa9AY3IWHcufQzF59vUaAjRFGvdUczGB75uMsSNSIbSksIw5Ym
         1P2Q==
X-Gm-Message-State: AC+VfDz5riymHiZGdx8VfG5aEZKhjH7dWAFqqOW1QKxa2M86Q1SEXur8
        asFnApDNw8oZCduibcfmUzRHTfVdNsX9sEbKracwLn2jxsXeH7M8
X-Google-Smtp-Source: ACHHUZ6xdJNdh7DJEsGL+ny21Ar67ZAhdZmPPipdV66f8GZUStVAueQSbtbe8Q8QyRbArY8IRXHeGGAoiiDs9yQidSo=
X-Received: by 2002:a67:f711:0:b0:434:8c89:17f9 with SMTP id
 m17-20020a67f711000000b004348c8917f9mr3317655vso.20.1684836418268; Tue, 23
 May 2023 03:06:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230519174619.58308-1-frattaroli.nicolas@gmail.com>
In-Reply-To: <20230519174619.58308-1-frattaroli.nicolas@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 23 May 2023 12:06:47 +0200
Message-ID: <CAMRc=McrerNizhJ+d1m6PaDf65UX-RrZjAYjdABiLjZ69TPRWA@mail.gmail.com>
Subject: Re: [libgpiod] [RFC PATCH] bindings: python: allow specifying
 infinite timeout
To:     Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
Cc:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 19, 2023 at 7:47=E2=80=AFPM Nicolas Frattaroli
<frattaroli.nicolas@gmail.com> wrote:
>
> So far, libgpiod's Python bindings had no way to state that a
> user wishes to wait for events indefinitely, as a timeout of
> None would intentionally be converted to 0 seconds, i.e. return
> from the select call in poll_fd immediately.
>
> The usual Python convention and even the select convention is
> to block indefinitely on a timeout=3DNone. However, changing the
> poll_fd function to do this now would change an (intentional)
> API design choice by libgpiod 2.0 that API users presumably
> rely on.
>
> By allowing float("inf") (or in fact math.inf, or your favourite
> other way to get an infinite float) to mean waiting infinitely
> solves this by extending the API rather than changing it.
>
> On gpiod Python bindings without this change, passing inf results
> in an OverflowError being raised in select. API users who wish to
> support older versions of the bindings can catch this exception and
> act on it.
>
> Signed-off-by: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
> ---
>  bindings/python/gpiod/chip.py         | 3 ++-
>  bindings/python/gpiod/internal.py     | 4 ++++
>  bindings/python/gpiod/line_request.py | 3 ++-
>  3 files changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/bindings/python/gpiod/chip.py b/bindings/python/gpiod/chip.p=
y
> index 97ff340..95c5757 100644
> --- a/bindings/python/gpiod/chip.py
> +++ b/bindings/python/gpiod/chip.py
> @@ -195,7 +195,8 @@ class Chip:
>          Args:
>            timeout:
>              Wait time limit represented as either a datetime.timedelta o=
bject
> -            or the number of seconds stored in a float.
> +            or the number of seconds stored in a float. A timeout of Non=
e
> +            returns immediately, use float("inf") to wait indefinitely.
>
>          Returns:
>            True if an info event is ready to be read from the chip, False=
 if the
> diff --git a/bindings/python/gpiod/internal.py b/bindings/python/gpiod/in=
ternal.py
> index 37e8b62..141cfe9 100644
> --- a/bindings/python/gpiod/internal.py
> +++ b/bindings/python/gpiod/internal.py
> @@ -2,6 +2,7 @@
>  # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
>
>  from datetime import timedelta
> +from math import inf
>  from select import select
>  from typing import Optional, Union
>
> @@ -15,5 +16,8 @@ def poll_fd(fd: int, timeout: Optional[Union[timedelta,=
 float]] =3D None) -> bool:
>      else:
>          sec =3D timeout
>
> +    if sec =3D=3D inf:
> +        sec =3D None
> +
>      readable, _, _ =3D select([fd], [], [], sec)
>      return True if fd in readable else False
> diff --git a/bindings/python/gpiod/line_request.py b/bindings/python/gpio=
d/line_request.py
> index a0f97b7..ae21835 100644
> --- a/bindings/python/gpiod/line_request.py
> +++ b/bindings/python/gpiod/line_request.py
> @@ -178,7 +178,8 @@ class LineRequest:
>          Args:
>            timeout:
>              Wait time limit expressed as either a datetime.timedelta obj=
ect
> -            or the number of seconds stored in a float.
> +            or the number of seconds stored in a float. None returns
> +            immediately. Use float("inf") to wait indefinitely.
>
>          Returns:
>            True if events are ready to be read. False on timeout.
> --
> 2.40.1
>

I like this approach too. In fact - it may be even clearer and more
intuitive than converting None to infinite timeout.

Any objections against using negative numbers for the same purpose as well?

Bart
