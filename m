Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E08865B1B6
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Jan 2023 13:02:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232730AbjABMCR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Jan 2023 07:02:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232719AbjABMCE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Jan 2023 07:02:04 -0500
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com [IPv6:2607:f8b0:4864:20::e32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06760125
        for <linux-gpio@vger.kernel.org>; Mon,  2 Jan 2023 04:01:59 -0800 (PST)
Received: by mail-vs1-xe32.google.com with SMTP id s127so14791672vsb.5
        for <linux-gpio@vger.kernel.org>; Mon, 02 Jan 2023 04:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VhOthAFxC6hcqPoBMVHQCGrB41HLTYe9QzI4mQ4bIh4=;
        b=ytE3GGObj9Dbe7E3Iin3KfJyQ04br0cP9ErJfs1DwAWqPXLH1qa6q2wVi7Mu5vZw7f
         Matpjl42k7jNOlYLL5u+566d70q9lmAhKAZprPBIpokHJcIsrWxqrJZkZXrAO4FGq+LP
         hMEgVcyAkLzeQMgqZBMDtaC+bQgunbO9UpmKTCdzEHti0u61H3ICrvNL0KK6T/Jwi2vo
         yBvMWvpPH+D6T+amM4jOywRK9iqknhIXO9VvyMLAPHKJRG2CL3EjbIeWjCPXvPVxFgqV
         dhK/ZJpEo1QC1ZCASaSYZJFHHLnKzEeSZDatFxGPryQHd96y2kIJM61Wp8KQmIKDQpar
         bvcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VhOthAFxC6hcqPoBMVHQCGrB41HLTYe9QzI4mQ4bIh4=;
        b=zx1GPfXPSLdgxzwiDoQJGlgdiL46DAfkYWY3MrFUdn3iP66zVum5cElEBgzHGaXwwX
         Ol5OsjBO4iEWNPGwkXFgvBgMDpFVdBxfuN6uN4LvshnTsPdZZoBWT2ZZu7bBM2EyYhA8
         otxgGgabIbr+MCZhfN+oTPBJjCf+cvczYN7pCoUpKwI98vKedwPfAH30+ux9yJLvLvAW
         VfaeQVZITKRlMzpLxVll28gcLH91OtgKM7RdbKXRp+n+iCg8lfLs5faZ2yGk6Puszrcx
         dzIIspREHaDLjtJwW1eKeb2aZ/TALW6pHwTlRhdwWcORoLXRg9CSNKamK436Ate/++Mo
         q/6w==
X-Gm-Message-State: AFqh2kp7lGVGFtkrw3a5idE7K7JAQzKrZ3UFcnrNBOABVcE55VtEd4sl
        Qw4ewIaDAiW2KDAcOTGrjGRnz6sRAQPPBwjCgVGQwA==
X-Google-Smtp-Source: AMrXdXt+qPLLphRKNSP8tHgCUL9jwISK0BhYe+7qRZsBDoalW6YAZBqaOIUYH+mVNV5t4VP+cMmyW0UR/IEHYT0MgwQ=
X-Received: by 2002:a67:df09:0:b0:3ce:88b3:d7da with SMTP id
 s9-20020a67df09000000b003ce88b3d7damr490644vsk.62.1672660917947; Mon, 02 Jan
 2023 04:01:57 -0800 (PST)
MIME-Version: 1.0
References: <20230102082039.3941790-1-linmq006@gmail.com>
In-Reply-To: <20230102082039.3941790-1-linmq006@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 2 Jan 2023 13:01:47 +0100
Message-ID: <CAMRc=Mcfs0=CKv4YXpg5h+u6aoeLsEAz7PgUPUk5y6RHbKydZg@mail.gmail.com>
Subject: Re: [PATCH] gpio: sifive: Fix refcount leak in sifive_gpio_probe
To:     Miaoqian Lin <linmq006@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Marc Zyngier <maz@kernel.org>,
        Yash Shah <yash.shah@sifive.com>,
        Atish Patra <atishp@atishpatra.org>,
        "Wesley W. Terpstra" <wesley@sifive.com>,
        linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 2, 2023 at 9:20 AM Miaoqian Lin <linmq006@gmail.com> wrote:
>
> of_irq_find_parent() returns a node pointer with refcount incremented,
> We should use of_node_put() on it when not needed anymore.
> Add missing of_node_put() to avoid refcount leak.
>
> Fixes: 96868dce644d ("gpio/sifive: Add GPIO driver for SiFive SoCs")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
>  drivers/gpio/gpio-sifive.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
> index 238f3210970c..bc5660f61c57 100644
> --- a/drivers/gpio/gpio-sifive.c
> +++ b/drivers/gpio/gpio-sifive.c
> @@ -215,6 +215,7 @@ static int sifive_gpio_probe(struct platform_device *pdev)
>                 return -ENODEV;
>         }
>         parent = irq_find_host(irq_parent);
> +       of_node_put(irq_parent);
>         if (!parent) {
>                 dev_err(dev, "no IRQ parent domain\n");
>                 return -ENODEV;
> --
> 2.25.1
>

Good catch, applied!

Bart
