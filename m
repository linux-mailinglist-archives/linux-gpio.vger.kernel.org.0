Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A35EE305CFF
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jan 2021 14:23:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238351AbhA0NXD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jan 2021 08:23:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233033AbhA0NUt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jan 2021 08:20:49 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 985B1C061574;
        Wed, 27 Jan 2021 05:20:08 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id y187so1630447wmd.3;
        Wed, 27 Jan 2021 05:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=yPWKRv9GrknOWoi0+WWcWBO8SWSui1xeocnHbNhYmqc=;
        b=qGCHzSFQWqKUQeA2u+SzdadvcmuxSzHEU+OYN10h+zN1iHgGE/TbVopjxHX6Va+1UO
         oR8f4aCwi7iPagNhwBEdc+7nxxR009a0HlIyN8KDd9/z6eNgBs7strgSzpDRHJaAVlYF
         hdPKneUqNS6smHgIgvpPo9Hv46rBM4+Ef+HqdC3T9gkhGYorYy6zFE0QbV4LOuXo5YjZ
         P6LpbDI+yDkc920mnr2TOQrBcYNtGM+6uTUdtKw73CQOL0Z5ayqXabHUgjQ3KdCNBsPh
         xBgTxUh4V7MR27ILkvsvlh3nFwv8p1LLku3PdeyW4XplPDo8KHYdWyo5gMnJCrR8XbPw
         4baw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=yPWKRv9GrknOWoi0+WWcWBO8SWSui1xeocnHbNhYmqc=;
        b=VhcI0HrHiRuIddZ0LijJuBdpJjiC1xBWF+9WV8RikOCSmrfAANj5PW8dI+6laJ1ad4
         TcS4fF7Mx0bGCsZstRUAGgW7HRVcJ1zw53m1M4DQ7efqMTFtstMqfzUUdf/62e6zbMXS
         UwxiHDbwpOchMn3zIm66T0TSU1jTft0l/NaFz2qZNYrI7c9HOLVVF+8WCq4JbpAunxSy
         q3LTqM3FIQixUHTfOdV+3+m0YskYzkp3LYz61PxeJENmwgiwoBmn7QYfmi9l7v/zrCyO
         Ql9YBjh3HHjmaydJwaemXPKJ2d50PwPBRh/zOtKLmanZ2a447IKCHnWaLiDjCejYDHiO
         6JSg==
X-Gm-Message-State: AOAM533wjf6mEGRZxIfLm7hhlqNdZi99xj1ZT/abX4B4t6TwUTblLfUZ
        gfLATexTPTf4wpfzw7vZX8M=
X-Google-Smtp-Source: ABdhPJyWvkH/VrWnONhdA+0B+w9mXaRcLeVQtBC3fU4GW+AJd2Bz40qRXrs3jMv9eS/X+hfvQuxcXA==
X-Received: by 2002:a1c:68c5:: with SMTP id d188mr4378988wmc.64.1611753607360;
        Wed, 27 Jan 2021 05:20:07 -0800 (PST)
Received: from [192.168.1.21] ([195.245.17.255])
        by smtp.gmail.com with ESMTPSA id k15sm2549242wmj.6.2021.01.27.05.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 05:20:06 -0800 (PST)
Message-ID: <3470feebc41ee2c05bb7e71760f2b97a45ce71d7.camel@gmail.com>
Subject: Re: [PATCH v2 5/9] gpio: ep93xx: Fix typo s/hierarchial/hierarchical
From:   Alexander Sverdlin <alexander.sverdlin@gmail.com>
To:     Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Wed, 27 Jan 2021 14:20:05 +0100
In-Reply-To: <20210127104617.1173-6-nikita.shubin@maquefel.me>
References: <20201228150052.2633-1-nikita.shubin@maquefel.me>
         <20210127104617.1173-1-nikita.shubin@maquefel.me>
         <20210127104617.1173-6-nikita.shubin@maquefel.me>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi!

On Wed, 2021-01-27 at 13:46 +0300, Nikita Shubin wrote:
> Fix typo in comment.
> 
> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>

Acked-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> ---
>  drivers/gpio/gpio-ep93xx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
> index dee19372ebbd..8f66e3ca0cfb 100644
> --- a/drivers/gpio/gpio-ep93xx.c
> +++ b/drivers/gpio/gpio-ep93xx.c
> @@ -402,7 +402,7 @@ static int ep93xx_gpio_add_bank(struct gpio_chip
> *gc,
>  
>                 /*
>                  * FIXME: convert this to use hierarchical IRQ
> support!
> -                * this requires fixing the root irqchip to be
> hierarchial.
> +                * this requires fixing the root irqchip to be
> hierarchical.
>                  */
>                 girq->parent_handler = ep93xx_gpio_f_irq_handler;
>                 girq->num_parents = 8;

-- 
Alexander Sverdlin.


