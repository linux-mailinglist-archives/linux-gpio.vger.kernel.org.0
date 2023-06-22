Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B73E7397BD
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jun 2023 09:03:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229845AbjFVHDF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 22 Jun 2023 03:03:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230204AbjFVHDE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 22 Jun 2023 03:03:04 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C438B1BD8
        for <linux-gpio@vger.kernel.org>; Thu, 22 Jun 2023 00:03:02 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-bc476bf5239so6701945276.2
        for <linux-gpio@vger.kernel.org>; Thu, 22 Jun 2023 00:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687417382; x=1690009382;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=647VdAKDpiR62O7WDkRN3aETIMIb4i2xmi3nL3BvZto=;
        b=RVypG5l/+pSwcJe4iq5GSYPU1Tat/StR/KO1GhkSLWWYu+cyIxl+EpaJLQllNj+1op
         xyOrQeX+w8dhn2BsZ2yLWofTlCFxGmPmKJ5Pl6tzFipb1ALOtXvlz7f7P04/WNENqfOL
         hkummsfw+y8fwhg1ADdUUZjiuN4xfjdvJFpyGKpxMnW+S/Uy4RAGIa+RZc680NA4DPf8
         +4tN0EqMKMI5CCUIHg8w51tAmqej3LccIPw+Ss7L6tHDCuIfLLoOC5SFpEDI7l8szWnf
         b0FgC8uDKFg8IX47ebiBAuOsBwplnylgqlYnfyIlgwVX202bV3J5R+pS25cRG+6IpW6E
         //ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687417382; x=1690009382;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=647VdAKDpiR62O7WDkRN3aETIMIb4i2xmi3nL3BvZto=;
        b=H7NOG2DOMZaUaQoRbDp1c+EkNd04w4alnacU743trFMySxC6gj2OfHCmxeU7TWgpVy
         7TpJFnE4h/tci/6a7ObT9gTerCj9a766ISGw5iuZDq7SqLicTOBOAKkxEn01iZx6yW6f
         X3drpxfNzwqYGgOLH+mAzsXM3t2K0bKiSSTWt7x83riU8jLUQQnlKZA22gQ1x6uoM7cm
         S6N+rIG2ua5M0ajWisQyFRoexer0OlvbxPGLIy4i2/g6oW7cqOWeydvd5/H0VY3fMfjJ
         GLNpuZpasx3z1pdvTqYkw+gSmsc2EZnmb2Jc8MrmmZxi6QcRC4SAQIdVUszbEpGi0elz
         rljg==
X-Gm-Message-State: AC+VfDwk/oWQX4fh+n4Z0fp3XfeVcjUxtdiHYZoMF2nDpSdezjORHI1T
        Y2pzPvQD5fhRY8cc28YkzjYIdYwSJXQerQfwTyaOFP3XaY5yTrbr
X-Google-Smtp-Source: ACHHUZ4KGoQu28j4ID5gDP1LVIyD9hPsoIPftVlCHbQKZr+7vKPoUgMzwrC6cjVNBrf24OS1HSUSy3zCaymoMBEqv5M=
X-Received: by 2002:a25:b325:0:b0:bfe:ade3:e59c with SMTP id
 l37-20020a25b325000000b00bfeade3e59cmr4044136ybj.64.1687417381797; Thu, 22
 Jun 2023 00:03:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230621213115.113266-1-nick.hawkins@hpe.com> <20230621213115.113266-3-nick.hawkins@hpe.com>
In-Reply-To: <20230621213115.113266-3-nick.hawkins@hpe.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 22 Jun 2023 09:02:49 +0200
Message-ID: <CACRpkdaGLBiYhMYcnVaaVi2GYZ+MawB4GWPL=B_N-qQ8+frbdQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] gpio: gxp: Add HPE GXP GPIO PL
To:     nick.hawkins@hpe.com
Cc:     verdun@hpe.com, brgl@bgdev.pl, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jdelvare@suse.com,
        linux@roeck-us.net, andy.shevchenko@gmail.com,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Nick,

thanks for your patch!

This is looking pretty good, I have some minor questions.

On Wed, Jun 21, 2023 at 11:35=E2=80=AFPM <nick.hawkins@hpe.com> wrote:

> From: Nick Hawkins <nick.hawkins@hpe.com>
>
> The GXP SoC supports GPIO on multiple interfaces. The interfaces are
> CPLD and Host. The gpio-gxp-pl driver covers the CPLD which takes
> physical I/O from the board and shares it with GXP via a proprietary
> interface that maps the I/O onto a specific register area of the GXP.
> This driver supports interrupts from the CPLD.
>
> Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>

(...)
> +enum pl_gpio_pn {
> +       IOP_LED1 =3D 0,
> +       IOP_LED2 =3D 1,
> +       IOP_LED3 =3D 2,
> +       IOP_LED4 =3D 3,
(...)

The confusing bit here is that GPIO means
*generic purpose input/output*
and these use cases are hardcoded into the driver and
do not look very generic purpose at all.

But I understand that it is convenient. I would add some
comment saying that if there is a new version with a
different layout of the pins, we need to make this kind
of stuff go away and just use the numbers.

> +static const struct gpio_chip template_chip =3D {
> +       .label                  =3D "gxp_gpio_plreg",
> +       .owner                  =3D THIS_MODULE,
> +       .get                    =3D gxp_gpio_pl_get,
> +       .set                    =3D gxp_gpio_pl_set,
> +       .get_direction =3D gxp_gpio_pl_get_direction,
> +       .direction_input =3D gxp_gpio_pl_direction_input,
> +       .direction_output =3D gxp_gpio_pl_direction_output,
> +       .base =3D -1,
> +};

Neat! Since you so explicitly have assigned a meaning to each
GPIO line, you can go ahead and assign the .names property as
well. Check in the kernel tree for other drivers doing this.

> +       drvdata->chip =3D template_chip;
> +       drvdata->chip.ngpio =3D 80;

If you're always assigning 80 to this you can just put that in the
template as well.

Other than that I think it looks good!

Yours,
Linus Walleij
