Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C552F271C65
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Sep 2020 09:56:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726236AbgIUH4H (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Sep 2020 03:56:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726211AbgIUH4H (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Sep 2020 03:56:07 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF246C061755;
        Mon, 21 Sep 2020 00:56:07 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id t7so7016196pjd.3;
        Mon, 21 Sep 2020 00:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T7+i07av2Kp0AYojRvT3bM7gQAzDtecfEwK/S1JJ4xw=;
        b=Qh1UuoMiJnVW2fV9zmTR0PpnA3fM0ZE64dzx/H7jhi7uTmSwnoXvM/gSvp+Kt2gO0A
         KXF/bGpNc94/tmMnFm/WVajwguTIvZLfY0g6PBLXoK1emfc9mhCgB05iYrKJQB1zqJLf
         WHN/dcuQ+gp7a9tuwnGu+KdWgS0APZsy8P1WDzKlr4dN26/6ZIjW3taz1vJzy0tpy6dQ
         lRaddMjS+DWofD1seys+6/RYWIoNMqDiqMdE/ZXAGunObo7qPfZ7F6EcaFaDaa82YRAw
         DtMBktkHg7oR09X0CaIMIpSiopgEpxefrXNwRW+ukkIrWdM8TkBBSyiL6as3o09zxtlM
         7jOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T7+i07av2Kp0AYojRvT3bM7gQAzDtecfEwK/S1JJ4xw=;
        b=m9hpZ62BpBibqnLRhUyKWbI8/tZDecWE+b4yx037wMllQTlhgLVXTAbr6v+mVtWJ8/
         ybbgCIbSOl64k6TDk24ZjZwDvQwjH+IjQMByF0vt3AlaXVax71X2ajbz1LZ/JXtKvGa1
         IDuAoj3uG8t4+4NAeEyNtjSldbhKPbrE1Z/BvytaGIBfNqLmN7J4VBbs8r1hkA/eNR9m
         6up5OltOAw+lw5EzgXAotFin7aKLcbjaTFV+jx0vqr1BoMrqkbAzBsKYjNVokROUiNH2
         mrWnqGDD8Q+4A80TbcK4nD8H2BfJPf5avlrK+0ApGx7zLq/LRqaMYfRjRJ/fEOBaMJi8
         AyoA==
X-Gm-Message-State: AOAM533CsI+8Dwd25MtLcpwONcjrpC/660g84cMrhca4HSMjyUUQHQ6g
        9/bdmln6NgZdh+0obpAkNOE03wMRMXuBeqKuz54=
X-Google-Smtp-Source: ABdhPJx8XUpLVAaARP529JXm5TQso6onWukSFagB2XwrBqGkIHg5wLS2iOsQE/xZ9Fs/NQwe4veuN1flF9Jg+jo2vWY=
X-Received: by 2002:a17:90b:fc4:: with SMTP id gd4mr24244021pjb.129.1600674967135;
 Mon, 21 Sep 2020 00:56:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200920203207.25696-1-lists@wildgooses.com>
In-Reply-To: <20200920203207.25696-1-lists@wildgooses.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 21 Sep 2020 10:55:49 +0300
Message-ID: <CAHp75Vd2uz-QrEFshUr=e719VBX2zYzvOhVC07BpHfvi0WDgOA@mail.gmail.com>
Subject: Re: [PATCH] gpio: gpio-amd-fch: Fix typo on define of AMD_FCH_GPIO_REG_GPIO55_DEVSLP0
To:     Ed Wildgoose <lists@wildgooses.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Florian Eckert <fe@dev.tdt.de>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Sep 20, 2020 at 11:33 PM Ed Wildgoose <lists@wildgooses.com> wrote:
>
> Schematics show that the GPIO number is 55 (not 59). Trivial typo.

Does it still DEVSLP0? Perhaps you need to drop that part as well.

...

>  #define APU2_GPIO_REG_LED3             AMD_FCH_GPIO_REG_GPIO59_DEVSLP1
>  #define APU2_GPIO_REG_MODESW           AMD_FCH_GPIO_REG_GPIO32_GE1
>  #define APU2_GPIO_REG_SIMSWAP          AMD_FCH_GPIO_REG_GPIO33_GE2
> -#define APU2_GPIO_REG_MPCIE2           AMD_FCH_GPIO_REG_GPIO59_DEVSLP0
> +#define APU2_GPIO_REG_MPCIE2           AMD_FCH_GPIO_REG_GPIO55_DEVSLP0
>  #define APU2_GPIO_REG_MPCIE3           AMD_FCH_GPIO_REG_GPIO51
>
>  /* Order in which the GPIO lines are defined in the register list */
> diff --git a/include/linux/platform_data/gpio/gpio-amd-fch.h b/include/linux/platform_data/gpio/gpio-amd-fch.h
> index 9e46678ed..255d51c9d 100644
> --- a/include/linux/platform_data/gpio/gpio-amd-fch.h
> +++ b/include/linux/platform_data/gpio/gpio-amd-fch.h
> @@ -19,7 +19,7 @@
>  #define AMD_FCH_GPIO_REG_GPIO49                0x40
>  #define AMD_FCH_GPIO_REG_GPIO50                0x41
>  #define AMD_FCH_GPIO_REG_GPIO51                0x42
> -#define AMD_FCH_GPIO_REG_GPIO59_DEVSLP0        0x43
> +#define AMD_FCH_GPIO_REG_GPIO55_DEVSLP0        0x43
>  #define AMD_FCH_GPIO_REG_GPIO57                0x44
>  #define AMD_FCH_GPIO_REG_GPIO58                0x45
>  #define AMD_FCH_GPIO_REG_GPIO59_DEVSLP1        0x46


-- 
With Best Regards,
Andy Shevchenko
