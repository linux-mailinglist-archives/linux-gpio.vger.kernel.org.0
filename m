Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD1D9218108
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 09:22:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730211AbgGHHWc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 03:22:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729949AbgGHHWc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 03:22:32 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15993C061755
        for <linux-gpio@vger.kernel.org>; Wed,  8 Jul 2020 00:22:32 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id f5so37091751ljj.10
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jul 2020 00:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=FmCJ3eglFvN3eT4dZ92ESwtil9DSI68INw+lfLda+f0=;
        b=qKICfYS87wXGDK2raBiEPSdqxxy/mrxVg8JsloXiJmUkD4BjyHRWRE4wcTUfMBQmJs
         hpmvYepXlAJbEtD/LWIgAhWW0U8MrNXFU58I0H5xfvZ6as0cPKmDvxfeaSmSOgdTpJGW
         3xbFMQDGPsZxoKvxkZvrKL7O1bhMa8JKOD+6Q0UYZU/qpREdNDldt82AtA7EQcgTwquo
         hz9dWTGi9zb4aJga/xTyztV6y02ajJ7qyliC8BxFGVtJABzgjQ3dgxKfD3jsDlOhyEPZ
         v6WkFjQ3BdVy8nsneqRcusS6PHaZ7ln5hjHT+u/p1zL6HzJhfmcZU7/a9Jq6UfwfYIoN
         a3yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=FmCJ3eglFvN3eT4dZ92ESwtil9DSI68INw+lfLda+f0=;
        b=K2TCzRTG9lbuL90tU5ajQKIxgpymSC2ZSOWKKcVOnOsdqrVtTKYn6z5YVBheFaM+FH
         9Pi/ne2vnZ0jHhez6QYy5t3vXvdB2rka3Z0GZ3DlCsEVuAqbpT9SM3wG8wWayo4M/+e+
         g90022reMfeJWCTdfGBld6B96M9LOBcRZa99PsJV0dfNCfxxBRaLOe5jQpAHaQql405+
         /vWQvQBPadMuzmf8IzWPxqGnCGbAarBqFOETbXdr3mV2i8CELIoiDJUivbWlnVqGcBbE
         Lq+Hl1UnVv4CJ/EMClomqe7j4FECL3ZDv6bdb4/c9TcoRdi/HSGGGh8QNZZZQjcFSr5C
         G1yw==
X-Gm-Message-State: AOAM532XjChA5w5+KYhW2mN7KWC9M6zvK6z7QuBH2a+v1sEzzgSYXHNe
        VA0QzNfW+ZWL8TvDLvXxjcEvL1Y5cGJPDIiJ1ftfzw==
X-Google-Smtp-Source: ABdhPJxVSZk9OJ8mzvBdSpccIOkiBmKRMTgwEzL7Qe5kGuMosrbh6GYSkWDU//vCaRe7LEQh541MQ2A2jqXKACTTlqA=
X-Received: by 2002:a2e:810a:: with SMTP id d10mr26819272ljg.144.1594192950588;
 Wed, 08 Jul 2020 00:22:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200630133345.2232932-1-lee.jones@linaro.org> <20200630133345.2232932-10-lee.jones@linaro.org>
In-Reply-To: <20200630133345.2232932-10-lee.jones@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 8 Jul 2020 09:22:19 +0200
Message-ID: <CACRpkdZY0dP6oRdbWYUkPNicyZsVOKA-smEtkLt1h_-p7NSM7w@mail.gmail.com>
Subject: Re: [PATCH 09/10] gpio: gpio-mlxbf2: Tell the compiler that ACPI
 functions may not be use
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Asmaa Mnebhi <Asmaa@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 30, 2020 at 3:33 PM Lee Jones <lee.jones@linaro.org> wrote:

> ... as is the case when !CONFIG_ACPI.
>
> Fixes the following W=3D1 kernel build warning:
>
>  drivers/gpio/gpio-mlxbf2.c:312:36: warning: =E2=80=98mlxbf2_gpio_acpi_ma=
tch=E2=80=99 defined but not used [-Wunused-const-variable=3D]
>  312 | static const struct acpi_device_id mlxbf2_gpio_acpi_match[] =3D {
>  | ^~~~~~~~~~~~~~~~~~~~~~
>
> Cc: Asmaa Mnebhi <Asmaa@mellanox.com>
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Patch applied!

Yours,
Linus Walleij
