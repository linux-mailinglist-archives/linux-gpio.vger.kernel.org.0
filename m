Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BFCB44B3BD
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Nov 2021 21:07:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244157AbhKIUKn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Nov 2021 15:10:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241827AbhKIUKm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Nov 2021 15:10:42 -0500
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88C0DC061764
        for <linux-gpio@vger.kernel.org>; Tue,  9 Nov 2021 12:07:56 -0800 (PST)
Received: by mail-ot1-x333.google.com with SMTP id w6-20020a9d77c6000000b0055e804fa524so440748otl.3
        for <linux-gpio@vger.kernel.org>; Tue, 09 Nov 2021 12:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jay4bvn1CHVbECfZlQ8rRUGomUTSbkN+CtKVdn6fLuw=;
        b=UjmZ16XdSJmMTk1B1Q+5+jygX0AQnxVwiZ8nHytzix8JWJdKkHA1DfCyxpMIn+LvEH
         8oizt36qlO9lPjxYa3z2hdYSazQstIsTha8sWrMq1ruzMdEPbGL3u5PuxcO4nDQuLaUq
         pyPzmwEP8ypf51mZzOYgHlTUGmWAcNvmbj4GcHgW1Le9W2SMDQpIoZkZurFoTaWpkMxJ
         KQz5SeJ7AjGA+PDdbqbJvFDXxQh0CLR4VQuTMWpxCcQ3rpPXPUIZctwdhI5NK9/3E07a
         B+zKCrYOIohAOeNfqN7g2oTnYVPNaqsaqUv23gFcCRUKzyRNzVLCPBqc2W48WHrcvU7O
         WOGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jay4bvn1CHVbECfZlQ8rRUGomUTSbkN+CtKVdn6fLuw=;
        b=eIh+r8VfjQ+b8q8Ukd4nqv3hAGS3yZareGySWkQY0ffETK2yTMyF6eN2jfJAyeChXc
         mX9BISY6Rwgsg8Iruz+XUquf9Nxt8FvF+4jqmt9kWvFCaCDQBv5CpUn/Um1HyUFuqysm
         QwXJDoGWb9Hx697Ov14zGBt1+kbiSi8i0mQl2Yy5clcT3tfgfOcz5Gxe0mRYPnl4Wlva
         ARGm2P1fH1YjYIc9ZjddcSA9y6VWmqOvBuD3yejw1YpbdItSgwzXMAAEIEromulPXWy0
         W1KcT4fEeUcug85BXtoJoGRHtHNpKziHZKaNjQYPlYLhhFn0Xyq7xU2YHrpc2z0xQIE3
         T94g==
X-Gm-Message-State: AOAM530B1/P3RPdg6FXR+DtTPJF8g5SHFgneg+kV787d1dkVp6T6Ns7X
        MwfM3O8lMt8pAC8AqfLQ468A3khLEAK2tL851F3H2g==
X-Google-Smtp-Source: ABdhPJxNipPZr7+vmyXXCN9McHMGmga6b23qum9RT+SVZQNWx6aLiAtMH8PkORDzg0FIgBHPXVE6XphIIe1qjYrStiM=
X-Received: by 2002:a9d:6348:: with SMTP id y8mr8389289otk.179.1636488475884;
 Tue, 09 Nov 2021 12:07:55 -0800 (PST)
MIME-Version: 1.0
References: <20211105130338.241100-1-arnd@kernel.org> <20211105130338.241100-3-arnd@kernel.org>
In-Reply-To: <20211105130338.241100-3-arnd@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 9 Nov 2021 21:07:44 +0100
Message-ID: <CACRpkdYdrm_YnwvxjqLBrJfOF07_nDyu1g0xggRMJ9_x2S+LJA@mail.gmail.com>
Subject: Re: [RFC 3/3] gpiolib: coldfire: remove custom asm/gpio.h
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-m68k@lists.linux-m68k.org, geert@linux-m68k.org,
        gerg@linux-m68k.org, linux@armlinux.org.uk,
        linux-arm-kernel@lists.infradead.org, linux-sh@vger.kernel.org,
        dalias@libc.org, ysato@users.sourceforge.jp,
        Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 5, 2021 at 2:05 PM Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> Now that coldfire is the only user of a custom asm/gpio.h, it seems
> better to remove this as well, and have the same interface everywhere.
>
> For the gpio_get_value()/gpio_set_value()/gpio_to_irq(), gpio_cansleep()
> functions, the custom version is only a micro-optimization to inline the
> function for constant GPIO numbers. However, in the coldfire defconfigs,
> I was unable to find a single instance where this micro-optimization
> was even used, so to my best knowledge removing this has no downsides.
>
> The custom gpio_request_one() function is even less useful, as it is
> guarded by an #ifdef that is never true.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
