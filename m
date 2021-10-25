Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E279B4390EA
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Oct 2021 10:12:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230004AbhJYIOj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Oct 2021 04:14:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbhJYIOj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Oct 2021 04:14:39 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3837CC061745
        for <linux-gpio@vger.kernel.org>; Mon, 25 Oct 2021 01:12:17 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id g10so14902112edj.1
        for <linux-gpio@vger.kernel.org>; Mon, 25 Oct 2021 01:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LtwSmhqhXjmoMHSzOUjTGEfn/yMXZLJX6+wx+6VkxoU=;
        b=K1zt8XdHps47DPdDUxVj+S6sW1Bc2pfseoY9aJyaFk5+kGJYMO+uEjUZoDHW/GAeTV
         0gUdZ6+27TUadNeL+O0F1ItliCJxaDZhp/u+2PyVKJb3yctIki5yvutGMMwVuKG8S09m
         zz1kzd7dgB9YTZN8AufTLEvlRMPdI5fRXCvJaqgYwrKOtcv3bmp6AFAFV+6dOulX8+Yw
         u6NdtrZmGOXUP99dtRp55NY+xuGB54Rv6b8pTA5iX7AVKjw4r6M7BePcIA59zAaprBPJ
         qYql1iStvDADOmX6ElZKy86hh3dpNxulf/SUgJgUa9Q90mOfp9wwMhH1ysHpw1dGYcOq
         +O1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LtwSmhqhXjmoMHSzOUjTGEfn/yMXZLJX6+wx+6VkxoU=;
        b=rxfsh/vWAHkFZ5XnbMPiRcUiwb6Ib8G4gFM0d9nasEikYWCgynPFUz2SWRaYxxWTfr
         DqPhh6/PwmFTrO7qcMOeCvAnub/gkeuWudK5ty30eUKTO9UKV3aeV7xbw4/uaOScVZKK
         tJTwnxk+jTZev/ETnEMTUlOj++Bq3Ar8HToI1HrakpCazHPz98ctHC0TSyOrQiVBKOAb
         Dn9y5Eb6rmfCZJGklDJvNbPHb/6/BUCzl4xJMAINdhenuQZls0R58I48S1QnCxIS+oCZ
         2l34UhkBs16lemIi/MyMONyKp6WH2Pg6WeQiWpOvm1M5k5rn0guDOGx5zGJC9LNcP63k
         rCTg==
X-Gm-Message-State: AOAM531Pe4WLiSnzasGIZtD0s8IEFYIAJ+rVA9nKuDGSMq9l6XkkxKi2
        Z+tMF9Y91oETbwjcqNmBWnTecKWeyOpwJsgukM3d3Q==
X-Google-Smtp-Source: ABdhPJwmlR1Z5l4NzNzHb/46T8qPw6cZBvSl7EOjVJPrnmqnfb28TG51I3V6F5sWgQuu/3bXBogbvd34ypne3Ks33w8=
X-Received: by 2002:a50:d50c:: with SMTP id u12mr24527431edi.118.1635149535712;
 Mon, 25 Oct 2021 01:12:15 -0700 (PDT)
MIME-Version: 1.0
References: <20211014123342.174711-1-jonas.gorski@gmail.com>
In-Reply-To: <20211014123342.174711-1-jonas.gorski@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 25 Oct 2021 10:12:05 +0200
Message-ID: <CAMRc=Mfa0LaCHdop97BzAazo209Sy-twrzQkFMbh51ZGs+H_kw@mail.gmail.com>
Subject: Re: [PATCH] gpio: xgs-iproc: fix parsing of ngpios property
To:     Jonas Gorski <jonas.gorski@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 14, 2021 at 2:33 PM Jonas Gorski <jonas.gorski@gmail.com> wrote:
>
> of_property_read_u32 returns 0 on success, not true, so we need to
> invert the check to actually take over the provided ngpio value.
>
> Fixes: 6a41b6c5fc20 ("gpio: Add xgs-iproc driver")
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
> ---
> This is based on
> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git,
> which is the tree for GPIO according to MAINTAINERS, but hasn't been
> updated since ~5.11 - is this still the correct tree?
>
> It doesn't matter much for this patch though, the driver is virtually
> untouched since then.
>
>  drivers/gpio/gpio-xgs-iproc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-xgs-iproc.c b/drivers/gpio/gpio-xgs-iproc.c
> index ad5489a65d54..dd40277b9d06 100644
> --- a/drivers/gpio/gpio-xgs-iproc.c
> +++ b/drivers/gpio/gpio-xgs-iproc.c
> @@ -224,7 +224,7 @@ static int iproc_gpio_probe(struct platform_device *pdev)
>         }
>
>         chip->gc.label = dev_name(dev);
> -       if (of_property_read_u32(dn, "ngpios", &num_gpios))
> +       if (!of_property_read_u32(dn, "ngpios", &num_gpios))
>                 chip->gc.ngpio = num_gpios;
>
>         irq = platform_get_irq(pdev, 0);
> --
> 2.33.0
>

Queued for fixes.

Bart
