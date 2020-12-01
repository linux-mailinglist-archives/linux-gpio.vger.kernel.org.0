Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35A7D2CA649
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Dec 2020 15:53:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391723AbgLAOtx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Dec 2020 09:49:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389488AbgLAOtw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Dec 2020 09:49:52 -0500
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80E2FC0613CF
        for <linux-gpio@vger.kernel.org>; Tue,  1 Dec 2020 06:49:06 -0800 (PST)
Received: by mail-ej1-x644.google.com with SMTP id jx16so4602927ejb.10
        for <linux-gpio@vger.kernel.org>; Tue, 01 Dec 2020 06:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lQmiVxJd+Kl2UDX74aE8ZcT26AtGS/wklDJV5DWlb3M=;
        b=jwAPYMuzH8oNFpb2B3klwVMdsmIjlpPrDfYD0OKHi+ansmJ1xkPwf6DfJacdvGbEhh
         6WnHZBSNLKx7hcEJ2IPsIojFee9my/FoLbJlkNlz/NbhTV9jhkQn8ME8J7cdaryRPbo8
         lVhF5Ij3hgCndTWby3BXtKNErZ9FUeF2dUMjr7NkjYJHyTGXtXou+nSO17xVSXHUawJz
         8/bOnngSJaErW3NxFTeBTklslB6aQJ0/vTHSJRfjmDuGPnLEFkSvpufW90liCaX/o4QK
         2nbG3vny/XyoEpAtuaTbCZeWeZwxVQS0F+fr8h56vGWhO1g473rDd0lc0sFTO3XPtqru
         sIcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lQmiVxJd+Kl2UDX74aE8ZcT26AtGS/wklDJV5DWlb3M=;
        b=OsGjRKAYg+JUK00mJYO02OU6lgl2qZ06BOcfWSCPd/9MB36NvSAyu+d3LXLgiaVMa1
         2mALefeDkWFMxfrM3HAAdyafQP+wjvhARpBbY5bnELDeAU1ZkAPsyY1cB2yBmfl/Dv/5
         LE6+is73sZW8JLNODqzgumDqZJSaG1J+lg1W52xnAi6Up0QrchncyPBi6DK4SpMeV3yU
         dGn/h51ngO+0yUPfOuF/z+djulYXLjjEO2/4quvtctaSDwQawXofkadpqzORK0zFDrm3
         77BrOvYpU8D9tFjiHjgiC8PkiMugbOCdqGtyJ8z6KEyzGoEpuPgFGBmcqUTMDUqbdj7W
         YfHA==
X-Gm-Message-State: AOAM531bt0WehLoSEQa+uK0gIts4DPQZqwf7fpAzhJEkU4+bZpIZgm5F
        0+k6sAyeKFSjbiMncgDo8DLKNLgu+xnEo5FDZtgocw==
X-Google-Smtp-Source: ABdhPJx/znI8GH1T3tz02M68wDeFcvy3SeGIIJVLF7bwXNUsXDKYkXpr1p5++qs6ZnNs6bz2c6CH7QTdAPo10EfXcyM=
X-Received: by 2002:a17:906:d8dc:: with SMTP id re28mr3382153ejb.168.1606834145234;
 Tue, 01 Dec 2020 06:49:05 -0800 (PST)
MIME-Version: 1.0
References: <20201119170739.GA22665@embeddedor>
In-Reply-To: <20201119170739.GA22665@embeddedor>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 1 Dec 2020 15:48:54 +0100
Message-ID: <CAMpxmJXhy4wRNZWz0iqfB5=g5-F2cdE_q9hRcPr-zRxg9O-jDw@mail.gmail.com>
Subject: Re: [PATCH][next] gpiolib: acpi: Fix fall-through warnings for Clang
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 19, 2020 at 6:07 PM Gustavo A. R. Silva
<gustavoars@kernel.org> wrote:
>
> In preparation to enable -Wimplicit-fallthrough for Clang, fix a warning
> by explicitly adding a break statement instead of letting the code fall
> through to the next case.
>
> Link: https://github.com/KSPP/linux/issues/115
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>  drivers/gpio/gpiolib-acpi.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
> index 6cc5f91bfe2e..e37a57d0a2f0 100644
> --- a/drivers/gpio/gpiolib-acpi.c
> +++ b/drivers/gpio/gpiolib-acpi.c
> @@ -233,6 +233,7 @@ acpi_gpio_to_gpiod_flags(const struct acpi_resource_gpio *agpio, int polarity)
>                 default:
>                         break;
>                 }
> +               break;
>         default:
>                 break;
>         }
> --
> 2.27.0
>

Applied, thanks!

Bartosz
