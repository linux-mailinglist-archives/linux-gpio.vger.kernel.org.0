Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04AEB3D7955
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jul 2021 17:07:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232768AbhG0PH2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Jul 2021 11:07:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232664AbhG0PH2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Jul 2021 11:07:28 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53C64C061757;
        Tue, 27 Jul 2021 08:07:27 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id d1so8832057pll.1;
        Tue, 27 Jul 2021 08:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SFPWRsBessI+C9A47e+jOKwjdtCBRVE7ojNBrgtRRQs=;
        b=vFv+2UEuu0TefhL/ybmptdduhNtvMDc00WpxRrumKzv97wK5uXw2CCWyZ4gUWk79MP
         DYhDfqEX9rjwjOzSR0ABsgkdflAO7adZxPBH82riXfTt1oJkvtD8zJ4VNknWenrmFEt4
         G3QjuUdHfPuUhIqfx8idz6idSzOnmLT563HdzZ23do8DCNP5IXdQ/SV9SWEEieea9dOL
         eyTSuD2VE5NEykQy+OlIUjctlwZh2xZMIJ6++6+wtHrpM0wc4b/h/aVm+UeQAZGfmneO
         cICUTywIWlcIlTA3krSQHUtNe9AP9LviUfxf3TlQne/M76F8nhl2yXn2TBJk12IrF9jW
         tvxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SFPWRsBessI+C9A47e+jOKwjdtCBRVE7ojNBrgtRRQs=;
        b=SwJ5L7D5I9sns8/2taiUali82DLl957pA4cGocHEO2LoBM7wHc0IdWm9wzIDxbl5yQ
         EG0L/Z1R2id7VTbZlTpINYOE51bpFXApeQhc/wK5LL3TxAQ9VYi6VJ3Ez1Z6MLx8lDxw
         +ailXxRgoVr8h2j32r0gz00Wd46tRG/qIRZZ4KV9s5d4caInGwnwFtLMLhPCKeT3sNAO
         qv+AdoZ8Do1FTrNlXlTXjsJQK0u2/uh9kF7oUDZuVyJUxZnsHYGiBW2wZq6BvubgAp8t
         bakrl+KRiwk4FkO0G9NhxhfwWM2tuvZa8+yhRlnKdEn+ABAInPfyT2GItg3SUsjhe0mP
         qlsg==
X-Gm-Message-State: AOAM531k6x92hJYEGqadqF+Wvi12FRJjb4KpbV1PTjqxo6dwzr35d9pm
        TR4uSC5Ak7PU4e58Ggt9Z97F5PfdHbvqtk559V8=
X-Google-Smtp-Source: ABdhPJztF4Qu9JwX9iY36Arxz8F+6mqILV4X/VEkgiaKRNWT1zKJDz5JUj8mkGx3XISB+nPEJ7E+UcHd3j9GI7ugevo=
X-Received: by 2002:a63:cf0a:: with SMTP id j10mr24257388pgg.4.1627398446910;
 Tue, 27 Jul 2021 08:07:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210727144816.8697-1-sergio.paracuellos@gmail.com> <20210727144816.8697-4-sergio.paracuellos@gmail.com>
In-Reply-To: <20210727144816.8697-4-sergio.paracuellos@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 27 Jul 2021 18:06:47 +0300
Message-ID: <CAHp75Ve9eYNbs=uBsVvFdkpU1vLXB8Fy4NpFbaWV1g59vfrenw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] gpio: brcmstb: remove custom 'brcmstb_gpio_set_names'
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        gregory.0xf0@gmail.com,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>,
        John Thomson <git@johnthomson.fastmail.com.au>,
        NeilBrown <neil@brown.name>,
        Nicholas Mc Guire <hofrat@osadl.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 27, 2021 at 5:48 PM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
>
> Gpiolib core code has been updated to support setting
> friendly names through properly 'gpio-line-names'.
> Instead of redefine behaviour here to skip the core
> to be executed, just properly assign the desired offset
> per bank to get in the core the expected behaviour.

Since it will be a v3, reflow commit messages to occupy a little bit
more available space (per line). Something ~72-75 characters per line
is good balance.

-- 
With Best Regards,
Andy Shevchenko
