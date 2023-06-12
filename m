Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CDAD72C885
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jun 2023 16:29:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238725AbjFLO3o (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Jun 2023 10:29:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232156AbjFLO3a (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Jun 2023 10:29:30 -0400
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D28052959
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jun 2023 07:27:29 -0700 (PDT)
Received: by mail-vs1-xe30.google.com with SMTP id ada2fe7eead31-43dc3f77accso1105788137.3
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jun 2023 07:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686580048; x=1689172048;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BrIOf0N4KaxvFLQOIPnhaiXq8mSw+c+v+o6tx4JG28Q=;
        b=kB/Fff0me6+oHZ2ilFWA8EvHDGcWVQhMP09Xr3G3DeiRU8/ByzrPlztIqR6jO2mucM
         fj4jMMuRwnHXnjKgfQEcz0D2+5YwiMG3ZduFhdt9YUUpI+psG97a1zrgPTekw34L1PBz
         RqbTHrP0X9nWOUj5cP+L5ibIuKDbUqiDcD9dkycT86dEd04W8UQpiMa/U2rX+Cs2e0KF
         +Ge7nf1MAVBJO1s4zPzdYofefnO2H8kL0y1iJW+A6P0VsNkDPZDZnFXpTigxWFMc8Ook
         WHOCZuaOk4zYmqi1Kmk5SOEqpRRidnt8gKHeP7iFYGS4DMZHSu6vczPwJB6CT8Smh5SR
         hXHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686580048; x=1689172048;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BrIOf0N4KaxvFLQOIPnhaiXq8mSw+c+v+o6tx4JG28Q=;
        b=TlnGJ825AdWNG4NwN+GkbKbdEwIgq/S1ao8fHhZMn80CPo/3f/BBWhI3iO92xs8ahq
         P/rRCeBsupeoZwwHbbLGUt7yZG0WRuABLu5XJ/FRvhsFMUPRdPUyAbmMjlCsAf+pD2co
         jrqWAcEeVsAWYEJ11BfUEnOK0eRuXP6e+5k+e3GYqrlxT71Mt8XHZCKBkf8zQYofeI80
         l68BLQNrQ+J0mxHzw+Fdk9r8Ji2eInHCqK4O8R/gYs4is6x2nyYz5VYXHOXH4L/Z+Uqu
         XMRmX15vS/FcZsus8yQRoeqMUfUOKGC5Mk9PDSw1tvYpQJimC+SkEY+HLxT/FUlxgvar
         lFkQ==
X-Gm-Message-State: AC+VfDzelRXN6D77VB0NxLZp6sF3kuvoZkBoEnk7NG62y0gpgohSSvwk
        UaglrJUreyt1OSs8AMF9u7tUzxv36ZzjTCesWVwwPH6o/6tyJo4e
X-Google-Smtp-Source: ACHHUZ6PnQtwcyJ1Id/P0rsy0JD8c8yLxn4ZTMC9kWIn/uJk0H5OiQ/nkv+Jp+D+1Lb3lK90RP5TJCDyuyxC/ot9OwA=
X-Received: by 2002:a05:6102:490:b0:434:66e3:74b4 with SMTP id
 n16-20020a056102049000b0043466e374b4mr3664477vsa.8.1686580048541; Mon, 12 Jun
 2023 07:27:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230609153607.133379-1-warthog618@gmail.com> <20230609153607.133379-2-warthog618@gmail.com>
In-Reply-To: <20230609153607.133379-2-warthog618@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 12 Jun 2023 16:27:17 +0200
Message-ID: <CAMRc=McXg3YS-TR4YzEZ+gFZ9n4DUopdFb-vFPxEZ-d5xpkKCQ@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 1/2] bindings: python: examples: fix potential
 glitch in gpioset.py
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

On Fri, Jun 9, 2023 at 5:36=E2=80=AFPM Kent Gibson <warthog618@gmail.com> w=
rote:
>
> gpioset.py requests lines without setting their output value, and so
> sets them all inactive, and subsequently sets them to their requested
> value.  This can result in glitches on lines which were active and
> are set active.
>
> As this is example code, it is also important to demonstrate that the
> output value can be set by the request itself.
>
> Request the lines with the correct output values set in the request
> itself.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>  bindings/python/examples/gpioset.py | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/bindings/python/examples/gpioset.py b/bindings/python/exampl=
es/gpioset.py
> index 372a9a8..b36b376 100755
> --- a/bindings/python/examples/gpioset.py
> +++ b/bindings/python/examples/gpioset.py
> @@ -21,16 +21,16 @@ if __name__ =3D=3D "__main__":
>          x, y =3D arg.split("=3D")
>          return (x, Value(int(y)))
>
> +    def settings(v):

I renamed this to make_settings() when applying. Thanks.

Bart

> +        return gpiod.LineSettings(direction=3DDirection.OUTPUT, output_v=
alue=3Dv)
> +
>      lvs =3D [parse_value(arg) for arg in sys.argv[2:]]
> -    lines =3D [x[0] for x in lvs]
> -    values =3D dict(lvs)
> +    config =3D dict([(l, settings(v)) for (l, v) in lvs])
>
>      request =3D gpiod.request_lines(
>          path,
>          consumer=3D"gpioset.py",
> -        config=3D{tuple(lines): gpiod.LineSettings(direction=3DDirection=
.OUTPUT)},
> +        config=3Dconfig,
>      )
>
> -    vals =3D request.set_values(values)
> -
>      input()
> --
> 2.40.1
>
