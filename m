Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 793E776EBAF
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Aug 2023 16:02:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234313AbjHCOCe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Aug 2023 10:02:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236563AbjHCOBj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Aug 2023 10:01:39 -0400
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com [IPv6:2607:f8b0:4864:20::a2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4819F44AF
        for <linux-gpio@vger.kernel.org>; Thu,  3 Aug 2023 07:00:59 -0700 (PDT)
Received: by mail-vk1-xa2a.google.com with SMTP id 71dfb90a1353d-486571746e7so342109e0c.3
        for <linux-gpio@vger.kernel.org>; Thu, 03 Aug 2023 07:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1691071255; x=1691676055;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=grJ55mvgMdnvyadVkGxzSNSRVT6WJo0hSVbnanlDxeM=;
        b=46F0sf2Mq1/E6QkM1yUXYUEx/g0rMnJLbEJBYp/r8V9bqTz/6vYapFHUNaU3Kvq0Q8
         JvLSFuQJ/NKYswveMV7aJuq1bGXlQE3AZ6HEYc2NEy2ZiAubqwI1Gjm6nmcG/YQMdW9+
         /X4OGlqECZBfv/5dcJep8SMwyNzLKmuedNw+nrO+mQ4mbziy0iiDxlUPtKh5c6h9GDOU
         JxOzf8szTnF3RAwX08qQcObe1EJmkLB3vg4t+u4egiC7HlTA350XzxW6t0vKfXXPwBf/
         /tbBdu9/qM3oB7hSC40TjEHuA0Ic2vtInAmi/vtzKyspl7vbVPfv0G0l4IMIqzIPGXkz
         FLtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691071255; x=1691676055;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=grJ55mvgMdnvyadVkGxzSNSRVT6WJo0hSVbnanlDxeM=;
        b=M5cuilFSolIftVO8W0xITaJ56ko0Sjoh1sm6XfPUpMU7wQIY1btFmlcrfhjs9vpYGx
         ClZITWHHbTVTW0N1Pn2GGpLfPonw6LIowYI/Tvghry71iythC0b5WSJZCM1MfmhsHEBB
         bva2rlFTxVHSvhesKTjEIdTY3d4tFUag9j0Rv6OIY0YLRb2HEegxg6akI/fpMs/tVHMh
         OYBQ3A7b4OyeL+G2pe2ZBO/4UkXx2aZa2+NEFRVYwYexdSR3a99689jl+hwQUIjL3PIm
         DMEwssgKavfjbGCaIne1jGKKnff2NSIW3V7TDa8EE+qDdrvkJHHW4BG7l6+eJJONbsiU
         /hjw==
X-Gm-Message-State: ABy/qLaKMWXRpTc2Qbe2DdlYgH44X6t3etldGZ94NZ2GixbnjHbAfBzp
        h+M2c/EQ6UWeyqS3KLmwXPv6CNuK7B2In0lRGWE3cNyjFmRhO3aoqxIZ5A==
X-Google-Smtp-Source: APBJJlGkr7rglPB+en8mz1ckxo8HP1UaD88/Lgv4us9X7kr14ItcdLqoOdrgAQ1MBCWhRDrhP8U6w+ysdn9XFtmIbb0=
X-Received: by 2002:a05:6102:494:b0:443:898c:864d with SMTP id
 n20-20020a056102049400b00443898c864dmr6871473vsa.14.1691071255615; Thu, 03
 Aug 2023 07:00:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230802024455.210898-1-wangzhu9@huawei.com>
In-Reply-To: <20230802024455.210898-1-wangzhu9@huawei.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 3 Aug 2023 16:00:43 +0200
Message-ID: <CAMRc=Mc_uRK16D2BVP0rzAPjHkNO5eMQu-FP6C+T8HGh0ds-Dw@mail.gmail.com>
Subject: Re: [PATCH -next v2] gpio: ixp4xx: remove redundant of_match_ptr()
To:     Zhu Wang <wangzhu9@huawei.com>
Cc:     linusw@kernel.org, kaloz@openwrt.org, khalasa@piap.pl,
        andy@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, andriy.shevchenko@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 2, 2023 at 4:45=E2=80=AFAM Zhu Wang <wangzhu9@huawei.com> wrote=
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
> ---
>  drivers/gpio/gpio-ixp4xx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-ixp4xx.c b/drivers/gpio/gpio-ixp4xx.c
> index 1e29de1671d4..dde6cf3a5779 100644
> --- a/drivers/gpio/gpio-ixp4xx.c
> +++ b/drivers/gpio/gpio-ixp4xx.c
> @@ -302,7 +302,7 @@ static const struct of_device_id ixp4xx_gpio_of_match=
[] =3D {
>  static struct platform_driver ixp4xx_gpio_driver =3D {
>         .driver =3D {
>                 .name           =3D "ixp4xx-gpio",
> -               .of_match_table =3D of_match_ptr(ixp4xx_gpio_of_match),
> +               .of_match_table =3D ixp4xx_gpio_of_match,
>         },
>         .probe =3D ixp4xx_gpio_probe,
>  };
> --
> 2.17.1
>

Applied, thanks!

Bart
