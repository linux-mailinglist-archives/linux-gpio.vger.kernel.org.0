Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED9D73B5312
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Jun 2021 13:41:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229825AbhF0LoT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 27 Jun 2021 07:44:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229739AbhF0LoS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Jun 2021 07:44:18 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD544C061766
        for <linux-gpio@vger.kernel.org>; Sun, 27 Jun 2021 04:41:54 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id f30so26223415lfj.1
        for <linux-gpio@vger.kernel.org>; Sun, 27 Jun 2021 04:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7nCcZa51W677BE+Hel0O/2f8nMv5K3UCI0TqVVzGVFE=;
        b=tCpyfKk6mjwf5hKPeYWKLVMLc3+tab8zSmjQyuDhkNWsOLgj+9g24nsoJW7QJhLS10
         BiL3k1UPE9CrxlKVByXTovHluLJn5rNHH3AWiWQBDRR9uHIGAotgaN1VwvK96gbSU1yx
         b3Ev0DDKaY3HXR2KxsgNPpj7aoHjnmq0B04i7yq9ogCbqgJ0nYx2ATwuaztFuZhiSJdP
         6WMuvUOMh128wnXcNZ27iO9Cwozg/WAB8+XEkgl06PdhkzT8FtiYrd0mQPd6hWsTAvc7
         0wrkNGt4fdFTRnAkWOpQ0tHza14D7SyHpNEIaBLQQWX05CCVrn5eVDC9NZcbBejtDUVD
         E2Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7nCcZa51W677BE+Hel0O/2f8nMv5K3UCI0TqVVzGVFE=;
        b=iCEdRwitvWsDE8MLj+6c/PWLkwUtYPp9FkxuaBlTDCwT7hZ/sRKknBgXIf+8FEUUy5
         bkvzMkOdV4T/9y5gbK6DNRK+7/H6GMlKOzL1z8WCf3gTsYy7mC6XN826/lSc1B8UV4tx
         xCiC8G1kx1QSa2lEEuIIwl8hzQxkL8zGHvsWu5G9fYgVAuI7E7VdnBtDu0s9r1idd4Tv
         oEQD3YRz8LZ4AmDdq5q2USIdzYYmMy6XyM5MrGLkKx3uilvPt56//qeT4/VrqE4WwxMe
         XhYHWaJIYVr2KacitBlqgpvgGHza8g4Sn0HBoXLDqkbdINimff7C7+5Sq8kFg+hj4VNI
         XIPg==
X-Gm-Message-State: AOAM5337yEFtf6zfNfoecMWDOiGTagJe1fEDVxtEkO40/2WjpV0jwLWg
        K0PLXelkHpedLztjRNugRiiayJZg9jFh3j2Vyzcgcg==
X-Google-Smtp-Source: ABdhPJwC0em6P0FMbyE3aTSrQuokVtkD949HKWZUgn5a0hTZgddqfrKVTAN5GsS2H/A3hpIV/tZzJiFHzTuMA8lCZkc=
X-Received: by 2002:a05:6512:1508:: with SMTP id bq8mr15370726lfb.529.1624794113085;
 Sun, 27 Jun 2021 04:41:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210625235532.19575-1-dipenp@nvidia.com> <20210625235532.19575-7-dipenp@nvidia.com>
In-Reply-To: <20210625235532.19575-7-dipenp@nvidia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 27 Jun 2021 13:41:42 +0200
Message-ID: <CACRpkdb79ONmgBGh=YE9kXMa8_8_zCyyiPkg531NDCsX8jGx5Q@mail.gmail.com>
Subject: Re: [RFC 06/11] gpiolib: Add HTE support
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Kent Gibson <warthog618@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jun 26, 2021 at 1:48 AM Dipen Patel <dipenp@nvidia.com> wrote:

> Some GPIO chip can provide hardware timestamp support on its GPIO lines
> , in order to support that additional functions needs to be added which
> can talk to both GPIO chip and HTE (hardware timestamping engine)
> subsystem. This patch introduces functions which gpio consumer can use
> to request hardware assisted timestamping. Below is the list of the APIs
> that are added in gpiolib subsystem.
>
> - gpiod_hw_timestamp_control - to enable/disable HTE on specified GPIO
> line. This API will return HTE specific descriptor for the specified
> GPIO line during the enable call, it will be stored as pointer in the
> gpio_desc structure as hw_ts_data.
> - gpiod_is_hw_timestamp_enabled - to query if HTE is enabled on
> specified GPIO line.
> - gpiod_get_hw_timestamp - to retrieve hardware timestamps.
>
> Signed-off-by: Dipen Patel <dipenp@nvidia.com>

This looks good to me.

The chip driver can look up and provide a timestamp provider for a
certain line, which is proper since the GPIO hardware will be tightly
coupled with the timestamp hardware so we need to ask the hardware
about this directly and delegate it to the GPIO driver.

Yours,
Linus Walleij
