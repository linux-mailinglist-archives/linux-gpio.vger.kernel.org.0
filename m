Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8881E76EB21
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Aug 2023 15:49:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235018AbjHCNtZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Aug 2023 09:49:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235772AbjHCNtF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Aug 2023 09:49:05 -0400
Received: from mail-vk1-xa35.google.com (mail-vk1-xa35.google.com [IPv6:2607:f8b0:4864:20::a35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0EE61AB
        for <linux-gpio@vger.kernel.org>; Thu,  3 Aug 2023 06:48:58 -0700 (PDT)
Received: by mail-vk1-xa35.google.com with SMTP id 71dfb90a1353d-4863f6ffed5so374748e0c.0
        for <linux-gpio@vger.kernel.org>; Thu, 03 Aug 2023 06:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1691070538; x=1691675338;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WhTN1FJNB/SD3+BVN6a75lgF11BWH38k2RxRQK3kOBQ=;
        b=xEAUikYyf4lzH6druJ6296yLFdFuKidFz32ahUmU4LqtVAEps+N0H5JNiLsDJRUNG3
         x5XRZQ3pG0fUsAkQCLcyzpZaZIH+b5OIPkhK3HfZfAUIijXbUkQG8JCGRlnPWyCYIMlJ
         kArhK/GyHlpHJTxJT1HBVGTs923AZ0uaplqViNm5Wr5jnQqmBBIXceLHpvCxJ+wi4Jnz
         BhS97FPZQGZTFdijYk4GBd7KwCCQ8FnZyW9b3vyZGsfko3kWoN0R0E9NKTdB2sl58p8+
         piQPKHTR1C6g+DmT2XMxV13FlA54jt7i8jHOimBbyVax7+mJGGZW549Xtyqs7PWwMnyc
         LrMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691070538; x=1691675338;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WhTN1FJNB/SD3+BVN6a75lgF11BWH38k2RxRQK3kOBQ=;
        b=RJ6/XIndD+kGhHgiAu+lVqHG5CEt+46oCcKrN7egK7iF12bBBSYSGhG1sPVvGy7fjp
         HtlJhsZjrxS3HuBCRnxk8N/bazcWSSUCzve/iwZk41kTf4V5UDpItIdQTqbVjo9NGm3q
         s5NjFaea8sh2CCO1ETGenJk5XKlfc/Es6pYT8zVr64vLmHY7xhMIGKD36yKemstkhjX9
         FTwxXN6w0Obbb2U+pL2fKhSHpPdbI+o3VS9Tmyh2Y8rrohAKzAvh+woMvxhuzhp8HbTA
         wg9blJ1eP+z2QrM7wea00L8UqZogLlfBpaidCy508r+x40pAA9IG8UpNi3wiUF/qwTJC
         HymQ==
X-Gm-Message-State: AOJu0YxCDnDDcD6HvPb9EAeaOzrUzn5OUkjziSXoDSmqmOot+JAaeCGi
        1lax9Ae747bOAkOtAEW4wMrABJlg1/9mSKsHolwV3g==
X-Google-Smtp-Source: AGHT+IF17ojjjAkrHPWuyn/w6x6OUg4MbwyyLo3wBnDyPa0Uw726X68GrqpDh5d0c1EcbDolMT4OK5XqV7K5FeR0FlI=
X-Received: by 2002:a1f:5f0c:0:b0:487:1586:4c29 with SMTP id
 t12-20020a1f5f0c000000b0048715864c29mr552270vkb.1.1691070537978; Thu, 03 Aug
 2023 06:48:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230801203839.9502-1-aboutphysycs@gmail.com>
In-Reply-To: <20230801203839.9502-1-aboutphysycs@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 3 Aug 2023 15:48:47 +0200
Message-ID: <CAMRc=MfCqNSNyKspKFPQNTC9BTFgcZ4kuRJcsxJSCf8CmqeVrg@mail.gmail.com>
Subject: Re: [PATCH] gpio: tqmx86: remove unneeded call to platform_set_drvdata()
To:     Andrei Coardos <aboutphysycs@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        andy@kernel.org, linus.walleij@linaro.org,
        Alexandru Ardelean <alex@shruggie.ro>
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

On Tue, Aug 1, 2023 at 10:43=E2=80=AFPM Andrei Coardos <aboutphysycs@gmail.=
com> wrote:
>
> This function call was found to be unnecessary as there is no equivalent
> platform_get_drvdata() call to access the private data of the driver. Als=
o,
> the private data is defined in this driver, so there is no risk of it bei=
ng
> accessed outside of this driver file.
>
> Reviewed-by: Alexandru Ardelean <alex@shruggie.ro>
> Signed-off-by: Andrei Coardos <aboutphysycs@gmail.com>
> ---
>  drivers/gpio/gpio-tqmx86.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-tqmx86.c b/drivers/gpio/gpio-tqmx86.c
> index 6f8bd1155db7..3a28c1f273c3 100644
> --- a/drivers/gpio/gpio-tqmx86.c
> +++ b/drivers/gpio/gpio-tqmx86.c
> @@ -277,8 +277,6 @@ static int tqmx86_gpio_probe(struct platform_device *=
pdev)
>
>         tqmx86_gpio_write(gpio, (u8)~TQMX86_DIR_INPUT_MASK, TQMX86_GPIODD=
);
>
> -       platform_set_drvdata(pdev, gpio);
> -
>         chip =3D &gpio->chip;
>         chip->label =3D "gpio-tqmx86";
>         chip->owner =3D THIS_MODULE;
> --
> 2.34.1
>

Applied, thanks!

Bart
