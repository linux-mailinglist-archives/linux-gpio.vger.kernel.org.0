Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E9324409C9
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Oct 2021 17:00:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230392AbhJ3PCa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 30 Oct 2021 11:02:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230025AbhJ3PCa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 30 Oct 2021 11:02:30 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFA73C061570
        for <linux-gpio@vger.kernel.org>; Sat, 30 Oct 2021 07:59:59 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id m17so47482781edc.12
        for <linux-gpio@vger.kernel.org>; Sat, 30 Oct 2021 07:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4fHDKFq19+ivds85w3oI44nJCYTx/6AsYq2axnfC//o=;
        b=TZF9nvZqDNIE16c/SIG/9Cn+fonb0Gmd42vjCSjwZvY6C2VbSm1TA05fklXo4F47Pz
         jZMEdjEkP4VLmydAerwYR9jp0Eopjcs/LAaeeNNrAsn2pgXb6aOcB22nZz5g1eWnUtfw
         wfnEYlU8oH4eyJpqBCPJ1PF6kTB49ro/zf1rEI7eNpNr8RfnqprkQ4/3iGqrkJjsVwqf
         B47NCUdh24nlCvPGYmsO3YW/AtJ4eJY/pu+ygzwAQmB0CnbIdwh7guCKEppR4Xw6Zxmp
         GCAQog/z+/n0CafJrOz1PlgP6dGZoZNE+xZJOItFI2bVpLSyRzQg4QeqPulcDbiFt2Iv
         rqAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4fHDKFq19+ivds85w3oI44nJCYTx/6AsYq2axnfC//o=;
        b=XWh6E9FoBQNJK6edg8Pmu6dP6v0sURcKDgCPNfh9XRYa2qVuSVv/B/K1sFHduVOxb+
         6ZHOeiflhtHYBJfMpZiNsHssbz4kaSPRPseGN04vrs/brBn5BfSExwocUg7htdv6fuKU
         KtWB8Lzt3x2A7667YlnG05E7/1Beugz2AHssIpFOTzmFIujYVaTwoAIPSFleMrW26Gll
         UoPSTJghvfvfugKsemVBi+sdK5eg6cxYMHETkD0nGE4BK28E8HCdoabC+DvCk/twVu0c
         BUMqmcNW2ZT89XYLAtuffxIr2bqe7rO462UDxoaE3JFTa1NBfAEzCThC/yRr306rDiit
         4X9A==
X-Gm-Message-State: AOAM531yambE158GG/UodjMAEFbbaGdKZIiJjWrEuKk9nTg3WZNxTMBU
        TPqXe+M0SxXiXoIzRIM4q0NKi0YWEaVe507Lq+NwZb4A124=
X-Google-Smtp-Source: ABdhPJz32DHx+UgFJUiIbONKMty/waaJOtSOLYsfna+9n+RCmupK3DjakXLG1+S9RLlDgf3adx9UFwNgOVQKK9q0ziM=
X-Received: by 2002:a17:907:9694:: with SMTP id hd20mr21610066ejc.508.1635605998486;
 Sat, 30 Oct 2021 07:59:58 -0700 (PDT)
MIME-Version: 1.0
References: <20211028085243.34360-1-sander@svanheule.net>
In-Reply-To: <20211028085243.34360-1-sander@svanheule.net>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sat, 30 Oct 2021 16:59:47 +0200
Message-ID: <CAMRc=Mc-HYaw3OMiYr3Wd-LUTnpMB_D6QhCQjKi3xKeQLdeYzw@mail.gmail.com>
Subject: Re: [PATCH] gpio: realtek-otto: fix GPIO line IRQ offset
To:     Sander Vanheule <sander@svanheule.net>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 28, 2021 at 10:52 AM Sander Vanheule <sander@svanheule.net> wrote:
>
> The irqchip uses one domain for all GPIO lines, so the line offset
> should be determined w.r.t. the first line of the first port, not the
> first line of the triggered port.
>
> Fixes: 0d82fb1127fb ("gpio: Add Realtek Otto GPIO support")
> Signed-off-by: Sander Vanheule <sander@svanheule.net>
> ---
>  drivers/gpio/gpio-realtek-otto.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-realtek-otto.c b/drivers/gpio/gpio-realtek-otto.c
> index eeeb39bc171d..bd75401b549d 100644
> --- a/drivers/gpio/gpio-realtek-otto.c
> +++ b/drivers/gpio/gpio-realtek-otto.c
> @@ -205,7 +205,7 @@ static void realtek_gpio_irq_handler(struct irq_desc *desc)
>                 status = realtek_gpio_read_isr(ctrl, lines_done / 8);
>                 port_pin_count = min(gc->ngpio - lines_done, 8U);
>                 for_each_set_bit(offset, &status, port_pin_count)
> -                       generic_handle_domain_irq(gc->irq.domain, offset);
> +                       generic_handle_domain_irq(gc->irq.domain, offset + lines_done);
>         }
>
>         chained_irq_exit(irq_chip, desc);
> --
> 2.31.1
>

I already sent my last fixes PR to Linus yesterday, so I queued it
with other patches for next. It'll get backported anyway to stable
branches.

Bart
