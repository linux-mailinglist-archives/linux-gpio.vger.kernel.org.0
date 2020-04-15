Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72A3A1A9C1B
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2020 13:24:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2896925AbgDOLYO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Apr 2020 07:24:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2896897AbgDOLYF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Apr 2020 07:24:05 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3D6EC061A0E
        for <linux-gpio@vger.kernel.org>; Wed, 15 Apr 2020 04:24:03 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id w29so12431459qtv.3
        for <linux-gpio@vger.kernel.org>; Wed, 15 Apr 2020 04:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=wOmETXgpnR0UiiTfkrMXsqOFBsXGlBK6YD0CLMuo+FM=;
        b=TiFg00+LOB+J3ECZHXf1hg6toq17QIQNzCBw5JV2NofPJ4885HzqlLS011N8RRjqry
         JHrm5gPSFF43Kf55r43lWDgtWNHGhz9ongDMeQzmAitEb5B50AVgeeJwZveyL8rTyHH8
         GHmnSqOgREGSdTq1E+fj8JqySTyiyxhUvKuxDn5T0sBne4FdayoiEvawk3KmttWfTNq6
         CxxY5tgKjqBw/x2S6ihccX8mwsEheruVwN57zisJ+krwhxnKKLnECu/MHxFf9r8D4iAB
         RXpEAa5k7KSEyE4W4CnbwLmkccYFkHGzGgNa2FY9e6UCHHBwqve49mz1yGxapotc1APH
         3YpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wOmETXgpnR0UiiTfkrMXsqOFBsXGlBK6YD0CLMuo+FM=;
        b=iLcsgRHcQL4OrXjm8XDo+0wkbmPdTbK2/IfLIqaBH7T0LZ+Ah480Ounh6RszO6Z9lK
         UejRheVAVU1gtYMl4YHMQLytmBHxx5VsMOrKBaM/fhxiIjd16CD3s7sFCBr10e7AjqWk
         escNnZ40LpNwz+lGglfRuim2I+Fp9oVrAS39aV5FbBeH02/gzbebAGlQh/d91ahFsk5J
         viRPrrErxCLkzMbjZxfSkaOpwqqXnodl0d8RMDApO5lsYZEqfI13+ULZHyI6VXsG8BeB
         tsUdx4Ifao17Xrfx839FcPr5dfoNVZtbcyypEy5gc+zmPO0Yxjz3MXaaQOgsaKmUdAlk
         Bd8Q==
X-Gm-Message-State: AGi0PuZxJ7Q8JsXTM3KJXSCSb2AJ9U+TYy4hN+GFZYYj39XBbpi66iwY
        45bnIryZ3sZFGZtaXhYVFGbg5ugkS/Ce1UxXzTld6Q==
X-Google-Smtp-Source: APiQypKw5qKWyWpvpifJcGdPqJqI988H/LRkhuc2ciFW8lVP5XCznLWbP0ZtwGPp5jnBySczmuJgdev5KDtZyuuRKJo=
X-Received: by 2002:ac8:5209:: with SMTP id r9mr2900056qtn.57.1586949843116;
 Wed, 15 Apr 2020 04:24:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200412013352.674506-1-aford173@gmail.com> <20200412013352.674506-2-aford173@gmail.com>
In-Reply-To: <20200412013352.674506-2-aford173@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 15 Apr 2020 13:23:52 +0200
Message-ID: <CAMpxmJU0sSDPTa-YHTEsYCzX3Vpv5YJAKhOhfhf73_rbL4jYSg@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: pca953x: Fix pca953x_gpio_set_config
To:     Adam Ford <aford173@gmail.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>, aford@beaconembedded.com,
        Linus Walleij <linus.walleij@linaro.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

niedz., 12 kwi 2020 o 03:34 Adam Ford <aford173@gmail.com> napisa=C5=82(a):
>
> pca953x_gpio_set_config is setup to support pull-up/down
> bias.  Currently the driver uses a variable called 'config' to
> determine which options to use.  Unfortunately, this is incorrect.
>
> This patch uses function pinconf_to_config_param(config), which
> converts this 'config' parameter back to pinconfig to determine
> which option to use.
>
> Fixes: 15add06841a3 ("gpio: pca953x: add ->set_config implementation")
>
> Signed-off-by: Adam Ford <aford173@gmail.com>
>
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index 5638b4e5355f..4269ea9a817e 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -531,7 +531,7 @@ static int pca953x_gpio_set_config(struct gpio_chip *=
gc, unsigned int offset,
>  {
>         struct pca953x_chip *chip =3D gpiochip_get_data(gc);
>
> -       switch (config) {
> +       switch (pinconf_to_config_param(config)) {
>         case PIN_CONFIG_BIAS_PULL_UP:
>         case PIN_CONFIG_BIAS_PULL_DOWN:
>                 return pca953x_gpio_set_pull_up_down(chip, offset, config=
);
> --
> 2.25.1
>

Patch applied for fixes, thanks!

Bart
