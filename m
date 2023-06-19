Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F12D73571B
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jun 2023 14:44:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229647AbjFSMoQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Jun 2023 08:44:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbjFSMoO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Jun 2023 08:44:14 -0400
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com [IPv6:2607:f8b0:4864:20::92a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE290E70
        for <linux-gpio@vger.kernel.org>; Mon, 19 Jun 2023 05:43:46 -0700 (PDT)
Received: by mail-ua1-x92a.google.com with SMTP id a1e0cc1a2514c-78cdb90aa66so1021944241.3
        for <linux-gpio@vger.kernel.org>; Mon, 19 Jun 2023 05:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687178611; x=1689770611;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TO0+KaIcX1mDL3lougizkSx+E71ioKejbCq345UZmAY=;
        b=rTRrxKQgUdRHf46Q/zRXVw3ISO83K7NzoIXhhuA58IpCaqjEmoCp2d1TKTSX4WeLzA
         K9iD+abhpbOWCIc7VR/3AQvhTISHcKRYzbMA/daVQwbljmEUbDv0B+XQS5W6Ph+btL1C
         x3nYMkyvonGDzRpHqlyGjODuenVSqz0AAzp25K4f+jl82qpKPZgceHHjldj/1S2tV2Sh
         1BPaTUVrdmAIZ/13k4nfyPqHpcGsUrXldoTZJg2vl7GY8Xml3IWC3yrvkjmhaiPZ9Afh
         km83xtp18IBE8LNnnBdKkfnO6pcmcC8uMjaUtvubuvPc5nWCbcR9qXBFb4BFVB3xyJoy
         fjCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687178611; x=1689770611;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TO0+KaIcX1mDL3lougizkSx+E71ioKejbCq345UZmAY=;
        b=Ry2tKIDYoso6uXTAaGMdZcvDmP/16cDejqXiwNGzzEKrS+5EYjkiIMl8mH4iO/nCqz
         zeNoRvwNAzY49TuL93IeoCqCfC5a8+AkPq0h6yAPKSAtCuFEwc9j3MpvPb8lWt0QcNuA
         OANaNhmQerabYEFnFCVetZ6vfXz5Z1djuV5ns8ouoZqVvD3ACSG3hBMoIjh/+9V/DUXw
         pIu9MB1maNesl7vmFIAe+CTnqiaDAMq3MgBsPxAZ77c13HtzwXavykxD/QDhVir5ZsPq
         zMLhAf5AZhStxZSXmZ3atVVJJt5UYZ9YXVX1r3ykAcRLQ8FpqBfKXUe7MEsVA3qRw6QA
         t5iw==
X-Gm-Message-State: AC+VfDxJhQcIrrv+VQXUy3je23Q5bKv4btiX4bx/q2MZc0FkvzFfzgji
        F/C3R2mlIO8srhWclq89JOVZpDa74dUnh3oCOYaTbQ==
X-Google-Smtp-Source: ACHHUZ7HzyXt985XCyJrybc/J8a368/p10qr4hjO7GCPD2aZHB21AFCfJHrIj6ffVRyXGzXQlTUllyy+7+X7hN+n404=
X-Received: by 2002:a67:fbd8:0:b0:440:b25f:5cab with SMTP id
 o24-20020a67fbd8000000b00440b25f5cabmr478257vsr.15.1687178611633; Mon, 19 Jun
 2023 05:43:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230615162514.21195-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230615162514.21195-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 19 Jun 2023 14:43:20 +0200
Message-ID: <CAMRc=MfPwVLnWquVkj9wZA+NtkONO6KgcNeEAa+Z+WGooHe22w@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: mpc8xxx: Remove unused of_gpio.h inclusion
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>
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

On Thu, Jun 15, 2023 at 6:25=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> The of_gpio.h is not and shouldn't be used in the GPIO drivers.
> Remove it.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpio-mpc8xxx.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
> index 3eb08cd1fdc0..35214e9de4ce 100644
> --- a/drivers/gpio/gpio-mpc8xxx.c
> +++ b/drivers/gpio/gpio-mpc8xxx.c
> @@ -12,7 +12,6 @@
>  #include <linux/spinlock.h>
>  #include <linux/io.h>
>  #include <linux/of.h>
> -#include <linux/of_gpio.h>
>  #include <linux/of_address.h>
>  #include <linux/of_irq.h>
>  #include <linux/of_platform.h>
> --
> 2.40.0.1.gaa8946217a0b
>

Applied, thanks!

Bart
