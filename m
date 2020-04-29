Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F15131BDC76
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2020 14:38:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726815AbgD2Mi2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Apr 2020 08:38:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726741AbgD2Mi1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 29 Apr 2020 08:38:27 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21A95C03C1AE
        for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2020 05:38:27 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id u15so2449793ljd.3
        for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2020 05:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yiklenLhNOV+HKXdiZuFGpxcMEuzoxvnXmW3/CZQYZs=;
        b=fMMGd7cuYi00xYIotGRhY6Dnx7VYaht0u0LQuHp4fzcCDF9cBBdPfE+f8GXRMwcza0
         cLuwR336ZmgamL7yC676FL5jlkc5Yz1B+1TS4yVNxDprMVCznLRjQdK1bX816iSRAWxd
         vCvTGXv3tDcjKsafsNJiLTH2Z/TFLyyqrthbVHJxlAAPpgxWK/RlNhJUDw9OLXdE0smj
         kKtaF64FI9ricj+z5+PMpVi/HcrBHhYWQc6Hw715u3+ZxxFmFXuhjNN83YcHp7lHpcvi
         20w3ODJEGsB2yuhAXLnYyJ0Snyklwuq81N5iNcKJMXc7Xiiwx6j9alt/6cDGQgxFy6hX
         VDvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yiklenLhNOV+HKXdiZuFGpxcMEuzoxvnXmW3/CZQYZs=;
        b=nTYV3AK3SXLXweOXFWuTv5AQu5Wxbyoc5x3pL6f+88hU91VrcHDkGC3AzEk8111PuG
         KXmsHmbSKuEwyoYryPcCkUJHh6xq0kHarUvxdJ/7jpiVCV6tY1KkxMbNjhXhFGVPZTNV
         ywvrR1kqzcVY6XaDLAXj9GrkFY4lDNwQWAd3LyL70NvvOfEGD1NiIXOwIpUUOD4S7O9n
         /+r8MdQ5Aj1qPRjar404pGDZUy7RW87t48r0q8mSTtm0Dwv7kBaGnwtKoL1Bv+Uz+D3G
         pZpRV197/K9CL8fxWRJQSzveWs0ZPZEyQ6iVjiDuPer5q0yJlwz8yP2bDPyAkLHZm38E
         6bUQ==
X-Gm-Message-State: AGi0PubXlhqtfERy5unahsePLsLvE03tFRssdYrOXv+E4QKczDXVr09l
        +RiBa08YezQBujmo8sB0xIHe1amzn++U9zj7J83UbA==
X-Google-Smtp-Source: APiQypJSjoxKbAKfAOvydqwj3C8SjC23BV+vHuypyRaJJ1bGKEYT/DUGGPAuboZMKwIe81ZCOER6hgFyOq7nxIlRwZg=
X-Received: by 2002:a05:651c:1058:: with SMTP id x24mr21640311ljm.39.1588163905575;
 Wed, 29 Apr 2020 05:38:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200419001858.105281-1-hector.bujanda@digi.com> <CAMRc=MeHun_WEApEXP59ZszGa2n+wbU9qq3wU1VO9o590rO-Pw@mail.gmail.com>
In-Reply-To: <CAMRc=MeHun_WEApEXP59ZszGa2n+wbU9qq3wU1VO9o590rO-Pw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 29 Apr 2020 14:38:13 +0200
Message-ID: <CACRpkdaeXFW5K=Npy2ubWsffc7aepEQ5kSJ2HrkrESjaTy_psQ@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: add GPIO_SET_DEBOUNCE_IOCTL
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Hector Bujanda <hector.bujanda@digi.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 29, 2020 at 2:06 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> I understand the need to set debounce time to make line events
> reliable. As I see it: there'll be a couple steps to add this.

I think there is a serious user-facing problem here though, because
not all GPIO controllers supports debounce, so the call may return
"nope" (error code).

I think that is unavoidable with things like pull-up/down or drive
strength, but for debounce I think we could do better.
drivers/input/keyboard/gpio_keys.c contains generic
debounce code using kernel timers if the GPIO driver
cannot provide debouncing, and I have thought for a long
time that it would be nice if we could do this generic, so that
we always provide debouncing if requested, even for in-kernel
consumers but most certainly for userspace consumers,
else userspace will just start to reinvent this too.

Yours,
Linus Walleij
