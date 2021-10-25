Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74B384390F7
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Oct 2021 10:15:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231491AbhJYISB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Oct 2021 04:18:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230004AbhJYISB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Oct 2021 04:18:01 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E3D3C061745
        for <linux-gpio@vger.kernel.org>; Mon, 25 Oct 2021 01:15:39 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 5so23167499edw.7
        for <linux-gpio@vger.kernel.org>; Mon, 25 Oct 2021 01:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ycWo5sClTH2wJULOC25SBAkYNhAKYFWwgFptgtA3l78=;
        b=7VRUGM/F74dFjuuVH1F1iXmq+48MEi9+M6qdtP0/HtrPTAgsl/VePP63oUq003ILTL
         nHDVCVGD0cdTpbha+0my3XeSWHuiKCP78epihZS8dcrNVClvteGokwWgIkBnYxociwJd
         o7wVBUQnJEhcXJ+eiQsyvuf6NiUKLlIApIfhNm+hyjmMn4U8rfpEMDjaZkoLMhVOglLU
         C3C4KWuJTZSJY4tjNbMjsxBs5Dq8JOWMWkRvOdCo+g5Wb1gJLqOOZJRugO4vMba8e8if
         AecSuwMUVfDpLwxfKpdRC2mdw/j7stKjQlQmWot4AkRbGw5JE96LeP/RozglgqnxsdWQ
         hVPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ycWo5sClTH2wJULOC25SBAkYNhAKYFWwgFptgtA3l78=;
        b=wL4CtgQ3ZUf9ta5NrtmJtkqWTOc6H8HjGLra5AxBhltXJFe73NyBpvDcexiU8JY7Ob
         92naB4KFLeZ/OisxwbiRe85SPzPZMBoPtRaqe+bgKNS5YJVGfMm41m/XPnCYgqoF4rKB
         kYBc9hxQJhPXXT7Apz5MfNnKdDQfbSBedznhYjVOnvUKTx79YCzeFIvMlKi/LCh8yK7b
         SZ7NbSxsQt44ISt2Oumk6KMRUcegqZFPPoyNkvZWq7KTu9jDwulQZ0p3XpU6bFZ7SE0g
         temPfvMN8Q2gieAKjMzET5PykrBRsFoDwWR03xNOxGUxAQMBLBdHn2RDvfDiPQ3JKlL8
         QCLA==
X-Gm-Message-State: AOAM530KD7SMUVMOhhJmvkIFjr8dHSAkEe2amUuFfdZ/Cv+iyMD7lQuq
        vOX1pE7JRiQuVyJjURtYPSh0EHY3aMw6jgAJao0v3g==
X-Google-Smtp-Source: ABdhPJy3plOH2IZ9tT3bcGsMcRts0TqYy2sZv+1hbFfOGpM22QC1Y9qlw8eAt9MBzbg8y4KlaZnIvu4aRYtxohSimfc=
X-Received: by 2002:a17:907:3f8c:: with SMTP id hr12mr20667768ejc.77.1635149738000;
 Mon, 25 Oct 2021 01:15:38 -0700 (PDT)
MIME-Version: 1.0
References: <20211022134438.12083-1-asmaa@nvidia.com>
In-Reply-To: <20211022134438.12083-1-asmaa@nvidia.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 25 Oct 2021 10:15:27 +0200
Message-ID: <CAMRc=Mfzh8MK=aNzd=hKUOUrQO03K0tWmeMRkt5t8ubVmj4ATw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: mlxbf2.c: Add check for bgpio_init failure
To:     Asmaa Mnebhi <asmaa@nvidia.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 22, 2021 at 3:44 PM Asmaa Mnebhi <asmaa@nvidia.com> wrote:
>
> Add a check if bgpio_init fails.
>
> Signed-off-by: Asmaa Mnebhi <asmaa@nvidia.com>
> ---
>  drivers/gpio/gpio-mlxbf2.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpio/gpio-mlxbf2.c b/drivers/gpio/gpio-mlxbf2.c
> index 177d03ef4529..40a052bc6784 100644
> --- a/drivers/gpio/gpio-mlxbf2.c
> +++ b/drivers/gpio/gpio-mlxbf2.c
> @@ -256,6 +256,11 @@ mlxbf2_gpio_probe(struct platform_device *pdev)
>                         NULL,
>                         0);
>
> +       if (ret) {
> +               dev_err(dev, "bgpio_init failed\n");
> +               return ret;
> +       }
> +
>         gc->direction_input = mlxbf2_gpio_direction_input;
>         gc->direction_output = mlxbf2_gpio_direction_output;
>         gc->ngpio = npins;
> --
> 2.30.1
>

Queued for fixes, thanks!

Bart
