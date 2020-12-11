Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97FD12D6E00
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Dec 2020 03:11:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389837AbgLKCKg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Dec 2020 21:10:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389853AbgLKCKU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2020 21:10:20 -0500
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6810EC0613D6
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2020 18:09:40 -0800 (PST)
Received: by mail-pl1-x642.google.com with SMTP id p6so3819368plo.6
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2020 18:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=yVFozMuS5TpszRtC1MBvI/trOQ0D1L3gHa0W/ax0oOA=;
        b=k8FJa4VDPQKIdEmftoL3n6FUAM5QMAocbXYJ/7Soloen2phJ6pJB4fzg50cLxSiXxU
         4YUNAzAtglKo3O4Z41JfsSrtx1lyK5pJRXjCl4l2lgOP70ydco3CHVlneuIgbiyFo+To
         PlmwRhOL88+KOSgfDt8GPZyrwDUKhG1mQUy5PBKZGoxAYEvC+F50Fh+jdgTyhqAbnN9D
         ffGC9tqXaDiOwCzG7YTn7PJPpgElYpp1wJ4akk5JB+Mui9sjz5VSzsAmGcUzKeZiT7ED
         MAKx/bcYm1XSz+GvNPFj8sXXCGs6X7RwxxThYThNLPOJgEkMq01lBQGTimEdnq2ia6Q6
         OwtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=yVFozMuS5TpszRtC1MBvI/trOQ0D1L3gHa0W/ax0oOA=;
        b=P8qDTs6U+nmebtvIh1CoO2ObzKnmRYfp4FaWG6uGFmgs+CMfCZcT2AFp+AvC95dpbI
         F//RECuDoyJuTbFubxgZcZDiofrmUpvTeUeQov2antOrRaI9AgvO7f66YZw3mYrWgzsl
         K7qYIq8fxNF1h23xpBPh0W7cS3QxC6wFYmSd9dz2ecqmFOXuDBQzm0iSr+0vrfY5fPTq
         MgIhCLBkkazOtbuhx4DZ34CY/5chS0DQ/a9+bmN/xYO7g5VfOTwY47WQhulTF5X7ZQQo
         cROwHH0QHSNybnJhKWsWKil+9LGTa8AhIAq7ya2v6CQhg4x7QTt2h2j/NkN+PSSCJ8oE
         glXw==
X-Gm-Message-State: AOAM531ZR+uoBPtv3DvFNJUXNqINdUvHZrrmTZZsQ9hNq1cI6x//PhDG
        cVqujd1MBLGu5wNlG5gmmbGKCw==
X-Google-Smtp-Source: ABdhPJw58HhmM/mjbuMOx2SsgiglRfhjytbaRsij/nVyvfyVpwwnqcvH6Tb/NnFTINsd934ZwIz2Bw==
X-Received: by 2002:a17:902:ed14:b029:da:9da4:3091 with SMTP id b20-20020a170902ed14b02900da9da43091mr8810178pld.29.1607652579869;
        Thu, 10 Dec 2020 18:09:39 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id u11sm7868211pjy.17.2020.12.10.18.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 18:09:39 -0800 (PST)
Date:   Thu, 10 Dec 2020 18:09:39 -0800 (PST)
X-Google-Original-Date: Thu, 10 Dec 2020 17:59:16 PST (-0800)
Subject:     Re: [PATCH v8 01/22] riscv: Fix kernel time_init()
In-Reply-To: <20201210140313.258739-2-damien.lemoal@wdc.com>
CC:     linux-riscv@lists.infradead.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, sboyd@kernel.org,
        linux-clk@vger.kernel.org, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, p.zabel@pengutronix.de,
        seanga2@gmail.com
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     Damien Le Moal <Damien.LeMoal@wdc.com>
Message-ID: <mhng-755e4570-fc57-48b7-9ca9-e032c5de0dc1@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 10 Dec 2020 06:02:52 PST (-0800), Damien Le Moal wrote:
> If of_clk_init() is not called in time_init(), clock providers defined
> in the system device tree are not initialized, resulting in failures for
> other devices to initialize due to missing clocks.
> Similarly to other architectures and to the default kernel time_init()
> implementation, call of_clk_init() before executing timer_probe() in
> time_init().
>
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> ---
>  arch/riscv/kernel/time.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/riscv/kernel/time.c b/arch/riscv/kernel/time.c
> index 4d3a1048ad8b..8a5cf99c0776 100644
> --- a/arch/riscv/kernel/time.c
> +++ b/arch/riscv/kernel/time.c
> @@ -4,6 +4,7 @@
>   * Copyright (C) 2017 SiFive
>   */
>
> +#include <linux/of_clk.h>
>  #include <linux/clocksource.h>
>  #include <linux/delay.h>
>  #include <asm/sbi.h>
> @@ -24,6 +25,8 @@ void __init time_init(void)
>  	riscv_timebase = prop;
>
>  	lpj_fine = riscv_timebase / HZ;
> +
> +	of_clk_init(NULL);
>  	timer_probe();
>  }

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
