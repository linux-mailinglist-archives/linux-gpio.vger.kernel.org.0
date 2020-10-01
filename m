Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CE3F27FA47
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Oct 2020 09:27:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730967AbgJAH1z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Oct 2020 03:27:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730884AbgJAH1z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Oct 2020 03:27:55 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0D89C0613D0
        for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2020 00:27:53 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id 33so4180711edq.13
        for <linux-gpio@vger.kernel.org>; Thu, 01 Oct 2020 00:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SBQ9IeTLPkWfRsR4qVa997N8yuAfCpYNYOadfz/WX7A=;
        b=w9Xor5+SAJDwz5i44Dc5A41i5KWVP4yHkTWmTdUcce6MWXcPByPP92fhrBE0Adqww1
         34Chb2SP06Zjq92x5vvJ1ReN/fUsPsDlU2rH12g1dPQGFBTEsfmgXmuXIAdlu5gfYcKn
         xnbQBsv9jTYwSCcObRHu6Vf2t6nS1IrS5qxCHY0GkBv17986DXWXYKIG+jKpmHqCP2Oq
         rTWNqYbJubMQ0hROSXO0BMW+6e2V6F/YhariAhhKjigTuXDWdWsQGYMMAgbCr3ThzJlw
         tw82F6nNsL4zMl551U3DSvrzryNpPN2borqxP2QDOnU4NFsdj6HvXo3Pm3Es+/hLQcTB
         L0ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SBQ9IeTLPkWfRsR4qVa997N8yuAfCpYNYOadfz/WX7A=;
        b=tSSo1TCajPjWGU9k8Pef6Uue4tnVLoA85dhKmHnRCa5/Fb5BxaMRznrEIbAev5v1Y1
         IjwmRIPlhLb2juhlCqs4Lcyw/V0eN4HshViRMF4KgUOXVYAdRo7x1d5+l/2BhA+kua5c
         /GAyRqgoq0uZ9kOy4hQ+jd5dTM/g7WGLhvH8Z1uetEQM/uNatUQmDadBEDp4gBJ/6Qsc
         jM43YwpWAU0XCTWxt0+HeqWfE/CD0nDpLALZtZFmgeDPNyGPS+6ZixZUaetMYsEadpA7
         e+aIoQrdQ5ifsr09fJ7mc4TPeQKEhTZqdvqaKXq9R2yDI3zQ6QruGtPcHz/JzXGa2rbH
         +VNw==
X-Gm-Message-State: AOAM530bEeG5e72UppevJ7V5T3+QPMjaSQ/qZogB5zUC+hyWpZZd7yDs
        ypy8MFUY8EZsoLgpocPL/3BLmIloZhobTxVPn4oOTw==
X-Google-Smtp-Source: ABdhPJwP1RdRb9fcqEkbJCQLLa8PiiEsF/jncDVSfq9ZIHlVYzbYgLTjjoxJCN9KSnAQBdVh2UZg6YgwS40geDro20U=
X-Received: by 2002:a50:e442:: with SMTP id e2mr6968896edm.186.1601537272511;
 Thu, 01 Oct 2020 00:27:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200930142013.59247-1-andriy.shevchenko@linux.intel.com> <20200930142013.59247-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200930142013.59247-2-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 1 Oct 2020 09:27:41 +0200
Message-ID: <CAMpxmJXRJxDsKeD10VdpWLgYBYnTPH-7vxpG8YaVpnc0a=J+aQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] gpio: pca953x: Correctly initialize registers 6
 and 7 for PCA957x
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 30, 2020 at 4:20 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> When driver has been converted to the bitmap API the non-bitmap functions
> started behaving differently on 32-bit BE architectures since the bytes in
> two consequent unsigned longs are in different order in comparison to byte
> array. Hence if the chip had had more than 32 lines the memset() call over
> it would have not set up upper lines correctly.
> Although it's currently a theoretical case (no supported chips of this type
> has 32+ lines), it's better to provide a clean code to avoid people thinking
> this is okay and potentially producing not fully working things.
>
> Fixes: 35d13d94893f ("gpio: pca953x: convert to use bitmap API")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpio-pca953x.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index 3f24cfabb1d7..6263a4d55f8b 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -942,6 +942,7 @@ static int device_pca95xx_init(struct pca953x_chip *chip, u32 invert)
>  static int device_pca957x_init(struct pca953x_chip *chip, u32 invert)
>  {
>         DECLARE_BITMAP(val, MAX_LINE);
> +       unsigned int i;
>         int ret;
>
>         ret = device_pca95xx_init(chip, invert);
> @@ -949,7 +950,9 @@ static int device_pca957x_init(struct pca953x_chip *chip, u32 invert)
>                 goto out;
>
>         /* To enable register 6, 7 to control pull up and pull down */
> -       memset(val, 0x02, NBANK(chip));
> +       for (i = 0; i < NBANK(chip); i++)
> +               bitmap_set_value8(val, 0x02, i * BANK_SZ);
> +
>         ret = pca953x_write_regs(chip, PCA957X_BKEN, val);
>         if (ret)
>                 goto out;
> --
> 2.28.0
>

Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
