Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4246336848
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Mar 2021 01:02:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229538AbhCKABj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Mar 2021 19:01:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229825AbhCKAB1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Mar 2021 19:01:27 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F57BC061760
        for <linux-gpio@vger.kernel.org>; Wed, 10 Mar 2021 16:01:26 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id u4so36701117lfs.0
        for <linux-gpio@vger.kernel.org>; Wed, 10 Mar 2021 16:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IeMuJLlNvvieU0nCoF0p261OzcOR4TpS4BUALfVQCNY=;
        b=kJNJOvaqf6DPbPBxzU9Ajx7SFKSyoKyAYC+Fbk35khhT7WK1YasoIjCfB67rcGcPR4
         2NgaI5oZfZmKwvvemvZ8p91tcZOQKMFE+/HEBI4AsrJI7psGfOJlFOwzLHrzzK7Q6Z+P
         134Z9oLIN32BDXi5Nx0CpllyOMX+MZGthLGHqp5u78TYN9MOgP9Alfid8M/CUZSJjuox
         GXevOlZIijEwgFZne+7Evm8PyjK4qlkIzUl+qwDB/dtQv+JpljgsLbiFvYTioVfEYKiN
         blE4rIBxoHr0pOG5mqehx0zBMd24Ja3N+nhe0L1Htf5sdGgVJ+mCo+RwskCI6ZSuZtVw
         0LYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IeMuJLlNvvieU0nCoF0p261OzcOR4TpS4BUALfVQCNY=;
        b=DCKpIsKW+vzPfM70csbtwCGChHkfvAS+HN8m7dciV8+r3oKyEgYNTkIui7C2hnzwii
         uBc3WpdOGsmUKaQqO1VbW9Y+cdQmG478FK7aKNj9lSSXWq+WM6AafNc4OECMNzTcYlIc
         yBBcVkM6OYcQNKCd9LMDZYEJCvPI3aN6jKf9WXOhOdncex0WX1uul1jt6aI2NxTbl8++
         cNrO7nKTXXXK75Rrp/MM8Ji7gT/qpDW+7QkauGvaz4wMmdrZ3CjATmY42Nj9TpVtvn3R
         j/HSii7zKYZ04kcT5tTC88wyhxcKZptpXeERKSya6mHpv9Wyf4OtR7NxsUiFuCRH6eUz
         SBOg==
X-Gm-Message-State: AOAM5303egFHo2kxOdYaPMhL1sQpUzoDTuTK5fqtEcKzzfMC0OZImy51
        /ciNCT/CWiHhhVBYv6JrbQFcFmxT0rcILSgdrT/rZA==
X-Google-Smtp-Source: ABdhPJz0s3K8XD8e9qmL+DuSQtu5mE1rFISHURIsYyg1KDlueFtfiI8jH4iW67GeAbcmuuFK0b1J2cbC7jHLqG3+pxw=
X-Received: by 2002:a05:6512:10d1:: with SMTP id k17mr544816lfg.649.1615420884885;
 Wed, 10 Mar 2021 16:01:24 -0800 (PST)
MIME-Version: 1.0
References: <cfbe01f791c2dd42a596cbda57e15599969b57aa.1615364211.git.michal.simek@xilinx.com>
In-Reply-To: <cfbe01f791c2dd42a596cbda57e15599969b57aa.1615364211.git.michal.simek@xilinx.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 11 Mar 2021 01:01:14 +0100
Message-ID: <CACRpkdZMW1NQxvzQv3uDDoC4uxGpDUFocfP5i+Ya+n5RyQp69A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: core: Handling pinmux and pinconf separately
To:     Michal Simek <michal.simek@xilinx.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Michal Simek <monstr@monstr.eu>, git <git@xilinx.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 10, 2021 at 9:16 AM Michal Simek <michal.simek@xilinx.com> wrote:

> Right now the handling order depends on how entries are coming which is
> corresponding with order in DT. We have reached the case with DT overlays
> where conf and mux descriptions are exchanged which ends up in sequence
> that firmware has been asked to perform configuration before requesting the
> pin.
> The patch is enforcing the order that pin is requested all the time first
> followed by pin configuration. This change will ensure that firmware gets
> requests in the right order.
>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>

This looks right to me so I simply applied the patch so it  gets some
testing in linux-next.

If there are problems on some platform(s) we will get to know.

Yours,
Linus Walleij
