Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCB6029A5F1
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Oct 2020 08:57:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387636AbgJ0H55 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Oct 2020 03:57:57 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:44944 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728522AbgJ0H55 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Oct 2020 03:57:57 -0400
Received: by mail-ed1-f66.google.com with SMTP id t20so414992edr.11
        for <linux-gpio@vger.kernel.org>; Tue, 27 Oct 2020 00:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=akbJuP+GF8gOaddO9UFDGSpWaVjjaeolUWSvpBz1eqE=;
        b=2AvwaibhAarm+Y7IL90PDn6CJ29wk35f3zQw8A+i+QseMi7iaDMXyPHsfiwtMIh8OS
         oTwm5Crz0DkYU5J9zDVRB+Mo51SeSKHplfy3u7rB52IBvJ4rB5RdGCIGFowWELKyINo0
         VzEr8SydEYEWj0JlxxvvuSJHKwEJHfOwyvKTjKpCsYrULpRX4eef9TB2RXQztN0lnEtU
         TMMAEa/bjCuxiAyPBA0YEYncNBTMwkbylEcKEDwVhaQSMbQUqC/4TZS3BzZXakcMDGzA
         SgeFh0+2Ohxo+zvqT35cJtabdaFpbsLzyd4L57ey9n35r6qJmyTxyzLYHhTyOhw9KaSA
         Aniw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=akbJuP+GF8gOaddO9UFDGSpWaVjjaeolUWSvpBz1eqE=;
        b=U7LeUa2jEyNY7TIjcohaiBu82QsffqDBadi08naLu/azTlszh+qhTrQa8U5N6xdS19
         xrAffOOQA+dAwRVi9dM65tto8mm/9FkGfXL4Dv17EUbYL3kzxUI5FYWLXlym5YhbDVqc
         T6lU5CXmzW8ScQps61IFWrhIJ7FSViM8mRb1OOlfYMCmIBRNBrV35qOWzLXnU63FWngu
         30Qq/GhHWigpDEFUp/4D8gn3icrYcdDcEGAmoJLgs1u303eeolbcesPz8sFGRl3A4VB1
         mNE28NyWG0fKAltq3UkVGxNtLXVo+ZdqQ79ItjZYBZq1tZKKSF56LQ4Meb/Gx1kqDpKJ
         cvvQ==
X-Gm-Message-State: AOAM532QGUNX0kt4Chi8Cc5JNrjL4izjfPSLJTO9fGN0+gX0xdFHvBrW
        sqWB+6a8UwKZwZU3aoBuzuX2bqUPut6ieJvR3HJbvg==
X-Google-Smtp-Source: ABdhPJzvnqihjwnCRjoMYDuTW8p5OmD7OF2pq7wOXE2FbFaXScWrkN7ZllvL4BD1Ym1nn8T8pMItorsbhEmfX3oR6nE=
X-Received: by 2002:a50:9e0b:: with SMTP id z11mr952728ede.341.1603785475673;
 Tue, 27 Oct 2020 00:57:55 -0700 (PDT)
MIME-Version: 1.0
References: <20201026163244.21610-1-mike.looijmans@topic.nl>
In-Reply-To: <20201026163244.21610-1-mike.looijmans@topic.nl>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 27 Oct 2020 08:57:44 +0100
Message-ID: <CAMpxmJXWJ+XLTfnLeN-jnsq3g_17Rn5+HD6PdoobjKM=G_VeRA@mail.gmail.com>
Subject: Re: [PATCH v4] dt-bindings: gpio: pca953x: Add support for the NXP PCAL9554B/C
To:     Mike Looijmans <mike.looijmans@topic.nl>
Cc:     linux-devicetree <devicetree@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 26, 2020 at 5:32 PM Mike Looijmans <mike.looijmans@topic.nl> wrote:
>
> The NXP PCAL9554B is a variant of the PCA953x GPIO expander,
> with 8 GPIOs, latched interrupts and some advanced configuration
> options. The "C" version only differs in I2C address.
>
> This adds the entry to the devicetree bindings.
>
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
> v2: Split devicetree and code into separate patches
> v3: Devicetree bindings in yaml format
> v4: Rebase on v5.10-rc1
>
>  Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
> index 183ec23eda39..f5ee23c2df60 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
> +++ b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
> @@ -48,6 +48,7 @@ properties:
>        - nxp,pcal6416
>        - nxp,pcal6524
>        - nxp,pcal9535
> +      - nxp,pcal9554b
>        - nxp,pcal9555a
>        - onnn,cat9554
>        - onnn,pca9654
> --
> 2.17.1
>

Patch applied, thanks!

Bartosz
