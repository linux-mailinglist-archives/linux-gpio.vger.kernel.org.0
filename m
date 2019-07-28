Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2AE5778244
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2019 01:10:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726171AbfG1XKv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 28 Jul 2019 19:10:51 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:41106 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726163AbfG1XKv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 28 Jul 2019 19:10:51 -0400
Received: by mail-lj1-f196.google.com with SMTP id d24so56679853ljg.8
        for <linux-gpio@vger.kernel.org>; Sun, 28 Jul 2019 16:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=inLCD3+8WT2ZIeP3j9ljz8tWvfGd7KXHJKqKulp52u8=;
        b=DzeGYhgu5mrYTF7BC/exdYhltYo20EvxLeeSJqANw/w5t76P5/bI4QdSyqdDZhqSUm
         lbL+0uwo80XKdIo0+mpJyVf3RqPYXRKjxGItKGaJWK0mP2uCdmuMw0juOg3JymNIWKSY
         7jCq19M5rRmE2gx3dwIEkhTpxc3Z+6siO6RdVbem/AvLuk9J6Rha+h4uVEyn6NZ6uuAI
         qS7MrYIXug/01A7huPqmmgM71pQ49/ldbFtPNFfkfnNVO1xMuIuIJzNzO5V8A1E/GY6Z
         mM0wRjyjmKkfMUr8UywjR0260gIm0+Kf+3jn8AVTE44W8Zp0pMtW5EU8F4drmNQKfddB
         Cxxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=inLCD3+8WT2ZIeP3j9ljz8tWvfGd7KXHJKqKulp52u8=;
        b=nYFZVOTaY9rhKHwa15Cy4GCm/cmRnsRIfjnpdZQ59IIIsbKCo+kfe/bq0AgO31XYZs
         Y4ES7VnrAnfR9PZyzb+kUb1ifaqm9pGgxCFM4XloVcE+KZrE1Mp69xEUyWwxzHX6/iRO
         aV092y8Dpz1f6LEq8Db833yIWQKjJpfwScJMMB1Yn15ntxU/xZRrm/UW1fefmEOODsxY
         3Pk5fL8tV6auJX/+R6JuwE/XJetAHZwOaGyBGV7mrKqSovlF1l+CGeZDFIZ2qAuBM1+Q
         +FOEjM+g5z5iDuZ2ZsW7Gp1nEdfohxhvHBiqYRVigfkvZxKDhBwiEkLFrqd3xGgpCB0J
         ZEpg==
X-Gm-Message-State: APjAAAWqoDnecVC5RKLSpn4pBoQFANR866OTLZ+Qv0A4E60fv3meNml/
        RfieTy3SBBlhjTyNXi/1Rl2n6PMzt1VELjC/yuk67Q==
X-Google-Smtp-Source: APXvYqzdnaN6NlzK2l6UqWrWZ8Iji17BG0xcGdQL3jp2DkCjwg3y1mK9EYub9VekCTIj2L+kpBmKPMz4zN44NFHInE8=
X-Received: by 2002:a2e:9048:: with SMTP id n8mr9255442ljg.37.1564355449182;
 Sun, 28 Jul 2019 16:10:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190710090852.9239-1-brgl@bgdev.pl> <20190710090852.9239-2-brgl@bgdev.pl>
In-Reply-To: <20190710090852.9239-2-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 29 Jul 2019 01:10:37 +0200
Message-ID: <CACRpkdZODndkJuvJaGCcyY7OONvu88aU_F1EKzkJNAW6Dxfi4g@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: em: use a helper variable for &pdev->dev
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 10, 2019 at 11:08 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Instead of always dereferencing &pdev->dev, just assign a helper local
> variable of type struct device * and use it where applicable.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
I expect I get this and other EM patches in a pull request from you.

Yours,
Linus Walleij
