Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6257E39040A
	for <lists+linux-gpio@lfdr.de>; Tue, 25 May 2021 16:35:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233860AbhEYOhN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 May 2021 10:37:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234058AbhEYOgf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 May 2021 10:36:35 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C406C06138B
        for <linux-gpio@vger.kernel.org>; Tue, 25 May 2021 07:35:04 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id o18so5665775ybc.8
        for <linux-gpio@vger.kernel.org>; Tue, 25 May 2021 07:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ukaK5XhZy2D/ZioTjRK5YPe6DCYHdOPpOGaEW9dEUZ4=;
        b=JH2fHeK4pOIzBfAPJ+ejA4h7tU9NvCfs+WsJ5pMklwU7umE7Kyq6hjjpiQrth8Y/O6
         TVat1jFIS90S57SXbaYPu8y/Ue5bEmCj7QZYAOgVxRSCosNkkk1C6D7r6Ndm+w1+68gi
         ICN5pMFME+Uph8+zOU0m3winfvayDtFHY8gbFkJzv3ztRWL9OBXDD8MvD8hwiaBZNw52
         CdadXy430upUpScXFiDcRk9xqDfp3KjF1iR+G7iL+bSVBHtVgFCd2NA7NjRzEKXbiNHV
         2iDhYZjmRoCbpG9dpTiGJfZxeRGwD3eVu7JEOnNNMNBleRZYh6Ywi6LXEUL+Ioa1R4RZ
         m0cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ukaK5XhZy2D/ZioTjRK5YPe6DCYHdOPpOGaEW9dEUZ4=;
        b=rQTdE/qvykLSfDpDDLN/5vLjA+rOc/THbD5cr1FhoGQj+YfdIyTWFSACIQNv0nMgqJ
         gmwhNeOcXOu2jYGdnigm1f48nRr9YzZadwltcmHb8vFKnwjsqzPdhyAU7hCA6ciQoNMB
         ZVj9f8XKkEZFWx9+vvpw+/ha9atjKYuD3j+x30etAPsC9H2HmcjHuxR5jpWpi15oFjO5
         Z1b5JUymmbZZrPsy4aXhCLNN1/JnL3SDmqNz/mXguK++0iaZoUM6QjkCPs7O8v/qFsOz
         uKL6Hhr8b2ENN6NJHaMLj2hkcyI+9mECsU7i/XPoVXU6A4CUHnzbrxzlXNccn3lTej3q
         N4UQ==
X-Gm-Message-State: AOAM532BtbS3juRCxAx1ruEt9pfwCexXMnSapKYlUx9vd6p6QSQS6w4Y
        78KTqP161ZBUgy0uNHZx9oprjf1ERgvh4bXgCjzQFQ==
X-Google-Smtp-Source: ABdhPJwBdA0oL97r/dwogyfVStu7efF6kKKAAw0HZ430evVWnLfQulJFW6pFs65Fu2mz413oD6sPCCLwYfsaT8nUoo4=
X-Received: by 2002:a25:9d86:: with SMTP id v6mr41613992ybp.366.1621953303520;
 Tue, 25 May 2021 07:35:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210517113707.238011-1-aardelean@deviqon.com>
In-Reply-To: <20210517113707.238011-1-aardelean@deviqon.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 25 May 2021 16:34:52 +0200
Message-ID: <CAMpxmJUafFpcFeVH6ScOMeoRFyY67aJMNk8Yxrnb1XdAucE-gw@mail.gmail.com>
Subject: Re: [PATCH] gpio: gpio-ath79: remove platform_set_drvdata() + cleanup probe
To:     Alexandru Ardelean <aardelean@deviqon.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alban Bedel <albeu@free.fr>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 17, 2021 at 1:37 PM Alexandru Ardelean
<aardelean@deviqon.com> wrote:
>
> The platform_set_drvdata() call is only useful if we need to retrieve back
> the private information.
> Since the driver doesn't do that, it's not useful to have it.
>
> If this is removed, we can also just do a direct return on
> devm_gpiochip_add_data(). We don't need to print that this call failed as
> there are other ways to log/see this during probe.
>
> Signed-off-by: Alexandru Ardelean <aardelean@deviqon.com>
> ---
>  drivers/gpio/gpio-ath79.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
>
> diff --git a/drivers/gpio/gpio-ath79.c b/drivers/gpio/gpio-ath79.c
> index 678ddd375891..9b780dc5d390 100644
> --- a/drivers/gpio/gpio-ath79.c
> +++ b/drivers/gpio/gpio-ath79.c
> @@ -234,7 +234,6 @@ static int ath79_gpio_probe(struct platform_device *pdev)
>         ctrl = devm_kzalloc(dev, sizeof(*ctrl), GFP_KERNEL);
>         if (!ctrl)
>                 return -ENOMEM;
> -       platform_set_drvdata(pdev, ctrl);
>
>         if (np) {
>                 err = of_property_read_u32(np, "ngpios", &ath79_gpio_count);
> @@ -290,13 +289,7 @@ static int ath79_gpio_probe(struct platform_device *pdev)
>                 girq->handler = handle_simple_irq;
>         }
>
> -       err = devm_gpiochip_add_data(dev, &ctrl->gc, ctrl);
> -       if (err) {
> -               dev_err(dev,
> -                       "cannot add AR71xx GPIO chip, error=%d", err);
> -               return err;
> -       }
> -       return 0;
> +       return devm_gpiochip_add_data(dev, &ctrl->gc, ctrl);
>  }
>
>  static struct platform_driver ath79_gpio_driver = {
> --
> 2.31.1
>

Applied, thanks!

Bart
