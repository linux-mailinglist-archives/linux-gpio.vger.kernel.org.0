Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A66D156EED
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2019 18:38:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726341AbfFZQiT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Jun 2019 12:38:19 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:35429 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726042AbfFZQiT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Jun 2019 12:38:19 -0400
Received: by mail-ot1-f66.google.com with SMTP id j19so3205014otq.2
        for <linux-gpio@vger.kernel.org>; Wed, 26 Jun 2019 09:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=VBRKLMNnew2mAl5lIdVMoybk2oV1VXiiYqZRyzqHBdo=;
        b=eyDR8rkG0ge7UHggaO+7uQlA8ddppzLkCDIJzKTuhgQNrqd9CArY8kZbyxEBjNr7PL
         m4FG1zMybMGnUiOLaREQ6y99pMP8rGtxArcEElQAOI6vn4kv8BPe0xdU5Xd7wNrei0jg
         n/lcFpyOB1marUqSxLMFot3SZDpQ099d2yjVrK2HQqILG/l35lA2fBaiJntq7bPhdxZT
         IJNiK+f9ZxzDW+WOEpJS8spaZantLdFUojTfQZR0halT0DeVlXrh4J8x35A2EWVEGKxL
         hH/OWunwPI3lMLO13rUSikjhzr21DH3BWJF37GPs/1Y5rBpK115x7R/7FyQ1BeZ2Ybi2
         pE7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=VBRKLMNnew2mAl5lIdVMoybk2oV1VXiiYqZRyzqHBdo=;
        b=AggWA6Yn3e3+5Nm0sS6peR/jrr9dsZl8yT29pG0PtkFl6GmtUiv3kws6AFSxEYxJ+s
         QDngGmXGzcEjVCEJDo4QUVy9QW5DEUrIZycNSJexY0kMDrpXsSlg5Y1qz63BUPHu8aaF
         asVj+mHyIEP+lo0W8N+iup/JFDUb3vxuNGJLO1ve4XKnHMoNKTm40ru1YpI/YVFPHE4d
         kaKcQepfcJ0/SaqDioczbLsBTpmL60fOseZXtilhPOOTgPvQgwfzbuscoR2alR6QQ/w8
         q4QZwJpN24FpVo43tShpFloqLwWrCA5kr7ZWnEEkk8bXzdA2FzlABmznX6d6vPG6tfJm
         RvYQ==
X-Gm-Message-State: APjAAAXrSvfMHhZYYlN7O+aJVBLze6xQE8aWRYRUc6mJlmWnSm//S+x3
        qSIXtcY4czql7OQ/DoeRhM81oNmNaY/JKYlQgLeEYQ==
X-Google-Smtp-Source: APXvYqzjfmfHK/LXt4jvWDX3mUhy79eUv7kwAx1wmrThQyaZB7xsTr6jBQj+e1LwpiUMznmPVts1R47D6ZevqUGQCmI=
X-Received: by 2002:a9d:2969:: with SMTP id d96mr4053777otb.85.1561567098916;
 Wed, 26 Jun 2019 09:38:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190626134258.26991-1-jonathanh@nvidia.com>
In-Reply-To: <20190626134258.26991-1-jonathanh@nvidia.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 26 Jun 2019 18:38:08 +0200
Message-ID: <CAMpxmJUEGgVP2r_phmdXZNWAGikuBG5pNQ7rU-bUr_No8W7o8g@mail.gmail.com>
Subject: Re: [PATCH] gpio: tegra: Clean-up debugfs initialisation
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

=C5=9Br., 26 cze 2019 o 15:43 Jon Hunter <jonathanh@nvidia.com> napisa=C5=
=82(a):
>
> The function tegra_gpio_debuginit() just calls debugfs_create_file()
> and given that there is already a stub function implemented for
> debugfs_create_file() when CONFIG_DEBUG_FS is not enabled, there is
> no need for the function tegra_gpio_debuginit() and so remove it.
>
> Finally, use a space and not a tab between the #ifdef and
> CONFIG_DEBUG_FS.
>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/gpio/gpio-tegra.c | 18 +++---------------
>  1 file changed, 3 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
> index 0f59161a4701..59b99d8c3647 100644
> --- a/drivers/gpio/gpio-tegra.c
> +++ b/drivers/gpio/gpio-tegra.c
> @@ -508,7 +508,7 @@ static int tegra_gpio_irq_set_wake(struct irq_data *d=
, unsigned int enable)
>  }
>  #endif
>
> -#ifdef CONFIG_DEBUG_FS
> +#ifdef CONFIG_DEBUG_FS
>
>  #include <linux/debugfs.h>
>  #include <linux/seq_file.h>
> @@ -538,19 +538,6 @@ static int tegra_dbg_gpio_show(struct seq_file *s, v=
oid *unused)
>  }
>
>  DEFINE_SHOW_ATTRIBUTE(tegra_dbg_gpio);
> -
> -static void tegra_gpio_debuginit(struct tegra_gpio_info *tgi)
> -{
> -       debugfs_create_file("tegra_gpio", 0444, NULL, tgi,
> -                           &tegra_dbg_gpio_fops);
> -}
> -
> -#else
> -
> -static inline void tegra_gpio_debuginit(struct tegra_gpio_info *tgi)
> -{
> -}
> -
>  #endif
>
>  static const struct dev_pm_ops tegra_gpio_pm_ops =3D {
> @@ -675,7 +662,8 @@ static int tegra_gpio_probe(struct platform_device *p=
dev)
>                 }
>         }
>
> -       tegra_gpio_debuginit(tgi);
> +       debugfs_create_file("tegra_gpio", 0444, NULL, tgi,
> +                           &tegra_dbg_gpio_fops);
>
>         return 0;
>  }
> --
> 2.17.1
>

Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This depends on changes queued by Linus, so I'll let him pick it up directl=
y.

Bart
