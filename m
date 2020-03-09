Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F209617DB3F
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Mar 2020 09:40:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726461AbgCIIk3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Mar 2020 04:40:29 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:45630 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726546AbgCIIk3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Mar 2020 04:40:29 -0400
Received: by mail-lf1-f68.google.com with SMTP id b13so6913451lfb.12
        for <linux-gpio@vger.kernel.org>; Mon, 09 Mar 2020 01:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3xc6nYtcHeI3nUAsvlwvFDVldekJcu/6WJf1MOERlR0=;
        b=v6Du+XE2GP9xbhFGeBO9ublYzQJf3LEBVbe870Gyqu/sY4rq8tzhco5JlqK3bALfQt
         /+hi0cyj+AeqwYX9Y+AeBJ9MRrXh0otFjtj5zxhgbmSdimAuqgX0kjB7D7qv05stIR7d
         DvmVxhe6V8UkGisPuv5HnX93Ff27WzDD0EtmcDnURUibU7el2nhJjqkPsYIHL4VQ0FfO
         la2KXPRKzQME0KRed1LiwQR2ADZJuos95PowFqQ9Msp79PSb++COj8bWj1/KmTjca6gE
         ZFi1iSBphRwPn5nisIV/8DVeFTgumPclS5pFES30c0i9RYqa5PA0tNPzWBWmPYBym6Gt
         Y7rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3xc6nYtcHeI3nUAsvlwvFDVldekJcu/6WJf1MOERlR0=;
        b=EAQ58T1WsYT3vzbeiUjniXyvOtliA06GVktDWmjhR67WsZj/mDlM2ZnlC5H+/nqoDh
         hcTgKLFHNwj84nDz5d5vGhKzEs7C0tLkMWle+3pk3IuLw0vGHhgUgd55uLeKTItEI6Rp
         p/jzAshNlxgiszUv/Vf6R5NQOXgN2pkOfKnYTMdHEc/Upwboax8PiEB7Bn9xPwQ7yKDC
         Ww1Wpc76gtqgGQ99VITQQVfEhvI3IYFpb/V8Ee046iwXj1cCNkT8/lzAj8ovzpy8bNjX
         LJwp0F/CeDZWfvhz3KNxurs8nPldsQaJ/oT/H1be9tDD6bMgdPRAIgBlevxultNcGTBa
         fO9g==
X-Gm-Message-State: ANhLgQ1tR0sJeQ4MJ6o5Ptp5jyHoQ1etoEg660KXotnm+mKslMYWTLXe
        R9yMzmS1Q+fxD4Dc5hfLEtClVYWjwy+P8Z+0LDEGsQ==
X-Google-Smtp-Source: ADFU+vtZiOyVpvvPchK/T5MCGbWLAw4L5MXXvowEbUSL8myExRrfels5CQayMDoYi5Vk2nhEjFDJZQQtZW7VJFPtxW4=
X-Received: by 2002:ac2:4a84:: with SMTP id l4mr8633887lfp.217.1583743226344;
 Mon, 09 Mar 2020 01:40:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200302111225.6641-1-hdegoede@redhat.com>
In-Reply-To: <20200302111225.6641-1-hdegoede@redhat.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 9 Mar 2020 09:40:15 +0100
Message-ID: <CACRpkdYdCXHd8EwmkyYbDjH8BD+8zGtzix5LOuyKZ94OLPJN_Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] gpiolib: acpi: Correct comment for HP x2 10
 honor_wakeup quirk
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Marc Lehmann <schmorp@schmorp.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 2, 2020 at 12:12 PM Hans de Goede <hdegoede@redhat.com> wrote:

> Commit aa23ca3d98f7 ("gpiolib: acpi: Add honor_wakeup module-option +
> quirk mechanism") added a quirk for some models of the HP x2 10 series.
>
> There are 2 issues with the comment describing the quirk:
> 1) The comment claims the DMI quirk applies to all Cherry Trail based HP x2
>    10 models. In the mean time I have learned that there are at least 3
>    models of the HP x2 10 models:
>
>    Bay Trail SoC + AXP288 PMIC
>    Cherry Trail SoC + AXP288 PMIC
>    Cherry Trail SoC + TI PMIC
>
>    And this quirk's DMI matches only match the Cherry Trail SoC + TI PMIC
>    SoC, which is good because we want a slightly different quirk for the
>    others. This commit updates the comment to make it clear that the quirk
>    is only for the Cherry Trail SoC + TI PMIC models.
>
> 2) The comment says that it is ok to disable wakeup on all ACPI GPIO event
>    handlers, because there is only the one for the embedded-controller
>    events. This is not true, there also is a handler for the special
>    INT0002 device which is related to USB wakeups. We need to also disable
>    wakeups on that one because the device turns of the USB-keyboard built
>    into the dock when closing the lid. The XHCI controller takes a while
>    to notice this, so it only notices it when already suspended, causing
>    a spurious wakeup because of this. So disabling wakeup on all handlers
>    is the right thing to do, but not because there only is the one handler
>    for the EC events. This commit updates the comment to correctly reflect
>    this.
>
> Fixes: aa23ca3d98f7 ("gpiolib: acpi: Add honor_wakeup module-option + quirk mechanism")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Patch applied with Mika's ACK.

Yours,
Linus Walleij
