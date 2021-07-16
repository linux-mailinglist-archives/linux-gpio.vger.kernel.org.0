Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D0D13CB3DE
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Jul 2021 10:14:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236777AbhGPIRX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Jul 2021 04:17:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236342AbhGPIRX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Jul 2021 04:17:23 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8375C06175F
        for <linux-gpio@vger.kernel.org>; Fri, 16 Jul 2021 01:14:28 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id t186so13536639ybf.2
        for <linux-gpio@vger.kernel.org>; Fri, 16 Jul 2021 01:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/LTJmXuzBUFzzcssWYYOL1YI3GgpOb+6Dm26cGPPXco=;
        b=lvllShBY36EhoOvyLflbD5SqvOHgXlVRd0BND8GkTXJkU0XDztOrsBdYYXiTmhqSOd
         Ucd3uDXyzfss9cTJeDLQrjV+KVg/tZASDlFHiZYvP3Ryx18Cl8fO14fPpBoWu3IX/lQ2
         536emUH59DeCudBg/WAYvZu7ZJuAvY4Z6I4YjUjyMKKtg5KJMQSc7Hb/Yr9dnTAfR6V+
         miWBK+WZA77U9YjJ0bwdX5ZnPPrk/nQ5h2qWuRXw/P7LFscG0cAuTbLbLN7xOoKjuvBn
         ByiK0ogNfAvpFTXC+tOoIZEEgbMBaHLrvYt6YHQNesOKBrMKwIA7ZUn3fz3S6bF15B2f
         pYpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/LTJmXuzBUFzzcssWYYOL1YI3GgpOb+6Dm26cGPPXco=;
        b=bxRvFJ8UHBkXJ6ElPjctA0UIhBl4gIYbU8OA4Zn7tEWx0ZPloo94UnLJL4Ixr50E0U
         FiJ6/QVJPjQlHTj+LjcCNgPMtdmiSFqBfnAc4mGCPG6SGlG6TP7H/QfrcZ3A/f0YDk13
         g5z90U/dDoRTqoHIZLwD0kBLsJdkxm9+kmip3OU+xdnLZgUPc7faQ6P/VhyL0B5aLHu4
         FAoUx3XFGsVlhq2rkNTKxmYhUshkp2awdjdmlnFL2KI9Lu4mXxFFW/GX/tCDPnEwNiz8
         tFoJF/26Xka4KYf0mmY0SoitMOMjQQPbZyB9Kt92/+JsucbvsSUXpORDpOAXgQ1IR3ZV
         /ipA==
X-Gm-Message-State: AOAM532EgJgHujepDQfGR0wiQxvDaLCo4ToG4nMC3dfohAutatyh15GA
        xlR3LA+LEEowDPEBHDpgVafrH5sUOowAFLoRb8vo9A==
X-Google-Smtp-Source: ABdhPJzoiSlV4UPQgTJnY+HNihGEEyHLw/Ci9EaV/2UUCc0BH7/mPrhygI6wJGknqNifMEX/RADCpvfFm1B0j8OBZzQ=
X-Received: by 2002:a25:1804:: with SMTP id 4mr11086581yby.157.1626423267892;
 Fri, 16 Jul 2021 01:14:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210715191141.430307-1-linus.walleij@linaro.org>
In-Reply-To: <20210715191141.430307-1-linus.walleij@linaro.org>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 16 Jul 2021 10:14:17 +0200
Message-ID: <CAMpxmJUxHL83sK2BB=Q1-RHgi55nW4Z62g8csKD2vtfvyuYxjQ@mail.gmail.com>
Subject: Re: [PATCH 1/3 v6] gpio: pcf857x: Name instance after dev_name()
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Sekhar Nori <nsekhar@ti.com>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 15, 2021 at 9:13 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> Put the label on this gpio_chip from the dev_name() instead of
> the client name.
>
> The client name will be pcf8574 etc for all instances even if
> there are several chips on a system.
>
> This manifests on the DaVinci DM6467 (non-devicetree) which
> will contain 3 different pcf8574 devices that as a result cannot
> be told apart because they are all named "pcf8574", affecting
> the GPIO descriptor tables which need a unique label per chip.
>
> By passing in .dev_name in the struct i2c_board_info we can
> explicitly name each instance and use that to discern the chips
> when using board files.
>
> Cc: Sekhar Nori <nsekhar@ti.com>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v5->v6:
> - Rebase on v5.14-rc1
> ChangeLog ->v5:
> - New patch to deal with the chip label
> ---
>  drivers/gpio/gpio-pcf857x.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-pcf857x.c b/drivers/gpio/gpio-pcf857x.c
> index b7568ee33696..2271ec86e414 100644
> --- a/drivers/gpio/gpio-pcf857x.c
> +++ b/drivers/gpio/gpio-pcf857x.c
> @@ -311,7 +311,7 @@ static int pcf857x_probe(struct i2c_client *client,
>         if (status < 0)
>                 goto fail;
>
> -       gpio->chip.label = client->name;
> +       gpio->chip.label = dev_name(&client->dev);
>
>         gpio->client = client;
>         i2c_set_clientdata(client, gpio);
> --
> 2.31.1
>

Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
