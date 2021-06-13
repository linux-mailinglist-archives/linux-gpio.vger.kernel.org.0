Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D228F3A5AF5
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jun 2021 01:25:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232197AbhFMX14 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Jun 2021 19:27:56 -0400
Received: from mail-lf1-f50.google.com ([209.85.167.50]:45572 "EHLO
        mail-lf1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232081AbhFMX1y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Jun 2021 19:27:54 -0400
Received: by mail-lf1-f50.google.com with SMTP id a1so17901187lfr.12
        for <linux-gpio@vger.kernel.org>; Sun, 13 Jun 2021 16:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8LX8djcFDE6EP1q+j6q4heiZPR2laaaC2KAlvm+CZBg=;
        b=v1bFFGIm/IK1Xi4cWQgSUjcKoHdhUjhQe9clg9fEl419oO7GqysAUVwoaJSCzreAOl
         TK8XllNUO98Lf701epVkUeEXZMNkWutYxIMjtU58bXrpH/CzObUUxJKL9ERCWAlMIlvv
         gogHqN1sW92dSOMpkj3mxIQq+S9Z8WHA+5idFiDN2a64Vv69NqkPSCj9Oom4UVQhKexC
         CDgtP7plJfM/2r2epPrSBYfiX5v2J7AIPJW8NEztnicV/HvRl7Mkku8pCIw29oZGe5+O
         8mEKc1BQkmQ3P3Qskrl+IishScsxCDLPRdQmObkHh+mQL133mOUsxbAe5qwvViH8Jcqr
         NfGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8LX8djcFDE6EP1q+j6q4heiZPR2laaaC2KAlvm+CZBg=;
        b=T+bTre0upENzROQ+YcIjyNuHwivDrF4Uj3wqSpkD21sk3SKc1il07Gu+CdZjRllLqt
         4X/Iv/s8oxn4UI2O+eL2dl5dZNUnY7G9m/K3qONhE1kQcJeatHABYlP1I4nbVVt4e6mb
         7jPVSnmf2bAqXVho/2Bq7TPFwWsu3Rb7gTmzjCp1sE4FxuOkREP/GV07nUTP48PrGsef
         tshpHEzI4w0xs0fDBH4GiF1KZ3LWRZ6FNOp7n1J9iC0T2AcRhhAZeUz/IaGXId6LVJ3f
         szB9PvPoQUMfwKc1cM/W912cwam4YxdWDxTACV1XJ2JcPfzlnCdRebnDQkF5WhIJNtUR
         /94g==
X-Gm-Message-State: AOAM531MOTs2h11VbDb37HiudAk2pCy4AJbUyQcgcY7t4uJohkRiZa2y
        /0YguKQdmzP2WbXZV0XtWfwwvL9Ygsi5ZHIhMKf1EKXwD6A=
X-Google-Smtp-Source: ABdhPJxAmJqouBLRHK9vapOoB8AgqyYhqhda225jRWZDJ5nVLAgKab2TUi3hUlyA+oBy0EhiOJ1ZVkrhCEpwcXvpWOg=
X-Received: by 2002:a05:6512:20c9:: with SMTP id u9mr9891191lfr.291.1623626675791;
 Sun, 13 Jun 2021 16:24:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210613120608.1527394-1-code@reto-schneider.ch>
 <CAHp75Vc5LRRLc-1A5W4BVQ3QQx-+4Y5CUjG3ksosVdPEecEyqA@mail.gmail.com> <db862b9d-2003-08f4-6856-26fb4870caff@reto-schneider.ch>
In-Reply-To: <db862b9d-2003-08f4-6856-26fb4870caff@reto-schneider.ch>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 14 Jun 2021 01:24:24 +0200
Message-ID: <CACRpkdbSv0h6hB_yR+_ZC3vxSUOkaa94EzCArSaSC=nvc5AT3g@mail.gmail.com>
Subject: Re: [PATCH v1] gpio: mt7621: Assign base field in gpio_chip
To:     Reto Schneider <code@reto-schneider.ch>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>, Stefan Roese <sr@denx.de>,
        Reto Schneider <reto.schneider@husqvarnagroup.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jun 13, 2021 at 5:51 PM Reto Schneider <code@reto-schneider.ch> wrote:

> I did some digging and indeed, it turned out that I used the
> pre-mainline GPIO driver from OpenWRT even on Kernel 4.19 (for which the
> current driver already got mainlined).

Hm isn't OpenWrt switched to the mainline driver?

Another thing we should do is to add libgpiod to the OpenWrt
base distribution so as to encourage people to use the character
device ABI.

Yours,
Linus Walleij
