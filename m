Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6143450362
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Nov 2021 12:24:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231390AbhKOL04 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Nov 2021 06:26:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231786AbhKOL0s (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Nov 2021 06:26:48 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88F99C061767
        for <linux-gpio@vger.kernel.org>; Mon, 15 Nov 2021 03:23:50 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id w1so70424097edd.10
        for <linux-gpio@vger.kernel.org>; Mon, 15 Nov 2021 03:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nTWihlS7JMTvQaBGNGJD6t4n52toGFrv4uGcY9ggcM8=;
        b=mCx2UlhlZa5VElpVAh6Ze+4eSolv61qJqaXdv62Jf6tlyBvZM2Lt/L9UexMvAqRjr0
         9QgONMSdrfGQK3YYAJEuT0N9zPwHZ6jvjNUf3NkqLKaa5G5j/i0mgnJMyq0DUn5xDDSo
         wztVBaOLMTVDZ1HEopQHvZVg6LalRMnf+lSTafPlXyyJFyuvkeeu8IbJJLrLP4LLQGob
         2kT2KFt9Hg4gO2I90AaiYjyD4nhvwigwes8jJYWYGiLZJ8W/6WA+LMN8yd31CBegr7ux
         yQhn4dxF5DojWidnFx03NXqhYbtKS5wYS/u5gnpcdqpsfS2iT2s1Sd+cvHygCfRCoBBO
         JJ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nTWihlS7JMTvQaBGNGJD6t4n52toGFrv4uGcY9ggcM8=;
        b=VHWPb6BB0kNvYhj/JOrJ0cxSOkT+gg5o9ky8R4j1za4azLseFmGFNZtPTjNG1ML8kc
         nA/KoxhwhwNlI2ykpuLT0C3cdSUBEgr+wW0hjQUliCuAYIh9JW7RLw2LXC2Bl6VXB+gl
         fx4bGHEx43sytCHRyG9acbts2WkTwmDOhjbWXBHpQ6ziSX1mOJ9O3ffRHRNKzUGElQnO
         Urbwh1jTmINkO98Ts1uWhz+kb34vA5pi2iP/j+IhSviKd2OA+2SuoH/QZvu+ehr+nWdq
         hg4xu+pYe7qqhvcbV7QFbjZwDwe82sVZrzArP4Js3RKRup9pbDJvSEV5cjLa3senbmIq
         37tQ==
X-Gm-Message-State: AOAM530Kc4VZcab3JCp/G2B/OGcu6UskNgHjKeMlNppi7doU3ndTQBrW
        YuImwYgroT4O621Kxu+Am3zjaOdZmx+YGPcfUzvmYg==
X-Google-Smtp-Source: ABdhPJwplrH/h4uJ902U6lQCybbS4z5DM0zNOAijb05Miq8byRKi+/AfAW+yQX+JrrQBAS0KPQmwRgi1fkq6f6vT5s0=
X-Received: by 2002:a17:906:5343:: with SMTP id j3mr48564278ejo.538.1636975429136;
 Mon, 15 Nov 2021 03:23:49 -0800 (PST)
MIME-Version: 1.0
References: <20211109161253.2202108-1-robh@kernel.org>
In-Reply-To: <20211109161253.2202108-1-robh@kernel.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 15 Nov 2021 12:23:38 +0100
Message-ID: <CAMRc=Mdv8-=WsizZ1W8p8+kLKh2QLfgfxSOQ0L=0rBDvO63HpQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: xlp: Remove Netlogic XLP variants
To:     Rob Herring <robh@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 9, 2021 at 5:12 PM Rob Herring <robh@kernel.org> wrote:
>
> Netlogic XLP was removed in commit 95b8a5e0111a ("MIPS: Remove NETLOGIC
> support"). With those gone, the single platform left to support is
> Cavium ThunderX2. Remove all the Netlogic variants and DT support.
>
> For simplicity, the existing kconfig name is retained.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/gpio/Kconfig    |  10 ++-
>  drivers/gpio/gpio-xlp.c | 142 +++-------------------------------------
>  2 files changed, 13 insertions(+), 139 deletions(-)
>

Applied, thanks!

Bart
