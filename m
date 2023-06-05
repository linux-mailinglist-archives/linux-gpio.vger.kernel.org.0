Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10C2A7228D2
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Jun 2023 16:31:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233079AbjFEOb1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Jun 2023 10:31:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233137AbjFEOb0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Jun 2023 10:31:26 -0400
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 536A1B0
        for <linux-gpio@vger.kernel.org>; Mon,  5 Jun 2023 07:31:25 -0700 (PDT)
Received: by mail-vs1-xe29.google.com with SMTP id ada2fe7eead31-437e6ffa660so1079838137.1
        for <linux-gpio@vger.kernel.org>; Mon, 05 Jun 2023 07:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685975484; x=1688567484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=61XzS2Z+B6ENO0ZDHhjW5f6afljWvxivDrR1n6HDxUM=;
        b=IqwsmKCrL2ASNsVjBaf7EItte5p++h7NI2YAq10FulCDpBMBEsAfUcxYxs3knGwx6e
         QqEatCmjiKhwewMZHZx5wBCN3TV5sGLJImqxE1wlZPHW1lAAmNsAk4I7oIxZD/t7VSs1
         DlW4px20R1doRK7/jHZTNqLps46YHRryjW7RyK0MoP+ndq2wXpeBXBNfDGINoQR25fC/
         haoAhhVX1TQFIP2++I1wve/xgxUOf5RwOt4S0qRXPCSu13fQ0NUIbOGdXBpGFlgvechH
         OatIld86EYgIPwp2BfpBxhTWeuGmP+njENYVMIyYEJ3s3MuwjzEczevKdT5cUmtDAPnc
         SO3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685975484; x=1688567484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=61XzS2Z+B6ENO0ZDHhjW5f6afljWvxivDrR1n6HDxUM=;
        b=Tvw4Q6Kw6R9+dtwQmn7CQvIIyfQEiCJ2fl8kkfkXPtwTBFHdRoXNdM8SHzAu72DIrF
         73eHsXbqPDEbtNL3GfYfdJ5HpPGsn7wR5OGbY9jEDh546LgtSzi27zKsasUTVSd7kda4
         YLli1jNRBgK4v0ymjA0lxdLOXBJppcv+05S/YVTSN9FgRDfmXeX6ItPa54H1sGvlrwax
         1n68UqFsVk+eFJ8rzbOjai1RnstPeNIv95ZheNGpfMu3WE/8TW1YBVARraj0erQMAjlJ
         bcITDwLbwhyCybHfmaWTWetTUo9hK0FP6WuDF+xs8OTth7UGe8zbHan8bEgl8XMWUoTu
         ym9w==
X-Gm-Message-State: AC+VfDy6S/84Ky+5bDpoSMAN2VpXDjlcaPncyHlUlD+gSNtyX5dYMrvq
        YdUtZXH9bwHnIOrGpCD6tb3J4Iewjo8sKJERDOPVUQ==
X-Google-Smtp-Source: ACHHUZ6valO3uYNx2qRwwGCVj2tp8BzzgWW1Pa4s40MiFVUz7xWX9o+l6D/soVCS9c9gKHt9OcDJHvbKL/ek+Z3qkPM=
X-Received: by 2002:a67:fb9a:0:b0:434:f25c:9a17 with SMTP id
 n26-20020a67fb9a000000b00434f25c9a17mr57432vsr.17.1685975484459; Mon, 05 Jun
 2023 07:31:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230605110200.938902-1-arnd@kernel.org>
In-Reply-To: <20230605110200.938902-1-arnd@kernel.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 5 Jun 2023 16:31:13 +0200
Message-ID: <CAMRc=Md=s+HbRWA6ReZsviYDg5TPzQZ9iETV_TpBTeTXakt4og@mail.gmail.com>
Subject: Re: [PATCH] gpio: delay: add OF_GPIO dependency
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        William Breathitt Gray <william.gray@linaro.org>,
        Pandith N <pandith.n@intel.com>,
        Yinbo Zhu <zhuyinbo@loongson.cn>,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>,
        Davide Ciminaghi <ciminaghi@gnudd.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Mon, Jun 5, 2023 at 1:02=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wrot=
e:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The new driver fails to build when OF_GPIO is disabled:
>
> drivers/gpio/gpio-delay.c: In function 'gpio_delay_of_xlate':
> drivers/gpio/gpio-delay.c:79:39: error: 'struct gpio_chip' has no member =
named 'of_gpio_n_cells'
>
> Fixes: cf5dec80c4e23 ("gpio: Add gpio delay driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpio/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index a1dac1345f60f..006abaedcae82 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1735,6 +1735,7 @@ config GPIO_AGGREGATOR
>
>  config GPIO_DELAY
>         tristate "GPIO delay"
> +       depends on OF_GPIO
>         help
>           Say yes here to enable the GPIO delay, which provides a way to
>           configure platform specific delays for GPIO ramp-up or ramp-dow=
n
> --
> 2.39.2
>

Thanks, Alexander beat you to it.

Bart
