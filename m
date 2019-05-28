Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 218022CA95
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2019 17:47:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726541AbfE1Prm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 May 2019 11:47:42 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:38906 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726371AbfE1Prm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 May 2019 11:47:42 -0400
Received: by mail-ot1-f65.google.com with SMTP id s19so18216680otq.5
        for <linux-gpio@vger.kernel.org>; Tue, 28 May 2019 08:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=cpA6X30q1WwappNH8AvwqpCneggPzg+rTJDIacCPxPI=;
        b=M9tB4eZ4GxBhxNQzU1FOBJ/E9KxvDRpoItlOTGlwPFD6ot9vWqEgqgPNbCt2dNt8Fc
         uID3CxHyDqsRSinQ73RrJNpBf//pQUWFCFt7UHAXGtaMRB+nCiOFzRV8gHzoXl2NZie2
         +xf/2ylphafW5+uyyenJgXuDGd1wCy7B6/T7M2INAJ3WbMpfIqXL18XTbUTEae3cGxQm
         7Xrxnz5RRRoqjHwfkinUyQJKl1I/UudFbeFkMCsygmgLPNPjYZyGfm8R1v5VzF3Yj+rE
         BSFfBJIPm8zFkwdnHAk48h2fA7T36IQwSZnyiU1UGDqmkvedkMiLovqd4+PlTpCoESg2
         NRDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=cpA6X30q1WwappNH8AvwqpCneggPzg+rTJDIacCPxPI=;
        b=Rep36dJ7E2P6M7qLwfw2+Bz1bzfOeCdd08TWxVFm6Idm80FidKyT/ek82C6VJFFupW
         y50r04biviCuujgOBDFq080HqWZ2AwRxBgOLRkG4G7d7QOs61B9jCaaIRntquNIBysWN
         K/BrNO2yRs+c98N1JKJxXTL+4i0lbXmPqpXYpAIoW9cUt0/T55QiQRQ/ii0RpWQ7Sj2O
         ViDW7hWvAU30o4KbVUg/obQeaMzbP2LaSXYsb+Tqs6z+9ZfD1Cy+CS2DVP2G3XMsHeP/
         lsLkgtOvSXbuBWfb9LjdXJrUyzuTzKu5+gPEJpriDT7HjvUNQrj/1+J8JhVUhsJc/3Oc
         TYog==
X-Gm-Message-State: APjAAAVssk+yAJhtiGVtrZQoc3iC+0+kRNAJkBDnM7XaA4g48uI5LlkS
        oAv1e4cA+Dxkdp7dr9DzUsqykLjey6bvF04MXTJmkfNb
X-Google-Smtp-Source: APXvYqw2g8eQ+TWa0dz85vWomepOYgqQbUrqvakcMXYxYcdbN1O9VI0OANLrQI6q1MzETTBh8sK2gP8kO4BfLOzck5o=
X-Received: by 2002:a9d:6259:: with SMTP id i25mr15617766otk.250.1559058460066;
 Tue, 28 May 2019 08:47:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190527124051.7615-1-geert+renesas@glider.be>
In-Reply-To: <20190527124051.7615-1-geert+renesas@glider.be>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 28 May 2019 17:47:28 +0200
Message-ID: <CAMpxmJUDx7hF8+XqamMkMdX_w27-FyFkNKhQoVCpPa6jUXrwdg@mail.gmail.com>
Subject: Re: [PATCH 0/2] gpio: em: Miscellaneous probe cleanups
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pon., 27 maj 2019 o 14:40 Geert Uytterhoeven <geert+renesas@glider.be>
napisa=C5=82(a):
>
>         Hi Linus, Bartosz,
>
> This small series contains two cleanups for the GPIO driver for the
> venerable Renesas EMMA Mobile EV2 SoC.
>
> These are compile-tested only, due to lack of hardware.
>
> Thanks!
>
> Geert Uytterhoeven (2):
>   gpio: em: Remove error messages on out-of-memory conditions
>   gpio: em: Return early on error in em_gio_probe()
>
>  drivers/gpio/gpio-em.c | 30 +++++++++---------------------
>  1 file changed, 9 insertions(+), 21 deletions(-)
>
> --
> 2.17.1
>
> Gr{oetje,eeting}s,
>
>                                                 Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                                             -- Linus Torv=
alds

Hi Geert,

applied both and also sent a follow-up that makes this driver use the
managed variant of gpiochip_add_data().

Bart
