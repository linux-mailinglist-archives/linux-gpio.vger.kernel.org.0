Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B9A8152849
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2020 10:28:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728149AbgBEJ2K (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 Feb 2020 04:28:10 -0500
Received: from mail-qk1-f195.google.com ([209.85.222.195]:41814 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728035AbgBEJ2J (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Feb 2020 04:28:09 -0500
Received: by mail-qk1-f195.google.com with SMTP id x82so1126742qkb.8
        for <linux-gpio@vger.kernel.org>; Wed, 05 Feb 2020 01:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=DOZKl+jyEdXIGkIdajoySMy9zPjKLhC/a+xIEBxsxXk=;
        b=D5XU9GqOuZEqsknkmoU2UyU2VefkTcVHdwhwVIPs7ODqU9wNN7pRKXhw3iHDkie6oG
         v9Z/loMI+UMoe0sLdFMFZtAhZEXWa71Mfkg2I2MkwtbiwT6a0tPPTh0gIf8wwZ2mR/a8
         OG7JYIO+BfBRD63Uoztt26mRNhfOE3QE2Rz+jaEO3alMe4lF1np+h6OyHx55mGCegb2T
         KUzLXrQGWQOdtzPSmE/iEgm1zjByFo+fuJte8JQcDTrv4q0dROC3EO9EO0k1iYydULaJ
         C94eSApcv3N3I5lczlx4qYqZiPPf3WVk89/mvV72mpP4J49uA8n40gDnzKISaYm1RT0V
         JNxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=DOZKl+jyEdXIGkIdajoySMy9zPjKLhC/a+xIEBxsxXk=;
        b=thcl8l1JMK21StAKhCTyrTDhNmXg+i4ORiZTV0Z9Rzbas9FNYbrig8iTK0bE27autD
         FGvVbSKvx0FajUoSrdhrfr4Be6xEoGNhkDTfnCM/71QRRfJn5BlstOAW7L9IAxAjEKDi
         GQOUlIO5Mkk9L36hLg0UBF9CJyylPiOyuyVN05VSKqi7Iyu18sNcZiUe6LXmA4Zo4E8b
         MSJVvl/ZKyQkvesB5jeObygocL+rEWNCmlhO39X4MRW+EuDOdDPwYfQtLbNovgMRI4Rv
         Wq8tnPOC8loHvj0/liMAqxTWhl8Q2CMH1upbPdYAYaylUU9DZkFqCe6ZmSpE8vwbtYHq
         XVZg==
X-Gm-Message-State: APjAAAVMiZXSNz/xjOcw2DIG+5VxcHC2LGf5iauPraxAg6PdmYDJbPpi
        dHfVh9dWiFCleqWfLVu6hB1SB1HxALPF2M3CPzVkuQ==
X-Google-Smtp-Source: APXvYqxkQh8e7zfg1X10X24Oj6Q1KGfQ1s+5IdP/481BmZM+/zl1XxSjzuCkRa8x4WiFbPJjlcmM64CyjYN2Hb+PWTc=
X-Received: by 2002:a05:620a:11ba:: with SMTP id c26mr31801616qkk.323.1580894887619;
 Wed, 05 Feb 2020 01:28:07 -0800 (PST)
MIME-Version: 1.0
References: <CAF=tPv+iL5JSO2NLG0X7EQjcP0rsxXoTPCUZkznh7PmAcR4c-g@mail.gmail.com>
In-Reply-To: <CAF=tPv+iL5JSO2NLG0X7EQjcP0rsxXoTPCUZkznh7PmAcR4c-g@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 5 Feb 2020 10:27:56 +0100
Message-ID: <CAMpxmJXquoGYUKnwWUV+tDUx7YA0aFqoKqneELDdWj7nyW5Q+Q@mail.gmail.com>
Subject: Re: [PATCH] GPIO: it87: fixed a typo
To:     Sachin Agarwal <asachin591@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

wt., 4 lut 2020 o 17:17 Sachin Agarwal <asachin591@gmail.com> napisa=C5=82(=
a):
>
> From: sachin agarwal <asachin591@gmail.com>
>
> We had written "IO" rather than "I/O".
>
> Signed-off-by: Sachin Agarwal <asachin591@gmail.com>
> ---
>  drivers/gpio/gpio-it87.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-it87.c b/drivers/gpio/gpio-it87.c
> index b497a1d18ca9..79b688e9cd2a 100644
> --- a/drivers/gpio/gpio-it87.c
> +++ b/drivers/gpio/gpio-it87.c
> @@ -53,7 +53,7 @@
>   * @io_size size of the port rage starting from io_base.
>   * @output_base Super I/O register address for Output Enable register
>   * @simple_base Super I/O 'Simple I/O' Enable register
> - * @simple_size Super IO 'Simple I/O' Enable register size; this is
> + * @simple_size Super I/O 'Simple I/O' Enable register size; this is
>   *     required because IT87xx chips might only provide Simple I/O
>   *     switches on a subset of lines, whereas the others keep the
>   *     same status all time.
> --
> 2.24.1
>
>

Sachin,

you're spamming the list with these patches. This is I think the
fourth time I see it without any version change and still with a wrong
subject message.

Bartosz
