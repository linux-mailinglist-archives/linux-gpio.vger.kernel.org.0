Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60F9767B2A0
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jan 2023 13:34:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235480AbjAYMeU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 Jan 2023 07:34:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235467AbjAYMeT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Jan 2023 07:34:19 -0500
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB7553CE13
        for <linux-gpio@vger.kernel.org>; Wed, 25 Jan 2023 04:34:15 -0800 (PST)
Received: by mail-vs1-xe30.google.com with SMTP id d66so19580893vsd.9
        for <linux-gpio@vger.kernel.org>; Wed, 25 Jan 2023 04:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5bOrXcdjtCozj+PW8Ndhj/SYcZhP25blVMwvnkfoTOY=;
        b=Z1j9usIG64hqCal/ZfNqN3n8PzTozFH56ZJtWMWJ5sVE3hWpa7UgZ/u8C1ks2fsUZT
         pv3azAyB5dq1VkUmZgrPTW/tH7uubeAXDVu21li7i/t/26j2/CTRYXHPJsyxyagurtbD
         uj7/Tlz9mfhCiDrsJ2/bb7SjssvuAiE/Si7+mcqnMU0WqHy7kCDyDWADZX+DjDmL9kBg
         XxBkq0NeOYcGBmeEYPuTwPb2/2Icu/jVSkHzBUL6HsYjhzIZ2WlNfRqeX2FVn35ikUgu
         IvedEmTHf5pEEgpACGqA3nRLJDjoYM4I5C15NC5ZoI8kBzCJAiiRHfLby0AgtdBDvsSy
         EqbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5bOrXcdjtCozj+PW8Ndhj/SYcZhP25blVMwvnkfoTOY=;
        b=nxjcYoqbJu76ZmL2Se4eN6C9qp+DGl1S+JLWQQrc3crwj2Ii9jJ+pQe64gNmuwvNmx
         jxsjaCtCPVLCYp4zGsar/Rwnn+K1JzgZPTgPoXTY4tZCvGtsEu2OjFPv2JnnJ7ai5Squ
         f1igG0Emkw1/B7WIMULoAPQV2D2Th4yMzG47B0h8hYj2Z2H2g6xCtK880EMmDaK1b6YU
         gGUoh7fv3SOXlyYuamlxPk8lcU6fHf2oVMZmaq2cAvMZxcVWIcZAOsPvL7DQDjSmreWb
         Hkm+r9rd1e6Jc56Eg1J8BX5UybWhH2DV7K6utKWshg5RoIQXri5K4mk5iRZOgGIofLX5
         befw==
X-Gm-Message-State: AFqh2kok8gzrIxFhI9eY4QR0rCWjzI9mO0PYScVmzCtJoGxvQNFoY5Nc
        lL1WRDfAlcGS9OOAjNIytrPILRkSp/yOOoFuSVLVAkFhPBOEug==
X-Google-Smtp-Source: AMrXdXsg/wvDshSZaVh/V6EaB/fpyxc5d4i8CsP7oKTMXUJUdVja3WxMv8+O9CSxgmtY1s5cSxtzr4b3x2T6UVAhhvg=
X-Received: by 2002:a67:f2da:0:b0:3d3:d90c:5ef2 with SMTP id
 a26-20020a67f2da000000b003d3d90c5ef2mr5181117vsn.17.1674650053542; Wed, 25
 Jan 2023 04:34:13 -0800 (PST)
MIME-Version: 1.0
References: <Y8/3OlSVCK/0wQRj@kili>
In-Reply-To: <Y8/3OlSVCK/0wQRj@kili>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 25 Jan 2023 13:34:02 +0100
Message-ID: <CAMRc=MfpFwwsL3ZuXmBTAEYH9qgMWQqzsxLYcQOqvfM+F7nAwg@mail.gmail.com>
Subject: Re: [PATCH] gpio: mxc: Unlock on error path in mxc_flip_edge()
To:     Dan Carpenter <error27@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Marek Vasut <marex@denx.de>, Marc Zyngier <maz@kernel.org>,
        linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 24, 2023 at 4:20 PM Dan Carpenter <error27@gmail.com> wrote:
>
> We recently added locking to this function but one error path was
> over looked.  Drop the lock before returning.
>
> Fixes: e5464277625c ("gpio: mxc: Protect GPIO irqchip RMW with bgpio spinlock")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
>  drivers/gpio/gpio-mxc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index 6f673b2f2a1b..9d0cec4b82a3 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
> @@ -249,10 +249,11 @@ static void mxc_flip_edge(struct mxc_gpio_port *port, u32 gpio)
>         } else {
>                 pr_err("mxc: invalid configuration for GPIO %d: %x\n",
>                        gpio, edge);
> -               return;
> +               goto unlock;
>         }
>         writel(val | (edge << (bit << 1)), reg);
>
> +unlock:
>         raw_spin_unlock_irqrestore(&port->gc.bgpio_lock, flags);
>  }
>
> --
> 2.35.1
>

Queued for fixes, thanks!

Bart
