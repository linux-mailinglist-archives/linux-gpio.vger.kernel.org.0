Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74F4313C355
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2020 14:39:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726501AbgAONjt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Jan 2020 08:39:49 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:35725 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726088AbgAONjs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jan 2020 08:39:48 -0500
Received: by mail-lj1-f194.google.com with SMTP id j1so18595175lja.2
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jan 2020 05:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pnFqhhxBgQQrOJG9VMdTSVWlyDTWq02NzG7Ll7SsmRU=;
        b=swXiWY6KtW6USAXgEF0BKmbRj8LNW2I0j8lCKzuFISPOymqu0FzmXNJs5VC4vllHNJ
         5SS/9bDE/mXoEUeZVvqCUd2O3WPwH4GNxMuw+graItXIG3VM+lH03nQH81uZuOBgOBo1
         /lX4qIrezmOEb4dOV2tWHyesD68BpcYKeA5lrGEalqR2YFsjMNAtXVpDz7jYy7mdeRK1
         g4ocSnJvWJ13IUcdDr9dobxgGb1pG667VzZgrU13mTg2V+yYgxSupC3KOofzQ7RZNJhh
         4EQ2/WlLxQttVJuIoTekn5pf4p5YpPHcc89VnzzV3x6284yplbJ40lJw2MVkVKqqxI8X
         m3Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pnFqhhxBgQQrOJG9VMdTSVWlyDTWq02NzG7Ll7SsmRU=;
        b=W6EBTpjMWyPaWKEWqcxv1bhwc6g17JjKa/7YUd9tbkRF+2gv9bno7efqkohanQWXoM
         aX+aRCFbG80jaQa+gb+24dwc178p7GYg25gCK8uHag+15uXnv7/sPsAFzJz5URAIpN63
         nc3sKbgLrmLJlCn2xsf0dnJOHj/6q8Eoj1XSZBJaODRYXDZ5EyD6U0Hgf2zqBPzMOPYh
         4syUu+Bu4sJEcUONSVPytr/G0V96Y3M/Rg/s/yI36/M89zIbPwyRd3JwxkzhAGynCigM
         pokOj7i+D7UQVkfEvhXbnWaFVUkAHt1HOUCvirQOhZwnEAeqwC5zWWS9o+5sRHkegtqe
         s7WQ==
X-Gm-Message-State: APjAAAWYqsE/+a5aJWWCMTUjmc8sbysrVS6SI71K3PY9xtX4cuKzJz7+
        FGqcWCp0WKnYg6Z0WPlZ0Pcj+WtTVVzzfS/sFtLPvA==
X-Google-Smtp-Source: APXvYqz9duMnYhOhVoTHoDmR2ennOQ8ot3KTXdINAT2gaDQVsmk8rQh2KItxvjbbdVC7xLJ1Lvjbw6id0ZXwkJ2LKXI=
X-Received: by 2002:a2e:9143:: with SMTP id q3mr1765334ljg.199.1579095586705;
 Wed, 15 Jan 2020 05:39:46 -0800 (PST)
MIME-Version: 1.0
References: <20200108121117.45060-1-yuehaibing@huawei.com>
In-Reply-To: <20200108121117.45060-1-yuehaibing@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 15 Jan 2020 14:39:35 +0100
Message-ID: <CACRpkdYzKmbx55h0G=fLRMat7CBOKgLScCdvH+T=heebx4asAw@mail.gmail.com>
Subject: Re: [PATCH -next] gpiolib: remove set but not used variable 'config'
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 8, 2020 at 1:11 PM YueHaibing <yuehaibing@huawei.com> wrote:

> drivers/gpio/gpiolib.c: In function gpio_set_config:
> drivers/gpio/gpiolib.c:3053:16: warning:
>  variable config set but not used [-Wunused-but-set-variable]
>
> commit d90f36851d65 ("gpiolib: have a single place
> of calling set_config()") left behind this unused variable.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Patch applied with Bartosz' review tag.

Yours,
Linus Walleij
