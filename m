Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85A4D18F214
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2020 10:44:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727769AbgCWJoV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Mar 2020 05:44:21 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:35028 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727757AbgCWJoV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Mar 2020 05:44:21 -0400
Received: by mail-qk1-f195.google.com with SMTP id k13so2794564qki.2
        for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2020 02:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=8rk1s2n0n3WlyUexEwdaMQlRiTTXDsUBqn+ZqCiSJT0=;
        b=2MDiU72HDQPRYZtJ/Nj3Z9lmK6+v4OUTMNRrQvhiZ50GHbwgKPFo/tk3KBqnvG4zku
         fWpJDAcKhvLfAoE1zyHwPTvMYfeDnVZ8yERu7UTtdQhYZjTKl6r2vXy4+3HjOTOtr+75
         zoz9YRJ9IbMk9GBwBCj3+t/V9rswMxd5t+BuW1PonyM/GIR1cDr0EWY4fgqe+LVt0hB9
         qevFLFls95UbFzl6eru45QBA5dFhKvB4AbkAESXtBlCAEnysyZ4Yw1ewFyW6xiFkb/IX
         BYyAU9uFQMU/BurUjV5GSeBqVOVAvwjb6+t/tXp90DWFUo3Ki6mVNdhpw84jt6wS5OjE
         OFUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=8rk1s2n0n3WlyUexEwdaMQlRiTTXDsUBqn+ZqCiSJT0=;
        b=C8TmuA8LanlBHR+6VmogcZVZqkKtSMO+cOEt5w30CapORLpBSRt6WxhId5ckGaqfq6
         r8leKxooGXrgNg4jzgfG2u7PHlPGYEJe8Bl7vD/ZpA9Q6ih8G0QwRgyxzOyOgN7hopV7
         J5zhgCh6AOTri7fHJ769b0j7vyiMjN2/jDuWRdgRRT18wVEP6RtNiUj8LvYmB16cjs/L
         2xPuDCbTQz7Wu81PXWEvLjP3ZIAaoRXjLiCr7+Eq3GUQz6wwQ0VkZQvtxuGbQvkJE/iI
         KlWLm8q/9aKiez/UaBULOAqxCyG7+4Xjs5s0lU0/rxfmTiiIgCe/iPi/qZPPdqP0+x4+
         wVdw==
X-Gm-Message-State: ANhLgQ3w1tcs++UtH4QbIX+gjy/wpuokbyONeMIFT0YrH/rUP2Mmdi5t
        p/zQkG1Rm89IvbWp06sqIJaF96p60k30sbliIf9Km8Wm
X-Google-Smtp-Source: ADFU+vuWIP58Cyj9q7Q7pmhqH70edsbdASTgISo4+iX78+rQgYON8i/I3NHqvy+PGFYxbpk+pfPSJnaiUfI98gQ5l+w=
X-Received: by 2002:a37:7687:: with SMTP id r129mr726304qkc.263.1584956660067;
 Mon, 23 Mar 2020 02:44:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200322100943.GA22132@kbp1-lhp-F54859>
In-Reply-To: <20200322100943.GA22132@kbp1-lhp-F54859>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 23 Mar 2020 10:44:09 +0100
Message-ID: <CAMpxmJWPS_bP1CZqAfFHjtOwTKE48oy2WfPgkkit0qr-eVTF5Q@mail.gmail.com>
Subject: Re: [PATCH] tools: gpio: Fix typo in gpio-utils
To:     Mykyta Poturai <mykyta.poturai@gmail.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

niedz., 22 mar 2020 o 11:10 Mykyta Poturai <mykyta.poturai@gmail.com>
napisa=C5=82(a):
>
> Replace COMSUMER with proper CONSUMER
>
> Signed-off-by: Mykyta Poturai <mykyta.poturai@gmail.com>
> ---
>  tools/gpio/gpio-utils.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/tools/gpio/gpio-utils.c b/tools/gpio/gpio-utils.c
> index 53470de..0600378 100644
> --- a/tools/gpio/gpio-utils.c
> +++ b/tools/gpio/gpio-utils.c
> @@ -17,7 +17,7 @@
>  #include <linux/gpio.h>
>  #include "gpio-utils.h"
>
> -#define COMSUMER "gpio-utils"
> +#define CONSUMER "gpio-utils"
>
>  /**
>   * doc: Operation of gpio
> @@ -209,7 +209,7 @@ int gpiotools_gets(const char *device_name, unsigned =
int *lines,
>
>         ret =3D gpiotools_request_linehandle(device_name, lines, nlines,
>                                            GPIOHANDLE_REQUEST_INPUT, data=
,
> -                                          COMSUMER);
> +                                          CONSUMER);
>         if (ret < 0)
>                 return ret;
>
> @@ -259,7 +259,7 @@ int gpiotools_sets(const char *device_name, unsigned =
int *lines,
>
>         ret =3D gpiotools_request_linehandle(device_name, lines, nlines,
>                                            GPIOHANDLE_REQUEST_OUTPUT, dat=
a,
> -                                          COMSUMER);
> +                                          CONSUMER);
>         if (ret < 0)
>                 return ret;
>
> --
> 2.7.4
>

Patch applied, thanks!

Bartosz
