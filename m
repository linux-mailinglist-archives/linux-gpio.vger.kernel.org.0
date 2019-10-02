Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E374C8AA9
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2019 16:14:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727955AbfJBOOV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Oct 2019 10:14:21 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:32776 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726200AbfJBOOV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Oct 2019 10:14:21 -0400
Received: by mail-lf1-f68.google.com with SMTP id y127so12890775lfc.0
        for <linux-gpio@vger.kernel.org>; Wed, 02 Oct 2019 07:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YSiUzt3JXZb0IC+ZVBGuvSJ/+rDdVM63Z1A1szs7rdc=;
        b=ilkRM8vaZA8829y8IvPYiIFThq9Mi4w9Q0Q3zhOnNmRrAbNRkTOLv7rt5D6EU8bfey
         aP1Ge6qo4+IE/ABHWmKoaG0/I2+7DrvquFwHurdp/K4DXAv4NiuvPOUgJ1Ba9wGG2zw5
         ToC26zCHM9enkrHsXfjmBnFQmobM6hncQFXGSKP1DRwfLtRBfevpvCPsaR+oVdGy1uis
         hmeGbu95vQkmTFk56R0xrz/5+t5sMQUtuF9J20V5qDIr75WwyEqs0R8HyDQvFZlOTJdk
         DkGSTxAH1u3ce4YCTW2xmMU1xPR+u+OsnshGvHStVTxYO4zU0b8rLcHRZGlLX8EgUOsS
         rkpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YSiUzt3JXZb0IC+ZVBGuvSJ/+rDdVM63Z1A1szs7rdc=;
        b=i7eOUv4VvAk+oFRXEUL/HQ3ReWxn/sGA4ao5BJHjRqa428kIIJGnuxUyhvTy6o8zE0
         Rpv0plzTya+KTYbeB+KfjkJFHLhA1jk5hH5g5ErrMnYvgyFYHqJJJ55qAy8qw4it3L0S
         LHQRq1RKMCzyVtP6gyxUc2rgY4rgVlpPEGI9PjC2P1YXFHeeWsviI1pI3dYloESTKkH8
         /dzwTWhORqFlnvh1HVTQ9LpCRrpD6HI1eoArr3rjnLjuaPdfNxTn//xy0/3Tf6cGhlgc
         px4v6hdUQC/64Gyq7l+okl/y8EDJIAU5hDtAGdG/Mr+Lgh3nlwDTJ/7IKbCt4Fyg7YA4
         nVJg==
X-Gm-Message-State: APjAAAX5/2raB408de7wvedDHMrLvzoU/ijH3fQKVzx7K+S8+A+OCGvj
        GDpOTnN1P+P3WPrk0/nR2d1/i/q7oyByrn0RlZJUeHznZ6o=
X-Google-Smtp-Source: APXvYqw7r0YowzXU3GakJsnGLHQbh6ms2tFEx3BHQgx6K16rF6Kuk1aX3F0zSGBcT+PCdy/GwTTU1r5+FeESit4kqDI=
X-Received: by 2002:ac2:46ee:: with SMTP id q14mr2348160lfo.152.1570025659320;
 Wed, 02 Oct 2019 07:14:19 -0700 (PDT)
MIME-Version: 1.0
References: <20191001095800.28966-1-brgl@bgdev.pl>
In-Reply-To: <20191001095800.28966-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 2 Oct 2019 16:14:07 +0200
Message-ID: <CACRpkdb5=CW3mGsUMfRXdUc+f5LKj+9arcXLhy_xxZmbJixUMw@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: fixes for v5.4-rc2
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 1, 2019 at 11:58 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> this is the previous PR rebased on top of v5.4-rc1. Please pull.
>
> Bart
>
> The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:
>
>   Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-v5.4-rc2-fixes-for-linus
>
> for you to fetch changes up to e91aafcb51f3c5001ae76c3ee027beb0b8506447:

Thanks! Pulled in for fixes!

Yours,
Linus Walleij
