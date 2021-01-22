Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4ABC630025B
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Jan 2021 13:04:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727784AbhAVMDA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Jan 2021 07:03:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727761AbhAVMCn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Jan 2021 07:02:43 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE5D9C0613D6
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jan 2021 04:01:47 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id dj23so6206290edb.13
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jan 2021 04:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=76XAQLjYp4/l6JVo8xe1tat3k9QKAY+NMahcZfV1bnI=;
        b=YRkhemeGaYC6FYYICUIrL6gB1mTpY4EJMbeydMD9GrKeM5ekJ0P09/iQnxiaTovMUD
         qgZo8+sufkEqfzEhqwjCcTFN2HiY4xq6670L60amFZqKN2Z9Q0pSA6VVKYTqbtPRCAfp
         E2D1wgLer74QW8xNsxf/fp8bRmvW+qXFexfdxlFCYuG2e2ZpciXL9n30oTZqppxaPKHe
         U4q5BB17GnEOifT2eLjkZ/4AwIPylxpAvnmIoKW2xwkY/HE4iZbUinsGrcyYUI71ZE20
         y4hTPbhTw7vZsAp06jYG/mQ0Yc98YWHs0633bSeT9GnbTJtCLT7J/e5vX+Zb2hcqN03V
         ij4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=76XAQLjYp4/l6JVo8xe1tat3k9QKAY+NMahcZfV1bnI=;
        b=sBoA4yXDVw5Dq7AIHb+HojXZMHLb3qo4FTKAGQX4Gq9Eaq2Nyy8pEfzbJ77cn9JCgW
         5KWupyKT2BkoxJFkgeyCifwIqBtDhhjIR+ItYznCDYWClrz9cuieC7FhMAHmuX57H/BK
         ZFruA9o9WaV/0z5fnVov4axaALJUrentnIoE8hrrqyl7AL6kQOj+Svrv0HZIk7Vgt25i
         N7R0oBklsOAbKTCwPNWtB8FvEXdzr2moXhdrhJ8gYdVmux+26WrOdo4bKxWYcDhnx8hs
         jzjj1qQbmvRXFdSRNydnvEByZ6d2Gqpb95cpxH408KAO7CqnaoSWy2Muccx1cCAWETy2
         jbgQ==
X-Gm-Message-State: AOAM5329RBPKvKw6bgqlD/yxw2iPHklmVqfo6DLAa3CcD+vO3+9AGypx
        5zAV0EyRjW1No798WSYQApXQIC+DMDWxijztDvdApw==
X-Google-Smtp-Source: ABdhPJy6U/oplB3yHGLEGbQjagX19d98cRS+pxz32AjDJz3QBvjL4wT4mZjaUhkLYj7ERy03Qr29D3saozXt1ZE1y1s=
X-Received: by 2002:aa7:d401:: with SMTP id z1mr2894918edq.213.1611316906615;
 Fri, 22 Jan 2021 04:01:46 -0800 (PST)
MIME-Version: 1.0
References: <20210108092345.19164-1-zhengyongjun3@huawei.com>
In-Reply-To: <20210108092345.19164-1-zhengyongjun3@huawei.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 22 Jan 2021 13:01:35 +0100
Message-ID: <CAMpxmJUsFq9sXwTvdNFKet4VAdPSsHD7fuHZoAQh00OSUTVKpA@mail.gmail.com>
Subject: Re: [PATCH v2 -next] gpio: vx855: convert comma to semicolon
To:     Zheng Yongjun <zhengyongjun3@huawei.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 8, 2021 at 10:23 AM Zheng Yongjun <zhengyongjun3@huawei.com> wrote:
>
> Replace a comma between expression statements by a semicolon.
>
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
> ---
>  drivers/gpio/gpio-vx855.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-vx855.c b/drivers/gpio/gpio-vx855.c
> index 3bf397b8dfbc..69713fd5485b 100644
> --- a/drivers/gpio/gpio-vx855.c
> +++ b/drivers/gpio/gpio-vx855.c
> @@ -216,7 +216,7 @@ static void vx855gpio_gpio_setup(struct vx855_gpio *vg)
>         c->direction_output = vx855gpio_direction_output;
>         c->get = vx855gpio_get;
>         c->set = vx855gpio_set;
> -       c->set_config = vx855gpio_set_config,
> +       c->set_config = vx855gpio_set_config;
>         c->dbg_show = NULL;
>         c->base = 0;
>         c->ngpio = NR_VX855_GP;
> --
> 2.22.0
>

Applied, thanks!

Bartosz
