Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F7C29E4D3
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2019 11:50:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729828AbfH0JuM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Aug 2019 05:50:12 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:40758 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729523AbfH0JuL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Aug 2019 05:50:11 -0400
Received: by mail-oi1-f193.google.com with SMTP id h21so14454869oie.7;
        Tue, 27 Aug 2019 02:50:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V3LUrjKhgN4bmIHyy5FlNQA9pDelgHX6YO7hszfV1ZA=;
        b=YHqsgJ+mCyV6PxKjiKUrqoOlZhr57NL0uhiGLncxpVsUlSMs+McYw4qZRivzJFP2d8
         aU5361OM2fUiaYnK+DzwxJ1oHi+LjpjaSZmXP+SAfJkW9vE7CxD62m0lWOZnbevWtWAU
         WPf9yjnipgKzIYNqDI1tMRMbKgCnwhvz/czyDMPiJGWLJMKFIQGMoY3J9ggRzKxLFcFe
         LOTvfVcTuNHATG50SXY9WNviJwrZwcdho9VDfHmesgGOxgB01vsaRSnNFLRk4jtMyVG+
         nUVBmZpsFuYxIdrdsa19dEUcZZoK+cT8qO6dBYaFUCJWAX4iREVg9bTbyXuLBE1F/mos
         1VXw==
X-Gm-Message-State: APjAAAXSz64/3EI/7RSv2AKxOpMRVLhUlv5LrWrjPbMRIv0ul0Rfd8Vt
        a3LQbaBjUBRldQ063ptfISjEPrGCA3vzdK4YZWs=
X-Google-Smtp-Source: APXvYqwogXVloc6dwa2jr7apkDADeM3j8lAESRuN0CRKXZTw2r8dyppswLMDsXZTnVBXjRCQwasyokiNUbcLksAhDHk=
X-Received: by 2002:aca:b154:: with SMTP id a81mr14778184oif.148.1566899410643;
 Tue, 27 Aug 2019 02:50:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190827093927.GB8443@mwanda>
In-Reply-To: <20190827093927.GB8443@mwanda>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 27 Aug 2019 11:49:59 +0200
Message-ID: <CAMuHMdWEXPWhtx12PZwk+6CC_KQm2APmhkZzpobesN5EASaLng@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: Unlock on error in sh_pfc_func_set_mux()
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 27, 2019 at 11:39 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> We need to unlock and enable IRQs before we return on this error path.

Wow, how could we have missed that?!?
Thanks!

> Fixes: 8a0cc47ccc7c ("pinctrl: sh-pfc: Rollback to mux if required when the gpio is freed")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Linus: As we're already past rc6, I don't plan to send another pull
       request for v5.4.
       Hence can you please take this one directly?
       Thanks!

> --- a/drivers/pinctrl/sh-pfc/pinctrl.c
> +++ b/drivers/pinctrl/sh-pfc/pinctrl.c
> @@ -361,8 +361,10 @@ static int sh_pfc_func_set_mux(struct pinctrl_dev *pctldev, unsigned selector,
>                  * This driver cannot manage both gpio and mux when the gpio
>                  * pin is already enabled. So, this function fails.
>                  */
> -               if (cfg->gpio_enabled)
> -                       return -EBUSY;
> +               if (cfg->gpio_enabled) {
> +                       ret = -EBUSY;
> +                       goto done;
> +               }
>
>                 ret = sh_pfc_config_mux(pfc, grp->mux[i], PINMUX_TYPE_FUNCTION);
>                 if (ret < 0)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
