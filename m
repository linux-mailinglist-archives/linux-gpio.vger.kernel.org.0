Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78FB0315150
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Feb 2021 15:13:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231686AbhBIONB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Feb 2021 09:13:01 -0500
Received: from mail-ot1-f44.google.com ([209.85.210.44]:42114 "EHLO
        mail-ot1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230154AbhBIOM4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Feb 2021 09:12:56 -0500
Received: by mail-ot1-f44.google.com with SMTP id q4so7920952otm.9;
        Tue, 09 Feb 2021 06:12:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qUZxHRlnhQ53xeYDDnIj3RkZGBfKRePKk2dnEVhR0QE=;
        b=lc89TU7G7F/P2mWXIO6G+EHQFXzDCPcqwvJS1XHenWtSw6UzhfiiEAU7OL+/5Mqx8Z
         S6Jy1D22SMisdJwjcYyTtmjRqZN1I8o6zPFECeSVha8vCGc8OTfBl4KSJCuDUw0bqKYS
         kh0Eq4+91StEDwImZrgjDO6+ECA0SoCBVbkrgYXqliUEGUS5q37KzbJxCBYoWWXzf+nQ
         b+/6ypLLjn5FCe1md5qbeQpUMH8eYfws16oSx5tHqNRPLiuOaTf0IWn1ubYrC5rc6uBA
         rHWAmueBZuHAjHr9NDvZ2ulxM5j52a+hauMn+hTATFnY2EkUsySs49HBEkddcboPWKaS
         4qdg==
X-Gm-Message-State: AOAM531vg30SI90afglqluhsi2AxXM3bekJ4WGfBs5MGRCpdJCKSOS9b
        X1T0io29LWqLTHy5ZWhLEUtzzR/Plc459ocYnbI=
X-Google-Smtp-Source: ABdhPJzUk409ROxM1slEJZDbOB4ncC7/rhEOYPlVp8VGSdnhIzcAlxHERjzkCkqZ94bwxluaQEDJR//tUQjvKB2ybCY=
X-Received: by 2002:a9d:3604:: with SMTP id w4mr16168933otb.107.1612879935459;
 Tue, 09 Feb 2021 06:12:15 -0800 (PST)
MIME-Version: 1.0
References: <20210207150736.24382-1-alex_luca@163.com>
In-Reply-To: <20210207150736.24382-1-alex_luca@163.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 9 Feb 2021 15:12:03 +0100
Message-ID: <CAMuHMdV445RaAydwgd=Sx6Y+jLJ-PpPSut8wi=Mj-qznYWi84g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas:fix possible null pointer dereference
 struct pinmux_range *
To:     alex_luca@163.com
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Zhang Kun <zhangkun@cdjrlc.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Alex,

Thanks for your patch!

On Sun, Feb 7, 2021 at 4:08 PM <alex_luca@163.com> wrote:
> From: Zhang Kun <zhangkun@cdjrlc.com>
>
> The parameters of  sh_pfc_enum_in_range() pinmux_range *r should be checked
> first for possible null ponter, especially when PINMUX_TYPE_FUNCTION as the
> pinmux_type was passed by sh_pfc_config_mux().

If pinmux_type in sh_pfc_config_mux() is PINMUX_TYPE_FUNCTION or
PINMUX_TYPE_GPIO, range is indeed NULL.
But as the call

    in_range = sh_pfc_enum_in_range(enum_id, range);

is not done in case of these pinmux types, I don't see where the
problem is.  What am I missing?

> Signed-off-by: Zhang Kun <zhangkun@cdjrlc.com>

As you picked up a patch from Zhang, you should add your own SoB here.

> --- a/drivers/pinctrl/renesas/core.c
> +++ b/drivers/pinctrl/renesas/core.c
> @@ -128,6 +128,9 @@ int sh_pfc_get_pin_index(struct sh_pfc *pfc, unsigned int pin)
>
>  static int sh_pfc_enum_in_range(u16 enum_id, const struct pinmux_range *r)
>  {
> +       if (!r)
> +               return 0;
> +
>         if (enum_id < r->begin)
>                 return 0;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
