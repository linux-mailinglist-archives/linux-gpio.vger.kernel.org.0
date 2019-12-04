Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E053B112FFB
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2019 17:26:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728625AbfLDQ0A (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Dec 2019 11:26:00 -0500
Received: from mail-qt1-f195.google.com ([209.85.160.195]:44553 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728241AbfLDQ0A (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Dec 2019 11:26:00 -0500
Received: by mail-qt1-f195.google.com with SMTP id b5so279782qtt.11;
        Wed, 04 Dec 2019 08:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZFnRl1M+3WZ6LW4gMtGw8cbzamYZBPRdGuknnpt+jUE=;
        b=LLg+rqBtETDVi7Nu0ISMT5dU4SMoL5BHxGrCV1HZKqqus7B7A/yowYM8VQ/RYllKVx
         jTKTG8n1ri+0rpVsSXnJmCp/14F/buQuDWN5jUt8/iGfi6bXzZ5HHvkDpHgJS3sqwqC2
         LiHz4TSxQNsxZArJWgItaOjxRIBCanx6suhsQciJJwj8nFKtHHkPZi7yygVzAS+2tQTf
         xcXt1M7FksQoYq4+HLqsEMUbvujP8KIer46FSua0PC4be+2heUUDb9qgIG4wd1Q4gi98
         yihTS0bXeC/2yY6KeZL/0uTBv6+BLVLpy/hZ8Ty3b4sCk78gigBWmibRSJizbTOqm2Ko
         9uZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZFnRl1M+3WZ6LW4gMtGw8cbzamYZBPRdGuknnpt+jUE=;
        b=O9WRvg7Sj4/283hO9zgeRYaZSx7q9RIQ7fGADdY88xtIyjkK5PfxS+4m819m91WHHk
         IMrFwJF5sXTBtCLenoxVp5wcNVK3MSjzxWB0UDiFwmA5MxUiboZBDg2URvRQAx2VPwxT
         JZ9D2288UZb/PbPoy213zoHMy3oQtQLGh8L+0Y93oCQU9eh6J3AnCxpWf+R8/sY0AhpB
         kZHl3Smbys0i8p+tn5DxLZR90AUsVm517M8GPJMWO5H9ODb1NPInsoV1oDMTW5P23op2
         8aBE68qxxgj4vfEBRSYIMn1seUXhgO46BdNopJYukutuUQCrxJ/fu0N3huBP8P1TfgO1
         6x5w==
X-Gm-Message-State: APjAAAWsZTzmr70xYC4VX9SW+Db008fLU/bh8yxpI1kMDR1nAIvtaEd1
        CZk1F72am++qeDTykr+cXQK1jOBjIZ4doNeHuDo=
X-Google-Smtp-Source: APXvYqycZzn97T0QGbhBo43k5Ed2I27wv5ScfS/Eev1tldrRsA8azyQUWSRFpBX8XdvdTz4ESCvDJwD1kyVg/LKZbYI=
X-Received: by 2002:ac8:5244:: with SMTP id y4mr3428446qtn.87.1575476759052;
 Wed, 04 Dec 2019 08:25:59 -0800 (PST)
MIME-Version: 1.0
References: <20191204155912.17590-1-brgl@bgdev.pl> <20191204155912.17590-7-brgl@bgdev.pl>
In-Reply-To: <20191204155912.17590-7-brgl@bgdev.pl>
From:   Rainer Sickinger <rainersickinger.official@gmail.com>
Date:   Wed, 4 Dec 2019 17:25:47 +0100
Message-ID: <CAD9cdQ5_P1VdRXz2Jz1=ir1FHoBMgjb5u4MKZ4k2oVNK43q_uQ@mail.gmail.com>
Subject: Re: [PATCH v2 06/11] gpiolib: use gpiochip_get_desc() in gpio_ioctl()
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

GREAT WORK

Am Mi., 4. Dez. 2019 um 17:04 Uhr schrieb Bartosz Golaszewski <brgl@bgdev.pl>:
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Unduplicate the offset check by simply calling gpiochip_get_desc() and
> checking its return value.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  drivers/gpio/gpiolib.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 17796437d7be..b7043946c029 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1175,10 +1175,11 @@ static long gpio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>
>                 if (copy_from_user(&lineinfo, ip, sizeof(lineinfo)))
>                         return -EFAULT;
> -               if (lineinfo.line_offset >= gdev->ngpio)
> -                       return -EINVAL;
>
> -               desc = &gdev->descs[lineinfo.line_offset];
> +               desc = gpiochip_get_desc(chip, lineinfo.line_offset);
> +               if (IS_ERR(desc))
> +                       return PTR_ERR(desc);
> +
>                 if (desc->name) {
>                         strncpy(lineinfo.name, desc->name,
>                                 sizeof(lineinfo.name));
> --
> 2.23.0
>
