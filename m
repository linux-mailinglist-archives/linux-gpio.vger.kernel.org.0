Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21C312A9735
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Nov 2020 14:44:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727525AbgKFNoV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Nov 2020 08:44:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726708AbgKFNoT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Nov 2020 08:44:19 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 035E3C0613D2
        for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2020 05:44:18 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id l28so1963938lfp.10
        for <linux-gpio@vger.kernel.org>; Fri, 06 Nov 2020 05:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wI0GK83QWCQ6vsZdrqG3V91Iy+WDOOvk22jyx24kjEs=;
        b=vMu5Ja7Cwh5pkYnlZwYu3DUXqEgu0S6PWP1gVg9/NM8I2i78iHgFVDYUUy3D4fkvyi
         NSEHeHNe4ptH50Jv2U7T0elNvzPri6+Cg5WK/nkvDE54WSyi4ocd11H8f8tAFWbTscVW
         rvzX1FIT7dot89fLnFf1/dwzFvYYOCzMQqJ9WPq1hPq353dv8HGC+qlJ5tCPKDAuQTM6
         g/iF4D3mFGSTASbTGJK2xMasE+HNybaFg3Yo5hP2RYhVZPL1i9YB4o1x/xvWVkS/Fsty
         A0O6QFFfoa7/cZJEJNohRQfG+ES0UbL6vmdOyEAPvHK7uRAHgC7peo8OLfx+J03mjs7o
         I6Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wI0GK83QWCQ6vsZdrqG3V91Iy+WDOOvk22jyx24kjEs=;
        b=dZ0Hbkna3sks62E0Q89fYok4u6QmH0zMKBSytEhtBmPdKMk/EdcbM0bMBG9ecLA444
         iKe1CHJMkzjegf1GZp+iQFkFaCtMmU0FplHt8gRBulP88XB7DHex4oTBRMvmwgblilB0
         WVR05mntjxaDPGWdNlGXcZdlC02DZz2z/r3/rGzncGW1Z8zlcVsLlB0ubmLrzeHWULtt
         nuKKCvSV6adq7XajfnysYbFm/3o+qHytxHhShANt9d6jnnIyQgZo9BJFAR++KsbY08Km
         HLRr8yEULjQjLckmzzIVyfrJEaLzKDNDTQjDzvvz5/fW4GvIPVtl+kT+prxyaa6dU8cf
         DKBQ==
X-Gm-Message-State: AOAM5301KrPn6VYEJo42qPM283CMoYVyNjeARSFEKxE6sKVlQO1PDK6y
        WdITJNVF8z/yX1cnplYRVeo99f9bJjeFQuLhWyBciA==
X-Google-Smtp-Source: ABdhPJygixdWhUfcyDNsGa2oGSEuadBYn2t4MmXNTxc7g+f0e+S6NHgZXcaPQGNq5wbaXC2ktaBv9Udb+dgkIYzb2Ic=
X-Received: by 2002:a19:7b06:: with SMTP id w6mr1003402lfc.260.1604670256510;
 Fri, 06 Nov 2020 05:44:16 -0800 (PST)
MIME-Version: 1.0
References: <20201101090104.5088-1-paul@crapouillou.net> <20201101090104.5088-2-paul@crapouillou.net>
In-Reply-To: <20201101090104.5088-2-paul@crapouillou.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 6 Nov 2020 14:44:05 +0100
Message-ID: <CACRpkdaZKxGBXXAXUd-gho4bnCRN+9HhX6OEsUG982xSDQgRFw@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: ingenic: Get rid of repetitive data
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Zhou Yanjie <zhouyanjie@wanyeetech.com>, od@zcrc.me,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Nov 1, 2020 at 10:01 AM Paul Cercueil <paul@crapouillou.net> wrote:

> Abuse the pin function pointer to store the pin function value directly,
> when all the pins of a group have the same function value. Now when the
> pointer value is <= 3 (unsigned), the pointer value is used as the pin
> function; otherwise it is used as a regular pointer.
>
> This drastically reduces the number of pin function tables needed, and
> drops .data usage by about 2 KiB. Additionally, the few pin function
> tables that are still around now contain u8 instead of int, since the
> largest number that will be stored is 3.
>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Both patches applied.

Yours,
Linus Walleij
