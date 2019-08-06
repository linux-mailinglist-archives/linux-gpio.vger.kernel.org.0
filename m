Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 039EA83265
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Aug 2019 15:11:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728582AbfHFNLl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Aug 2019 09:11:41 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:45554 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726877AbfHFNLl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Aug 2019 09:11:41 -0400
Received: by mail-lf1-f66.google.com with SMTP id u10so22310514lfm.12
        for <linux-gpio@vger.kernel.org>; Tue, 06 Aug 2019 06:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H0vagFQ3739JrCrLPS29VGkKplJ4eh9USrRRP/YZnBk=;
        b=HlpTB3AfoXubHmbOTwFI+0OzaGP1Nl1VLy/JFzh9Njx8wGbwMJFMbtKjx9/NUZsNaK
         K/cLL+pL8bOt2yI5TdoHessmfhPymfIpULOlpiELbAQV2MYtjGGiAjnUE6YRw4FlPO64
         9tKJjn34YL8ZdybMMzgV6I4LdPJTgRfmD+p/tD1aysDuEBmMjul2DGFEuaKOPTXGSW0n
         iq7NUCiBTtqdbjRhhsTQ562D8Qk8cNr2L2+/gsV6e8pkg5zv70zLhylKA0pk3b1h9/EY
         ghVnyeP6tnoQCfvqcyRXCanw6EEjd5sa6qQlf4xbpSiWcwpUhdYlUkzkU6VLdqhWOU1G
         a7dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H0vagFQ3739JrCrLPS29VGkKplJ4eh9USrRRP/YZnBk=;
        b=byzC3e1UX5NhHYKh1T0CBETxdMtIhVESH1fOj8zszu0MLxAPC0LNph0MnHGxzna1et
         M7HU6c0H7y1nn0xPR1mEQU9ub4dnopTfQs9hdovvFtBAz5AdS/YHaQ7RdlXiNqD52qmi
         WctY1a4wqc+3e6gDBLxGHs4PsbDnASbO76SAAZQw/33SleNVeEfhkv9p1qzC8Vf14qC0
         ZSgiClIBuc0YSW87mZ8iuke8nxFPRmfF7HiDRMrVKP93G1kvlccmed+0zCa4ZCcE9D6h
         DajeNvuY/KaJIlL3nGDP1YQ24bOrm0sog++3bDH8fMc5IBkOSPLn7o1Vw5Dix6B4czIp
         ziiw==
X-Gm-Message-State: APjAAAXvNqj89d0BlQEbkVGInBI3GQkTiTlFztbSPN8CEWinLhPo7zZG
        moiWRNByMkr33osMvzfxn+Wsvh9ZRG52rS++Nx45OA==
X-Google-Smtp-Source: APXvYqzf6iu18R7AJxDTK2zthx5LMRLAJUY6nOomob8YHK0YdoAPZzSyuo4h4xrvBPHV8bSSRkMHbrL2d8wZnkPasUw=
X-Received: by 2002:ac2:5c42:: with SMTP id s2mr2536999lfp.61.1565097098965;
 Tue, 06 Aug 2019 06:11:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190803133436.15016-1-rfried.dev@gmail.com> <CACRpkdYEdQdk62bWJ2=i2Mbvpz3kwL=9bnMoxksFsTgAHRh68w@mail.gmail.com>
In-Reply-To: <CACRpkdYEdQdk62bWJ2=i2Mbvpz3kwL=9bnMoxksFsTgAHRh68w@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 6 Aug 2019 15:11:27 +0200
Message-ID: <CACRpkdaTmxQn2Z=vD6nyqk-iXCFrnCG1xpkXwO3-+sazOhGBvw@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: Take MUX usage into account
To:     Ramon Fried <rfried.dev@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Stefan Wahren <stefan.wahren@i2se.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 6, 2019 at 3:04 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Sat, Aug 3, 2019 at 3:34 PM Ramon Fried <rfried.dev@gmail.com> wrote:
>
> > From: Stefan Wahren <stefan.wahren@i2se.com>
> >
> > The user space like gpioinfo only see the GPIO usage but not the
> > MUX usage (e.g. I2C or SPI usage) of a pin. As a user we want to know which
> > pin is free/safe to use. So take the MUX usage of strict pinmux controllers
> > into account to get a more realistic view for ioctl GPIO_GET_LINEINFO_IOCTL.
> >
> > Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> > Tested-By: Ramon Fried <rfried.dev@gmail.com>
> > Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
> > ---
> > Sending Stefan's RFC as patch, as I tested it and it seems to work,
> > additionally, an accompanying fix was made by me to gpiolibd to fix a
> > display error of the actual result:
> > https://patchwork.ozlabs.org/patch/1139923/
>
> This is mostly fine, some style nits so I fixed it up when
> applying.

Ooops no. It needs a deeper rework in accordance to my comments
last time it was posted. Please read this reply to Stefan's patch
and address the comments:

https://lore.kernel.org/linux-gpio/CACRpkdb5DjAMRYkT+b0U6HVk7E6ccLT79-LB=QGQWWtE17aPUg@mail.gmail.com/

Yours,
Linus Walleij
