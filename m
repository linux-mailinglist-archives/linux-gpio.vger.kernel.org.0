Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D49B9203D10
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2020 18:50:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729576AbgFVQuw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jun 2020 12:50:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729471AbgFVQuw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Jun 2020 12:50:52 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 636FEC061573
        for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2020 09:50:52 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id j10so4555954qtq.11
        for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2020 09:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=zNIXazRbZTl0hNjJl4OuKyr32sJX5wD3ftLoVFvgmfw=;
        b=qLk5xYU+6MCO8B1j+gRdWtyZBWQWjzYhV/+LazyTuBN5g1R95S/Y4JXHO5PFT8ZCn7
         JBVC18sGz5YktASw5JOAsiib9AkM+m6iT5A7rir1JpUq5Gffrr0H4OZ6Vu5FPPKd4iir
         QiADywIlhy5T+looP4rJGXP8anyX5lM9DwHd67sGHUw2A66URTsv6jGsKSkz+fXV161x
         zWxvKMOevq9Hqg3YPchIIq4nN5xdMsulBk9RZeasoZzsVUE9uZuOGKgg+gw8XW35GQSS
         DRfAMHdz3uCCKolLbdY8nd3XpWdGH1OQ+D/KacLXyB7Fy6JGmIeviFZB7G24Cd4Bo4l9
         LKEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=zNIXazRbZTl0hNjJl4OuKyr32sJX5wD3ftLoVFvgmfw=;
        b=tAaJMLmeAS0hbTt4lARb1GzFMt2SwbWjGFDF2OWlQc47CmYZ/b0xCgVw4VxoRf3HIw
         QqzJOiuzYROG7p4sc8EL3Xs0qiTZ64UialfZq1OpPT8ZzZBPA+S8bBRH98hylNekRUbe
         uFNFj0u0egeyJBA5QOss4PV7iigi/tH4UPeF2PAoc8Q2f02Yb2n9alXulIUwYSCXPyf2
         ZitT1IkeeAbwG5GRiq/4FKYaT7Jpfy7c+D+6OMTG3wwZReCE3pygEZwy46yehHs4oDNQ
         IgnCKCdmHFRnAyILtifU+0S3x6fvNaS/5aMNB0LvO3mxAIeFeqJLcU3u3YaKN/pMjpwL
         EEEg==
X-Gm-Message-State: AOAM532l+odyPTriuqxt6EUNZthtTR5irP18ZnTwmogHox5cEl45KxYp
        QyV9agqYPVNrl1Aj44g8SfqQ8C/uZ1YTe4T+DtxBIA==
X-Google-Smtp-Source: ABdhPJyL3/bqH4D0qJphsqucAUiUEnZ/g/CZ7SeS110SRX14jdu6QKSOu+pQG/UBfDyE0ONgN4VR83Prp7EvmVjxsW8=
X-Received: by 2002:ac8:23fb:: with SMTP id r56mr17425833qtr.197.1592844651549;
 Mon, 22 Jun 2020 09:50:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200617235831.25671-1-gaurav1086@gmail.com>
In-Reply-To: <20200617235831.25671-1-gaurav1086@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 22 Jun 2020 18:50:40 +0200
Message-ID: <CAMpxmJW40AO9bEf2LPHk7Pbu_r4tgczaR6uJ6iyHPa8gUmR0=w@mail.gmail.com>
Subject: Re: [PATCH] max732x_probe: remove redundant check
To:     Gaurav Singh <gaurav1086@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 18 cze 2020 o 01:58 Gaurav Singh <gaurav1086@gmail.com> napisa=C5=82(=
a):
>
> The check : if (pdata) is redundant since its already
> dereferenced before: pdata->have_64bit_regs;
> pdata is not initialized after that hence remove
> this null check.
>
> Signed-off-by: Gaurav Singh <gaurav1086@gmail.com>
> ---
>  drivers/gpio/gpio-max732x.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-max732x.c b/drivers/gpio/gpio-max732x.c
> index 5fb0bcf31142..63472f308857 100644
> --- a/drivers/gpio/gpio-max732x.c
> +++ b/drivers/gpio/gpio-max732x.c
> @@ -703,7 +703,7 @@ static int max732x_probe(struct i2c_client *client,
>         if (ret)
>                 return ret;
>
> -       if (pdata && pdata->setup) {
> +       if (pdata->setup) {
>                 ret =3D pdata->setup(client, chip->gpio_chip.base,
>                                 chip->gpio_chip.ngpio, pdata->context);
>                 if (ret < 0)
> --
> 2.17.1
>

The subject should be 'gpio: max732x: ...". I fixed it up and applied
the path to for-next.

Bartosz
