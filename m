Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B54F22D0DDD
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Dec 2020 11:18:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726418AbgLGKSW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Dec 2020 05:18:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725802AbgLGKSV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Dec 2020 05:18:21 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD866C0613D1;
        Mon,  7 Dec 2020 02:17:41 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id w4so8472473pgg.13;
        Mon, 07 Dec 2020 02:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=szht+q557K6QXYFXak80NbTgGz6XROzE5Ko0mOeRIdw=;
        b=QGLYL/hY/ySDQqquUqATa57X9iZKoJ1oZeCdqFTuCFGLPs6+LSt5T6wuFDp/gLRUKg
         4bZcVB3HXmtx7NJkXKCnH/iMgHsHUfKRMeAJkBqKUaoo7mOQPRBZymdIlz75HM+oW4KC
         7WsfDIv5qIDRkZbc9/HmUhA6lB+O868Stkxe+qau/c+Ks4aATFO+tqX9yzSKo/SvaB2X
         JPB7YXp/tUj8eGjh9kH9jJN0dCt52TsfozvS5AAkg09XYaMc91lFnJ4x0OIZfpo9b7cO
         gHuPmf1QfXFENDBMpBUYyaHoVWqmS38E7OqPPtcU46heVqaITq7osc+NZLSxR6euxHin
         2uqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=szht+q557K6QXYFXak80NbTgGz6XROzE5Ko0mOeRIdw=;
        b=eiLBvYMsSTvUvTeEYRda+bIqR9C6BufI7GDP4+4++1MFNc4qBRkItbJtT9zg5NEUjl
         sDoV7MurqCuq0cOZeAd5VLCucVOc3VMg/nmcG+hJk4TO9oeis0elP7KPhZgIQwuD968Z
         +fkgFwUtdAw0GOJUsNVRDJKpxoWP3f2pRwU1x7mx9lr401nKxeD2i7igf2cBdSO+d2qx
         dclVOgQDn7a5887TNOz04Xa9Nl+fuAfqhzrOiCdHWyKK2/3JmIM05JXq2b9bs0ZGP0A+
         yFFcL0XGU9XekIVofG/Uvp64yNTpS9qP/3KdqeTAikbX6nhT9fP/2lGJbiKfdRwmyaOq
         r6ng==
X-Gm-Message-State: AOAM530uj4IvGdVRTyGwP1IS20ii/xqDAGzJ/IkUyyF5gYtlP43kmZRo
        vquc9zK7sFYewzBrhVwPk/kiMgVKF+ibGtCb8i2sAUwZGWQ=
X-Google-Smtp-Source: ABdhPJzNPheYkcqjCTxjnzfr8Z04g6FUo9B9zhpTBRJtKnCdXL0ko5vzAVHOrSXMNCyS6Xn64kSx7RF818+ol+aiJe8=
X-Received: by 2002:a17:902:c244:b029:da:e63c:cede with SMTP id
 4-20020a170902c244b02900dae63ccedemr8008417plg.0.1607336261018; Mon, 07 Dec
 2020 02:17:41 -0800 (PST)
MIME-Version: 1.0
References: <tencent_220963AF059847E1171B4AB9@qq.com> <CACRpkdbvKWcD04SLLBOBuZWzN64xpVv1nfCXZGcSp9cs0MPivQ@mail.gmail.com>
 <1jeek5ps3b.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jeek5ps3b.fsf@starbuckisacylon.baylibre.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 7 Dec 2020 12:18:29 +0200
Message-ID: <CAHp75VeQGxnGO4o5a1vFzS9XAMjmvwoJ3=pWLvNQT6mXEKcqWQ@mail.gmail.com>
Subject: Re: 0001-add-amlogic-gpio-to-irq
To:     Jerome Brunet <jbrunet@baylibre.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?B?5p6X5Zyj5qyi?= <linshenghuan@hangtu-china.com>,
        khilman <khilman@baylibre.com>,
        narmstrong <narmstrong@baylibre.com>,
        "martin.blumenstingl" <martin.blumenstingl@googlemail.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-amlogic <linux-amlogic@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 4, 2020 at 4:25 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
> On Fri 04 Dec 2020 at 10:13, Linus Walleij <linus.walleij@linaro.org> wrote:

> This HW only has 8 irqs that can each be mapped to a pin. No direct
> translation can be made, we have to allocate an irq to monitor the line.
> So when gpio_to_irq() was called, we had to do that allocation dynamically
> to return a valid irq number. Since there was no counter part to
> gpio_to_irq(), those allocation cannot be freed during the lifetime of
> the device.

I'm not sure why we are talking about legacy API which should not be used.
Besides that I didn't get what you meant under counterpart API (IRQ
descriptor has a mapping to the IRQ chip which keeps the mapping to
whatever hardware wants).

--
With Best Regards,
Andy Shevchenko
