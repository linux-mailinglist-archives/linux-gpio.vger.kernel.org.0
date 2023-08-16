Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B39977E092
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Aug 2023 13:38:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235034AbjHPLiJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Aug 2023 07:38:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244692AbjHPLhp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Aug 2023 07:37:45 -0400
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com [IPv6:2607:f8b0:4864:20::a2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1FE4198E
        for <linux-gpio@vger.kernel.org>; Wed, 16 Aug 2023 04:37:43 -0700 (PDT)
Received: by mail-vk1-xa2c.google.com with SMTP id 71dfb90a1353d-48719771d3fso4677842e0c.0
        for <linux-gpio@vger.kernel.org>; Wed, 16 Aug 2023 04:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1692185863; x=1692790663;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gkniGw8X60dZGG0/2QwYml0OEv6BpB8eq/BnoakL6l8=;
        b=KCefl4EeF0bE09011/E1zvYnnZv31+reSVQfTbVywg473EQH9YWm/LbD929FyieFdh
         1HNKB9dztsgryIF+NPzK3ZZNNYW+5bFPZpJwA7dJg6AtLmnwY5ZWoFDpgvL8cFwH72ju
         hB0Q/8VrJUhJXBt17KIhYUN6fKuC2rLlv/Nb4IICv1vANvz0QSCFsPPIdHVsGtv//nmF
         ITy9aghDGb8SVe8udkPAETFFX3qBGAorg40kra7QFbT0/FIdnltQWYYzIQfR1Alvm0QL
         CxjmhAE5ZtpSMsF3F1vKjUDpu9kCnyjQFTKSjCjryuF0ZljGP6YlJqRD7AjCvnxJpkfK
         78rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692185863; x=1692790663;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gkniGw8X60dZGG0/2QwYml0OEv6BpB8eq/BnoakL6l8=;
        b=PcIdVh38PdRRvL/pOJqPdXq/YIvAyBT5zh7sCsxrh3RVlKuXcD9W4uuhJHt/P8pLTh
         +5eO+LxMGk255oy6+VwfX3ToEHjsg4Wm/5AGzCEnpVQnID0/FKaQZeSrHugNZhDxTX0T
         xNXSNXdAV4g6KQ1wpodkUizMMbXmYVSX7N5NTevmQq6B/OzLDHqMkX8WBEGl6B/KAkDi
         I3EarzcshJPorT7/d+2a6SJSZJEgTtsjEtgN13tR46aMtA+BXqB1lnpvsQ/7gM+cIheY
         RvCgtJgH96fzzDx1CRzNu/1WOgC6x2QdoIwdW7Qopmsj1hoKecm10tuCVnM6rOUVz1g6
         CsEA==
X-Gm-Message-State: AOJu0Yy/183EvRwNv7YSOwMa+tRmqxaVxb9EgafVPRRgaZaWn4JKF7p+
        RIIeBH3ED1xMRKNJZsQ2Snrim1iBYt0il+tFgfnoiQ==
X-Google-Smtp-Source: AGHT+IFDwRo5f/VSRlfWrbcO2BNZxwsIUB6eqolmB8bXeSu+qTy0BzDKtb+TQUJi1yzWVPIKFOsaPkl3DiOc0yAqx8E=
X-Received: by 2002:a1f:a4c1:0:b0:481:5218:ad27 with SMTP id
 n184-20020a1fa4c1000000b004815218ad27mr2568426vke.3.1692185862866; Wed, 16
 Aug 2023 04:37:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230811193034.59124-1-brgl@bgdev.pl>
In-Reply-To: <20230811193034.59124-1-brgl@bgdev.pl>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 16 Aug 2023 13:37:32 +0200
Message-ID: <CAMRc=MdeG2S=HSc0TY03nXX_hSnBLp7ywTSa2=xwTXWDTZqb=Q@mail.gmail.com>
Subject: Re: [PATCH v3] gpiolib: fix reference leaks when removing GPIO chips
 still in use
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 11, 2023 at 9:30=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> After we remove a GPIO chip that still has some requested descriptors,
> gpiod_free_commit() will fail and we will never put the references to the
> GPIO device and the owning module in gpiod_free().
>
> Rework this function to:
> - not warn on desc =3D=3D NULL as this is a use-case on which most free
>   functions silently return
> - put the references to desc->gdev and desc->gdev->owner unconditionally
>   so that the release callback actually gets called when the remaining
>   references are dropped by external GPIO users
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> v1 -> v2:
> - add a comment about why we can't use VALIDATE_DESC_VOID()
>
> v2 -> v3:
> - we must drop the reference to the owner module before we drop the one
>   to the gpio_device as the latter may be removed if this is the last
>   reference and we'll end up calling module_put() on freed memory
>
>  drivers/gpio/gpiolib.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 251c875b5c34..76e0c38026c3 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -2167,12 +2167,18 @@ static bool gpiod_free_commit(struct gpio_desc *d=
esc)
>
>  void gpiod_free(struct gpio_desc *desc)
>  {
> -       if (desc && desc->gdev && gpiod_free_commit(desc)) {
> -               module_put(desc->gdev->owner);
> -               gpio_device_put(desc->gdev);
> -       } else {
> +       /*
> +        * We must not use VALIDATE_DESC_VOID() as the underlying gdev->c=
hip
> +        * may already be NULL but we still want to put the references.
> +        */
> +       if (!desc)
> +               return;
> +
> +       if (!gpiod_free_commit(desc))
>                 WARN_ON(extra_checks);
> -       }
> +
> +       module_put(desc->gdev->owner);
> +       gpio_device_put(desc->gdev);
>  }
>
>  /**
> --
> 2.39.2
>

Queued for fixes.

Bart
