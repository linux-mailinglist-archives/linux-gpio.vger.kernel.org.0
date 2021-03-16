Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50CC333D0B2
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Mar 2021 10:24:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236046AbhCPJXb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Mar 2021 05:23:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236062AbhCPJXD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Mar 2021 05:23:03 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C57CEC061756
        for <linux-gpio@vger.kernel.org>; Tue, 16 Mar 2021 02:23:02 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id ox4so55286354ejb.11
        for <linux-gpio@vger.kernel.org>; Tue, 16 Mar 2021 02:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/IXhW1O63bmJ8Yd0S7dPhigetZgdpUG2XeBEZKEoOTk=;
        b=UBceE/SRPgNInEgr1e11s95rOpMzM2O0jAasYVdA1+zDUwLsSJJV5qTVQb3ZGitrtc
         i2014J51k8OMFvFsEQkmZZ67kycqGpkDu/6F2hLbyjgSXYi3cFNGbX/A1ByyWM7+ZpoM
         ++SdsHTuNUfognYkuXKo6pnAMCuTgr27vUVLVgycxx5Jf4DD9iJAljX0wlmIjl8jtIif
         2vlpovJcZq1i1wBQicpzin7jnUN9aQ+rX0RPRlgq9KnUD6oxljr8TxV8Tuwi05F4p32d
         nmqZ01mh1diT89Qx8Bvu3F4LMWZhwdRFbv8qXzefgPkH/z8rR5p7Kr29kB1XkgOLFa4z
         ozaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/IXhW1O63bmJ8Yd0S7dPhigetZgdpUG2XeBEZKEoOTk=;
        b=YYu6yl9vZc2AY4Bd46yUj/pqHRwR9+zROrOYP2d8lSL85fX0jYgPBdriXv8iRuFzv8
         PSL7HvKtCyaVkEiMs+IEGcx4lG/oXots1fVexAE4t8ie6TGkkBVzIey0/Y67Xtej7HNI
         gNhOosbjJlHEIFHd1FV+s5yQkvj/71PQqnIsqjjrb/s5MUMklEJcZfWVQ+zzelE1As6E
         11NEVvFwp7ZBTGvCrZWp0xwpmFeOzTb0of9C9PIwb6HjNmqwSqshMa3r7b5U/NJByDH+
         N2huikww26WS1gNZ1Rw3qUqEyPkBWmH50Cjvp/giwmvXM1Dr5IevNg5Rlj4mLoH4uoHH
         08Hg==
X-Gm-Message-State: AOAM531Z2nD/ynMNj6rQQIqzidwsA9zAS5D7WtQCgSi6F0nKrRheglJg
        a7QrCUPOLjmDljAYWp1MoBKaexl4vcb1vIG1fmTDUw==
X-Google-Smtp-Source: ABdhPJx58TefNTCARrYlDvqMTau3fnzMU3RG+L1/JXTagjaemGGfsmD89Dj1Lvs3d9ajASHalOeUuGNkYfcWyI9ZhOo=
X-Received: by 2002:a17:906:c0c8:: with SMTP id bn8mr28225514ejb.445.1615886581573;
 Tue, 16 Mar 2021 02:23:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210315185141.18013-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210315185141.18013-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 16 Mar 2021 10:22:50 +0100
Message-ID: <CAMpxmJWtuH6JAQxbkqeAJeR99A8N4+RJF=AABK7HfrJ19WJMqA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: mockup: Drop duplicate NULL check in gpio_mockup_unregister_pdevs()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Bamvor Jian Zhang <bamv2005@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 15, 2021 at 7:51 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Since platform_device_unregister() is NULL-aware, we don't need to duplicate
> this check. Remove it and fold the rest of the code.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpio-mockup.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
> index 28b757d34046..d7e73876a3b9 100644
> --- a/drivers/gpio/gpio-mockup.c
> +++ b/drivers/gpio/gpio-mockup.c
> @@ -479,15 +479,10 @@ static struct platform_device *gpio_mockup_pdevs[GPIO_MOCKUP_MAX_GC];
>
>  static void gpio_mockup_unregister_pdevs(void)
>  {
> -       struct platform_device *pdev;
>         int i;
>
> -       for (i = 0; i < GPIO_MOCKUP_MAX_GC; i++) {
> -               pdev = gpio_mockup_pdevs[i];
> -
> -               if (pdev)
> -                       platform_device_unregister(pdev);
> -       }
> +       for (i = 0; i < GPIO_MOCKUP_MAX_GC; i++)
> +               platform_device_unregister(gpio_mockup_pdevs[i]);
>  }
>
>  static __init char **gpio_mockup_make_line_names(const char *label,
> --
> 2.30.2
>

Applied, thanks!

Bartosz
