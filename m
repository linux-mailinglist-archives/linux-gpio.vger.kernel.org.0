Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15A5576EB4A
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Aug 2023 15:56:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234127AbjHCN4P (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Aug 2023 09:56:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234272AbjHCN4O (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Aug 2023 09:56:14 -0400
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com [IPv6:2607:f8b0:4864:20::e2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB2D11B9
        for <linux-gpio@vger.kernel.org>; Thu,  3 Aug 2023 06:56:13 -0700 (PDT)
Received: by mail-vs1-xe2e.google.com with SMTP id ada2fe7eead31-44757af136cso434935137.3
        for <linux-gpio@vger.kernel.org>; Thu, 03 Aug 2023 06:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1691070973; x=1691675773;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mu/rUqGXJonJcgcGfRUYS+q0UZwHrj2YI+5hyQtrLdo=;
        b=VnXtHxzzctpfm1BTzksjdmDHyeo3wBvlrrC+73rRP6OLY9xpdPDBYcGPsJCXbHYQr2
         AbV4iaCxPcWTPgTkYB+zJHklXmUpObvzwG+fQ0UIToNupFknV9TJbWHZhK/ytEPdhLsA
         nH7mL0f5aideBh2Xt9dd119cx58l6uFjcKPoKoSoQO0fLJAAgce0h4iw89Vv8Ku5Tb4E
         WrDQ9l9xbqx7v6J72Rdxxn97ksIu2bAGzVJjp0HR88lmqEI2iEAU4b0h19Ru9Bw104v3
         qcFd7saIKzOC/Z6HJ32AGs5H1owp2PQeBiXoV2AoENoiXAXnHbPk7xEE3R43HJxhQnP8
         Tldw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691070973; x=1691675773;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mu/rUqGXJonJcgcGfRUYS+q0UZwHrj2YI+5hyQtrLdo=;
        b=VYt32bhn4dsgQ+7SWHkgFmjFKUNhYUPosaKdHlEy9vePuUj1u848ZDvxGC1bb3nrTb
         VEDcDTguE9q1Ex/QAa6qAtJPf9WJDnFWcIblTXXrGf1YQVlVQbjpnxmD1lFXMB0zNbjv
         YdNpMhsneq/e73buQW3dhcTh0W1BjKGBg75bxDnCAq7v8fnaMiwqnOLcc+LOeJ0lrIsS
         ReUfjWh7XKc38+SkPKirI1B17ujE4TVsxV2jugdh357g53OX+ZMWs0IOMXaV2XqAbCwX
         Dq/PviLg5tQpQu6rktd8vAllyinHTTWC1GwqWKIjQUg+1+ubivPQjG3h776keKc40Zg/
         sGzg==
X-Gm-Message-State: ABy/qLYX5DOe/7DjeePjUphEPqNagdSeEp7DoJEweVb6ni0+Z7eZAjlU
        m+KBiu1cKSxyiDDUxQktonTdrY8wJftFfmopjKWcIQ==
X-Google-Smtp-Source: APBJJlG8Ukn9LlaqZBilHsk7D/yWivkSckDHMgF46E0SeAB41wh4kYSuSr5W519gUKU+Qg9TDPsvrD/raL+rLKf4A3E=
X-Received: by 2002:a67:fd69:0:b0:444:c644:c231 with SMTP id
 h9-20020a67fd69000000b00444c644c231mr6351991vsa.12.1691070973094; Thu, 03 Aug
 2023 06:56:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230803022844.6021-1-wangzhu9@huawei.com>
In-Reply-To: <20230803022844.6021-1-wangzhu9@huawei.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 3 Aug 2023 15:56:02 +0200
Message-ID: <CAMRc=Mes0+TvS6KrOOqXnWYYbgRX0=BkwsaxnkC==eASzPbS0A@mail.gmail.com>
Subject: Re: [PATCH -next v3] gpio: tps65218: remove redundant of_match_ptr()
To:     Zhu Wang <wangzhu9@huawei.com>
Cc:     linus.walleij@linaro.org, andy@kernel.org,
        linux-gpio@vger.kernel.org, andy.shevchenko@gmail.com
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

On Thu, Aug 3, 2023 at 4:29=E2=80=AFAM Zhu Wang <wangzhu9@huawei.com> wrote=
:
>
> The driver depends on CONFIG_OF, so it is not necessary to use
> of_match_ptr() here.
>
> Even for drivers that do not depend on CONFIG_OF, it's almost always
> better to leave out the of_match_ptr(), since the only thing it can
> possibly do is to save a few bytes of .text if a driver can be used both
> with and without it. Hence we remove of_match_ptr().
>
> Signed-off-by: Zhu Wang <wangzhu9@huawei.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> ---
> Changes in v2:
> - Change of_match_ptr to of_match_ptr() in the commit message.
>
> ---
> Changes in v3:
> - Add a trailing comma after tps65218_dt_match.
> ---
>  drivers/gpio/gpio-tps65218.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-tps65218.c b/drivers/gpio/gpio-tps65218.c
> index e1d425a18854..d7d9d50dcddf 100644
> --- a/drivers/gpio/gpio-tps65218.c
> +++ b/drivers/gpio/gpio-tps65218.c
> @@ -216,7 +216,7 @@ MODULE_DEVICE_TABLE(platform, tps65218_gpio_id_table)=
;
>  static struct platform_driver tps65218_gpio_driver =3D {
>         .driver =3D {
>                 .name =3D "tps65218-gpio",
> -               .of_match_table =3D of_match_ptr(tps65218_dt_match)
> +               .of_match_table =3D tps65218_dt_match,
>         },
>         .probe =3D tps65218_gpio_probe,
>         .id_table =3D tps65218_gpio_id_table,
> --
> 2.17.1
>

Applied, thanks!

Bart
