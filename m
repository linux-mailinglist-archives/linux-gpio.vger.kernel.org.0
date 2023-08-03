Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D73176EB68
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Aug 2023 16:00:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236492AbjHCN76 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Aug 2023 09:59:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236520AbjHCN7r (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Aug 2023 09:59:47 -0400
Received: from mail-vk1-xa30.google.com (mail-vk1-xa30.google.com [IPv6:2607:f8b0:4864:20::a30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 938983AA3
        for <linux-gpio@vger.kernel.org>; Thu,  3 Aug 2023 06:59:39 -0700 (PDT)
Received: by mail-vk1-xa30.google.com with SMTP id 71dfb90a1353d-48642c1607bso401149e0c.0
        for <linux-gpio@vger.kernel.org>; Thu, 03 Aug 2023 06:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1691071178; x=1691675978;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8bNx7dzKd/HWDgtZXKkE2ES7Dpy3RqTFvFjDKavBAXk=;
        b=jLJ7Vd71vKc/T5MsyJrEFD4MPZ6X+UCvgXybiskdWFrLt7L5GPocok2fFGe8/399zR
         dyshEJ+iEPLMOSbeXgBy2RxQp4Z2zFkG3lpjAjUYh0gbP3RNawn/PfVUrAemALp3V0hz
         tuPjBd/geBlq63R7w7DacJr+3hGCoBEb2JCk0ypfGZL4a4ArjKakTDyXEvXFaPWkhwLg
         OmhBNKw/l93NQoUvlZV8Zhf8eXdGRgsFixnAedhoIkDx5Kz+k8hDJ05BTkEZbsI4+qeA
         43uPqlPm+OlxaepdMF6sNEgPCpXMmQ24FmIVBpoO4OM8yHdq6qsF8gbGsgsHilfzaYnF
         pYnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691071178; x=1691675978;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8bNx7dzKd/HWDgtZXKkE2ES7Dpy3RqTFvFjDKavBAXk=;
        b=Sdn+gTUoABK6zQk0WTrvFAoyzVDyN7vPy8mupisycdw264X1zrxv22He10jRyw1ru5
         ChRh2d5JGfItilpwhxrN13TUdRGcCf8VjzBN53Yp1EHadRqjebLAYwLEMw25oCwTJTTb
         LPyNAs9Hnn1U70EAMjl/3KJw7LPM398Qgp5Nk3+J38SahcW5pA+/PY2Vn7xiZpGPg70Y
         xwka4WmMg9CrRVaNrBCmZ5fOBQ2Kv05x7hge9DzEOfEfNaK+zoqBp4P3U6EnE65BdTD9
         2rF83x2Gi6UOoWqHJ+KXIujya+78xLXfzsWctjPJme6w5kr+Ch8kveyidbAF+jsyYdME
         Gd1A==
X-Gm-Message-State: ABy/qLboLnDEXW8IGKILsFNFHUvaTfgskj0HkARQINc/XGqXmGFuecfZ
        KztmLropDSYTJnjPaZNHjO7NnANBIyKXhLuq36Tw9w==
X-Google-Smtp-Source: APBJJlGElgnjT8E8JF1Wh2NoW25Ao00CjI1uKj2r10pmHPgqJNtPsivzitAVAsq2XlclmPD3Z2POUp1wU7CBRlkBeKM=
X-Received: by 2002:a1f:e701:0:b0:486:45cb:e203 with SMTP id
 e1-20020a1fe701000000b0048645cbe203mr6421898vkh.8.1691071178274; Thu, 03 Aug
 2023 06:59:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230803021317.257727-1-wangzhu9@huawei.com>
In-Reply-To: <20230803021317.257727-1-wangzhu9@huawei.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 3 Aug 2023 15:59:27 +0200
Message-ID: <CAMRc=Mfbd1ihK0nMu4ekwX1hZwZFHT8yoqJp0B+Gv_cjMqyyFA@mail.gmail.com>
Subject: Re: [PATCH -next v3] gpio: xra1403: remove redundant of_match_ptr()
To:     Zhu Wang <wangzhu9@huawei.com>
Cc:     nandor.han@ge.com, linus.walleij@linaro.org, andy@kernel.org,
        linux-gpio@vger.kernel.org
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

On Thu, Aug 3, 2023 at 4:13=E2=80=AFAM Zhu Wang <wangzhu9@huawei.com> wrote=
:
>
> The driver depends on CONFIG_OF, so it is not necessary to use
> of_match_ptr() here, and __maybe_unused can also be removed.
>
> Even for drivers that do not depend on CONFIG_OF, it's almost always
> better to leave out the of_match_ptr(), since the only thing it can
> possibly do is to save a few bytes of .text if a driver can be used both
> with and without it.
>
> Signed-off-by: Zhu Wang <wangzhu9@huawei.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> ---
> Changes in v2:
> - Change of_match_ptr to of_match_ptr() in the commit message.
> - Drop mod_devicetable.h.
>
> ---
> Changes in v3:
> - Include mod_devicetable.h.
> ---
>  drivers/gpio/gpio-xra1403.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-xra1403.c b/drivers/gpio/gpio-xra1403.c
> index eed8a1684830..dc2710c21c50 100644
> --- a/drivers/gpio/gpio-xra1403.c
> +++ b/drivers/gpio/gpio-xra1403.c
> @@ -194,7 +194,7 @@ static const struct spi_device_id xra1403_ids[] =3D {
>  };
>  MODULE_DEVICE_TABLE(spi, xra1403_ids);
>
> -static const struct of_device_id xra1403_spi_of_match[] __maybe_unused =
=3D {
> +static const struct of_device_id xra1403_spi_of_match[] =3D {
>         { .compatible =3D "exar,xra1403" },
>         {},
>  };
> @@ -205,7 +205,7 @@ static struct spi_driver xra1403_driver =3D {
>         .id_table =3D xra1403_ids,
>         .driver   =3D {
>                 .name           =3D "xra1403",
> -               .of_match_table =3D of_match_ptr(xra1403_spi_of_match),
> +               .of_match_table =3D xra1403_spi_of_match,
>         },
>  };
>
> --
> 2.17.1
>

Applied, thanks!

Bart
