Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73BCC767FE8
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Jul 2023 16:05:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231732AbjG2OFQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 29 Jul 2023 10:05:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231719AbjG2OFO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 29 Jul 2023 10:05:14 -0400
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com [IPv6:2607:f8b0:4864:20::935])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71A23210B
        for <linux-gpio@vger.kernel.org>; Sat, 29 Jul 2023 07:05:13 -0700 (PDT)
Received: by mail-ua1-x935.google.com with SMTP id a1e0cc1a2514c-791c27bb91dso1959400241.0
        for <linux-gpio@vger.kernel.org>; Sat, 29 Jul 2023 07:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1690639512; x=1691244312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+78LZEbtqirF+Rqq1XtdxHvOdho0Y1eQoJz83rQ2tLU=;
        b=F3fSlPIOWrDcrb46HJeahYa14qbVOhIBzjE+yAkimn5mWjZpmL7tn5+qy11SUSggbj
         sHmttHjmJu67n0eGm1GGBjaINfCU23ir1wL5I3uWGsp8jpEzmOWH4EjLI4LSdoyiCmvn
         dNQ2jUkrf7G7dNRrvsasIyVuGSWDwR5Q5Tpzt2yQc1mYe4ke4dLoFZ+0ucgjb4IuykAd
         1MyYPonrtoBDMhhW1nqytnHKsTDJzE7JnulwYBqNRJPhOdyJcpQYM4LOnBVm/5XoY4rx
         CNpA+SVXYIjnHUwwg+nq0avEvJxn8w+MGIp2BmG5rrmeVB2Pfky4MK3NLG4xjXDA2pLT
         C0sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690639512; x=1691244312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+78LZEbtqirF+Rqq1XtdxHvOdho0Y1eQoJz83rQ2tLU=;
        b=Acdqm2FZ6F7f0uQXM1xYoMXhNELXxVb4xzEb40nSLSSxPkAGUCGIe9ILpScxu40Iam
         M3qJhXSaUic0r7YkJubtUrX5/q+dZfHL9a0fCbJkKfJAuAS4ELRJ+Y6t+6cCsRk6Ujbn
         viKYTKawdFmh3K/XLPe2+7hq9RyGADxiGuWCDzgRCMkpqg5J3wR+Hkehq93XOSZAyC1Q
         VxdbLAw6UL4H8uBISP+jWsESzIFZxe7ayv0PWvc8UfM8YL5v49aBznCnF8xRdK1jlORV
         iF9/nytoEqqmxwvm3apTY2Y0YTKk8uRqaj5Ctvb7GUXUsRATI8ACrlR+IHXAFMBSSXtF
         JpeQ==
X-Gm-Message-State: ABy/qLbogYjpj0h6sQqPGLHtwht0dVOqC7c4zT2DMpubF5BJzRe+u4A5
        8oJvFbz9h8Mp6ML+16GVKil0A4Zv7/TApShD+Up1pg==
X-Google-Smtp-Source: APBJJlGDx02B/SeTNL+3jPFv8OnRwTvBkHc6OtObMaHuzs/IWW615PT8Y2LNACGmcbXflueW0vFYE265GUqzP+K3Rok=
X-Received: by 2002:a05:6102:38c8:b0:443:889c:3599 with SMTP id
 k8-20020a05610238c800b00443889c3599mr4345552vst.5.1690639512535; Sat, 29 Jul
 2023 07:05:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230719093923.17265-1-aboutphysycs@gmail.com>
In-Reply-To: <20230719093923.17265-1-aboutphysycs@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sat, 29 Jul 2023 16:05:01 +0200
Message-ID: <CAMRc=MfEtGRk4A4YDgGvd2Fsv8GtH02kAix57TaFcbcDk0HEZw@mail.gmail.com>
Subject: Re: [PATCH] gpio: exar: remove unneeded platform_set_drvdata() call
To:     Andrei Coardos <aboutphysycs@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        andy@kernel.org, linus.walleij@linaro.org,
        Alexandru Ardelean <alex@shruggie.ro>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 19, 2023 at 11:41=E2=80=AFAM Andrei Coardos <aboutphysycs@gmail=
.com> wrote:
>
> The platform_set_drvdata() was needed when the driver had an explicit
> remove function.
> That function got removed a while back, so we don't need to keep a pointe=
r
> (on 'dev->driver_data') for the private data of the driver anymore.
>
> Reviewed-by: Alexandru Ardelean <alex@shruggie.ro>
> Signed-off-by: Andrei Coardos <aboutphysycs@gmail.com>
> ---
>  drivers/gpio/gpio-exar.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-exar.c b/drivers/gpio/gpio-exar.c
> index df1bdaae441c..5170fe7599cd 100644
> --- a/drivers/gpio/gpio-exar.c
> +++ b/drivers/gpio/gpio-exar.c
> @@ -217,8 +217,6 @@ static int gpio_exar_probe(struct platform_device *pd=
ev)
>         if (ret)
>                 return ret;
>
> -       platform_set_drvdata(pdev, exar_gpio);
> -
>         return 0;
>  }
>
> --
> 2.34.1
>

Applied, thanks!

Bart
