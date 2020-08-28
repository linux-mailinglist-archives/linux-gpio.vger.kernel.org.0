Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10D0B255A6E
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Aug 2020 14:43:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729415AbgH1MnH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Aug 2020 08:43:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729238AbgH1Mmj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Aug 2020 08:42:39 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7829CC061264
        for <linux-gpio@vger.kernel.org>; Fri, 28 Aug 2020 05:42:38 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id 185so1132141ljj.7
        for <linux-gpio@vger.kernel.org>; Fri, 28 Aug 2020 05:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/5zqwAk7r19VbbapnJvQ3irBLvFfiJZbIrHezMmTPXU=;
        b=BtJw29RQNERRIfGfc1w5ErhoaKY+Tsu7I6WxNhT3vLOsTDSFDLx89zfGMvxIuLxUJL
         b5SYvgCTVkgF/w/upA4EtTZXa7cOph2XTjLSV3VL5TQ0qYrScLNEgIjQpubBlz9GECYm
         M6zBALTIZt9kZ6IT+cTSHmofWoT5mZQnQUDLzrc99HOp3gCbSZKx1E96DC/SiolCEMzF
         x5v10M1uV7wwhPhfoFUvy2qnD5epm4TLqZQS/ckI60spjubZY7ztBP4jHmr8kABXBwwV
         g5YGR68fM0NILHEso5Ltw/K6CbviyjKc/6uXFBxaGlbtucr14wWyPdjiHhGyAqZVZaE1
         DNlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/5zqwAk7r19VbbapnJvQ3irBLvFfiJZbIrHezMmTPXU=;
        b=WJonpJJnZpwTKhG7vEB1YCsuZqme+7CyAXDbGkaktfWqlB6Tg+zJtAbEuR3Vtb+TVc
         lrlFQPFdZUeSWFJTGDIyGq5c28XMWa8QPI9DC93ZZFWbVXE/CJxLRcQAF+xumgMd+IL4
         Lt//AlljgMDwF/Fxo+m8tlvyAIRUE2ZnbGXe3zdiwNAP4aJALIJpTJ8CSdBlvXoVGE/U
         I+/hZDlRWse/vfjuxogutA7gen46nl/9nDm5JHQgdO4iYK9Bpi2wOHb348mBcaigrkzx
         EQ/LVXdxPeqciBaYWGQoEhP0KfBbc6nofQ3H42ZR7Rvf3iykPJ5fHR+A62weaQrMhYxf
         Viug==
X-Gm-Message-State: AOAM530JaDH7xEv65MBnrRHnv/qeXO8eU1m/wlDF9LpwF6FwEb6KRNwP
        523VYERDlo9JaQltbhpCUxx+ZK4rnjqt8h/2me2tMpL+LTA=
X-Google-Smtp-Source: ABdhPJxFJ+sPiCIUWaiBfJG6iVO8KI14e9lM1TexLLLZYSIPaYndoG33IsNrNvGWZQUjYZGGzvFSbia1xjrzAgHOAB4=
X-Received: by 2002:a2e:558:: with SMTP id 85mr826002ljf.293.1598618556891;
 Fri, 28 Aug 2020 05:42:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200825143348.1358679-1-thierry.reding@gmail.com>
In-Reply-To: <20200825143348.1358679-1-thierry.reding@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 28 Aug 2020 14:42:26 +0200
Message-ID: <CACRpkdajUgrcjWPHZ60OxpXmo7FFH8ytspHoFLt-FZoTymKAPw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: devicetree: Keep deferring even on timeout
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        John Stultz <john.stultz@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 25, 2020 at 4:33 PM Thierry Reding <thierry.reding@gmail.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> driver_deferred_probe_check_state() may return -ETIMEDOUT instead of
> -EPROBE_DEFER after all built-in drivers have been probed. This can
> cause issues for built-in drivers that depend on resources provided by
> loadable modules.
>
> One such case happens on Tegra where I2C controllers are used during
> early boot to set up the system PMIC, so the I2C driver needs to be a
> built-in driver. At the same time, some instances of the I2C controller
> depend on the DPAUX hardware for pinmuxing. Since the DPAUX is handled
> by the display driver, which is usually not built-in, the pin control
> states will not become available until after the root filesystem has
> been mounted and the display driver loaded from it.
>
> Fixes: bec6c0ecb243 ("pinctrl: Remove use of driver_deferred_probe_check_state_continue()")
> Suggested-by: John Stultz <john.stultz@linaro.org>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Just like with the identical patch from John I got a while back, I'd like
some nod from the device core maintainers (Greg or Raphael) that this
is how we want to do things.

Yours,
Linus Walleij
