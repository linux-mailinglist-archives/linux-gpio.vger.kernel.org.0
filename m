Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7D502CB99E
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Dec 2020 10:49:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729189AbgLBJqf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Dec 2020 04:46:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726708AbgLBJqf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Dec 2020 04:46:35 -0500
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EEBDC0613CF
        for <linux-gpio@vger.kernel.org>; Wed,  2 Dec 2020 01:45:49 -0800 (PST)
Received: by mail-ed1-x542.google.com with SMTP id c7so2912779edv.6
        for <linux-gpio@vger.kernel.org>; Wed, 02 Dec 2020 01:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dAzfm1GPRmqmkkKCelIOFgT4CWV7j2OzoUKEFgOroWw=;
        b=Tgu/dQWLG7lUvAVYc/Qt+C6zK6ZEcWGuLwgfwY+PayGbyOwrL/t6wN+RH6+CISgGT0
         mwGcrHRX4JOmf2H9t/79JLs7qc5tSsTl/e5z+LJd8yis+MOMJ5FPj+4Hqnng96v8htD4
         Z9hTGWnp4q4kpaY7BOIbL0kjBHx2HwlhNVvq1SMi1mOWEYdwvtTBjurLv19lWG+Pi4r/
         ib9MTD2elJ/vutaBipPQTPaPPZPRuYUIMp0QWHx3ZSo9rEwygag/5IOSddn5gNS6W5Q1
         wdJOaDq6/D1Zyz46Q2lchJYvPhKMdfEbPU6H04PLuHUXweKD1sjpta5PytP+nRpv7Rgl
         n8DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dAzfm1GPRmqmkkKCelIOFgT4CWV7j2OzoUKEFgOroWw=;
        b=ukXQnwH2wJiYz9drAO1k0Vhj/dJtcPPltoUUbvOyZycCgqVLhFlMCQaRLMwVYDN1Qi
         Xuvzd2bsf7LHfcyjye7INa563cXkdaIrsVdaWLQCY835quL+uPDs/9G6zJzwcea7qGR1
         k9D53BgNHHE0e/WcpQuZ//zdzzLtTWUtq2SihnCIDBJeipUisFLzbA5f/TbE91sSOlmA
         bEOn1PflDawgo0L/sv2b7URJevjOam9DQyROlSJfs++hVlqza/J1TzihUI+2bXA/ui/k
         uD9EGnhJthHTpgYMe/Jnn6tsXnmNxEzf6xDFtXMh+7rAFNE5fbdQbGH1gVuoCgKbRetE
         XkVA==
X-Gm-Message-State: AOAM531hUgKGi86n2O299gDeFGUR5SRIbtAvKtzjyijq1ZeTCPe0psw9
        TILi44j4/spfCzjCPlL6JLJQp1NwKZ4yS/IlrECHyN9N0bg=
X-Google-Smtp-Source: ABdhPJyHwjHdplSfOvl0jRfKJN8w06y7AZNvDr+NrxjByMV4bOVADMNqjEMcto9Ssqm+Qp3a8AT4toWW+qT2fnpkedU=
X-Received: by 2002:a05:6402:307c:: with SMTP id bs28mr1782845edb.186.1606902347990;
 Wed, 02 Dec 2020 01:45:47 -0800 (PST)
MIME-Version: 1.0
References: <20201127094445.121232-1-miaoqinglang@huawei.com>
In-Reply-To: <20201127094445.121232-1-miaoqinglang@huawei.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 2 Dec 2020 10:45:37 +0100
Message-ID: <CAMpxmJXww=a3HoKcGvKQ3M2K6kAO0KGfyB9aCKbG+E_F_0iq7A@mail.gmail.com>
Subject: Re: [PATCH] gpio: zynq: fix reference leak in zynq_gpio functions
To:     Qinglang Miao <miaoqinglang@huawei.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 27, 2020 at 10:40 AM Qinglang Miao <miaoqinglang@huawei.com> wrote:
>
> pm_runtime_get_sync will increment pm usage counter even it
> failed. Forgetting to putting operation will result in a
> reference leak here.
>
> A new function pm_runtime_resume_and_get is introduced in
> [0] to keep usage counter balanced. So We fix the reference
> leak by replacing it with new funtion.
>
> [0] dd8088d5a896 ("PM: runtime: Add  pm_runtime_resume_and_get to deal with usage counter")
>
> Fixes: c2df3de0d07e ("gpio: zynq: properly support runtime PM for GPIO used as interrupts")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
> ---
>  drivers/gpio/gpio-zynq.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
> index 0b5a17ab9..3521c1dc3 100644
> --- a/drivers/gpio/gpio-zynq.c
> +++ b/drivers/gpio/gpio-zynq.c
> @@ -574,7 +574,7 @@ static int zynq_gpio_irq_reqres(struct irq_data *d)
>         struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
>         int ret;
>
> -       ret = pm_runtime_get_sync(chip->parent);
> +       ret = pm_runtime_resume_and_get(chip->parent);
>         if (ret < 0)
>                 return ret;
>
> @@ -942,7 +942,7 @@ static int zynq_gpio_probe(struct platform_device *pdev)
>
>         pm_runtime_set_active(&pdev->dev);
>         pm_runtime_enable(&pdev->dev);
> -       ret = pm_runtime_get_sync(&pdev->dev);
> +       ret = pm_runtime_resume_and_get(&pdev->dev);
>         if (ret < 0)
>                 goto err_pm_dis;
>
> --
> 2.23.0
>

Applied, thanks!

Bartosz
