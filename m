Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A027223CD6
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jul 2020 15:37:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726512AbgGQNhZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jul 2020 09:37:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726079AbgGQNhZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jul 2020 09:37:25 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE17DC061755
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2020 06:37:24 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id z24so12653910ljn.8
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2020 06:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=APP62M5KJnavAoumKi5PAm/yFARTAUHaqqfP4O6ogbw=;
        b=AJt327ZmU6sPumfnVeQR5qa8+PkRfY0SX4r8p0uWw5gmDDxHWs0wQL32a4krd/89np
         AP5UT8yP6pojwefApB9GkhD3VyOcAKZOqlUTnCXuQKaFNo318WfkgID8A6cLUu6PeYa7
         73tbI8RIjDjJkk/dcutwvXi+/N05bcNLTwNgsi+G0pUMUTqr36vgpbEXeGJmo1UlhrNj
         olOeQadzKF3A+RP5fuCD1zr1uvUToxMfBbeobPlgnzGmC7GD0qlNeWSWhBk0y1t299Jx
         LFFpu+I02T9rq2F5Uf8d6QnYmmDS0bH95ErItdidLkcYmAFL9IIdn4Cfl4VA3CnX63Rc
         CyIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=APP62M5KJnavAoumKi5PAm/yFARTAUHaqqfP4O6ogbw=;
        b=jYvlCWpSF0eCVVWJa7nbW8FtOYZXk6TcOdI0C9xzgdiE3hsVSlT3Z20D4rsuMbZCtZ
         h2SRg9Qz9XP+iDSJZSlSoi3s3bN4No0oPsdLTFsBlU6+hGB39MntgCGcQkv0zt2tCNQY
         Jj9TN8iB1A0tlZH8q5HSy6gTYsOisxmu2jXxsSVNmd8iZDY45tdrC9IR/Xcu40OOILS9
         PDrtxaTvZwCddikhSpiwWr+3IBpjcu1w/sNVU6XehO+y73+DezHGkOzNYK/IoSxGJFnx
         wD175XGAeiujG1zOGQwuNPQ2p0VD6MdeWt5oKO9M2erE3yab0nUPHxC1Z/qgaKvoIph/
         0wQA==
X-Gm-Message-State: AOAM533RSvWmfWw9AAwj/K7iOjNBZzSQp7fWRWkEyvTcnoisOMlht/uY
        FsJv81o4n4s9mw56Q4rRj4To/DWEnJ2HiqF2KhQhQQ==
X-Google-Smtp-Source: ABdhPJyDBwdNSvOponEGA/XoJ0GjdQLAWB568mug+gHjjG/nwgdM7/StDRcbqk31IOvJ/EGHfhT6dhrHW+0AbC6EDMs=
X-Received: by 2002:a2e:7a1a:: with SMTP id v26mr4306904ljc.104.1594993043263;
 Fri, 17 Jul 2020 06:37:23 -0700 (PDT)
MIME-Version: 1.0
References: <7eb11c0d-cd11-f873-c336-4ec955a7bdb3@inbox.ru>
In-Reply-To: <7eb11c0d-cd11-f873-c336-4ec955a7bdb3@inbox.ru>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 17 Jul 2020 15:37:12 +0200
Message-ID: <CACRpkda-pXF71vr5v90yipKubc14tbZW5Ryw1o7rdn4FbWwsTw@mail.gmail.com>
Subject: Re: gpiolib gpio_chrdev_release duration is about 30 ms
To:     Maxim Kochetkov <fido_max@inbox.ru>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Maxim,

On Fri, Jul 17, 2020 at 2:56 PM Maxim Kochetkov <fido_max@inbox.ru> wrote:

> I'm using libgpiod in userspace.
> I have 6 gpiochip's on my board.
> gpiod_line_find takes about 300ms to find GPIO line.
>
> gpiod_line_find calls gpiod_foreach_chip
> then gpiod_chip_iter_next
> then gpiod_chip_close then close(chip->fd)
> then we are going to kernel gpiolib gpio_chrdev_release
> then atomic_notifier_chain_unregister
> then synchronize_rcu()
>
> synchronize_rcu takes about 30 ms (6*30ms=280ms)
>
> I tried to remove synchronize_rcu from atomic_notifier_chain_unregister
> and gpiod_line_find takes about 2ms now.

Interesting! Can you provide some context? Are you just testing because
curious or do you need to meet a design objective?

Did you use ftrace or similar instrumentation to drill down and find
where time is spent?

Yours,
Linus Walleij
