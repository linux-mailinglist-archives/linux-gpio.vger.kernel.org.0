Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 155D81F9127
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2020 10:15:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728522AbgFOIPK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Jun 2020 04:15:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728496AbgFOIPI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Jun 2020 04:15:08 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15B1BC05BD1E
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2020 01:15:07 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id q14so11875904qtr.9
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2020 01:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=PeSKgvXd465F+nZeBzqPtfbPRR02KvmYom1kw5jFHRM=;
        b=gaolLM3SJibkTPiylW9CVkCvCtGtkxucJIQ+CjQLqcZ1i6V69L5CIm3fo4ZfvxBQ18
         QTxmHkyBQ94s6V+QynK5T2wiO0+Tp2UpWly1tWGkZ+W6E1gr6meQBPbsnnkYj6b6QMox
         BhEmWboyPED4vbU5z8o12yd8lkNXdMr6RHHxqIzSr7HZB9HOXndhUw4peAckPJm5a7xC
         YZHiIxNIlnEcMYDf2fMqw7ZQTfT+sUyrlgso/2CAE3eQWlhM5oKZmsOuinqdjk6+TM1E
         GciWb3a65LfFuKSKuNA3ArEUQB0jxZ3MApSu1gQGHHMIrfyQmVV6y7RFFeSXHoQQDGxi
         obxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=PeSKgvXd465F+nZeBzqPtfbPRR02KvmYom1kw5jFHRM=;
        b=Zj+yk2OoEtLhvPJLZsu2w/pQYz4Wvnuk88a987yHf7b662QgCC0HWiZPqgNDp5v1bP
         81hkmjhmMucRs1YBZOLyFLz2ET56gzEMlpvWyKz1bz3zJ83qFOJTwRchL7/FH0sfSGQJ
         PpCJACI3/VEso4TVNgrTbL+0K9WNw4zyHy8K0EO2yz4x3our16Lu3ijUJy1IZkLTRi69
         hnSRJmSdVUetw91XLYPIiXMwqMgKa+bJsPS81YJRZQ0S1OtytAZWgWInPxld3VM/eK60
         o2sKG0j7gbeKKOW+Pmmy6TUftOsP4i8C0C0FZsm30aaCNwNBDCQdxNmCSwP5RuMsK8KQ
         R9Pw==
X-Gm-Message-State: AOAM531cPoGwNw7ToR8S8k+8VHQPB9UM1MAyOe/BaKaKEW/A0nu4lAA6
        +yTDeuZsYn/OzPmvszCvQeSvOiqISa0hT9jbSzQyJQ==
X-Google-Smtp-Source: ABdhPJyzaLHGZRBoz244z1QgtZDLkoNy4Y/LUfzCIH8w/SgjyAXy9AFzI588si91fFcHWalj927TbVmmYo2/kiKLK6Q=
X-Received: by 2002:ac8:1bc1:: with SMTP id m1mr14093638qtk.57.1592208905775;
 Mon, 15 Jun 2020 01:15:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200611102809.27829-1-hui.song_1@nxp.com>
In-Reply-To: <20200611102809.27829-1-hui.song_1@nxp.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 15 Jun 2020 10:14:55 +0200
Message-ID: <CAMpxmJUH-3=-r=DRVHP1dccvKQsuKZrng3vp7Ho864CtUMGR1g@mail.gmail.com>
Subject: Re: [PATCH] gpio: mpc8xxx: change the gpio interrupt flags.
To:     Hui Song <hui.song_1@nxp.com>
Cc:     Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 11 cze 2020 o 12:43 Hui Song <hui.song_1@nxp.com> napisa=C5=82(a):
>
> From: Song Hui <hui.song_1@nxp.com>
>
> Delete the interrupt IRQF_NO_THREAD flags in order to gpio interrupts
> can be threaded to allow high-priority processes to preempt.
>
> Signed-off-by: Song Hui <hui.song_1@nxp.com>
> ---
>  drivers/gpio/gpio-mpc8xxx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
> index 604dfec..1e86652 100644
> --- a/drivers/gpio/gpio-mpc8xxx.c
> +++ b/drivers/gpio/gpio-mpc8xxx.c
> @@ -417,7 +417,7 @@ static int mpc8xxx_probe(struct platform_device *pdev=
)
>
>         ret =3D devm_request_irq(&pdev->dev, mpc8xxx_gc->irqn,
>                                mpc8xxx_gpio_irq_cascade,
> -                              IRQF_NO_THREAD | IRQF_SHARED, "gpio-cascad=
e",
> +                              IRQF_SHARED, "gpio-cascade",
>                                mpc8xxx_gc);
>         if (ret) {
>                 dev_err(&pdev->dev, "%s: failed to devm_request_irq(%d), =
ret =3D %d\n",
> --
> 2.9.5
>

Patch applied, thanks!

Bartosz
