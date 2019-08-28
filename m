Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 738939FD45
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2019 10:38:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726273AbfH1Iis (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Aug 2019 04:38:48 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:33683 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726297AbfH1Iis (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Aug 2019 04:38:48 -0400
Received: by mail-ot1-f65.google.com with SMTP id p23so1998546oto.0
        for <linux-gpio@vger.kernel.org>; Wed, 28 Aug 2019 01:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=LA42bpg7TE1ErDc8e8NGiPSnjc3LkGHxDTQOiKqpb4U=;
        b=hfSMAmRpOdASqMo7kGDzwsaq1ugAqj8azpYiMW18Q4rIOyrsHZHB8eUQZRZWS6talu
         aq8wdMiWdJYogvypSrLVo8nEOyX7ETgHotBuqD2xXAnkpsCEQmqAtVnK76LnFuTHD0cD
         FS2jQLmBQtBHhcUeLjxcFGH23vM2ugltBi0mZl3AKifLrE4Dcfu82NYWTwduo8N9nF0o
         POzqNyeGFRSXYaDTcJlIMhmKWlHMqhp7vxvqHNr1pZebgghxEoaQWhymlcp/WAey8P85
         RlNvGjLrgQ2Vd4em5KUYRyhWldG9dH2oMv2LKV/t9kYF6I1+uP2ZwjPygwg7mHCxEuUe
         vTBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=LA42bpg7TE1ErDc8e8NGiPSnjc3LkGHxDTQOiKqpb4U=;
        b=ORvgn0o26eLU50sOGIqnZgRE8IYtpXRLVVYkWaUKercmsKJTVEqPD42l2NRq/hQzhP
         /79xGBgd2aXtwGd3T/o1DYp2TtKpmzJCzT1QHGFMqkzs3VSNp8Ufw5+G/+urLiX91K8V
         Le7jQolgY84GU2EOmF//7L+kYHuze5Z1uU27QonmoI2wRC7CaEbAd5mzDhBwTRMzr4oi
         wDesDngjsF9sh8RibS5xoftSPAlRcYu2CVYEGyxmsT8ZanVoQAx0xsuRLAVkvgqRaolh
         yeY6mBIfH54nFw6K3v3htI7OONkISSGFME15Ea1zt/e3gBLjOdoQvRwO1ZgfkF7kh9+4
         Buow==
X-Gm-Message-State: APjAAAVVZJaV0b0LCxU9c7a5z1Z9RzPmYk3cOg8huy8aDCxYdJcm7zqO
        r9lX0Sy4y+Qw4PfHsh6DvjvHnhxSvUp1memtu/1FVA==
X-Google-Smtp-Source: APXvYqzr+/pBY3bba/FTj2fIGzqgeyy/JZsqIzuMeHwfBrHmod6PlFGij5uDPP1r6ct0mKAIXOz2O0gG2DETVBBY5pM=
X-Received: by 2002:a9d:5551:: with SMTP id h17mr2372248oti.194.1566981527387;
 Wed, 28 Aug 2019 01:38:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190827064629.90214-1-david@protonic.nl>
In-Reply-To: <20190827064629.90214-1-david@protonic.nl>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 28 Aug 2019 10:38:36 +0200
Message-ID: <CAMpxmJV2XC+CK1SfJnH2YuaD2Gh=fiBQY+WPbjnqkvxGW6ZH_w@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: gpio-pca953x.c: Correct type of reg_direction
To:     David Jander <david@protonic.nl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

wt., 27 sie 2019 o 08:46 David Jander <david@protonic.nl> napisa=C5=82(a):
>
> The type of reg_direction needs to match the type of the regmap, which is
> u8.
>
> Signed-off-by: David Jander <david@protonic.nl>
> ---
>  drivers/gpio/gpio-pca953x.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index 378b206d2dc9..30072a570bc2 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -604,7 +604,7 @@ static void pca953x_irq_bus_sync_unlock(struct irq_da=
ta *d)
>         u8 new_irqs;
>         int level, i;
>         u8 invert_irq_mask[MAX_BANK];
> -       int reg_direction[MAX_BANK];
> +       u8 reg_direction[MAX_BANK];
>
>         regmap_bulk_read(chip->regmap, chip->regs->direction, reg_directi=
on,
>                          NBANK(chip));
> @@ -679,7 +679,7 @@ static bool pca953x_irq_pending(struct pca953x_chip *=
chip, u8 *pending)
>         bool pending_seen =3D false;
>         bool trigger_seen =3D false;
>         u8 trigger[MAX_BANK];
> -       int reg_direction[MAX_BANK];
> +       u8 reg_direction[MAX_BANK];
>         int ret, i;
>
>         if (chip->driver_data & PCA_PCAL) {
> @@ -768,7 +768,7 @@ static int pca953x_irq_setup(struct pca953x_chip *chi=
p,
>  {
>         struct i2c_client *client =3D chip->client;
>         struct irq_chip *irq_chip =3D &chip->irq_chip;
> -       int reg_direction[MAX_BANK];
> +       u8 reg_direction[MAX_BANK];
>         int ret, i;
>
>         if (!client->irq)
> --
> 2.19.1
>

Applied for v5.4.

Thanks!
Bart
