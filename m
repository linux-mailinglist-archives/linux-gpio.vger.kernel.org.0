Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CF372E8CDB
	for <lists+linux-gpio@lfdr.de>; Sun,  3 Jan 2021 16:29:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726969AbhACP30 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 3 Jan 2021 10:29:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725819AbhACP3Z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 3 Jan 2021 10:29:25 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 329AFC061573
        for <linux-gpio@vger.kernel.org>; Sun,  3 Jan 2021 07:28:45 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id r5so24605490eda.12
        for <linux-gpio@vger.kernel.org>; Sun, 03 Jan 2021 07:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=CKbkg9XEl5Cdq3/4L/h6uPiBAUaQfHC57itqiZ9bJr0=;
        b=u+iMP0CXalv9utqd5ZD2+mn8twLDr3xzPi8vmIWcFXVI+sfdbcLrGk3gUc1C89iS7T
         2Zwu/jxux3tiVrKXUQ/RAG860Rho3AuyWkGp/gJTdUvHngpeKSqAjSIkMfhUrEpLDSxJ
         wQw2xMREbkj/lMvBZiUCkwM9LfOfggI+umT7uAOXPhEfcRdKVNS8Mp9g4r1hNM+0+eFH
         FOcfRvVkWnL5yY923moEFO7K7rw4QSFYpwNuN2OgCmh49C3Rqpry01X38sRNo18M2Nqw
         rx1XHAuH0i6V/CO3ke+WTFtt/5KBDgSgT40wFTmbqo/bwLPB0KljSGSSX5IqhXCL5cH/
         naJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=CKbkg9XEl5Cdq3/4L/h6uPiBAUaQfHC57itqiZ9bJr0=;
        b=tPQebch7404MehaKvKxpm+s2auZfjK0goi3jmIqme/2hrmzRyIRmNstPkg1CfKm8yJ
         vjqXwdiP/GrpLwHD/7SoJgVf0imDH7mGIm+d8g6md7PnyPsId5qcws219YXDxFCLF+O1
         6VA71X80gpQePR8yig6gBQFkVB44OtIaO3I+qBrRPdayOEumcKBfJ76hGeXmPDFz4tWu
         Br5am/8C203AfPGaRiMeCk/IJa9x5ODjvX/BxdAY9m3C8OW7vv13ese+zE9tFL03dQWc
         gdd9Ok+2vrK0yt4Ccs0cWedZJHaH7ZxSCnbOtzoZLfFp7brOOy3X8HSrgmO4j/FPqsRN
         02kg==
X-Gm-Message-State: AOAM5334e0Kge9lW2/WsxdglPDAOej8Q/3/NXetHx8pX2KZ9wBJhsuEb
        H3TnGMtfIuP2CIQqDuLKsS5x9J9OsqCL0j6Z2ztzVg==
X-Google-Smtp-Source: ABdhPJyfawFbl1Zu0fBq4KyAq33ha2UbUR3DbWgPLPfHN88VLCs6KDLSFdTvEgCk/q/IU27938Bt0kW/3uZS9hbuZNE=
X-Received: by 2002:a50:bac4:: with SMTP id x62mr66180717ede.59.1609687723765;
 Sun, 03 Jan 2021 07:28:43 -0800 (PST)
MIME-Version: 1.0
References: <20210101204325.998256-1-j.neuschaefer@gmx.net>
In-Reply-To: <20210101204325.998256-1-j.neuschaefer@gmx.net>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Sun, 3 Jan 2021 16:28:32 +0100
Message-ID: <CAMpxmJUVm+N=1WArb9hnV1BtsTfL5kH+_NkF3+iLmR17SiZjzA@mail.gmail.com>
Subject: Re: [PATCH] docs: gpio: intro: Improve HTML formatting
To:     =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc:     linux-doc <linux-doc@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 1, 2021 at 9:43 PM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:
>
> Currently the HTML output for Documentation/driver-api/gpio/intro.rst
> doesn't look right. The lines that start with LOW or HIGH are formatted
> in bold, while the next line after each is not bold.
>
> With this patch, the HTML looks better.
>
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> ---
>  Documentation/driver-api/gpio/intro.rst | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/driver-api/gpio/intro.rst b/Documentation/driv=
er-api/gpio/intro.rst
> index 74591489d0b55..94dd7185e76eb 100644
> --- a/Documentation/driver-api/gpio/intro.rst
> +++ b/Documentation/driver-api/gpio/intro.rst
> @@ -106,11 +106,11 @@ don't. When you need open drain signaling but your =
hardware doesn't directly
>  support it, there's a common idiom you can use to emulate it with any GP=
IO pin
>  that can be used as either an input or an output:
>
> - LOW:  gpiod_direction_output(gpio, 0) ... this drives the signal and ov=
errides
> -       the pullup.
> + **LOW**: ``gpiod_direction_output(gpio, 0)`` ... this drives the signal=
 and
> + overrides the pullup.
>
> - HIGH: gpiod_direction_input(gpio) ... this turns off the output, so the=
 pullup
> -       (or some other device) controls the signal.
> + **HIGH**: ``gpiod_direction_input(gpio)`` ... this turns off the output=
, so
> + the pullup (or some other device) controls the signal.
>
>  The same logic can be applied to emulate open source signaling, by drivi=
ng the
>  high signal and configuring the GPIO as input for low. This open drain/o=
pen
> --
> 2.29.2
>

Applied, thanks!

Bartosz
