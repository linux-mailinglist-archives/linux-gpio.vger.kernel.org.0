Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E8F05BF7BB
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Sep 2022 09:32:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229888AbiIUHb7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Sep 2022 03:31:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229673AbiIUHb5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Sep 2022 03:31:57 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B44487E814
        for <linux-gpio@vger.kernel.org>; Wed, 21 Sep 2022 00:31:56 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id bj12so11512885ejb.13
        for <linux-gpio@vger.kernel.org>; Wed, 21 Sep 2022 00:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=SsmCCyDi74VwnxgmOAe/pUNyj8fElhmMBo+WxDPOa58=;
        b=6Sn1ysZxrf3fCZ8WZSUG4RtP6Lg5Om3weZ4AQnx3wiKJjf0RGAKrXapRCaA2vEAON0
         EB0ipwxXeJ8qw8cwPEYgQ00Jw37LrvafeNvzODLn1oFS+X+EV/tayNzxvMMhRNSRspr0
         zNVJZ9TMih2FUDITgNkIjxl1aHnys+WZRRfozMwTcy/uWowGCURn10qFjqZpcLgHGngs
         4KBO2jT3ZawoMquUabR3+oCsd6jZeWVc4/UQSEkSslKx7u0Qk/o1YITQtPR1wsEaoMH6
         UeWCtXsm/y3ptaw9UC8aPXwolYH+qMQ8nWvjDNjiJEg7kb4kH+BWUqecivvP/VD/spOR
         bjrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=SsmCCyDi74VwnxgmOAe/pUNyj8fElhmMBo+WxDPOa58=;
        b=6z1CAdmaKqx92qe9OdR7VIWIeZ9e2leSraE+LEtnUf9LJ0RIJhF0rsA5N0Xmn93JQm
         +5sw/jnMq8S2DWihWwWUKJNNnm40VT1cSttzyIIS15KQViYam2/CQOFHCk3c4pMNhNSh
         /eGOGphP1P0ym9Bp9/mt4lVdu+QGuTkIV3B2nbILJpUtCothx6WdRDMOvAneU9ce+Ryw
         9ACCTu4n9lKpSsp0kLmV4XxivIz2EXWYnmWjn6eEbJnopM+VOUxCTU5DszWCzPvnkcOY
         ZO6krJlIUOcpG86qTIH/DTS/MERh+ZKQBqN3eYrjDsOOCs8u0A24BPYSPJs0b1QiDyDr
         KSIA==
X-Gm-Message-State: ACrzQf3VvngKqQrc03jwhpd+xE6MExP0BVWFKB9KVHhPnEYuclRUqRJP
        DVCHTMsSTOeae5RQ2+Kl8QOKo44yWGmhvTUl0Ob55g==
X-Google-Smtp-Source: AMsMyM5o9h9sSXUaA+sf31lVa3qDAFVzRemKXB400rxb+3G3G8LaTfJLXAg231XbOhAilab0slHIT+YeSjxOxI3Kg54=
X-Received: by 2002:a17:907:3da9:b0:77b:9672:3f7f with SMTP id
 he41-20020a1709073da900b0077b96723f7fmr19870688ejc.636.1663745515250; Wed, 21
 Sep 2022 00:31:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220919031250.770285-1-dzm91@hust.edu.cn>
In-Reply-To: <20220919031250.770285-1-dzm91@hust.edu.cn>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 21 Sep 2022 09:31:44 +0200
Message-ID: <CAMRc=Mcvun8A_R0aQmyvNz1DsvX4O-1quQ4Zqcns9GACoxs+tQ@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: tqmx86: fix uninitialized variable girq
To:     Dongliang Mu <dzm91@hust.edu.cn>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        Dongliang Mu <mudongliangabcd@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 19, 2022 at 5:14 AM Dongliang Mu <dzm91@hust.edu.cn> wrote:
>
> From: Dongliang Mu <mudongliangabcd@gmail.com>
>
> The commit 924610607f19 ("gpio: tpmx86: Move PM device over to
> irq domain") adds a dereference of girq that may be uninitialized.
>
> Fix this by moving irq_domain_set_pm_device into if true branch
> as suggested by Marc Zyngier.
>
> Fixes: 924610607f19 ("gpio: tpmx86: Move PM device over to irq domain")
> Suggested-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
> ---
> v1->v2: modify fix method to moving irq_domain_set_pm_device into
> if true branch as suggested by Marc Zyngier
>  drivers/gpio/gpio-tqmx86.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-tqmx86.c b/drivers/gpio/gpio-tqmx86.c
> index fa4bc7481f9a..e739dcea61b2 100644
> --- a/drivers/gpio/gpio-tqmx86.c
> +++ b/drivers/gpio/gpio-tqmx86.c
> @@ -307,6 +307,8 @@ static int tqmx86_gpio_probe(struct platform_device *pdev)
>                 girq->default_type = IRQ_TYPE_NONE;
>                 girq->handler = handle_simple_irq;
>                 girq->init_valid_mask = tqmx86_init_irq_valid_mask;
> +
> +               irq_domain_set_pm_device(girq->domain, dev);
>         }
>
>         ret = devm_gpiochip_add_data(dev, chip, gpio);
> @@ -315,8 +317,6 @@ static int tqmx86_gpio_probe(struct platform_device *pdev)
>                 goto out_pm_dis;
>         }
>
> -       irq_domain_set_pm_device(girq->domain, dev);
> -
>         dev_info(dev, "GPIO functionality initialized with %d pins\n",
>                  chip->ngpio);
>
> --
> 2.35.1
>

Applied, thanks!

Bart
