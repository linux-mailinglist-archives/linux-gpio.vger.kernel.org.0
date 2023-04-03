Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E033D6D4C5D
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Apr 2023 17:48:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231795AbjDCPsF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Apr 2023 11:48:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232089AbjDCPsD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Apr 2023 11:48:03 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5E763C01
        for <linux-gpio@vger.kernel.org>; Mon,  3 Apr 2023 08:47:23 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id x17so38698819lfu.5
        for <linux-gpio@vger.kernel.org>; Mon, 03 Apr 2023 08:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1680536832;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ITez9sbff9kfUo1n7CMz/b2i8pN9N0fLSRd2pJVvLHU=;
        b=fPXT4iv09e0N9D1pCnc6IQ05dI2ykA4f331iFeWKuhebjJGLtpUYhobueq2YhZXhdG
         PfUc4CDVig0hu7O5T/BT112XShCMgAC9MEeJYYrM5K0e5mQkIBv6Do6NDsjA5NtmLHdb
         jNDLgR16lBWRJOCYltcvZapIi6TEdK95E+bdN3fyTULW+tkVGrNCFFIdLOuUHzAWzGhL
         Kkyc8Jkgz1VGc26hknIvBZwrRfkHJ4gDpmzHtPJK9Lod8+pbdLw4jX49qIHZQw7f/x+3
         7oyuQTT4DXEa7gjcOTbxgOkUCu32yvFsfp5TfIT+atmSTFRd2PSo9H/D1t2AlCnWjK5Z
         KlnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680536832;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ITez9sbff9kfUo1n7CMz/b2i8pN9N0fLSRd2pJVvLHU=;
        b=gKjet8agHMp6d9Cr70Pk7fhPjH2Vjq9P6xyRufRYMQ2FItCLibj5WnGioYqVjdrmDv
         e08WI9alPdRnrufKJtQEqMTOvpPTuYdv990t9vQ5wDQMHOIoncM/42md+gUtbQVTtdYz
         zlNWBumZF+VvYC2LRMRmiK9dGPo8itRia6YLOpSJtCDcehL0VSsinE0xLAkmkCa+AIXG
         +0H+E+Es8JQlEy3C8ke/bf7WoVJp/Uwvtn+vneVy1lb4qVt/jqmt/buafY5OXh589r+z
         22cOcNfubFZG8RslHkDz34eoE4DK1TGlJP5Bh2021Fw4CVK8ldI7YSH0+7Sc3lsuooyO
         bkJQ==
X-Gm-Message-State: AAQBX9fWYerrwHLRbciLA3pd+ayp1y5PS7FnmMHsQQ9FB6/GAzcY4/iQ
        byqiURjOLkhuPcbUAveZkjbupOD6g+WkkcAAEiZT3hbdxXP8MPg+
X-Google-Smtp-Source: AKy350b7cJd5gdOTqGxYH3+f4FeApi+99Mm00XX7bR+XvStkbPQXAGuqknJPbDVuT+LAV9imjMjLrj1Z+3EjESuuSfk=
X-Received: by 2002:a05:6512:15b:b0:4ea:fa77:e436 with SMTP id
 m27-20020a056512015b00b004eafa77e436mr10685851lfo.6.1680536832590; Mon, 03
 Apr 2023 08:47:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230321135332.73190-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230321135332.73190-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 3 Apr 2023 17:47:01 +0200
Message-ID: <CAMRc=Mf0ORiDRoWb4pSnopG0Morfe03tNxYhp5Tq8LrZSaN8SA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] gpiolib: Move gpiochip_get_data() upper in the code
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
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

On Tue, Mar 21, 2023 at 2:52=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Move gpiochip_get_data() upper in the code as a preparation
> for further refactoring.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpiolib.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 62114d69bcea..2bfc474d99c3 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -681,6 +681,19 @@ static void gpiochip_setup_devs(void)
>         }
>  }
>
> +/**
> + * gpiochip_get_data() - get per-subdriver data for the chip
> + * @gc: GPIO chip
> + *
> + * Returns:
> + * The per-subdriver data for the chip.
> + */
> +void *gpiochip_get_data(struct gpio_chip *gc)
> +{
> +       return gc->gpiodev->data;
> +}
> +EXPORT_SYMBOL_GPL(gpiochip_get_data);
> +
>  int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
>                                struct lock_class_key *lock_key,
>                                struct lock_class_key *request_key)
> @@ -939,19 +952,6 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc,=
 void *data,
>  }
>  EXPORT_SYMBOL_GPL(gpiochip_add_data_with_key);
>
> -/**
> - * gpiochip_get_data() - get per-subdriver data for the chip
> - * @gc: GPIO chip
> - *
> - * Returns:
> - * The per-subdriver data for the chip.
> - */
> -void *gpiochip_get_data(struct gpio_chip *gc)
> -{
> -       return gc->gpiodev->data;
> -}
> -EXPORT_SYMBOL_GPL(gpiochip_get_data);
> -
>  /**
>   * gpiochip_remove() - unregister a gpio_chip
>   * @gc: the chip to unregister
> --
> 2.40.0.1.gaa8946217a0b
>

Both applied, thanks!

Bart
