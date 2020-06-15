Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AE061F991D
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2020 15:39:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730558AbgFONjU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Jun 2020 09:39:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730553AbgFONjU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Jun 2020 09:39:20 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A71C0C061A0E;
        Mon, 15 Jun 2020 06:39:20 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id g12so6819473pll.10;
        Mon, 15 Jun 2020 06:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ah0UfBo3/l6OYZWIRiXA6j4YsIUsHqux+pOpb5M0AY0=;
        b=sRyoxTnYJw2jFmNQCcAlCZCtb0wgrwD6mfvXsnk5zIU7TxEzSW0kSqswa/6u2er8te
         ewa8n2nGw0nhdCdQilNylI6vN5qEF80C/CyBZPuIOX5FN/BH/9cDHbOFjhxFgMNVIVYL
         SWx8xsGbtyARU2UFqXdqcf2DJGTUPrBdErgsapVFGfiIgSRtHAPOHhz5uQV9H/em8yfe
         8FO3dQjIzhHcjl0OlAfu22FZCxRNqg7L1XjS2DGhCo2iFZiggmiE4zSQScxoZqVVgxu0
         cJ1v4jYii0Gy6rwACTsfd6uSbLFB4qiStpRMyA+PVZAjSRPNEieKm1qBbHOt/t7Nfwqv
         AfvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ah0UfBo3/l6OYZWIRiXA6j4YsIUsHqux+pOpb5M0AY0=;
        b=ineuRsCAM7PtqT+vwROJkFtlmtmlPZ0cK4pIu1AxSr+yxayy9CKESZph07QvAfbh38
         jT2v7LVQsLLSMw00teaKQEMZm2ryNtYKKOERxTSLYkMZzkwPqD4qZJymy6pZLdTTQpbJ
         tsmPdpil2cxgExcGktbKe3cXkwu20z/k2oyD+np0PXL1tEG3gbavUowG4PyZoDrX3YVR
         sMO4egiA69WUj4MUzyNYdJLGsJ6EkjyArlbfvH+Dj2xFjfnfI8H2Ve5jwey0BwXWRl8X
         0+oPdzIqG5gIcB1q+YYNvX5Tze0aVbmK1TNQxPmluFTEHlAkmKAR9gGzb4Ui52ZLpSFc
         t79Q==
X-Gm-Message-State: AOAM531HtGO8fnQHhLBKwuqSMsNUFFTxO44LQ09eim9qb3E+T+Ha/qfK
        sh2eswKGA6CzLQGmLl9zTVYkjNzuOFDRadvBXauNlIts1B8=
X-Google-Smtp-Source: ABdhPJwe1BbP2x4NoKm3Y3Nenvcs1PIHbm8BsXJg3nxaVSU8wov2jEBcJw5uT1/kfK1ZnyZI4sMlWjPhNaziBXc760k=
X-Received: by 2002:a17:902:b206:: with SMTP id t6mr21713377plr.262.1592228360257;
 Mon, 15 Jun 2020 06:39:20 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1592227348.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1592227348.git.jan.kiszka@siemens.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 15 Jun 2020 16:39:07 +0300
Message-ID: <CAHp75VeudX2M0Fo5=m3UA874mighn6dEMaQkF5TOZ6rqGrvDSw@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] gpio: Add support for the PCAL9535
To:     Jan Kiszka <jan.kiszka@siemens.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 15, 2020 at 4:22 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>
> Changes in v3:
>  - extend also I2C table
>  - tag "Datasheet:" in commit log

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Thanks!

>
> Changes in v2:
>  - add dt binding update
>
> Jan
>
> Jan Kiszka (2):
>   dt-bindings: gpio: pca953x: add nxp,pcal9535
>   gpio: pca953x: Add support for the PCAL9535
>
>  Documentation/devicetree/bindings/gpio/gpio-pca953x.txt | 1 +
>  drivers/gpio/gpio-pca953x.c                             | 2 ++
>  2 files changed, 3 insertions(+)
>
> --
> 2.26.2
>


-- 
With Best Regards,
Andy Shevchenko
