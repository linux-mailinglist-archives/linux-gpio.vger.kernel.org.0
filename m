Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07EA9452DA6
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Nov 2021 10:13:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232905AbhKPJPm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Nov 2021 04:15:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232934AbhKPJPi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Nov 2021 04:15:38 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39A31C061570
        for <linux-gpio@vger.kernel.org>; Tue, 16 Nov 2021 01:12:42 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id e3so48285735edu.4
        for <linux-gpio@vger.kernel.org>; Tue, 16 Nov 2021 01:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qKVkYLH3mOowH9ihjxmK78ep8UuW+0rWvJVOqRYNCN4=;
        b=7kGEMByJoCTKLzBecErJpTJcSpp8TYNs47ih0FIsR8BboXBXDTVrz9X2CHpFsqCjAQ
         plsZumoB6V8NrmfWB1JsyuJXZnWAbzNtxDSNpn/0gfRd6V8sO3jemtgvSY4Px/Qc6YDQ
         yAQXq3KXBl17GyClcDfBnOL/5SWTW5Hi6jMbaEbSrID6AQDpQlWj+n5gvEWFykrk4g0G
         +qvZJGNrHafjgBIcO6zXohiXQAcaGBWM6teeU6CUBHznIvnWv2WlBvEpieT8TvNL2twO
         FkwDw11qnsNrKe2jvJTP/t3yO3TlQYFJ9ZyM77EhuwtbAwTqTAnVJ8DOGqTQEJoqWE30
         6Ifg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qKVkYLH3mOowH9ihjxmK78ep8UuW+0rWvJVOqRYNCN4=;
        b=q5V7It7emYnqre6saw5m9pOIwY7UaOF9NNeKEE57DGkcwKzAlKTrugNiW8UnZygmIW
         pZmcUHayx6ov6U+GmwfPQYqSDkhiY+x0PIqznQv6mqrCGweLwh3DEjVoSSSXduMkKFVU
         Ob/tTvZ62U/yq9K48EZIPwOWwd1AdSFlsoQrD9CYQG+23cMNR8psJRJG80te/PdDEBON
         bWH8B9cgXxWcRrmMCjn1Ih3jgPTpURdsrICPMKlQo6rnyNn1D6IdXhxQV0Mq9wBaPUNA
         zeXqv7LE6yTPocNO+wsSOu0thzRB9+59mJSTV6AXsVUMTRELAHUZs6DQ3hmXKAo7FHNT
         /JLg==
X-Gm-Message-State: AOAM530s4BPP7pZ3hTydbY+DjgkJ/Ig8Td+wohx5ZuJ9wIuURAHVv6Jd
        lm49OkSHOW4XRB4LBgOl7O2yx9jByu3n6lG4g26WNQ==
X-Google-Smtp-Source: ABdhPJyN+4pYB4ITOLCCI2vxwYTJycQb5pex8bjnakGV8Kf69ptx0Ib7k3LjS+VYdVHfNClgN8lvQe15xzC1yaFSyIw=
X-Received: by 2002:a17:907:75f0:: with SMTP id jz16mr7942096ejc.77.1637053960836;
 Tue, 16 Nov 2021 01:12:40 -0800 (PST)
MIME-Version: 1.0
References: <20211105124242.27288-1-andriy.shevchenko@linux.intel.com> <20211105124242.27288-19-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20211105124242.27288-19-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 16 Nov 2021 10:12:30 +0100
Message-ID: <CAMRc=Me20whtwS--+Zy2NLDGKH+wvxVtXFGMXj+E-ANun2U=qA@mail.gmail.com>
Subject: Re: [PATCH v1 19/19] gpio: mockup: Switch to use kasprintf_strarray()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Jianqun Xu <jay.xu@rock-chips.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Bamvor Jian Zhang <bamv2005@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Andy Shevchenko <andy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 5, 2021 at 1:43 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Since we have a generic helper, switch the module to use it.
> No functional change intended.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpio-mockup.c | 23 +----------------------
>  1 file changed, 1 insertion(+), 22 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
> index d26bff29157b..8943cea92764 100644
> --- a/drivers/gpio/gpio-mockup.c
> +++ b/drivers/gpio/gpio-mockup.c
> @@ -491,27 +491,6 @@ static void gpio_mockup_unregister_pdevs(void)
>         }
>  }
>
> -static __init char **gpio_mockup_make_line_names(const char *label,
> -                                                unsigned int num_lines)
> -{
> -       unsigned int i;
> -       char **names;
> -
> -       names = kcalloc(num_lines + 1, sizeof(char *), GFP_KERNEL);
> -       if (!names)
> -               return NULL;
> -
> -       for (i = 0; i < num_lines; i++) {
> -               names[i] = kasprintf(GFP_KERNEL, "%s-%u", label, i);
> -               if (!names[i]) {
> -                       kfree_strarray(names, i);
> -                       return NULL;
> -               }
> -       }
> -
> -       return names;
> -}
> -
>  static int __init gpio_mockup_register_chip(int idx)
>  {
>         struct property_entry properties[GPIO_MOCKUP_MAX_PROP];
> @@ -538,7 +517,7 @@ static int __init gpio_mockup_register_chip(int idx)
>         properties[prop++] = PROPERTY_ENTRY_U16("nr-gpios", ngpio);
>
>         if (gpio_mockup_named_lines) {
> -               line_names = gpio_mockup_make_line_names(chip_label, ngpio);
> +               line_names = kasprintf_strarray(GFP_KERNEL, chip_label, ngpio);
>                 if (!line_names)
>                         return -ENOMEM;
>
> --
> 2.33.0
>

Acked-by: Bartosz Golaszewski <brgl@bgdev.pl>

Feel free to take it with the rest of the series.

Bart
