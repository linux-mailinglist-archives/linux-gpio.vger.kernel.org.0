Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A412A7C22
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2019 08:57:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728922AbfIDG54 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Sep 2019 02:57:56 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:42660 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728604AbfIDG54 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Sep 2019 02:57:56 -0400
Received: by mail-ot1-f67.google.com with SMTP id c10so8189711otd.9
        for <linux-gpio@vger.kernel.org>; Tue, 03 Sep 2019 23:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Dt75WhUIfHVQfvigwZn6/besGZVEJEtBIQcEOqZ+B54=;
        b=Pvsm0jkNiRhObMK4vm9PFjK6gDG1RInx1dfQIY+anapAMmQ7BBqa+FSp2oQcED/5ZB
         fMFHq1bQSJaQxWDjSZDwYSgSZiGzcMYKOHp3BHHpvmkR/bFVtnN1/nZhEyIerU3Ius5Z
         nhj9GQwxsboOGg+Xy6lXBu8TMN5aY7NAg746v/3ONWMWbQRN3cS84RI2pA4veYqocRhW
         Tk70wmmQirUWHbVtRF2QYa5Fa7ZUVBzx4h5df3jv2vIplCQB6rnVK09hgrU5zieTdwdI
         HxM/Gs7C8qN25BCH3ub6QKRMsgVuWSajuOJsabMCCXmOevSJjqfqamqw3aKhEiPWNJMV
         /Q6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Dt75WhUIfHVQfvigwZn6/besGZVEJEtBIQcEOqZ+B54=;
        b=h63SLS5b8p4fyRzz8/cmS8IepJ2oVH1CzuzIzftoH68KlvvFQIZjjsu+GWYSbo1KQe
         M67H2KQjb6UVV07rD14KNmiP3nAyI6oFiWNiVaw40vVAJvhWDsMAwArxVLPoGLUMw2Q0
         +CzdKKNCfws0o4D/b+IsZHzgHNe8XhPALQbOQUcP4iC9LOJrUfy0HdhS/vWoJkBqkFQY
         VsnP1+wFsY02GsUKpDQX2wS8xRw9woTqIyHy4sXjZkWscNl4I9jfBVYvIKDs4OJE9uJH
         To+i6c0Vn6tAmg/QD9OXO3fz1lA87z+23q0FiB3E2w6KHO29UpQcdeV/4nxws9uVS3Gr
         G3iA==
X-Gm-Message-State: APjAAAWLgQK30zDWydM6zzdqv+gCoahEm3bm2GCWBMWw6gRO/GHDhl7t
        NZRhq8C+GQ3IuE/4nRURgsVPADgBJ9InqdUVSam6vw==
X-Google-Smtp-Source: APXvYqwU0uoAvsRitFcgVrGOxLPCnceC5cmEGe0+fYS1mNopOondiib3itWCLOA9ZD86Hadp9khJFTIPsIhusxb2mrI=
X-Received: by 2002:a9d:6c0d:: with SMTP id f13mr1329516otq.85.1567580275770;
 Tue, 03 Sep 2019 23:57:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190904061245.30770-1-rashmica.g@gmail.com>
In-Reply-To: <20190904061245.30770-1-rashmica.g@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 4 Sep 2019 08:57:44 +0200
Message-ID: <CAMpxmJUVijPRGDw3GcSVt=MYod4nCD-npQKVmn2L4AdBSy5++w@mail.gmail.com>
Subject: Re: [PATCH 1/4] gpio/aspeed: Fix incorrect number of banks
To:     Rashmica Gupta <rashmica.g@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

=C5=9Br., 4 wrz 2019 o 08:13 Rashmica Gupta <rashmica.g@gmail.com> napisa=
=C5=82(a):
>
> Fixes: 361b79119a4b7 ('gpio: Add Aspeed driver')
>

Please, add a proper commit description. Checkpatch should have warned
you about it.

Bart

> Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>
> ---
>  drivers/gpio/gpio-aspeed.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
> index 9defe25d4721..77752b2624e8 100644
> --- a/drivers/gpio/gpio-aspeed.c
> +++ b/drivers/gpio/gpio-aspeed.c
> @@ -1165,7 +1165,7 @@ static int __init aspeed_gpio_probe(struct platform=
_device *pdev)
>         gpio->chip.base =3D -1;
>
>         /* Allocate a cache of the output registers */
> -       banks =3D gpio->config->nr_gpios >> 5;
> +       banks =3D (gpio->config->nr_gpios >> 5) + 1;
>         gpio->dcache =3D devm_kcalloc(&pdev->dev,
>                                     banks, sizeof(u32), GFP_KERNEL);
>         if (!gpio->dcache)
> --
> 2.20.1
>
