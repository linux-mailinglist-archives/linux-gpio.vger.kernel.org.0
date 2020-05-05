Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB2231C5D44
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2020 18:19:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730002AbgEEQTM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 May 2020 12:19:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729377AbgEEQTK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 May 2020 12:19:10 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2444EC061A0F
        for <linux-gpio@vger.kernel.org>; Tue,  5 May 2020 09:19:09 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id x12so2409643qts.9
        for <linux-gpio@vger.kernel.org>; Tue, 05 May 2020 09:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=A/Wm3UHNM4qlX8DljPnma9j6lm5XESNuL8D71GdjV38=;
        b=1UfbGhRxXGz3GBtcxR9UNxM68oHkaj/WYVq1O0d/Pzl/wG0nhFdC8YkkSQk7lAfdvH
         5Ak4p4yujEG9sGUn6s8vbQyWJjfBr+jTiWZjH3JkLVJOPH/X0sby/bdWoNE24sm7Ct4u
         FWKT/jmiSIkJO/Tpqt2U+UXw5gSxKbmkry5EDE6mxveyCwgCeSprywvT2XvZob4BTVa/
         e04gJRelogulBVELpi7p7SvrDBnpA/8MZPhnhM+bIV42lT15R3Gjgt1c013K60Yne6VP
         yUpOU4KuQeRRl4T2kKhdlnbD9rTCeGeHobk3zfQ7ulhjY3A0zHfntGGHxEsIfXdU2wvt
         2qLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=A/Wm3UHNM4qlX8DljPnma9j6lm5XESNuL8D71GdjV38=;
        b=rOLK+DIwoxhglakfWABcyNo7dz55ux2m53eUFmy1vIKRZsJB0DqOgjv1/yjCA8aI3F
         OM5EY0nr19BVFCT/AIX84+eZCot4xIcDkq9JZabP7UQd922ZHGIbRA8KrRsgazo09CLe
         0DB4NQ2AH94+47ORXsi0C+ImaKjGWx47Pm24gOr5x9mjT7x4525/5FeUH3sDqMTUyO/t
         rtrnlkG0bdsE2Fok/7T+m7C3b6XOir79nVm5if6ONNJAW5p8R7I5uE9imWdLABla1hc9
         0VK3/T3KiJhYTGxwDoCrIwYJc8BRta+0nbVd+7LYU/0qGuuHAipefSz4YRJRCbw2dQEa
         Ycjw==
X-Gm-Message-State: AGi0Puae1CKt+a3cXRUj9ZEvhnjzNisQPw+TctEvzG4CQo1g3KQnbil4
        NJc00NY3y6B5EzjPs4tF3tVKcqDdsbmVKh4PAJcK0Q==
X-Google-Smtp-Source: APiQypLAizKoTqwFtOBKN/f1gzlwNVdkvxN9mo2b50TEgRtyqk55O3/9/e15NFeEPw0uW3ZQMHmqeBZnpb7i4CROJ3I=
X-Received: by 2002:ac8:346f:: with SMTP id v44mr3419058qtb.27.1588695548443;
 Tue, 05 May 2020 09:19:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200505084501.13170-1-ykaukab@suse.de>
In-Reply-To: <20200505084501.13170-1-ykaukab@suse.de>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 5 May 2020 18:18:57 +0200
Message-ID: <CAMpxmJXp9uZp=Q5Sm==_d720mg=aYSC1K1=V-P5Tz10gnLYuUQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: tegra186: export MODULE_DEVICE_TABLE
To:     Mian Yousaf Kaukab <ykaukab@suse.de>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

wt., 5 maj 2020 o 10:45 Mian Yousaf Kaukab <ykaukab@suse.de> napisa=C5=82(a=
):
>
> Export MODULE_DEVICE_TABLE since the driver can be built as a module.
>
> Signed-off-by: Mian Yousaf Kaukab <ykaukab@suse.de>
> ---
>  drivers/gpio/gpio-tegra186.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
> index 79b553dc39a3..178e9128ded0 100644
> --- a/drivers/gpio/gpio-tegra186.c
> +++ b/drivers/gpio/gpio-tegra186.c
> @@ -894,6 +894,7 @@ static const struct of_device_id tegra186_gpio_of_mat=
ch[] =3D {
>                 /* sentinel */
>         }
>  };
> +MODULE_DEVICE_TABLE(of, tegra186_gpio_of_match);
>
>  static struct platform_driver tegra186_gpio_driver =3D {
>         .driver =3D {
> --
> 2.25.0
>

Patch applied, thanks!

Bart
