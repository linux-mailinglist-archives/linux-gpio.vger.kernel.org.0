Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CB1641EA18
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Oct 2021 11:51:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352947AbhJAJxD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Oct 2021 05:53:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352943AbhJAJxD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Oct 2021 05:53:03 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB737C061775
        for <linux-gpio@vger.kernel.org>; Fri,  1 Oct 2021 02:51:19 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id s64so16252844yba.11
        for <linux-gpio@vger.kernel.org>; Fri, 01 Oct 2021 02:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zmlXrVwQY2fNuS9t62u7UDiQdOnEktfqebFZqgaRxqo=;
        b=J3RJIy6UMexW7+nFpatxoOHOUp6TcHjdz9DlFXPMRkL29jn0bdy+hL6IgfG0BGt3Zv
         sjSwpuQBdcgylnheriR+b8DMgbmgEQfO2/6Y29+mRcpLas1SH33BakIo2ohydt2t/Jd3
         veoisJ7qBp5hK+LLDVJDtoW3/mJUCnrhGu674LU026hvprS79cwqfYrAxXVaKO1aqzSW
         XYzZxS6jbEGxKrJ/KPBrytdDkXFSrpe2Gh3okGURgRu0uKHglR7/nFDFoSqtbns6k/Ap
         KdMhswWtg9sn7X5Ok0Ni36WFTH/njftb1DH6eeU7uO1gP7n4jcRxn11hYN9VqVhbXqHQ
         QoNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zmlXrVwQY2fNuS9t62u7UDiQdOnEktfqebFZqgaRxqo=;
        b=f6Y6mljNSRWRxZWZprA6bVni/ahM0mE/glDTdEN2EjfRrQOHQL7h9guuJNTQ4/ZFeZ
         8sd9owEO7FDqcHjldz8k+cgyUwy57wT/TLsccKWvPwNeXAsPLK4sWDkiCpsMC3npxbM3
         EZuLL1AJd1yZ5Zw/tAQAnL23c/GGxp4BFB4WpNCK/o18TbnmYVnj9GFp1+hcr8KXI696
         VctpxlHndfogvTz6vNFNFuHXabgK1UqdLBZJ1bAlofHsMUN14JXzOIyjiDopu/yGgBYB
         +Z+Bgr2eAjInMnx1qjY6LY+kU0EZRkZytKgcxEpHw3/7xQkkNpxENE9eqEuZYBcO3d7B
         7NOw==
X-Gm-Message-State: AOAM532J7m9nCAJMZeGPI9kGyqNEBvDGX0QQo7K+cNq/ByKI+vnQ+1m3
        xOaN9YUt0fybOWDzdts7ny5vZwnpluA0fcb1a2iLFg==
X-Google-Smtp-Source: ABdhPJycWqNj6mrGwOTcLnmAzbMaVKHOeQsSLIsBPNDiwazI8fPAE9WLPHVh27E3FHlgIXCsA3MRn6cAIjnlWjXl4yU=
X-Received: by 2002:a5b:783:: with SMTP id b3mr4837095ybq.328.1633081878862;
 Fri, 01 Oct 2021 02:51:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210922161736.9064-1-broonie@kernel.org>
In-Reply-To: <20210922161736.9064-1-broonie@kernel.org>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 1 Oct 2021 11:51:08 +0200
Message-ID: <CAMpxmJWjvQrq7UvEaLhE_F7haXpo+mxr3sgYJVGenc5tsZ9YZQ@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: 74x164: Add SPI device ID table
To:     Mark Brown <broonie@kernel.org>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 22, 2021 at 6:18 PM Mark Brown <broonie@kernel.org> wrote:
>
> Currently autoloading for SPI devices does not use the DT ID table, it uses
> SPI modalises. Supporting OF modalises is going to be difficult if not
> impractical, an attempt was made but has been reverted, so ensure that
> module autoloading works for this driver by adding a SPI device ID table.
>
> Fixes: 96c8395e2166 ("spi: Revert modalias changes")
> Signed-off-by: Mark Brown <broonie@kernel.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>
> v2: Fix typos in the device names, sorry.
>
>  drivers/gpio/gpio-74x164.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/gpio/gpio-74x164.c b/drivers/gpio/gpio-74x164.c
> index 05637d585152..4a55cdf089d6 100644
> --- a/drivers/gpio/gpio-74x164.c
> +++ b/drivers/gpio/gpio-74x164.c
> @@ -174,6 +174,13 @@ static int gen_74x164_remove(struct spi_device *spi)
>         return 0;
>  }
>
> +static const struct spi_device_id gen_74x164_spi_ids[] = {
> +       { .name = "74hc595" },
> +       { .name = "74lvc594" },
> +       {},
> +};
> +MODULE_DEVICE_TABLE(spi, gen_74x164_spi_ids);
> +
>  static const struct of_device_id gen_74x164_dt_ids[] = {
>         { .compatible = "fairchild,74hc595" },
>         { .compatible = "nxp,74lvc594" },
> @@ -188,6 +195,7 @@ static struct spi_driver gen_74x164_driver = {
>         },
>         .probe          = gen_74x164_probe,
>         .remove         = gen_74x164_remove,
> +       .id_table       = gen_74x164_spi_ids,
>  };
>  module_spi_driver(gen_74x164_driver);
>
> --
> 2.20.1
>

Applied, thanks!

Bartosz
