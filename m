Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 414DA3B055C
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Jun 2021 14:58:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231935AbhFVNAh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Jun 2021 09:00:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231929AbhFVNAg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Jun 2021 09:00:36 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6D83C061574
        for <linux-gpio@vger.kernel.org>; Tue, 22 Jun 2021 05:58:20 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id bl4so3244572qkb.8
        for <linux-gpio@vger.kernel.org>; Tue, 22 Jun 2021 05:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GPMJ7jSPsSgfZu9fsWBGR7AuJx5P3MXBzok2lRj/beI=;
        b=GwNcUe/ni3xnAS/V+LCzTNpegjnNbiTihu57cO2UvDcAWU+08/MjnBXhzb1vxaIKab
         oS6O6Dk6DOStojV5oRizHE9nrs7zaqtdN4o5mvg8VXVCTSi40Tpl5/Kz+EX3Du9OLWD7
         5/lh7/ZXw2wdsiT6TzeN9kd+IzXME6Xeb0+kj/Y1D1SRRZLCuf9u5KNgKM8BLkbZqnfr
         KZhYYTHmeTV+spVvkMNBUSayW1+M7DI4ePaQylv/jc91JNimyBQGZYLwqHHKjvpH0u7D
         G1Zfy6dpjeaR2eDIWJlgp6ekivcUACTUium44NjulP+Ai8p+DKJ5FaFgbXbvXQGYtovr
         GRcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GPMJ7jSPsSgfZu9fsWBGR7AuJx5P3MXBzok2lRj/beI=;
        b=lNBrcqsecnN4la0hORriSERW3PGgIShJugbIHVWw58bhQs0ar8EsgNXiEOZHfnXGAo
         8jxsLGcMC9Q1hXytTHFfmWHE1NGc+LvEQY0kYmw88k5xqJoFArD+bU55Dbl5tJkrC2Xx
         K8sCy9VPCK4ph3itxC8djfhv+TdktUFTZAIJco9qoQq90B9olWJ16nTPwftoAMO5fdg5
         N755LZSyNSSVP55LItUoMTYBYVUJj6pbVwbzXlFLdwIlufi15e7S8iX1S8VoRxeGkkbH
         +g0ATJHmMELYoeOsJlIta8Bt7vaj7UWn7kNmY8in5DYyzXhuBGRSf5gwJCzplFWurfri
         dngg==
X-Gm-Message-State: AOAM532+xE0RZhRtYhIxVpx+NPArit6XevB/9YDPZrPgP/SJFBNrMPG5
        UZO9VmMLThMsH2vAHxPL5KNj9LS7LIX7jHrSfkMzpg==
X-Google-Smtp-Source: ABdhPJxDjfdrw3kd4YH3cIuyfv+9MpioluKHlz69hSxeGpPXElsB1OijXssM2QKYfgvvVMslEJRVsnFw+a4QtRmudxk=
X-Received: by 2002:a25:cf15:: with SMTP id f21mr4591262ybg.366.1624366700021;
 Tue, 22 Jun 2021 05:58:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210615145903.634565-1-linus.walleij@linaro.org>
In-Reply-To: <20210615145903.634565-1-linus.walleij@linaro.org>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 22 Jun 2021 14:58:09 +0200
Message-ID: <CAMpxmJXqGgPiXqR1kq+nts-=HBkxSP_7Cqzn=N5-EmKWADh0CQ@mail.gmail.com>
Subject: Re: [PATCH 1/3 v5] gpio: pcf857x: Name instance after dev_name()
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        Sekhar Nori <nsekhar@ti.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 15, 2021 at 5:01 PM Linus Walleij <linus.walleij@linaro.org> wrote:
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

This makes sense but the i2c names are often not very descriptive. How
about adding a DEVID_AUTO/DEVID_NONE like mechanism to GPIO labels?
Nvmem has a thing like that precisely because labels can repeat.

Bart
