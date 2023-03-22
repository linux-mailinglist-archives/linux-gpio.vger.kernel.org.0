Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 306966C50AC
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Mar 2023 17:28:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230219AbjCVQ2a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Mar 2023 12:28:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230214AbjCVQ2M (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Mar 2023 12:28:12 -0400
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com [IPv6:2607:f8b0:4864:20::92d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEDFE5CC2A
        for <linux-gpio@vger.kernel.org>; Wed, 22 Mar 2023 09:27:50 -0700 (PDT)
Received: by mail-ua1-x92d.google.com with SMTP id p2so13080453uap.1
        for <linux-gpio@vger.kernel.org>; Wed, 22 Mar 2023 09:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1679502470;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QcBh8LbgiZnRhxN9ZOExXV06VdRnER7GdJGafrPv3AA=;
        b=lLbOg/bI0Dt7zVFdc55ZLV/hefFjA7ho51BY5gzdLMX6Oyig4MrRdDK9z9blgXY5bO
         nuxQ0YLJFsW/vCWmqo22bc0rxCbKlPnqOmxyhuuCSjYyKI4Qz4pTH2nCNdDpLUvaqg5s
         GkeWJJ0gZynt+siiqozduL/YGDbrgyIkiVMLEzSK/KZ1ZsXCyDNH8f5JUNmeGpIE5+4X
         ROtBj8CelDicuOx9TKlP8rVfW4qCUWByDs1X3vfCz6UQYz6CMVUneVXA4nWQlFRIKIaR
         pe9EXYZNLwatGCN+mYjBhxl2EpARc3ka7ArZtYZlWC+mtONp0wmC14KjIkvA0TFJ5YEI
         ESUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679502470;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QcBh8LbgiZnRhxN9ZOExXV06VdRnER7GdJGafrPv3AA=;
        b=M0ZGzLPh/0IhAHP+7vSLKiEEwsMUQyNi7eHWG02GtYnkBkj//2qQ5o3b/guVOgyTmP
         CPZ5UZlUDS2q0reb7iATEmaLfwx7GrDBjRY8az7RrGLo8VZeKUeHqB3hgKlbX4kQHvay
         zWMyenpuApcAqop+iBPfwL0Bk/vS6+kxn0wD5ePzTO3GxbeBa23bMBK3xqnu1jx74YMR
         DZP0lFPjLCQq6i/4CXcpkEenbv/6yZ54MxDGJgw/cWdbgmnueCmFwu+QTbFhtVamVDKy
         RWe6wRFLpc1erSNZIoDSJ3S8wg/VNH/rIxjdJNrLZEKdz7a9xkcvzMhS5xC+2DsbbrKx
         Xnqw==
X-Gm-Message-State: AO0yUKVYRk1hj3ephHe1UPqmoq8Ap43hUB+ExJFnwehAVFNJ1oxVC7wj
        zpodbCVbFViASWFX0XaUJbJ+yn8Xgkz4guHhkUZYdQ==
X-Google-Smtp-Source: AKy350apkN3Ok9m7z9C5n8gXItofIv4O6BGooPA8ZvkwmqTth2C+Qhld0DPukx24/DJ0VdX72givemdT/lEhKYvO67M=
X-Received: by 2002:a05:6130:228:b0:68b:923a:d6f4 with SMTP id
 s40-20020a056130022800b0068b923ad6f4mr3595319uac.2.1679502469910; Wed, 22 Mar
 2023 09:27:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230319143640.1704735-1-trix@redhat.com>
In-Reply-To: <20230319143640.1704735-1-trix@redhat.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 22 Mar 2023 17:27:39 +0100
Message-ID: <CAMRc=MfMDLC1npyyjGe+Ph6fNwB_Wau7XDPMAnM-wPzec3_rfA@mail.gmail.com>
Subject: Re: [PATCH] gpio: pxa: remove unused gpio_is_pxa_type function
To:     Tom Rix <trix@redhat.com>
Cc:     robert.jarzmik@free.fr, linus.walleij@linaro.org,
        nathan@kernel.org, ndesaulniers@google.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Mar 19, 2023 at 3:36=E2=80=AFPM Tom Rix <trix@redhat.com> wrote:
>
> clang with W=3D1 reports
> drivers/gpio/gpio-pxa.c:174:19: error: unused function
>   'gpio_is_pxa_type' [-Werror,-Wunused-function]
> static inline int gpio_is_pxa_type(int type)
>                   ^
> This function is not used, so remove it.
>
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/gpio/gpio-pxa.c | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
> index 1198ab0305d0..a1630ed4b741 100644
> --- a/drivers/gpio/gpio-pxa.c
> +++ b/drivers/gpio/gpio-pxa.c
> @@ -171,11 +171,6 @@ static inline struct pxa_gpio_bank *gpio_to_pxabank(=
struct gpio_chip *c,
>         return chip_to_pxachip(c)->banks + gpio / 32;
>  }
>
> -static inline int gpio_is_pxa_type(int type)
> -{
> -       return (type & MMP_GPIO) =3D=3D 0;
> -}
> -
>  static inline int gpio_is_mmp_type(int type)
>  {
>         return (type & MMP_GPIO) !=3D 0;
> --
> 2.27.0
>

Applied, thanks!

Bart
