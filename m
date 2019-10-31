Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7D39EAADA
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2019 08:10:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726596AbfJaHKO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 31 Oct 2019 03:10:14 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:34239 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726575AbfJaHKN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Oct 2019 03:10:13 -0400
Received: by mail-oi1-f195.google.com with SMTP id l202so4313444oig.1
        for <linux-gpio@vger.kernel.org>; Thu, 31 Oct 2019 00:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ckFaCn6NS8lQze7Cdj5CHfHcuRQX9ihC93nje9hqGGY=;
        b=lzK8HqK8cj7mpJSCz9rDuZ04tF6a4CMQWy/aulYq/r9w7YmOVaQEO0FF4isFDIlh7u
         Kxf7XJibsRn/FW27C34t4Evs8GatoBnx7xxyh1o3FQr47fDpVcR+vBpiwTlA0OEw24fJ
         TmQl8ECOXwNjYMLW6XJPSYqmX1KicyuA9USRQGYIvxMMwO3m9R1MW7RjlAqrEsSXI4HQ
         essGQWBP0u62IOeb7p+6x3Kt5hYvJ51hS8Mi2Zi1Zr9ylO15k5uUnb+3l47qd76Ms0sg
         8N1ZIOCVZOsuIXo21/pyf+GqqlVXq5rZad2g9WZ5PQdkY231ZxCw41N/YIh93B/ruXW2
         n0JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ckFaCn6NS8lQze7Cdj5CHfHcuRQX9ihC93nje9hqGGY=;
        b=pdzgMmIfNO1k0k3ihqxU2FleD68kW8n9Qz0jgnpve8F539PCE5iE1XYh38OntSBn0N
         7LE/GALKx1MHcXF2jAeTfUhCXsWbK5iQhxwWkoDbwj5f7gTpBWeg3pOi8QQsZGrjPQQ0
         0k15jN3Rqs3sL5f+12Ew2ztYMcJqEldmeErqtwvC3dnsqeA0YY4rNVpsBfLaIISEZg90
         P/JkAZgX7hqEW47288vf7qUkXYTzUAhfxQCYk/XLKes8m3ztr83dq6X3RQ2zPCrVw2tX
         cXEAZ7XQeyP3DwMNI3RWm1a/8Oa2iEmd5JCG9XmokNg4aJnXxe8MI5CUrqECmYwSuBUi
         QSRw==
X-Gm-Message-State: APjAAAV6i5XPRYjFdow/WE6aflJT7HleUoHEZZHrheKKfmocCCYfeCBt
        nu+Fa+ik9PNhv1P0C8mNFjRTQKEcPzUKtF3zf6eg4w==
X-Google-Smtp-Source: APXvYqw8Saj/usm4WuGLyowqwvSeH8QGt7VqNnNeVQdq6M1i/K3FrPOyAjOF3rBNVdI0JD8z9I+bQEwpuePzS4RzIMo=
X-Received: by 2002:a05:6808:4c6:: with SMTP id a6mr2931004oie.114.1572505811195;
 Thu, 31 Oct 2019 00:10:11 -0700 (PDT)
MIME-Version: 1.0
References: <20191028073713.25664-1-warthog618@gmail.com>
In-Reply-To: <20191028073713.25664-1-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 31 Oct 2019 08:10:00 +0100
Message-ID: <CAMpxmJUO3O05d6ZQijF4+1OCf5E7oeYOPVMZCmOXBV9-VJz5jw@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] gpio: expose line bias flags to userspace
To:     Kent Gibson <warthog618@gmail.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bamvor Jian Zhang <bamv2005@gmail.com>, drew@pdp7.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pon., 28 pa=C5=BA 2019 o 08:37 Kent Gibson <warthog618@gmail.com> napisa=C5=
=82(a):
>
> The major changes from v3 is the renaming of flags in patch 1, rather
> than in later patches, and the addition of sanity checking on bias flag
> combinations - only allowing one bias flag to be set at a time.
>
> There are still some deficiencies that I'm uncertain on how to best
> resolve:
>
> The setting of bias is performed by gpio_set_bias, which is hooked into
> gpiod_direction_input and gpiod_direction_output.  It extends the setting
> of bias that was already present in gpiod_direction_input.
> In keeping with the existing behaviour, the bias is set on a best-effort
> basis - no error is returned to the user if an error is returned by the
> pinctrl driver.  Returning an error makes sense to me, particularly for
> the uAPI, but that conflicts with the existing gpiod_direction_input
> behaviour. So leave as best-effort, change gpiod_direction_input
> behaviour, or restructure to support both behaviours?

Thomas: is there any reason not to check the return value of these
calls for errors other than -EOPNOTSUPP?

>
> Also, the gpio_set_bias is hooked into gpiod_direction_output, which is
> fine for the uAPI, but perhaps it should be hooked into
> gpiod_direction_output_raw_commit?  Or the setting of direction
> and bias should be decoupled?
>
> And now the actual blurb...
>
> This series adds gross control of pull-up/pull-down to the GPIO uAPI.
> Gross control means enabling and disabling of bias functionality,
> not finer grained control such as setting biasing impedances.
>
> The support allows both input and output lines to have any one of the
> following biases applied as part of the line handle or event request:
>  0. As Is - bias is left alone.  This is the default for ABI compatibilit=
y.
>  1. Bias Disable - bias is explicitly disabled.
>  2. Pull Down - pull-down bias is enabled.
>  3. Pull Up - pull-up bias is enabled.
>
> The biases are set via three flags, BIAS_DISABLE, BIAS_PULL_DOWN
> and BIAS_PULL_UP.  These map directly to the similarly named
> pinctrl pin_config_param flags.
> As Is corresponds to none of the flags being set.
>
> The setting of biases on output lines may seem odd, but is to allow for
> utilisation of internal pull-up/pull-down on open drain and open source
> outputs, where supported in hardware.
>
> Patches are against Bart's gpio/for-next branch[1].
>
> The patch has been successfully tested against gpio-mockup, and
> on a Raspberry Pi, in both cases using the feature/pud branch of my Go
> gpiod library[2], as well as with my feature/pud development branch
> of libgpiod[3].
>
> Patch 1 adds support to line handle requests.
> Patch 2 adds support to line event requests and restricts bias settings
> to lines explicitly requested as inputs.
> Patch 3 adds pull-up/down support to the gpio-mockup for uAPI testing.
> Patch 4 adds support for disabling bias.
> Patch 5 adds support for setting bias on output lines.
>
> Drew Fustini (1):
>   gpio: expose pull-up/pull-down line flags to userspace
>
> Kent Gibson (4):
>   gpiolib: add support for pull up/down to lineevent_create
>   gpio: mockup: add set_config to support pull up/down
>   gpiolib: add support for disabling line bias
>   gpiolib: add support for biasing output lines
>
>  drivers/gpio/gpio-mockup.c | 94 ++++++++++++++++++++++++--------------
>  drivers/gpio/gpiolib.c     | 81 +++++++++++++++++++++++++++++---
>  drivers/gpio/gpiolib.h     |  1 +
>  include/uapi/linux/gpio.h  |  6 +++
>  4 files changed, 142 insertions(+), 40 deletions(-)
>
> --
> 2.23.0
>
> [1] git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git
> [2] https://github.com/warthog618/gpiod.git
> [3] https://github.com/warthog618/libgpiod.git

I think this starts to look good. There are some nits and I'd like to
also hear an opinion from Linus on that, but I personally like that
and think it'll be useful.

Bart
