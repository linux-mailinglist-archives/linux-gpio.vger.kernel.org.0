Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 848477C806B
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Oct 2023 10:35:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230134AbjJMIf4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Oct 2023 04:35:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230131AbjJMIfz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Oct 2023 04:35:55 -0400
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com [IPv6:2607:f8b0:4864:20::e33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93901CE
        for <linux-gpio@vger.kernel.org>; Fri, 13 Oct 2023 01:35:51 -0700 (PDT)
Received: by mail-vs1-xe33.google.com with SMTP id ada2fe7eead31-457cb2fe3abso6385137.3
        for <linux-gpio@vger.kernel.org>; Fri, 13 Oct 2023 01:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697186150; x=1697790950; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FqKFJ5HKNwgOVoPJVGlaLE8bD08GdnsVYILHhjC7ofM=;
        b=FvpaodkEaTOKtNO9wY/pF6OZNUfaArz6+uzTmnduQrotzGs1N5EflI2kWYUaDek2Op
         ug2/kcYMaW9BF1OzRVfJFQQDrUDY45XA9bS9YuwDpjaSIJqbcYNjH+GigHnElBnBT81h
         1yoxj+Yev2CgJYL0tQ8iyArNHNie7Gm1xQsOuarDULH5wTq1YjsV3U6+8OC6Y6ULl+j0
         OIQJqYOgEiTm2YMt9MA8W/OzI33cBAgojttyM1Tl60+0ghUSBE1mHKE1wcFLuJWYWkDk
         dNLwXcdPLmn6/9EG2kdOkuoH+s/cR9mY6EjWoBy09yHVyO0Hd8ZDGtUwDQtZycmZQF95
         FXCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697186150; x=1697790950;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FqKFJ5HKNwgOVoPJVGlaLE8bD08GdnsVYILHhjC7ofM=;
        b=krGlBeygKiBJn6d6kXS6GXu58Br/ScP5WIDoNdYbVTQvytu7Ub7VsMeFMyPkyRcraN
         EUc4f6JA/scfiJpRgH8hDq60v8QMoleL0bv0PVLp5aLdiPKx4bH9F5oaqFzV/iCjCZXm
         kury5KitAbmqJXP5H13Fwpk6Nm2cATMqVtW6dR+T1Nb62jE9k7RhYdUIFhrFJWHb7wr1
         rcG8UmjBUcoxH2HzSXN1rkVq0d0TnwqZm/U0y/czPgxwlZGzBC1cPnbkYMmK81pDDz/m
         PmFvMryVYGUKOsAyEM/tAq5+pGS1tSiV606qbkfcYDS1xcjxQOKVD6E4AAqgzBeak2hU
         1tog==
X-Gm-Message-State: AOJu0YwTSheCUTsx+WpU5eqnQG6LZBMiSLn0CFpow9RbrNnQosMvRW50
        e6gx8SCyHnXZVcWTSYRiE4JXzdiBbWz8VUFigyPmTg==
X-Google-Smtp-Source: AGHT+IEOHMUe96OoepAD3N5k49Tsfr1FQm3zp+9rNrRW5YkokmFiywG7fO0dB73BuU3FnWFGcZU2kkxd8zx/YZVr5/Q=
X-Received: by 2002:a05:6102:415:b0:44d:e70d:8a4b with SMTP id
 d21-20020a056102041500b0044de70d8a4bmr22274041vsq.8.1697186150655; Fri, 13
 Oct 2023 01:35:50 -0700 (PDT)
MIME-Version: 1.0
References: <20231012210228.101513-1-phil@gadgetoid.com> <20231012210228.101513-3-phil@gadgetoid.com>
In-Reply-To: <20231012210228.101513-3-phil@gadgetoid.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 13 Oct 2023 10:35:39 +0200
Message-ID: <CAMRc=Mf4=c6hLu5=eUVQ+EB_Z-rsodmqvt3B0evZL04aa4ys4Q@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v2 2/2] bindings: python: add pyproject.toml,
 pep 518
To:     Phil Howard <phil@gadgetoid.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 12, 2023 at 11:02=E2=80=AFPM Phil Howard <phil@gadgetoid.com> w=
rote:
>
> Add pyproject.toml to prevent spurious deprecation warnings from pip.
>
> Signed-off-by: Phil Howard <phil@gadgetoid.com>
> ---
>  bindings/python/pyproject.toml | 5 +++++
>  1 file changed, 5 insertions(+)
>  create mode 100644 bindings/python/pyproject.toml
>
> diff --git a/bindings/python/pyproject.toml b/bindings/python/pyproject.t=
oml
> new file mode 100644
> index 0000000..fcf6bbe
> --- /dev/null
> +++ b/bindings/python/pyproject.toml
> @@ -0,0 +1,5 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2023 Phil Howard <phil@gadgetoid.com>
> +
> +[build-system]
> +requires =3D ["setuptools", "wheel"]
> --
> 2.34.1
>

Applied, thanks!

Bart
