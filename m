Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF27370DD89
	for <lists+linux-gpio@lfdr.de>; Tue, 23 May 2023 15:35:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231326AbjEWNfo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 May 2023 09:35:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230421AbjEWNfn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 May 2023 09:35:43 -0400
Received: from mail-vk1-xa30.google.com (mail-vk1-xa30.google.com [IPv6:2607:f8b0:4864:20::a30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 616D4CA
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 06:35:42 -0700 (PDT)
Received: by mail-vk1-xa30.google.com with SMTP id 71dfb90a1353d-456f1cc1791so1618746e0c.2
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 06:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1684848941; x=1687440941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sA2nQQIhtGrdQMJbB8s54hK9QBq8c0c8+3uA4JbO9W8=;
        b=b6QwACzOaqwgGZve/mIPzBAAbfjnmmOnOWYe2kJHN6iIW7bNwB9TRrrw5EMBZlnGsG
         ibl/bCILrbdOkXX0ZDjfXq3PW8Kqqe8bS5z//oaxPcB5IydRQueb4fq3JkHxbdAlGCVm
         QJjBe8dKvXrEuqGYRRqNECup//nA4SUf4h6SlfPZUQkrwEoIFH8JXr3mhAo+4fn27XtN
         qjJ+Lg2yXsDxwP1Y2r7/pPvpLKgAaHqPJsiEHd8kLzRDG9QTPDYxOTLtKorVObOMQitL
         xUBJq1QuFBiiZtUhFEYtYoCL/AJRyRQPHKX9bP9GXWYZ3VFb/Ue2X4Jr3PGE/QvjPez6
         Zowg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684848941; x=1687440941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sA2nQQIhtGrdQMJbB8s54hK9QBq8c0c8+3uA4JbO9W8=;
        b=PKAg+rkE6iE6KWYZhM/PbVKj9zeFxgLscCXBQ3Nbsi3weigD7BOKJDruFVXgvoh5nz
         NnaDdILWtNdKwcS1lruSa+7scTWGpreuyUOlyGcJ1vKLt8iYFHFdJYUV3+aZ2LFATyGj
         D8AD/eRNj4z28dWlX0KC4oajqxLs0uQzYECWxNGWYIGTmfUdYgnvEZgBd/+8ePyDCtxK
         QcTVpGMoOYN72O7dBxU6jtRVBIYXHTXf9gjc665npxLp6dl46KDRO3DX7Ho8O+b9o+Xw
         iqFlHyot5rogz5gXpsZM//s7ifVNR1OT/MHdnkdQU6aE132dsxBFJtVm/e1JkQBQaJox
         RyNg==
X-Gm-Message-State: AC+VfDwOJqpBjvOvlaM+UCLre4Ya2zs/okU8CTYQDex+Iyy9QPWN/P4E
        TS7ALfYv1w7kLmUJLx8L79YXLJeMMCG2Swh4NOMD+g==
X-Google-Smtp-Source: ACHHUZ4iJx2jl/IYOs7ykDuF0F8TVL/nsJ2IVgNE5s/4YE63UUUxiOnumSW9lU33UdSsjicg9vwm0FdpvZFFgncDNQE=
X-Received: by 2002:a67:ead1:0:b0:430:16c1:4d8 with SMTP id
 s17-20020a67ead1000000b0043016c104d8mr3822500vso.25.1684848941400; Tue, 23
 May 2023 06:35:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230523133427.194558-1-brgl@bgdev.pl>
In-Reply-To: <20230523133427.194558-1-brgl@bgdev.pl>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 23 May 2023 15:35:30 +0200
Message-ID: <CAMRc=MdOpX4+9=DTdg7yuzUj3RBNYw=Qaw6Ny-YnyyngAP02pg@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] bindings: python: change the interpretation of
 None in event wait
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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

On Tue, May 23, 2023 at 3:34=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The docs don't mention it but currently passing None as the timeout to
> one of the event wait methods works like passing 0 to select() - the wait
> method returns immediately. Change it to a more standard behavior - None
> makes the method block indefinitely until an even becomes available for
> reading.
>
> This is a slight change in the behavior but let's hope nobody complains
> as libgpiod v2 is still pretty recent and its adoption is (hopegully)
> not wide-spread yet.
>
> Suggested-by: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>

Cr*p, it was supposed to be Kent who suggested it and Nicolas who
Reported it. I can change it when applying if the patch is fine.

Bart

> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  bindings/python/gpiod/chip.py         | 3 ++-
>  bindings/python/gpiod/internal.py     | 3 ---
>  bindings/python/gpiod/line_request.py | 3 ++-
>  3 files changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/bindings/python/gpiod/chip.py b/bindings/python/gpiod/chip.p=
y
> index 97ff340..52d0757 100644
> --- a/bindings/python/gpiod/chip.py
> +++ b/bindings/python/gpiod/chip.py
> @@ -195,7 +195,8 @@ class Chip:
>          Args:
>            timeout:
>              Wait time limit represented as either a datetime.timedelta o=
bject
> -            or the number of seconds stored in a float.
> +            or the number of seconds stored in a float. If set to 0, the
> +            method returns immediately, if set to None it blocks indefin=
itely.
>
>          Returns:
>            True if an info event is ready to be read from the chip, False=
 if the
> diff --git a/bindings/python/gpiod/internal.py b/bindings/python/gpiod/in=
ternal.py
> index 37e8b62..7b4598c 100644
> --- a/bindings/python/gpiod/internal.py
> +++ b/bindings/python/gpiod/internal.py
> @@ -7,9 +7,6 @@ from typing import Optional, Union
>
>
>  def poll_fd(fd: int, timeout: Optional[Union[timedelta, float]] =3D None=
) -> bool:
> -    if timeout is None:
> -        timeout =3D 0.0
> -
>      if isinstance(timeout, timedelta):
>          sec =3D timeout.total_seconds()
>      else:
> diff --git a/bindings/python/gpiod/line_request.py b/bindings/python/gpio=
d/line_request.py
> index a0f97b7..090467c 100644
> --- a/bindings/python/gpiod/line_request.py
> +++ b/bindings/python/gpiod/line_request.py
> @@ -178,7 +178,8 @@ class LineRequest:
>          Args:
>            timeout:
>              Wait time limit expressed as either a datetime.timedelta obj=
ect
> -            or the number of seconds stored in a float.
> +            or the number of seconds stored in a float. If set to 0, the
> +            method returns immediately, if set to None it blocks indefin=
itely.
>
>          Returns:
>            True if events are ready to be read. False on timeout.
> --
> 2.39.2
>
