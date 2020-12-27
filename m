Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBBFB2E3163
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Dec 2020 14:56:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726161AbgL0N4B (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 27 Dec 2020 08:56:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726103AbgL0N4B (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Dec 2020 08:56:01 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91F38C061794
        for <linux-gpio@vger.kernel.org>; Sun, 27 Dec 2020 05:55:20 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id b26so18555983lff.9
        for <linux-gpio@vger.kernel.org>; Sun, 27 Dec 2020 05:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=918i2pdopdCMVC5pk4OUZ9bz8vh2xgM0cN+m7GAjLwg=;
        b=wZt2o677HvoB/MDk7+FXEx0vqke1woDsutZLBcumYDnfATL/VCr/6v0ZPWOFp81Wxh
         ZeWCyHxq/Ix5Y3AdGRM853KUwZ5hloUhYbT6kGjgtZWO/gLnsna0ekOKjycnpAId+uYW
         n9Gbv10hWakGqS7LWSSLfiYXEHj34cnW9tLXvkk//JiQ0caZFYexIxItK8f6+dHmFvRv
         rDk/uUC2SsiT8JswX1v5c/pEYTjMafod+AocxS7S0IbpqMm4XPIsWSNxZ14dGvznOyAI
         zOUjl5mEjCX2MHITqNSlvfWSat//HZ/HVPHp8pUwouWPi+Um50IJQ5zQn2jwsp+56kDA
         C2yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=918i2pdopdCMVC5pk4OUZ9bz8vh2xgM0cN+m7GAjLwg=;
        b=iyPY+b7q1W/AMDk3inJV/Ru2t0LoRuwBdMDDiKSMd/X4nDjLZ1z5rX7gYxFqFa2PgV
         X2jTyvm9xBnZ2+AfI4Q9Ya5T1GMYumlfYwDtLb5vQQi431BVwPgqjjZRxozOoT0yZfJ5
         FA5/yJGpYTjquymdH9/BdyjEAUudFqm+T9hFqBApqN5jgaekqufkp122FRhKrKhtfkPZ
         N9FR1sktsKwQVYUeETY4uk+ohviR+kgOmsBRZrh+AslpfZ0wrB+tvoMYJcAnXK0xf9v8
         ZmljSsdf2dDPtSPXkUHSxFwOBevET/2NyxhiEv0jGRquEn8uWGVF3t8T4R/hkmXT7TOq
         q5jA==
X-Gm-Message-State: AOAM531xPUrehxQVvL2KTveFwdYzW/x7ko5xK3yFyIupl1oKot2An5kZ
        YXgHTnvvMom4FtZK+7zCf/fFreCM8TXjAesWTEcLZw==
X-Google-Smtp-Source: ABdhPJyqQAPFHc8D9e03hMHG0s9I7xO6Yli9KUFwvAuXu/YdB9i/BdJFi/k4FWMAbPnwt8Up9mU7A6a0FCJ4DiJHdRA=
X-Received: by 2002:a19:8bc6:: with SMTP id n189mr16745414lfd.291.1609077319112;
 Sun, 27 Dec 2020 05:55:19 -0800 (PST)
MIME-Version: 1.0
References: <20201224112203.7174-1-nikita.shubin@maquefel.me>
In-Reply-To: <20201224112203.7174-1-nikita.shubin@maquefel.me>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 27 Dec 2020 14:55:08 +0100
Message-ID: <CACRpkdZ=QBGZ9G97+2xPRk4PTTSHGHL64bTLZGbz5kFsg-NqWg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] gpio: ep93xx: convert to multi irqchips
To:     Nikita Shubin <nikita.shubin@maquefel.me>,
        Hartley Sweeten <hsweeten@visionengravers.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Paging Hartley who I think uses this chip.

On Thu, Dec 24, 2020 at 12:22 PM Nikita Shubin
<nikita.shubin@maquefel.me> wrote:

> I was lucky enough to became an owner of some splendid piece's of
> antiques called ts7250 based on the top of Cirrus Logic EP9302.
>
> I don't know what fate expects this hardware (it's not EOL it's just Not
> recommended for new designs) but i wanted to share fixes in ep93xx gpio area.
>
> It seems ep93xx is deadly broken at current state usage of AB gpiochips
> interrupts leads to deadlocks coused by irq_unmask/irq_mask recursions.
>
> Port F is not working at all:

Yeah when I converted this gpio driver I did not have access to a hardware
which made use of port F :(

I used the SIM.One board but they all died on me, then I acquired another
EP93xx board that I just didn't have time to test.

The long term plan is to convert these boards to use device tree and
multiplatform. Interested in the job? ;)

Thanks for fixing up the GPIO chip, let's get the patches in shape and
merge as fixes. Bartosz is handling the fixes right now, I'll try to review too!

Yours,
Linus Walleij
