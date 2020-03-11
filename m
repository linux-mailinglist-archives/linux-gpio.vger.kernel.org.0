Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED603181824
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2020 13:35:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729468AbgCKMfX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Mar 2020 08:35:23 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:39124 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729466AbgCKMfX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Mar 2020 08:35:23 -0400
Received: by mail-qt1-f196.google.com with SMTP id f17so90908qtq.6
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2020 05:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=T5cO+vNox9HwjS2lqwQ2qXQiWseGejd3Ybtcz8SgsxM=;
        b=2Fzon0ZwCzzv/7AaI/YjiCmlavAXwe2i66o01TKnM725br6N4FUVqhWxmKB4BaBkbc
         6LC3Iid940WDT/7QEVYxsQ5emSFflAPLtVhVQjyUXwd3cqjhXWYLsw8BFql1KUEmUnHQ
         q10gMGZABekkne2ytc2fuKfp3hlchUjR5HpR8eJOkFXLxk7xMZsCSj/nhMrCtZ4S1rHI
         8Zeng55GoDvdnUYftZfOXxR1xr8HgUsqW+x/te6vPoD6AGaVGj4qGS3UxJGi1aK1QFME
         re6Hi1mbaQMcLIsZ8AkMKOf9Vtb/uOpW6mrMxt2sKMd9K5mmKVUE3MmOQYGw+2+5X4Zw
         40xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=T5cO+vNox9HwjS2lqwQ2qXQiWseGejd3Ybtcz8SgsxM=;
        b=cpsuCXg7QTzN25nn0YEcGJV7JJt14jt9Gllg61A6M0WQdjI9fyc9zbV+kKXYNvbyJW
         T+02hYfefjrBM8GlzoWfaf3NJW1PQfl4uGdmiQNaEimkq6AiR/R+j/8nBJSUb+kJqpOo
         rRKjhbMCjjoJATmLPA1t83Gkt1Dk701d+eiJ6pXj/kU9Ad/aIuBx1pB/Tgefa5I/pncs
         9UehSJbmPImQxor2iSO94cC8rQyaiBy+JnmpWEyNKxCAmMa6KR+kT7CoEQYfdsx/ZREJ
         RBYoBgDdp2jzff0TuEfFaJxuicuBc3d22CXXzZKHB+lfDTlgZPHhzJO7R8GLFNHsyTmB
         3+tg==
X-Gm-Message-State: ANhLgQ1TaE2S78QTEI5z7LNWaJkR3xGdbwrq589eG7b+gUfB06IeQAVn
        2Fff9Jox1OhnmiqP+J+PBLH8T95e6hiNCkydxVFp4g==
X-Google-Smtp-Source: ADFU+vsoerkE2fj4dGB1JMHxsRHNClf6XJOZJUddj6pFbGdGYbDhEoy5eidtXv3LEwI0krOht5/bcLQPD61Of9+NWx4=
X-Received: by 2002:aed:36a5:: with SMTP id f34mr2330090qtb.57.1583930122148;
 Wed, 11 Mar 2020 05:35:22 -0700 (PDT)
MIME-Version: 1.0
References: <1583719058-23370-1-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1583719058-23370-1-git-send-email-Anson.Huang@nxp.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 11 Mar 2020 13:35:10 +0100
Message-ID: <CAMpxmJUD_W3ciQE8RYmcw3mSPpRFAVEauC=dcLhDwJ_OM24xKg@mail.gmail.com>
Subject: Re: [PATCH] gpio: mxs: add COMPILE_TEST support for GPIO_MXS
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        dl-linux-imx <Linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pon., 9 mar 2020 o 03:03 Anson Huang <Anson.Huang@nxp.com> napisa=C5=82(a):
>
> Add COMPILE_TEST support to GPIO_MXS driver for better compile
> testing coverage.
>
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
>  drivers/gpio/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index b411226..3cbf888 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -400,7 +400,7 @@ config GPIO_MXC
>
>  config GPIO_MXS
>         def_bool y
> -       depends on ARCH_MXS
> +       depends on ARCH_MXS || COMPILE_TEST
>         select GPIO_GENERIC
>         select GENERIC_IRQ_CHIP
>
> --
> 2.7.4
>

Patch applied, thanks!

Bartosz
