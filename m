Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CAB25F3FB
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jul 2019 09:40:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727247AbfGDHkm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Jul 2019 03:40:42 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:46587 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726199AbfGDHki (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Jul 2019 03:40:38 -0400
Received: by mail-lj1-f194.google.com with SMTP id v24so5131870ljg.13
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jul 2019 00:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tgKcVXAAamjaQY/ifvSqvPergzyHsihVrlBqrjI0W3o=;
        b=lial0fUgVWj7cgxe1w3qVySyxQnXmgOZp+WFWikgUL6haJIFFOlYF8mNsE6azi2Jzp
         +w3/t054JPi3dvrx9tFl0GQuXo0s4Few3k0fZfYLrmRRr15Zn8T5ysmzRhUBLDVMOcTQ
         aGOLqd+wKLq89IzLQ4VPM02BNcuCSkX656kKPUfvs9cYeKako22hNVFGkMT7+HBLf1GK
         L2mtlmMKAXg9+AUbiBeE/1fVbSlRCPFF/4AhX9yL0vue7+Du9YaFiH+4YVLA2IWBnD9L
         ihCj43M2V0cCqFZX6zuz1EQuiK2q6e2t6s5H23NrFePTRmoZdVnFAoQP31H42wptE4Ak
         zdLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tgKcVXAAamjaQY/ifvSqvPergzyHsihVrlBqrjI0W3o=;
        b=qm2Fz5koO1mxOHlJZaT/YoRWSDtS2I35v55TjiBzUN1NJXEDJnQAa5w9Ta2KZ3HBZ5
         rgm0gOql0q5vNHgvSNIBkbSdqUTKpx+DdBJBHYjtx1J5FFrygj/PzNMy4f/gCemyq3a3
         w1icwbVO9fhQw7xiQoXect8ztmR7xY4xRR+37aSDMkXbOu9r6Dg+xMFzx3k7Lche93yY
         fZfqeG9odTjYRJvccUHJtjgYa3T8ARkg9bJsSvIy6jZIq8gydykLhPFiCTk7P5XscZnz
         Y2op9xuyWBGM+HYFBQitM1xr+ZvihjgM3Dd9gy/JPYJXHf4zkiRH95ZCxtyDZwp0846Y
         O15Q==
X-Gm-Message-State: APjAAAXvqKjNEcNpMcjlt/a+UEVCG8wvrERwjsZD/h+xL3dih9rSQOza
        Il6sz7Eh51gkAsFmXmTPR9UsgZ/ZiSKAnVGkfPSqug==
X-Google-Smtp-Source: APXvYqxcIK+Xcx+Q5/hTeLzrtubNqKcHX14aiqkByfIumlPYa4leZ0Qj636upmWfYdD7VVbjLHei9732Nr0Z0GmY498=
X-Received: by 2002:a2e:9048:: with SMTP id n8mr2111685ljg.37.1562226036149;
 Thu, 04 Jul 2019 00:40:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190702223248.31934-1-martin.blumenstingl@googlemail.com> <20190702223248.31934-3-martin.blumenstingl@googlemail.com>
In-Reply-To: <20190702223248.31934-3-martin.blumenstingl@googlemail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 4 Jul 2019 09:40:24 +0200
Message-ID: <CACRpkdYr2EjFWTfv5d5dLJtjnCxdvQCQdVSzt4sVwsEQu0ukAg@mail.gmail.com>
Subject: Re: [PATCH 2/4] gpio: stp-xway: improve module clock error handling
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     John Crispin <blogic@openwrt.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        dev@kresin.me,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 3, 2019 at 12:33 AM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:

> Three module clock error handling improvements:
> - use devm_clk_get() so the clock instance can be freed if
>   devm_gpiochip_add_data() fails later on
> - switch to clk_prepare_enable() so the driver is ready whenever the
>   lantiq target switches to the common clock framework
> - disable the clock again (using clk_disable_unprepare()) if
>   devm_gpiochip_add_data()
>
> All of these are virtually no-ops with the current lantiq target.
> However, these will be relevant if we switch to the common clock
> framework.
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Patch applied.

Yours,
Linus Walleij
