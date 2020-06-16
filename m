Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3DEA1FABA1
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2020 10:50:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726840AbgFPIub (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jun 2020 04:50:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728043AbgFPIua (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jun 2020 04:50:30 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC619C03E96A
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2020 01:50:29 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id w1so18410629qkw.5
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2020 01:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=4t3Xqwr79G87+mJaR9fguFknMk+FUvhA8KmaEt177vQ=;
        b=R6czlWCQdPPI+IblkY8cTz8xoyh4JQuwrSDZW01KPtdwGZvBh1daPbeSCuZCQbHwQy
         5HUDEFAi/XOI0WDzAO6NeSk76UnaD/I66hzsEN2XYqOQEUlos/VWC0P8LrxHxAdM8jrh
         TD7QBO97joe0FRYUAHfqJsKYX1xQ8DwSWLH7W3ri3mwZziqcRMb3l8QFUjWMQ2dYrDEz
         U6tIihwEg5v/WcekDHgL2Km3TGWYW5Yqru9VRKq3MDXyiaQghtwfylHFBZNYB54G8LzU
         lbuycYEnvZPzIhniy61GHEjzRB/2txBTTOtutXEEyYqIBlsteCBS0e8dli8icPUe2c/d
         cRfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4t3Xqwr79G87+mJaR9fguFknMk+FUvhA8KmaEt177vQ=;
        b=go4j97S/mS2uhViJMeBqAOseayTG9BjWAmOP9opGMXV3PilQDp6mgBOv05TQz4WR+m
         ISFihsQZYMflzsXMEAMPytUAr8kFwFGysCKc9T3S/Dmv+tdPkD9p1Q+urDljCQ0L72KU
         nw5Y9e23pGH3BdUC6vcQ//FlnHv/1vFCGgkMvA9jhcfRqqXcsN7G1uv/hZyi0aG0Iha3
         VD9luf3EkSW/bxi7xWFU+H/7pQUXduTZbgb5TcV3ijOr+V0XNLX+WnOcW5EW1lje8nbf
         IODjlwxWh3fiFShBeuK/JGz7fNAn/cYUSz3uHjRfUYOqUsGdh38rPZuixogbmV7gqK82
         lcNw==
X-Gm-Message-State: AOAM533tTDeSVX+4YniMh5QP91iGjvSjCZBAWNNcdCBVBUJPtLFHE52i
        O8EZ82LLUsO/r/j3gnhmWx5ot/3s/BZ3WM8bniacuA==
X-Google-Smtp-Source: ABdhPJxD3cjCWk74RZhMR9JWS6d7o4JKHCTWkM8var9lSxpVjr/Tp1RtPwC/0y1lZPsKdRRQ2zdXAzp+CXaW4VF3SUA=
X-Received: by 2002:a37:4ac6:: with SMTP id x189mr18595455qka.323.1592297429112;
 Tue, 16 Jun 2020 01:50:29 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1592227348.git.jan.kiszka@siemens.com> <eecfadcb92f9f9c1446b4824471e9d7f45a9d8aa.1592227348.git.jan.kiszka@siemens.com>
In-Reply-To: <eecfadcb92f9f9c1446b4824471e9d7f45a9d8aa.1592227348.git.jan.kiszka@siemens.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 16 Jun 2020 10:50:18 +0200
Message-ID: <CAMpxmJWF8uKf2iGP3cF2mOC7nozFD-hZh0wE9VFAqP+P-zAC9g@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] gpio: pca953x: Add support for the PCAL9535
To:     Jan Kiszka <jan.kiszka@siemens.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pon., 15 cze 2020 o 15:22 Jan Kiszka <jan.kiszka@siemens.com> napisa=C5=82(=
a):
>
> From: Jan Kiszka <jan.kiszka@siemens.com>
>
> The PCAL9535 is compatible to the PCA9535. Additionally, it comes with
> interrupt support and input latching. Other features are not supported
> by the GPIO subsystem.
>
> Datasheet: https://www.nxp.com/docs/en/data-sheet/PCAL9535A.pdf
>
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  drivers/gpio/gpio-pca953x.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index 1fca8dd7824f..cd5fb522563e 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -89,6 +89,7 @@ static const struct i2c_device_id pca953x_id[] =3D {
>
>         { "pcal6416", 16 | PCA953X_TYPE | PCA_LATCH_INT, },
>         { "pcal6524", 24 | PCA953X_TYPE | PCA_LATCH_INT, },
> +       { "pcal9535", 16 | PCA953X_TYPE | PCA_LATCH_INT, },
>         { "pcal9555a", 16 | PCA953X_TYPE | PCA_LATCH_INT, },
>
>         { "max7310", 8  | PCA953X_TYPE, },
> @@ -1145,6 +1146,7 @@ static const struct of_device_id pca953x_dt_ids[] =
=3D {
>
>         { .compatible =3D "nxp,pcal6416", .data =3D OF_953X(16, PCA_LATCH=
_INT), },
>         { .compatible =3D "nxp,pcal6524", .data =3D OF_953X(24, PCA_LATCH=
_INT), },
> +       { .compatible =3D "nxp,pcal9535", .data =3D OF_953X(16, PCA_LATCH=
_INT), },
>         { .compatible =3D "nxp,pcal9555a", .data =3D OF_953X(16, PCA_LATC=
H_INT), },
>
>         { .compatible =3D "maxim,max7310", .data =3D OF_953X( 8, 0), },
> --
> 2.26.2
>

Patch applied with Andy's review tag.

Bart
