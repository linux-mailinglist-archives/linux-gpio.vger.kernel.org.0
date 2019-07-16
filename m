Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FDD56A4AD
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jul 2019 11:13:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730520AbfGPJNX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jul 2019 05:13:23 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:33028 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727105AbfGPJNX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jul 2019 05:13:23 -0400
Received: by mail-lj1-f194.google.com with SMTP id h10so19181833ljg.0
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jul 2019 02:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vvHUi+57W2YWTqekWsoB3KUAwr4UJo9RUNniBWtK2Qg=;
        b=VY43nll9GG3bf65iBp8vf5P2+oVOAR+EO+9Sjpl6l4N8dlK3TGPlAgqWbw6MRQBXla
         y0I8hM/1WM1UbvHNXLe0GOYKucc7hu6wWw4arw/GWEb7pvNJPh4UJ54utQVs3UwJ2F98
         GYhYYsd06isE9rn+o4RZaPlfCH5xVau9gr+q3pbPK4NoFa1oLK44nX5+RHKkrkddBDLj
         /gGvnvam02J9Mub0lJOuOHoZY1vcSqEvlC+yJxdMaYn4VGc8gSa31chjgSntvCcoemKL
         tlrUhZ4SRROpCo8XhoAaiPcZls12YlEv/B6V8G/WlWnC4YvceXyDE3t1AVp7FqP9aX3H
         cxmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vvHUi+57W2YWTqekWsoB3KUAwr4UJo9RUNniBWtK2Qg=;
        b=kueed5Bnu6y4yGiG9BsHcmkK+1losSjG++qYgmPVX4ybqkuwIsZATMlUPCeLHxykoE
         hHrx13tHRpRe6KVwkQpbbMpB3kb5g83Gq9xRwldHLYG1ERim5lrg4lUANYeqlLYQWd2C
         /Mu8tSScTs2Br4D1I9jrh+xtlYX1Fz7MNyytvjRmv6Pe/o7MjBQpqmEd4WR1NmfrhrcC
         hmAQs0mBEGpiTDN88kGR1nmspAjoqQbI/6CtOfKJ1u2kyZOF98LaBglGpGUdDgsn1q15
         pNFx1yjevinpJOe5RdWLnX3R6x0btgxDe0zmSVYPNsH7E+M0Flodh3f1numn+KjnEV6S
         wEqQ==
X-Gm-Message-State: APjAAAXdiGMz8ybNkZY4GYvG9FzBsVH6nwoLWaIOds0NvLznQIGU78/J
        iDHS19MTI7vqNO8g82PYuf+L80Woc4scXMUYfXVY/w==
X-Google-Smtp-Source: APXvYqz0DMkhDXP4NBNtg8Q0w6Qn/kdHpppZpqYcJT44w3ZoCbT62nQ7uBnI6hjng76eTEWe8leSSafW9dJ1Cfmr6nI=
X-Received: by 2002:a2e:8195:: with SMTP id e21mr16149926ljg.62.1563268401282;
 Tue, 16 Jul 2019 02:13:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190715095903.18307-1-brgl@bgdev.pl>
In-Reply-To: <20190715095903.18307-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 16 Jul 2019 11:13:09 +0200
Message-ID: <CACRpkdb54JkcF5GxxyLT4cOikiuoiFxYQs9deKyRcukPfzrCdw@mail.gmail.com>
Subject: Re: [GIT PULL] gpio fixes for v5.3-rc1
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 15, 2019 at 11:59 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> please pull the following fixes applied to my tree during this merge window.
>
> The following changes since commit fec88ab0af9706b2201e5daf377c5031c62d11f7:
>
>   Merge tag 'for-linus-hmm' of git://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma (2019-07-14 19:42:11 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-v5.3-rc1-fixes-for-linus
>
> for you to fetch changes up to 19ec11a2233d24a7811836fa735203aaccf95a23:
>
>   gpio: em: remove the gpiochip before removing the irq domain (2019-07-15 11:52:42 +0200)

Pulled into my "fixes" branch, excellent, thanks!

Linus Walleij
