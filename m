Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CFDE267B61
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Sep 2020 18:21:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725865AbgILQVa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 12 Sep 2020 12:21:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725850AbgILQV1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 12 Sep 2020 12:21:27 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25785C061757
        for <linux-gpio@vger.kernel.org>; Sat, 12 Sep 2020 09:21:26 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id b19so15001014lji.11
        for <linux-gpio@vger.kernel.org>; Sat, 12 Sep 2020 09:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ceHdCye1rZFHPMpbvMuaDDh6m4ibQ8TQMedh+7r0zLc=;
        b=cMNxE8uHLMChfvm6U+9bV/2Bt8cgvwUbPW/dlCKijtoThNFRT+S2xo1wY+iOsOgCPQ
         gIpdZ+mAByOKUHDqQr14vTpJnk5sABXB9TY3dnMxMhhIF4J7MqEm+J8hIKREKxIQrLyG
         n+1dnD6vojkzFXxwwdQGUQeMl9EsddwfAKCEf3LaCWTh8NZb7wKx94OqjMpoFVZXdgOq
         8Jea4cbR09kgy8cHWw3o0n9iEo9rI24Vv9AUVbfQXMhCc/f76D+J99mzqGJHhs+YHe33
         zcsd0OLexAi6hMKaNRWRwQIha3wZ30n9gbu9MTdfnQQ9DtuqjSzMvxevYxmqFwfsBDEW
         n8GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ceHdCye1rZFHPMpbvMuaDDh6m4ibQ8TQMedh+7r0zLc=;
        b=fbYrmmwdv0XFStZb32BjZqpZSSXGMVNLzYUHxl5EBK/Q2YEKJcgBzOlGmdPpnKxAw9
         pUEsP9ax0Jdqpwi4VDaNB6adxO+dsoQsTeZmtLqnTcZltzTkLMlOWhj7sgLP0FNgHQL1
         rjC8kpj0HnQa4Q7P6KIY6xKLQlvprl0jpztq7jZrMjKs4obN7gce+HZWjtYLgYCdNQvs
         +oqdZq+uZglKCXrG5eUMWVRw8ypwSJm5fw9eOEJLzQVAc7LB0U/H4ZbO23yL1rF778G1
         Ubb5NSllp9B5zNLtpfCV+lJQXbx46D7DKjnF1yLPSCdkjNyB9oKvkqe6F44xxmlx6zl+
         04nQ==
X-Gm-Message-State: AOAM532sY19kIBCV86XE3Bc1xc7EppWDQfzxtqspWsiBFJ0lw6DIxO6W
        MJV3XBMJ9jKzFghFMw9CVSUFyJ7Dzrz62lqAx+dmdw==
X-Google-Smtp-Source: ABdhPJzUTM5Qu8W8cqR01KjJKFKfwYrGLOE/Wv7VoxMeLogxvSeKSjyy0erd6NfY7efIJHri68EyWhDv5RBpVPNuoxk=
X-Received: by 2002:a2e:810e:: with SMTP id d14mr2795301ljg.100.1599927685055;
 Sat, 12 Sep 2020 09:21:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200825143348.1358679-1-thierry.reding@gmail.com>
In-Reply-To: <20200825143348.1358679-1-thierry.reding@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 12 Sep 2020 18:21:14 +0200
Message-ID: <CACRpkdZCmB-v58XTH6oCLWp96=uUH3XooB3A1sY-XvrubXBm4g@mail.gmail.com>
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

I applied this patch (rather than Johns') since John agreed this
is a better solution.

I got Greg's ACK on Johns patch but not this one, but anyways
it shows he's convenient with the concept so here we go.

Yours,
Linus Walleij
